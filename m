Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F5A170870
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 20:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3856E107;
	Wed, 26 Feb 2020 19:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FC26E107
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 19:06:43 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id 11so598035qkd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 11:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=M9niB/YnWE/mLPULIH87VulO14ku7TY288Cxvxcfeys=;
 b=m1sFXJWAMrJMsYaGgcCtAGpf8EaIm5PCgIxV1iKtHvR5+dpc9QTf8u/9ABYitkG6pd
 TwsZyKmjIRrTUsColw9pGQXQCoQNDIZd7WwGlTUjMliBWyK8lL2om+9ZK07C/wnLwmWN
 lC71l0SyiMyslAqAQKKdiKOsCt31Xu2kIU0rS5fyLp9vR/4+zsVwGo+NwzMHdAIwg/xT
 xeHZCSAseH+k80jLpc4q5H2bp3nD3XG9uZ1PjOxgzpdlAt2XFiyyZB0MAVn69B6+ryZN
 SDAK2u3KTjT4U7Z6s+hqWOs8q7xdQggpcqJ92L85lVRcT4qJVy1pqf7BWZ5Bi6Q+nWr9
 ly4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=M9niB/YnWE/mLPULIH87VulO14ku7TY288Cxvxcfeys=;
 b=KSWEZu+slKnwDrI0Zo/t36c30q1C/dPghCpVuYpo8/r5xgC7/JrqEck+9TDOj4ZATk
 KdhnrUuDKybWMwKDRZT+YQcwrzI7knxDK1ClLsaPySzEzlO0dMLCZ5hp+2eHVNnehYUv
 SOJNR3AnP03/PtzhrdYzhkwC6XIbBY0EKermEsdUIo+UzuVI/hhY3D4mjuFlUfRX52r8
 smpGB+BwDiVSDUEBlP394/UnaByGd/NhJKMcjU6IvEswTMwbQR2fyTF38vJitkiWw/gv
 S1gZiRd8ISNCbi3QQUrPTkq8DQ+Cqpieo2CYzJ6dhma67ZAgBujqMzbjStd1QU4+32Ny
 8YWA==
X-Gm-Message-State: APjAAAVM/iLjfjDj8CyjTSoa+I9E5j9BBW0bnTJYL9sjubHVbLV/fBDk
 ijaK864o7H9yOQwjs2iKoR6rpNxbSPN0P9O3JzY=
X-Google-Smtp-Source: APXvYqyjurfsyKDoTMJ4WSbU70QdA9TtasCgybTEtfeAuvAhr0Qw4NI8q5lbdJVqkzh7xKqVEaAqdPQ+oRW7x7VyHlI=
X-Received: by 2002:ae9:f012:: with SMTP id l18mr712442qkg.22.1582744002146;
 Wed, 26 Feb 2020 11:06:42 -0800 (PST)
MIME-Version: 1.0
References: <20200226081011.1347245-1-anarsoul@gmail.com>
 <20200226081011.1347245-2-anarsoul@gmail.com>
In-Reply-To: <20200226081011.1347245-2-anarsoul@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Wed, 26 Feb 2020 11:06:34 -0800
Message-ID: <CA+E=qVdUV5wBcyFpwPZvi4=8bPgVBZiRB0XrEE=SPJT+cTgZ9g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] drm/bridge: anx6345: Fix getting anx6345 regulators
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime@cerno.tech>,
 Chen-Yu Tsai <wens@csie.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@siol.net>, Torsten Duwe <duwe@suse.de>,
 Icenowy Zheng <icenowy@aosc.io>, 
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>, 
 Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, Samuel Holland <samuel@sholland.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 devicetree <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 arm-linux <linux-arm-kernel@lists.infradead.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 12:10 AM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> From: Samuel Holland <samuel@sholland.org>

This patch can be dropped since equivalent was merged:

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6726ca1a2d531f5a6efc1f785b15606ce837c4dc

> We don't need to pass '-supply' suffix to devm_regulator_get()
>
> Fixes: 6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> index 56f55c53abfd..0d8d083b0207 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -712,14 +712,14 @@ static int anx6345_i2c_probe(struct i2c_client *client,
>                 DRM_DEBUG("No panel found\n");
>
>         /* 1.2V digital core power regulator  */
> -       anx6345->dvdd12 = devm_regulator_get(dev, "dvdd12-supply");
> +       anx6345->dvdd12 = devm_regulator_get(dev, "dvdd12");
>         if (IS_ERR(anx6345->dvdd12)) {
>                 DRM_ERROR("dvdd12-supply not found\n");
>                 return PTR_ERR(anx6345->dvdd12);
>         }
>
>         /* 2.5V digital core power regulator  */
> -       anx6345->dvdd25 = devm_regulator_get(dev, "dvdd25-supply");
> +       anx6345->dvdd25 = devm_regulator_get(dev, "dvdd25");
>         if (IS_ERR(anx6345->dvdd25)) {
>                 DRM_ERROR("dvdd25-supply not found\n");
>                 return PTR_ERR(anx6345->dvdd25);
> --
> 2.25.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
