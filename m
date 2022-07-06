Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 629AC56826D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 11:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D395112C46;
	Wed,  6 Jul 2022 09:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30948112C4A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 09:07:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18C3830A;
 Wed,  6 Jul 2022 11:07:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1657098429;
 bh=7a7sP/qfgjxBwlIY6oHlcCZlyF3jnNgn1GFBh6GTvz4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LQU4kBpLaR61Qojw4Rbx/fxB1BSWUUpqPVgc/NBbKyBBVp9rDnxq0tMg7PWsvBan4
 6Ovr39q+qE5gV/ojoBmGniKZJl6Ma7CnUbh4+xTkA/IG1SSvjGzUEGAVf3+4lem1Kl
 6EFL0BxNNzCiFinA8lNV+AVZCCRqcB4RWjjHOszw=
Date: Wed, 6 Jul 2022 12:06:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/3] drm: rename CMA helpers to DMA helpers
Message-ID: <YsVQo40s5PlPwynD@pendragon.ideasonboard.com>
References: <20220705212613.732039-1-dakr@redhat.com>
 <066c5652-79e8-85df-fcf6-f5ea46f4cd48@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <066c5652-79e8-85df-fcf6-f5ea46f4cd48@suse.de>
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
 Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, Jul 06, 2022 at 10:34:13AM +0200, Thomas Zimmermann wrote:
> Am 05.07.22 um 23:26 schrieb Danilo Krummrich:
> > This patch series renames all CMA helpers to DMA helpers - considering the
> > hierarchy of APIs (mm/cma -> dma -> gem/fb dma helpers) calling them DMA
> > helpers seems to be more applicable.
> 
> Ok, why not.
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> for the series.
> 
> Sometimes allocation fails because there's no CMA memory left. 
> Increasing that value on boot usually fixes the problem. Should we note 
> somewhere in the docs that the allocator is backed by pages in CMA memory?

CMA is only one of the backends that can be used here. For instance, if
the device performs DMA through an IOMMU, then CMA won't be used.

This being said, helping users who may face a problem with too little
CMA memory is useful, but I'm not sure where the best place to put that
information would be.

> > Additionally, commit e57924d4ae80 ("drm/doc: Task to rename CMA helpers")
> > requests to rename the CMA helpers and implies that people seem to be confused
> > about the naming.
> > 
> > The patches are compile-time tested building a x86_64 kernel with
> > `make allyesconfig && make drivers/gpu/drm`.
> > 
> > Danilo Krummrich (3):
> >    drm/fb: rename FB CMA helpers to FB DMA helpers
> >    drm/gem: rename GEM CMA helpers to GEM DMA helpers
> >    drm/todo: remove task to rename CMA helpers
> > 
> >   Documentation/gpu/drm-kms-helpers.rst         |   8 +-
> >   Documentation/gpu/drm-mm.rst                  |  16 +-
> >   Documentation/gpu/todo.rst                    |  13 -
> >   drivers/gpu/drm/Kconfig                       |   4 +-
> >   drivers/gpu/drm/Makefile                      |   6 +-
> >   drivers/gpu/drm/arm/Kconfig                   |   4 +-
> >   drivers/gpu/drm/arm/display/Kconfig           |   2 +-
> >   .../arm/display/komeda/komeda_framebuffer.c   |  10 +-
> >   .../gpu/drm/arm/display/komeda/komeda_kms.c   |  10 +-
> >   drivers/gpu/drm/arm/hdlcd_crtc.c              |   6 +-
> >   drivers/gpu/drm/arm/hdlcd_drv.c               |   8 +-
> >   drivers/gpu/drm/arm/malidp_drv.c              |  10 +-
> >   drivers/gpu/drm/arm/malidp_mw.c               |   6 +-
> >   drivers/gpu/drm/arm/malidp_planes.c           |  24 +-
> >   drivers/gpu/drm/armada/armada_gem.c           |   6 +-
> >   drivers/gpu/drm/aspeed/Kconfig                |   2 +-
> >   drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c      |   8 +-
> >   drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |   8 +-
> >   drivers/gpu/drm/atmel-hlcdc/Kconfig           |   2 +-
> >   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |   6 +-
> >   .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |   6 +-
> >   ...rm_fb_cma_helper.c => drm_fb_dma_helper.c} |  52 +--
> >   drivers/gpu/drm/drm_file.c                    |   2 +-
> >   drivers/gpu/drm/drm_format_helper.c           |   4 +-
> >   ..._gem_cma_helper.c => drm_gem_dma_helper.c} | 296 +++++++++---------
> >   drivers/gpu/drm/drm_mipi_dbi.c                |   2 +-
> >   drivers/gpu/drm/fsl-dcu/Kconfig               |   2 +-
> >   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |   8 +-
> >   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c     |   2 +-
> >   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c   |   8 +-
> >   drivers/gpu/drm/hisilicon/kirin/Kconfig       |   2 +-
> >   .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  10 +-
> >   .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |   4 +-
> >   drivers/gpu/drm/imx/Kconfig                   |   2 +-
> >   drivers/gpu/drm/imx/dcss/Kconfig              |   2 +-
> >   drivers/gpu/drm/imx/dcss/dcss-kms.c           |   6 +-
> >   drivers/gpu/drm/imx/dcss/dcss-plane.c         |  18 +-
> >   drivers/gpu/drm/imx/imx-drm-core.c            |  10 +-
> >   drivers/gpu/drm/imx/imx-drm.h                 |   2 +-
> >   drivers/gpu/drm/imx/ipuv3-crtc.c              |   4 +-
> >   drivers/gpu/drm/imx/ipuv3-plane.c             |  28 +-
> >   drivers/gpu/drm/ingenic/Kconfig               |   2 +-
> >   drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  14 +-
> >   drivers/gpu/drm/ingenic/ingenic-ipu.c         |  12 +-
> >   drivers/gpu/drm/kmb/Kconfig                   |   2 +-
> >   drivers/gpu/drm/kmb/kmb_drv.c                 |   6 +-
> >   drivers/gpu/drm/kmb/kmb_plane.c               |  10 +-
> >   drivers/gpu/drm/mcde/Kconfig                  |   2 +-
> >   drivers/gpu/drm/mcde/mcde_display.c           |   8 +-
> >   drivers/gpu/drm/mcde/mcde_drv.c               |  10 +-
> >   drivers/gpu/drm/mediatek/Kconfig              |   2 +-
> >   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +-
> >   drivers/gpu/drm/mediatek/mtk_drm_gem.c        |   4 +-
> >   drivers/gpu/drm/meson/Kconfig                 |   2 +-
> >   drivers/gpu/drm/meson/meson_drv.c             |  10 +-
> >   drivers/gpu/drm/meson/meson_overlay.c         |  12 +-
> >   drivers/gpu/drm/meson/meson_plane.c           |   8 +-
> >   drivers/gpu/drm/msm/msm_drv.c                 |   2 +-
> >   drivers/gpu/drm/mxsfb/Kconfig                 |   2 +-
> >   drivers/gpu/drm/mxsfb/mxsfb_drv.c             |   6 +-
> >   drivers/gpu/drm/mxsfb/mxsfb_kms.c             |  10 +-
> >   drivers/gpu/drm/panel/Kconfig                 |   2 +-
> >   drivers/gpu/drm/panel/panel-ilitek-ili9341.c  |   6 +-
> >   drivers/gpu/drm/pl111/Kconfig                 |   2 +-
> >   drivers/gpu/drm/pl111/pl111_display.c         |   8 +-
> >   drivers/gpu/drm/pl111/pl111_drv.c             |  10 +-
> >   drivers/gpu/drm/rcar-du/Kconfig               |   2 +-
> >   drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |   4 +-
> >   drivers/gpu/drm/rcar-du/rcar_du_drv.c         |   6 +-
> >   drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  38 +--
> >   drivers/gpu/drm/rcar-du/rcar_du_plane.c       |   8 +-
> >   drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |   6 +-
> >   drivers/gpu/drm/rockchip/Kconfig              |   2 +-
> >   drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |   2 +-
> >   drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |   4 +-
> >   drivers/gpu/drm/shmobile/Kconfig              |   2 +-
> >   drivers/gpu/drm/shmobile/shmob_drm_crtc.c     |  10 +-
> >   drivers/gpu/drm/shmobile/shmob_drm_drv.c      |   6 +-
> >   drivers/gpu/drm/shmobile/shmob_drm_kms.c      |   4 +-
> >   drivers/gpu/drm/shmobile/shmob_drm_kms.h      |   2 +-
> >   drivers/gpu/drm/shmobile/shmob_drm_plane.c    |  10 +-
> >   drivers/gpu/drm/solomon/ssd130x.c             |   2 +-
> >   drivers/gpu/drm/sprd/Kconfig                  |   2 +-
> >   drivers/gpu/drm/sprd/sprd_dpu.c               |  10 +-
> >   drivers/gpu/drm/sprd/sprd_drm.c               |   6 +-
> >   drivers/gpu/drm/sti/Kconfig                   |   2 +-
> >   drivers/gpu/drm/sti/sti_cursor.c              |  14 +-
> >   drivers/gpu/drm/sti/sti_drv.c                 |   8 +-
> >   drivers/gpu/drm/sti/sti_gdp.c                 |  18 +-
> >   drivers/gpu/drm/sti/sti_hqvdp.c               |  18 +-
> >   drivers/gpu/drm/sti/sti_plane.c               |   4 +-
> >   drivers/gpu/drm/stm/Kconfig                   |   2 +-
> >   drivers/gpu/drm/stm/drv.c                     |  12 +-
> >   drivers/gpu/drm/stm/ltdc.c                    |  16 +-
> >   drivers/gpu/drm/sun4i/Kconfig                 |   2 +-
> >   drivers/gpu/drm/sun4i/sun4i_backend.c         |   6 +-
> >   drivers/gpu/drm/sun4i/sun4i_drv.c             |  10 +-
> >   drivers/gpu/drm/sun4i/sun4i_frontend.c        |  10 +-
> >   drivers/gpu/drm/sun4i/sun8i_mixer.c           |   4 +-
> >   drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |   8 +-
> >   drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |   8 +-
> >   drivers/gpu/drm/tegra/fb.c                    |   2 +-
> >   drivers/gpu/drm/tidss/Kconfig                 |   2 +-
> >   drivers/gpu/drm/tidss/tidss_crtc.c            |   4 +-
> >   drivers/gpu/drm/tidss/tidss_dispc.c           |  12 +-
> >   drivers/gpu/drm/tidss/tidss_drv.c             |   6 +-
> >   drivers/gpu/drm/tidss/tidss_kms.c             |   2 +-
> >   drivers/gpu/drm/tidss/tidss_plane.c           |   2 +-
> >   drivers/gpu/drm/tilcdc/Kconfig                |   2 +-
> >   drivers/gpu/drm/tilcdc/tilcdc_crtc.c          |   8 +-
> >   drivers/gpu/drm/tilcdc/tilcdc_drv.c           |   6 +-
> >   drivers/gpu/drm/tiny/Kconfig                  |  22 +-
> >   drivers/gpu/drm/tiny/arcpgu.c                 |  12 +-
> >   drivers/gpu/drm/tiny/hx8357d.c                |   6 +-
> >   drivers/gpu/drm/tiny/ili9163.c                |   6 +-
> >   drivers/gpu/drm/tiny/ili9225.c                |  12 +-
> >   drivers/gpu/drm/tiny/ili9341.c                |   6 +-
> >   drivers/gpu/drm/tiny/ili9486.c                |   6 +-
> >   drivers/gpu/drm/tiny/mi0283qt.c               |   6 +-
> >   drivers/gpu/drm/tiny/panel-mipi-dbi.c         |   6 +-
> >   drivers/gpu/drm/tiny/repaper.c                |  12 +-
> >   drivers/gpu/drm/tiny/st7586.c                 |  12 +-
> >   drivers/gpu/drm/tiny/st7735r.c                |   6 +-
> >   drivers/gpu/drm/tve200/Kconfig                |   2 +-
> >   drivers/gpu/drm/tve200/tve200_display.c       |  12 +-
> >   drivers/gpu/drm/tve200/tve200_drv.c           |   8 +-
> >   drivers/gpu/drm/v3d/v3d_drv.c                 |   2 +-
> >   drivers/gpu/drm/v3d/v3d_gem.c                 |   4 +-
> >   drivers/gpu/drm/vc4/Kconfig                   |   2 +-
> >   drivers/gpu/drm/vc4/vc4_bo.c                  |  44 +--
> >   drivers/gpu/drm/vc4/vc4_crtc.c                |  10 +-
> >   drivers/gpu/drm/vc4/vc4_drv.c                 |   8 +-
> >   drivers/gpu/drm/vc4/vc4_drv.h                 |  18 +-
> >   drivers/gpu/drm/vc4/vc4_gem.c                 |   4 +-
> >   drivers/gpu/drm/vc4/vc4_plane.c               |  10 +-
> >   drivers/gpu/drm/vc4/vc4_render_cl.c           |  26 +-
> >   drivers/gpu/drm/vc4/vc4_txp.c                 |   6 +-
> >   drivers/gpu/drm/vc4/vc4_v3d.c                 |   4 +-
> >   drivers/gpu/drm/vc4/vc4_validate.c            |  16 +-
> >   drivers/gpu/drm/vc4/vc4_validate_shaders.c    |   2 +-
> >   drivers/gpu/drm/xlnx/Kconfig                  |   2 +-
> >   drivers/gpu/drm/xlnx/zynqmp_disp.c            |   4 +-
> >   drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |   8 +-
> >   ...rm_fb_cma_helper.h => drm_fb_dma_helper.h} |  10 +-
> >   include/drm/drm_gem.h                         |   2 +-
> >   ..._gem_cma_helper.h => drm_gem_dma_helper.h} | 154 ++++-----
> >   146 files changed, 777 insertions(+), 790 deletions(-)
> >   rename drivers/gpu/drm/{drm_fb_cma_helper.c => drm_fb_dma_helper.c} (68%)
> >   rename drivers/gpu/drm/{drm_gem_cma_helper.c => drm_gem_dma_helper.c} (60%)
> >   rename include/drm/{drm_fb_cma_helper.h => drm_fb_dma_helper.h} (56%)
> >   rename include/drm/{drm_gem_cma_helper.h => drm_gem_dma_helper.h} (53%)

-- 
Regards,

Laurent Pinchart
