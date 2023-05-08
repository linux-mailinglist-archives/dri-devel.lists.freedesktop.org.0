Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207E56F9DD6
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 04:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DD110E0FB;
	Mon,  8 May 2023 02:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE02410E0FB
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 02:44:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net
 [126.90.219.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F12A814;
 Mon,  8 May 2023 04:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683513890;
 bh=YHYwvEQd1rkZwrVAWWWPwyADKIVewLJvHtj8aPpP3TA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wkwVswphXV1gEcko3MZivgTlXhi1Gi2BSJZI65ZNaZJMOL0Z4MBY08IUAvZjt/0xy
 GGSrrFKJka+hpv0jwlaz9lpnvZBsZMqZ58YJoB7ABYHlaJyeF4oc6xcPrdxSR1POQO
 IfBWPUgkweJYYEv7Fr5d/VKROjHvX9yPR57ev9to=
Date: Mon, 8 May 2023 05:45:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 13/53] drm/bridge: simple-bridge: Convert to platform
 remove callback returning void
Message-ID: <20230508024508.GN23514@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-14-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-14-u.kleine-koenig@pengutronix.de>
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

On Sun, May 07, 2023 at 06:25:36PM +0200, Uwe Kleine-König wrote:
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
>  drivers/gpu/drm/bridge/simple-bridge.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index 2c5c5211bdab..5ede3e111096 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -218,13 +218,11 @@ static int simple_bridge_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int simple_bridge_remove(struct platform_device *pdev)
> +static void simple_bridge_remove(struct platform_device *pdev)
>  {
>  	struct simple_bridge *sbridge = platform_get_drvdata(pdev);
>  
>  	drm_bridge_remove(&sbridge->bridge);
> -
> -	return 0;
>  }
>  
>  /*
> @@ -301,7 +299,7 @@ MODULE_DEVICE_TABLE(of, simple_bridge_match);
>  
>  static struct platform_driver simple_bridge_driver = {
>  	.probe	= simple_bridge_probe,
> -	.remove	= simple_bridge_remove,
> +	.remove_new = simple_bridge_remove,
>  	.driver		= {
>  		.name		= "simple-bridge",
>  		.of_match_table	= simple_bridge_match,
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart
