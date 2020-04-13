Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD1C1A62C3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 07:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEE06E185;
	Mon, 13 Apr 2020 05:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EE86E185
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 05:58:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id CE3748048A;
 Mon, 13 Apr 2020 07:58:47 +0200 (CEST)
Date: Mon, 13 Apr 2020 07:58:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/4] drm: bridge: adv7511: Split connector creation to a
 separate function
Message-ID: <20200413055846.GD6324@ravnborg.org>
References: <20200409004610.12346-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200409004610.12346-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409004610.12346-3-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=h90TiP3DJ19r7i-q8SIA:9
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent.

On Thu, Apr 09, 2020 at 03:46:08AM +0300, Laurent Pinchart wrote:
> To prepare for making the connector creation optional, move the related
> code out of adv7511_bridge_attach() to a separate function.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

On nit below, but otherwise:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 62 +++++++++++++-------
>  1 file changed, 40 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 58d02e92b6b9..e3b62ad95389 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -783,7 +783,10 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
>  	adv7511->f_tmds = mode->clock;
>  }
>  
> -/* Connector funcs */
> +/* -----------------------------------------------------------------------------
> + * DRM Connector Operations
> + */
> +
>  static struct adv7511 *connector_to_adv7511(struct drm_connector *connector)
>  {
>  	return container_of(connector, struct adv7511, connector);
> @@ -827,7 +830,40 @@ static const struct drm_connector_funcs adv7511_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> -/* Bridge funcs */
> +static int adv7511_connector_init(struct adv7511 *adv)
> +{
> +	struct drm_bridge *bridge = &adv->bridge;
> +	int ret;
> +
> +	if (!bridge->encoder) {
> +		DRM_ERROR("Parent encoder object not found");
> +		return -ENODEV;
> +	}
> +
> +	if (adv->i2c_main->irq)
> +		adv->connector.polled = DRM_CONNECTOR_POLL_HPD;
> +	else
> +		adv->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
> +				DRM_CONNECTOR_POLL_DISCONNECT;
> +
> +	ret = drm_connector_init(bridge->dev, &adv->connector,
> +				 &adv7511_connector_funcs,
> +				 DRM_MODE_CONNECTOR_HDMIA);
> +	if (ret) {

Here we test for ret != 0

> +		DRM_ERROR("Failed to initialize connector with drm\n");
> +		return ret;
> +	}
> +	drm_connector_helper_add(&adv->connector,
> +				 &adv7511_connector_helper_funcs);
> +	drm_connector_attach_encoder(&adv->connector, bridge->encoder);
> +
> +	return 0;
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * DRM Bridge Operations
> + */
> +
>  static struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
>  {
>  	return container_of(bridge, struct adv7511, bridge);
> @@ -867,27 +903,9 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (!bridge->encoder) {
> -		DRM_ERROR("Parent encoder object not found");
> -		return -ENODEV;
> -	}
> -
> -	if (adv->i2c_main->irq)
> -		adv->connector.polled = DRM_CONNECTOR_POLL_HPD;
> -	else
> -		adv->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
> -				DRM_CONNECTOR_POLL_DISCONNECT;
> -
> -	ret = drm_connector_init(bridge->dev, &adv->connector,
> -				 &adv7511_connector_funcs,
> -				 DRM_MODE_CONNECTOR_HDMIA);
> -	if (ret) {
> -		DRM_ERROR("Failed to initialize connector with drm\n");
> +	ret = adv7511_connector_init(adv);
> +	if (ret < 0)
Here we test for ret < 0

The code works - but it is inconsistent.
drm_connector_init() is documented to:
"Zero on success, error code on failure."

>  		return ret;
> -	}
> -	drm_connector_helper_add(&adv->connector,
> -				 &adv7511_connector_helper_funcs);
> -	drm_connector_attach_encoder(&adv->connector, bridge->encoder);
>  
>  	if (adv->type == ADV7533 || adv->type == ADV7535)
>  		ret = adv7533_attach_dsi(adv);
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
