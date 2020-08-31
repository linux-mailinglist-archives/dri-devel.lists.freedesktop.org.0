Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8062582F2
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 22:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D978F6E526;
	Mon, 31 Aug 2020 20:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70536E526
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 20:44:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBFBC277;
 Mon, 31 Aug 2020 22:43:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1598906639;
 bh=GWc1kc2ZYMRzT4RklTX/9TamGTAXwPTp8ETTg6O8suA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OhB1coHrSP/iW/x30PtlAPrlM5c0tj8EdwS5afCTsmXePE0nLEQ8cuBmfnewcJRPq
 NCn8Cw+vH8QuW0vmE+cH29aC5aT51ly/JqlYzr6YuXx9J95YZZrfMY+NYaVaLyN5v2
 BA9iZ9lLrt1VPlIMprAdpgVyQn8kTNOfltTG7fW4=
Date: Mon, 31 Aug 2020 23:43:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 3/4] drm/sun4i: tcon: Support the LVDS Dual-Link on
 the A20
Message-ID: <20200831204337.GW16155@pendragon.ideasonboard.com>
References: <cover.7029eefe5c5350920f91d4cd4cbc061466752f3c.1596101672.git-series.maxime@cerno.tech>
 <100f5fe3391366e9bbc76ebec1edbf8c0aeb715a.1596101672.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <100f5fe3391366e9bbc76ebec1edbf8c0aeb715a.1596101672.git-series.maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thank you for the patch.

On Thu, Jul 30, 2020 at 11:35:03AM +0200, Maxime Ripard wrote:
> The A20 can use its second TCON as the secondary LVDS link in a dual-link
> setup, with the TCON0 being the main link. Extend a bit the parsing code to
> leverage the DRM dual-link code, register only the LVDS output on the
> primary TCON, and add the needed bits to setup the TCON properly.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 36 +++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/sun4i/sun4i_tcon.h |  4 +++-
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index d03ad75f9900..ed2abf6eb18b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -487,6 +487,9 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
>  	else
>  		reg |= SUN4I_TCON0_LVDS_IF_DATA_POL_NORMAL;
>  
> +	if (tcon->lvds_dual_link)
> +		reg |= SUN4I_TCON0_LVDS_IF_DUAL_LINK;
> +
>  	if (sun4i_tcon_get_pixel_depth(encoder) == 24)
>  		reg |= SUN4I_TCON0_LVDS_IF_BITWIDTH_24BITS;
>  	else
> @@ -896,6 +899,16 @@ static int sun4i_tcon_register_panel(struct drm_device *drm,
>  		return sun4i_rgb_init(drm, tcon);
>  
>  	/*
> +	 * Only the TCON0 will be relevant for the LVDS output, so if
> +	 * our ID is something else, let's prevent our TCON from
> +	 * registering its own LVDS output
> +	 */
> +	if (tcon->id) {
> +		dev_info(dev, "Secondary TCON, disabling panel output");

This may worry the user unnecessarily. I'd make it a debug message, or
drop it completely, and like reword it a bit as pointed out by Chen-Yu.

> +		return 0;
> +	}
> +
> +	/*
>  	 * This can only be made optional since we've had DT
>  	 * nodes without the LVDS reset properties.
>  	 *
> @@ -941,6 +954,28 @@ static int sun4i_tcon_register_panel(struct drm_device *drm,
>  		return -ENODEV;
>  	}
>  
> +	/*
> +	 * If we don't have a second TCON, we will never be able to do
> +	 * dual-link LVDS, so we don't have much more to do.
> +	 */
> +	companion = of_parse_phandle(dev->of_node, "allwinner,lvds-companion", 0);

Should there be a patch to add this property to the DT bindings ?

> +	if (!companion)
> +		return 0;
> +
> +	/*
> +	 * Let's do a sanity check on the dual-link setup to make sure
> +	 * everything is properly described.
> +	 */
> +	ret = drm_of_lvds_get_dual_link_pixel_order(dev->of_node, 1, 0,
> +						    companion, 1, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "Invalid Dual-Link Configuration.\n");
> +		return ret;
> +	}
> +
> +	dev_info(dev, "Primary TCON, enabling LVDS Dual-Link");
> +	tcon->lvds_dual_link = true;
> +
>  	return sun4i_lvds_init(drm, tcon);
>  }
>  
> @@ -1500,6 +1535,7 @@ static const struct sun4i_tcon_quirks sun7i_a20_tcon0_quirks = {
>  };
>  
>  static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
> +	.supports_lvds		= true,

Should this be split to a separate patch, or at least mentioned in the
commit message ?

>  	.has_channel_0		= true,
>  	.has_channel_1		= true,
>  	.dclk_min_div		= 4,
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
> index cfbf4e6c1679..51c4e09cdd13 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
> @@ -98,6 +98,7 @@
>  
>  #define SUN4I_TCON0_LVDS_IF_REG			0x84
>  #define SUN4I_TCON0_LVDS_IF_EN				BIT(31)
> +#define SUN4I_TCON0_LVDS_IF_DUAL_LINK			BIT(30)
>  #define SUN4I_TCON0_LVDS_IF_BITWIDTH_MASK		BIT(26)
>  #define SUN4I_TCON0_LVDS_IF_BITWIDTH_18BITS		(1 << 26)
>  #define SUN4I_TCON0_LVDS_IF_BITWIDTH_24BITS		(0 << 26)
> @@ -274,6 +275,9 @@ struct sun4i_tcon {
>  	/* Associated crtc */
>  	struct sun4i_crtc		*crtc;
>  
> +	/* Is the LVDS link a dual-channel link? */
> +	bool				lvds_dual_link;
> +
>  	int				id;
>  
>  	/* TCON list management */

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
