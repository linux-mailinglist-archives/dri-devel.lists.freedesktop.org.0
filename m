Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203126F9DD9
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 04:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDC010E0FE;
	Mon,  8 May 2023 02:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6EA10E0FE
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 02:45:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net
 [126.90.219.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F6AA814;
 Mon,  8 May 2023 04:45:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683513945;
 bh=2AtruiB1zDNfP20v7ESYT+kpp8t3jITwSgMFBQ5dId8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M+fe2tmx1I2l9VQ7f4m+L48uCzwSHHPFWvkpjFXHrYtDfXbf+raQKdH+bJvnKfkHI
 pTMpJJtW75XPkdvvELNW41fmMZz/Nklaz8u0P/zpInZ0zuYrPKDkyM7Sv930him6Jm
 KxY679U9h8KkQjCRj9Xv2VVTHOWPwT7fw7Xj9/qA=
Date: Mon, 8 May 2023 05:46:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 08/53] drm/bridge: display-connector: Convert to platform
 remove callback returning void
Message-ID: <20230508024603.GP23514@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-9-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-9-u.kleine-koenig@pengutronix.de>
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

On Sun, May 07, 2023 at 06:25:31PM +0200, Uwe Kleine-König wrote:
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
>  drivers/gpu/drm/bridge/display-connector.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index 9a12449ad7b8..fbb3e102c02f 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -382,7 +382,7 @@ static int display_connector_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int display_connector_remove(struct platform_device *pdev)
> +static void display_connector_remove(struct platform_device *pdev)
>  {
>  	struct display_connector *conn = platform_get_drvdata(pdev);
>  
> @@ -396,8 +396,6 @@ static int display_connector_remove(struct platform_device *pdev)
>  
>  	if (!IS_ERR(conn->bridge.ddc))
>  		i2c_put_adapter(conn->bridge.ddc);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id display_connector_match[] = {
> @@ -426,7 +424,7 @@ MODULE_DEVICE_TABLE(of, display_connector_match);
>  
>  static struct platform_driver display_connector_driver = {
>  	.probe	= display_connector_probe,
> -	.remove	= display_connector_remove,
> +	.remove_new = display_connector_remove,
>  	.driver		= {
>  		.name		= "display-connector",
>  		.of_match_table	= display_connector_match,
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart
