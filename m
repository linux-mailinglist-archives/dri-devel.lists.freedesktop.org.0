Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B79F2D9B23
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 16:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB956E17A;
	Mon, 14 Dec 2020 15:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6C16E17A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 15:36:10 +0000 (UTC)
Received: from [192.168.0.217]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9FC696;
 Mon, 14 Dec 2020 16:36:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607960168;
 bh=SLbaavwzyjzNeLAySzrcSTpLQQGJVDEE+Fz4ZConsIw=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=f8IPITmsW4NvJa0z4iUDFU0XypNes2TbPMrqebsENjAXWaMXFUFsNiIWbYrZ4f0wb
 G1BEzasN0NP/o/jDTqje3g01ReNUDJH3wcggvAOJ+Q4BCmbvtG7bg1pG+E2Y7nsWhr
 uLBC8mJcRYOtTwaM4ZupPnJ5C265STM4dRgadHUM=
Subject: Re: [PATCH 1/9] drm: rcar-du: Fix crash when using LVDS1 clock for
 CRTC
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-2-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <0d9c922b-43b2-3dce-5daf-d75762bf62ef@ideasonboard.com>
Date: Mon, 14 Dec 2020 15:36:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201204220139.15272-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-GB
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
Reply-To: kieran.bingham@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 04/12/2020 22:01, Laurent Pinchart wrote:
> On D3 and E3 platforms, the LVDS encoder includes a PLL that can
> generate a clock for the corresponding CRTC, used even when the CRTC
> output to a non-LVDS port. This mechanism is supported by the driver,
> but the implementation is broken in dual-link LVDS mode. In that case,
> the LVDS1 drm_encoder is skipped, which causes a crash when trying to
> access its bridge later on.
> 
> Fix this by storing bridge pointers internally instead of retrieving
> them from the encoder.
> 

This looks cleaner too IMO.
Win win, bug fix and nicer code.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
> 

-- 
Regards
--
Kieran
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
