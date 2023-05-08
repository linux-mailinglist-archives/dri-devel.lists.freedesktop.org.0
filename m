Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF046F9DC5
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 04:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4858110E0CA;
	Mon,  8 May 2023 02:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F73A10E0CA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 02:37:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net
 [126.90.219.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE236814;
 Mon,  8 May 2023 04:37:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683513431;
 bh=fKoGX3ASbejpGXJOihDLXjS2bDBgNnpg+A7ySP8QXlw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P0EbuVqx3ZXQnqfhHr2kWWlTOzLVS4/DgRoQ+piHLCh9+XhPOw6SorbqZUFrQtdMA
 a/EOMC4aKUcf270NQ3WY2WeAdYIQWyCqobBvN8ZzTpUUxZNWnf93SZVXS3uwYyd6ps
 CtJASEYYkHwZb0ao5sO2vBatK4it3HTHjA2FvUn0=
Date: Mon, 8 May 2023 05:37:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 07/53] drm/bridge: cdns-dsi: Convert to platform remove
 callback returning void
Message-ID: <20230508023729.GD23514@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-8-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-8-u.kleine-koenig@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 Jayshri Pawar <jpawar@cadence.com>, kernel@pengutronix.de,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

Thank you for the patch.

On Sun, May 07, 2023 at 06:25:30PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index 5dbfc7226b31..f50d65f54314 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -1278,7 +1278,7 @@ static int cdns_dsi_drm_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int cdns_dsi_drm_remove(struct platform_device *pdev)
> +static void cdns_dsi_drm_remove(struct platform_device *pdev)
>  {
>  	struct cdns_dsi *dsi = platform_get_drvdata(pdev);
>  
> @@ -1288,8 +1288,6 @@ static int cdns_dsi_drm_remove(struct platform_device *pdev)
>  		dsi->platform_ops->deinit(dsi);
>  
>  	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id cdns_dsi_of_match[] = {
> @@ -1303,7 +1301,7 @@ MODULE_DEVICE_TABLE(of, cdns_dsi_of_match);
>  
>  static struct platform_driver cdns_dsi_platform_driver = {
>  	.probe  = cdns_dsi_drm_probe,
> -	.remove = cdns_dsi_drm_remove,
> +	.remove_new = cdns_dsi_drm_remove,
>  	.driver = {
>  		.name   = "cdns-dsi",
>  		.of_match_table = cdns_dsi_of_match,
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart
