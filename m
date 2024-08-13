Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8E8950D62
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 21:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B9B10E3F5;
	Tue, 13 Aug 2024 19:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="flBrEWG+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED2910E3F4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 19:49:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFBDD4AB;
 Tue, 13 Aug 2024 21:48:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1723578507;
 bh=qfGOTiyJ3KnWalfFG5WZN8xh8TCaNyCkVWaZBY6HhPs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=flBrEWG+yF+lTsVhYRwF1ZhdXP+WiM5sSgjPai/Z4hsPvFxQRKDR3xeqCSyiUEMY1
 MilUBbcIEjnXeNfi9rrXCqMFMHzQ+9duQJWnCyUFFMpazDRz7i5x9NenuAiCw55UFH
 r8qaV/ZpDgSiYwqeTI5gcrN8oD2psenzjQctjf2s=
Date: Tue, 13 Aug 2024 22:48:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v3 2/4] drm: renesas: rz-du: Add RZ/G2UL DU Support
Message-ID: <20240813194859.GI24634@pendragon.ideasonboard.com>
References: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
 <20240805155242.151661-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240805155242.151661-3-biju.das.jz@bp.renesas.com>
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

Hi Biju,

Thank you for the patch.

On Mon, Aug 05, 2024 at 04:52:36PM +0100, Biju Das wrote:
> The LCD controller is composed of Frame Compression Processor (FCPVD),
> Video Signal Processor (VSPD), and Display Unit (DU).
> 
> It has DPI interface and supports a maximum resolution of WXGA along
> with 2 RPFs to support the blending of two picture layers and raster
> operations (ROPs).
> 
> The DU module is connected to VSPD. Add RZ/G2UL DU support.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Avoided the line break in rzg2l_du_start_stop() for rstate.
>  * Replaced port->du_output in  struct rzg2l_du_output_routing and
>    dropped using the port number to indicate the output type in
>    rzg2l_du_encoders_init().
>  * Updated rzg2l_du_r9a07g043u_info and rzg2l_du_r9a07g044_info
> v1->v2:
>  * No change.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  8 +++++++-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 18 ++++++++++++++++--
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  5 +++--
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |  4 ++--
>  4 files changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> index 6e7aac6219be..fd7675c7f181 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> @@ -28,6 +28,7 @@
>  #include "rzg2l_du_vsp.h"
>  
>  #define DU_MCR0			0x00
> +#define DU_MCR0_DPI_OE		BIT(0)
>  #define DU_MCR0_DI_EN		BIT(8)
>  
>  #define DU_DITR0		0x10
> @@ -216,9 +217,14 @@ static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *rcrtc)
>  
>  static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool start)
>  {
> +	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(rcrtc->crtc.state);
>  	struct rzg2l_du_device *rcdu = rcrtc->dev;
> +	u32 val = DU_MCR0_DI_EN;
>  
> -	writel(start ? DU_MCR0_DI_EN : 0, rcdu->mmio + DU_MCR0);
> +	if (rstate->outputs == BIT(RZG2L_DU_OUTPUT_DPAD0))

Is output supposed to contain a single bit, or can it contain multiple
bits ? In the first case I would rename it to output, in the second case
you should probably use '&' instead of '=='.

> +		val |= DU_MCR0_DPI_OE;
> +
> +	writel(start ? val : 0, rcdu->mmio + DU_MCR0);
>  }
>  
>  static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> index e5eca8691a33..69b8e216ee1a 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -25,21 +25,35 @@
>   * Device Information
>   */
>  
> +static const struct rzg2l_du_device_info rzg2l_du_r9a07g043u_info = {
> +	.channels_mask = BIT(0),
> +	.routes = {
> +		[RZG2L_DU_OUTPUT_DSI0] = {
> +			.du_output = RZG2L_DU_OUTPUT_INVALID,
> +		},

You can drop this entry, as well as the RZG2L_DU_OUTPUT_INVALID macro.
See below.

> +		[RZG2L_DU_OUTPUT_DPAD0] = {
> +			.possible_outputs = BIT(0),
> +			.du_output = RZG2L_DU_OUTPUT_DPAD0,
> +		},
> +	},
> +};
> +
>  static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
>  	.channels_mask = BIT(0),
>  	.routes = {
>  		[RZG2L_DU_OUTPUT_DSI0] = {
>  			.possible_outputs = BIT(0),
> -			.port = 0,
> +			.du_output = RZG2L_DU_OUTPUT_DSI0,
>  		},
>  		[RZG2L_DU_OUTPUT_DPAD0] = {
>  			.possible_outputs = BIT(0),
> -			.port = 1,
> +			.du_output = RZG2L_DU_OUTPUT_DPAD0,
>  		}
>  	}
>  };
>  
>  static const struct of_device_id rzg2l_du_of_table[] = {
> +	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
>  	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
>  	{ /* sentinel */ }
>  };
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> index 58806c2a8f2b..ab82b5c86d6e 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> @@ -29,7 +29,7 @@ enum rzg2l_du_output {
>  /*
>   * struct rzg2l_du_output_routing - Output routing specification
>   * @possible_outputs: bitmask of possible outputs
> - * @port: device tree port number corresponding to this output route
> + * @du_output: DU output
>   *
>   * The DU has 2 possible outputs (DPAD0, DSI0). Output routing data
>   * specify the valid SoC outputs, which CRTC can drive the output, and the type
> @@ -37,7 +37,7 @@ enum rzg2l_du_output {
>   */
>  struct rzg2l_du_output_routing {
>  	unsigned int possible_outputs;
> -	unsigned int port;
> +	unsigned int du_output;
>  };
>  
>  /*
> @@ -53,6 +53,7 @@ struct rzg2l_du_device_info {
>  #define RZG2L_DU_MAX_CRTCS		1
>  #define RZG2L_DU_MAX_VSPS		1
>  #define RZG2L_DU_MAX_DSI		1
> +#define RZG2L_DU_OUTPUT_INVALID		-1
>  
>  struct rzg2l_du_device {
>  	struct device *dev;
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> index 07b312b6f81e..361350f2999e 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> @@ -183,8 +183,8 @@ static int rzg2l_du_encoders_init(struct rzg2l_du_device *rcdu)
>  
>  		/* Find the output route corresponding to the port number. */
>  		for (i = 0; i < RZG2L_DU_OUTPUT_MAX; ++i) {
> -			if (rcdu->info->routes[i].port == ep.port) {
> -				output = i;
> +			if (i == rcdu->info->routes[i].du_output) {

If I understand the code correctly, this will always be true except for
the routes marked with RZG2L_DU_OUTPUT_INVALID, so you will match the
first valid route, regardless of the value of ep.port. I don't think
that's correct.

I would keep the port field in the rzg2l_du_output_routing, drop the
newly added du_output field, and use the following logic:

		for (i = 0; i < RZG2L_DU_OUTPUT_MAX; ++i) {
			if (rcdu->info->routes[i].possible_outputs &&
			    rcdu->info->routes[i].port == ep.port) {
				output = i;
				break;
			}
		}

Testing possible_outputs skips the routes that don't exist for the
device, and the ep.port comparison picks the route corresponding to the
port.

> +				output = rcdu->info->routes[i].du_output;
>  				break;
>  			}
>  		}

-- 
Regards,

Laurent Pinchart
