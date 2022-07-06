Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B4556860B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 12:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6C2112FF1;
	Wed,  6 Jul 2022 10:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535B3113609
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 10:46:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37BB6593;
 Wed,  6 Jul 2022 12:46:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1657104409;
 bh=477GNpXvp4Mx80mlqnho0h0C+TuTHAcbwFWXuVBv/a8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jt5aE0J1XyPNnjrU2u62UFJwDi+PTK9DFWMv1NE66fULSlmP2O5qyabhMRsrv6nRR
 WrRWBfST7lnUY+8asRzehbXmZsV6YvGHK9tafvB23tu/x5nU9xLIJpDYBuN0/zriD1
 02S6IRkVefg2dQm0GH2eWMsQvwjGmY73yzg1TIXo=
Date: Wed, 6 Jul 2022 13:46:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH 2/3] drm/gem: rename GEM CMA helpers to GEM DMA helpers
Message-ID: <YsVn/8dil13osT64@pendragon.ideasonboard.com>
References: <20220705212613.732039-1-dakr@redhat.com>
 <20220705212613.732039-3-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220705212613.732039-3-dakr@redhat.com>
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

Thank you for the patch.

On Tue, Jul 05, 2022 at 11:26:12PM +0200, Danilo Krummrich wrote:
> Rename "GEM CMA" helpers to "GEM DMA" helpers - considering the
> hierarchy of APIs (mm/cma -> dma -> gem dma) calling them "GEM
> DMA" seems to be more applicable.
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
> 	REGEX_GREP_UPPER="(${REGEX_SYM_UPPER}*)(GEM)_CMA_(${REGEX_SYM_UPPER}*)"
> 	REGEX_GREP_LOWER="(${REGEX_SYM_LOWER}*)(gem)_cma_(${REGEX_SYM_LOWER}*)"
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
> 
> 	# Rename all 'cma_obj's to 'dma_obj'.
> 	for ff in $(grep -RiHl "cma_obj" $DIRS)
> 	do
> 		sed -i -E "s/cma_obj/dma_obj/g" $ff
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
> documentation which relate to "GEM CMA", but not "FB CMA".
> 
> Also drivers/gpu/drm/Makefile was fixed up manually after renaming
> drm_gem_cma_helper.c to drm_gem_dma_helper.c.
> 
> This patch is compile-time tested building a x86_64 kernel with
> `make allyesconfig && make drivers/gpu/drm`.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  Documentation/gpu/drm-mm.rst                  |  16 +-
>  drivers/gpu/drm/Kconfig                       |   4 +-
>  drivers/gpu/drm/Makefile                      |   6 +-
>  drivers/gpu/drm/arm/Kconfig                   |   4 +-
>  drivers/gpu/drm/arm/display/Kconfig           |   2 +-
>  .../arm/display/komeda/komeda_framebuffer.c   |   6 +-
>  .../gpu/drm/arm/display/komeda/komeda_kms.c   |  10 +-
>  drivers/gpu/drm/arm/hdlcd_crtc.c              |   2 +-
>  drivers/gpu/drm/arm/hdlcd_drv.c               |   6 +-
>  drivers/gpu/drm/arm/malidp_drv.c              |   8 +-
>  drivers/gpu/drm/arm/malidp_mw.c               |   4 +-
>  drivers/gpu/drm/arm/malidp_planes.c           |  16 +-
>  drivers/gpu/drm/armada/armada_gem.c           |   6 +-
>  drivers/gpu/drm/aspeed/Kconfig                |   2 +-
>  drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c      |   4 +-
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |   6 +-
>  drivers/gpu/drm/atmel-hlcdc/Kconfig           |   2 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |   6 +-
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |   4 +-
>  drivers/gpu/drm/drm_fb_dma_helper.c           |  20 +-
>  drivers/gpu/drm/drm_file.c                    |   2 +-
>  ..._gem_cma_helper.c => drm_gem_dma_helper.c} | 296 +++++++++---------
>  drivers/gpu/drm/drm_mipi_dbi.c                |   2 +-
>  drivers/gpu/drm/fsl-dcu/Kconfig               |   2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |   6 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c   |   4 +-
>  drivers/gpu/drm/hisilicon/kirin/Kconfig       |   2 +-
>  .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |   8 +-
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |   2 +-
>  drivers/gpu/drm/imx/Kconfig                   |   2 +-
>  drivers/gpu/drm/imx/dcss/Kconfig              |   2 +-
>  drivers/gpu/drm/imx/dcss/dcss-kms.c           |   6 +-
>  drivers/gpu/drm/imx/dcss/dcss-plane.c         |  16 +-
>  drivers/gpu/drm/imx/imx-drm-core.c            |   8 +-
>  drivers/gpu/drm/imx/imx-drm.h                 |   2 +-
>  drivers/gpu/drm/imx/ipuv3-crtc.c              |   2 +-
>  drivers/gpu/drm/imx/ipuv3-plane.c             |  26 +-
>  drivers/gpu/drm/ingenic/Kconfig               |   2 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |   8 +-
>  drivers/gpu/drm/ingenic/ingenic-ipu.c         |   2 +-
>  drivers/gpu/drm/kmb/Kconfig                   |   2 +-
>  drivers/gpu/drm/kmb/kmb_drv.c                 |   6 +-
>  drivers/gpu/drm/kmb/kmb_plane.c               |   2 +-
>  drivers/gpu/drm/mcde/Kconfig                  |   2 +-
>  drivers/gpu/drm/mcde/mcde_display.c           |   2 +-
>  drivers/gpu/drm/mcde/mcde_drv.c               |   6 +-
>  drivers/gpu/drm/mediatek/Kconfig              |   2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c        |   4 +-
>  drivers/gpu/drm/meson/Kconfig                 |   2 +-
>  drivers/gpu/drm/meson/meson_drv.c             |  10 +-
>  drivers/gpu/drm/meson/meson_overlay.c         |   4 +-
>  drivers/gpu/drm/meson/meson_plane.c           |   4 +-
>  drivers/gpu/drm/msm/msm_drv.c                 |   2 +-
>  drivers/gpu/drm/mxsfb/Kconfig                 |   2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c             |   6 +-
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c             |   2 +-
>  drivers/gpu/drm/panel/Kconfig                 |   2 +-
>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c  |   6 +-
>  drivers/gpu/drm/pl111/Kconfig                 |   2 +-
>  drivers/gpu/drm/pl111/pl111_display.c         |   2 +-
>  drivers/gpu/drm/pl111/pl111_drv.c             |   8 +-
>  drivers/gpu/drm/rcar-du/Kconfig               |   2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |   2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c         |   4 +-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  36 +--
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c       |   4 +-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |   4 +-
>  drivers/gpu/drm/rockchip/Kconfig              |   2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |   2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |   4 +-
>  drivers/gpu/drm/shmobile/Kconfig              |   2 +-
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c     |   4 +-
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c      |   6 +-
>  drivers/gpu/drm/shmobile/shmob_drm_kms.c      |   2 +-
>  drivers/gpu/drm/shmobile/shmob_drm_kms.h      |   2 +-
>  drivers/gpu/drm/shmobile/shmob_drm_plane.c    |   4 +-
>  drivers/gpu/drm/sprd/Kconfig                  |   2 +-
>  drivers/gpu/drm/sprd/sprd_dpu.c               |   8 +-
>  drivers/gpu/drm/sprd/sprd_drm.c               |   6 +-
>  drivers/gpu/drm/sti/Kconfig                   |   2 +-
>  drivers/gpu/drm/sti/sti_cursor.c              |  10 +-
>  drivers/gpu/drm/sti/sti_drv.c                 |   6 +-
>  drivers/gpu/drm/sti/sti_gdp.c                 |  14 +-
>  drivers/gpu/drm/sti/sti_hqvdp.c               |  14 +-
>  drivers/gpu/drm/sti/sti_plane.c               |   2 +-
>  drivers/gpu/drm/stm/Kconfig                   |   2 +-
>  drivers/gpu/drm/stm/drv.c                     |  10 +-
>  drivers/gpu/drm/stm/ltdc.c                    |   2 +-
>  drivers/gpu/drm/sun4i/Kconfig                 |   2 +-
>  drivers/gpu/drm/sun4i/sun4i_backend.c         |   2 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c             |   8 +-
>  drivers/gpu/drm/sun4i/sun4i_frontend.c        |   2 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c           |   2 +-
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |   4 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |   4 +-
>  drivers/gpu/drm/tidss/Kconfig                 |   2 +-
>  drivers/gpu/drm/tidss/tidss_crtc.c            |   2 +-
>  drivers/gpu/drm/tidss/tidss_dispc.c           |   6 +-
>  drivers/gpu/drm/tidss/tidss_drv.c             |   6 +-
>  drivers/gpu/drm/tilcdc/Kconfig                |   2 +-
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c          |   4 +-
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c           |   6 +-
>  drivers/gpu/drm/tiny/Kconfig                  |  22 +-
>  drivers/gpu/drm/tiny/arcpgu.c                 |   8 +-
>  drivers/gpu/drm/tiny/hx8357d.c                |   6 +-
>  drivers/gpu/drm/tiny/ili9163.c                |   6 +-
>  drivers/gpu/drm/tiny/ili9225.c                |  10 +-
>  drivers/gpu/drm/tiny/ili9341.c                |   6 +-
>  drivers/gpu/drm/tiny/ili9486.c                |   6 +-
>  drivers/gpu/drm/tiny/mi0283qt.c               |   6 +-
>  drivers/gpu/drm/tiny/panel-mipi-dbi.c         |   6 +-
>  drivers/gpu/drm/tiny/repaper.c                |  10 +-
>  drivers/gpu/drm/tiny/st7586.c                 |  10 +-
>  drivers/gpu/drm/tiny/st7735r.c                |   6 +-
>  drivers/gpu/drm/tve200/Kconfig                |   2 +-
>  drivers/gpu/drm/tve200/tve200_display.c       |   2 +-
>  drivers/gpu/drm/tve200/tve200_drv.c           |   6 +-
>  drivers/gpu/drm/v3d/v3d_gem.c                 |   4 +-
>  drivers/gpu/drm/vc4/Kconfig                   |   2 +-
>  drivers/gpu/drm/vc4/vc4_bo.c                  |  44 +--
>  drivers/gpu/drm/vc4/vc4_crtc.c                |   6 +-
>  drivers/gpu/drm/vc4/vc4_drv.c                 |   6 +-
>  drivers/gpu/drm/vc4/vc4_drv.h                 |  18 +-
>  drivers/gpu/drm/vc4/vc4_gem.c                 |   4 +-
>  drivers/gpu/drm/vc4/vc4_plane.c               |   4 +-
>  drivers/gpu/drm/vc4/vc4_render_cl.c           |  26 +-
>  drivers/gpu/drm/vc4/vc4_txp.c                 |   2 +-
>  drivers/gpu/drm/vc4/vc4_v3d.c                 |   4 +-
>  drivers/gpu/drm/vc4/vc4_validate.c            |  16 +-
>  drivers/gpu/drm/vc4/vc4_validate_shaders.c    |   2 +-
>  drivers/gpu/drm/xlnx/Kconfig                  |   2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |   8 +-
>  include/drm/drm_fb_dma_helper.h               |   2 +-
>  include/drm/drm_gem.h                         |   2 +-
>  ..._gem_cma_helper.h => drm_gem_dma_helper.h} | 154 ++++-----
>  136 files changed, 621 insertions(+), 621 deletions(-)
>  rename drivers/gpu/drm/{drm_gem_cma_helper.c => drm_gem_dma_helper.c} (60%)
>  rename include/drm/{drm_gem_cma_helper.h => drm_gem_dma_helper.h} (53%)

[snip]
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
> similarity index 60%
> rename from drivers/gpu/drm/drm_gem_cma_helper.c
> rename to drivers/gpu/drm/drm_gem_dma_helper.c
> index f36734c2c9e1..f1b23b46dde3 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * drm gem CMA (contiguous memory allocator) helper functions
> + * drm gem DMA helper functions
>   *
>   * Copyright (C) 2012 Sascha Hauer, Pengutronix
>   *
> @@ -20,50 +20,50 @@
>  #include <drm/drm.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_vma_manager.h>
>  
>  /**
> - * DOC: cma helpers
> + * DOC: dma helpers
>   *
> - * The Contiguous Memory Allocator reserves a pool of memory at early boot
> - * that is used to service requests for large blocks of contiguous memory.
> + * The GEM DMA helper reserves a pool of memory at early boot that is used to
> + * service requests for large blocks of contiguous memory.
>   *
> - * The DRM GEM/CMA helpers use this allocator as a means to provide buffer
> + * The DRM GEM/DMA helpers use this allocator as a means to provide buffer
>   * objects that are physically contiguous in memory. This is useful for
>   * display drivers that are unable to map scattered buffers via an IOMMU.

That's not quite right anymore.

 * The DRM GEM/DMA helpers use the DMA mapping API to allocate buffers that are
 * DMA-contiguous in memory. This is useful for display drivers that are unable
 * to use scattered buffers.
 *
 * Depending on the platform, the buffers may be physically non-contiguous and
 * mapped through an IOMMU or a similar mechanism, or allocated from
 * physically-contiguous memory (using, for instance, CMA or a pool of memory
 * reserved at early boot). This is handled behind the scenes by the DMA mapping
 * API.

>   *
>   * For GEM callback helpers in struct &drm_gem_object functions, see likewise
> - * named functions with an _object_ infix (e.g., drm_gem_cma_object_vmap() wraps
> - * drm_gem_cma_vmap()). These helpers perform the necessary type conversion.
> + * named functions with an _object_ infix (e.g., drm_gem_dma_object_vmap() wraps
> + * drm_gem_dma_vmap()). These helpers perform the necessary type conversion.
>   */
>  
> -static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
> -	.free = drm_gem_cma_object_free,
> -	.print_info = drm_gem_cma_object_print_info,
> -	.get_sg_table = drm_gem_cma_object_get_sg_table,
> -	.vmap = drm_gem_cma_object_vmap,
> -	.mmap = drm_gem_cma_object_mmap,
> -	.vm_ops = &drm_gem_cma_vm_ops,
> +static const struct drm_gem_object_funcs drm_gem_dma_default_funcs = {
> +	.free = drm_gem_dma_object_free,
> +	.print_info = drm_gem_dma_object_print_info,
> +	.get_sg_table = drm_gem_dma_object_get_sg_table,
> +	.vmap = drm_gem_dma_object_vmap,
> +	.mmap = drm_gem_dma_object_mmap,
> +	.vm_ops = &drm_gem_dma_vm_ops,
>  };
>  
>  /**
> - * __drm_gem_cma_create - Create a GEM CMA object without allocating memory
> + * __drm_gem_dma_create - Create a GEM DMA object without allocating memory
>   * @drm: DRM device
>   * @size: size of the object to allocate
>   * @private: true if used for internal purposes
>   *
> - * This function creates and initializes a GEM CMA object of the given size,
> + * This function creates and initializes a GEM DMA object of the given size,
>   * but doesn't allocate any memory to back the object.
>   *
>   * Returns:
> - * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
> + * A struct drm_gem_dma_object * on success or an ERR_PTR()-encoded negative
>   * error code on failure.
>   */
> -static struct drm_gem_cma_object *
> -__drm_gem_cma_create(struct drm_device *drm, size_t size, bool private)
> +static struct drm_gem_dma_object *
> +__drm_gem_dma_create(struct drm_device *drm, size_t size, bool private)
>  {
> -	struct drm_gem_cma_object *cma_obj;
> +	struct drm_gem_dma_object *dma_obj;
>  	struct drm_gem_object *gem_obj;
>  	int ret = 0;
>  
> @@ -71,22 +71,22 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size, bool private)
>  		gem_obj = drm->driver->gem_create_object(drm, size);
>  		if (IS_ERR(gem_obj))
>  			return ERR_CAST(gem_obj);
> -		cma_obj = to_drm_gem_cma_obj(gem_obj);
> +		dma_obj = to_drm_gem_dma_obj(gem_obj);
>  	} else {
> -		cma_obj = kzalloc(sizeof(*cma_obj), GFP_KERNEL);
> -		if (!cma_obj)
> +		dma_obj = kzalloc(sizeof(*dma_obj), GFP_KERNEL);
> +		if (!dma_obj)
>  			return ERR_PTR(-ENOMEM);
> -		gem_obj = &cma_obj->base;
> +		gem_obj = &dma_obj->base;
>  	}
>  
>  	if (!gem_obj->funcs)
> -		gem_obj->funcs = &drm_gem_cma_default_funcs;
> +		gem_obj->funcs = &drm_gem_dma_default_funcs;
>  
>  	if (private) {
>  		drm_gem_private_object_init(drm, gem_obj, size);
>  
>  		/* Always use writecombine for dma-buf mappings */
> -		cma_obj->map_noncoherent = false;
> +		dma_obj->map_noncoherent = false;
>  	} else {
>  		ret = drm_gem_object_init(drm, gem_obj, size);
>  	}
> @@ -99,91 +99,91 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size, bool private)
>  		goto error;
>  	}
>  
> -	return cma_obj;
> +	return dma_obj;
>  
>  error:
> -	kfree(cma_obj);
> +	kfree(dma_obj);
>  	return ERR_PTR(ret);
>  }
>  
>  /**
> - * drm_gem_cma_create - allocate an object with the given size
> + * drm_gem_dma_create - allocate an object with the given size
>   * @drm: DRM device
>   * @size: size of the object to allocate
>   *
> - * This function creates a CMA GEM object and allocates a contiguous chunk of
> + * This function creates a DMA GEM object and allocates a contiguous chunk of

s/contiguous/DMA-contiguous/

>   * memory as backing store.
>   *
>   * Returns:
> - * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
> + * A struct drm_gem_dma_object * on success or an ERR_PTR()-encoded negative
>   * error code on failure.
>   */
> -struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
> +struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
>  					      size_t size)
>  {
> -	struct drm_gem_cma_object *cma_obj;
> +	struct drm_gem_dma_object *dma_obj;
>  	int ret;
>  
>  	size = round_up(size, PAGE_SIZE);
>  
> -	cma_obj = __drm_gem_cma_create(drm, size, false);
> -	if (IS_ERR(cma_obj))
> -		return cma_obj;
> +	dma_obj = __drm_gem_dma_create(drm, size, false);
> +	if (IS_ERR(dma_obj))
> +		return dma_obj;
>  
> -	if (cma_obj->map_noncoherent) {
> -		cma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
> -						       &cma_obj->paddr,
> +	if (dma_obj->map_noncoherent) {
> +		dma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
> +						       &dma_obj->paddr,
>  						       DMA_TO_DEVICE,
>  						       GFP_KERNEL | __GFP_NOWARN);
>  	} else {
> -		cma_obj->vaddr = dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
> +		dma_obj->vaddr = dma_alloc_wc(drm->dev, size, &dma_obj->paddr,
>  					      GFP_KERNEL | __GFP_NOWARN);
>  	}
> -	if (!cma_obj->vaddr) {
> +	if (!dma_obj->vaddr) {
>  		drm_dbg(drm, "failed to allocate buffer with size %zu\n",
>  			 size);
>  		ret = -ENOMEM;
>  		goto error;
>  	}
>  
> -	return cma_obj;
> +	return dma_obj;
>  
>  error:
> -	drm_gem_object_put(&cma_obj->base);
> +	drm_gem_object_put(&dma_obj->base);
>  	return ERR_PTR(ret);
>  }
> -EXPORT_SYMBOL_GPL(drm_gem_cma_create);
> +EXPORT_SYMBOL_GPL(drm_gem_dma_create);
>  
>  /**
> - * drm_gem_cma_create_with_handle - allocate an object with the given size and
> + * drm_gem_dma_create_with_handle - allocate an object with the given size and
>   *     return a GEM handle to it
>   * @file_priv: DRM file-private structure to register the handle for
>   * @drm: DRM device
>   * @size: size of the object to allocate
>   * @handle: return location for the GEM handle
>   *
> - * This function creates a CMA GEM object, allocating a physically contiguous
> + * This function creates a DMA GEM object, allocating a physically contiguous

s/physically contiguous/DMA-contiguous/

>   * chunk of memory as backing store. The GEM object is then added to the list
>   * of object associated with the given file and a handle to it is returned.
>   *
>   * Returns:
> - * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
> + * A struct drm_gem_dma_object * on success or an ERR_PTR()-encoded negative
>   * error code on failure.
>   */
> -static struct drm_gem_cma_object *
> -drm_gem_cma_create_with_handle(struct drm_file *file_priv,
> +static struct drm_gem_dma_object *
> +drm_gem_dma_create_with_handle(struct drm_file *file_priv,
>  			       struct drm_device *drm, size_t size,
>  			       uint32_t *handle)
>  {
> -	struct drm_gem_cma_object *cma_obj;
> +	struct drm_gem_dma_object *dma_obj;
>  	struct drm_gem_object *gem_obj;
>  	int ret;
>  
> -	cma_obj = drm_gem_cma_create(drm, size);
> -	if (IS_ERR(cma_obj))
> -		return cma_obj;
> +	dma_obj = drm_gem_dma_create(drm, size);
> +	if (IS_ERR(dma_obj))
> +		return dma_obj;
>  
> -	gem_obj = &cma_obj->base;
> +	gem_obj = &dma_obj->base;
>  
>  	/*
>  	 * allocate a id of idr table where the obj is registered
> @@ -195,44 +195,44 @@ drm_gem_cma_create_with_handle(struct drm_file *file_priv,
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> -	return cma_obj;
> +	return dma_obj;
>  }
>  
>  /**
> - * drm_gem_cma_free - free resources associated with a CMA GEM object
> - * @cma_obj: CMA GEM object to free
> + * drm_gem_dma_free - free resources associated with a DMA GEM object
> + * @dma_obj: DMA GEM object to free
>   *
> - * This function frees the backing memory of the CMA GEM object, cleans up the
> + * This function frees the backing memory of the DMA GEM object, cleans up the
>   * GEM object state and frees the memory used to store the object itself.
>   * If the buffer is imported and the virtual address is set, it is released.
>   */
> -void drm_gem_cma_free(struct drm_gem_cma_object *cma_obj)
> +void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj)
>  {
> -	struct drm_gem_object *gem_obj = &cma_obj->base;
> -	struct iosys_map map = IOSYS_MAP_INIT_VADDR(cma_obj->vaddr);
> +	struct drm_gem_object *gem_obj = &dma_obj->base;
> +	struct iosys_map map = IOSYS_MAP_INIT_VADDR(dma_obj->vaddr);
>  
>  	if (gem_obj->import_attach) {
> -		if (cma_obj->vaddr)
> +		if (dma_obj->vaddr)
>  			dma_buf_vunmap(gem_obj->import_attach->dmabuf, &map);
> -		drm_prime_gem_destroy(gem_obj, cma_obj->sgt);
> -	} else if (cma_obj->vaddr) {
> -		if (cma_obj->map_noncoherent)
> -			dma_free_noncoherent(gem_obj->dev->dev, cma_obj->base.size,
> -					     cma_obj->vaddr, cma_obj->paddr,
> +		drm_prime_gem_destroy(gem_obj, dma_obj->sgt);
> +	} else if (dma_obj->vaddr) {
> +		if (dma_obj->map_noncoherent)
> +			dma_free_noncoherent(gem_obj->dev->dev, dma_obj->base.size,
> +					     dma_obj->vaddr, dma_obj->paddr,
>  					     DMA_TO_DEVICE);
>  		else
> -			dma_free_wc(gem_obj->dev->dev, cma_obj->base.size,
> -				    cma_obj->vaddr, cma_obj->paddr);
> +			dma_free_wc(gem_obj->dev->dev, dma_obj->base.size,
> +				    dma_obj->vaddr, dma_obj->paddr);
>  	}
>  
>  	drm_gem_object_release(gem_obj);
>  
> -	kfree(cma_obj);
> +	kfree(dma_obj);
>  }
> -EXPORT_SYMBOL_GPL(drm_gem_cma_free);
> +EXPORT_SYMBOL_GPL(drm_gem_dma_free);
>  
>  /**
> - * drm_gem_cma_dumb_create_internal - create a dumb buffer object
> + * drm_gem_dma_dumb_create_internal - create a dumb buffer object
>   * @file_priv: DRM file-private structure to create the dumb buffer for
>   * @drm: DRM device
>   * @args: IOCTL data
> @@ -245,12 +245,12 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_free);
>   * Returns:
>   * 0 on success or a negative error code on failure.
>   */
> -int drm_gem_cma_dumb_create_internal(struct drm_file *file_priv,
> +int drm_gem_dma_dumb_create_internal(struct drm_file *file_priv,
>  				     struct drm_device *drm,
>  				     struct drm_mode_create_dumb *args)
>  {
>  	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
> -	struct drm_gem_cma_object *cma_obj;
> +	struct drm_gem_dma_object *dma_obj;
>  
>  	if (args->pitch < min_pitch)
>  		args->pitch = min_pitch;
> @@ -258,14 +258,14 @@ int drm_gem_cma_dumb_create_internal(struct drm_file *file_priv,
>  	if (args->size < args->pitch * args->height)
>  		args->size = args->pitch * args->height;
>  
> -	cma_obj = drm_gem_cma_create_with_handle(file_priv, drm, args->size,
> +	dma_obj = drm_gem_dma_create_with_handle(file_priv, drm, args->size,
>  						 &args->handle);
> -	return PTR_ERR_OR_ZERO(cma_obj);
> +	return PTR_ERR_OR_ZERO(dma_obj);
>  }
> -EXPORT_SYMBOL_GPL(drm_gem_cma_dumb_create_internal);
> +EXPORT_SYMBOL_GPL(drm_gem_dma_dumb_create_internal);
>  
>  /**
> - * drm_gem_cma_dumb_create - create a dumb buffer object
> + * drm_gem_dma_dumb_create - create a dumb buffer object
>   * @file_priv: DRM file-private structure to create the dumb buffer for
>   * @drm: DRM device
>   * @args: IOCTL data
> @@ -277,35 +277,35 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_dumb_create_internal);
>   *
>   * For hardware with additional restrictions, drivers can adjust the fields
>   * set up by userspace and pass the IOCTL data along to the
> - * drm_gem_cma_dumb_create_internal() function.
> + * drm_gem_dma_dumb_create_internal() function.
>   *
>   * Returns:
>   * 0 on success or a negative error code on failure.
>   */
> -int drm_gem_cma_dumb_create(struct drm_file *file_priv,
> +int drm_gem_dma_dumb_create(struct drm_file *file_priv,
>  			    struct drm_device *drm,
>  			    struct drm_mode_create_dumb *args)
>  {
> -	struct drm_gem_cma_object *cma_obj;
> +	struct drm_gem_dma_object *dma_obj;
>  
>  	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
>  	args->size = args->pitch * args->height;
>  
> -	cma_obj = drm_gem_cma_create_with_handle(file_priv, drm, args->size,
> +	dma_obj = drm_gem_dma_create_with_handle(file_priv, drm, args->size,
>  						 &args->handle);
> -	return PTR_ERR_OR_ZERO(cma_obj);
> +	return PTR_ERR_OR_ZERO(dma_obj);
>  }
> -EXPORT_SYMBOL_GPL(drm_gem_cma_dumb_create);
> +EXPORT_SYMBOL_GPL(drm_gem_dma_dumb_create);
>  
> -const struct vm_operations_struct drm_gem_cma_vm_ops = {
> +const struct vm_operations_struct drm_gem_dma_vm_ops = {
>  	.open = drm_gem_vm_open,
>  	.close = drm_gem_vm_close,
>  };
> -EXPORT_SYMBOL_GPL(drm_gem_cma_vm_ops);
> +EXPORT_SYMBOL_GPL(drm_gem_dma_vm_ops);
>  
>  #ifndef CONFIG_MMU
>  /**
> - * drm_gem_cma_get_unmapped_area - propose address for mapping in noMMU cases
> + * drm_gem_dma_get_unmapped_area - propose address for mapping in noMMU cases
>   * @filp: file object
>   * @addr: memory address
>   * @len: buffer size
> @@ -320,13 +320,13 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_vm_ops);
>   * Returns:
>   * mapping address on success or a negative error code on failure.
>   */
> -unsigned long drm_gem_cma_get_unmapped_area(struct file *filp,
> +unsigned long drm_gem_dma_get_unmapped_area(struct file *filp,
>  					    unsigned long addr,
>  					    unsigned long len,
>  					    unsigned long pgoff,
>  					    unsigned long flags)
>  {
> -	struct drm_gem_cma_object *cma_obj;
> +	struct drm_gem_dma_object *dma_obj;
>  	struct drm_gem_object *obj = NULL;
>  	struct drm_file *priv = filp->private_data;
>  	struct drm_device *dev = priv->minor->dev;
> @@ -365,35 +365,35 @@ unsigned long drm_gem_cma_get_unmapped_area(struct file *filp,
>  		return -EACCES;
>  	}
>  
> -	cma_obj = to_drm_gem_cma_obj(obj);
> +	dma_obj = to_drm_gem_dma_obj(obj);
>  
>  	drm_gem_object_put(obj);
>  
> -	return cma_obj->vaddr ? (unsigned long)cma_obj->vaddr : -EINVAL;
> +	return dma_obj->vaddr ? (unsigned long)dma_obj->vaddr : -EINVAL;
>  }
> -EXPORT_SYMBOL_GPL(drm_gem_cma_get_unmapped_area);
> +EXPORT_SYMBOL_GPL(drm_gem_dma_get_unmapped_area);
>  #endif
>  
>  /**
> - * drm_gem_cma_print_info() - Print &drm_gem_cma_object info for debugfs
> - * @cma_obj: CMA GEM object
> + * drm_gem_dma_print_info() - Print &drm_gem_dma_object info for debugfs
> + * @dma_obj: DMA GEM object
>   * @p: DRM printer
>   * @indent: Tab indentation level
>   *
>   * This function prints paddr and vaddr for use in e.g. debugfs output.
>   */
> -void drm_gem_cma_print_info(const struct drm_gem_cma_object *cma_obj,
> +void drm_gem_dma_print_info(const struct drm_gem_dma_object *dma_obj,
>  			    struct drm_printer *p, unsigned int indent)
>  {
> -	drm_printf_indent(p, indent, "paddr=%pad\n", &cma_obj->paddr);
> -	drm_printf_indent(p, indent, "vaddr=%p\n", cma_obj->vaddr);
> +	drm_printf_indent(p, indent, "paddr=%pad\n", &dma_obj->paddr);
> +	drm_printf_indent(p, indent, "vaddr=%p\n", dma_obj->vaddr);
>  }
> -EXPORT_SYMBOL(drm_gem_cma_print_info);
> +EXPORT_SYMBOL(drm_gem_dma_print_info);
>  
>  /**
> - * drm_gem_cma_get_sg_table - provide a scatter/gather table of pinned
> - *     pages for a CMA GEM object
> - * @cma_obj: CMA GEM object
> + * drm_gem_dma_get_sg_table - provide a scatter/gather table of pinned
> + *     pages for a DMA GEM object
> + * @dma_obj: DMA GEM object
>   *
>   * This function exports a scatter/gather table by calling the standard
>   * DMA mapping API.
> @@ -401,9 +401,9 @@ EXPORT_SYMBOL(drm_gem_cma_print_info);
>   * Returns:
>   * A pointer to the scatter/gather table of pinned pages or NULL on failure.
>   */
> -struct sg_table *drm_gem_cma_get_sg_table(struct drm_gem_cma_object *cma_obj)
> +struct sg_table *drm_gem_dma_get_sg_table(struct drm_gem_dma_object *dma_obj)
>  {
> -	struct drm_gem_object *obj = &cma_obj->base;
> +	struct drm_gem_object *obj = &dma_obj->base;
>  	struct sg_table *sgt;
>  	int ret;
>  
> @@ -411,8 +411,8 @@ struct sg_table *drm_gem_cma_get_sg_table(struct drm_gem_cma_object *cma_obj)
>  	if (!sgt)
>  		return ERR_PTR(-ENOMEM);
>  
> -	ret = dma_get_sgtable(obj->dev->dev, sgt, cma_obj->vaddr,
> -			      cma_obj->paddr, obj->size);
> +	ret = dma_get_sgtable(obj->dev->dev, sgt, dma_obj->vaddr,
> +			      dma_obj->paddr, obj->size);
>  	if (ret < 0)
>  		goto out;
>  
> @@ -422,10 +422,10 @@ struct sg_table *drm_gem_cma_get_sg_table(struct drm_gem_cma_object *cma_obj)
>  	kfree(sgt);
>  	return ERR_PTR(ret);
>  }
> -EXPORT_SYMBOL_GPL(drm_gem_cma_get_sg_table);
> +EXPORT_SYMBOL_GPL(drm_gem_dma_get_sg_table);
>  
>  /**
> - * drm_gem_cma_prime_import_sg_table - produce a CMA GEM object from another
> + * drm_gem_dma_prime_import_sg_table - produce a DMA GEM object from another
>   *     driver's scatter/gather table of pinned pages
>   * @dev: device to import into
>   * @attach: DMA-BUF attachment
> @@ -434,7 +434,7 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_get_sg_table);
>   * This function imports a scatter/gather table exported via DMA-BUF by
>   * another driver. Imported buffers must be physically contiguous in memory
>   * (i.e. the scatter/gather table must contain a single entry). Drivers that
> - * use the CMA helpers should set this as their
> + * use the DMA helpers should set this as their
>   * &drm_driver.gem_prime_import_sg_table callback.
>   *
>   * Returns:
> @@ -442,56 +442,56 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_get_sg_table);
>   * error code on failure.
>   */
>  struct drm_gem_object *
> -drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
> +drm_gem_dma_prime_import_sg_table(struct drm_device *dev,
>  				  struct dma_buf_attachment *attach,
>  				  struct sg_table *sgt)
>  {
> -	struct drm_gem_cma_object *cma_obj;
> +	struct drm_gem_dma_object *dma_obj;
>  
>  	/* check if the entries in the sg_table are contiguous */
>  	if (drm_prime_get_contiguous_size(sgt) < attach->dmabuf->size)
>  		return ERR_PTR(-EINVAL);
>  
> -	/* Create a CMA GEM buffer. */
> -	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size, true);
> -	if (IS_ERR(cma_obj))
> -		return ERR_CAST(cma_obj);
> +	/* Create a DMA GEM buffer. */
> +	dma_obj = __drm_gem_dma_create(dev, attach->dmabuf->size, true);
> +	if (IS_ERR(dma_obj))
> +		return ERR_CAST(dma_obj);
>  
> -	cma_obj->paddr = sg_dma_address(sgt->sgl);
> -	cma_obj->sgt = sgt;
> +	dma_obj->paddr = sg_dma_address(sgt->sgl);
> +	dma_obj->sgt = sgt;
>  
> -	DRM_DEBUG_PRIME("dma_addr = %pad, size = %zu\n", &cma_obj->paddr, attach->dmabuf->size);
> +	DRM_DEBUG_PRIME("dma_addr = %pad, size = %zu\n", &dma_obj->paddr, attach->dmabuf->size);
>  
> -	return &cma_obj->base;
> +	return &dma_obj->base;
>  }
> -EXPORT_SYMBOL_GPL(drm_gem_cma_prime_import_sg_table);
> +EXPORT_SYMBOL_GPL(drm_gem_dma_prime_import_sg_table);
>  
>  /**
> - * drm_gem_cma_vmap - map a CMA GEM object into the kernel's virtual
> + * drm_gem_dma_vmap - map a DMA GEM object into the kernel's virtual
>   *     address space
> - * @cma_obj: CMA GEM object
> - * @map: Returns the kernel virtual address of the CMA GEM object's backing
> + * @dma_obj: DMA GEM object
> + * @map: Returns the kernel virtual address of the DMA GEM object's backing
>   *       store.
>   *
>   * This function maps a buffer into the kernel's virtual address space.
> - * Since the CMA buffers are already mapped into the kernel virtual address
> + * Since the DMA buffers are already mapped into the kernel virtual address
>   * space this simply returns the cached virtual address.
>   *
>   * Returns:
>   * 0 on success, or a negative error code otherwise.
>   */
> -int drm_gem_cma_vmap(struct drm_gem_cma_object *cma_obj,
> +int drm_gem_dma_vmap(struct drm_gem_dma_object *dma_obj,
>  		     struct iosys_map *map)
>  {
> -	iosys_map_set_vaddr(map, cma_obj->vaddr);
> +	iosys_map_set_vaddr(map, dma_obj->vaddr);
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(drm_gem_cma_vmap);
> +EXPORT_SYMBOL_GPL(drm_gem_dma_vmap);
>  
>  /**
> - * drm_gem_cma_mmap - memory-map an exported CMA GEM object
> - * @cma_obj: CMA GEM object
> + * drm_gem_dma_mmap - memory-map an exported DMA GEM object
> + * @dma_obj: DMA GEM object
>   * @vma: VMA for the area to be mapped
>   *
>   * This function maps a buffer into a userspace process's address space.
> @@ -501,9 +501,9 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_vmap);
>   * Returns:
>   * 0 on success or a negative error code on failure.
>   */
> -int drm_gem_cma_mmap(struct drm_gem_cma_object *cma_obj, struct vm_area_struct *vma)
> +int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *vma)
>  {
> -	struct drm_gem_object *obj = &cma_obj->base;
> +	struct drm_gem_object *obj = &dma_obj->base;
>  	int ret;
>  
>  	/*
> @@ -515,37 +515,37 @@ int drm_gem_cma_mmap(struct drm_gem_cma_object *cma_obj, struct vm_area_struct *
>  	vma->vm_flags &= ~VM_PFNMAP;
>  	vma->vm_flags |= VM_DONTEXPAND;
>  
> -	if (cma_obj->map_noncoherent) {
> +	if (dma_obj->map_noncoherent) {
>  		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>  
> -		ret = dma_mmap_pages(cma_obj->base.dev->dev,
> +		ret = dma_mmap_pages(dma_obj->base.dev->dev,
>  				     vma, vma->vm_end - vma->vm_start,
> -				     virt_to_page(cma_obj->vaddr));
> +				     virt_to_page(dma_obj->vaddr));
>  	} else {
> -		ret = dma_mmap_wc(cma_obj->base.dev->dev, vma, cma_obj->vaddr,
> -				  cma_obj->paddr, vma->vm_end - vma->vm_start);
> +		ret = dma_mmap_wc(dma_obj->base.dev->dev, vma, dma_obj->vaddr,
> +				  dma_obj->paddr, vma->vm_end - vma->vm_start);
>  	}
>  	if (ret)
>  		drm_gem_vm_close(vma);
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(drm_gem_cma_mmap);
> +EXPORT_SYMBOL_GPL(drm_gem_dma_mmap);
>  
>  /**
> - * drm_gem_cma_prime_import_sg_table_vmap - PRIME import another driver's
> + * drm_gem_dma_prime_import_sg_table_vmap - PRIME import another driver's
>   *	scatter/gather table and get the virtual address of the buffer
>   * @dev: DRM device
>   * @attach: DMA-BUF attachment
>   * @sgt: Scatter/gather table of pinned pages
>   *
>   * This function imports a scatter/gather table using
> - * drm_gem_cma_prime_import_sg_table() and uses dma_buf_vmap() to get the kernel
> - * virtual address. This ensures that a CMA GEM object always has its virtual
> + * drm_gem_dma_prime_import_sg_table() and uses dma_buf_vmap() to get the kernel
> + * virtual address. This ensures that a DMA GEM object always has its virtual
>   * address set. This address is released when the object is freed.
>   *
>   * This function can be used as the &drm_driver.gem_prime_import_sg_table
> - * callback. The &DRM_GEM_CMA_DRIVER_OPS_VMAP macro provides a shortcut to set
> + * callback. The &DRM_GEM_DMA_DRIVER_OPS_VMAP macro provides a shortcut to set
>   * the necessary DRM driver operations.
>   *
>   * Returns:
> @@ -553,11 +553,11 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_mmap);
>   * error code on failure.
>   */
>  struct drm_gem_object *
> -drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
> +drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
>  				       struct dma_buf_attachment *attach,
>  				       struct sg_table *sgt)
>  {
> -	struct drm_gem_cma_object *cma_obj;
> +	struct drm_gem_dma_object *dma_obj;
>  	struct drm_gem_object *obj;
>  	struct iosys_map map;
>  	int ret;
> @@ -568,19 +568,19 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
>  		return ERR_PTR(ret);
>  	}
>  
> -	obj = drm_gem_cma_prime_import_sg_table(dev, attach, sgt);
> +	obj = drm_gem_dma_prime_import_sg_table(dev, attach, sgt);
>  	if (IS_ERR(obj)) {
>  		dma_buf_vunmap(attach->dmabuf, &map);
>  		return obj;
>  	}
>  
> -	cma_obj = to_drm_gem_cma_obj(obj);
> -	cma_obj->vaddr = map.vaddr;
> +	dma_obj = to_drm_gem_dma_obj(obj);
> +	dma_obj->vaddr = map.vaddr;
>  
>  	return obj;
>  }
> -EXPORT_SYMBOL(drm_gem_cma_prime_import_sg_table_vmap);
> +EXPORT_SYMBOL(drm_gem_dma_prime_import_sg_table_vmap);
>  
> -MODULE_DESCRIPTION("DRM CMA memory-management helpers");
> +MODULE_DESCRIPTION("DRM DMA memory-management helpers");
>  MODULE_IMPORT_NS(DMA_BUF);
>  MODULE_LICENSE("GPL");

[snip]

> diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_dma_helper.h
> similarity index 53%
> rename from include/drm/drm_gem_cma_helper.h
> rename to include/drm/drm_gem_dma_helper.h
> index fbda4ce5d5fb..86ee86a6d222 100644
> --- a/include/drm/drm_gem_cma_helper.h
> +++ b/include/drm/drm_gem_dma_helper.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __DRM_GEM_CMA_HELPER_H__
> -#define __DRM_GEM_CMA_HELPER_H__
> +#ifndef __DRM_GEM_DMA_HELPER_H__
> +#define __DRM_GEM_DMA_HELPER_H__
>  
>  #include <drm/drm_file.h>
>  #include <drm/drm_ioctl.h>
> @@ -9,7 +9,7 @@
>  struct drm_mode_create_dumb;
>  
>  /**
> - * struct drm_gem_cma_object - GEM object backed by CMA memory allocations
> + * struct drm_gem_dma_object - GEM object backed by DMA memory allocations
>   * @base: base GEM object
>   * @paddr: physical address of the backing memory

s/physical address/DMA address/

It would also be nice to rename the paddr field to dma_addr (in a
separate patch).

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>   * @sgt: scatter/gather table for imported PRIME buffers. The table can have
> @@ -18,119 +18,119 @@ struct drm_mode_create_dumb;
>   * @vaddr: kernel virtual address of the backing memory
>   * @map_noncoherent: if true, the GEM object is backed by non-coherent memory
>   */
> -struct drm_gem_cma_object {
> +struct drm_gem_dma_object {
>  	struct drm_gem_object base;
>  	dma_addr_t paddr;
>  	struct sg_table *sgt;
>  
> -	/* For objects with DMA memory allocated by GEM CMA */
> +	/* For objects with DMA memory allocated by GEM DMA */
>  	void *vaddr;
>  
>  	bool map_noncoherent;
>  };
>  
> -#define to_drm_gem_cma_obj(gem_obj) \
> -	container_of(gem_obj, struct drm_gem_cma_object, base)
> +#define to_drm_gem_dma_obj(gem_obj) \
> +	container_of(gem_obj, struct drm_gem_dma_object, base)
>  
> -struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
> +struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
>  					      size_t size);
> -void drm_gem_cma_free(struct drm_gem_cma_object *cma_obj);
> -void drm_gem_cma_print_info(const struct drm_gem_cma_object *cma_obj,
> +void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj);
> +void drm_gem_dma_print_info(const struct drm_gem_dma_object *dma_obj,
>  			    struct drm_printer *p, unsigned int indent);
> -struct sg_table *drm_gem_cma_get_sg_table(struct drm_gem_cma_object *cma_obj);
> -int drm_gem_cma_vmap(struct drm_gem_cma_object *cma_obj,
> +struct sg_table *drm_gem_dma_get_sg_table(struct drm_gem_dma_object *dma_obj);
> +int drm_gem_dma_vmap(struct drm_gem_dma_object *dma_obj,
>  		     struct iosys_map *map);
> -int drm_gem_cma_mmap(struct drm_gem_cma_object *cma_obj, struct vm_area_struct *vma);
> +int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *vma);
>  
> -extern const struct vm_operations_struct drm_gem_cma_vm_ops;
> +extern const struct vm_operations_struct drm_gem_dma_vm_ops;
>  
>  /*
>   * GEM object functions
>   */
>  
>  /**
> - * drm_gem_cma_object_free - GEM object function for drm_gem_cma_free()
> + * drm_gem_dma_object_free - GEM object function for drm_gem_dma_free()
>   * @obj: GEM object to free
>   *
> - * This function wraps drm_gem_cma_free_object(). Drivers that employ the CMA helpers
> + * This function wraps drm_gem_dma_free_object(). Drivers that employ the DMA helpers
>   * should use it as their &drm_gem_object_funcs.free handler.
>   */
> -static inline void drm_gem_cma_object_free(struct drm_gem_object *obj)
> +static inline void drm_gem_dma_object_free(struct drm_gem_object *obj)
>  {
> -	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
> +	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
>  
> -	drm_gem_cma_free(cma_obj);
> +	drm_gem_dma_free(dma_obj);
>  }
>  
>  /**
> - * drm_gem_cma_object_print_info() - Print &drm_gem_cma_object info for debugfs
> + * drm_gem_dma_object_print_info() - Print &drm_gem_dma_object info for debugfs
>   * @p: DRM printer
>   * @indent: Tab indentation level
>   * @obj: GEM object
>   *
> - * This function wraps drm_gem_cma_print_info(). Drivers that employ the CMA helpers
> + * This function wraps drm_gem_dma_print_info(). Drivers that employ the DMA helpers
>   * should use this function as their &drm_gem_object_funcs.print_info handler.
>   */
> -static inline void drm_gem_cma_object_print_info(struct drm_printer *p, unsigned int indent,
> +static inline void drm_gem_dma_object_print_info(struct drm_printer *p, unsigned int indent,
>  						 const struct drm_gem_object *obj)
>  {
> -	const struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
> +	const struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
>  
> -	drm_gem_cma_print_info(cma_obj, p, indent);
> +	drm_gem_dma_print_info(dma_obj, p, indent);
>  }
>  
>  /**
> - * drm_gem_cma_object_get_sg_table - GEM object function for drm_gem_cma_get_sg_table()
> + * drm_gem_dma_object_get_sg_table - GEM object function for drm_gem_dma_get_sg_table()
>   * @obj: GEM object
>   *
> - * This function wraps drm_gem_cma_get_sg_table(). Drivers that employ the CMA helpers should
> + * This function wraps drm_gem_dma_get_sg_table(). Drivers that employ the DMA helpers should
>   * use it as their &drm_gem_object_funcs.get_sg_table handler.
>   *
>   * Returns:
>   * A pointer to the scatter/gather table of pinned pages or NULL on failure.
>   */
> -static inline struct sg_table *drm_gem_cma_object_get_sg_table(struct drm_gem_object *obj)
> +static inline struct sg_table *drm_gem_dma_object_get_sg_table(struct drm_gem_object *obj)
>  {
> -	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
> +	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
>  
> -	return drm_gem_cma_get_sg_table(cma_obj);
> +	return drm_gem_dma_get_sg_table(dma_obj);
>  }
>  
>  /*
> - * drm_gem_cma_object_vmap - GEM object function for drm_gem_cma_vmap()
> + * drm_gem_dma_object_vmap - GEM object function for drm_gem_dma_vmap()
>   * @obj: GEM object
> - * @map: Returns the kernel virtual address of the CMA GEM object's backing store.
> + * @map: Returns the kernel virtual address of the DMA GEM object's backing store.
>   *
> - * This function wraps drm_gem_cma_vmap(). Drivers that employ the CMA helpers should
> + * This function wraps drm_gem_dma_vmap(). Drivers that employ the DMA helpers should
>   * use it as their &drm_gem_object_funcs.vmap handler.
>   *
>   * Returns:
>   * 0 on success or a negative error code on failure.
>   */
> -static inline int drm_gem_cma_object_vmap(struct drm_gem_object *obj,
> +static inline int drm_gem_dma_object_vmap(struct drm_gem_object *obj,
>  					  struct iosys_map *map)
>  {
> -	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
> +	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
>  
> -	return drm_gem_cma_vmap(cma_obj, map);
> +	return drm_gem_dma_vmap(dma_obj, map);
>  }
>  
>  /**
> - * drm_gem_cma_object_mmap - GEM object function for drm_gem_cma_mmap()
> + * drm_gem_dma_object_mmap - GEM object function for drm_gem_dma_mmap()
>   * @obj: GEM object
>   * @vma: VMA for the area to be mapped
>   *
> - * This function wraps drm_gem_cma_mmap(). Drivers that employ the cma helpers should
> + * This function wraps drm_gem_dma_mmap(). Drivers that employ the dma helpers should
>   * use it as their &drm_gem_object_funcs.mmap handler.
>   *
>   * Returns:
>   * 0 on success or a negative error code on failure.
>   */
> -static inline int drm_gem_cma_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> +static inline int drm_gem_dma_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>  {
> -	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
> +	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
>  
> -	return drm_gem_cma_mmap(cma_obj, vma);
> +	return drm_gem_dma_mmap(dma_obj, vma);
>  }
>  
>  /*
> @@ -138,57 +138,57 @@ static inline int drm_gem_cma_object_mmap(struct drm_gem_object *obj, struct vm_
>   */
>  
>  /* create memory region for DRM framebuffer */
> -int drm_gem_cma_dumb_create_internal(struct drm_file *file_priv,
> +int drm_gem_dma_dumb_create_internal(struct drm_file *file_priv,
>  				     struct drm_device *drm,
>  				     struct drm_mode_create_dumb *args);
>  
>  /* create memory region for DRM framebuffer */
> -int drm_gem_cma_dumb_create(struct drm_file *file_priv,
> +int drm_gem_dma_dumb_create(struct drm_file *file_priv,
>  			    struct drm_device *drm,
>  			    struct drm_mode_create_dumb *args);
>  
>  struct drm_gem_object *
> -drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
> +drm_gem_dma_prime_import_sg_table(struct drm_device *dev,
>  				  struct dma_buf_attachment *attach,
>  				  struct sg_table *sgt);
>  
>  /**
> - * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE - CMA GEM driver operations
> + * DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE - DMA GEM driver operations
>   * @dumb_create_func: callback function for .dumb_create
>   *
>   * This macro provides a shortcut for setting the default GEM operations in the
>   * &drm_driver structure.
>   *
> - * This macro is a variant of DRM_GEM_CMA_DRIVER_OPS for drivers that
> + * This macro is a variant of DRM_GEM_DMA_DRIVER_OPS for drivers that
>   * override the default implementation of &struct rm_driver.dumb_create. Use
> - * DRM_GEM_CMA_DRIVER_OPS if possible. Drivers that require a virtual address
> + * DRM_GEM_DMA_DRIVER_OPS if possible. Drivers that require a virtual address
>   * on imported buffers should use
> - * DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE() instead.
> + * DRM_GEM_DMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE() instead.
>   */
> -#define DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(dumb_create_func) \
> +#define DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(dumb_create_func) \
>  	.dumb_create		= (dumb_create_func), \
>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
> -	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table, \
> +	.gem_prime_import_sg_table = drm_gem_dma_prime_import_sg_table, \
>  	.gem_prime_mmap		= drm_gem_prime_mmap
>  
>  /**
> - * DRM_GEM_CMA_DRIVER_OPS - CMA GEM driver operations
> + * DRM_GEM_DMA_DRIVER_OPS - DMA GEM driver operations
>   *
>   * This macro provides a shortcut for setting the default GEM operations in the
>   * &drm_driver structure.
>   *
>   * Drivers that come with their own implementation of
>   * &struct drm_driver.dumb_create should use
> - * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE() instead. Use
> - * DRM_GEM_CMA_DRIVER_OPS if possible. Drivers that require a virtual address
> - * on imported buffers should use DRM_GEM_CMA_DRIVER_OPS_VMAP instead.
> + * DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE() instead. Use
> + * DRM_GEM_DMA_DRIVER_OPS if possible. Drivers that require a virtual address
> + * on imported buffers should use DRM_GEM_DMA_DRIVER_OPS_VMAP instead.
>   */
> -#define DRM_GEM_CMA_DRIVER_OPS \
> -	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(drm_gem_cma_dumb_create)
> +#define DRM_GEM_DMA_DRIVER_OPS \
> +	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(drm_gem_dma_dumb_create)
>  
>  /**
> - * DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE - CMA GEM driver operations
> + * DRM_GEM_DMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE - DMA GEM driver operations
>   *                                                ensuring a virtual address
>   *                                                on the buffer
>   * @dumb_create_func: callback function for .dumb_create
> @@ -197,21 +197,21 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
>   * &drm_driver structure for drivers that need the virtual address also on
>   * imported buffers.
>   *
> - * This macro is a variant of DRM_GEM_CMA_DRIVER_OPS_VMAP for drivers that
> + * This macro is a variant of DRM_GEM_DMA_DRIVER_OPS_VMAP for drivers that
>   * override the default implementation of &struct drm_driver.dumb_create. Use
> - * DRM_GEM_CMA_DRIVER_OPS_VMAP if possible. Drivers that do not require a
> + * DRM_GEM_DMA_DRIVER_OPS_VMAP if possible. Drivers that do not require a
>   * virtual address on imported buffers should use
> - * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE() instead.
> + * DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE() instead.
>   */
> -#define DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(dumb_create_func) \
> +#define DRM_GEM_DMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(dumb_create_func) \
>  	.dumb_create		= dumb_create_func, \
>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
> -	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table_vmap, \
> +	.gem_prime_import_sg_table = drm_gem_dma_prime_import_sg_table_vmap, \
>  	.gem_prime_mmap		= drm_gem_prime_mmap
>  
>  /**
> - * DRM_GEM_CMA_DRIVER_OPS_VMAP - CMA GEM driver operations ensuring a virtual
> + * DRM_GEM_DMA_DRIVER_OPS_VMAP - DMA GEM driver operations ensuring a virtual
>   *                               address on the buffer
>   *
>   * This macro provides a shortcut for setting the default GEM operations in the
> @@ -220,16 +220,16 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
>   *
>   * Drivers that come with their own implementation of
>   * &struct drm_driver.dumb_create should use
> - * DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE() instead. Use
> - * DRM_GEM_CMA_DRIVER_OPS_VMAP if possible. Drivers that do not require a
> - * virtual address on imported buffers should use DRM_GEM_CMA_DRIVER_OPS
> + * DRM_GEM_DMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE() instead. Use
> + * DRM_GEM_DMA_DRIVER_OPS_VMAP if possible. Drivers that do not require a
> + * virtual address on imported buffers should use DRM_GEM_DMA_DRIVER_OPS
>   * instead.
>   */
> -#define DRM_GEM_CMA_DRIVER_OPS_VMAP \
> -	DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(drm_gem_cma_dumb_create)
> +#define DRM_GEM_DMA_DRIVER_OPS_VMAP \
> +	DRM_GEM_DMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(drm_gem_dma_dumb_create)
>  
>  struct drm_gem_object *
> -drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *drm,
> +drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *drm,
>  				       struct dma_buf_attachment *attach,
>  				       struct sg_table *sgt);
>  
> @@ -238,22 +238,22 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *drm,
>   */
>  
>  #ifndef CONFIG_MMU
> -unsigned long drm_gem_cma_get_unmapped_area(struct file *filp,
> +unsigned long drm_gem_dma_get_unmapped_area(struct file *filp,
>  					    unsigned long addr,
>  					    unsigned long len,
>  					    unsigned long pgoff,
>  					    unsigned long flags);
> -#define DRM_GEM_CMA_UNMAPPED_AREA_FOPS \
> -	.get_unmapped_area	= drm_gem_cma_get_unmapped_area,
> +#define DRM_GEM_DMA_UNMAPPED_AREA_FOPS \
> +	.get_unmapped_area	= drm_gem_dma_get_unmapped_area,
>  #else
> -#define DRM_GEM_CMA_UNMAPPED_AREA_FOPS
> +#define DRM_GEM_DMA_UNMAPPED_AREA_FOPS
>  #endif
>  
>  /**
> - * DEFINE_DRM_GEM_CMA_FOPS() - macro to generate file operations for CMA drivers
> + * DEFINE_DRM_GEM_DMA_FOPS() - macro to generate file operations for DMA drivers
>   * @name: name for the generated structure
>   *
> - * This macro autogenerates a suitable &struct file_operations for CMA based
> + * This macro autogenerates a suitable &struct file_operations for DMA based
>   * drivers, which can be assigned to &drm_driver.fops. Note that this structure
>   * cannot be shared between drivers, because it contains a reference to the
>   * current module using THIS_MODULE.
> @@ -262,7 +262,7 @@ unsigned long drm_gem_cma_get_unmapped_area(struct file *filp,
>   * non-static version of this you're probably doing it wrong and will break the
>   * THIS_MODULE reference by accident.
>   */
> -#define DEFINE_DRM_GEM_CMA_FOPS(name) \
> +#define DEFINE_DRM_GEM_DMA_FOPS(name) \
>  	static const struct file_operations name = {\
>  		.owner		= THIS_MODULE,\
>  		.open		= drm_open,\
> @@ -273,7 +273,7 @@ unsigned long drm_gem_cma_get_unmapped_area(struct file *filp,
>  		.read		= drm_read,\
>  		.llseek		= noop_llseek,\
>  		.mmap		= drm_gem_mmap,\
> -		DRM_GEM_CMA_UNMAPPED_AREA_FOPS \
> +		DRM_GEM_DMA_UNMAPPED_AREA_FOPS \
>  	}
>  
> -#endif /* __DRM_GEM_CMA_HELPER_H__ */
> +#endif /* __DRM_GEM_DMA_HELPER_H__ */

-- 
Regards,

Laurent Pinchart
