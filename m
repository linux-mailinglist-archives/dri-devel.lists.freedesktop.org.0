Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08162568388
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 11:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53F81130D6;
	Wed,  6 Jul 2022 09:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665891130D4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 09:35:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCE3230A;
 Wed,  6 Jul 2022 11:35:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1657100129;
 bh=4zkQzHQrrr0qsqWadoeQZ13X+oUw8LH4NzxBxEpmJsY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IUuT7PpCOomOoes0GgNHu1sykwJIuuibpUu6xsq5o3djYjNbgCVFY9PUpd6ahxO6g
 PdbA7Uhkn2CCimY7mbzkwrtIWmHBukLu1HgMo9P/+G8+l1Jqyo3TNaKGFHbuzYegD5
 X9bd+yQpRP0YOqr9fXOXfphE50sVH5LVkw6yReKs=
Date: Wed, 6 Jul 2022 12:35:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH 1/3] drm/fb: rename FB CMA helpers to FB DMA helpers
Message-ID: <YsVXR4bLp8G7FU8j@pendragon.ideasonboard.com>
References: <20220705212613.732039-1-dakr@redhat.com>
 <20220705212613.732039-2-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220705212613.732039-2-dakr@redhat.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

Thank you for the patch. I've been bothered by the CMA name in this
helper for quite some time but never found time to fix it, so I'm happy
to see these patches.

On Tue, Jul 05, 2022 at 11:26:11PM +0200, Danilo Krummrich wrote:
> Rename "FB CMA" helpers to "FB DMA" helpers - considering the hierarchy
> of APIs (mm/cma -> dma -> fb dma) calling them "FB DMA" seems to be
> more applicable.
> 
> Besides that, commit e57924d4ae80 ("drm/doc: Task to rename CMA helpers")
> requests to rename the CMA helpers and implies that people seem to be
> confused about the naming.
> 
> In order to do this renaming the following script was used:
> 
> ```
> 	#!/bin/bash
> 
> 	DIRS="drivers/gpu include/drm Documentation/gpu"
> 
> 	REGEX_SYM_UPPER="[0-9A-Z_\-]"
> 	REGEX_SYM_LOWER="[0-9a-z_\-]"
> 
> 	REGEX_GREP_UPPER="(${REGEX_SYM_UPPER}*)(FB)_CMA_(${REGEX_SYM_UPPER}*)"
> 	REGEX_GREP_LOWER="(${REGEX_SYM_LOWER}*)(fb)_cma_(${REGEX_SYM_LOWER}*)"
> 
> 	REGEX_SED_UPPER="s/${REGEX_GREP_UPPER}/\1\2_DMA_\3/g"
> 	REGEX_SED_LOWER="s/${REGEX_GREP_LOWER}/\1\2_dma_\3/g"
> 
> 	# Find all upper case 'CMA' symbols and replace them with 'DMA'.
> 	for ff in $(grep -REHl "${REGEX_GREP_UPPER}" $DIRS)
> 	do
> 	       sed -i -E "$REGEX_SED_UPPER" $ff
> 	done
> 
> 	# Find all lower case 'cma' symbols and replace them with 'dma'.
> 	for ff in $(grep -REHl "${REGEX_GREP_LOWER}" $DIRS)
> 	do
> 	       sed -i -E "$REGEX_SED_LOWER" $ff
> 	done
> 
> 	# Replace all occurrences of 'CMA' / 'cma' in comments and
> 	# documentation files with 'DMA' / 'dma'.
> 	for ff in $(grep -RiHl " cma " $DIRS)
> 	do
> 		sed -i -E "s/ cma / dma /g" $ff
> 		sed -i -E "s/ CMA / DMA /g" $ff
> 	done
> ```
> 
> Only a few more manual modifications were needed, e.g. reverting the
> following modifications in some DRM Kconfig files
> 
>     -       select CMA if HAVE_DMA_CONTIGUOUS
>     +       select DMA if HAVE_DMA_CONTIGUOUS
> 
> as well as manually picking the occurrences of 'CMA'/'cma' in comments and
> documentation which relate to "FB CMA", but not "GEM CMA".
> 
> This patch is compile-time tested building a x86_64 kernel with
> `make allyesconfig && make drivers/gpu/drm`.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  Documentation/gpu/drm-kms-helpers.rst         |  8 ++--
>  drivers/gpu/drm/Makefile                      |  2 +-
>  .../arm/display/komeda/komeda_framebuffer.c   |  4 +-
>  drivers/gpu/drm/arm/hdlcd_crtc.c              |  4 +-
>  drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
>  drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
>  drivers/gpu/drm/arm/malidp_mw.c               |  4 +-
>  drivers/gpu/drm/arm/malidp_planes.c           |  8 ++--
>  drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c      |  4 +-
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  4 +-
>  ...rm_fb_cma_helper.c => drm_fb_dma_helper.c} | 38 +++++++++----------
>  drivers/gpu/drm/drm_format_helper.c           |  4 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c     |  2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c   |  4 +-
>  .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  4 +-
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
>  drivers/gpu/drm/imx/dcss/dcss-plane.c         |  6 +--
>  drivers/gpu/drm/imx/imx-drm-core.c            |  2 +-
>  drivers/gpu/drm/imx/ipuv3-crtc.c              |  2 +-
>  drivers/gpu/drm/imx/ipuv3-plane.c             |  8 ++--
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  6 +--
>  drivers/gpu/drm/ingenic/ingenic-ipu.c         | 10 ++---
>  drivers/gpu/drm/kmb/kmb_plane.c               |  8 ++--
>  drivers/gpu/drm/mcde/mcde_display.c           |  6 +--
>  drivers/gpu/drm/mcde/mcde_drv.c               |  4 +-
>  drivers/gpu/drm/meson/meson_overlay.c         |  8 ++--
>  drivers/gpu/drm/meson/meson_plane.c           |  4 +-
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c             |  8 ++--
>  drivers/gpu/drm/pl111/pl111_display.c         |  6 +--
>  drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  4 +-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  4 +-
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c     |  6 +--
>  drivers/gpu/drm/shmobile/shmob_drm_kms.c      |  2 +-
>  drivers/gpu/drm/shmobile/shmob_drm_plane.c    |  6 +--
>  drivers/gpu/drm/solomon/ssd130x.c             |  2 +-
>  drivers/gpu/drm/sprd/sprd_dpu.c               |  4 +-
>  drivers/gpu/drm/sti/sti_cursor.c              |  6 +--
>  drivers/gpu/drm/sti/sti_drv.c                 |  2 +-
>  drivers/gpu/drm/sti/sti_gdp.c                 |  6 +--
>  drivers/gpu/drm/sti/sti_hqvdp.c               |  6 +--
>  drivers/gpu/drm/sti/sti_plane.c               |  2 +-
>  drivers/gpu/drm/stm/drv.c                     |  2 +-
>  drivers/gpu/drm/stm/ltdc.c                    | 14 +++----
>  drivers/gpu/drm/sun4i/sun4i_backend.c         |  4 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_frontend.c        |  8 ++--
>  drivers/gpu/drm/sun4i/sun8i_mixer.c           |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  4 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  4 +-
>  drivers/gpu/drm/tegra/fb.c                    |  2 +-
>  drivers/gpu/drm/tidss/tidss_crtc.c            |  2 +-
>  drivers/gpu/drm/tidss/tidss_dispc.c           |  6 +--
>  drivers/gpu/drm/tidss/tidss_kms.c             |  2 +-
>  drivers/gpu/drm/tidss/tidss_plane.c           |  2 +-
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c          |  4 +-
>  drivers/gpu/drm/tiny/arcpgu.c                 |  4 +-
>  drivers/gpu/drm/tiny/ili9225.c                |  4 +-
>  drivers/gpu/drm/tiny/repaper.c                |  4 +-
>  drivers/gpu/drm/tiny/st7586.c                 |  4 +-
>  drivers/gpu/drm/tve200/tve200_display.c       | 10 ++---
>  drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
>  drivers/gpu/drm/v3d/v3d_drv.c                 |  2 +-
>  drivers/gpu/drm/vc4/vc4_crtc.c                |  8 ++--
>  drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +-
>  drivers/gpu/drm/vc4/vc4_plane.c               | 10 ++---
>  drivers/gpu/drm/vc4/vc4_txp.c                 |  4 +-
>  drivers/gpu/drm/xlnx/zynqmp_disp.c            |  4 +-
>  ...rm_fb_cma_helper.h => drm_fb_dma_helper.h} | 10 ++---
>  74 files changed, 181 insertions(+), 181 deletions(-)
>  rename drivers/gpu/drm/{drm_fb_cma_helper.c => drm_fb_dma_helper.c} (75%)
>  rename include/drm/{drm_fb_cma_helper.h => drm_fb_dma_helper.h} (56%)

[snip]

> diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
> similarity index 75%
> rename from drivers/gpu/drm/drm_fb_cma_helper.c
> rename to drivers/gpu/drm/drm_fb_dma_helper.c
> index 69c57273b184..69b8e0534191 100644
> --- a/drivers/gpu/drm/drm_fb_cma_helper.c
> +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * drm kms/fb cma (contiguous memory allocator) helper functions
> + * drm kms/fb dma helper functions
>   *
>   * Copyright (C) 2012 Analog Devices Inc.
>   *   Author: Lars-Peter Clausen <lars@metafoo.de>
> @@ -10,7 +10,7 @@
>   */
>  
>  #include <drm/drm_damage_helper.h>
> -#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fb_dma_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_cma_helper.h>
> @@ -20,17 +20,17 @@
>  #include <linux/module.h>
>  
>  /**
> - * DOC: framebuffer cma helper functions
> + * DOC: framebuffer dma helper functions
>   *
> - * Provides helper functions for creating a cma (contiguous memory allocator)
> - * backed framebuffer.
> + * Provides helper functions for creating a (contiguous) dma capable

I would drop the parentheses around "contiguous" here, as the whole
point of this helper is to provide DMA-contiguous framebuffer. You could
write it as

 * Provides helper functions to create a DMA-contiguous framebuffer.

> + * framebuffer.
>   *
>   * drm_gem_fb_create() is used in the &drm_mode_config_funcs.fb_create
> - * callback function to create a cma backed framebuffer.
> + * callback function to create a dma backed framebuffer.

"dma backed" doesn't make much sense I think, I'd write "to create a
DMA-contiguous framebuffer".

>   */
>  
>  /**
> - * drm_fb_cma_get_gem_obj() - Get CMA GEM object for framebuffer
> + * drm_fb_dma_get_gem_obj() - Get CMA GEM object for framebuffer
>   * @fb: The framebuffer
>   * @plane: Which plane
>   *
> @@ -38,7 +38,7 @@
>   *
>   * This function will usually be called from the CRTC callback functions.
>   */
> -struct drm_gem_cma_object *drm_fb_cma_get_gem_obj(struct drm_framebuffer *fb,
> +struct drm_gem_cma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
>  						  unsigned int plane)
>  {
>  	struct drm_gem_object *gem;
> @@ -49,20 +49,20 @@ struct drm_gem_cma_object *drm_fb_cma_get_gem_obj(struct drm_framebuffer *fb,
>  
>  	return to_drm_gem_cma_obj(gem);
>  }
> -EXPORT_SYMBOL_GPL(drm_fb_cma_get_gem_obj);
> +EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_obj);
>  
>  /**
> - * drm_fb_cma_get_gem_addr() - Get physical address for framebuffer, for pixel
> + * drm_fb_dma_get_gem_addr() - Get physical address for framebuffer, for pixel

It's actually the DMA address, not the physical address, so you could
fix it while at it.

>   * formats where values are grouped in blocks this will get you the beginning of
>   * the block
>   * @fb: The framebuffer
>   * @state: Which state of drm plane
>   * @plane: Which plane
> - * Return the CMA GEM address for given framebuffer.
> + * Return the DMA GEM address for given framebuffer.
>   *
>   * This function will usually be called from the PLANE callback functions.
>   */
> -dma_addr_t drm_fb_cma_get_gem_addr(struct drm_framebuffer *fb,
> +dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
>  				   struct drm_plane_state *state,
>  				   unsigned int plane)
>  {
> @@ -77,7 +77,7 @@ dma_addr_t drm_fb_cma_get_gem_addr(struct drm_framebuffer *fb,
>  	u32 block_start_y;
>  	u32 num_hblocks;
>  
> -	obj = drm_fb_cma_get_gem_obj(fb, plane);
> +	obj = drm_fb_dma_get_gem_obj(fb, plane);
>  	if (!obj)
>  		return 0;
>  
> @@ -98,10 +98,10 @@ dma_addr_t drm_fb_cma_get_gem_addr(struct drm_framebuffer *fb,
>  
>  	return paddr;
>  }
> -EXPORT_SYMBOL_GPL(drm_fb_cma_get_gem_addr);
> +EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
>  
>  /**
> - * drm_fb_cma_sync_non_coherent - Sync GEM object to non-coherent backing
> + * drm_fb_dma_sync_non_coherent - Sync GEM object to non-coherent backing
>   *	memory
>   * @drm: DRM device
>   * @old_state: Old plane state
> @@ -112,7 +112,7 @@ EXPORT_SYMBOL_GPL(drm_fb_cma_get_gem_addr);
>   * in a plane's .atomic_update ensures that all the data in the backing
>   * memory have been written to RAM.
>   */
> -void drm_fb_cma_sync_non_coherent(struct drm_device *drm,
> +void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
>  				  struct drm_plane_state *old_state,
>  				  struct drm_plane_state *state)
>  {
> @@ -125,11 +125,11 @@ void drm_fb_cma_sync_non_coherent(struct drm_device *drm,
>  	size_t nb_bytes;
>  
>  	for (i = 0; i < finfo->num_planes; i++) {
> -		cma_obj = drm_fb_cma_get_gem_obj(state->fb, i);
> +		cma_obj = drm_fb_dma_get_gem_obj(state->fb, i);
>  		if (!cma_obj->map_noncoherent)
>  			continue;
>  
> -		daddr = drm_fb_cma_get_gem_addr(state->fb, state, i);
> +		daddr = drm_fb_dma_get_gem_addr(state->fb, state, i);
>  		drm_atomic_helper_damage_iter_init(&iter, old_state, state);
>  
>  		drm_atomic_for_each_plane_damage(&iter, &clip) {
> @@ -142,4 +142,4 @@ void drm_fb_cma_sync_non_coherent(struct drm_device *drm,
>  		}
>  	}
>  }
> -EXPORT_SYMBOL_GPL(drm_fb_cma_sync_non_coherent);
> +EXPORT_SYMBOL_GPL(drm_fb_dma_sync_non_coherent);

[snip]

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
