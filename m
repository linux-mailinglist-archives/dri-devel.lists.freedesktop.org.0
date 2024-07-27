Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9B593DCC9
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 03:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D260110E2C5;
	Sat, 27 Jul 2024 01:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H4uaMl0U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C5110E2C5
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 01:00:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7EA6720;
 Sat, 27 Jul 2024 02:59:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1722041995;
 bh=9dSQnstnKCSrEUtiMPgMx7SlcoEAcg86wKiIJnX/3EM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H4uaMl0UP05O5xxSbkPyboaQ8S5vdw0VCNI/KFakAD3rIz9cLb3tG0lZ8HcE9U12d
 4FPCJQr4yMeUr1jc0+hDxQKIer4XY2cTSMYplba2SpsoqPRe+fnrMNRYDm5ir/eYm4
 o+JDTK+7UFfiURGattv73tmKkY/q7sA2FexdZ9rc=
Date: Sat, 27 Jul 2024 04:00:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v2 5/9] drm: renesas: rz-du: Add RZ/G2UL DU Support
Message-ID: <20240727010021.GG300@pendragon.ideasonboard.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
 <20240709135152.185042-6-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709135152.185042-6-biju.das.jz@bp.renesas.com>
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

On Tue, Jul 09, 2024 at 02:51:43PM +0100, Biju Das wrote:
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
> v1->v2:
>  * No change.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  9 ++++++++-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 11 +++++++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> index 6e7aac6219be..b1812f947252 100644
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
> @@ -216,9 +217,15 @@ static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *rcrtc)
>  
>  static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool start)
>  {
> +	struct rzg2l_du_crtc_state *rstate =
> +					to_rzg2l_crtc_state(rcrtc->crtc.state);

I think you can avoid the line break here.

>  	struct rzg2l_du_device *rcdu = rcrtc->dev;
> +	u32 val = DU_MCR0_DI_EN;
>  
> -	writel(start ? DU_MCR0_DI_EN : 0, rcdu->mmio + DU_MCR0);
> +	if (rstate->outputs == BIT(RZG2L_DU_OUTPUT_DPAD0))
> +		val |= DU_MCR0_DPI_OE;
> +
> +	writel(start ? val : 0, rcdu->mmio + DU_MCR0);
>  }
>  
>  static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> index e5eca8691a33..34534441b7ec 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -25,6 +25,16 @@
>   * Device Information
>   */
>  
> +static const struct rzg2l_du_device_info rzg2l_du_r9a07g043u_info = {
> +	.channels_mask = BIT(0),
> +	.routes = {
> +		[RZG2L_DU_OUTPUT_DPAD0] = {
> +			.possible_outputs = BIT(0),
> +			.port = 1,

This may need to be port 0 depending on the outcome of the discussion on
the DT bindings.

> +		},
> +	},
> +};
> +
>  static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
>  	.channels_mask = BIT(0),
>  	.routes = {
> @@ -40,6 +50,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
>  };
>  
>  static const struct of_device_id rzg2l_du_of_table[] = {
> +	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
>  	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
>  	{ /* sentinel */ }
>  };

-- 
Regards,

Laurent Pinchart
