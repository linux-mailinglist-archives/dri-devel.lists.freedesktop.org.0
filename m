Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 678FB407FCC
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 21:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071CD89DFB;
	Sun, 12 Sep 2021 19:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C1289DFB
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 19:50:34 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id a9728134-1402-11ec-9416-0050568cd888;
 Sun, 12 Sep 2021 19:50:20 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 34F31194C7D;
 Sun, 12 Sep 2021 21:50:23 +0200 (CEST)
Date: Sun, 12 Sep 2021 21:50:29 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/bridge: Add a function to abstract away panels
Message-ID: <YT5aBZJvoIrDh/75@ravnborg.org>
References: <20210910130941.1740182-1-maxime@cerno.tech>
 <20210910130941.1740182-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910130941.1740182-2-maxime@cerno.tech>
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

On Fri, Sep 10, 2021 at 03:09:39PM +0200, Maxime Ripard wrote:
> Display drivers so far need to have a lot of boilerplate to first
> retrieve either the panel or bridge that they are connected to using
> drm_of_find_panel_or_bridge(), and then either deal with each with ad-hoc
> functions or create a drm panel bridge through drm_panel_bridge_add.
> 
> In order to reduce the boilerplate and hopefully create a path of least
> resistance towards using the DRM panel bridge layer, let's create the
> function devm_drm_of_get_next to reduce that boilerplate.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/drm_bridge.c | 42 ++++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/drm_of.c     |  3 +++
>  include/drm/drm_bridge.h     |  2 ++
>  3 files changed, 43 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index a8ed66751c2d..10ddca4638b0 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -28,6 +28,7 @@
>  #include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_print.h>
>  
>  #include "drm_crtc_internal.h"
> @@ -51,10 +52,8 @@
>   *
>   * Display drivers are responsible for linking encoders with the first bridge
>   * in the chains. This is done by acquiring the appropriate bridge with
> - * of_drm_find_bridge() or drm_of_find_panel_or_bridge(), or creating it for a
> - * panel with drm_panel_bridge_add_typed() (or the managed version
> - * devm_drm_panel_bridge_add_typed()). Once acquired, the bridge shall be
> - * attached to the encoder with a call to drm_bridge_attach().
> + * devm_drm_of_get_bridge(). Once acquired, the bridge shall be attached to the
> + * encoder with a call to drm_bridge_attach().
>   *
>   * Bridges are responsible for linking themselves with the next bridge in the
>   * chain, if any. This is done the same way as for encoders, with the call to
> @@ -1233,6 +1232,41 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  	return NULL;
>  }
>  EXPORT_SYMBOL(of_drm_find_bridge);
> +
> +/**
> + * devm_drm_of_get_bridge - Return next bridge in the chain
> + * @dev: device to tie the bridge lifetime to
> + * @np: device tree node containing encoder output ports
> + * @port: port in the device tree node
> + * @endpoint: endpoint in the device tree node
> + *
> + * Given a DT node's port and endpoint number, finds the connected node
> + * and returns the associated bridge if any, or creates and returns a
> + * drm panel bridge instance if a panel is connected.
> + *
> + * Returns a pointer to the bridge if successful, or an error pointer
> + * otherwise.
> + */
> +struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> +					  struct device_node *np,
> +					  unsigned int port,
> +					  unsigned int endpoint)
One extra comment.
In of_graph_get_remote_node() port is u32
In drm_of_find_panel_or_bridge() port is int
Here port is unsigned int

My OCD would benefit if we used u32 here - as this is consistent with
the base function of_graph_get_remote_node().

	Sam


> +{
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
> +	int ret;
> +
> +	ret = drm_of_find_panel_or_bridge(np, port, endpoint,
> +					  &panel, &bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (panel)
> +		bridge = devm_drm_panel_bridge_add(dev, panel);
> +
> +	return bridge;
> +}
> +EXPORT_SYMBOL(devm_drm_of_get_bridge);
>  #endif
>  
>  MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 997b8827fed2..37c34146eea8 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -231,6 +231,9 @@ EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
>   * return either the associated struct drm_panel or drm_bridge device. Either
>   * @panel or @bridge must not be NULL.
>   *
> + * This function is deprecated and should not be used in new drivers. Use
> + * devm_drm_of_get_bridge() instead.
> + *
>   * Returns zero if successful, or one of the standard error codes if it fails.
>   */
>  int drm_of_find_panel_or_bridge(const struct device_node *np,
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 46bdfa48c413..f70c88ca96ef 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -911,6 +911,8 @@ struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
>  struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
>  						   struct drm_panel *panel,
>  						   u32 connector_type);
> +struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node *node,
> +					unsigned int port, unsigned int endpoint);
>  struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
>  #endif
>  
> -- 
> 2.31.1
