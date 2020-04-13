Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF941A62B2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 07:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BA56E183;
	Mon, 13 Apr 2020 05:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980566E183
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 05:43:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 2B27F80487;
 Mon, 13 Apr 2020 07:43:54 +0200 (CEST)
Date: Mon, 13 Apr 2020 07:43:52 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/2] drm: bridge: simple-bridge: Make connector creation
 optional
Message-ID: <20200413054352.GB6324@ravnborg.org>
References: <20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200409003636.11792-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409003636.11792-3-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=FLFezM2ub9r-TSLOdQ0A:9
 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 09, 2020 at 03:36:36AM +0300, Laurent Pinchart wrote:
> Make the connector creation optional to enable usage of the
> simple-bridge with the DRM bridge connector helper.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Looks straightforward.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

Some rambling below you can ignore.

	Sam

> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index bac223d0430d..bad638088029 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -101,16 +101,14 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
>  	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);

The code below uses both sbridge-> and bridge->
It confused me that we access via bridge-> when possilbe and only
reverts to the "upper" sbridge when needed.
This is unrelated to this patch - just an observation.
It makes code shorter so I can see why it is done.

>  	int ret;
>  
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -		DRM_ERROR("Fix bridge driver to make connector optional!");
> -		return -EINVAL;
> -	}
> -
>  	ret = drm_bridge_attach(bridge->encoder, sbridge->next_bridge, bridge,
>  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  	if (ret < 0)
>  		return ret;
>  
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +		return 0;
> +
>  	if (!bridge->encoder) {
>  		DRM_ERROR("Missing encoder\n");
>  		return -ENODEV;
> @@ -127,8 +125,7 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
>  		return ret;
>  	}
>  
> -	drm_connector_attach_encoder(&sbridge->connector,
> -					  bridge->encoder);
> +	drm_connector_attach_encoder(&sbridge->connector, bridge->encoder);
Unrelated change, but patch is trivial...

>  
>  	return 0;
>  }
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
