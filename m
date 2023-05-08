Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706EB6F9DD0
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 04:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985A010E0E9;
	Mon,  8 May 2023 02:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF66810E0E9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 02:43:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net
 [126.90.219.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63291814;
 Mon,  8 May 2023 04:43:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683513784;
 bh=7fXsFqxdTYUtyEwHJjEIWf/5XPqa5k8FifR8zg4LUsk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WKZ+0tTwEGL2yfq+w2ZxThk5Na+PsinrHFwXjjpmVjj6dCE3Wh6seGvqdZhoF7WdG
 76zJPVpp35mBhEvoFYEFWamSNRCix5Dtrit5jTBZD5WjzhGBDtY6VYdJ5WUBISNNeT
 fULKP9yk8V2f4a/17hdUZyzqemzFjRjNXWowxZK0=
Date: Mon, 8 May 2023 05:43:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 35/53] drm/panel: Convert to platform remove callback
 returning void
Message-ID: <20230508024322.GI23514@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-36-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-36-u.kleine-koenig@pengutronix.de>
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
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

Thank you for the patch.

On Sun, May 07, 2023 at 06:25:58PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert the drm panel drivers from always returning zero in the
> remove callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-lvds.c              | 6 ++----
>  drivers/gpu/drm/panel/panel-seiko-43wvf1g.c     | 6 ++----
>  drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c | 6 ++----
>  drivers/gpu/drm/panel/panel-simple.c            | 6 ++----
>  4 files changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index de8758c30e6e..b47c3a679be0 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -228,15 +228,13 @@ static int panel_lvds_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int panel_lvds_remove(struct platform_device *pdev)
> +static void panel_lvds_remove(struct platform_device *pdev)
>  {
>  	struct panel_lvds *lvds = platform_get_drvdata(pdev);
>  
>  	drm_panel_remove(&lvds->panel);
>  
>  	drm_panel_disable(&lvds->panel);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id panel_lvds_of_table[] = {
> @@ -248,7 +246,7 @@ MODULE_DEVICE_TABLE(of, panel_lvds_of_table);
>  
>  static struct platform_driver panel_lvds_driver = {
>  	.probe		= panel_lvds_probe,
> -	.remove		= panel_lvds_remove,
> +	.remove_new	= panel_lvds_remove,
>  	.driver		= {
>  		.name	= "panel-lvds",
>  		.of_match_table = panel_lvds_of_table,
> diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> index 76160e5d43bd..5c3d9f7fc358 100644
> --- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> +++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> @@ -266,14 +266,12 @@ static int seiko_panel_probe(struct device *dev,
>  	return 0;
>  }
>  
> -static int seiko_panel_remove(struct platform_device *pdev)
> +static void seiko_panel_remove(struct platform_device *pdev)
>  {
>  	struct seiko_panel *panel = platform_get_drvdata(pdev);
>  
>  	drm_panel_remove(&panel->base);
>  	drm_panel_disable(&panel->base);
> -
> -	return 0;
>  }
>  
>  static void seiko_panel_shutdown(struct platform_device *pdev)
> @@ -335,7 +333,7 @@ static struct platform_driver seiko_panel_platform_driver = {
>  		.of_match_table = platform_of_match,
>  	},
>  	.probe = seiko_panel_platform_probe,
> -	.remove = seiko_panel_remove,
> +	.remove_new = seiko_panel_remove,
>  	.shutdown = seiko_panel_shutdown,
>  };
>  module_platform_driver(seiko_panel_platform_driver);
> diff --git a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
> index a07d0f6c3e69..76bd9e810827 100644
> --- a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
> +++ b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
> @@ -189,15 +189,13 @@ static int ls037v7dw01_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int ls037v7dw01_remove(struct platform_device *pdev)
> +static void ls037v7dw01_remove(struct platform_device *pdev)
>  {
>  	struct ls037v7dw01_panel *lcd = platform_get_drvdata(pdev);
>  
>  	drm_panel_remove(&lcd->panel);
>  	drm_panel_disable(&lcd->panel);
>  	drm_panel_unprepare(&lcd->panel);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id ls037v7dw01_of_match[] = {
> @@ -209,7 +207,7 @@ MODULE_DEVICE_TABLE(of, ls037v7dw01_of_match);
>  
>  static struct platform_driver ls037v7dw01_driver = {
>  	.probe		= ls037v7dw01_probe,
> -	.remove		= ls037v7dw01_remove,
> +	.remove_new	= ls037v7dw01_remove,
>  	.driver		= {
>  		.name = "panel-sharp-ls037v7dw01",
>  		.of_match_table = ls037v7dw01_of_match,
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 065f378bba9d..1274eb95cf86 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4335,11 +4335,9 @@ static int panel_simple_platform_probe(struct platform_device *pdev)
>  	return panel_simple_probe(&pdev->dev, id->data);
>  }
>  
> -static int panel_simple_platform_remove(struct platform_device *pdev)
> +static void panel_simple_platform_remove(struct platform_device *pdev)
>  {
>  	panel_simple_remove(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static void panel_simple_platform_shutdown(struct platform_device *pdev)
> @@ -4360,7 +4358,7 @@ static struct platform_driver panel_simple_platform_driver = {
>  		.pm = &panel_simple_pm_ops,
>  	},
>  	.probe = panel_simple_platform_probe,
> -	.remove = panel_simple_platform_remove,
> +	.remove_new = panel_simple_platform_remove,
>  	.shutdown = panel_simple_platform_shutdown,
>  };
>  
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart
