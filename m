Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E1F2AB5B7
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 12:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED13893DB;
	Mon,  9 Nov 2020 11:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABD2893DB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:03:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1378AB2B;
 Mon,  9 Nov 2020 12:03:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604919782;
 bh=xRa8w6ysXTritw4cNAe85haL9Wl5CZBptunuNi8PhZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eSTrWEWLrU59R8K9RvOQhoRoaHs/5a/LQjRtPIAL+uLiA489BremE8xFrRiOEPLaw
 73fz+nUZz/MfNMAKlGKEHyYnCL37yKWU60Ks6R/NyezXPst+C/7OrwPsRPcnxzg9/D
 0eWUBTlM+R0QLm6oaDeBfjsH4+Z7mPZtr3rjmtOU=
Date: Mon, 9 Nov 2020 13:02:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 43/56] drm/omap: remove unused omap_connector
Message-ID: <20201109110258.GN6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-44-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-44-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:20PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Remove unused code. Connectors are now created via drm_bridge_connector_init()
> and no longer OMAP specific.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/Makefile         |   1 -
>  drivers/gpu/drm/omapdrm/omap_connector.c | 128 -----------------------
>  drivers/gpu/drm/omapdrm/omap_connector.h |  28 -----
>  drivers/gpu/drm/omapdrm/omap_drv.c       |  19 ++--
>  drivers/gpu/drm/omapdrm/omap_drv.h       |   1 -
>  drivers/gpu/drm/omapdrm/omap_encoder.c   |  11 --
>  6 files changed, 6 insertions(+), 182 deletions(-)
>  delete mode 100644 drivers/gpu/drm/omapdrm/omap_connector.c
>  delete mode 100644 drivers/gpu/drm/omapdrm/omap_connector.h
> 
> diff --git a/drivers/gpu/drm/omapdrm/Makefile b/drivers/gpu/drm/omapdrm/Makefile
> index 66a73eae6f7c..2a404e045b78 100644
> --- a/drivers/gpu/drm/omapdrm/Makefile
> +++ b/drivers/gpu/drm/omapdrm/Makefile
> @@ -12,7 +12,6 @@ omapdrm-y := omap_drv.o \
>  	omap_crtc.o \
>  	omap_plane.o \
>  	omap_encoder.o \
> -	omap_connector.o \
>  	omap_fb.o \
>  	omap_gem.o \
>  	omap_gem_dmabuf.o \
> diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm/omapdrm/omap_connector.c
> deleted file mode 100644
> index c6d9b4268841..000000000000
> --- a/drivers/gpu/drm/omapdrm/omap_connector.c
> +++ /dev/null
> @@ -1,128 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> - * Author: Rob Clark <rob@ti.com>
> - */
> -
> -#include <drm/drm_atomic_helper.h>
> -#include <drm/drm_crtc.h>
> -#include <drm/drm_probe_helper.h>
> -
> -#include "omap_drv.h"
> -
> -/*
> - * connector funcs
> - */
> -
> -#define to_omap_connector(x) container_of(x, struct omap_connector, base)
> -
> -struct omap_connector {
> -	struct drm_connector base;
> -	struct omap_dss_device *output;
> -};
> -
> -static enum drm_connector_status omap_connector_detect(
> -		struct drm_connector *connector, bool force)
> -{
> -	return connector_status_connected;
> -}
> -
> -static void omap_connector_destroy(struct drm_connector *connector)
> -{
> -	struct omap_connector *omap_connector = to_omap_connector(connector);
> -
> -	DBG("%s", connector->name);
> -
> -	drm_connector_unregister(connector);
> -	drm_connector_cleanup(connector);
> -
> -	omapdss_device_put(omap_connector->output);
> -
> -	kfree(omap_connector);
> -}
> -
> -static int omap_connector_get_modes(struct drm_connector *connector)
> -{
> -	DBG("%s", connector->name);
> -
> -	/* We can't retrieve modes. The KMS core will add the default modes. */
> -	return 0;
> -}
> -
> -enum drm_mode_status omap_connector_mode_fixup(struct omap_dss_device *dssdev,
> -					const struct drm_display_mode *mode,
> -					struct drm_display_mode *adjusted_mode)
> -{
> -	return MODE_OK;
> -}
> -
> -static enum drm_mode_status omap_connector_mode_valid(struct drm_connector *connector,
> -				 struct drm_display_mode *mode)
> -{
> -	struct omap_connector *omap_connector = to_omap_connector(connector);
> -	struct drm_display_mode new_mode = {};
> -	enum drm_mode_status status;
> -
> -	status = omap_connector_mode_fixup(omap_connector->output, mode,
> -					   &new_mode);
> -	if (status != MODE_OK)
> -		goto done;
> -
> -	/* Check if vrefresh is still valid. */
> -	if (drm_mode_vrefresh(mode) != drm_mode_vrefresh(&new_mode))
> -		status = MODE_NOCLOCK;
> -
> -done:
> -	DBG("connector: mode %s: " DRM_MODE_FMT,
> -			(status == MODE_OK) ? "valid" : "invalid",
> -			DRM_MODE_ARG(mode));
> -
> -	return status;
> -}
> -
> -static const struct drm_connector_funcs omap_connector_funcs = {
> -	.reset = drm_atomic_helper_connector_reset,
> -	.detect = omap_connector_detect,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = omap_connector_destroy,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
> -static const struct drm_connector_helper_funcs omap_connector_helper_funcs = {
> -	.get_modes = omap_connector_get_modes,
> -	.mode_valid = omap_connector_mode_valid,
> -};
> -
> -/* initialize connector */
> -struct drm_connector *omap_connector_init(struct drm_device *dev,
> -					  struct omap_dss_device *output,
> -					  struct drm_encoder *encoder)
> -{
> -	struct drm_connector *connector = NULL;
> -	struct omap_connector *omap_connector;
> -
> -	DBG("%s", output->name);
> -
> -	omap_connector = kzalloc(sizeof(*omap_connector), GFP_KERNEL);
> -	if (!omap_connector)
> -		goto fail;
> -
> -	omap_connector->output = omapdss_device_get(output);
> -
> -	connector = &omap_connector->base;
> -	connector->interlace_allowed = 1;
> -	connector->doublescan_allowed = 0;
> -
> -	drm_connector_init(dev, connector, &omap_connector_funcs,
> -			   DRM_MODE_CONNECTOR_DSI);
> -	drm_connector_helper_add(connector, &omap_connector_helper_funcs);
> -
> -	return connector;
> -
> -fail:
> -	if (connector)
> -		omap_connector_destroy(connector);
> -
> -	return NULL;
> -}
> diff --git a/drivers/gpu/drm/omapdrm/omap_connector.h b/drivers/gpu/drm/omapdrm/omap_connector.h
> deleted file mode 100644
> index 0ecd4f1655b7..000000000000
> --- a/drivers/gpu/drm/omapdrm/omap_connector.h
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * omap_connector.h -- OMAP DRM Connector
> - *
> - * Copyright (C) 2011 Texas Instruments
> - * Author: Rob Clark <rob@ti.com>
> - */
> -
> -#ifndef __OMAPDRM_CONNECTOR_H__
> -#define __OMAPDRM_CONNECTOR_H__
> -
> -#include <linux/types.h>
> -
> -enum drm_mode_status;
> -
> -struct drm_connector;
> -struct drm_device;
> -struct drm_encoder;
> -struct omap_dss_device;
> -
> -struct drm_connector *omap_connector_init(struct drm_device *dev,
> -					  struct omap_dss_device *output,
> -					  struct drm_encoder *encoder);
> -enum drm_mode_status omap_connector_mode_fixup(struct omap_dss_device *dssdev,
> -					const struct drm_display_mode *mode,
> -					struct drm_display_mode *adjusted_mode);
> -
> -#endif /* __OMAPDRM_CONNECTOR_H__ */
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index b342f5b6ced0..20b5b4e9071c 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -332,19 +332,12 @@ static int omap_modeset_init(struct drm_device *dev)
>  		struct drm_encoder *encoder = pipe->encoder;
>  		struct drm_crtc *crtc;
>  
> -		if (pipe->output->next) {
> -			pipe->connector = omap_connector_init(dev, pipe->output,
> -							      encoder);
> -			if (!pipe->connector)
> -				return -ENOMEM;
> -		} else {
> -			pipe->connector = drm_bridge_connector_init(dev, encoder);
> -			if (IS_ERR(pipe->connector)) {
> -				dev_err(priv->dev,
> -					"unable to create bridge connector for %s\n",
> -					pipe->output->name);
> -				return PTR_ERR(pipe->connector);
> -			}
> +		pipe->connector = drm_bridge_connector_init(dev, encoder);
> +		if (IS_ERR(pipe->connector)) {
> +			dev_err(priv->dev,
> +				"unable to create bridge connector for %s\n",
> +				pipe->output->name);
> +			return PTR_ERR(pipe->connector);
>  		}
>  
>  		drm_connector_attach_encoder(pipe->connector, encoder);
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
> index 8a1fac680138..93d171ffd26d 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.h
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.h
> @@ -16,7 +16,6 @@
>  #include <drm/drm_gem.h>
>  #include <drm/omap_drm.h>
>  
> -#include "omap_connector.h"
>  #include "omap_crtc.h"
>  #include "omap_encoder.h"
>  #include "omap_fb.h"
> diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
> index abb3821de8b8..610c5a2f2771 100644
> --- a/drivers/gpu/drm/omapdrm/omap_encoder.c
> +++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
> @@ -139,17 +139,6 @@ static int omap_encoder_atomic_check(struct drm_encoder *encoder,
>  				     struct drm_crtc_state *crtc_state,
>  				     struct drm_connector_state *conn_state)
>  {
> -	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
> -	enum drm_mode_status status;
> -
> -	status = omap_connector_mode_fixup(omap_encoder->output,
> -					   &crtc_state->mode,
> -					   &crtc_state->adjusted_mode);
> -	if (status != MODE_OK) {
> -		dev_err(encoder->dev->dev, "invalid timings: %d\n", status);
> -		return -EINVAL;
> -	}
> -
>  	return 0;
>  }

We can drop this function.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
