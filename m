Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C8D42E0F1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3656EBA4;
	Thu, 14 Oct 2021 18:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414D26EBA4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 18:15:41 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id bc2b3072-2d1a-11ec-9c3f-0050568c148b;
 Thu, 14 Oct 2021 18:15:39 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 635BD194B76;
 Thu, 14 Oct 2021 20:15:46 +0200 (CEST)
Date: Thu, 14 Oct 2021 20:15:36 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] drm/meson: encoder_cvbs: switch to bridge with
 ATTACH_NO_CONNECTOR
Message-ID: <YWhzyIBemCrm9U5v@ravnborg.org>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
 <20211014152606.2289528-8-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014152606.2289528-8-narmstrong@baylibre.com>
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

Hi Neil,

with include order fixed and the comment below considered:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam


On Thu, Oct 14, 2021 at 05:26:06PM +0200, Neil Armstrong wrote:
> Drop the local connector and move all callback to bridge funcs in order
> to leverage the generic CVBS diplay connector.
> 
> This will also permit adding custom cvbs connectors for ADC based HPD
> detection on some Amlogic SoC based boards.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c | 178 +++++++++------------
>  1 file changed, 79 insertions(+), 99 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> index 01024c5f610c..0b974667cf55 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> @@ -13,6 +13,9 @@
>  #include <linux/of_graph.h>
>  
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
alphabetic order.

> @@ -30,14 +33,14 @@
>  
>  struct meson_encoder_cvbs {
>  	struct drm_encoder	encoder;
> -	struct drm_connector	connector;
> +	struct drm_bridge	bridge;
> +	struct drm_bridge	*next_bridge;
> +	struct drm_connector	*connector;
Maybe drop this - see later.

>  	struct meson_drm	*priv;
>  };
> -#define encoder_to_meson_encoder_cvbs(x) \
> -	container_of(x, struct meson_encoder_cvbs, encoder)
>  
> -#define connector_to_meson_encoder_cvbs(x) \
> -	container_of(x, struct meson_encoder_cvbs, connector)
> +#define bridge_to_meson_encoder_cvbs(x) \
> +	container_of(x, struct meson_encoder_cvbs, bridge)
>  
>  /* Supported Modes */
>  
> @@ -81,21 +84,18 @@ meson_cvbs_get_mode(const struct drm_display_mode *req_mode)
>  	return NULL;
>  }
>  
> -/* Connector */
> -
> -static void meson_cvbs_connector_destroy(struct drm_connector *connector)
> +static int meson_encoder_cvbs_attach(struct drm_bridge *bridge,
> +				     enum drm_bridge_attach_flags flags)
>  {
> -	drm_connector_cleanup(connector);
> -}
> +	struct meson_encoder_cvbs *meson_encoder_cvbs =
> +					bridge_to_meson_encoder_cvbs(bridge);
>  
> -static enum drm_connector_status
> -meson_cvbs_connector_detect(struct drm_connector *connector, bool force)
> -{
> -	/* FIXME: Add load-detect or jack-detect if possible */
> -	return connector_status_connected;
> +	return drm_bridge_attach(bridge->encoder, meson_encoder_cvbs->next_bridge,
> +				 &meson_encoder_cvbs->bridge, flags);
>  }
>  
> -static int meson_cvbs_connector_get_modes(struct drm_connector *connector)
> +static int meson_encoder_cvbs_get_modes(struct drm_bridge *bridge,
> +					struct drm_connector *connector)
>  {
>  	struct drm_device *dev = connector->dev;
>  	struct drm_display_mode *mode;
> @@ -116,40 +116,18 @@ static int meson_cvbs_connector_get_modes(struct drm_connector *connector)
>  	return i;
>  }
>  
> -static int meson_cvbs_connector_mode_valid(struct drm_connector *connector,
> -					   struct drm_display_mode *mode)
> +static int meson_encoder_cvbs_mode_valid(struct drm_bridge *bridge,
> +					const struct drm_display_info *display_info,
> +					const struct drm_display_mode *mode)
>  {
> -	/* Validate the modes added in get_modes */
> -	return MODE_OK;
> -}
> -
> -static const struct drm_connector_funcs meson_cvbs_connector_funcs = {
> -	.detect			= meson_cvbs_connector_detect,
> -	.fill_modes		= drm_helper_probe_single_connector_modes,
> -	.destroy		= meson_cvbs_connector_destroy,
> -	.reset			= drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
> -};
> -
> -static const
> -struct drm_connector_helper_funcs meson_cvbs_connector_helper_funcs = {
> -	.get_modes	= meson_cvbs_connector_get_modes,
> -	.mode_valid	= meson_cvbs_connector_mode_valid,
> -};
> +	if (meson_cvbs_get_mode(mode))
> +		return MODE_OK;
>  
> -/* Encoder */
> -
> -static void meson_encoder_cvbs_encoder_destroy(struct drm_encoder *encoder)
> -{
> -	drm_encoder_cleanup(encoder);
> +	return MODE_BAD;
>  }
>  
> -static const struct drm_encoder_funcs meson_encoder_cvbs_encoder_funcs = {
> -	.destroy        = meson_encoder_cvbs_encoder_destroy,
> -};
> -
> -static int meson_encoder_cvbs_encoder_atomic_check(struct drm_encoder *encoder,
> +static int meson_encoder_cvbs_atomic_check(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
>  					struct drm_crtc_state *crtc_state,
>  					struct drm_connector_state *conn_state)
>  {
> @@ -159,10 +137,10 @@ static int meson_encoder_cvbs_encoder_atomic_check(struct drm_encoder *encoder,
>  	return -EINVAL;
>  }
>  
> -static void meson_encoder_cvbs_encoder_disable(struct drm_encoder *encoder)
> +static void meson_encoder_cvbs_disable(struct drm_bridge *bridge)
>  {
>  	struct meson_encoder_cvbs *meson_encoder_cvbs =
> -					encoder_to_meson_encoder_cvbs(encoder);
> +					bridge_to_meson_encoder_cvbs(bridge);
>  	struct meson_drm *priv = meson_encoder_cvbs->priv;
>  
>  	/* Disable CVBS VDAC */
> @@ -175,10 +153,10 @@ static void meson_encoder_cvbs_encoder_disable(struct drm_encoder *encoder)
>  	}
>  }
>  
> -static void meson_encoder_cvbs_encoder_enable(struct drm_encoder *encoder)
> +static void meson_encoder_cvbs_enable(struct drm_bridge *bridge)
>  {
>  	struct meson_encoder_cvbs *meson_encoder_cvbs =
> -					encoder_to_meson_encoder_cvbs(encoder);
> +					bridge_to_meson_encoder_cvbs(bridge);
>  	struct meson_drm *priv = meson_encoder_cvbs->priv;
>  
>  	/* VDAC0 source is not from ATV */
> @@ -198,13 +176,13 @@ static void meson_encoder_cvbs_encoder_enable(struct drm_encoder *encoder)
>  	}
>  }
>  
> -static void meson_encoder_cvbs_encoder_mode_set(struct drm_encoder *encoder,
> -				   struct drm_display_mode *mode,
> -				   struct drm_display_mode *adjusted_mode)
> +static void meson_encoder_cvbs_mode_set(struct drm_bridge *bridge,
> +				   const struct drm_display_mode *mode,
> +				   const struct drm_display_mode *adjusted_mode)
>  {
>  	const struct meson_cvbs_mode *meson_mode = meson_cvbs_get_mode(mode);
>  	struct meson_encoder_cvbs *meson_encoder_cvbs =
> -					encoder_to_meson_encoder_cvbs(encoder);
> +					bridge_to_meson_encoder_cvbs(bridge);
>  	struct meson_drm *priv = meson_encoder_cvbs->priv;
>  
>  	if (meson_mode) {
> @@ -218,76 +196,78 @@ static void meson_encoder_cvbs_encoder_mode_set(struct drm_encoder *encoder,
>  	}
>  }
>  
> -static const struct drm_encoder_helper_funcs
> -				meson_encoder_cvbs_encoder_helper_funcs = {
> -	.atomic_check	= meson_encoder_cvbs_encoder_atomic_check,
> -	.disable	= meson_encoder_cvbs_encoder_disable,
> -	.enable		= meson_encoder_cvbs_encoder_enable,
> -	.mode_set	= meson_encoder_cvbs_encoder_mode_set,
> +static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
> +	.attach = meson_encoder_cvbs_attach,
> +	.enable	= meson_encoder_cvbs_enable,
> +	.disable = meson_encoder_cvbs_disable,
> +	.mode_valid = meson_encoder_cvbs_mode_valid,
> +	.mode_set = meson_encoder_cvbs_mode_set,
> +	.get_modes = meson_encoder_cvbs_get_modes,
> +	.atomic_check = meson_encoder_cvbs_atomic_check,
>  };
>  
> -static bool meson_encoder_cvbs_connector_is_available(struct meson_drm *priv)
> -{
> -	struct device_node *remote;
> -
> -	remote = of_graph_get_remote_node(priv->dev->of_node, 0, 0);
> -	if (!remote)
> -		return false;
> -
> -	of_node_put(remote);
> -	return true;
> -}
> -
>  int meson_encoder_cvbs_init(struct meson_drm *priv)
>  {
>  	struct drm_device *drm = priv->drm;
>  	struct meson_encoder_cvbs *meson_encoder_cvbs;
> -	struct drm_connector *connector;
> -	struct drm_encoder *encoder;
> +	struct device_node *remote;
>  	int ret;
>  
> -	if (!meson_encoder_cvbs_connector_is_available(priv)) {
> +	meson_encoder_cvbs = devm_kzalloc(priv->dev, sizeof(*meson_encoder_cvbs), GFP_KERNEL);
> +	if (!meson_encoder_cvbs)
> +		return -ENOMEM;
> +
> +	/* CVBS Connector Bridge */
> +	remote = of_graph_get_remote_node(priv->dev->of_node, 0, 0);
> +	if (!remote) {
>  		dev_info(drm->dev, "CVBS Output connector not available\n");
>  		return 0;
>  	}
>  
> -	meson_encoder_cvbs = devm_kzalloc(priv->dev, sizeof(*meson_encoder_cvbs),
> -				       GFP_KERNEL);
> -	if (!meson_encoder_cvbs)
> -		return -ENOMEM;
> +	meson_encoder_cvbs->next_bridge = of_drm_find_bridge(remote);
> +	if (!meson_encoder_cvbs->next_bridge) {
> +		dev_err(priv->dev, "Failed to find CVBS Connector bridge\n");
> +		return -EPROBE_DEFER;
> +	}
>  
> -	meson_encoder_cvbs->priv = priv;
> -	encoder = &meson_encoder_cvbs->encoder;
> -	connector = &meson_encoder_cvbs->connector;
> +	/* CVBS Encoder Bridge */
> +	meson_encoder_cvbs->bridge.funcs = &meson_encoder_cvbs_bridge_funcs;
> +	meson_encoder_cvbs->bridge.of_node = priv->dev->of_node;
> +	meson_encoder_cvbs->bridge.type = DRM_MODE_CONNECTOR_Composite;
> +	meson_encoder_cvbs->bridge.ops = DRM_BRIDGE_OP_MODES;
> +	meson_encoder_cvbs->bridge.interlace_allowed = true;
>  
> -	/* Connector */
> +	drm_bridge_add(&meson_encoder_cvbs->bridge);
>  
> -	drm_connector_helper_add(connector,
> -				 &meson_cvbs_connector_helper_funcs);
> +	meson_encoder_cvbs->priv = priv;
>  
> -	ret = drm_connector_init(drm, connector, &meson_cvbs_connector_funcs,
> -				 DRM_MODE_CONNECTOR_Composite);
> +	/* Encoder */
> +	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
> +				      DRM_MODE_ENCODER_TVDAC);
>  	if (ret) {
> -		dev_err(priv->dev, "Failed to init CVBS connector\n");
> +		dev_err(priv->dev, "Failed to init CVBS encoder: %d\n", ret);
>  		return ret;
>  	}
>  
> -	connector->interlace_allowed = 1;
> +	meson_encoder_cvbs->encoder.possible_crtcs = BIT(0);
>  
> -	/* Encoder */
> -
> -	drm_encoder_helper_add(encoder, &meson_encoder_cvbs_encoder_helper_funcs);
> -
> -	ret = drm_encoder_init(drm, encoder, &meson_encoder_cvbs_encoder_funcs,
> -			       DRM_MODE_ENCODER_TVDAC, "meson_encoder_cvbs");
> +	/* Attach CVBS Encoder Bridge to Encoder */
> +	ret = drm_bridge_attach(&meson_encoder_cvbs->encoder, &meson_encoder_cvbs->bridge, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  	if (ret) {
> -		dev_err(priv->dev, "Failed to init CVBS encoder\n");
> +		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
>  		return ret;
>  	}
>  
> -	encoder->possible_crtcs = BIT(0);
> -
> -	drm_connector_attach_encoder(connector, encoder);
> +	/* Initialize & attach Bridge Connector */
> +	meson_encoder_cvbs->connector = drm_bridge_connector_init(priv->drm,
> +							&meson_encoder_cvbs->encoder);
I did not see other uses of meson_encoder_cvbs->connector, so if I am
right a local variable can be used and the member dropped.

> +	if (IS_ERR(meson_encoder_cvbs->connector)) {
> +		dev_err(priv->dev, "Unable to create CVBS bridge connector\n");
> +		return PTR_ERR(meson_encoder_cvbs->connector);
> +	}
> +	drm_connector_attach_encoder(meson_encoder_cvbs->connector,
> +				     &meson_encoder_cvbs->encoder);
>  
>  	return 0;
>  }
> -- 
> 2.25.1
