Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ACE6759B7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 17:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E3A10EAA8;
	Fri, 20 Jan 2023 16:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C50510EAA8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 16:18:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA2FC514;
 Fri, 20 Jan 2023 17:18:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674231488;
 bh=0RpIxp/5sEZyEk+olyw1xAibh41g60RJbz2anuTp0Gc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DlZr4akQoIgLiDF5dmJpmiVk3hyVD+zsIHJ0zW9etkUyHKJ1F7DnYg+jfjuln6srq
 AYibti8XHldxEIM/xAu+i6BMZwol8sXDiCWOwEBq3WLwCDR6ibuYg9Ds2h0ojli7A9
 Mc37rrkS7/7tIGET6MymRaEtzWdmxIDWn2HUSJsU=
Date: Fri, 20 Jan 2023 18:18:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 3/7] drm: rcar-du: lvsd: Add reset control
Message-ID: <Y8q+vUks4HzLZA1U@pendragon.ideasonboard.com>
References: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230120085009.604797-4-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230120085009.604797-4-tomi.valkeinen+renesas@ideasonboard.com>
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

On Fri, Jan 20, 2023 at 10:50:05AM +0200, Tomi Valkeinen wrote:
> Reset LVDS using the reset control as CPG reset/release is required in
> the hardware manual sequence.
> 
> Based on a BSP patch from Koji Matsuoka <koji.matsuoka.xm@renesas.com>.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig     |  1 +
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 19 ++++++++++++++++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index a8f862c68b4f..151e400b996d 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -43,6 +43,7 @@ config DRM_RCAR_LVDS
>  	select DRM_PANEL
>  	select OF_FLATTREE
>  	select OF_OVERLAY
> +	select RESET_CONTROLLER
>  
>  config DRM_RCAR_USE_MIPI_DSI
>  	bool "R-Car DU MIPI DSI Encoder Support"
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 8e1be51fbee6..668604616bfd 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -17,6 +17,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/sys_soc.h>
>  
> @@ -61,6 +62,7 @@ struct rcar_lvds_device_info {
>  struct rcar_lvds {
>  	struct device *dev;
>  	const struct rcar_lvds_device_info *info;
> +	struct reset_control *rstc;
>  
>  	struct drm_bridge bridge;
>  
> @@ -845,6 +847,10 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> +	lvds->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(lvds->rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(lvds->rstc),
> +				     "failed to get cpg reset\n");

Missing blank line.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	pm_runtime_enable(&pdev->dev);
>  
>  	drm_bridge_add(&lvds->bridge);
> @@ -924,6 +930,8 @@ static int rcar_lvds_runtime_suspend(struct device *dev)
>  
>  	clk_disable_unprepare(lvds->clocks.mod);
>  
> +	reset_control_assert(lvds->rstc);
> +
>  	return 0;
>  }
>  
> @@ -932,11 +940,20 @@ static int rcar_lvds_runtime_resume(struct device *dev)
>  	struct rcar_lvds *lvds = dev_get_drvdata(dev);
>  	int ret;
>  
> +	ret = reset_control_deassert(lvds->rstc);
> +	if (ret)
> +		return ret;
> +
>  	ret = clk_prepare_enable(lvds->clocks.mod);
>  	if (ret < 0)
> -		return ret;
> +		goto err_reset_assert;
>  
>  	return 0;
> +
> +err_reset_assert:
> +	reset_control_assert(lvds->rstc);
> +
> +	return ret;
>  }
>  
>  static const struct dev_pm_ops rcar_lvds_pm_ops = {

-- 
Regards,

Laurent Pinchart
