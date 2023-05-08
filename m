Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B136F9DCA
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 04:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3246510E0E0;
	Mon,  8 May 2023 02:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB38210E0E1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 02:41:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net
 [126.90.219.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45378814;
 Mon,  8 May 2023 04:40:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683513660;
 bh=EaVvjmycoOjx2C7iJDv/aW2epAID27IzywCnXlVYgp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EGbcveSHZuxj9N0N3YcAie1PCDT85TPah2LmhkZ/qghuGyOIW1dTwbjWrrxyDvzQB
 qnKN34FmQwzCtZzlh1Lsprz483McoldRSzVgPCjxmEZK9qI3Y85jCunshzQuyxGf9c
 3oaH2xci89iMCqdYXAuxUzTFFG/ZXrsIUW15d/10=
Date: Mon, 8 May 2023 05:41:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 20/53] drm/hisilicon: Convert to platform remove callback
 returning void
Message-ID: <20230508024118.GG23514@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-21-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-21-u.kleine-koenig@pengutronix.de>
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
Cc: kernel@pengutronix.de, Yongqin Liu <yongqin.liu@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Xinliang Liu <xinliang.liu@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 John Stultz <jstultz@google.com>, Jani Nikula <jani.nikula@intel.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Danilo Krummrich <dakr@redhat.com>, Tian Tao <tiantao6@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

Thank you for the patch.

On Sun, May 07, 2023 at 06:25:43PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert the hisilicon drm drivers from always returning zero
> in the remove callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c    | 6 ++----
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 5 ++---
>  2 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> index d9978b79828c..566de4658719 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> @@ -874,14 +874,12 @@ static int dsi_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int dsi_remove(struct platform_device *pdev)
> +static void dsi_remove(struct platform_device *pdev)
>  {
>  	struct dsi_data *data = platform_get_drvdata(pdev);
>  	struct dw_dsi *dsi = &data->dsi;
>  
>  	mipi_dsi_host_unregister(&dsi->host);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id dsi_of_match[] = {
> @@ -892,7 +890,7 @@ MODULE_DEVICE_TABLE(of, dsi_of_match);
>  
>  static struct platform_driver dsi_driver = {
>  	.probe = dsi_probe,
> -	.remove = dsi_remove,
> +	.remove_new = dsi_remove,
>  	.driver = {
>  		.name = "dw-dsi",
>  		.of_match_table = dsi_of_match,
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> index 9c5d49bf40c9..bc2948500311 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> @@ -279,10 +279,9 @@ static int kirin_drm_platform_probe(struct platform_device *pdev)
>  	return component_master_add_with_match(dev, &kirin_drm_ops, match);
>  }
>  
> -static int kirin_drm_platform_remove(struct platform_device *pdev)
> +static void kirin_drm_platform_remove(struct platform_device *pdev)
>  {
>  	component_master_del(&pdev->dev, &kirin_drm_ops);
> -	return 0;
>  }
>  
>  static const struct of_device_id kirin_drm_dt_ids[] = {
> @@ -295,7 +294,7 @@ MODULE_DEVICE_TABLE(of, kirin_drm_dt_ids);
>  
>  static struct platform_driver kirin_drm_platform_driver = {
>  	.probe = kirin_drm_platform_probe,
> -	.remove = kirin_drm_platform_remove,
> +	.remove_new = kirin_drm_platform_remove,
>  	.driver = {
>  		.name = "kirin-drm",
>  		.of_match_table = kirin_drm_dt_ids,
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart
