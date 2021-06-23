Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 140E13B11B1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 04:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387966E852;
	Wed, 23 Jun 2021 02:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D090F6E852
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 02:28:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3509C9B1;
 Wed, 23 Jun 2021 04:28:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624415296;
 bh=i9IidQ+fJ4DETYdAP46RHIVJ5iSLuCMy3M1ixEzM3GI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JoiAgGet0IGN4PfQTTpUAyRdukxLPyXIlRStgN/dbbWR+hpLbg5YCbK38UfEoOVbq
 u+H+8MhDi7lBsQQ9oOnuXnkEOnwCg8FbjBeZ5jeP38pJaCmqwVmDNkGQCG3Rlh3ZE4
 XetjIpRvhICaFPVoxn0nf94U12X/9FzQsNnISahw=
Date: Wed, 23 Jun 2021 05:27:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 3/3] drm: rcar-du: Add r8a779a0 device support
Message-ID: <YNKcI8bS78dXDc1v@pendragon.ideasonboard.com>
References: <20210622232024.3215248-1-kieran.bingham@ideasonboard.com>
 <20210622232024.3215248-4-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210622232024.3215248-4-kieran.bingham@ideasonboard.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

Thank you for the patch.

On Wed, Jun 23, 2021 at 12:20:24AM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Extend the rcar_du_device_info structure and rcar_du_output enum to
> support DSI outputs and utilise these additions to provide support for
> the R8A779A0 V3U platform.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 20 ++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h    |  2 ++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c     | 21 +++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h     |  6 ++++++
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  4 ++++
>  drivers/gpu/drm/rcar-du/rcar_du_group.c   |  2 ++
>  6 files changed, 55 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index cff0d82b9491..edc46a96df6b 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -31,6 +31,7 @@
>  #include "rcar_du_regs.h"
>  #include "rcar_du_vsp.h"
>  #include "rcar_lvds.h"
> +#include "rcar_mipi_dsi.h"
>  
>  static u32 rcar_du_crtc_read(struct rcar_du_crtc *rcrtc, u32 reg)
>  {
> @@ -737,6 +738,16 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  		rcar_lvds_clk_enable(bridge, mode->clock * 1000);
>  	}
>  
> +	/*
> +	 * On V3U the dot clock is provided by the MIPI DSI encoder which is
> +	 * attached to DU. So, the MIPI DSI module should be enable before starting DU.

s/enable/enabled/

Line wrap.

But do we ? On D3 and E3, the situation is different, the clock is
provided by the LVDS encoder even if a non-LVDS output is used. On V3U,
we only have DSI outputs, so the DSI encoder will be enabled normally
anyway.

If we don't have to enable the DSI clock manually here, we can get rid
of the dsi array, which will simplify this patch.

> +	 */
> +	if (rcdu->info->dsi_clk_mask & BIT(rcrtc->index)) {
> +		struct drm_bridge *bridge = rcdu->dsi[rcrtc->index];
> +
> +		rcar_mipi_dsi_clk_enable(bridge);
> +	}
> +
>  	rcar_du_crtc_start(rcrtc);
>  
>  	/*
> @@ -770,6 +781,15 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
>  		rcar_lvds_clk_disable(bridge);
>  	}
>  
> +	if (rcdu->info->dsi_clk_mask & BIT(rcrtc->index)) {
> +		struct drm_bridge *bridge = rcdu->dsi[rcrtc->index];
> +
> +		/*
> +		 * Disable the MIPI DSI clock output
> +		 */
> +		rcar_mipi_dsi_clk_disable(bridge);
> +	}
> +
>  	spin_lock_irq(&crtc->dev->event_lock);
>  	if (crtc->state->event) {
>  		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> index 440e6b4fbb58..26e79b74898c 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> @@ -96,6 +96,8 @@ struct rcar_du_crtc_state {
>  enum rcar_du_output {
>  	RCAR_DU_OUTPUT_DPAD0,
>  	RCAR_DU_OUTPUT_DPAD1,
> +	RCAR_DU_OUTPUT_DSI0,
> +	RCAR_DU_OUTPUT_DSI1,
>  	RCAR_DU_OUTPUT_HDMI0,
>  	RCAR_DU_OUTPUT_HDMI1,
>  	RCAR_DU_OUTPUT_LVDS0,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index bfbff90588cb..16c0d7886fb2 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -473,6 +473,26 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
>  	.lvds_clk_mask =  BIT(1) | BIT(0),
>  };
>  
> +static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
> +	.gen = 3,
> +	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> +		  | RCAR_DU_FEATURE_VSP1_SOURCE,
> +	.channels_mask = BIT(1) | BIT(0),
> +	.routes = {
> +		/* R8A779A0 has two MIPI DSI outputs. */
> +		[RCAR_DU_OUTPUT_DSI0] = {
> +			.possible_crtcs = BIT(0),
> +			.port = 0,
> +		},
> +		[RCAR_DU_OUTPUT_DSI1] = {
> +			.possible_crtcs = BIT(1),
> +			.port = 1,
> +		},
> +	},
> +	.num_dsi = 2,
> +	.dsi_clk_mask =  BIT(1) | BIT(0),
> +};
> +
>  static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
>  	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
> @@ -497,6 +517,7 @@ static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a77980", .data = &rcar_du_r8a77970_info },
>  	{ .compatible = "renesas,du-r8a77990", .data = &rcar_du_r8a7799x_info },
>  	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
> +	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
>  	{ }
>  };
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index 02ca2d0e1b55..675207e8a56a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -54,8 +54,10 @@ struct rcar_du_output_routing {
>   * @quirks: device quirks (RCAR_DU_QUIRK_*)
>   * @channels_mask: bit mask of available DU channels
>   * @routes: array of CRTC to output routes, indexed by output (RCAR_DU_OUTPUT_*)
> + * @num_dsi: number of internal DSI encoders
>   * @num_lvds: number of internal LVDS encoders
>   * @dpll_mask: bit mask of DU channels equipped with a DPLL
> + * @dsi_clk_mask: bitmask of channels that can use the DSI clock as dot clock
>   * @lvds_clk_mask: bitmask of channels that can use the LVDS clock as dot clock
>   */
>  struct rcar_du_device_info {
> @@ -64,8 +66,10 @@ struct rcar_du_device_info {
>  	unsigned int quirks;
>  	unsigned int channels_mask;
>  	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
> +	unsigned int num_dsi;
>  	unsigned int num_lvds;
>  	unsigned int dpll_mask;
> +	unsigned int dsi_clk_mask;
>  	unsigned int lvds_clk_mask;
>  };
>  
> @@ -73,6 +77,7 @@ struct rcar_du_device_info {
>  #define RCAR_DU_MAX_GROUPS		DIV_ROUND_UP(RCAR_DU_MAX_CRTCS, 2)
>  #define RCAR_DU_MAX_VSPS		4
>  #define RCAR_DU_MAX_LVDS		2
> +#define RCAR_DU_MAX_DSI			2
>  
>  struct rcar_du_device {
>  	struct device *dev;
> @@ -89,6 +94,7 @@ struct rcar_du_device {
>  	struct platform_device *cmms[RCAR_DU_MAX_CRTCS];
>  	struct rcar_du_vsp vsps[RCAR_DU_MAX_VSPS];
>  	struct drm_bridge *lvds[RCAR_DU_MAX_LVDS];
> +	struct drm_bridge *dsi[RCAR_DU_MAX_DSI];
>  
>  	struct {
>  		struct drm_property *colorkey;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index 0daa8bba50f5..d7697099f2a1 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -83,6 +83,10 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  		if (output == RCAR_DU_OUTPUT_LVDS0 ||
>  		    output == RCAR_DU_OUTPUT_LVDS1)
>  			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] = bridge;
> +
> +		if (output == RCAR_DU_OUTPUT_DSI0 ||
> +		    output == RCAR_DU_OUTPUT_DSI1)
> +			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] = bridge;
>  	}
>  
>  	/*
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index 88a783ceb3e9..92631a4571ad 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -124,6 +124,8 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
>  		if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index))
>  			didsr |= DIDSR_LCDS_LVDS0(i)
>  			      |  DIDSR_PDCS_CLK(i, 0);
> +		else if (rcdu->info->dsi_clk_mask & BIT(rcrtc->index))
> +			didsr |= DIDSR_LCDS_LVDS0(i);
>  		else
>  			didsr |= DIDSR_LCDS_DCLKIN(i)
>  			      |  DIDSR_PDCS_CLK(i, 0);

-- 
Regards,

Laurent Pinchart
