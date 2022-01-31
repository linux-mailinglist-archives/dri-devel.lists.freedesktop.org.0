Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B5D4A3C11
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 01:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189AB113D32;
	Mon, 31 Jan 2022 00:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BF2113D2C
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 00:03:44 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nEKAS-0003bh-DW; Mon, 31 Jan 2022 01:03:36 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH 2/4] drm/panel: feiyang-fy07024di26a30d: make reset gpio
 optional
Date: Mon, 31 Jan 2022 01:03:35 +0100
Message-ID: <4380260.tF47cCTlra@diego>
In-Reply-To: <20220107051335.3812535-3-pgwipeout@gmail.com>
References: <20220107051335.3812535-1-pgwipeout@gmail.com>
 <20220107051335.3812535-3-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: dri-devel@lists.freedesktop.org, Peter Geis <pgwipeout@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Peter,

Am Freitag, 7. Januar 2022, 06:13:33 CET schrieb Peter Geis:
> Some implementations do not use the reset signal, instead tying it to dvdd.
> Make the reset gpio optional to permit this.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> index 581661b506f8..1c88d752b14e 100644
> --- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> +++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> @@ -65,7 +65,8 @@ static int feiyang_prepare(struct drm_panel *panel)
>  	/* T3 (dvdd rise + avdd start + avdd rise) T3 >= 20ms */
>  	msleep(20);
>  
> -	gpiod_set_value(ctx->reset, 0);
> +	if (ctx->reset)
> +		gpiod_set_value(ctx->reset, 0);

gpio_set_value does 
	VALIDATE_DESC_VOID(desc);

which checks for "desc" (ctx->reset in this case) to be valid and especially
not null and simply returns when this is the case.

So from what I see, we don't need all the added conditionals here and below
and would just need the switch to devm_gpiod_get_optional alone.

Heiko

>  
>  	/*
>  	 * T5 + T6 (avdd rise + video & logic signal rise)
> @@ -73,7 +74,8 @@ static int feiyang_prepare(struct drm_panel *panel)
>  	 */
>  	msleep(20);
>  
> -	gpiod_set_value(ctx->reset, 1);
> +	if (ctx->reset)
> +		gpiod_set_value(ctx->reset, 1);
>  
>  	/* T12 (video & logic signal rise + backlight rise) T12 >= 200ms */
>  	msleep(200);
> @@ -126,7 +128,8 @@ static int feiyang_unprepare(struct drm_panel *panel)
>  	/* T13 (backlight fall + video & logic signal fall) T13 >= 200ms */
>  	msleep(200);
>  
> -	gpiod_set_value(ctx->reset, 0);
> +	if (ctx->reset)
> +		gpiod_set_value(ctx->reset, 0);
>  
>  	regulator_disable(ctx->avdd);
>  
> @@ -211,7 +214,7 @@ static int feiyang_dsi_probe(struct mipi_dsi_device *dsi)
>  		return PTR_ERR(ctx->avdd);
>  	}
>  
> -	ctx->reset = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
> +	ctx->reset = devm_gpiod_get_optional(&dsi->dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(ctx->reset)) {
>  		dev_err(&dsi->dev, "Couldn't get our reset GPIO\n");
>  		return PTR_ERR(ctx->reset);
> 




