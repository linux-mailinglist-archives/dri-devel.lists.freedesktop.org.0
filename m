Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF993EAAEB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 21:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904D96E44B;
	Thu, 12 Aug 2021 19:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A43C6E44B;
 Thu, 12 Aug 2021 19:26:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD590EE;
 Thu, 12 Aug 2021 21:26:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628796373;
 bh=HbBlo2yWHVQ3aoOqeeRbXctYweM1HQRkPbkGnoGkmAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TrLHsZ2sWHkahSyRLDuG7pk/hVeRGE3yFQwfYRlo18c9+koVOxl747/uxFdPfVFrp
 wkPcJgLLhzKwdUtC/iLt3hWQqZmY6m+knctxWOHMdanx3Epd59w3V7PEqegbi528Xb
 dZE0Zp2YbzLBm7VJUqt475GlADrVCLoojE6ZslIE=
Date: Thu, 12 Aug 2021 22:26:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
Message-ID: <YRV10ew/Lr8GPzEv@pendragon.ideasonboard.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-5-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210811235253.924867-5-robdclark@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thank you for the patch.

On Wed, Aug 11, 2021 at 04:52:50PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Slightly awkward to fish out the display_info when we aren't creating
> own connector.  But I don't see an obvious better way.

We need a bit more than this, to support the NO_CONNECTOR case, the
bridge has to implement a few extra operations, and set the bridge .ops
field. I've submitted two patches to do so a while ago:

- [RFC PATCH 08/11] drm/bridge: ti-sn65dsi86: Implement bridge connector operations ([1])
- [RFC PATCH 09/11] drm/bridge: ti-sn65dsi86: Make connector creation optional ([2])

The second patch is similar to the first half of this patch, but misses
the cleanup code. I'll try to rebase this and resubmit, but it may take
a bit of time.

[1] https://lore.kernel.org/dri-devel/20210322030128.2283-9-laurent.pinchart+renesas@ideasonboard.com/
[2] https://lore.kernel.org/dri-devel/20210322030128.2283-10-laurent.pinchart+renesas@ideasonboard.com/

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 34 +++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 38dcc49eccaf..dc8112bab3d3 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -693,9 +693,11 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  		return ret;
>  	}
>  
> -	ret = ti_sn_bridge_connector_init(pdata);
> -	if (ret < 0)
> -		goto err_conn_init;
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		ret = ti_sn_bridge_connector_init(pdata);
> +		if (ret < 0)
> +			goto err_conn_init;
> +	}
>  
>  	/*
>  	 * TODO: ideally finding host resource and dsi dev registration needs
> @@ -757,7 +759,8 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  err_dsi_attach:
>  	mipi_dsi_device_unregister(dsi);
>  err_dsi_host:
> -	drm_connector_cleanup(&pdata->connector);
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> +		drm_connector_cleanup(&pdata->connector);
>  err_conn_init:
>  	drm_dp_aux_unregister(&pdata->aux);
>  	return ret;
> @@ -806,9 +809,30 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
>  	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
>  }
>  
> +/*
> + * Find the connector and fish out the bpc from display_info.  It would
> + * be nice if we could get this instead from drm_bridge_state, but that
> + * doesn't yet appear to be the case.
> + */

This should be done with

	struct drm_atomic_state *state = old_bridge_state->base.state;
	struct drm_connector *connector;

	connector = drm_atomic_get_new_connector_for_encoder(state,
							     bridge->encoder);

>  static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
>  {
> -	if (pdata->connector.display_info.bpc <= 6)
> +	struct drm_bridge *bridge = &pdata->bridge;
> +	struct drm_connector_list_iter conn_iter;
> +	struct drm_connector *connector;
> +	unsigned bpc = 0;
> +
> +	drm_connector_list_iter_begin(bridge->dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		if (drm_connector_has_possible_encoder(connector, bridge->encoder)) {
> +			bpc = connector->display_info.bpc;
> +			break;
> +		}
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +
> +	WARN_ON(bpc == 0);
> +
> +	if (bpc <= 6)
>  		return 18;
>  	else
>  		return 24;

-- 
Regards,

Laurent Pinchart
