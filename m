Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46EB121BC2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 22:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDA76E8AC;
	Mon, 16 Dec 2019 21:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476E16E8AC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 21:35:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41F84A34;
 Mon, 16 Dec 2019 22:35:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576532102;
 bh=0W0zxY2knSzySHv9r8fNX8fp00bT/DWSXaIMjThF/UE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j86Mefoe9v3RDZVHrcamnGVBkPK6H9SE+9ICTOVzpmAAK6MM7XAr1ZOURbI3WL5To
 Bk5C684bU4YY9tZhziyUOnN/yQ4cJceRu0jEcjeYc5O/pFXyfJdpwUA4xa/E0zV+C+
 oLBO5Xzc/4dSbDXrI7HtCSlKYgTl8L3sv66M4nJg=
Date: Mon, 16 Dec 2019 23:34:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v5 4/6] drm: rcar-du: lvds: Allow for even and odd pixels
 swap
Message-ID: <20191216213451.GH4856@pendragon.ideasonboard.com>
References: <1576527154-18391-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1576527154-18391-5-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576527154-18391-5-git-send-email-fabrizio.castro@bp.renesas.com>
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

On Mon, Dec 16, 2019 at 08:12:32PM +0000, Fabrizio Castro wrote:
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
> v4->v5:
> * Addressed comments from Laurent's review
> 
> v3->v4:
> * New patch extracted from patch:
>   "drm: rcar-du: lvds: Add dual-LVDS panels support"
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 67 +++++++++++++++++++++++++++++--------
>  1 file changed, 53 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 3eb208e..c6a38c3 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -37,6 +37,12 @@ enum rcar_lvds_mode {
>  	RCAR_LVDS_MODE_VESA = 4,
>  };
>  
> +enum rcar_lvds_link_type {
> +	RCAR_LVDS_SINGLE_LINK = 0,
> +	RCAR_LVDS_DUAL_LINK_EVEN_ODD_PIXELS = 1,
> +	RCAR_LVDS_DUAL_LINK_ODD_EVEN_PIXELS = 2,
> +};
> +
>  #define RCAR_LVDS_QUIRK_LANES		BIT(0)	/* LVDS lanes 1 and 3 inverted */
>  #define RCAR_LVDS_QUIRK_GEN3_LVEN	BIT(1)	/* LVEN bit needs to be set on R8A77970/R8A7799x */
>  #define RCAR_LVDS_QUIRK_PWD		BIT(2)	/* PWD bit available (all of Gen3 but E3) */
> @@ -67,7 +73,7 @@ struct rcar_lvds {
>  	} clocks;
>  
>  	struct drm_bridge *companion;
> -	bool dual_link;
> +	enum rcar_lvds_link_type dual_link;

Do you think we should rename this to link_type (and test for
lvds->link_type != RCAR_LVDS_SINGLE_LINK) instead of lvds->dual_link) ?
Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  };
>  
>  #define bridge_to_rcar_lvds(b) \
> @@ -484,12 +490,31 @@ static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
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
> +		if (lvds->dual_link) {
> +			/*
> +			 * By default we generate even pixels from the primary
> +			 * encoder and odd pixels from the companion encoder.
> +			 * Swap pixels around if the sink requires odd pixels
> +			 * from the primary encoder and even pixels from the
> +			 * companion encoder.
> +			 */
> +			bool swap_pixels = lvds->dual_link ==
> +				RCAR_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
> +
> +			/*
> +			 * Configure vertical stripe since we are dealing with
> +			 * an LVDS dual-link connection.
> +			 *
> +			 * ST_SWAP is reserved for the companion encoder, only
> +			 * set it in the primary encoder.
> +			 */
> +			lvdstripe = LVDSTRIPE_ST_ON
> +				  | (lvds->companion && swap_pixels ?
> +				     LVDSTRIPE_ST_SWAP : 0);
> +		}
> +		rcar_lvds_write(lvds, LVDSTRIPE, lvdstripe);
>  	}
>  
>  	/*
> @@ -716,15 +741,26 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
>  	of_node_put(port0);
>  	of_node_put(port1);
>  
> -	if (dual_link >= DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS)
> -		lvds->dual_link = true;
> -	else if (lvds->next_bridge && lvds->next_bridge->timings)
> +	switch (dual_link) {
> +	case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
> +		lvds->dual_link = RCAR_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
> +		break;
> +	case DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS:
> +		lvds->dual_link = RCAR_LVDS_DUAL_LINK_EVEN_ODD_PIXELS;
> +		break;
> +	default:
>  		/*
>  		 * Early dual-link bridge specific implementations populate the
> -		 * timings field of drm_bridge, read the dual_link flag off the
> -		 * bridge directly for backward compatibility.
> +		 * timings field of drm_bridge. If the flag is set, we assume
> +		 * that we are expected to generate even pixels from the primary
> +		 * encoder, and odd pixels from the companion encoder.
>  		 */
> -		lvds->dual_link = lvds->next_bridge->timings->dual_link;
> +		if (lvds->next_bridge && lvds->next_bridge->timings &&
> +		    lvds->next_bridge->timings->dual_link)
> +			lvds->dual_link = RCAR_LVDS_DUAL_LINK_EVEN_ODD_PIXELS;
> +		else
> +			lvds->dual_link = RCAR_LVDS_SINGLE_LINK;
> +	}
>  
>  	if (!lvds->dual_link) {
>  		dev_dbg(dev, "Single-link configuration detected\n");
> @@ -741,6 +777,9 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
>  		"Dual-link configuration detected (companion encoder %pOF)\n",
>  		companion);
>  
> +	if (lvds->dual_link == RCAR_LVDS_DUAL_LINK_ODD_EVEN_PIXELS)
> +		dev_dbg(dev, "Data swapping required\n");
> +
>  	/*
>  	 * FIXME: We should not be messing with the companion encoder private
>  	 * data from the primary encoder, we should rather let the companion
> @@ -751,7 +790,7 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
>  	 * for the time being.
>  	 */
>  	companion_lvds = bridge_to_rcar_lvds(lvds->companion);
> -	companion_lvds->dual_link = true;
> +	companion_lvds->dual_link = lvds->dual_link;
>  
>  done:
>  	of_node_put(companion);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
