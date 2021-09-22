Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF934152F3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 23:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07FE6E04A;
	Wed, 22 Sep 2021 21:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFED56E04A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 21:39:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50B80F1;
 Wed, 22 Sep 2021 23:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1632346748;
 bh=DYpZ0OCw7FAJ4SrDNVOo9epk3NBl7KQwpzUgBBSG0+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wc8pIUa9/RM+NRjw7384XZo2Z5joQDgLbIPbcFqpzgbSDxUg3pxpuilNehK7z7uoH
 XCrJQp7eczM83fFKuiBuW6ZChyfpatmRVNa1xcCwMpcqXfYmmPsZK97bCgiRIYdX92
 ADF1zt4olSXB2jLRtfoM3GK8y/jfZRI324bD1/d0=
Date: Thu, 23 Sep 2021 00:39:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] drm: rcar-du: Add r8a779a0 device support
Message-ID: <YUuievQoU7yDPfzF@pendragon.ideasonboard.com>
References: <20210901234907.1608896-1-kieran.bingham@ideasonboard.com>
 <20210901234907.1608896-6-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210901234907.1608896-6-kieran.bingham@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

Thank you for the patch.

On Thu, Sep 02, 2021 at 12:49:07AM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Extend the rcar_du_device_info structure and rcar_du_output enum to
> support DSI outputs and utilise these additions to provide support for
> the R8A779A0 V3U platform.
> 
> While the DIDSR register field is now named "DSI/CSI-2-TX-IF0 Dot Clock
> Select" the existing define LVDS0 is used, and is directly compatible
> from other DU variants.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> ---
> 
> I can add a macro named DIDSR_LDCS_DSI0 duplicating DIDSR_LDCS_LVDS0 if
> it's deemed better.

I think I'd like that a bit better if you don't mind. I'd name the macro
DIDSR_LDCS_DSI though, as there's a single option (you can't pick one
DSI encoder or the other as the clock source, it's DSI0 for DU0 and DSI1
for DU1).

> 
> v2:
>  - No longer requires a direct interface with the DSI encoder
>  - Use correct field naming (LDCS)
>  - Remove per-crtc clock feature.
> 
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h  |  2 ++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 20 ++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  2 ++
>  drivers/gpu/drm/rcar-du/rcar_du_group.c |  2 ++
>  4 files changed, 26 insertions(+)
> 
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
> index 8a094d5b9c77..8b4c8851b6bc 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -489,6 +489,25 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
>  	.lvds_clk_mask =  BIT(1) | BIT(0),
>  };
>  
> +static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
> +	.gen = 3,
> +	.features = RCAR_DU_FEATURE_CRTC_IRQ
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
> +	.dsi_clk_mask =  BIT(1) | BIT(0),
> +};
> +
>  static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
>  	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
> @@ -513,6 +532,7 @@ static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a77980", .data = &rcar_du_r8a77970_info },
>  	{ .compatible = "renesas,du-r8a77990", .data = &rcar_du_r8a7799x_info },
>  	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
> +	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },

While this looks good, the DT bindings need a v3, so I can't include
this series in a pull request just yet :-( Could you please group the DT
bindings and driver patches in a single series for v3 ?

>  	{ }
>  };
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index 5fe9152454ff..cf98d43d72d0 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -57,6 +57,7 @@ struct rcar_du_output_routing {
>   * @routes: array of CRTC to output routes, indexed by output (RCAR_DU_OUTPUT_*)
>   * @num_lvds: number of internal LVDS encoders
>   * @dpll_mask: bit mask of DU channels equipped with a DPLL
> + * @dsi_clk_mask: bitmask of channels that can use the DSI clock as dot clock
>   * @lvds_clk_mask: bitmask of channels that can use the LVDS clock as dot clock
>   */
>  struct rcar_du_device_info {
> @@ -67,6 +68,7 @@ struct rcar_du_device_info {
>  	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
>  	unsigned int num_lvds;
>  	unsigned int dpll_mask;
> +	unsigned int dsi_clk_mask;
>  	unsigned int lvds_clk_mask;
>  };
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index a984eef265d2..27c912bab76e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -124,6 +124,8 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
>  		if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index))
>  			didsr |= DIDSR_LDCS_LVDS0(i)
>  			      |  DIDSR_PDCS_CLK(i, 0);
> +		else if (rcdu->info->dsi_clk_mask & BIT(rcrtc->index))
> +			didsr |= DIDSR_LDCS_LVDS0(i);
>  		else
>  			didsr |= DIDSR_LDCS_DCLKIN(i)
>  			      |  DIDSR_PDCS_CLK(i, 0);

-- 
Regards,

Laurent Pinchart
