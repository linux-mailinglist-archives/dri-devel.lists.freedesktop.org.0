Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AAC5BC9C8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 12:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D7F10E5FF;
	Mon, 19 Sep 2022 10:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F01D10E5FF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 10:48:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 901AF9BA;
 Mon, 19 Sep 2022 12:48:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1663584480;
 bh=xH0dFiynDBJvh38igkGQg8mcP/tEn+0QLkv2GwKrsOQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GupHLLKhCmbowLKu/2rLAgH7lrPdvGzpo35NxtGV9CdLZPskAShPnBT+xorPQQlyt
 Szd0tRsLRRn6/P1/QlzxwhOCBeS5bVAHkIDvpnM4zDdiO/OdyKXsNPkjNiI3kg40pG
 e04YRB1vTZt4eRVIeZza44+kUH+Q4xd4SRDc+rqE=
Date: Mon, 19 Sep 2022 13:47:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v2 2/2] Revert "drm/bridge: chrontel-ch7033: Add byteswap
 order setting"
Message-ID: <YyhI0/aG97cCB8DB@pendragon.ideasonboard.com>
References: <20220919102009.150503-1-robert.foss@linaro.org>
 <20220919102009.150503-3-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220919102009.150503-3-robert.foss@linaro.org>
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
Cc: devicetree@vger.kernel.org, andrzej.hajda@intel.com, jonas@kwiboo.se,
 airlied@linux.ie, narmstrong@baylibre.com,
 Chris Morgan <macromorgan@hotmail.com>, dianders@chromium.org,
 jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thank you for the patch.

On Mon, Sep 19, 2022 at 12:20:09PM +0200, Robert Foss wrote:
> Revert this patch since it depends on devicetree functionality that
> previously has been reverted in the below commit.
> 
> commit e798ba3374a1 ("Revert "dt-bindings: Add byteswap order to chrontel ch7033"")
> 
> This reverts commit ce9564cfc9aea65e68eb343c599317633bc2321a.
> 
> Fixes: 8c9c40ec8344 ("Revert "drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP"")

I'm not sure this Fixes tag is meaningful here. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/gpu/drm/bridge/chrontel-ch7033.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> index c5719908ce2d..ba060277c3fd 100644
> --- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
> +++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> @@ -68,7 +68,6 @@ enum {
>  	BYTE_SWAP_GBR	= 3,
>  	BYTE_SWAP_BRG	= 4,
>  	BYTE_SWAP_BGR	= 5,
> -	BYTE_SWAP_MAX	= 6,
>  };
>  
>  /* Page 0, Register 0x19 */
> @@ -356,8 +355,6 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
>  	int hsynclen = mode->hsync_end - mode->hsync_start;
>  	int vbporch = mode->vsync_start - mode->vdisplay;
>  	int vsynclen = mode->vsync_end - mode->vsync_start;
> -	u8 byte_swap;
> -	int ret;
>  
>  	/*
>  	 * Page 4
> @@ -401,16 +398,8 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
>  	regmap_write(priv->regmap, 0x15, vbporch);
>  	regmap_write(priv->regmap, 0x16, vsynclen);
>  
> -	/* Input color swap. Byte order is optional and will default to
> -	 * BYTE_SWAP_BGR to preserve backwards compatibility with existing
> -	 * driver.
> -	 */
> -	ret = of_property_read_u8(priv->bridge.of_node, "chrontel,byteswap",
> -				  &byte_swap);
> -	if (!ret && byte_swap < BYTE_SWAP_MAX)
> -		regmap_update_bits(priv->regmap, 0x18, SWAP, byte_swap);
> -	else
> -		regmap_update_bits(priv->regmap, 0x18, SWAP, BYTE_SWAP_BGR);
> +	/* Input color swap. */
> +	regmap_update_bits(priv->regmap, 0x18, SWAP, BYTE_SWAP_BGR);
>  
>  	/* Input clock and sync polarity. */
>  	regmap_update_bits(priv->regmap, 0x19, 0x1, mode->clock >> 16);

-- 
Regards,

Laurent Pinchart
