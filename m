Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AE38CB159
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 17:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3486710EC74;
	Tue, 21 May 2024 15:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fM3qqFMc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A190210E07B;
 Tue, 21 May 2024 15:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hJxq03yE81GbJ9vD0GO4wAerIo/AZW+8BZAo9v4UELc=; b=fM3qqFMcH7vhhyyVGp8W9YiEdG
 1AUZc+2obEfrJ2g0s2Z6mSirUjTQlpRnqKTN25H4uUNJDwk2FgISjMnFXdgUy8xHP/P7qqYkDy89Z
 dnxFPxuaS+LCzJQs7ujQknbeDjNi+je+ZFeZR7wg31NBAxXQPgbAQv7D4I80LBcdr7/JhmqlDu3cO
 xFFgi1okQE9dYa+c+KCNuGYaqqSvlCsUPJvzNNEbTgp9GSvfKLDQ4vsfTIbehsQ3WVnir8X+kvl1U
 MGp304QZXeXez0PKXtLQM/9J7dxTU+y8ARHX4qezWt/UaWgUVzTyANn8hVTNcLcJo/7yOaJ5HFqqi
 GmBiAEcQ==;
Received: from [192.168.13.219] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s9RPs-00Ahoz-KE; Tue, 21 May 2024 17:28:40 +0200
Date: Tue, 21 May 2024 17:28:19 +0200
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH v4 09/42] drm/colorop: Introduce new drm_colorop mode
 object
Message-ID: <4toqqrmp4qfap245iywpcxjdsbwbfztjn64eygtvrnx2t5xadd@iosrmfmldcf5>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-10-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226211100.100108-10-harry.wentland@amd.com>
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

On 02/26, Harry Wentland wrote:
> This patches introduces a new drm_colorop mode object. This
> object represents color transformations and can be used to
> define color pipelines.
> 
> We also introduce the drm_colorop_state here, as well as
> various helpers and state tracking bits.
> 
> v4:
>  - Drop IOCTL definitions (Pekka)
>  - add missing declaration (Chaitanya Kumar Borah)
> 
> v3:
>  - Drop TODO for lock (it's handled in drm_modeset_drop_locks)
>    (Melissa)
>  - Don't get plane state when getting colorop state
>  - Make some functions static (kernel test robot)
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/Makefile            |   1 +
>  drivers/gpu/drm/drm_atomic.c        |  70 ++++++++++++
>  drivers/gpu/drm/drm_atomic_helper.c |  12 +++
>  drivers/gpu/drm/drm_atomic_uapi.c   |  48 +++++++++
>  drivers/gpu/drm/drm_colorop.c       | 152 ++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_mode_config.c   |   7 ++
>  include/drm/drm_atomic.h            |  82 +++++++++++++++
>  include/drm/drm_atomic_uapi.h       |   1 +
>  include/drm/drm_colorop.h           | 158 ++++++++++++++++++++++++++++
>  include/drm/drm_mode_config.h       |  18 ++++
>  include/drm/drm_plane.h             |   2 +
>  include/uapi/drm/drm_mode.h         |   1 +
>  12 files changed, 552 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_colorop.c
>  create mode 100644 include/drm/drm_colorop.h
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 104b42df2e95..4b14dcbb6117 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -16,6 +16,7 @@ drm-y := \
>  	drm_client.o \
>  	drm_client_modeset.o \
>  	drm_color_mgmt.o \
> +	drm_colorop.o \
>  	drm_connector.o \
>  	drm_crtc.o \
>  	drm_displayid.o \
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index a91737adf8e7..62e87e6a9653 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -42,6 +42,7 @@
>  #include <drm/drm_mode.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_writeback.h>
> +#include <drm/drm_colorop.h>
>  
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
> @@ -108,6 +109,7 @@ void drm_atomic_state_default_release(struct drm_atomic_state *state)
>  	kfree(state->connectors);
>  	kfree(state->crtcs);
>  	kfree(state->planes);
> +	kfree(state->colorops);
>  	kfree(state->private_objs);
>  }
>  EXPORT_SYMBOL(drm_atomic_state_default_release);
> @@ -139,6 +141,10 @@ drm_atomic_state_init(struct drm_device *dev, struct drm_atomic_state *state)
>  				sizeof(*state->planes), GFP_KERNEL);
>  	if (!state->planes)
>  		goto fail;
> +	state->colorops = kcalloc(dev->mode_config.num_colorop,
> +				  sizeof(*state->colorops), GFP_KERNEL);
> +	if (!state->colorops)
> +		goto fail;
>  
>  	/*
>  	 * Because drm_atomic_state can be committed asynchronously we need our
> @@ -250,6 +256,20 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
>  		state->planes[i].new_state = NULL;
>  	}
>  
> +	for (i = 0; i < config->num_colorop; i++) {
> +		struct drm_colorop *colorop = state->colorops[i].ptr;
> +
> +		if (!colorop)
> +			continue;
> +
> +		drm_colorop_atomic_destroy_state(colorop,
> +						 state->colorops[i].state);
> +		state->colorops[i].ptr = NULL;
> +		state->colorops[i].state = NULL;
> +		state->colorops[i].old_state = NULL;
> +		state->colorops[i].new_state = NULL;
> +	}
> +
>  	for (i = 0; i < state->num_private_objs; i++) {
>  		struct drm_private_obj *obj = state->private_objs[i].ptr;
>  
> @@ -571,6 +591,56 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
>  }
>  EXPORT_SYMBOL(drm_atomic_get_plane_state);
>  
> +
> +/**
> + * drm_atomic_get_colorop_state - get colorop state
> + * @state: global atomic state object
> + * @colorop: colorop to get state object for
> + *
> + * This function returns the colorop state for the given colorop, allocating it
> + * if needed. It will also grab the relevant plane lock to make sure that the
> + * state is consistent.
> + *
> + * Returns:
> + *
> + * Either the allocated state or the error code encoded into the pointer. When
> + * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
> + * entire atomic sequence must be restarted. All other errors are fatal.
> + */
> +struct drm_colorop_state *
> +drm_atomic_get_colorop_state(struct drm_atomic_state *state,
> +			     struct drm_colorop *colorop)
> +{
> +	int ret, index = drm_colorop_index(colorop);
> +	struct drm_colorop_state *colorop_state;
> +
> +	WARN_ON(!state->acquire_ctx);
> +
> +	colorop_state = drm_atomic_get_existing_colorop_state(state, colorop);
> +	if (colorop_state)
> +		return colorop_state;
> +
> +	ret = drm_modeset_lock(&colorop->plane->mutex, state->acquire_ctx);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	colorop_state = drm_atomic_helper_colorop_duplicate_state(colorop);
> +	if (!colorop_state)
> +		return ERR_PTR(-ENOMEM);
> +
> +	state->colorops[index].state = colorop_state;
> +	state->colorops[index].ptr = colorop;
> +	state->colorops[index].old_state = colorop->state;
> +	state->colorops[index].new_state = colorop_state;
> +	colorop_state->state = state;
> +
> +	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d] %p state to %p\n",
> +		       colorop->base.id, colorop_state, state);
> +
> +	return colorop_state;
> +}
> +EXPORT_SYMBOL(drm_atomic_get_colorop_state);
> +
>  static bool
>  plane_switching_crtc(const struct drm_plane_state *old_plane_state,
>  		     const struct drm_plane_state *new_plane_state)
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 39ef0a6addeb..282aa1f7b9a6 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3022,6 +3022,8 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>  	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>  	struct drm_plane *plane;
>  	struct drm_plane_state *old_plane_state, *new_plane_state;
> +	struct drm_colorop *colorop;
> +	struct drm_colorop_state *old_colorop_state, *new_colorop_state;
>  	struct drm_crtc_commit *commit;
>  	struct drm_private_obj *obj;
>  	struct drm_private_state *old_obj_state, *new_obj_state;
> @@ -3099,6 +3101,16 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>  		}
>  	}
>  
> +	for_each_oldnew_colorop_in_state(state, colorop, old_colorop_state, new_colorop_state, i) {
> +		WARN_ON(colorop->state != old_colorop_state);
> +
> +		old_colorop_state->state = state;
> +		new_colorop_state->state = NULL;
> +
> +		state->colorops[i].state = old_colorop_state;
> +		colorop->state = new_colorop_state;
> +	}
> +
>  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
>  		WARN_ON(plane->state != old_plane_state);
>  
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 29d4940188d4..1f9b6dfa8ca7 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -34,6 +34,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_writeback.h>
>  #include <drm/drm_vblank.h>
> +#include <drm/drm_colorop.h>
>  
>  #include <linux/dma-fence.h>
>  #include <linux/uaccess.h>
> @@ -642,6 +643,26 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>  	return 0;
>  }
>  
> +
> +static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
> +		struct drm_colorop_state *state, struct drm_file *file_priv,
> +		struct drm_property *property, uint64_t val)
> +{
> +	drm_dbg_atomic(colorop->dev,
> +			"[COLOROP:%d] unknown property [PROP:%d:%s]]\n",
> +			colorop->base.id,
> +			property->base.id, property->name);
> +	return -EINVAL;
> +}
> +
> +static int
> +drm_atomic_colorop_get_property(struct drm_colorop *colorop,
> +		const struct drm_colorop_state *state,
> +		struct drm_property *property, uint64_t *val)
> +{
> +	return -EINVAL;
> +}
> +
>  static int drm_atomic_set_writeback_fb_for_connector(
>  		struct drm_connector_state *conn_state,
>  		struct drm_framebuffer *fb)
> @@ -904,6 +925,16 @@ int drm_atomic_get_property(struct drm_mode_object *obj,
>  				plane->state, property, val);
>  		break;
>  	}
> +	case DRM_MODE_OBJECT_COLOROP: {
> +		struct drm_colorop *colorop = obj_to_colorop(obj);
> +
> +		if (colorop->plane)
> +			WARN_ON(!drm_modeset_is_locked(&colorop->plane->mutex));
> +
> +		ret = drm_atomic_colorop_get_property(colorop,
> +				colorop->state, property, val);
> +		break;
> +	}
>  	default:
>  		drm_dbg_atomic(dev, "[OBJECT:%d] has no properties\n", obj->id);
>  		ret = -EINVAL;
> @@ -1084,6 +1115,23 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>  		ret = drm_atomic_plane_set_property(plane,
>  				plane_state, file_priv,
>  				prop, prop_value);
> +
> +		break;
> +	}
> +	case DRM_MODE_OBJECT_COLOROP: {
> +		struct drm_colorop *colorop = obj_to_colorop(obj);
> +		struct drm_colorop_state *colorop_state;
> +
> +		colorop_state = drm_atomic_get_colorop_state(state, colorop);
> +		if (IS_ERR(colorop_state)) {
> +			ret = PTR_ERR(colorop_state);
> +			break;
> +		}
> +
> +		ret = drm_atomic_colorop_set_property(colorop,
> +				colorop_state, file_priv,
> +				prop, prop_value);
> +
>  		break;
>  	}
>  	default:
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> new file mode 100644
> index 000000000000..a295ab96aee1
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -0,0 +1,152 @@
> +/*
> + * Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */
> +
> +#include <drm/drm_colorop.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_plane.h>
> +
> +#include "drm_crtc_internal.h"
> +
> +/* TODO big colorop doc, including properties, etc. */
> +
> +/* Init Helpers */
> +
> +int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
> +		     struct drm_plane *plane)
> +{
> +	struct drm_mode_config *config = &dev->mode_config;
> +	int ret = 0;
> +
> +	ret = drm_mode_object_add(dev, &colorop->base, DRM_MODE_OBJECT_COLOROP);
> +	if (ret)
> +		return ret;
> +
> +	colorop->base.properties = &colorop->properties;
> +	colorop->dev = dev;
> +	colorop->plane = plane;
> +
> +	list_add_tail(&colorop->head, &config->colorop_list);
> +	colorop->index = config->num_colorop++;
> +
> +	/* add properties */
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_colorop_init);
> +
> +static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
> +							struct drm_colorop_state *state)
> +{
> +	memcpy(state, colorop->state, sizeof(*state));
> +}
> +
> +struct drm_colorop_state *
> +drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop)
> +{
> +	struct drm_colorop_state *state;
> +
> +	if (WARN_ON(!colorop->state))
> +		return NULL;
> +
> +	state = kmalloc(sizeof(*state), GFP_KERNEL);
> +	if (state)
> +		__drm_atomic_helper_colorop_duplicate_state(colorop, state);
> +
> +	return state;
> +}
> +
> +
> +void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
> +				      struct drm_colorop_state *state)
> +{
> +	kfree(state);
> +}
> +
> +/**
> + * drm_colorop_destroy_state - default state destroy hook
> + * @colorop: drm colorop
> + * @state: colorop state object to release
> + *
> + * Default colorop state destroy hook for drivers which don't have their own
> + * subclassed colorop state structure.
> + */
> +void drm_colorop_destroy_state(struct drm_colorop *colorop,
> +			       struct drm_colorop_state *state)
> +{
> +	kfree(state);
> +}
> +EXPORT_SYMBOL(drm_colorop_destroy_state);
> +
> +/**
> + * __drm_colorop_state_reset - resets colorop state to default values
> + * @colorop_state: atomic colorop state, must not be NULL
> + * @colorop: colorop object, must not be NULL
> + *
> + * Initializes the newly allocated @colorop_state with default
> + * values. This is useful for drivers that subclass the CRTC state.
> + */
> +static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
> +				      struct drm_colorop *colorop)
> +{
> +	colorop_state->colorop = colorop;
> +}
> +
> +/**
> + * __drm_colorop_reset - reset state on colorop
> + * @colorop: drm colorop
> + * @colorop_state: colorop state to assign
> + *
> + * Initializes the newly allocated @colorop_state and assigns it to
> + * the &drm_crtc->state pointer of @colorop, usually required when
> + * initializing the drivers or when called from the &drm_colorop_funcs.reset
> + * hook.
> + *
> + * This is useful for drivers that subclass the colorop state.
> + */
> +static void __drm_colorop_reset(struct drm_colorop *colorop,
> +				struct drm_colorop_state *colorop_state)
> +{
> +	if (colorop_state)
> +		__drm_colorop_state_reset(colorop_state, colorop);
> +
> +	colorop->state = colorop_state;
> +}
> +
> +/**
> + * drm_colorop_reset - reset colorop atomic state
> + * @colorop: drm colorop
> + *
> + * Resets the atomic state for @colorop by freeing the state pointer (which might
> + * be NULL, e.g. at driver load time) and allocating a new empty state object.
> + */
> +void drm_colorop_reset(struct drm_colorop *colorop)
> +{
> +	kfree(colorop->state);
> +	colorop->state = kzalloc(sizeof(*colorop->state), GFP_KERNEL);
> +
> +	if (colorop->state)
> +		__drm_colorop_reset(colorop, colorop->state);
> +}
> +EXPORT_SYMBOL(drm_colorop_reset);
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 8525ef851540..30c6fb10353b 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -29,6 +29,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_mode_config.h>
>  #include <drm/drm_print.h>
> +#include <drm/drm_colorop.h>
>  #include <linux/dma-resv.h>
>  
>  #include "drm_crtc_internal.h"
> @@ -182,11 +183,15 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
>  void drm_mode_config_reset(struct drm_device *dev)
>  {
>  	struct drm_crtc *crtc;
> +	struct drm_colorop *colorop;
>  	struct drm_plane *plane;
>  	struct drm_encoder *encoder;
>  	struct drm_connector *connector;
>  	struct drm_connector_list_iter conn_iter;
>  
> +	drm_for_each_colorop(colorop, dev)
> +		drm_colorop_reset(colorop);
> +
>  	drm_for_each_plane(plane, dev)
>  		if (plane->funcs->reset)
>  			plane->funcs->reset(plane);
> @@ -413,6 +418,7 @@ int drmm_mode_config_init(struct drm_device *dev)
>  	INIT_LIST_HEAD(&dev->mode_config.property_list);
>  	INIT_LIST_HEAD(&dev->mode_config.property_blob_list);
>  	INIT_LIST_HEAD(&dev->mode_config.plane_list);
> +	INIT_LIST_HEAD(&dev->mode_config.colorop_list);
>  	INIT_LIST_HEAD(&dev->mode_config.privobj_list);
>  	idr_init_base(&dev->mode_config.object_idr, 1);
>  	idr_init_base(&dev->mode_config.tile_idr, 1);
> @@ -434,6 +440,7 @@ int drmm_mode_config_init(struct drm_device *dev)
>  	dev->mode_config.num_crtc = 0;
>  	dev->mode_config.num_encoder = 0;
>  	dev->mode_config.num_total_plane = 0;
> +	dev->mode_config.num_colorop = 0;
>  
>  	if (IS_ENABLED(CONFIG_LOCKDEP)) {
>  		struct drm_modeset_acquire_ctx modeset_ctx;
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index cf8e1220a4ac..634b2827765f 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -30,6 +30,7 @@
>  
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_util.h>
> +#include <drm/drm_colorop.h>
>  
>  /**
>   * struct drm_crtc_commit - track modeset commits on a CRTC
> @@ -157,6 +158,11 @@ struct drm_crtc_commit {
>  	bool abort_completion;
>  };
>  
> +struct __drm_colorops_state {
> +	struct drm_colorop *ptr;
> +	struct drm_colorop_state *state, *old_state, *new_state;
> +};
> +
>  struct __drm_planes_state {
>  	struct drm_plane *ptr;
>  	struct drm_plane_state *state, *old_state, *new_state;
> @@ -398,6 +404,7 @@ struct drm_atomic_state {
>  	 * states.
>  	 */
>  	bool duplicated : 1;
> +	struct __drm_colorops_state *colorops;
>  	struct __drm_planes_state *planes;
>  	struct __drm_crtcs_state *crtcs;
>  	int num_connector;
> @@ -501,6 +508,9 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
>  struct drm_plane_state * __must_check
>  drm_atomic_get_plane_state(struct drm_atomic_state *state,
>  			   struct drm_plane *plane);
> +struct drm_colorop_state *
> +drm_atomic_get_colorop_state(struct drm_atomic_state *state,
> +			     struct drm_colorop *colorop);
>  struct drm_connector_state * __must_check
>  drm_atomic_get_connector_state(struct drm_atomic_state *state,
>  			       struct drm_connector *connector);
> @@ -630,6 +640,55 @@ drm_atomic_get_new_plane_state(const struct drm_atomic_state *state,
>  	return state->planes[drm_plane_index(plane)].new_state;
>  }
>  
> +
> +/**
> + * drm_atomic_get_existing_colorop_state - get colorop state, if it exists
> + * @state: global atomic state object
> + * @colorop: colorop to grab
> + *
> + * This function returns the colorop state for the given colorop, or NULL
> + * if the colorop is not part of the global atomic state.
> + *
> + * This function is deprecated, @drm_atomic_get_old_colorop_state or
> + * @drm_atomic_get_new_colorop_state should be used instead.
> + */
> +static inline struct drm_colorop_state *
> +drm_atomic_get_existing_colorop_state(struct drm_atomic_state *state,
> +				    struct drm_colorop *colorop)
> +{
> +	return state->colorops[drm_colorop_index(colorop)].state;
> +}
> +
> +/**
> + * drm_atomic_get_old_colorop_state - get colorop state, if it exists
> + * @state: global atomic state object
> + * @colorop: colorop to grab
> + *
> + * This function returns the old colorop state for the given colorop, or
> + * NULL if the colorop is not part of the global atomic state.
> + */
> +static inline struct drm_colorop_state *
> +drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
> +			       struct drm_colorop *colorop)
> +{
> +	return state->colorops[drm_colorop_index(colorop)].old_state;
> +}
> +
> +/**
> + * drm_atomic_get_new_colorop_state - get colorop state, if it exists
> + * @state: global atomic state object
> + * @colorop: colorop to grab
> + *
> + * This function returns the new colorop state for the given colorop, or
> + * NULL if the colorop is not part of the global atomic state.
> + */
> +static inline struct drm_colorop_state *
> +drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
> +			       struct drm_colorop *colorop)
> +{
> +	return state->colorops[drm_colorop_index(colorop)].new_state;
> +}
> +
>  /**
>   * drm_atomic_get_existing_connector_state - get connector state, if it exists
>   * @state: global atomic state object
> @@ -877,6 +936,29 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
>  			     (new_crtc_state) = (__state)->crtcs[__i].new_state, \
>  			     (void)(new_crtc_state) /* Only to avoid unused-but-set-variable warning */, 1))
>  
> +/**
> + * for_each_oldnew_colorop_in_state - iterate over all colorops in an atomic update
> + * @__state: &struct drm_atomic_state pointer
> + * @colorop: &struct drm_colorop iteration cursor
> + * @old_colorop_state: &struct drm_colorop_state iteration cursor for the old state
> + * @new_colorop_state: &struct drm_colorop_state iteration cursor for the new state
> + * @__i: int iteration cursor, for macro-internal use
> + *
> + * This iterates over all colorops in an atomic update, tracking both old and
> + * new state. This is useful in places where the state delta needs to be
> + * considered, for example in atomic check functions.
> + */
> +#define for_each_oldnew_colorop_in_state(__state, colorop, old_colorop_state, new_colorop_state, __i) \
> +	for ((__i) = 0;							\
> +	     (__i) < (__state)->dev->mode_config.num_colorop;	\
> +	     (__i)++)							\
> +		for_each_if ((__state)->colorops[__i].ptr &&		\
> +			     ((colorop) = (__state)->colorops[__i].ptr,	\
> +			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
> +			      (old_colorop_state) = (__state)->colorops[__i].old_state,\
> +			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))
> +
> +
>  /**
>   * for_each_oldnew_plane_in_state - iterate over all planes in an atomic update
>   * @__state: &struct drm_atomic_state pointer
> diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
> index 4c6d39d7bdb2..70a115d523cd 100644
> --- a/include/drm/drm_atomic_uapi.h
> +++ b/include/drm/drm_atomic_uapi.h
> @@ -37,6 +37,7 @@ struct drm_crtc;
>  struct drm_connector_state;
>  struct dma_fence;
>  struct drm_framebuffer;
> +struct drm_colorop;
>  
>  int __must_check
>  drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> new file mode 100644
> index 000000000000..e611f830f986
> --- /dev/null
> +++ b/include/drm/drm_colorop.h
> @@ -0,0 +1,158 @@
> +/*
> + * Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */
> +
> +#ifndef __DRM_COLOROP_H__
> +#define __DRM_COLOROP_H__
> +
> +#include <drm/drm_mode_object.h>
> +#include <drm/drm_mode.h>
> +#include <drm/drm_property.h>
> +
> +/**
> + * struct drm_colorop_state - mutable colorop state
> + */
> +struct drm_colorop_state {
> +	/** @colorop: backpointer to the colorop */
> +	struct drm_colorop *colorop;
> +
> +	/* colorop properties */
> +
> +	/** @state: backpointer to global drm_atomic_state */
> +	struct drm_atomic_state *state;
> +};
> +
> +/**
> + * struct drm_colorop - DRM color operation control structure
> + *
> + * A colorop represents one color operation. They can be chained via
> + * the 'next' pointer to build a color pipeline.
> + */
> +struct drm_colorop {
> +	/** @dev: parent DRM device */
> +	struct drm_device *dev;
> +
> +	/**
> +	 * @head:
> +	 *
> +	 * List of all colorops on @dev, linked from &drm_mode_config.colorop_list.
> +	 * Invariant over the lifetime of @dev and therefore does not need
> +	 * locking.
> +	 */
> +	struct list_head head;
> +
> +	/**
> +	 * @index: Position inside the mode_config.list, can be used as an array
> +	 * index. It is invariant over the lifetime of the plane.
> +	 */
> +	unsigned index;
> +
> +	/* TODO do we need a separate mutex or will we tag along with the plane mutex? */
> +
> +	/** @base base mode object*/
> +	struct drm_mode_object base;
> +
> +	/**
> +	 * @plane:
> +	 *
> +	 * The plane on which the colorop sits. A drm_colorop is always unique
> +	 * to a plane.
> +	 */
> +	struct drm_plane *plane;
> +
> +	/**
> +	 * @state:
> +	 *
> +	 * Current atomic state for this colorop.
> +	 *
> +	 * This is protected by @mutex. Note that nonblocking atomic commits
> +	 * access the current colorop state without taking locks. Either by
> +	 * going through the &struct drm_atomic_state pointers, see
> +	 * for_each_oldnew_plane_in_state(), for_each_old_plane_in_state() and
> +	 * for_each_new_plane_in_state(). Or through careful ordering of atomic
> +	 * commit operations as implemented in the atomic helpers, see
> +	 * &struct drm_crtc_commit.
> +	 *
> +	 * TODO keep, remove, or rewrite above plane references?
> +	 */
> +	struct drm_colorop_state *state;
> +
> +	/* colorop properties */
> +
> +	/** @properties: property tracking for this plane */
> +	struct drm_object_properties properties;
> +
> +};
> +
> +#define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
> +
> +/**
> + * drm_crtc_find - look up a Colorop object from its ID
> + * @dev: DRM device
> + * @file_priv: drm file to check for lease against.
> + * @id: &drm_mode_object ID
> + *
> + * This can be used to look up a Colorop from its userspace ID. Only used by
> + * drivers for legacy IOCTLs and interface, nowadays extensions to the KMS
> + * userspace interface should be done using &drm_property.
> + */
> +static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
> +		struct drm_file *file_priv,
> +		uint32_t id)
> +{
> +	struct drm_mode_object *mo;
> +	mo = drm_mode_object_find(dev, file_priv, id, DRM_MODE_OBJECT_COLOROP);
> +	return mo ? obj_to_colorop(mo) : NULL;
> +}
> +
> +int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
> +		     struct drm_plane *plane);
> +
> +struct drm_colorop_state *
> +drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
> +
> +void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
> +				      struct drm_colorop_state *state);
> +void drm_colorop_destroy_state(struct drm_colorop *colorop,
> +			       struct drm_colorop_state *state);
> +void drm_colorop_reset(struct drm_colorop *colorop);
> +
> +/**
> + * drm_colorop_index - find the index of a registered colorop
> + * @colorop: colorop to find index for
> + *
> + * Given a registered colorop, return the index of that colorop within a DRM
> + * device's list of colorops.
> + */
> +static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
> +{
> +	return colorop->index;
> +}
> +
> +
> +#define drm_for_each_colorop(colorop, dev) \
> +	list_for_each_entry(colorop, &(dev)->mode_config.colorop_list, head)
> +
> +
> +#endif /* __DRM_COLOROP_H__ */
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 973119a9176b..492b8c120c80 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -505,6 +505,24 @@ struct drm_mode_config {
>  	 */
>  	struct list_head plane_list;
>  
> +	/**
> +	 * @num_colorop:
> +	 *
> +	 * Number of colorop objects on this device.
> +	 * This is invariant over the lifetime of a device and hence doesn't
> +	 * need any locks.
> +	 */
> +	int num_colorop;
> +
> +	/**
> +	 * @colorops_list:
> +	 *
> +	 * List of colorop objects linked with &drm_colorop.head. This is
> +	 * invariant over the lifetime of a device and hence doesn't need any
> +	 * locks.
> +	 */
> +	struct list_head colorop_list;
> +
>  	/**
>  	 * @num_crtc:
>  	 *
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 641fe298052d..9c8c1322f0a6 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -241,6 +241,8 @@ struct drm_plane_state {
>  	 */
>  	enum drm_scaling_filter scaling_filter;
>  

Missing kerneldocs for @color_pipeline.

> +	struct drm_colorop *color_pipeline;
> +
>  	/**
>  	 * @commit: Tracks the pending commit to prevent use-after-free conditions,
>  	 * and for async plane updates.
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 7040e7ea80c7..9e8f383935db 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -629,6 +629,7 @@ struct drm_mode_connector_set_property {
>  #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
>  #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
>  #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
> +#define DRM_MODE_OBJECT_COLOROP 0xfafafafa
>  #define DRM_MODE_OBJECT_ANY 0
>  
>  struct drm_mode_obj_get_properties {
> -- 
> 2.44.0
> 
