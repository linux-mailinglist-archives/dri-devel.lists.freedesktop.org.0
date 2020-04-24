Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00F41B7D4C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 19:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E836EAF2;
	Fri, 24 Apr 2020 17:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EFD6EAF2;
 Fri, 24 Apr 2020 17:51:11 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CCDE120031;
 Fri, 24 Apr 2020 19:51:08 +0200 (CEST)
Date: Fri, 24 Apr 2020 19:51:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 49/59] drm/arc: Inline arcpgu_crtc.c
Message-ID: <20200424175102.GF7074@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-50-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-50-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=7gkXJVJtAAAA:8 a=jIQo8A4GAAAA:8
 a=e5mUnYsNAAAA:8 a=gZwJDl50K_2zEdiwUjIA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Lf5xNeLK5dgiOs8hzIjU:22
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Wed, Apr 15, 2020 at 09:40:24AM +0200, Daniel Vetter wrote:
> Really not big anymore.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

A few things below that maybe should be addressed. Otherwise:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/arc/Makefile      |   2 +-
>  drivers/gpu/drm/arc/arcpgu.h      |   1 -
>  drivers/gpu/drm/arc/arcpgu_crtc.c | 166 ------------------------------
>  drivers/gpu/drm/arc/arcpgu_drv.c  | 147 +++++++++++++++++++++++++-
>  drivers/gpu/drm/arc/arcpgu_sim.c  |  12 ---
>  5 files changed, 146 insertions(+), 182 deletions(-)
>  delete mode 100644 drivers/gpu/drm/arc/arcpgu_crtc.c
> 
> diff --git a/drivers/gpu/drm/arc/Makefile b/drivers/gpu/drm/arc/Makefile
> index c7028b7427b3..c686e0287a71 100644
> --- a/drivers/gpu/drm/arc/Makefile
> +++ b/drivers/gpu/drm/arc/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -arcpgu-y := arcpgu_crtc.o arcpgu_hdmi.o arcpgu_sim.o arcpgu_drv.o
> +arcpgu-y := arcpgu_hdmi.o arcpgu_sim.o arcpgu_drv.o
>  obj-$(CONFIG_DRM_ARCPGU) += arcpgu.o
> diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
> index b5c699d14f27..cee2448a07d6 100644
> --- a/drivers/gpu/drm/arc/arcpgu.h
> +++ b/drivers/gpu/drm/arc/arcpgu.h
> @@ -34,7 +34,6 @@ static inline u32 arc_pgu_read(struct arcpgu_drm_private *arcpgu,
>  	return ioread32(arcpgu->regs + reg);
>  }
>  
> -int arc_pgu_setup_pipe(struct drm_device *dev);
>  int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np);
>  int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np);
>  
> diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
> deleted file mode 100644
> index 4655f03e37f1..000000000000
> --- a/drivers/gpu/drm/arc/arcpgu_crtc.c
> +++ /dev/null
> @@ -1,166 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * ARC PGU DRM driver.
> - *
> - * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
> - */
> -
> -#include <drm/drm_atomic_helper.h>
> -#include <drm/drm_device.h>
> -#include <drm/drm_fb_cma_helper.h>
> -#include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_plane_helper.h>
> -#include <drm/drm_probe_helper.h>
> -#include <linux/clk.h>
> -#include <linux/platform_data/simplefb.h>
> -
> -#include "arcpgu.h"
> -#include "arcpgu_regs.h"
> -
> -#define ENCODE_PGU_XY(x, y)	((((x) - 1) << 16) | ((y) - 1))
> -
> -static const u32 arc_pgu_supported_formats[] = {
> -	DRM_FORMAT_RGB565,
> -	DRM_FORMAT_XRGB8888,
> -	DRM_FORMAT_ARGB8888,
> -};
> -
> -static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
> -{
> -	const struct drm_framebuffer *fb = arcpgu->pipe.plane.state->fb;
> -	uint32_t pixel_format = fb->format->format;
> -	u32 format = DRM_FORMAT_INVALID;
> -	int i;
> -	u32 reg_ctrl;
> -
> -	for (i = 0; i < ARRAY_SIZE(arc_pgu_supported_formats); i++) {
> -		if (arc_pgu_supported_formats[i] == pixel_format)
> -			format = arc_pgu_supported_formats[i];
> -	}
> -
> -	if (WARN_ON(format == DRM_FORMAT_INVALID))
> -		return;
> -
> -	reg_ctrl = arc_pgu_read(arcpgu, ARCPGU_REG_CTRL);
> -	if (format == DRM_FORMAT_RGB565)
> -		reg_ctrl &= ~ARCPGU_MODE_XRGB8888;
> -	else
> -		reg_ctrl |= ARCPGU_MODE_XRGB8888;
> -	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, reg_ctrl);
> -}
> -
> -static const struct drm_crtc_funcs arc_pgu_crtc_funcs = {
> -	.destroy = drm_crtc_cleanup,
> -	.set_config = drm_atomic_helper_set_config,
> -	.page_flip = drm_atomic_helper_page_flip,
> -	.reset = drm_atomic_helper_crtc_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> -};
> -
> -static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *pipe,
> -					       const struct drm_display_mode *mode)
> -{
> -	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
> -	long rate, clk_rate = mode->clock * 1000;
> -	long diff = clk_rate / 200; /* +-0.5% allowed by HDMI spec */
> -
> -	rate = clk_round_rate(arcpgu->clk, clk_rate);
> -	if ((max(rate, clk_rate) - min(rate, clk_rate) < diff) && (rate > 0))
> -		return MODE_OK;
> -
> -	return MODE_NOCLOCK;
> -}
> -
> -static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
> -{
> -	struct drm_display_mode *m = &arcpgu->pipe.crtc.state->adjusted_mode;
> -	u32 val;
> -
> -	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
> -		      ENCODE_PGU_XY(m->crtc_htotal, m->crtc_vtotal));
> -
> -	arc_pgu_write(arcpgu, ARCPGU_REG_HSYNC,
> -		      ENCODE_PGU_XY(m->crtc_hsync_start - m->crtc_hdisplay,
> -				    m->crtc_hsync_end - m->crtc_hdisplay));
> -
> -	arc_pgu_write(arcpgu, ARCPGU_REG_VSYNC,
> -		      ENCODE_PGU_XY(m->crtc_vsync_start - m->crtc_vdisplay,
> -				    m->crtc_vsync_end - m->crtc_vdisplay));
> -
> -	arc_pgu_write(arcpgu, ARCPGU_REG_ACTIVE,
> -		      ENCODE_PGU_XY(m->crtc_hblank_end - m->crtc_hblank_start,
> -				    m->crtc_vblank_end - m->crtc_vblank_start));
> -
> -	val = arc_pgu_read(arcpgu, ARCPGU_REG_CTRL);
> -
> -	if (m->flags & DRM_MODE_FLAG_PVSYNC)
> -		val |= ARCPGU_CTRL_VS_POL_MASK << ARCPGU_CTRL_VS_POL_OFST;
> -	else
> -		val &= ~(ARCPGU_CTRL_VS_POL_MASK << ARCPGU_CTRL_VS_POL_OFST);
> -
> -	if (m->flags & DRM_MODE_FLAG_PHSYNC)
> -		val |= ARCPGU_CTRL_HS_POL_MASK << ARCPGU_CTRL_HS_POL_OFST;
> -	else
> -		val &= ~(ARCPGU_CTRL_HS_POL_MASK << ARCPGU_CTRL_HS_POL_OFST);
> -
> -	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, val);
> -	arc_pgu_write(arcpgu, ARCPGU_REG_STRIDE, 0);
> -	arc_pgu_write(arcpgu, ARCPGU_REG_START_SET, 1);
> -
> -	arc_pgu_set_pxl_fmt(arcpgu);
> -
> -	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
> -}
> -
> -static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
> -			   struct drm_crtc_state *crtc_state,
> -			   struct drm_plane_state *plane_state)
> -{
> -	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
> -
> -	arc_pgu_mode_set(arcpgu);
> -
> -	clk_prepare_enable(arcpgu->clk);
> -	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
> -		      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) |
> -		      ARCPGU_CTRL_ENABLE_MASK);
> -}
> -
> -static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
> -{
> -	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
> -
> -	clk_disable_unprepare(arcpgu->clk);
> -	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
> -			      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) &
> -			      ~ARCPGU_CTRL_ENABLE_MASK);
> -}
> -
> -static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
> -			   struct drm_plane_state *state)
> -{
> -	struct arcpgu_drm_private *arcpgu;
> -	struct drm_gem_cma_object *gem;
> -
> -	arcpgu = pipe_to_arcpgu_priv(pipe);
> -	gem = drm_fb_cma_get_gem_obj(pipe->plane.state->fb, 0);
> -	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
> -}
> -
> -static const struct drm_simple_display_pipe_funcs arc_pgu_pipe_funcs = {
> -	.update = arc_pgu_update,
> -	.mode_valid = arc_pgu_mode_valid,
> -	.enable	= arc_pgu_enable,
> -	.disable = arc_pgu_disable,
> -};
> -
> -int arc_pgu_setup_pipe(struct drm_device *drm)
> -{
> -	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
> -
> -	return drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe_funcs,
> -					    arc_pgu_supported_formats,
> -					    ARRAY_SIZE(arc_pgu_supported_formats),
> -					    NULL, NULL);
> -}
> diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
> index bf03eda532bc..2443e3c78a76 100644
> --- a/drivers/gpu/drm/arc/arcpgu_drv.c
> +++ b/drivers/gpu/drm/arc/arcpgu_drv.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_of.h>
> @@ -24,6 +25,144 @@
>  #include "arcpgu.h"
>  #include "arcpgu_regs.h"
>  
> +#define ENCODE_PGU_XY(x, y)	((((x) - 1) << 16) | ((y) - 1))
> +
> +static const u32 arc_pgu_supported_formats[] = {
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +};
> +
> +static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
> +{
> +	const struct drm_framebuffer *fb = arcpgu->pipe.plane.state->fb;
> +	uint32_t pixel_format = fb->format->format;
> +	u32 format = DRM_FORMAT_INVALID;
> +	int i;
> +	u32 reg_ctrl;
> +
> +	for (i = 0; i < ARRAY_SIZE(arc_pgu_supported_formats); i++) {
> +		if (arc_pgu_supported_formats[i] == pixel_format)
> +			format = arc_pgu_supported_formats[i];
> +	}
> +
> +	if (WARN_ON(format == DRM_FORMAT_INVALID))
> +		return;
> +
> +	reg_ctrl = arc_pgu_read(arcpgu, ARCPGU_REG_CTRL);
> +	if (format == DRM_FORMAT_RGB565)
> +		reg_ctrl &= ~ARCPGU_MODE_XRGB8888;
> +	else
> +		reg_ctrl |= ARCPGU_MODE_XRGB8888;
> +	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, reg_ctrl);
> +}
> +
> +static const struct drm_crtc_funcs arc_pgu_crtc_funcs = {
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *pipe,
> +					       const struct drm_display_mode *mode)
> +{
> +	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
> +	long rate, clk_rate = mode->clock * 1000;
> +	long diff = clk_rate / 200; /* +-0.5% allowed by HDMI spec */
> +
> +	rate = clk_round_rate(arcpgu->clk, clk_rate);
> +	if ((max(rate, clk_rate) - min(rate, clk_rate) < diff) && (rate > 0))
> +		return MODE_OK;
> +
> +	return MODE_NOCLOCK;
> +}
> +
> +static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
> +{
> +	struct drm_display_mode *m = &arcpgu->pipe.crtc.state->adjusted_mode;
> +	u32 val;
> +
> +	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
> +		      ENCODE_PGU_XY(m->crtc_htotal, m->crtc_vtotal));
> +
> +	arc_pgu_write(arcpgu, ARCPGU_REG_HSYNC,
> +		      ENCODE_PGU_XY(m->crtc_hsync_start - m->crtc_hdisplay,
> +				    m->crtc_hsync_end - m->crtc_hdisplay));
> +
> +	arc_pgu_write(arcpgu, ARCPGU_REG_VSYNC,
> +		      ENCODE_PGU_XY(m->crtc_vsync_start - m->crtc_vdisplay,
> +				    m->crtc_vsync_end - m->crtc_vdisplay));
> +
> +	arc_pgu_write(arcpgu, ARCPGU_REG_ACTIVE,
> +		      ENCODE_PGU_XY(m->crtc_hblank_end - m->crtc_hblank_start,
> +				    m->crtc_vblank_end - m->crtc_vblank_start));
> +
> +	val = arc_pgu_read(arcpgu, ARCPGU_REG_CTRL);
> +
> +	if (m->flags & DRM_MODE_FLAG_PVSYNC)
> +		val |= ARCPGU_CTRL_VS_POL_MASK << ARCPGU_CTRL_VS_POL_OFST;
> +	else
> +		val &= ~(ARCPGU_CTRL_VS_POL_MASK << ARCPGU_CTRL_VS_POL_OFST);
> +
> +	if (m->flags & DRM_MODE_FLAG_PHSYNC)
> +		val |= ARCPGU_CTRL_HS_POL_MASK << ARCPGU_CTRL_HS_POL_OFST;
> +	else
> +		val &= ~(ARCPGU_CTRL_HS_POL_MASK << ARCPGU_CTRL_HS_POL_OFST);
> +
> +	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, val);
> +	arc_pgu_write(arcpgu, ARCPGU_REG_STRIDE, 0);
> +	arc_pgu_write(arcpgu, ARCPGU_REG_START_SET, 1);
> +
> +	arc_pgu_set_pxl_fmt(arcpgu);
> +
> +	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
> +}
> +
> +static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
> +			   struct drm_crtc_state *crtc_state,
> +			   struct drm_plane_state *plane_state)
> +{
> +	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
> +
> +	arc_pgu_mode_set(arcpgu);
> +
> +	clk_prepare_enable(arcpgu->clk);
> +	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
> +		      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) |
> +		      ARCPGU_CTRL_ENABLE_MASK);
> +}
> +
> +static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
> +{
> +	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
> +
> +	clk_disable_unprepare(arcpgu->clk);
> +	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
> +			      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) &
> +			      ~ARCPGU_CTRL_ENABLE_MASK);
> +}
> +
> +static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
> +			   struct drm_plane_state *state)
> +{
> +	struct arcpgu_drm_private *arcpgu;
> +	struct drm_gem_cma_object *gem;
> +
> +	arcpgu = pipe_to_arcpgu_priv(pipe);
> +	gem = drm_fb_cma_get_gem_obj(pipe->plane.state->fb, 0);
> +	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
> +}
> +
> +static const struct drm_simple_display_pipe_funcs arc_pgu_pipe_funcs = {
> +	.update = arc_pgu_update,
> +	.mode_valid = arc_pgu_mode_valid,
> +	.enable	= arc_pgu_enable,
> +	.disable = arc_pgu_disable,
> +};
> +
>  static const struct drm_mode_config_funcs arcpgu_drm_modecfg_funcs = {
>  	.fb_create  = drm_gem_fb_create,
>  	.atomic_check = drm_atomic_helper_check,
> @@ -70,8 +209,12 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
>  	if (dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32)))
>  		return -ENODEV;
>  
> -	if (arc_pgu_setup_pipe(drm) < 0)
> -		return -ENODEV;
> +	ret = drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe_funcs,
> +					   arc_pgu_supported_formats,
> +					   ARRAY_SIZE(arc_pgu_supported_formats),
> +					   NULL, NULL);
> +	if (ret)
> +		return ret;

Detail. In the old code ant error was converted to -ENODEV.
The new code let the error code bubble up - which is better.
But this is a small change that is not in the changelog.


>  
>  	/*
>  	 * There is only one output port inside each device. It is linked with
> diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arcpgu_sim.c
> index afc34f8b4de0..1a63f0868504 100644
> --- a/drivers/gpu/drm/arc/arcpgu_sim.c
> +++ b/drivers/gpu/drm/arc/arcpgu_sim.c
> @@ -45,10 +45,6 @@ static const struct drm_connector_funcs arcpgu_drm_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> -static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
>  int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
>  {
>  	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
> @@ -58,14 +54,6 @@ int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
>  
>  	encoder = &arcpgu->pipe.encoder;
>  
> -	encoder->possible_crtcs = 1;
> -	encoder->possible_clones = 0;
> -
> -	ret = drm_encoder_init(drm, encoder, &arcpgu_drm_encoder_funcs,
> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> -	if (ret)
> -		return ret;
> -

This looks like code that belongs in one of the former patches.
Not that it matters much but anyway.

	Sam

>  	connector = &arcpgu->sim_conn;
>  	drm_connector_helper_add(connector, &arcpgu_drm_connector_helper_funcs);
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
