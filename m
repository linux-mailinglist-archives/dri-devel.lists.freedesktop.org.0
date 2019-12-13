Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A535B11ECE6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 22:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D133F6EDCE;
	Fri, 13 Dec 2019 21:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38246EDCE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 21:30:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE8379D6;
 Fri, 13 Dec 2019 22:30:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576272619;
 bh=ugVPzgYz0NiaLKYKQDyg5loFUyhvh5heLoWsUgIayTc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h20vYc3JpzU7aPXMJuCzSilRyu7hCfAEhPKmpzptuvhM1yxYrX6ZuQ37jp/dFAkyf
 HBVWeDYwmLMzLjZErobm6JmN9h+hfEBDkZ4Ar2muxFLMK5/WGHiZ6irpH4glu2v4la
 mz80OBvKOg4r5lQiLbDRRIzTNsaI101SMCL2aKVI=
Date: Fri, 13 Dec 2019 23:30:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 3/7] drm: rcar-du: lvds: Get dual link configuration
 from DT
Message-ID: <20191213213010.GN4860@pendragon.ideasonboard.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1575649974-31472-4-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575649974-31472-4-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Magnus Damm <magnus.damm@gmail.com>,
 ebiharaml@si-linux.co.jp, devicetree@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fabrizio,

Thank you for the patch.

On Fri, Dec 06, 2019 at 04:32:50PM +0000, Fabrizio Castro wrote:
> For dual-LVDS configurations, it is now possible to mark the
> DT port nodes for the sink with boolean properties (like
> dual-lvds-even-pixels and dual-lvds-odd-pixels) to let drivers
> know the encoders need to be configured in dual-LVDS mode.
> 
> Rework the implementation of rcar_lvds_parse_dt_companion
> to make use of the DT markers while keeping backward
> compatibility.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v3->v4:
> * New patch extracted from patch:
>   "drm: rcar-du: lvds: Add dual-LVDS panels support"
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 56 +++++++++++++++++++++++++++++++------
>  1 file changed, 47 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 3cb0a83..6c1f171 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -669,8 +669,10 @@ EXPORT_SYMBOL_GPL(rcar_lvds_dual_link);
>  static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
>  {
>  	const struct of_device_id *match;
> -	struct device_node *companion;
> +	struct device_node *companion, *p0, *p1;

Could you rename p0 and p1 to port0 and port1, and spit them to a
separate line of variable declaration ?

> +	struct rcar_lvds *companion_lvds;
>  	struct device *dev = lvds->dev;
> +	int dual_link;
>  	int ret = 0;
>  
>  	/* Locate the companion LVDS encoder for dual-link operation, if any. */
> @@ -689,13 +691,55 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
>  		goto done;
>  	}
>  
> +	/*
> +	 * We need to work out if the sink is expecting us to function in
> +	 * dual-link mode. We do this by looking at the DT port nodes we are
> +	 * connected to, if they are marked as expecting even pixels and
> +	 * odd pixels than we need to enable vertical stripe output.
> +	 */
> +	p0 = of_graph_get_port_by_id(dev->of_node, 1);
> +	p1 = of_graph_get_port_by_id(companion, 1);
> +	dual_link = drm_of_lvds_get_dual_link_pixel_order(p0, p1);
> +	of_node_put(p0);
> +	of_node_put(p1);
> +	if (dual_link >= DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
> +		lvds->dual_link = true;
> +	} else if (lvds->next_bridge && lvds->next_bridge->timings) {
> +		/*
> +		 * Early dual-link bridge specific implementations populate the
> +		 * timings field of drm_bridge, read the dual_link flag off the
> +		 * bridge directly for backward compatibility.
> +		 */
> +		lvds->dual_link = lvds->next_bridge->timings->dual_link;
> +	}
> +
> +	if (!lvds->dual_link) {
> +		dev_dbg(dev, "Single-link configuration detected\n");
> +		goto done;
> +	}
> +
>  	lvds->companion = of_drm_find_bridge(companion);
>  	if (!lvds->companion) {
>  		ret = -EPROBE_DEFER;
>  		goto done;
>  	}
>  
> -	dev_dbg(dev, "Found companion encoder %pOF\n", companion);
> +	dev_dbg(dev,
> +		"Dual-link configuration detected (companion encoder %pOF)\n",
> +		companion);
> +
> +	companion_lvds = bridge_to_rcar_lvds(lvds->companion);

Could you move this line after the FIXME comment ?

With these small issues fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +	/*
> +	 * FIXME: We should not be messing with the companion encoder private
> +	 * data from the primary encoder, we should rather let the companion
> +	 * encoder work things out on its own. However, the companion encoder
> +	 * doesn't hold a reference to the primary encoder, and
> +	 * drm_of_lvds_get_dual_link_pixel_order needs to be given references
> +	 * to the output ports of both encoders, therefore leave it like this
> +	 * for the time being.
> +	 */
> +	companion_lvds->dual_link = true;
>  
>  done:
>  	of_node_put(companion);
> @@ -739,13 +783,7 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  	if (ret)
>  		goto done;
>  
> -	if ((lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) &&
> -	    lvds->next_bridge)
> -		lvds->dual_link = lvds->next_bridge->timings
> -				? lvds->next_bridge->timings->dual_link
> -				: false;
> -
> -	if (lvds->dual_link)
> +	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
>  		ret = rcar_lvds_parse_dt_companion(lvds);
>  
>  done:

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
