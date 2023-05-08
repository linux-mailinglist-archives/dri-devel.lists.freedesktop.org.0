Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3439F6F9DD2
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 04:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E88910E0ED;
	Mon,  8 May 2023 02:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B541D10E0ED
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 02:44:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net
 [126.90.219.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40780814;
 Mon,  8 May 2023 04:43:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683513838;
 bh=PtIUBzvOa9vBnnpcFA2h63WogQVgwCpyTbWoXVhNbSw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dzk5Z9hVrRXgyismWr+ZDsacRBVNat7F2T0b04lUYO/Ie44OM6t6u+PN3DS4tL71k
 iBtsdK8HS15LGHQlgwM25IG5gG+mCpoggORv7Mx6jnOXGutxzbxip8cTJKwjXMjiih
 CiH6FG4VdXwKiEKh/xiyOl55A8rj6Jaq7r3NX1ls=
Date: Mon, 8 May 2023 05:44:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 11/53] drm/bridge: lvds-codec: Convert to platform remove
 callback returning void
Message-ID: <20230508024416.GK23514@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-12-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-12-u.kleine-koenig@pengutronix.de>
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

On Sun, May 07, 2023 at 06:25:34PM +0200, Uwe Kleine-König wrote:
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
>  drivers/gpu/drm/bridge/lvds-codec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> index 39e7004de720..67368f23d4aa 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -215,13 +215,11 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int lvds_codec_remove(struct platform_device *pdev)
> +static void lvds_codec_remove(struct platform_device *pdev)
>  {
>  	struct lvds_codec *lvds_codec = platform_get_drvdata(pdev);
>  
>  	drm_bridge_remove(&lvds_codec->bridge);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id lvds_codec_match[] = {
> @@ -243,7 +241,7 @@ MODULE_DEVICE_TABLE(of, lvds_codec_match);
>  
>  static struct platform_driver lvds_codec_driver = {
>  	.probe	= lvds_codec_probe,
> -	.remove	= lvds_codec_remove,
> +	.remove_new = lvds_codec_remove,
>  	.driver		= {
>  		.name		= "lvds-codec",
>  		.of_match_table	= lvds_codec_match,
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart
