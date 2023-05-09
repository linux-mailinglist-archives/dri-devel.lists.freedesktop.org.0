Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ED06FC5BC
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 14:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4961810E0AB;
	Tue,  9 May 2023 12:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F54210E141
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 12:01:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net
 [126.90.219.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B5DA8D;
 Tue,  9 May 2023 14:01:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683633698;
 bh=rYlJf263/PtNuCOBr5voLeTxg4q5CGxv8QuS63srN0g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SyNOejiTVudg54qRLJPHp6a/NFNPIyMCnFxoV4zo+GyjpmAtGPaPSKtZ6cs65Gh+4
 ERhHHiDS/+Cd/HGb1OkncX7iIFZZK4dPqHiW7TCKan1kRBeHRQPs2399HwI68U2HgD
 X1dVDxs3bFpv8VTStj2OPULT6Jp7mOeaCbyA3TK8=
Date: Tue, 9 May 2023 15:01:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] drm: rcar-du: remove R-Car H3 ES1.* workarounds
Message-ID: <20230509120156.GB10510@pendragon.ideasonboard.com>
References: <20230509074818.4399-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230509074818.4399-1-wsa+renesas@sang-engineering.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wolfram,

Thank you for the patch.

On Tue, May 09, 2023 at 09:48:17AM +0200, Wolfram Sang wrote:
> R-Car H3 ES1.* was only available to an internal development group and
> needed a lot of quirks and workarounds. These become a maintenance
> burden now, so our development group decided to remove upstream support
> for this SoC and prevent booting it. Public users only have ES2 onwards.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> 
> This is the last ES1 bit remaining, would be awesome if it could go
> soon.
> 
> Changes since v1:
> * rebased to 6.4-rc1 (no code updates needed)
> * added Kieran's tag (thanks!)
> * mention in commit message that ES1 doesn't even boot anymore
> 
> 
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 37 ++------------------
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c  | 48 --------------------------
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  2 --
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h |  3 +-
>  4 files changed, 4 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index d6d29be6b4f4..7e175dbfd892 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -223,20 +223,6 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>  		 * DU channels that have a display PLL can't use the internal
>  		 * system clock, and have no internal clock divider.
>  		 */
> -
> -		/*
> -		 * The H3 ES1.x exhibits dot clock duty cycle stability issues.
> -		 * We can work around them by configuring the DPLL to twice the
> -		 * desired frequency, coupled with a /2 post-divider. Restrict
> -		 * the workaround to H3 ES1.x as ES2.0 and all other SoCs have
> -		 * no post-divider when a display PLL is present (as shown by
> -		 * the workaround breaking HDMI output on M3-W during testing).
> -		 */
> -		if (rcdu->info->quirks & RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY) {
> -			target *= 2;
> -			div = 1;
> -		}
> -
>  		extclk = clk_get_rate(rcrtc->extclock);
>  		rcar_du_dpll_divider(rcrtc, &dpll, extclk, target);
>  
> @@ -245,30 +231,13 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>  		       | DPLLCR_N(dpll.n) | DPLLCR_M(dpll.m)
>  		       | DPLLCR_STBY;
>  
> -		if (rcrtc->index == 1) {
> +		if (rcrtc->index == 1)
>  			dpllcr |= DPLLCR_PLCS1
>  			       |  DPLLCR_INCS_DOTCLKIN1;
> -		} else {
> -			dpllcr |= DPLLCR_PLCS0_PLL
> +		else
> +			dpllcr |= DPLLCR_PLCS0
>  			       |  DPLLCR_INCS_DOTCLKIN0;
>  
> -			/*
> -			 * On ES2.x we have a single mux controlled via bit 21,
> -			 * which selects between DCLKIN source (bit 21 = 0) and
> -			 * a PLL source (bit 21 = 1), where the PLL is always
> -			 * PLL1.
> -			 *
> -			 * On ES1.x we have an additional mux, controlled
> -			 * via bit 20, for choosing between PLL0 (bit 20 = 0)
> -			 * and PLL1 (bit 20 = 1). We always want to use PLL1,
> -			 * so on ES1.x, in addition to setting bit 21, we need
> -			 * to set the bit 20.
> -			 */
> -
> -			if (rcdu->info->quirks & RCAR_DU_QUIRK_H3_ES1_PLL)
> -				dpllcr |= DPLLCR_PLCS0_H3ES1X_PLL1;
> -		}
> -
>  		rcar_du_group_write(rcrtc->group, DPLLCR, dpllcr);
>  
>  		escr = ESCR_DCLKSEL_DCLKIN | div;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index b9a94c5260e9..1ffde19cb87f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -16,7 +16,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/slab.h>
> -#include <linux/sys_soc.h>
>  #include <linux/wait.h>
>  
>  #include <drm/drm_atomic_helper.h>
> @@ -387,43 +386,6 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
>  	.dpll_mask =  BIT(2) | BIT(1),
>  };
>  
> -static const struct rcar_du_device_info rcar_du_r8a7795_es1_info = {
> -	.gen = 3,
> -	.features = RCAR_DU_FEATURE_CRTC_IRQ
> -		  | RCAR_DU_FEATURE_CRTC_CLOCK
> -		  | RCAR_DU_FEATURE_VSP1_SOURCE
> -		  | RCAR_DU_FEATURE_INTERLACED
> -		  | RCAR_DU_FEATURE_TVM_SYNC,
> -	.quirks = RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY
> -		| RCAR_DU_QUIRK_H3_ES1_PLL,
> -	.channels_mask = BIT(3) | BIT(2) | BIT(1) | BIT(0),
> -	.routes = {
> -		/*
> -		 * R8A7795 has one RGB output, two HDMI outputs and one
> -		 * LVDS output.
> -		 */
> -		[RCAR_DU_OUTPUT_DPAD0] = {
> -			.possible_crtcs = BIT(3),
> -			.port = 0,
> -		},
> -		[RCAR_DU_OUTPUT_HDMI0] = {
> -			.possible_crtcs = BIT(1),
> -			.port = 1,
> -		},
> -		[RCAR_DU_OUTPUT_HDMI1] = {
> -			.possible_crtcs = BIT(2),
> -			.port = 2,
> -		},
> -		[RCAR_DU_OUTPUT_LVDS0] = {
> -			.possible_crtcs = BIT(0),
> -			.port = 3,
> -		},
> -	},
> -	.num_lvds = 1,
> -	.num_rpf = 5,
> -	.dpll_mask =  BIT(2) | BIT(1),
> -};
> -
>  static const struct rcar_du_device_info rcar_du_r8a7796_info = {
>  	.gen = 3,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ
> @@ -614,11 +576,6 @@ static const struct of_device_id rcar_du_of_table[] = {
>  
>  MODULE_DEVICE_TABLE(of, rcar_du_of_table);
>  
> -static const struct soc_device_attribute rcar_du_soc_table[] = {
> -	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &rcar_du_r8a7795_es1_info },
> -	{ /* sentinel */ }
> -};
> -
>  const char *rcar_du_output_name(enum rcar_du_output output)
>  {
>  	static const char * const names[] = {
> @@ -707,7 +664,6 @@ static void rcar_du_shutdown(struct platform_device *pdev)
>  
>  static int rcar_du_probe(struct platform_device *pdev)
>  {
> -	const struct soc_device_attribute *soc_attr;
>  	struct rcar_du_device *rcdu;
>  	unsigned int mask;
>  	int ret;
> @@ -725,10 +681,6 @@ static int rcar_du_probe(struct platform_device *pdev)
>  
>  	rcdu->info = of_device_get_match_data(rcdu->dev);
>  
> -	soc_attr = soc_device_match(rcar_du_soc_table);
> -	if (soc_attr)
> -		rcdu->info = soc_attr->data;
> -
>  	platform_set_drvdata(pdev, rcdu);
>  
>  	/* I/O resources */
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index acc3673fefe1..5cfa2bb7ad93 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -34,8 +34,6 @@ struct rcar_du_device;
>  #define RCAR_DU_FEATURE_NO_BLENDING	BIT(5)	/* PnMR.SPIM does not have ALP nor EOR bits */
>  
>  #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
> -#define RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY BIT(1)	/* H3 ES1 has pclk stability issue */
> -#define RCAR_DU_QUIRK_H3_ES1_PLL	BIT(2)	/* H3 ES1 PLL setup differs from non-ES1 */
>  
>  enum rcar_du_output {
>  	RCAR_DU_OUTPUT_DPAD0,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> index 6c750fab6ebb..391de6661d8b 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> @@ -283,8 +283,7 @@
>  #define DPLLCR			0x20044
>  #define DPLLCR_CODE		(0x95 << 24)
>  #define DPLLCR_PLCS1		(1 << 23)
> -#define DPLLCR_PLCS0_PLL	(1 << 21)
> -#define DPLLCR_PLCS0_H3ES1X_PLL1	(1 << 20)
> +#define DPLLCR_PLCS0		(1 << 21)
>  #define DPLLCR_CLKE		(1 << 18)
>  #define DPLLCR_FDPLL(n)		((n) << 12)
>  #define DPLLCR_N(n)		((n) << 5)

-- 
Regards,

Laurent Pinchart
