Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9686E6761A9
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 00:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA3610E124;
	Fri, 20 Jan 2023 23:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9553010E124
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 23:36:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AF7C308;
 Sat, 21 Jan 2023 00:36:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674257808;
 bh=kBO70tmmYu9rpZyyIgAGlyRj57sHNcqm4FoRu5+x0Fc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DRbOSM4fRWTdNiglF3pPr9FItUTX4cde+12ksTFuixHBovHF8vkJ2oOZxi4kNE47L
 wV+tZmzTU3UpQQ6JRiG764bLGEUmYAwL6a5d8B+G7lHGI4GnrmfiWCzbkGyydCg9Cw
 rAqw60UJ2bdsp8oTrAop53efXQZ2D+4HPA5IbekM=
Date: Sat, 21 Jan 2023 01:36:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 0/7] drm: rcar-du: Misc patches
Message-ID: <Y8sljQ/jAyJf8kb1@pendragon.ideasonboard.com>
References: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Fri, Jan 20, 2023 at 10:50:02AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Hi,
> 
> v2 of the series. Diff to v1 can be found below.
> 
> The main changes are:
> - Runtime PM support for LVDS
> - Skip rcar_du_group_setup() for gen4+
> 
>  Tomi
> 
> Koji Matsuoka (1):
>   drm: rcar-du: lvds: Fix stop sequence
> 
> Tomi Valkeinen (6):
>   drm: rcar-du: dsi: add 'select RESET_CONTROLLER'
>   drm: rcar-du: lvds: Add runtime PM
>   drm: rcar-du: lvsd: Add reset control
>   drm: rcar-du: Add quirk for H3 ES1.x pclk workaround
>   drm: rcar-du: Fix setting a reserved bit in DPLLCR
>   drm: rcar-du: Stop accessing non-existant registers on gen4

For patches 1/7 to 6/7,

Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

on D3, H3 ES2 and M3N.

I wanted to test this on H3 ES1.x too, but the boot loader on that board
is ancient and doesn't fit with my workflow anymore. I fear updating
them would be a deep rabbit hole. If I find spare time, I'll give it a
try.

>  drivers/gpu/drm/rcar-du/Kconfig         |  2 +
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 39 +++++++----
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 49 ++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  2 +
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 11 +++-
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h  |  8 +--
>  drivers/gpu/drm/rcar-du/rcar_lvds.c     | 86 +++++++++++++++++++++++--
>  7 files changed, 169 insertions(+), 28 deletions(-)
> 
> Interdiff against v1:
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 56b23333993c..008e172ed43b 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -249,15 +249,24 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>  			dpllcr |= DPLLCR_PLCS1
>  			       |  DPLLCR_INCS_DOTCLKIN1;
>  		} else {
> -			dpllcr |= DPLLCR_PLCS0
> +			dpllcr |= DPLLCR_PLCS0_PLL
>  			       |  DPLLCR_INCS_DOTCLKIN0;
> +
>  			/*
> -			 * On H3 ES1.x, in addition to setting bit 21 (PLCS0),
> -			 * also bit 20 has to be set to select PLL1 as the
> -			 * clock source.
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
>  			 */
> +
>  			if (rcdu->info->quirks & RCAR_DU_QUIRK_H3_ES1_PLL)
> -				dpllcr |= DPLLCR_PLCS0_H3ES1X_PLL1_SEL;
> +				dpllcr |= DPLLCR_PLCS0_H3ES1X_PLL1;
>  		}
>  
>  		rcar_du_group_write(rcrtc->group, DPLLCR, dpllcr);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index d689f2510081..82f9718ff500 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -710,10 +710,10 @@ static void rcar_du_shutdown(struct platform_device *pdev)
>  
>  static int rcar_du_probe(struct platform_device *pdev)
>  {
> +	const struct soc_device_attribute *soc_attr;
>  	struct rcar_du_device *rcdu;
>  	unsigned int mask;
>  	int ret;
> -	const struct soc_device_attribute *soc_attr;
>  
>  	if (drm_firmware_drivers_only())
>  		return -ENODEV;
> @@ -726,13 +726,12 @@ static int rcar_du_probe(struct platform_device *pdev)
>  
>  	rcdu->dev = &pdev->dev;
>  
> +	rcdu->info = of_device_get_match_data(rcdu->dev);
> +
>  	soc_attr = soc_device_match(rcar_du_soc_table);
>  	if (soc_attr)
>  		rcdu->info = soc_attr->data;
>  
> -	if (!rcdu->info)
> -		rcdu->info = of_device_get_match_data(rcdu->dev);
> -
>  	platform_set_drvdata(pdev, rcdu);
>  
>  	/* I/O resources */
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index c236e2aa8a01..c2209d427bb7 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -194,10 +194,13 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>   */
>  int rcar_du_group_get(struct rcar_du_group *rgrp)
>  {
> +	struct rcar_du_device *rcdu = rgrp->dev;
> +
>  	if (rgrp->use_count)
>  		goto done;
>  
> -	rcar_du_group_setup(rgrp);
> +	if (rcdu->info->gen < 4)
> +		rcar_du_group_setup(rgrp);
>  
>  done:
>  	rgrp->use_count++;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> index 94d913f66c8f..789ae9285108 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> @@ -283,13 +283,8 @@
>  #define DPLLCR			0x20044
>  #define DPLLCR_CODE		(0x95 << 24)
>  #define DPLLCR_PLCS1		(1 << 23)
> -/*
> - * PLCS0 is bit 21, but H3 ES1.x requires bit 20 to be set as well. As bit 20
> - * isn't implemented by other SoC in the Gen3 family it can safely be set
> - * unconditionally.
> - */
> -#define DPLLCR_PLCS0		(1 << 21)
> -#define DPLLCR_PLCS0_H3ES1X_PLL1_SEL	(1 << 20)
> +#define DPLLCR_PLCS0_PLL	(1 << 21)
> +#define DPLLCR_PLCS0_H3ES1X_PLL1	(1 << 20)
>  #define DPLLCR_CLKE		(1 << 18)
>  #define DPLLCR_FDPLL(n)		((n) << 12)
>  #define DPLLCR_N(n)		((n) << 5)
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 01800cef1c33..8fa5f7400179 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/sys_soc.h>
> @@ -82,14 +83,14 @@ struct rcar_lvds {
>  #define bridge_to_rcar_lvds(b) \
>  	container_of(b, struct rcar_lvds, bridge)
>  
> -static void rcar_lvds_write(struct rcar_lvds *lvds, u32 reg, u32 data)
> +static u32 rcar_lvds_read(struct rcar_lvds *lvds, u32 reg)
>  {
> -	iowrite32(data, lvds->mmio + reg);
> +	return ioread32(lvds->mmio + reg);
>  }
>  
> -static u32 rcar_lvds_read(struct rcar_lvds *lvds, u32 reg)
> +static void rcar_lvds_write(struct rcar_lvds *lvds, u32 reg, u32 data)
>  {
> -	return ioread32(lvds->mmio + reg);
> +	iowrite32(data, lvds->mmio + reg);
>  }
>  
>  /* -----------------------------------------------------------------------------
> @@ -323,10 +324,8 @@ int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq)
>  
>  	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
>  
> -	reset_control_deassert(lvds->rstc);
> -
> -	ret = clk_prepare_enable(lvds->clocks.mod);
> -	if (ret < 0)
> +	ret = pm_runtime_resume_and_get(lvds->dev);
> +	if (ret)
>  		return ret;
>  
>  	__rcar_lvds_pll_setup_d3_e3(lvds, freq, true);
> @@ -346,9 +345,7 @@ void rcar_lvds_pclk_disable(struct drm_bridge *bridge)
>  
>  	rcar_lvds_write(lvds, LVDPLLCR, 0);
>  
> -	clk_disable_unprepare(lvds->clocks.mod);
> -
> -	reset_control_assert(lvds->rstc);
> +	pm_runtime_put(lvds->dev);
>  }
>  EXPORT_SYMBOL_GPL(rcar_lvds_pclk_disable);
>  
> @@ -407,10 +404,8 @@ static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
>  	u32 lvdcr0;
>  	int ret;
>  
> -	reset_control_deassert(lvds->rstc);
> -
> -	ret = clk_prepare_enable(lvds->clocks.mod);
> -	if (ret < 0)
> +	ret = pm_runtime_resume_and_get(lvds->dev);
> +	if (ret)
>  		return;
>  
>  	/* Enable the companion LVDS encoder in dual-link mode. */
> @@ -576,6 +571,7 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>  		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>  	}
>  
> +	rcar_lvds_write(lvds, LVDCR0, 0);
>  	rcar_lvds_write(lvds, LVDCR1, 0);
>  	rcar_lvds_write(lvds, LVDPLLCR, 0);
>  
> @@ -584,8 +580,7 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>  		lvds->companion->funcs->atomic_disable(lvds->companion,
>  						       old_bridge_state);
>  
> -	clk_disable_unprepare(lvds->clocks.mod);
> -	reset_control_assert(lvds->rstc);
> +	pm_runtime_put(lvds->dev);
>  }
>  
>  static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
> @@ -878,11 +873,11 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	lvds->rstc = devm_reset_control_get(&pdev->dev, NULL);
> -	if (IS_ERR(lvds->rstc)) {
> -		dev_err(&pdev->dev, "failed to get cpg reset\n");
> -		return PTR_ERR(lvds->rstc);
> -	}
> +	lvds->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(lvds->rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(lvds->rstc),
> +				     "failed to get cpg reset\n");
> +	pm_runtime_enable(&pdev->dev);
>  
>  	drm_bridge_add(&lvds->bridge);
>  
> @@ -895,6 +890,8 @@ static int rcar_lvds_remove(struct platform_device *pdev)
>  
>  	drm_bridge_remove(&lvds->bridge);
>  
> +	pm_runtime_disable(&pdev->dev);
> +
>  	return 0;
>  }
>  
> @@ -953,11 +950,48 @@ static const struct of_device_id rcar_lvds_of_table[] = {
>  
>  MODULE_DEVICE_TABLE(of, rcar_lvds_of_table);
>  
> +static int rcar_lvds_runtime_suspend(struct device *dev)
> +{
> +	struct rcar_lvds *lvds = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(lvds->clocks.mod);
> +
> +	reset_control_assert(lvds->rstc);
> +
> +	return 0;
> +}
> +
> +static int rcar_lvds_runtime_resume(struct device *dev)
> +{
> +	struct rcar_lvds *lvds = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = reset_control_deassert(lvds->rstc);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(lvds->clocks.mod);
> +	if (ret < 0)
> +		goto err_reset_assert;
> +
> +	return 0;
> +
> +err_reset_assert:
> +	reset_control_assert(lvds->rstc);
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops rcar_lvds_pm_ops = {
> +	SET_RUNTIME_PM_OPS(rcar_lvds_runtime_suspend, rcar_lvds_runtime_resume, NULL)
> +};
> +
>  static struct platform_driver rcar_lvds_platform_driver = {
>  	.probe		= rcar_lvds_probe,
>  	.remove		= rcar_lvds_remove,
>  	.driver		= {
>  		.name	= "rcar-lvds",
> +		.pm	= &rcar_lvds_pm_ops,
>  		.of_match_table = rcar_lvds_of_table,
>  	},
>  };

-- 
Regards,

Laurent Pinchart
