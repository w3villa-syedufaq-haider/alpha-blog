class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :username, presence: true, length: {minimum: 3, maximum: 25 }, uniqueness: {case_sensitive: false}
    VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)\z/i
    validates :email, presence: true, length: {maximum: 100}, uniqueness: {case_sensitive: false}, format: { with: VALID_EMAIL_REGEX }
    has_many :articles, dependent: :destroy
    has_secure_password
end