Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3A911ED04
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 22:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070BA6EDD1;
	Fri, 13 Dec 2019 21:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349B36EDD1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 21:41:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 357CF9D6;
 Fri, 13 Dec 2019 22:41:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576273260;
 bh=z5cuRSsVYBdOcHuDiKFbQTVMWj1FIRTYtWAonwxthZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pv24HIjQ2fRSxvc0HvOWsI0eKpzXsnYbVqX37Rkxb6uo/adnGVkDgJlfycTTLMHyK
 a6ODSCvXw957jMARZQ/dmxbk75GBiJizKyttEVad9xR8oQnuLA+Thm75YpHRb2cIeM
 FxMXJMC7etzLv5ndBRoXZamrI+ilm2JLLpMzlhBA=
Date: Fri, 13 Dec 2019 23:40:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 4/7] drm: rcar-du: lvds: Allow for even and odd pixels
 swap
Message-ID: <20191213214050.GO4860@pendragon.ideasonboard.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1575649974-31472-5-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575649974-31472-5-git-send-email-fabrizio.castro@bp.renesas.com>
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

On Fri, Dec 06, 2019 at 04:32:51PM +0000, Fabrizio Castro wrote:
> DT properties dual-lvds-even-pixels and dual-lvds-odd-pixels
> can be used to work out if the driver needs to swap even
> and odd pixels around.
> 
> This patch makes use of the return value from function
> drm_of_lvds_get_dual_link_pixel_order to determine if we
> need to swap odd and even pixels around for things to work
> properly.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v3->v4:
> * New patch extracted from patch:
>   "drm: rcar-du: lvds: Add dual-LVDS panels support"
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 46 +++++++++++++++++++++++++++++--------
>  1 file changed, 37 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 6c1f171..cb2147c 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -71,6 +71,7 @@ struct rcar_lvds {
>  
>  	struct drm_bridge *companion;
>  	bool dual_link;
> +	bool stripe_swap_data;

Should we merge those two fields in an int dual_link that would be set
to DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS,
DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS or a negative value (or maybe we the
value of enum drm_lvds_dual_link_pixels could be modified so that 0
could mean single link) ?

>  };
>  
>  #define bridge_to_rcar_lvds(b) \
> @@ -441,12 +442,20 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
>  	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
>  
>  	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) {
> -		/*
> -		 * Configure vertical stripe based on the mode of operation of
> -		 * the connected device.
> -		 */
> -		rcar_lvds_write(lvds, LVDSTRIPE,
> -				lvds->dual_link ? LVDSTRIPE_ST_ON : 0);
> +		u32 lvdstripe = 0;
> +
> +		if (lvds->dual_link)
> +			/*
> +			 * Configure vertical stripe based on the mode of
> +			 * operation of the connected device.
> +			 *
> +			 * ST_SWAP from LVD1STRIPE is reserved, do not set
> +			 * in the companion LVDS

Maybe "ST_SWAP is reserved for the companion encoder, only set it in the
primary encoder." ?

> +			 */
> +			lvdstripe = LVDSTRIPE_ST_ON |
> +				(lvds->companion && lvds->stripe_swap_data ?
> +				 LVDSTRIPE_ST_SWAP : 0);

To match the coding style of the rest of the driver,

			lvdstripe = LVDSTRIPE_ST_ON
				  | (lvds->companion && lvds->stripe_swap_data ?
				     LVDSTRIPE_ST_SWAP : 0);

Even though not strictly required, could you surround this statement
with { } as it spans quite a few lines with the comment ?

> +		rcar_lvds_write(lvds, LVDSTRIPE, lvdstripe);
>  	}
>  
>  	/*
> @@ -702,17 +711,33 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
>  	dual_link = drm_of_lvds_get_dual_link_pixel_order(p0, p1);
>  	of_node_put(p0);
>  	of_node_put(p1);
> -	if (dual_link >= DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
> +
> +	switch (dual_link) {
> +	case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
> +		/*
> +		 * By default we generate even pixels from this encoder and odd
> +		 * pixels from the companion encoder, but since p0 is connected
> +		 * to the port expecting ood pixels, and p1 is connected to the
> +		 * port expecting even pixels, we need to swap even and odd
> +		 * pixels around.
> +		 */
> +		lvds->stripe_swap_data = true;
> +		lvds->dual_link = true;
> +		break;
> +	case DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS:
>  		lvds->dual_link = true;
> -	} else if (lvds->next_bridge && lvds->next_bridge->timings) {
> +		break;
> +	default:
>  		/*
>  		 * Early dual-link bridge specific implementations populate the
>  		 * timings field of drm_bridge, read the dual_link flag off the
>  		 * bridge directly for backward compatibility.
>  		 */
> -		lvds->dual_link = lvds->next_bridge->timings->dual_link;
> +		if (lvds->next_bridge && lvds->next_bridge->timings)
> +			lvds->dual_link = lvds->next_bridge->timings->dual_link;
>  	}
>  
> +

A single blank line is enough.

>  	if (!lvds->dual_link) {
>  		dev_dbg(dev, "Single-link configuration detected\n");
>  		goto done;
> @@ -728,6 +753,9 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
>  		"Dual-link configuration detected (companion encoder %pOF)\n",
>  		companion);
>  
> +	if (lvds->stripe_swap_data)
> +		dev_dbg(dev, "Data swapping required\n");
> +
>  	companion_lvds = bridge_to_rcar_lvds(lvds->companion);
>  
>  	/*

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
