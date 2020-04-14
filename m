Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 096751A776D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 11:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE6889DFA;
	Tue, 14 Apr 2020 09:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067A889DFA
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 09:34:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41607521;
 Tue, 14 Apr 2020 11:34:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586856848;
 bh=IE+eyMvCWWL1GYoR2iln12cflhCLU75f0DcvbabltgY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TEL4WHtcBhIqYfHk/FQwx2k0pKG9aFTlVHQiWkmmLge+BvYXtSYe11CsvhckcFlOC
 uPfBb9VOnh3wFwo6oXJOToOIAnex8gs8GznIT9PNqZaS3wQgrefMDV/tPWLxbFAro5
 NuQkb3nplnk09jR/EQosurD0Yn0lQz3KfOZEw44A=
Date: Tue, 14 Apr 2020 12:33:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 2/4] drm/bridge: tc358764: drop
 drm_connector_(un)register
Message-ID: <20200414093356.GB19819@pendragon.ideasonboard.com>
References: <20200414084727.8326-1-sam@ravnborg.org>
 <20200414084727.8326-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414084727.8326-3-sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Tue, Apr 14, 2020 at 10:47:25AM +0200, Sam Ravnborg wrote:
> Drop drm_connector handling that is not needed:
> 
> - drm_dev_register() in the display controlelr driver takes

s/controlelr/controller/

>   care of registering connectors.
>   So the call to drm_connector_register() call is not needed in the bridge
>   driver.
> 
> - Use of drm_connector_unregister() is only required for drivers that
>   explicit have called drm_dev_register.
> 
> - The reference counting using drm_connector_put() is likewise not needed.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/tc358764.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
> index 5ac1430fab04..a277739fab58 100644
> --- a/drivers/gpu/drm/bridge/tc358764.c
> +++ b/drivers/gpu/drm/bridge/tc358764.c
> @@ -375,7 +375,6 @@ static int tc358764_attach(struct drm_bridge *bridge,
>  	drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
>  	drm_panel_attach(ctx->panel, &ctx->connector);
>  	ctx->connector.funcs->reset(&ctx->connector);
> -	drm_connector_register(&ctx->connector);
>  
>  	return 0;
>  }
> @@ -384,10 +383,8 @@ static void tc358764_detach(struct drm_bridge *bridge)
>  {
>  	struct tc358764 *ctx = bridge_to_tc358764(bridge);
>  
> -	drm_connector_unregister(&ctx->connector);
>  	drm_panel_detach(ctx->panel);
>  	ctx->panel = NULL;
> -	drm_connector_put(&ctx->connector);
>  }
>  
>  static const struct drm_bridge_funcs tc358764_bridge_funcs = {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
