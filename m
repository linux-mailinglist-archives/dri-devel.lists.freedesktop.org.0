Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E086E21BFCF
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222086ED1B;
	Fri, 10 Jul 2020 22:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19836ED1B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 22:31:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45D092C0;
 Sat, 11 Jul 2020 00:31:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594420303;
 bh=3914qGoWs2TvQGRfDqVkzYWazIOjY4Y7mzqzHfiW8FQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IoJ6wLc+/uCgB76UuNU1VeU7Pw2vs8fGreNAYSRWpa8C9oyvN+CLiX8v5ECuk3adt
 GtSk4PNuRO2zD1BQXFClIfcKWK4fw+A6rs+ubbll9ynYTjpsIShDqyflPKZ6jEk629
 0CymqPWdaDrDBqdhRBxXl7JgdFpZgezRF9xsd+oo=
Date: Sat, 11 Jul 2020 01:31:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 12/21] drm/bridge: parade-ps8622: make connector
 creation optional
Message-ID: <20200710223136.GP5964@pendragon.ideasonboard.com>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-13-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703192417.372164-13-sam@ravnborg.org>
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
 Peter Senna Tschudin <peter.senna@gmail.com>,
 kbuild test robot <lkp@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Fri, Jul 03, 2020 at 09:24:08PM +0200, Sam Ravnborg wrote:
> Make the connector creation optional to enable usage of the
> parade-ps8622 bridge with the DRM bridge connector helper.
> 
> This change moves drm_helper_hpd_irq_event() call in the attach
> function up before the connector creation.

No it doesn't :-)

And I wonder why that call is actually needed.

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/bridge/parade-ps8622.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
> index 6ab6f60b9091..54aa5270d2c9 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8622.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8622.c
> @@ -459,10 +459,8 @@ static int ps8622_attach(struct drm_bridge *bridge,
>  	ret = drm_bridge_attach(ps8622->bridge.encoder, ps8622->panel_bridge,
>  				&ps8622->bridge, flags);
>  
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -		DRM_ERROR("Fix bridge driver to make connector optional!");
> -		return -EINVAL;
> -	}
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +		return 0;
>  
>  	if (!bridge->encoder) {
>  		DRM_ERROR("Parent encoder object not found");
> @@ -482,7 +480,7 @@ static int ps8622_attach(struct drm_bridge *bridge,
>  	drm_connector_attach_encoder(&ps8622->connector,
>  							bridge->encoder);
>  
> -	drm_helper_hpd_irq_event(ps8622->connector.dev);
> +	drm_helper_hpd_irq_event(ps8622->bridge.dev);
>  
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
