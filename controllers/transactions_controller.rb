require("sinatra")
require("sinatra/contrib/all" )
require_relative("../models/transaction")
require_relative("../models/merchant")
require_relative("../models/tag")
require("pry-byebug")

get "/transactions" do
  @transactions = Transaction.all()
  @total = 0
  for transaction in @transactions
    @total += transaction.amount.to_i
  end
  erb (:"transactions/index")
end

get "/transactions/new" do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb(:"transactions/new")
end

post "/transactions/new" do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb(:"transactions/create")
end