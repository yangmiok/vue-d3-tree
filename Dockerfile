FROM golang


RUN go get -u github.com/go-sql-driver/mysql
RUN go get github.com/go-redis/redis
RUN go get github.com/astaxie/beego
RUN go get github.com/beego/bee
RUN go get -u github.com/jinzhu/gorm
RUN go get -u gopkg.in/src-d/go-git.v4
RUN go get -u github.com/zxfonline/bases
RUN apt-get update && apt-get install -y vim-gtk


COPY . /go/src/
RUN chmod -R 777 /go/src/appcloud
WORKDIR /go/src/appcloud
RUN go build .
CMD ["./appcloud"]
