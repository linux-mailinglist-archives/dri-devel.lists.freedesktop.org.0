Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0C6488CF0
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 23:58:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D841123A3;
	Sun,  9 Jan 2022 22:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4AE1123A3
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jan 2022 22:58:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 030D9E2C;
 Sun,  9 Jan 2022 23:58:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1641769107;
 bh=6UtBX64fInlzIOWD+Awy1R39whEsyOPyjRhMcW218zI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cX6TgJyEbMlYV6JzHVBXZw5zAPIyhjMJyRsRGYc3w8yFfKN+XzxNPrJH27I2PPOao
 JE9lAATo+NCzxseZSeoUgdagU9TG25ZBRB6gHt5JGVfMmtqU2mTMPOA2qzB5Ar+Gtg
 UH+/5JxaDw4zpuFcxNI1zisMJUiRkIm7wwc+VGZk=
Date: Mon, 10 Jan 2022 00:58:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7533: make array clock_div_by_lanes
 static const
Message-ID: <Ydtoib+OCyaPhrOH@pendragon.ideasonboard.com>
References: <20220109204105.51878-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220109204105.51878-1-colin.i.king@gmail.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Colin,

Thank you for the patch.

On Sun, Jan 09, 2022 at 08:41:05PM +0000, Colin Ian King wrote:
> Don't populate the read-only array clock_div_by_lanes on the stack but
> instead it static const. Also makes the object code a little smaller.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7533.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index eb7579dec40a..ef6270806d1d 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -29,7 +29,7 @@ static void adv7511_dsi_config_timing_gen(struct adv7511 *adv)
>  	struct mipi_dsi_device *dsi = adv->dsi;
>  	struct drm_display_mode *mode = &adv->curr_mode;
>  	unsigned int hsw, hfp, hbp, vsw, vfp, vbp;
> -	u8 clock_div_by_lanes[] = { 6, 4, 3 };	/* 2, 3, 4 lanes */
> +	static const u8 clock_div_by_lanes[] = { 6, 4, 3 };	/* 2, 3, 4 lanes */

It's not mandatory, but I have a tendency to declare static const
variable first before all mutable variables.

>  
>  	hsw = mode->hsync_end - mode->hsync_start;
>  	hfp = mode->hsync_start - mode->hdisplay;

I wonder if

	/* set pixel clock divider mode */
	regmap_write(adv->regmap_cec, 0x16, (12 / dsi->lanes) << 3);

would be even better, or if it would be too much black magic. Either
way,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
