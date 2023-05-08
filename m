Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EDD6F9DD1
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 04:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC5510E0E4;
	Mon,  8 May 2023 02:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BA610E0E4
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 02:43:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net
 [126.90.219.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09775814;
 Mon,  8 May 2023 04:43:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683513815;
 bh=Vwsn9kR697gd+gAjhw7RBzbNpArmm9ZYiN6l6/6s1Og=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gxTkrlQ/UVboSg/mQcZlBBV7yoW5FTjjIil/txqWWUDCqgu5/U95NuyNMsjb4hqRV
 Eqod+z8VWeQuVf83GJmutKfWzPRvHarEyb0IUF7wx8UDkJIoMP0MCquSySRp+FOAyg
 XJBGWeWEe74lujYzpH+TzEkWFIYPhRZguX+pxFIc=
Date: Mon, 8 May 2023 05:43:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 10/53] drm/imx/imx8*: Convert to platform remove callback
 returning void
Message-ID: <20230508024353.GJ23514@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-11-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-11-u.kleine-koenig@pengutronix.de>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

Thank you for the patch.

On Sun, May 07, 2023 at 06:25:33PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert the imx8 drm drivers from always returning zero in the
> remove callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c         | 6 ++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c        | 6 ++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 6 ++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     | 6 ++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        | 6 ++----
>  5 files changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
> index 178af8d2d80b..386032a02599 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
> @@ -532,7 +532,7 @@ static int imx8qm_ldb_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int imx8qm_ldb_remove(struct platform_device *pdev)
> +static void imx8qm_ldb_remove(struct platform_device *pdev)
>  {
>  	struct imx8qm_ldb *imx8qm_ldb = platform_get_drvdata(pdev);
>  	struct ldb *ldb = &imx8qm_ldb->base;
> @@ -540,8 +540,6 @@ static int imx8qm_ldb_remove(struct platform_device *pdev)
>  	ldb_remove_bridge_helper(ldb);
>  
>  	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static int __maybe_unused imx8qm_ldb_runtime_suspend(struct device *dev)
> @@ -573,7 +571,7 @@ MODULE_DEVICE_TABLE(of, imx8qm_ldb_dt_ids);
>  
>  static struct platform_driver imx8qm_ldb_driver = {
>  	.probe	= imx8qm_ldb_probe,
> -	.remove = imx8qm_ldb_remove,
> +	.remove_new = imx8qm_ldb_remove,
>  	.driver	= {
>  		.pm = &imx8qm_ldb_pm_ops,
>  		.name = DRIVER_NAME,
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
> index 63948d5d20fd..c806576b1e22 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
> @@ -667,7 +667,7 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int imx8qxp_ldb_remove(struct platform_device *pdev)
> +static void imx8qxp_ldb_remove(struct platform_device *pdev)
>  {
>  	struct imx8qxp_ldb *imx8qxp_ldb = platform_get_drvdata(pdev);
>  	struct ldb *ldb = &imx8qxp_ldb->base;
> @@ -675,8 +675,6 @@ static int imx8qxp_ldb_remove(struct platform_device *pdev)
>  	ldb_remove_bridge_helper(ldb);
>  
>  	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static int __maybe_unused imx8qxp_ldb_runtime_suspend(struct device *dev)
> @@ -708,7 +706,7 @@ MODULE_DEVICE_TABLE(of, imx8qxp_ldb_dt_ids);
>  
>  static struct platform_driver imx8qxp_ldb_driver = {
>  	.probe	= imx8qxp_ldb_probe,
> -	.remove = imx8qxp_ldb_remove,
> +	.remove_new = imx8qxp_ldb_remove,
>  	.driver	= {
>  		.pm = &imx8qxp_ldb_pm_ops,
>  		.name = DRIVER_NAME,
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> index 503bd8db8afe..d0868a6ac6c9 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> @@ -357,7 +357,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int imx8qxp_pc_bridge_remove(struct platform_device *pdev)
> +static void imx8qxp_pc_bridge_remove(struct platform_device *pdev)
>  {
>  	struct imx8qxp_pc *pc = platform_get_drvdata(pdev);
>  	struct imx8qxp_pc_channel *ch;
> @@ -374,8 +374,6 @@ static int imx8qxp_pc_bridge_remove(struct platform_device *pdev)
>  	}
>  
>  	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static int __maybe_unused imx8qxp_pc_runtime_suspend(struct device *dev)
> @@ -435,7 +433,7 @@ MODULE_DEVICE_TABLE(of, imx8qxp_pc_dt_ids);
>  
>  static struct platform_driver imx8qxp_pc_bridge_driver = {
>  	.probe	= imx8qxp_pc_bridge_probe,
> -	.remove = imx8qxp_pc_bridge_remove,
> +	.remove_new = imx8qxp_pc_bridge_remove,
>  	.driver	= {
>  		.pm = &imx8qxp_pc_pm_ops,
>  		.name = DRIVER_NAME,
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> index 9e5f2b4dc2e5..25dc82a44ef4 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> @@ -398,13 +398,11 @@ static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int imx8qxp_pixel_link_bridge_remove(struct platform_device *pdev)
> +static void imx8qxp_pixel_link_bridge_remove(struct platform_device *pdev)
>  {
>  	struct imx8qxp_pixel_link *pl = platform_get_drvdata(pdev);
>  
>  	drm_bridge_remove(&pl->bridge);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id imx8qxp_pixel_link_dt_ids[] = {
> @@ -416,7 +414,7 @@ MODULE_DEVICE_TABLE(of, imx8qxp_pixel_link_dt_ids);
>  
>  static struct platform_driver imx8qxp_pixel_link_bridge_driver = {
>  	.probe	= imx8qxp_pixel_link_bridge_probe,
> -	.remove = imx8qxp_pixel_link_bridge_remove,
> +	.remove_new = imx8qxp_pixel_link_bridge_remove,
>  	.driver	= {
>  		.of_match_table = imx8qxp_pixel_link_dt_ids,
>  		.name = DRIVER_NAME,
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> index d0fec82f0cf8..4a886cb808ca 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> @@ -455,15 +455,13 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int imx8qxp_pxl2dpi_bridge_remove(struct platform_device *pdev)
> +static void imx8qxp_pxl2dpi_bridge_remove(struct platform_device *pdev)
>  {
>  	struct imx8qxp_pxl2dpi *p2d = platform_get_drvdata(pdev);
>  
>  	drm_bridge_remove(&p2d->bridge);
>  
>  	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id imx8qxp_pxl2dpi_dt_ids[] = {
> @@ -474,7 +472,7 @@ MODULE_DEVICE_TABLE(of, imx8qxp_pxl2dpi_dt_ids);
>  
>  static struct platform_driver imx8qxp_pxl2dpi_bridge_driver = {
>  	.probe	= imx8qxp_pxl2dpi_bridge_probe,
> -	.remove = imx8qxp_pxl2dpi_bridge_remove,
> +	.remove_new = imx8qxp_pxl2dpi_bridge_remove,
>  	.driver	= {
>  		.of_match_table = imx8qxp_pxl2dpi_dt_ids,
>  		.name = DRIVER_NAME,
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart
