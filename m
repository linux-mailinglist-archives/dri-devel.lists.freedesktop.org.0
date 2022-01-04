Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6CA48435A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 15:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC3310E561;
	Tue,  4 Jan 2022 14:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D40E10E561
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 14:29:11 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso3315109pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 06:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WvukAqqIMpExigFVa+1wXXFL04/zNpt+dsk6xQ5zeLE=;
 b=pCa1FV0Tz/uvA2Z6W33ptJzic6KvrDtq39+8MrnZVLQcrULnLLYl6TcLNKMiDwArK1
 f8UtS25nf5Kv4T4DC7d1jpPVjOOPH/4YD7Yb6v+TO5gQFCkgh84W6F5Xo1JHC5ugdDuc
 opNdN0JdNj69t4kl6o0lf1kL7mIwwYrLTOC3N3cBir/wuTGNo+vgnV1xVWQBqkDxVyGh
 14Gjj+zYWfz0w5aew3zRPUKwM1erIqNbuXabdArWawnhcrOgkZsi6OQUYjwNf9qN6p2R
 kJpzG3wFw45qyUwK7cycRiRTDAb7s6FkdibziD/+A/s6qFLYQ0JW1hfcxKKD34blRQxW
 KqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WvukAqqIMpExigFVa+1wXXFL04/zNpt+dsk6xQ5zeLE=;
 b=v6+QNFtS0cR3UlvYfTh4unOM0xZvuRdkmlLqZZPFXAE9d+sjuWA7iV9/pwmZU641/e
 NJJh4XrhuBeS1cYnY9Etr6sW65vAiLbLSM42KjN/dXj6KaSF36KTkCR/UoCDXbc4IEHQ
 6Tcu4Urfluqws+zN7iWGW3ZY8yojYrdf62J64EJN63mUYaqkCm0P57Msf7iPpeGmHvB+
 yEtwMj7ir49GsQNZGmkbA4u3BpPtZzWDP2SSu1oaSF6YGAL64cuoAjJoZGP3xbWI9qVQ
 H86Dxjs8894Nqb7BVjeGwGFmT8tGxiJVfS869qR1/ATJXOIdUyvrOULkHXjqOOnQHein
 e1qQ==
X-Gm-Message-State: AOAM533fU8HFsQkKhmUTYRJDbNRlGr1NZT44P8wWX5/QWknZSGIQa+xx
 Zh7P9KMcegmGCO3LhO4hxpV1OPpu1YY6qyKl4rf6wA==
X-Google-Smtp-Source: ABdhPJz/LplF3gfbp7D6wtf71ae2gJxJJVBqMdnj1fk+ayjLSUbdaDRYvvB+Xm+DybrPHlsSDc0XjkRgtuT1wLyB7hQ=
X-Received: by 2002:a17:903:110c:b0:149:8018:e9d4 with SMTP id
 n12-20020a170903110c00b001498018e9d4mr36711837plh.117.1641306550920; Tue, 04
 Jan 2022 06:29:10 -0800 (PST)
MIME-Version: 1.0
References: <20211222083350.18514-1-linmq006@gmail.com>
In-Reply-To: <20211222083350.18514-1-linmq006@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 15:29:00 +0100
Message-ID: <CAG3jFysrEDzYVbpwDVK2OJYMsEKRqpcBexK__m08A6vevm=ubw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Fix null vs IS_ERR() checking in
 anx7625_register_i2c_dummy_clients
To: Miaoqian Lin <linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Miaoqian,

Thanks for submitting this fix.

On Wed, 22 Dec 2021 at 09:33, Miaoqian Lin <linmq006@gmail.com> wrote:
>
> Since i2c_new_client_device() function return error pointers.
> The i2c_new_dummy_device() function does not return NULL, It returns error
> pointers too. Using IS_ERR() to check the return value to fix this.
>
> Fixes: 8bdfc5dae4e3("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 32 ++++++++++++++++-------
>  1 file changed, 23 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 1a871f6b6822..eb72aa6aedd6 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1637,40 +1637,54 @@ static const struct drm_bridge_funcs anx7625_bridge_funcs = {
>  static int anx7625_register_i2c_dummy_clients(struct anx7625_data *ctx,
>                                               struct i2c_client *client)
>  {
> +       int err = 0;
> +
>         ctx->i2c.tx_p0_client = i2c_new_dummy_device(client->adapter,
>                                                      TX_P0_ADDR >> 1);
> -       if (!ctx->i2c.tx_p0_client)
> -               return -ENOMEM;
> +       if (IS_ERR(ctx->i2c.tx_p0_client))
> +               return PTR_ERR(ctx->i2c.tx_p0_client);
>
>         ctx->i2c.tx_p1_client = i2c_new_dummy_device(client->adapter,
>                                                      TX_P1_ADDR >> 1);
> -       if (!ctx->i2c.tx_p1_client)
> +       if (IS_ERR(ctx->i2c.tx_p1_client)) {
> +               err = PTR_ERR(ctx->i2c.tx_p1_client);
>                 goto free_tx_p0;
> +       }
>
>         ctx->i2c.tx_p2_client = i2c_new_dummy_device(client->adapter,
>                                                      TX_P2_ADDR >> 1);
> -       if (!ctx->i2c.tx_p2_client)
> +       if (IS_ERR(ctx->i2c.tx_p2_client)) {
> +               err = PTR_ERR(ctx->i2c.tx_p2_client);
>                 goto free_tx_p1;
> +       }
>
>         ctx->i2c.rx_p0_client = i2c_new_dummy_device(client->adapter,
>                                                      RX_P0_ADDR >> 1);
> -       if (!ctx->i2c.rx_p0_client)
> +       if (IS_ERR(ctx->i2c.rx_p0_client)) {
> +               err = PTR_ERR(ctx->i2c.rx_p0_client);
>                 goto free_tx_p2;
> +       }
>
>         ctx->i2c.rx_p1_client = i2c_new_dummy_device(client->adapter,
>                                                      RX_P1_ADDR >> 1);
> -       if (!ctx->i2c.rx_p1_client)
> +       if (IS_ERR(ctx->i2c.rx_p1_client)) {
> +               err = PTR_ERR(ctx->i2c.rx_p1_client);
>                 goto free_rx_p0;
> +       }
>
>         ctx->i2c.rx_p2_client = i2c_new_dummy_device(client->adapter,
>                                                      RX_P2_ADDR >> 1);
> -       if (!ctx->i2c.rx_p2_client)
> +       if (IS_ERR(ctx->i2c.rx_p2_client)) {
> +               err = PTR_ERR(ctx->i2c.rx_p2_client);
>                 goto free_rx_p1;
> +       }
>
>         ctx->i2c.tcpc_client = i2c_new_dummy_device(client->adapter,
>                                                     TCPC_INTERFACE_ADDR >> 1);
> -       if (!ctx->i2c.tcpc_client)
> +       if (IS_ERR(ctx->i2c.tcpc_client)) {
> +               err = PTR_ERR(ctx->i2c.tcpc_client);
>                 goto free_rx_p2;
> +       }
>
>         return 0;
>
> @@ -1687,7 +1701,7 @@ static int anx7625_register_i2c_dummy_clients(struct anx7625_data *ctx,
>  free_tx_p0:
>         i2c_unregister_device(ctx->i2c.tx_p0_client);
>
> -       return -ENOMEM;
> +       return err;
>  }
>
>  static void anx7625_unregister_i2c_dummy_clients(struct anx7625_data *ctx)
> --
> 2.17.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
