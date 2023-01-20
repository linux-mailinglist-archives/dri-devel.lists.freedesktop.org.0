Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EC6675AB7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 18:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8119610E02A;
	Fri, 20 Jan 2023 17:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB59C10E02A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 17:03:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC09E514;
 Fri, 20 Jan 2023 18:03:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674234216;
 bh=PhKYN5s6MD3tHvv73LU0gZfRaSkpZr1PTiF4xiA0PrM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g0Itv/AMZX4mypq97cDX1eiUEHEEEQ10qUo+GjhdCh4dPOCFqL82hziFwceo8bXZ1
 Ck8rPK/g1pudxws2po0tfGAWUD1Grri47RAgenOicVOnLLS+DKAUWyYs7sbBrahtAE
 SejA0g3hpqLngIm4Ac2e/QzDnsYqnGSlBnpUMfZA=
Date: Fri, 20 Jan 2023 19:03:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 6/7] drm: rcar-du: Fix setting a reserved bit in DPLLCR
Message-ID: <Y8rJZXlqjp3f37Rk@pendragon.ideasonboard.com>
References: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230120085009.604797-7-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230120085009.604797-7-tomi.valkeinen+renesas@ideasonboard.com>
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
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Fri, Jan 20, 2023 at 10:50:08AM +0200, Tomi Valkeinen wrote:
> On H3 ES1.x two bits in DPLLCR are used to select the DU input dot clock
> source. These are bits 20 and 21 for DU2, and bits 22 and 23 for DU1. On
> non-ES1.x, only the higher bits are used (bits 21 and 23), and the lower
> bits are reserved and should be set to 0.
> 
> The current code always sets the lower bits, even on non-ES1.x.
> 
> For both DU1 and DU2, on all SoC versions, when writing zeroes to those
> bits the input clock is DCLKIN, and thus there's no difference between
> ES1.x and non-ES1.x.
> 
> For DU1, writing 0b10 to the bits (or only writing the higher bit)
> results in using PLL0 as the input clock, so in this case there's also
> no difference between ES1.x and non-ES1.x.
> 
> However, for DU2, writing 0b10 to the bits results in using PLL0 as the
> input clock on ES1.x, whereas on non-ES1.x it results in using PLL1. On
> ES1.x you need to write 0b11 to select PLL1.
> 
> The current code always writes 0b11 to PLCS0 field to select PLL1 on all
> SoC versions, which works but causes an illegal (in the sense of not
> allowed by the documentation) write to a reserved bit field.
> 
> To remove the illegal bit write on PLSC0 we need to handle the input dot
> clock selection differently for ES1.x and non-ES1.x.
> 
> Add a new quirk, RCAR_DU_QUIRK_H3_ES1_PLL, for this. This way we can
> always set the bit 21 on PLSC0 when choosing the PLL as the source
> clock, and additionally set the bit 20 when on ES1.x.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 23 ++++++++++++++++++++---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c  |  3 ++-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  1 +
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h |  8 ++------
>  4 files changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index f2d3266509cc..b7dd59fe119e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -245,13 +245,30 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>  		       | DPLLCR_N(dpll.n) | DPLLCR_M(dpll.m)
>  		       | DPLLCR_STBY;
>  
> -		if (rcrtc->index == 1)
> +		if (rcrtc->index == 1) {
>  			dpllcr |= DPLLCR_PLCS1
>  			       |  DPLLCR_INCS_DOTCLKIN1;
> -		else
> -			dpllcr |= DPLLCR_PLCS0
> +		} else {
> +			dpllcr |= DPLLCR_PLCS0_PLL
>  			       |  DPLLCR_INCS_DOTCLKIN0;
>  
> +			/*
> +			 * On ES2.x we have a single mux controlled via bit 21,
> +			 * which selects between DCLKIN source (bit 21 = 0) and
> +			 * a PLL source (bit 21 = 1), where the PLL is always
> +			 * PLL1.
> +			 *
> +			 * On ES1.x we have an additional mux, controlled
> +			 * via bit 20, for choosing between PLL0 (bit 20 = 0)
> +			 * and PLL1 (bit 20 = 1). We always want to use PLL1,
> +			 * so on ES1.x, in addition to setting bit 21, we need
> +			 * to set the bit 20.
> +			 */
> +
> +			if (rcdu->info->quirks & RCAR_DU_QUIRK_H3_ES1_PLL)
> +				dpllcr |= DPLLCR_PLCS0_H3ES1X_PLL1;
> +		}
> +
>  		rcar_du_group_write(rcrtc->group, DPLLCR, dpllcr);
>  
>  		escr = ESCR_DCLKSEL_DCLKIN | div;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index ea3a8cff74b7..82f9718ff500 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -394,7 +394,8 @@ static const struct rcar_du_device_info rcar_du_r8a7795_es1_info = {
>  		  | RCAR_DU_FEATURE_VSP1_SOURCE
>  		  | RCAR_DU_FEATURE_INTERLACED
>  		  | RCAR_DU_FEATURE_TVM_SYNC,
> -	.quirks = RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY,
> +	.quirks = RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY
> +		| RCAR_DU_QUIRK_H3_ES1_PLL,
>  	.channels_mask = BIT(3) | BIT(2) | BIT(1) | BIT(0),
>  	.routes = {
>  		/*
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index df87ccab146f..acc3673fefe1 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -35,6 +35,7 @@ struct rcar_du_device;
>  
>  #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
>  #define RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY BIT(1)	/* H3 ES1 has pclk stability issue */
> +#define RCAR_DU_QUIRK_H3_ES1_PLL	BIT(2)	/* H3 ES1 PLL setup differs from non-ES1 */
>  
>  enum rcar_du_output {
>  	RCAR_DU_OUTPUT_DPAD0,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> index c1bcb0e8b5b4..789ae9285108 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> @@ -283,12 +283,8 @@
>  #define DPLLCR			0x20044
>  #define DPLLCR_CODE		(0x95 << 24)
>  #define DPLLCR_PLCS1		(1 << 23)
> -/*
> - * PLCS0 is bit 21, but H3 ES1.x requires bit 20 to be set as well. As bit 20
> - * isn't implemented by other SoC in the Gen3 family it can safely be set
> - * unconditionally.
> - */
> -#define DPLLCR_PLCS0		(3 << 20)
> +#define DPLLCR_PLCS0_PLL	(1 << 21)
> +#define DPLLCR_PLCS0_H3ES1X_PLL1	(1 << 20)
>  #define DPLLCR_CLKE		(1 << 18)
>  #define DPLLCR_FDPLL(n)		((n) << 12)
>  #define DPLLCR_N(n)		((n) << 5)

-- 
Regards,

Laurent Pinchart
