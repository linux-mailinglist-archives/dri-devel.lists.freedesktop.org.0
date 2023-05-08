Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F025B6F9DD8
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 04:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1349410E0F3;
	Mon,  8 May 2023 02:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BB910E0F3
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 02:45:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net
 [126.90.219.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9945814;
 Mon,  8 May 2023 04:45:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683513927;
 bh=Vz7Z/bsu2DIGaYWPcqW6xJwrmRsbEPxI10/hPd4JTi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pl4tv3auORKfOP00IoBtADsKhjUw6REJ4D5yFO7jghFMF1qOjKfqy1nr9oitRqqOK
 5M6eKwG7bWLt1CYL026OM+0FGNzflGkUCa4tDjA9j1mrMGEfzfN82O5krpc/JU388D
 mB00gk4qCVtZsXdHk6C516ZrKFt0U/MPRGYsAx88=
Date: Mon, 8 May 2023 05:45:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 09/53] drm/bridge: fsl-ldb: Convert to platform remove
 callback returning void
Message-ID: <20230508024545.GO23514@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-10-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-10-u.kleine-koenig@pengutronix.de>
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

On Sun, May 07, 2023 at 06:25:32PM +0200, Uwe Kleine-König wrote:
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
>  drivers/gpu/drm/bridge/fsl-ldb.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 6bac160b395b..450b352914f4 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -347,13 +347,11 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int fsl_ldb_remove(struct platform_device *pdev)
> +static void fsl_ldb_remove(struct platform_device *pdev)
>  {
>  	struct fsl_ldb *fsl_ldb = platform_get_drvdata(pdev);
>  
>  	drm_bridge_remove(&fsl_ldb->bridge);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id fsl_ldb_match[] = {
> @@ -367,7 +365,7 @@ MODULE_DEVICE_TABLE(of, fsl_ldb_match);
>  
>  static struct platform_driver fsl_ldb_driver = {
>  	.probe	= fsl_ldb_probe,
> -	.remove	= fsl_ldb_remove,
> +	.remove_new = fsl_ldb_remove,
>  	.driver		= {
>  		.name		= "fsl-ldb",
>  		.of_match_table	= fsl_ldb_match,
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart
