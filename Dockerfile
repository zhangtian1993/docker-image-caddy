FROM caddy:2.10.2-builder AS builder

RUN xcaddy build --with github.com/caddy-dns/tencentcloud

FROM caddy:2.10.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

RUN apk add --no-cache tzdata

ENV TZ=Asia/Shanghai
