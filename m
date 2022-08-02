Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 941D25874A4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 02:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8CE10E2AD;
	Tue,  2 Aug 2022 00:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE18110E2A3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 00:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659398652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p573nCvfu33P/QxWoqpqFMeCA0bHlK6P6yMPp3/sc8c=;
 b=c8qUGIHdHzIk0Jzcq0e09alUZUFFAiHkr7NIHyVpuiLePK9DHZVOKUHv46ofaQGkvyN4nl
 ekymUpjJXm1sgVkNgzekebZlU/YbH5W8kDbwGc20ekPGj56axebBgexjmS3SZtK5OIZ8lR
 sjrmkzXR/wIYhV6RjprKL8ltpdoBZAg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-x38VbdO0OT2wbateXTxcZw-1; Mon, 01 Aug 2022 20:04:11 -0400
X-MC-Unique: x38VbdO0OT2wbateXTxcZw-1
Received: by mail-ed1-f69.google.com with SMTP id
 w17-20020a056402269100b0043da2189b71so2546727edd.6
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 17:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=p573nCvfu33P/QxWoqpqFMeCA0bHlK6P6yMPp3/sc8c=;
 b=Lsr/UQkYRvWuWOMrb9nTxeC+PZX7PuuORaXr4vLiculw383ohuehdAvwqj6TvQfWT3
 Ads/5YjOGjuFiuhdV7GjMxZtDlPIM5haCkdN4MyVtPM2vkHajm6u+nCxE+HEqdNzBPkf
 gx9ykbAPy6FVtHkLYxYDhCyMMi0WvzG3FEBaWTU7YZre0Ke4spajhjZrQpOu7Y2rh3eK
 6RUdvI04dHceG9u8KmDvX8a8d9HNqVDqLYVH+umtQ4c1St0AB6Ha0LwZeRpnzy8MxKJw
 JXsD6Kr/+CMdVZIOyI9uMGbgqqQdSHUlG84sDXJocJsFwMPFWJ8xxKXID1I9FQtiVdUV
 6ppA==
X-Gm-Message-State: AJIora9hfzP0V9maAmKbEeYYJxCzRE/Qwfjfhuab0huBfqiA6sbItgqy
 M8JU3agSKcddIkk65TXVOLrB2hB7yirE446QFfYkGxaLqivj1sJv9FDk4Xz64Ewje/3/Cldslgv
 TJvflVRowTiQVBOyBbVD/iSh/Hcp/
X-Received: by 2002:a05:6402:51d1:b0:43b:f89e:a751 with SMTP id
 r17-20020a05640251d100b0043bf89ea751mr17720098edd.391.1659398650506; 
 Mon, 01 Aug 2022 17:04:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sZ98ij/l1dof7Dg71GX6jslmusBMOZueF2b8cDfiN6WaP8mXnQkh5Q51Zzujr2o5d9WjW16Q==
X-Received: by 2002:a05:6402:51d1:b0:43b:f89e:a751 with SMTP id
 r17-20020a05640251d100b0043bf89ea751mr17720085edd.391.1659398650319; 
 Mon, 01 Aug 2022 17:04:10 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a056402036400b0043cbdb16fbbsm7461686edw.24.2022.08.01.17.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 17:04:09 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 tzimmermann@suse.de, mripard@kernel.org, sam@ravnborg.org
Subject: [PATCH drm-misc-next v7 0/5] drm: rename CMA helpers to DMA helpers
Date: Tue,  2 Aug 2022 02:04:00 +0200
Message-Id: <20220802000405.949236-1-dakr@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series renames all CMA helpers to DMA helpers - considering the
hierarchy of APIs (mm/cma -> dma -> gem/fb dma helpers) calling them DMA
helpers seems to be more applicable.

Additionally, commit e57924d4ae80 ("drm/doc: Task to rename CMA helpers")
requests to rename the CMA helpers and implies that people seem to be confused
about the naming.

The patches are compile-time tested building a x86_64 kernel with
`make allyesconfig && make drivers/gpu/drm`.

Changes in v2:
  - Fixed up comments for consistent memory/address classification
    (DMA-contiguous)
  - Added a patch to rename struct drm_gem_dma_object.{paddr => dma_addr}

Changes in v3:
  - Use a ccoccinelle script for
    "drm/gem: rename struct drm_gem_dma_object.{paddr => dma_addr}" for fixing
    up missing drivers and compile-test on x86_64, arm and arm64.

Changes in v4:
  - Rebased all patches on drm-misc/drm-misc-next.

Changes in v5:
  - Rebase of v4, meanwhile some merge conflicts came up on
    drm-misc/drm-misc-next.

Changes in v6:
  - Added a patch to remove unused include occurances of drm_fb_cma_helper.h
    in various drivers.

Changes in v7:
  - Fix `select DRM_KMS_{CMA => DMA}_HELPER` and
        `select DRM_GEM_{CMA => DMA}_HELPER` in
    drivers/gpu/drm/logicvc/Kconfig and drivers/gpu/drm/mxsfb/Kconfig which
    slipped through in a rebase.
  - Another rebase.

Danilo Krummrich (5):
  drm/fb: remove unused includes of drm_fb_cma_helper.h
  drm/fb: rename FB CMA helpers to FB DMA helpers
  drm/gem: rename GEM CMA helpers to GEM DMA helpers
  drm/gem: rename struct drm_gem_dma_object.{paddr => dma_addr}
  drm/todo: remove task to rename CMA helpers

 Documentation/gpu/drm-kms-helpers.rst         |   8 +-
 Documentation/gpu/drm-mm.rst                  |  16 +-
 Documentation/gpu/todo.rst                    |  13 -
 drivers/gpu/drm/Kconfig                       |   4 +-
 drivers/gpu/drm/Makefile                      |   6 +-
 drivers/gpu/drm/arm/Kconfig                   |   4 +-
 drivers/gpu/drm/arm/display/Kconfig           |   2 +-
 .../arm/display/komeda/komeda_framebuffer.c   |  12 +-
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |  10 +-
 drivers/gpu/drm/arm/hdlcd_crtc.c              |   6 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |   7 +-
 drivers/gpu/drm/arm/malidp_drv.c              |   9 +-
 drivers/gpu/drm/arm/malidp_mw.c               |   8 +-
 drivers/gpu/drm/arm/malidp_planes.c           |  34 +-
 drivers/gpu/drm/armada/armada_gem.c           |   6 +-
 drivers/gpu/drm/aspeed/Kconfig                |   2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c      |  10 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |   7 +-
 drivers/gpu/drm/atmel-hlcdc/Kconfig           |   2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |   6 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |   8 +-
 ...rm_fb_cma_helper.c => drm_fb_dma_helper.c} |  67 ++--
 drivers/gpu/drm/drm_file.c                    |   2 +-
 drivers/gpu/drm/drm_format_helper.c           |   4 +-
 ..._gem_cma_helper.c => drm_gem_dma_helper.c} | 302 +++++++++---------
 drivers/gpu/drm/drm_mipi_dbi.c                |   2 +-
 drivers/gpu/drm/fsl-dcu/Kconfig               |   2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |   7 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c     |   1 -
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c   |  10 +-
 drivers/gpu/drm/hisilicon/kirin/Kconfig       |   2 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  14 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |   3 +-
 drivers/gpu/drm/imx/Kconfig                   |   2 +-
 drivers/gpu/drm/imx/dcss/Kconfig              |   2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c           |   6 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c         |  18 +-
 drivers/gpu/drm/imx/imx-drm-core.c            |   9 +-
 drivers/gpu/drm/imx/imx-drm.h                 |   2 +-
 drivers/gpu/drm/imx/ipuv3-crtc.c              |   3 +-
 drivers/gpu/drm/imx/ipuv3-plane.c             |  28 +-
 drivers/gpu/drm/ingenic/Kconfig               |   2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  14 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c         |  12 +-
 drivers/gpu/drm/kmb/Kconfig                   |   2 +-
 drivers/gpu/drm/kmb/kmb_drv.c                 |   6 +-
 drivers/gpu/drm/kmb/kmb_plane.c               |  10 +-
 drivers/gpu/drm/logicvc/Kconfig               |   4 +-
 drivers/gpu/drm/logicvc/logicvc_crtc.c        |   2 +-
 drivers/gpu/drm/logicvc/logicvc_drm.c         |  10 +-
 drivers/gpu/drm/logicvc/logicvc_interface.c   |   2 +-
 drivers/gpu/drm/logicvc/logicvc_layer.c       |   6 +-
 drivers/gpu/drm/logicvc/logicvc_mode.c        |   3 +-
 drivers/gpu/drm/mcde/Kconfig                  |   2 +-
 drivers/gpu/drm/mcde/mcde_display.c           |   8 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |  10 +-
 drivers/gpu/drm/mediatek/Kconfig              |   2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        |   4 +-
 drivers/gpu/drm/meson/Kconfig                 |   2 +-
 drivers/gpu/drm/meson/meson_drv.c             |  10 +-
 drivers/gpu/drm/meson/meson_overlay.c         |  18 +-
 drivers/gpu/drm/meson/meson_plane.c           |  10 +-
 drivers/gpu/drm/msm/msm_drv.c                 |   2 +-
 drivers/gpu/drm/mxsfb/Kconfig                 |   4 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c             |   6 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c             |   8 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |   6 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             |  34 +-
 drivers/gpu/drm/panel/Kconfig                 |   2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c  |   6 +-
 drivers/gpu/drm/pl111/Kconfig                 |   2 +-
 drivers/gpu/drm/pl111/pl111_display.c         |   8 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |   9 +-
 drivers/gpu/drm/rcar-du/Kconfig               |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |   3 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |   5 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  37 ++-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  10 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |   8 +-
 drivers/gpu/drm/rockchip/Kconfig              |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |   4 +-
 drivers/gpu/drm/shmobile/Kconfig              |   2 +-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c     |  14 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c      |   6 +-
 drivers/gpu/drm/shmobile/shmob_drm_kms.c      |   3 +-
 drivers/gpu/drm/shmobile/shmob_drm_kms.h      |   2 +-
 drivers/gpu/drm/shmobile/shmob_drm_plane.c    |  14 +-
 drivers/gpu/drm/solomon/ssd130x.c             |   1 -
 drivers/gpu/drm/sprd/Kconfig                  |   2 +-
 drivers/gpu/drm/sprd/sprd_dpu.c               |  10 +-
 drivers/gpu/drm/sprd/sprd_drm.c               |   6 +-
 drivers/gpu/drm/sti/Kconfig                   |   2 +-
 drivers/gpu/drm/sti/sti_cursor.c              |  14 +-
 drivers/gpu/drm/sti/sti_drv.c                 |   7 +-
 drivers/gpu/drm/sti/sti_gdp.c                 |  18 +-
 drivers/gpu/drm/sti/sti_hqvdp.c               |  18 +-
 drivers/gpu/drm/sti/sti_plane.c               |   3 +-
 drivers/gpu/drm/stm/Kconfig                   |   2 +-
 drivers/gpu/drm/stm/drv.c                     |  11 +-
 drivers/gpu/drm/stm/ltdc.c                    |  16 +-
 drivers/gpu/drm/sun4i/Kconfig                 |   2 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c         |  16 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   9 +-
 drivers/gpu/drm/sun4i/sun4i_frontend.c        |  26 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c           |   3 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  22 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  22 +-
 drivers/gpu/drm/tegra/fb.c                    |   2 +-
 drivers/gpu/drm/tidss/Kconfig                 |   2 +-
 drivers/gpu/drm/tidss/tidss_crtc.c            |   3 +-
 drivers/gpu/drm/tidss/tidss_dispc.c           |  28 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |   6 +-
 drivers/gpu/drm/tidss/tidss_kms.c             |   1 -
 drivers/gpu/drm/tidss/tidss_plane.c           |   1 -
 drivers/gpu/drm/tilcdc/Kconfig                |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c          |  10 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |   6 +-
 drivers/gpu/drm/tiny/Kconfig                  |  22 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  14 +-
 drivers/gpu/drm/tiny/hx8357d.c                |   6 +-
 drivers/gpu/drm/tiny/ili9163.c                |   6 +-
 drivers/gpu/drm/tiny/ili9225.c                |  12 +-
 drivers/gpu/drm/tiny/ili9341.c                |   6 +-
 drivers/gpu/drm/tiny/ili9486.c                |   6 +-
 drivers/gpu/drm/tiny/mi0283qt.c               |   6 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c         |   6 +-
 drivers/gpu/drm/tiny/repaper.c                |  12 +-
 drivers/gpu/drm/tiny/st7586.c                 |  12 +-
 drivers/gpu/drm/tiny/st7735r.c                |   6 +-
 drivers/gpu/drm/tve200/Kconfig                |   2 +-
 drivers/gpu/drm/tve200/tve200_display.c       |  12 +-
 drivers/gpu/drm/tve200/tve200_drv.c           |   7 +-
 drivers/gpu/drm/v3d/v3d_drv.c                 |   1 -
 drivers/gpu/drm/v3d/v3d_gem.c                 |   4 +-
 drivers/gpu/drm/vc4/Kconfig                   |   2 +-
 drivers/gpu/drm/vc4/vc4_bo.c                  |  46 +--
 drivers/gpu/drm/vc4/vc4_crtc.c                |  18 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |   7 +-
 drivers/gpu/drm/vc4/vc4_drv.h                 |  18 +-
 drivers/gpu/drm/vc4/vc4_gem.c                 |  12 +-
 drivers/gpu/drm/vc4/vc4_irq.c                 |   2 +-
 drivers/gpu/drm/vc4/vc4_plane.c               |  14 +-
 drivers/gpu/drm/vc4/vc4_render_cl.c           |  40 +--
 drivers/gpu/drm/vc4/vc4_txp.c                 |   8 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                 |   8 +-
 drivers/gpu/drm/vc4/vc4_validate.c            |  28 +-
 drivers/gpu/drm/vc4/vc4_validate_shaders.c    |   2 +-
 drivers/gpu/drm/xlnx/Kconfig                  |   2 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c            |   8 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |   8 +-
 ...rm_fb_cma_helper.h => drm_fb_dma_helper.h} |  10 +-
 include/drm/drm_gem.h                         |   2 +-
 ..._gem_cma_helper.h => drm_gem_dma_helper.h} | 158 ++++-----
 155 files changed, 890 insertions(+), 922 deletions(-)
 rename drivers/gpu/drm/{drm_fb_cma_helper.c => drm_fb_dma_helper.c} (60%)
 rename drivers/gpu/drm/{drm_gem_cma_helper.c => drm_gem_dma_helper.c} (61%)
 rename include/drm/{drm_fb_cma_helper.h => drm_fb_dma_helper.h} (56%)
 rename include/drm/{drm_gem_cma_helper.h => drm_gem_dma_helper.h} (53%)


base-commit: 9cf26c8968b358bb14cc078f8153300a493613d4
-- 
2.37.1

