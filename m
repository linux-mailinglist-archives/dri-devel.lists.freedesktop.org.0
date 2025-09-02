Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82376B40EFC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 23:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697D110E047;
	Tue,  2 Sep 2025 21:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UK7eR5xq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B96910E047
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 21:05:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8147C22B;
 Tue,  2 Sep 2025 23:03:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1756847040;
 bh=+NhFen8lqeeS6CtLQKPKbBmAXFZwuGiszeMMKNdEp+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UK7eR5xqbEFSLY+AL46giPtIcuqTQvwSQy6/+h+1fxhuk1g/WzHULWt8Ce4GybR4d
 3HWCpsB/Fh0xCb15HmDmpxe2tPFxox3G+kVTujBD8T2UZcpJoh4u3sw0xY3A/8MWTl
 VQYbkQkpU6OUz0rR1Ld9J6Z64oMAyV0LBUTgzYZw=
Date: Tue, 2 Sep 2025 23:04:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/29] drm/modeset: Create atomic_reset hook
Message-ID: <20250902210445.GX13448@pendragon.ideasonboard.com>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-9-14ad5315da3f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902-drm-state-readout-v1-9-14ad5315da3f@kernel.org>
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

On Tue, Sep 02, 2025 at 10:32:37AM +0200, Maxime Ripard wrote:
> Since we're about to integrate some infrastructure to implement hardware
> state readout, we need a way to differentiate between drivers wanting to
> start from a pristine state, with the classic reset sequence, and
> drivers that want to pickup their initial state from reading out the
> hardware state.
> 
> To do so we can create an optional reset hook in
> drm_mode_config_helper_funcs that will default to the classic reset
> implementation, and can be setup to a helper we will provide in a later
> patch to read the hardware state.

I'm a bit puzzled by this. Isn't the whole point of the existing reset
operations to allow drivers to read out the hardware state if they wish
? Why do we need something new ?

> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_mode_config.c        | 32 +++++++++++++++++++++++---------
>  include/drm/drm_modeset_helper_vtables.h | 13 +++++++++++++
>  2 files changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 25f376869b3a41d47bbe72b0df3e35cad142f3e6..82180760032d3490d63fe83136465d2c26551d08 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -27,10 +27,11 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_mode_config.h>
> +#include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_print.h>
>  #include <linux/dma-resv.h>
>  
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
> @@ -179,19 +180,11 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
>  	drm_connector_list_iter_end(&conn_iter);
>  
>  	return ret;
>  }
>  
> -/**
> - * drm_mode_config_reset - call ->reset callbacks
> - * @dev: drm device
> - *
> - * This functions calls all the crtc's, encoder's and connector's ->reset
> - * callback. Drivers can use this in e.g. their driver load or resume code to
> - * reset hardware and software state.
> - */
> -void drm_mode_config_reset(struct drm_device *dev)
> +static void drm_mode_config_reset_pristine(struct drm_device *dev)
>  {
>  	struct drm_crtc *crtc;
>  	struct drm_plane *plane;
>  	struct drm_encoder *encoder;
>  	struct drm_connector *connector;
> @@ -213,10 +206,31 @@ void drm_mode_config_reset(struct drm_device *dev)
>  	drm_for_each_connector_iter(connector, &conn_iter)
>  		if (connector->funcs->reset)
>  			connector->funcs->reset(connector);
>  	drm_connector_list_iter_end(&conn_iter);
>  }
> +
> +/**
> + * drm_mode_config_reset - call ->reset callbacks
> + * @dev: drm device
> + *
> + * This functions calls all the crtc's, encoder's and connector's ->reset
> + * callback. Drivers can use this in e.g. their driver load or resume code to
> + * reset hardware and software state.
> + */
> +void drm_mode_config_reset(struct drm_device *dev)
> +{
> +	if (drm_core_check_feature(dev, DRIVER_ATOMIC)) {
> +		const struct drm_mode_config_helper_funcs *funcs =
> +			dev->mode_config.helper_private;
> +
> +		if (funcs && funcs->atomic_reset)
> +			return funcs->atomic_reset(dev);
> +	}
> +
> +	return drm_mode_config_reset_pristine(dev);
> +}
>  EXPORT_SYMBOL(drm_mode_config_reset);
>  
>  /*
>   * Global properties
>   */
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index ce7c7aeac887bb8438d73710f16071c97a851839..6d22a7676d6bf49fb78af4d0706bd91005cef186 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -1561,8 +1561,21 @@ struct drm_mode_config_helper_funcs {
>  	 * how one should implement this.
>  	 *
>  	 * This hook is optional.
>  	 */
>  	int (*atomic_commit_setup)(struct drm_atomic_state *state);
> +
> +	/**
> +	 * @atomic_reset:
> +	 *
> +	 * This hook is used to create the initial @drm_atomic_state.
> +	 * It's used by drm_mode_config_reset().
> +	 *
> +	 * The default implementation will create an empty one, but
> +	 * drivers can provide an alternative implementation to, for
> +	 * example, read the initial state from hardware to implement
> +	 * flicker-free and / or faster boot.
> +	 */
> +	void (*atomic_reset)(struct drm_device *dev);
>  };
>  
>  #endif
> 

-- 
Regards,

Laurent Pinchart
