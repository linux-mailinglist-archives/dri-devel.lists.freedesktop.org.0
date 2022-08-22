Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B28359C0BF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 15:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265B08DBC1;
	Mon, 22 Aug 2022 13:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B488DB9F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:40:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BDD152B3;
 Mon, 22 Aug 2022 15:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661175650;
 bh=h9cVX8yp0mOivoIqGNl5E9m6fP+CBWVHf8p4JfRLT+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AzQKrePFo/4r2Suj3VR4fgjglc3NJ0N2LyDYRo2MrUJDu8cyUQQRh2JpnhJRoQ/m6
 F8pjsJJfTXO/tRewxmJTtRRhd/+vUW9eLni85WrJp5wNwJnnIklR2gvABttZy0ntH1
 ZFbf5J0ziRSHr5drAuoFDjcKP/KDcUVrfPJnOChs=
Date: Mon, 22 Aug 2022 16:40:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 3/4] drm: rcar-du: fix DSI enable & disable sequence
Message-ID: <YwOHXsHjXDW+CmYI@pendragon.ideasonboard.com>
References: <20220822130513.119029-1-tomi.valkeinen@ideasonboard.com>
 <20220822130513.119029-4-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220822130513.119029-4-tomi.valkeinen@ideasonboard.com>
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

On Mon, Aug 22, 2022 at 04:05:11PM +0300, Tomi Valkeinen wrote:
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

The function names don't match the code. With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> the rcar driver can use to enable/disable the DSI clock when needed.
> This is similar to what is already done with the rcar LVDS bridge.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 26 +++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h     |  2 ++
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  4 +++
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c   | 25 +++++++++++++-----
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h   | 31 +++++++++++++++++++++++
>  5 files changed, 82 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index fd3b94649a01..31e33270e6db 100644
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
> @@ -747,6 +748,18 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  		rcar_lvds_clk_enable(bridge, mode->clock * 1000);
>  	}
>  
> +	/*
> +	 * Similarly to LVDS, on V3U the dot clock is provided by the DSI
> +	 * encoder, and we need to enable the DSI clocks before enabling the CRTC.
> +	 */
> +	if ((rcdu->info->dsi_clk_mask & BIT(rcrtc->index)) &&
> +	    (rstate->outputs &
> +	     (BIT(RCAR_DU_OUTPUT_DSI0) | BIT(RCAR_DU_OUTPUT_DSI1)))) {
> +		struct drm_bridge *bridge = rcdu->dsi[rcrtc->index];
> +
> +		rcar_mipi_dsi_pclk_enable(bridge, state);
> +	}
> +
>  	rcar_du_crtc_start(rcrtc);
>  
>  	/*
> @@ -780,6 +793,19 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
>  		rcar_lvds_clk_disable(bridge);
>  	}
>  
> +	if ((rcdu->info->dsi_clk_mask & BIT(rcrtc->index)) &&
> +	    (rstate->outputs &
> +	     (BIT(RCAR_DU_OUTPUT_DSI0) | BIT(RCAR_DU_OUTPUT_DSI1)))) {
> +		struct drm_bridge *bridge = rcdu->dsi[rcrtc->index];
> +
> +		/*
> +		 * Disable the DSI clock output, see
> +		 * rcar_du_crtc_atomic_enable().
> +		 */
> +
> +		rcar_mipi_dsi_pclk_disable(bridge);
> +	}
> +
>  	spin_lock_irq(&crtc->dev->event_lock);
>  	if (crtc->state->event) {
>  		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index bfad7775d9a1..9367c2f59431 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -91,6 +91,7 @@ struct rcar_du_device_info {
>  #define RCAR_DU_MAX_GROUPS		DIV_ROUND_UP(RCAR_DU_MAX_CRTCS, 2)
>  #define RCAR_DU_MAX_VSPS		4
>  #define RCAR_DU_MAX_LVDS		2
> +#define RCAR_DU_MAX_DSI			2
>  
>  struct rcar_du_device {
>  	struct device *dev;
> @@ -107,6 +108,7 @@ struct rcar_du_device {
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
> index 6a10a35f1122..b8fabf821a12 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -598,7 +598,22 @@ static int rcar_mipi_dsi_attach(struct drm_bridge *bridge,
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
> +					 struct drm_bridge_state *old_bridge_state)
> +{
> +	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
> +
> +	rcar_mipi_dsi_stop_video(dsi);
> +}
> +
> +void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
> +			       struct drm_atomic_state *state)
> +{
>  	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
>  	const struct drm_display_mode *mode;
>  	struct drm_connector *connector;
> @@ -626,8 +641,6 @@ static void rcar_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
>  	if (ret < 0)
>  		goto err_dsi_start_hs;
>  
> -	rcar_mipi_dsi_start_video(dsi);
> -
>  	return;
>  
>  err_dsi_start_hs:
> @@ -635,16 +648,16 @@ static void rcar_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
>  err_dsi_startup:
>  	rcar_mipi_dsi_clk_disable(dsi);
>  }
> +EXPORT_SYMBOL_GPL(rcar_mipi_dsi_pclk_enable);
>  
> -static void rcar_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
> -					 struct drm_bridge_state *old_bridge_state)
> +void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
>  {
>  	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
>  
> -	rcar_mipi_dsi_stop_video(dsi);
>  	rcar_mipi_dsi_shutdown(dsi);
>  	rcar_mipi_dsi_clk_disable(dsi);
>  }
> +EXPORT_SYMBOL_GPL(rcar_mipi_dsi_pclk_disable);
>  
>  static enum drm_mode_status
>  rcar_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
> new file mode 100644
> index 000000000000..ff759fc5edc7
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
> @@ -0,0 +1,31 @@
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
> +struct drm_atomic_state;
> +struct drm_bridge;
> +
> +#if IS_ENABLED(CONFIG_DRM_RCAR_MIPI_DSI)
> +void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
> +			       struct drm_atomic_state *state);
> +void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge);
> +#else
> +static inline void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
> +					     struct drm_atomic_state *state)
> +{
> +}
> +
> +void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
> +{
> +}
> +#endif /* CONFIG_DRM_RCAR_MIPI_DSI */
> +
> +#endif /* __RCAR_MIPI_DSI_H__ */

-- 
Regards,

Laurent Pinchart
