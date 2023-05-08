Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A18D96F9DD3
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 04:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F3710E0F0;
	Mon,  8 May 2023 02:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F7510E0F0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 02:44:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net
 [126.90.219.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F234814;
 Mon,  8 May 2023 04:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683513855;
 bh=gATIkQE/ss26v1tB0M33n5tytfhtd4PmbG8PNsidgGk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dx8EeDzaqL6SNxMzKkWWFolnT1HH75Gec7QXxzrJiPCQ7HMtm3wWC9yweDVSERoqU
 2jKqVVhpkY6vGZwDzLkrln7X3+dF1p76AME+6E+n5zx/FrP2ThPuEBqlRYN4VkkulA
 XJAQcLIoveV80ITTPXcFEySc6jenQtObdeDovvcE=
Date: Mon, 8 May 2023 05:44:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 15/53] drm/bridge: thc63lvd1024: Convert to platform
 remove callback returning void
Message-ID: <20230508024433.GL23514@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-16-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-16-u.kleine-koenig@pengutronix.de>
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

On Sun, May 07, 2023 at 06:25:38PM +0200, Uwe Kleine-König wrote:
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
>  drivers/gpu/drm/bridge/thc63lvd1024.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
> index e21078b2f8b5..d4c1a601bbb5 100644
> --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> @@ -230,13 +230,11 @@ static int thc63_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int thc63_remove(struct platform_device *pdev)
> +static void thc63_remove(struct platform_device *pdev)
>  {
>  	struct thc63_dev *thc63 = platform_get_drvdata(pdev);
>  
>  	drm_bridge_remove(&thc63->bridge);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id thc63_match[] = {
> @@ -247,7 +245,7 @@ MODULE_DEVICE_TABLE(of, thc63_match);
>  
>  static struct platform_driver thc63_driver = {
>  	.probe	= thc63_probe,
> -	.remove	= thc63_remove,
> +	.remove_new = thc63_remove,
>  	.driver	= {
>  		.name		= "thc63lvd1024",
>  		.of_match_table	= thc63_match,
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart
