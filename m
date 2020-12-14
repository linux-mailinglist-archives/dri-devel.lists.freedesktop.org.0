Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6262D95CC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 11:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8548E6E11E;
	Mon, 14 Dec 2020 10:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63ED6E11E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 10:06:17 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 6DA793B7EEF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 09:43:35 +0000 (UTC)
X-Originating-IP: 95.245.192.76
Received: from uno.localdomain (host-95-245-192-76.retail.telecomitalia.it
 [95.245.192.76]) (Authenticated sender: jacopo@jmondi.org)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 2733260002;
 Mon, 14 Dec 2020 09:43:09 +0000 (UTC)
Date: Mon, 14 Dec 2020 10:43:20 +0100
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 1/9] drm: rcar-du: Fix crash when using LVDS1 clock for
 CRTC
Message-ID: <20201214094320.6hsku3e2ydvlkgqb@uno.localdomain>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204220139.15272-2-laurent.pinchart+renesas@ideasonboard.com>
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
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Sat, Dec 05, 2020 at 12:01:31AM +0200, Laurent Pinchart wrote:
> On D3 and E3 platforms, the LVDS encoder includes a PLL that can
> generate a clock for the corresponding CRTC, used even when the CRTC
> output to a non-LVDS port. This mechanism is supported by the driver,
> but the implementation is broken in dual-link LVDS mode. In that case,
> the LVDS1 drm_encoder is skipped, which causes a crash when trying to
> access its bridge later on.

Looking at a dts example with both lvds encoders and RGB output
enabled, I might have missed why the LVDS1 encoder is skipped.

>
> Fix this by storing bridge pointers internally instead of retrieving
> them from the encoder.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The patch itself looks good!
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 10 ++--------
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h     |  3 +++
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  4 ++++
>  3 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index b5fb941e0f53..e23b9c7b4afe 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -730,13 +730,10 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  	 */
>  	if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) &&
>  	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
> -		struct rcar_du_encoder *encoder =
> -			rcdu->encoders[RCAR_DU_OUTPUT_LVDS0 + rcrtc->index];
> +		struct drm_bridge *bridge = rcdu->lvds[rcrtc->index];
>  		const struct drm_display_mode *mode =
>  			&crtc->state->adjusted_mode;
> -		struct drm_bridge *bridge;
>
> -		bridge = drm_bridge_chain_get_first_bridge(&encoder->base);
>  		rcar_lvds_clk_enable(bridge, mode->clock * 1000);
>  	}
>
> @@ -764,15 +761,12 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
>
>  	if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) &&
>  	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
> -		struct rcar_du_encoder *encoder =
> -			rcdu->encoders[RCAR_DU_OUTPUT_LVDS0 + rcrtc->index];
> -		struct drm_bridge *bridge;
> +		struct drm_bridge *bridge = rcdu->lvds[rcrtc->index];
>
>  		/*
>  		 * Disable the LVDS clock output, see
>  		 * rcar_du_crtc_atomic_enable().
>  		 */
> -		bridge = drm_bridge_chain_get_first_bridge(&encoder->base);
>  		rcar_lvds_clk_disable(bridge);
>  	}
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index 61504c54e2ec..71732fc5df8f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -20,6 +20,7 @@
>
>  struct clk;
>  struct device;
> +struct drm_bridge;
>  struct drm_device;
>  struct drm_property;
>  struct rcar_du_device;
> @@ -71,6 +72,7 @@ struct rcar_du_device_info {
>  #define RCAR_DU_MAX_CRTCS		4
>  #define RCAR_DU_MAX_GROUPS		DIV_ROUND_UP(RCAR_DU_MAX_CRTCS, 2)
>  #define RCAR_DU_MAX_VSPS		4
> +#define RCAR_DU_MAX_LVDS		2
>
>  struct rcar_du_device {
>  	struct device *dev;
> @@ -88,6 +90,7 @@ struct rcar_du_device {
>  	struct rcar_du_group groups[RCAR_DU_MAX_GROUPS];
>  	struct platform_device *cmms[RCAR_DU_MAX_CRTCS];
>  	struct rcar_du_vsp vsps[RCAR_DU_MAX_VSPS];
> +	struct drm_bridge *lvds[RCAR_DU_MAX_LVDS];
>
>  	struct {
>  		struct drm_property *colorkey;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index b0335da0c161..2d40da98144b 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -91,6 +91,10 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  			ret = -EPROBE_DEFER;
>  			goto done;
>  		}
> +
> +		if (output == RCAR_DU_OUTPUT_LVDS0 ||
> +		    output == RCAR_DU_OUTPUT_LVDS1)
> +			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] = bridge;
>  	}
>
>  	/*
> --
> Regards,
>
> Laurent Pinchart
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
