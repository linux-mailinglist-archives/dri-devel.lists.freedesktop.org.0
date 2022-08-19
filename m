Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC09B599295
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 03:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5862410E8C0;
	Fri, 19 Aug 2022 01:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC43510E8C0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 01:35:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2696D30B;
 Fri, 19 Aug 2022 03:34:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1660872899;
 bh=g/gs7fOEj2MIURZX9W6Ktf8xBrU91Cm+HWudF/ZAU/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uaeiIFXx6fhc/5kPJA67VdWbSOWIuPb7PLY+vOb6NQwMXMuENXpHqGX3cOH2bArd5
 bir16LP6T0w6LroZYswqg43kkwbFA3K47OWOLlSqdSl2/0yY9eGiFyJSfhFYLHchiX
 hI7hnDzLjbRvFwn+VpnGQzGtZQxdcqE8G8PvEgIk=
Date: Fri, 19 Aug 2022 04:34:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 3/3] drm: rcar-du: fix DSI enable & disable sequence
Message-ID: <Yv7owItpQ/OlpoWm@pendragon.ideasonboard.com>
References: <20220817132803.85373-1-tomi.valkeinen@ideasonboard.com>
 <20220817132803.85373-3-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220817132803.85373-3-tomi.valkeinen@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Wed, Aug 17, 2022 at 04:28:03PM +0300, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> The rcar crtc depends on the clock provided from the rcar DSI bridge.
> When the DSI bridge is disabled, the clock is stopped, which causes the
> crtc disable to timeout.
> 
> Also, while I have no issue with the enable, the documentation suggests
> to enable the DSI before the crtc so that the crtc has its clock enabled
> at enable time. This is also not done by the current driver.
> 
> To fix this, we need to keep the DSI bridge enabled until the crtc has
> disabled itself, and enable the DSI bridge before crtc enables itself.
> 
> Add functions (rcar_mipi_dsi_atomic_early_enable and
> rcar_mipi_dsi_atomic_late_disable) to the rcar DSI bridge driver which
> the rcar driver can use to enable/disable the DSI clock when needed.
> This is similar to what is already done with the rcar LVDS bridge.

I had hoped we could avoid that :-(

I wonder if we could instead rely on the pre_enable/post_disable bridge
operations, with a custom commit tail implementation to order those
before/after the CRTC enable/disable respectively. That would be pretty
complex though, so probably not worth it.

Thinking more about this, I wonder why pre_enable is not called before
enabling the CRTC in the DRM atomic helpers. That would make more sense
to me, but I suppose changing it would break too many things ? I think
it should at least be discussed to figure out if it was a historical
oversight or if there was a good reason. It's *really* not nice to poke
holes through the abstraction layers like this.

> Also add a new function, rcar_mipi_dsi_stop_video(), called from
> rcar_mipi_dsi_atomic_enable so that the DSI TX gets disabled at the
> correct time, even if the clocks are still kept enabled.

I think this should be split to a separate patch, possibly before this
one, it addresses a separate issue.

> And, while possibly not strictly needed, clear clock related enable bits
> in rcar_mipi_dsi_atomic_late_disable to mirror the sequence done in
> rcar_mipi_dsi_startup() (via rcar_mipi_dsi_atomic_early_enable).

And this too should be a separate patch, possibly bundled with
rcar_mipi_dsi_stop_video().

Have you checked in the BSP code to see if they do the same at disable
time ?

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 25 +++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h     |  2 +
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  4 ++
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c   | 63 +++++++++++++++++++++--
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h   | 32 ++++++++++++
>  5 files changed, 121 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index fd3b94649a01..51fd1d99f4e8 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -29,6 +29,7 @@
>  #include "rcar_du_regs.h"
>  #include "rcar_du_vsp.h"
>  #include "rcar_lvds.h"
> +#include "rcar_mipi_dsi.h"
>  
>  static u32 rcar_du_crtc_read(struct rcar_du_crtc *rcrtc, u32 reg)
>  {
> @@ -733,6 +734,18 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  		rcar_cmm_enable(rcrtc->cmm);
>  	rcar_du_crtc_get(rcrtc);
>  

A comment here similar to the LVDS case would be useful. I would
actually move this below the LVDS code, and write

	/*
	 * Similarly, on V3U, ...
	 */

> +	if ((rcdu->info->dsi_clk_mask & BIT(rcrtc->index)) &&
> +	    (rstate->outputs &
> +	     (BIT(RCAR_DU_OUTPUT_DSI0) | BIT(RCAR_DU_OUTPUT_DSI1)))) {
> +		struct drm_bridge *bridge = rcdu->dsi[rcrtc->index];
> +
> +		/*
> +		 * Enable the DSI clock output.
> +		 */
> +
> +		rcar_mipi_dsi_atomic_early_enable(bridge, state);
> +	}

I was wondering if we could merge the DSI and LVDS clock enabling code,
including merging the lvds and dsi fields in rcar_du_device, but it
doesn't seem it will be very clean here.

> +
>  	/*
>  	 * On D3/E3 the dot clock is provided by the LVDS encoder attached to
>  	 * the DU channel. We need to enable its clock output explicitly if
> @@ -769,6 +782,18 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
>  	rcar_du_crtc_stop(rcrtc);
>  	rcar_du_crtc_put(rcrtc);
>  
> +	if ((rcdu->info->dsi_clk_mask & BIT(rcrtc->index)) &&
> +	    (rstate->outputs &
> +	     (BIT(RCAR_DU_OUTPUT_DSI0) | BIT(RCAR_DU_OUTPUT_DSI1)))) {
> +		struct drm_bridge *bridge = rcdu->dsi[rcrtc->index];
> +
> +		/*
> +		 * Disable the DSI clock output.
> +		 */
> +
> +		rcar_mipi_dsi_atomic_late_disable(bridge);
> +	}
> +
>  	if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) &&
>  	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
>  		struct drm_bridge *bridge = rcdu->lvds[rcrtc->index];
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index 712389c7b3d0..5cfa2bb7ad93 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -92,6 +92,7 @@ struct rcar_du_device_info {
>  #define RCAR_DU_MAX_GROUPS		DIV_ROUND_UP(RCAR_DU_MAX_CRTCS, 2)
>  #define RCAR_DU_MAX_VSPS		4
>  #define RCAR_DU_MAX_LVDS		2
> +#define RCAR_DU_MAX_DSI			2
>  
>  struct rcar_du_device {
>  	struct device *dev;
> @@ -108,6 +109,7 @@ struct rcar_du_device {
>  	struct platform_device *cmms[RCAR_DU_MAX_CRTCS];
>  	struct rcar_du_vsp vsps[RCAR_DU_MAX_VSPS];
>  	struct drm_bridge *lvds[RCAR_DU_MAX_LVDS];
> +	struct drm_bridge *dsi[RCAR_DU_MAX_DSI];
>  
>  	struct {
>  		struct drm_property *colorkey;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index 60d6be78323b..ac93e08e8af4 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -84,6 +84,10 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
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
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> index 62f7eb84ab01..1ec40e40fd08 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -542,6 +542,34 @@ static int rcar_mipi_dsi_start_video(struct rcar_mipi_dsi *dsi)
>  	return 0;
>  }
>  
> +static void rcar_mipi_dsi_stop_video(struct rcar_mipi_dsi *dsi)
> +{
> +	u32 status;
> +	int ret;
> +
> +	/* Disable transmission in video mode. */
> +	rcar_mipi_dsi_clr(dsi, TXVMCR, TXVMCR_EN_VIDEO);
> +
> +	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
> +				!(status & TXVMSR_ACT),
> +				2000, 100000, false, dsi, TXVMSR);
> +	if (ret < 0) {
> +		dev_err(dsi->dev, "Failed to disable video transmission\n");
> +		return;
> +	}
> +
> +	/* Assert video FIFO clear. */
> +	rcar_mipi_dsi_set(dsi, TXVMCR, TXVMCR_VFCLR);
> +
> +	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
> +				!(status & TXVMSR_VFRDY),
> +				2000, 100000, false, dsi, TXVMSR);
> +	if (ret < 0) {
> +		dev_err(dsi->dev, "Failed to assert video FIFO clear\n");
> +		return;
> +	}
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Bridge
>   */
> @@ -558,7 +586,22 @@ static int rcar_mipi_dsi_attach(struct drm_bridge *bridge,
>  static void rcar_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
>  					struct drm_bridge_state *old_bridge_state)
>  {
> -	struct drm_atomic_state *state = old_bridge_state->base.state;
> +	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
> +
> +	rcar_mipi_dsi_start_video(dsi);
> +}
> +
> +static void rcar_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
> +					struct drm_bridge_state *old_bridge_state)
> +{
> +	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
> +
> +	rcar_mipi_dsi_stop_video(dsi);
> +}
> +
> +void rcar_mipi_dsi_atomic_early_enable(struct drm_bridge *bridge,
> +				       struct drm_atomic_state *state)
> +{
>  	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
>  	const struct drm_display_mode *mode;
>  	struct drm_connector *connector;
> @@ -586,8 +629,6 @@ static void rcar_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
>  	if (ret < 0)
>  		goto err_dsi_start_hs;
>  
> -	rcar_mipi_dsi_start_video(dsi);
> -
>  	return;
>  
>  err_dsi_start_hs:
> @@ -595,15 +636,27 @@ static void rcar_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
>  err_dsi_startup:
>  	rcar_mipi_dsi_clk_disable(dsi);
>  }
> +EXPORT_SYMBOL_GPL(rcar_mipi_dsi_atomic_early_enable);
>  
> -static void rcar_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
> -					 struct drm_bridge_state *old_bridge_state)
> +void rcar_mipi_dsi_atomic_late_disable(struct drm_bridge *bridge)
>  {
>  	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
>  
> +	rcar_mipi_dsi_clr(dsi, VCLKEN, VCLKEN_CKEN);
> +
> +	/* Disable DOT clock */
> +	rcar_mipi_dsi_clr(dsi, VCLKSET, VCLKSET_CKEN);
> +
> +	/* CFGCLK disable */
> +	rcar_mipi_dsi_clr(dsi, CFGCLKSET, CFGCLKSET_CKEN);
> +
> +	/* LPCLK disable */
> +	rcar_mipi_dsi_clr(dsi, LPCLKSET, LPCLKSET_CKEN);
> +
>  	rcar_mipi_dsi_shutdown(dsi);
>  	rcar_mipi_dsi_clk_disable(dsi);
>  }
> +EXPORT_SYMBOL_GPL(rcar_mipi_dsi_atomic_late_disable);
>  
>  static enum drm_mode_status
>  rcar_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
> new file mode 100644
> index 000000000000..1764abf65a34
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * R-Car DSI Encoder
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + *
> + * Contact: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> + */
> +
> +#ifndef __RCAR_MIPI_DSI_H__
> +#define __RCAR_MIPI_DSI_H__
> +
> +struct drm_bridge;
> +struct drm_atomic_state;

Alphabetical order please.

> +
> +#if IS_ENABLED(CONFIG_DRM_RCAR_MIPI_DSI)
> +void rcar_mipi_dsi_atomic_early_enable(struct drm_bridge *bridge,
> +				       struct drm_atomic_state *state);
> +void rcar_mipi_dsi_atomic_late_disable(struct drm_bridge *bridge);

It would be nice to have a naming scheme consistent with rcar_lvds.h.
That would mean rcar_mipi_dsi_clk_{enable,disable}(), or renaming the
LVDS functions to match whatever name would be picked here.

We could name the functions pre_enable/post_disable to show what they
should really be, if it wasn't for the DRM atomic helpers calling the
bridge operations at the wrong time.

> +#else
> +static inline void
> +rcar_mipi_dsi_atomic_early_enable(struct drm_bridge *bridge,
> +				  struct drm_atomic_state *state)
> +{
> +}
> +
> +void rcar_mipi_dsi_atomic_late_disable(struct drm_bridge *bridge)
> +{
> +}
> +#endif /* CONFIG_DRM_RCAR_MIPI_DSI */
> +
> +#endif /* __RCAR_MIPI_DSI_H__ */

-- 
Regards,

Laurent Pinchart
