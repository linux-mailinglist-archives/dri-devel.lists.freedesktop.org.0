Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 185D32582B2
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 22:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF616E51B;
	Mon, 31 Aug 2020 20:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27D76E529
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 20:38:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6419277;
 Mon, 31 Aug 2020 22:38:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1598906323;
 bh=oDDV/UROROeX9EXENJv08hi0BXI+4vhTWVGFosE7BEI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UQ87pikt1v+OeY5xFm2UsbYNeUsdInn8EoXZ6cbfwnZDsRvHS8t+gN5xg2FDbbyFs
 fbMVeX4l4VcvwtsbtIyV48KRovdsKSew/QZ+IcXLgQoiskbkXMF7Oe6qF7BTSVXFXR
 1+DU4CKbLEU/NQGTfdjJTrg+Vln4AIVS6u8elK/M=
Date: Mon, 31 Aug 2020 23:38:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 2/4] drm/sun4i: tcon: Refactor the LVDS and panel
 probing
Message-ID: <20200831203821.GV16155@pendragon.ideasonboard.com>
References: <cover.7029eefe5c5350920f91d4cd4cbc061466752f3c.1596101672.git-series.maxime@cerno.tech>
 <1df5a7bcafa091e008edb439ee9de4262ae4d5d1.1596101672.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1df5a7bcafa091e008edb439ee9de4262ae4d5d1.1596101672.git-series.maxime@cerno.tech>
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

On Thu, Jul 30, 2020 at 11:35:02AM +0200, Maxime Ripard wrote:
> The current code to parse the DT, deal with the older device trees, and
> register either the RGB or LVDS output has so far grown organically into
> the bind function and has become quite hard to extend properly.
> 
> Let's move it into a single function that grabs all the resources it needs
> and registers the proper panel output.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 139 +++++++++++++++---------------
>  1 file changed, 70 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index 2a5a9903c4c6..d03ad75f9900 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -875,6 +875,75 @@ static int sun4i_tcon_init_regmap(struct device *dev,
>  	return 0;
>  }
>  
> +static int sun4i_tcon_register_panel(struct drm_device *drm,
> +				     struct sun4i_tcon *tcon)
> +{
> +	struct device_node *companion;
> +	struct device_node *remote;
> +	struct device *dev = tcon->dev;
> +	bool has_lvds_alt;
> +	bool has_lvds_rst;
> +	int ret;
> +
> +	/*
> +	 * If we have an LVDS panel connected to the TCON, we should
> +	 * just probe the LVDS connector. Otherwise, let's just register
> +	 * an RGB panel.
> +	 */
> +	remote = of_graph_get_remote_node(dev->of_node, 1, 0);
> +	if (!tcon->quirks->supports_lvds ||
> +	    !of_device_is_compatible(remote, "panel-lvds"))

This isn't very nice :-S Not a candidate for a fix in this patch, but
something that should be addressed in the future. As Chen-Yu mentioned,
there are LVDS panels supported by the panel-simple driver.

> +		return sun4i_rgb_init(drm, tcon);
> +
> +	/*
> +	 * This can only be made optional since we've had DT
> +	 * nodes without the LVDS reset properties.
> +	 *
> +	 * If the property is missing, just disable LVDS, and
> +	 * print a warning.
> +	 */
> +	tcon->lvds_rst = devm_reset_control_get_optional(dev, "lvds");
> +	if (IS_ERR(tcon->lvds_rst)) {
> +		dev_err(dev, "Couldn't get our reset line\n");
> +		return PTR_ERR(tcon->lvds_rst);
> +	} else if (tcon->lvds_rst) {
> +		has_lvds_rst = true;
> +		reset_control_reset(tcon->lvds_rst);
> +	} else {
> +		has_lvds_rst = false;
> +	}
> +
> +	/*
> +	 * This can only be made optional since we've had DT
> +	 * nodes without the LVDS reset properties.

Shouldn't this mention clock, not reset ?

> +	 *
> +	 * If the property is missing, just disable LVDS, and
> +	 * print a warning.
> +	 */
> +	if (tcon->quirks->has_lvds_alt) {
> +		tcon->lvds_pll = devm_clk_get(dev, "lvds-alt");
> +		if (IS_ERR(tcon->lvds_pll)) {
> +			if (PTR_ERR(tcon->lvds_pll) == -ENOENT) {
> +				has_lvds_alt = false;
> +			} else {
> +				dev_err(dev, "Couldn't get the LVDS PLL\n");
> +				return PTR_ERR(tcon->lvds_pll);
> +			}
> +		} else {
> +			has_lvds_alt = true;
> +		}
> +	}
> +
> +	if (!has_lvds_rst ||
> +	    (tcon->quirks->has_lvds_alt && !has_lvds_alt)) {
> +		dev_warn(dev, "Missing LVDS properties, Please upgrade your DT\n");
> +		dev_warn(dev, "LVDS output disabled\n");

Would it make sense to move this to the has_lvds_rst = false and
has_lvds_alt = false code sections about ? You could then print which
property is missing.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		return -ENODEV;
> +	}
> +
> +	return sun4i_lvds_init(drm, tcon);
> +}
> +
>  /*
>   * On SoCs with the old display pipeline design (Display Engine 1.0),
>   * the TCON is always tied to just one backend. Hence we can traverse
> @@ -1122,10 +1191,8 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
>  	struct drm_device *drm = data;
>  	struct sun4i_drv *drv = drm->dev_private;
>  	struct sunxi_engine *engine;
> -	struct device_node *remote;
>  	struct sun4i_tcon *tcon;
>  	struct reset_control *edp_rstc;
> -	bool has_lvds_rst, has_lvds_alt, can_lvds;
>  	int ret;
>  
>  	engine = sun4i_tcon_find_engine(drv, dev->of_node);
> @@ -1170,58 +1237,6 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
>  		return ret;
>  	}
>  
> -	if (tcon->quirks->supports_lvds) {
> -		/*
> -		 * This can only be made optional since we've had DT
> -		 * nodes without the LVDS reset properties.
> -		 *
> -		 * If the property is missing, just disable LVDS, and
> -		 * print a warning.
> -		 */
> -		tcon->lvds_rst = devm_reset_control_get_optional(dev, "lvds");
> -		if (IS_ERR(tcon->lvds_rst)) {
> -			dev_err(dev, "Couldn't get our reset line\n");
> -			return PTR_ERR(tcon->lvds_rst);
> -		} else if (tcon->lvds_rst) {
> -			has_lvds_rst = true;
> -			reset_control_reset(tcon->lvds_rst);
> -		} else {
> -			has_lvds_rst = false;
> -		}
> -
> -		/*
> -		 * This can only be made optional since we've had DT
> -		 * nodes without the LVDS reset properties.
> -		 *
> -		 * If the property is missing, just disable LVDS, and
> -		 * print a warning.
> -		 */
> -		if (tcon->quirks->has_lvds_alt) {
> -			tcon->lvds_pll = devm_clk_get(dev, "lvds-alt");
> -			if (IS_ERR(tcon->lvds_pll)) {
> -				if (PTR_ERR(tcon->lvds_pll) == -ENOENT) {
> -					has_lvds_alt = false;
> -				} else {
> -					dev_err(dev, "Couldn't get the LVDS PLL\n");
> -					return PTR_ERR(tcon->lvds_pll);
> -				}
> -			} else {
> -				has_lvds_alt = true;
> -			}
> -		}
> -
> -		if (!has_lvds_rst ||
> -		    (tcon->quirks->has_lvds_alt && !has_lvds_alt)) {
> -			dev_warn(dev, "Missing LVDS properties, Please upgrade your DT\n");
> -			dev_warn(dev, "LVDS output disabled\n");
> -			can_lvds = false;
> -		} else {
> -			can_lvds = true;
> -		}
> -	} else {
> -		can_lvds = false;
> -	}
> -
>  	ret = sun4i_tcon_init_clocks(dev, tcon);
>  	if (ret) {
>  		dev_err(dev, "Couldn't init our TCON clocks\n");
> @@ -1256,21 +1271,7 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
>  	}
>  
>  	if (tcon->quirks->has_channel_0) {
> -		/*
> -		 * If we have an LVDS panel connected to the TCON, we should
> -		 * just probe the LVDS connector. Otherwise, just probe RGB as
> -		 * we used to.
> -		 */
> -		remote = of_graph_get_remote_node(dev->of_node, 1, 0);
> -		if (of_device_is_compatible(remote, "panel-lvds"))
> -			if (can_lvds)
> -				ret = sun4i_lvds_init(drm, tcon);
> -			else
> -				ret = -EINVAL;
> -		else
> -			ret = sun4i_rgb_init(drm, tcon);
> -		of_node_put(remote);
> -
> +		ret = sun4i_tcon_register_panel(drm, tcon);
>  		if (ret < 0)
>  			goto err_free_dotclock;
>  	}

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
