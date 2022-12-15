Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C4C64DA1A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 12:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E9610E52F;
	Thu, 15 Dec 2022 11:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC8A10E52D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 11:14:30 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-14455716674so20509297fac.7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 03:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T5fr4gxcVjc8CL9ZfRWUTh2EMQZ1tDH3lBxxvI+OSGE=;
 b=QwvuDGM8ZyygeBDcwhmIEH9zfT446KZK9OhIUxOEpvRB3EHL/GxDQJZcPxL/mejlkP
 QvbMftVSqo9vqKT3m4OxfIqtY/hG59lB+tiopaQ330pLo+xTIffq4n6V5xXYPJDwIoXo
 4B/DdwZPZG0c6PkzQAXI4m9qUCb6kREVIov2cKAnBqArqkyoaPb1kuIGO8kY6qYQmfBJ
 eQg2p+6o6DQ8v0ubrSeEdwV+ZV6QlsEOzENfesJPrqMT/QDhtQ3hI4DG8cJ6GmEeLKUU
 Q9fJADNoGBRW8NwpuOCUJeHt55JV8rpMW1t+rpW6hRJcNGvkuGbx0oIrf88x5A2Z/ClA
 kjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T5fr4gxcVjc8CL9ZfRWUTh2EMQZ1tDH3lBxxvI+OSGE=;
 b=n37V9pMdk+abk2q9eDwYVAgaLUsWvfv3JlZFdpPyI/t+AEC2z1yzX3YSPtZbs0K4Gp
 SeRSSXwRDG02XjTg7bJ+o8K7EAE8PDtWsYsd302xRROjeNG8sWcb9nR6KJ9dBfrD/htP
 nAMstWiHj2VdnVapEweBfOA/WV6uVogH0pd5+Oplagh6pkxMuBbsaxOerXKxBfeMU0A8
 gMp28Q/jQmvIbyYj+WiWWxBVihH/Mxivsgt5ILSAKOjVGCmspoGy6S3Sa07LkKLOBpfy
 RoTIIkEYOQlWLBSX+T/F/rrgPiH3p46XoW/JzZPBttnWnqcDod8ASwqMEYjAc8h/37mX
 43kg==
X-Gm-Message-State: AFqh2ko7GjeMKdYEpjLGncyvPPFN+E2ZG5pwkPOVVktmrF4wJFUARpIT
 vxRJnuJJ12uzZg8hLkRXYsudEwJ8YCd9R4+SUEMwzg==
X-Google-Smtp-Source: AA0mqf6quCz8KDvBxxZEwcDqLtkYPh9KhjhUgQFkL5EDWWeQGWdZbtOOmQW7301huPxm4rjA8jIyc2peFeFI57VlQyE=
X-Received: by 2002:a05:6870:9e4c:b0:13c:33d0:22e2 with SMTP id
 pt12-20020a0568709e4c00b0013c33d022e2mr591942oab.14.1671102870205; Thu, 15
 Dec 2022 03:14:30 -0800 (PST)
MIME-Version: 1.0
References: <20221214125821.12489-1-paul@crapouillou.net>
 <20221214125821.12489-6-paul@crapouillou.net>
In-Reply-To: <20221214125821.12489-6-paul@crapouillou.net>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 15 Dec 2022 12:14:19 +0100
Message-ID: <CAG3jFyu8tjBRNANsOKfpOXJCNVP9FFjT9Q6n4KHBkDVZM5KKTw@mail.gmail.com>
Subject: Re: [PATCH 05/10] drm: bridge: it66121: Fix wait for DDC ready
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Phong LE <ple@baylibre.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Dec 2022 at 13:59, Paul Cercueil <paul@crapouillou.net> wrote:
>
> The function it66121_wait_ddc_ready() would previously read the status
> register until "true", which means it never actually polled anything and
> would just read the register once.
>
> Now, it will properly wait until the DDC hardware is ready or until it
> reported an error.
>
> The 'busy' variable was also renamed to 'error' since these bits are set
> on error and not when the DDC hardware is busy.
>
> Since the DDC ready function is now working properly, the msleep(20) can
> be removed.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 0a4fdfd7af44..bfb9c87a7019 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -440,15 +440,17 @@ static int it66121_configure_afe(struct it66121_ctx *ctx,
>  static inline int it66121_wait_ddc_ready(struct it66121_ctx *ctx)
>  {
>         int ret, val;
> -       u32 busy = IT66121_DDC_STATUS_NOACK | IT66121_DDC_STATUS_WAIT_BUS |
> -                  IT66121_DDC_STATUS_ARBI_LOSE;
> +       u32 error = IT66121_DDC_STATUS_NOACK | IT66121_DDC_STATUS_WAIT_BUS |
> +                   IT66121_DDC_STATUS_ARBI_LOSE;
> +       u32 done = IT66121_DDC_STATUS_TX_DONE;
>
> -       ret = regmap_read_poll_timeout(ctx->regmap, IT66121_DDC_STATUS_REG, val, true,
> -                                      IT66121_EDID_SLEEP_US, IT66121_EDID_TIMEOUT_US);
> +       ret = regmap_read_poll_timeout(ctx->regmap, IT66121_DDC_STATUS_REG, val,
> +                                      val & (error | done), IT66121_EDID_SLEEP_US,
> +                                      IT66121_EDID_TIMEOUT_US);
>         if (ret)
>                 return ret;
>
> -       if (val & busy)
> +       if (val & error)
>                 return -EAGAIN;
>
>         return 0;
> @@ -582,9 +584,6 @@ static int it66121_get_edid_block(void *context, u8 *buf,
>                 offset += cnt;
>                 remain -= cnt;
>
> -               /* Per programming manual, sleep here before emptying the FIFO */
> -               msleep(20);
> -
>                 ret = it66121_wait_ddc_ready(ctx);
>                 if (ret)
>                         return ret;
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
