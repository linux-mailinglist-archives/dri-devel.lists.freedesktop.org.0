Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D576F9DC1
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 04:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6933010E0C7;
	Mon,  8 May 2023 02:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B52410E0C7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 02:36:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net
 [126.90.219.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CB84814;
 Mon,  8 May 2023 04:36:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683513368;
 bh=DqJ3yh3QMfr+Yrk7Md25gLGnv7jAA8CKVwVTCRWULlI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gr+NNbhGqNFOhPd44M1k8aH4fyaeeggb9dNwUHC+2D2QxvB8J4Ajvy8+QoWn4nThO
 U9AQ6aLRGWnHo8U5Tbtbnl91duwTNGnE2wZ7UuZ+ZzGmX7lbCCyV0uNcYzDm6eOCxt
 r9yRJcNpOtdGamJQvhPjdh9uEFsK9iCleB8NT4oA=
Date: Mon, 8 May 2023 05:36:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 12/53] drm/bridge: nwl-dsi: Convert to platform remove
 callback returning void
Message-ID: <20230508023625.GB23514@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-13-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-13-u.kleine-koenig@pengutronix.de>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

Thank you for the patch.

On Sun, May 07, 2023 at 06:25:35PM +0200, Uwe Kleine-König wrote:
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
>  drivers/gpu/drm/bridge/nwl-dsi.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index 6dc2a4e191d7..4a5f5c4f5dcc 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -1199,7 +1199,7 @@ static int nwl_dsi_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int nwl_dsi_remove(struct platform_device *pdev)
> +static void nwl_dsi_remove(struct platform_device *pdev)
>  {
>  	struct nwl_dsi *dsi = platform_get_drvdata(pdev);
>  
> @@ -1207,12 +1207,11 @@ static int nwl_dsi_remove(struct platform_device *pdev)
>  	mipi_dsi_host_unregister(&dsi->dsi_host);
>  	drm_bridge_remove(&dsi->bridge);
>  	pm_runtime_disable(&pdev->dev);
> -	return 0;
>  }
>  
>  static struct platform_driver nwl_dsi_driver = {
>  	.probe		= nwl_dsi_probe,
> -	.remove		= nwl_dsi_remove,
> +	.remove_new	= nwl_dsi_remove,
>  	.driver		= {
>  		.of_match_table = nwl_dsi_dt_ids,
>  		.name	= DRV_NAME,
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart
