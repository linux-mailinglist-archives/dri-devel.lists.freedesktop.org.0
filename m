Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DC8513B33
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 20:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CA610E9AA;
	Thu, 28 Apr 2022 18:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3598710E964
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 18:08:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02CE1496;
 Thu, 28 Apr 2022 20:08:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1651169285;
 bh=oVmunpLDDKj9ibXyiY0f03qTsvurtWKBg7vpbuvLUNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PJ6ybfpLjTJnVJqDewl16LwmQ6xSNd7FC8KJCj9iO56ZH7zGVaaP2ffZgDBlFMXhM
 xzC9GJCGfdz3GzsRv0movWt2qf9HJJasHGgSiIdMcHh69VbLe3+KvcF1Ej9wL+IOTq
 bMBCLv+v93YM7qD7MrrhK9u9dnmKsCErQO4jDYVc=
Date: Thu, 28 Apr 2022 21:08:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] drm/bridge: tfp410: Make tfp410_fini() return void
Message-ID: <YmrYAwNqDDOd26Jn@pendragon.ideasonboard.com>
References: <20220428162803.185275-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220428162803.185275-1-u.kleine-koenig@pengutronix.de>
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
Cc: kernel@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

Thank you for the patch.

On Thu, Apr 28, 2022 at 06:28:03PM +0200, Uwe Kleine-König wrote:
> tfp410_fini() always returns zero. Make it return no value which makes it
> easier to see in the callers that there is no error to handle.
> 
> Also the return value of i2c and platform driver remove callbacks is
> ignored anyway. This prepares making i2c and platform remove callbacks
> return void, too.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ti-tfp410.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index ba3fa2a9b8a4..756b3e6e776b 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -341,13 +341,11 @@ static int tfp410_init(struct device *dev, bool i2c)
>  	return 0;
>  }
>  
> -static int tfp410_fini(struct device *dev)
> +static void tfp410_fini(struct device *dev)
>  {
>  	struct tfp410 *dvi = dev_get_drvdata(dev);
>  
>  	drm_bridge_remove(&dvi->bridge);
> -
> -	return 0;
>  }
>  
>  static int tfp410_probe(struct platform_device *pdev)
> @@ -357,7 +355,9 @@ static int tfp410_probe(struct platform_device *pdev)
>  
>  static int tfp410_remove(struct platform_device *pdev)
>  {
> -	return tfp410_fini(&pdev->dev);
> +	tfp410_fini(&pdev->dev);
> +
> +	return 0;
>  }
>  
>  static const struct of_device_id tfp410_match[] = {
> @@ -394,7 +394,9 @@ static int tfp410_i2c_probe(struct i2c_client *client,
>  
>  static int tfp410_i2c_remove(struct i2c_client *client)
>  {
> -	return tfp410_fini(&client->dev);
> +	tfp410_fini(&client->dev);
> +
> +	return 0;
>  }
>  
>  static const struct i2c_device_id tfp410_i2c_ids[] = {
> 
> base-commit: 3123109284176b1532874591f7c81f3837bbdc17

-- 
Regards,

Laurent Pinchart
