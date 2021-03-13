Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9710A33A13F
	for <lists+dri-devel@lfdr.de>; Sat, 13 Mar 2021 22:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EDA89A9F;
	Sat, 13 Mar 2021 21:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E5C89A9F
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 21:03:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 037903F0;
 Sat, 13 Mar 2021 22:03:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1615669389;
 bh=rV5Y2Z8omEob0Z3FoNOxgrtXllMXoVxG3rQVVRWPfXY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t3k3pH5uyovsF2U6uNPesJWnbkOocQ4DDTQI4Pt78cfTZAqls5cNw6i2mu7uPD5Qs
 t10CJS/ZXHiAru/kpjc8i8jeOL9FovcgAmu5gq3UVQ2KDeuGAGx/yBxzwL3HGrI703
 PEQNd3+bRwonoeWxkFLCwRU4B5LedY4W0Ak0Shgg=
Date: Sat, 13 Mar 2021 23:02:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi86: Simplify refclk handling
Message-ID: <YE0oakt4h3urAsH1@pendragon.ideasonboard.com>
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Douglas,

Thank you for the patch.

On Thu, Mar 04, 2021 at 03:51:59PM -0800, Douglas Anderson wrote:
> The clock framework makes it simple to deal with an optional clock.
> You can call clk_get_optional() and if the clock isn't specified it'll
> just return NULL without complaint. It's valid to pass NULL to
> enable/disable/prepare/unprepare. Let's make use of this to simplify
> things a tiny bit.
> 
> NOTE: this makes things look a tad bit asymmetric now since we check
> for NULL before clk_prepare_enable() but not for
> clk_disable_unprepare(). This seemed OK to me. We already have to
> check for NULL in the enable case anyway so why not avoid the extra
> call?
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index f27306c51e4d..942019842ff4 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1261,14 +1261,9 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>  		return ret;
>  	}
>  
> -	pdata->refclk = devm_clk_get(pdata->dev, "refclk");
> -	if (IS_ERR(pdata->refclk)) {
> -		ret = PTR_ERR(pdata->refclk);
> -		if (ret == -EPROBE_DEFER)
> -			return ret;
> -		DRM_DEBUG_KMS("refclk not found\n");
> -		pdata->refclk = NULL;
> -	}
> +	pdata->refclk = devm_clk_get_optional(pdata->dev, "refclk");
> +	if (IS_ERR(pdata->refclk))
> +		return PTR_ERR(pdata->refclk);
>  
>  	ret = ti_sn_bridge_parse_dsi_host(pdata);
>  	if (ret)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
