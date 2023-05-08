Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBF16F9DD4
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 04:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C10410E0F1;
	Mon,  8 May 2023 02:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0347F10E0F1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 02:44:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net
 [126.90.219.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96182814;
 Mon,  8 May 2023 04:44:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683513872;
 bh=lBl4FhL2RKZ0GsTUx3DII+523UdFjYqVWNXSerRMJjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vVT+61+PyWVz3MKVy4jZcr39fbQoH/fl0webCIoAejr0PgJHgy/z1krlkdrFUCb/A
 l1PhvKNROaK0qi/yNIyagUKTVUGdcf8p67krYdcdWpLeTTt7dvFinYjR4nteFS9veQ
 dD261pDzRswvSUT+cyPT3p1Fex2MCsMG/21Wg5S4=
Date: Mon, 8 May 2023 05:44:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 16/53] drm/bridge: tfp410: Convert to platform remove
 callback returning void
Message-ID: <20230508024449.GM23514@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-17-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-17-u.kleine-koenig@pengutronix.de>
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

On Sun, May 07, 2023 at 06:25:39PM +0200, Uwe Kleine-König wrote:
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
>  drivers/gpu/drm/bridge/ti-tfp410.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index 6db69df0e18b..ab63225cd635 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -355,11 +355,9 @@ static int tfp410_probe(struct platform_device *pdev)
>  	return tfp410_init(&pdev->dev, false);
>  }
>  
> -static int tfp410_remove(struct platform_device *pdev)
> +static void tfp410_remove(struct platform_device *pdev)
>  {
>  	tfp410_fini(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id tfp410_match[] = {
> @@ -370,7 +368,7 @@ MODULE_DEVICE_TABLE(of, tfp410_match);
>  
>  static struct platform_driver tfp410_platform_driver = {
>  	.probe	= tfp410_probe,
> -	.remove	= tfp410_remove,
> +	.remove_new = tfp410_remove,
>  	.driver	= {
>  		.name		= "tfp410-bridge",
>  		.of_match_table	= tfp410_match,
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart
