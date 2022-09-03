Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2485ABB95
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 02:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF6B10E941;
	Sat,  3 Sep 2022 00:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17ED10E972
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Sep 2022 00:14:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58E946DD;
 Sat,  3 Sep 2022 02:14:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1662164082;
 bh=yw8Xn9EUhF7fvpckcshCzrIt/G3gDbianF6IJIGwebw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WR6gMYBT44If+e6UVg/jWqhuoHZ0UQNlw8nBcmT/uXpART+WM5AD3ygIvuP+meA+t
 mZwm1M3Eo7xVjp5+2by7NbxvQjbQoGFvk7WOnDKcm7n1ULxyGJYBc5ujTOICpBHsNT
 wNdC8GWxNEBuF4Ngi15pJg9rsZAfDFpE+fLo96A0=
Date: Sat, 3 Sep 2022 03:14:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH V2 2/2] drm/bridge: chrontel-ch7033: Add byteswap order
 setting
Message-ID: <YxKcZSQ8awIefBQX@pendragon.ideasonboard.com>
References: <20220902153906.31000-1-macroalpha82@gmail.com>
 <20220902153906.31000-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220902153906.31000-3-macroalpha82@gmail.com>
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, narmstrong@baylibre.com,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 lkundrak@v3.sk, andrzej.hajda@intel.com, robh+dt@kernel.org,
 jernej.skrabec@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

Thank you for the patch.

On Fri, Sep 02, 2022 at 10:39:06AM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add the option to set the byteswap order in the devicetree. For the
> official HDMI DIP for the NTC CHIP the byteswap order needs to be
> RGB, however the driver sets it as BGR. With this patch the driver
> will remain at BGR unless manually specified via devicetree.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/gpu/drm/bridge/chrontel-ch7033.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> index ba060277c3fd..c5719908ce2d 100644
> --- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
> +++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> @@ -68,6 +68,7 @@ enum {
>  	BYTE_SWAP_GBR	= 3,
>  	BYTE_SWAP_BRG	= 4,
>  	BYTE_SWAP_BGR	= 5,
> +	BYTE_SWAP_MAX	= 6,
>  };
>  
>  /* Page 0, Register 0x19 */
> @@ -355,6 +356,8 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
>  	int hsynclen = mode->hsync_end - mode->hsync_start;
>  	int vbporch = mode->vsync_start - mode->vdisplay;
>  	int vsynclen = mode->vsync_end - mode->vsync_start;
> +	u8 byte_swap;
> +	int ret;
>  
>  	/*
>  	 * Page 4
> @@ -398,8 +401,16 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
>  	regmap_write(priv->regmap, 0x15, vbporch);
>  	regmap_write(priv->regmap, 0x16, vsynclen);
>  
> -	/* Input color swap. */
> -	regmap_update_bits(priv->regmap, 0x18, SWAP, BYTE_SWAP_BGR);
> +	/* Input color swap. Byte order is optional and will default to
> +	 * BYTE_SWAP_BGR to preserve backwards compatibility with existing
> +	 * driver.
> +	 */
> +	ret = of_property_read_u8(priv->bridge.of_node, "chrontel,byteswap",
> +				  &byte_swap);

That's quite inefficient, please parse the device tree at probe time,
and cache the value.

> +	if (!ret && byte_swap < BYTE_SWAP_MAX)
> +		regmap_update_bits(priv->regmap, 0x18, SWAP, byte_swap);
> +	else
> +		regmap_update_bits(priv->regmap, 0x18, SWAP, BYTE_SWAP_BGR);
>  
>  	/* Input clock and sync polarity. */
>  	regmap_update_bits(priv->regmap, 0x19, 0x1, mode->clock >> 16);

-- 
Regards,

Laurent Pinchart
