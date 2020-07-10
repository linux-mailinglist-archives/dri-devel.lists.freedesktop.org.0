Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 813E521BFD8
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A7A6ED2D;
	Fri, 10 Jul 2020 22:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CC26ED2D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 22:34:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABD282C0;
 Sat, 11 Jul 2020 00:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594420476;
 bh=y8KQaHG+NXVEzmo/4qwAPQGNOQlyAanHVuZueEHoZww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VghpAI8/w/bXGRRUdsoESQxf9uM2VXKIIOLe01ONtf5WVh/JKInK28gHLMPUZQJpT
 5wM8UY95s3QuCSlnZlDTQRKvekrJncCY4qLI1VU19Ep6mva776+T8vd8pp7w/1cJIS
 GZuTxQP1YMsXFtAQZiJHTlhSi6LVp21A1k8XK0hw=
Date: Sat, 11 Jul 2020 01:34:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 13/21] drm/bridge: megachips: add helper to create
 connector
Message-ID: <20200710223430.GQ5964@pendragon.ideasonboard.com>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-14-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703192417.372164-14-sam@ravnborg.org>
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
 Martin Donnelly <martin.donnelly@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Fri, Jul 03, 2020 at 09:24:09PM +0200, Sam Ravnborg wrote:
> Factor out connector creation to a small helper function.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Peter Senna Tschudin <peter.senna@gmail.com>
> Cc: Martin Donnelly <martin.donnelly@ge.com>
> Cc: Martyn Welch <martyn.welch@collabora.co.uk>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  | 47 +++++++++++--------
>  1 file changed, 27 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index 6200f12a37e6..258e0525cdcc 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -191,6 +191,32 @@ static const struct drm_connector_funcs ge_b850v3_lvds_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> +static int ge_b850v3_lvds_create_connector(struct drm_bridge *bridge)
> +{
> +	struct drm_connector *connector = &ge_b850v3_lvds_ptr->connector;

Wow, storing device state in a global variable... :-( How did this go
past review ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	int ret;
> +
> +	if (!bridge->encoder) {
> +		DRM_ERROR("Parent encoder object not found");
> +		return -ENODEV;
> +	}
> +
> +	connector->polled = DRM_CONNECTOR_POLL_HPD;
> +
> +	drm_connector_helper_add(connector,
> +				 &ge_b850v3_lvds_connector_helper_funcs);
> +
> +	ret = drm_connector_init(bridge->dev, connector,
> +				 &ge_b850v3_lvds_connector_funcs,
> +				 DRM_MODE_CONNECTOR_DisplayPort);
> +	if (ret) {
> +		DRM_ERROR("Failed to initialize connector with drm\n");
> +		return ret;
> +	}
> +
> +	return drm_connector_attach_encoder(connector, bridge->encoder);
> +}
> +
>  static irqreturn_t ge_b850v3_lvds_irq_handler(int irq, void *dev_id)
>  {
>  	struct i2c_client *stdp4028_i2c
> @@ -209,7 +235,6 @@ static irqreturn_t ge_b850v3_lvds_irq_handler(int irq, void *dev_id)
>  static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
>  				 enum drm_bridge_attach_flags flags)
>  {
> -	struct drm_connector *connector = &ge_b850v3_lvds_ptr->connector;
>  	struct i2c_client *stdp4028_i2c
>  			= ge_b850v3_lvds_ptr->stdp4028_i2c;
>  	int ret;
> @@ -219,25 +244,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (!bridge->encoder) {
> -		DRM_ERROR("Parent encoder object not found");
> -		return -ENODEV;
> -	}
> -
> -	connector->polled = DRM_CONNECTOR_POLL_HPD;
> -
> -	drm_connector_helper_add(connector,
> -				 &ge_b850v3_lvds_connector_helper_funcs);
> -
> -	ret = drm_connector_init(bridge->dev, connector,
> -				 &ge_b850v3_lvds_connector_funcs,
> -				 DRM_MODE_CONNECTOR_DisplayPort);
> -	if (ret) {
> -		DRM_ERROR("Failed to initialize connector with drm\n");
> -		return ret;
> -	}
> -
> -	ret = drm_connector_attach_encoder(connector, bridge->encoder);
> +	ret = ge_b850v3_lvds_create_connector(bridge);
>  	if (ret)
>  		return ret;
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
