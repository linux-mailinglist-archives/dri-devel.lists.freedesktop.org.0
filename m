Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 537F257B9A5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC8810E747;
	Wed, 20 Jul 2022 15:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23CA10F602
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658331095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5rGNZ6AjrPiUeagfQcQM9gVNh8yDULt+VyoYmJxgGjw=;
 b=F4yEHd2OYFHpbXgNdGLEFHF4krktmOg7H4cBdWF5C4nuWgv6/Qdx0XQrpmTNCZ2Kz8y7b6
 9Yqq+VjaKObXj/5sWwWngz5UYw+mfua7ZgKOWLBNf67nI45+sBcUJsr+/s7mDdf+UrX+wi
 UJPIL95FGbJxDQxqiuSpbceHr/8jah4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-ty113fYdMKCfKYuNDA7mJw-1; Wed, 20 Jul 2022 11:31:33 -0400
X-MC-Unique: ty113fYdMKCfKYuNDA7mJw-1
Received: by mail-ej1-f69.google.com with SMTP id
 qw22-20020a1709066a1600b0072f43c1f59bso2176346ejc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5rGNZ6AjrPiUeagfQcQM9gVNh8yDULt+VyoYmJxgGjw=;
 b=e85yvrrMY2i4lmWsLrJffDfvhFRnyZ7HsxKxkl4m4Jm1y7SEGFujmw5TdebsjUF6RT
 7Edev8Iteq2h0vDKW4lovAKGf40Pi98V0eQL2RVHapF6WOx2y4BiZEf/hP/BVUzKZPIj
 DxNlakuGCnQGk9kS62MCE3zfBeqxDWHTxDw2Jdje5GJv0hZKwkOrTupfZVd1sI1oikPQ
 lqkyeIB6e/pV0VCEaOvZCWhYiT+ZeAAbfM94+7S2IbRoHdThJIsFv1C6hLgIbKdwh/RU
 upsaOPRUU/Pj33cuGMSWDaJhY6OvobRaR/3dvIJsQe5F8mqE9r/lshysxJ4ebBpzKLpn
 PoTA==
X-Gm-Message-State: AJIora/1V+XJJXtqrzF97ZwhUBikA5FfjXPCucyNC+v3dwCOxQPAv8WY
 orWyy/+o3bWNRL4TjN03GdqWziEgJBUfWWd4kaookOCyFvbNJg0x9Oz6BRWIqWqqXrdHtX0cGZK
 +nnFZ1/5TatmEJaP/qJYIRaQWLboS
X-Received: by 2002:a17:907:7ea6:b0:72b:4afb:e8b with SMTP id
 qb38-20020a1709077ea600b0072b4afb0e8bmr36524039ejc.205.1658331091881; 
 Wed, 20 Jul 2022 08:31:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ttttURrpXNNJPMp+zevpfYONsMqWCHqsBWAPebWECToR5rJUIAtCmD26T53xfsFkZXGDbqKQ==
X-Received: by 2002:a17:907:7ea6:b0:72b:4afb:e8b with SMTP id
 qb38-20020a1709077ea600b0072b4afb0e8bmr36524027ejc.205.1658331091674; 
 Wed, 20 Jul 2022 08:31:31 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 t6-20020aa7d706000000b0043a85d7d15esm12366756edq.12.2022.07.20.08.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:31:31 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 tzimmermann@suse.de, mripard@kernel.org
Subject: [PATCH drm-misc-next v5 0/4] drm: rename CMA helpers to DMA helpers
Date: Wed, 20 Jul 2022 17:31:24 +0200
Message-Id: <20220720153128.526876-1-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
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

Danilo Krummrich (4):
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
 drivers/gpu/drm/arm/hdlcd_drv.c               |   8 +-
 drivers/gpu/drm/arm/malidp_drv.c              |  10 +-
 drivers/gpu/drm/arm/malidp_mw.c               |   8 +-
 drivers/gpu/drm/arm/malidp_planes.c           |  34 +-
 drivers/gpu/drm/armada/armada_gem.c           |   6 +-
 drivers/gpu/drm/aspeed/Kconfig                |   2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c      |  10 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |   8 +-
 drivers/gpu/drm/atmel-hlcdc/Kconfig           |   2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |   6 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |   8 +-
 ...rm_fb_cma_helper.c => drm_fb_dma_helper.c} |  67 ++--
 drivers/gpu/drm/drm_file.c                    |   2 +-
 drivers/gpu/drm/drm_format_helper.c           |   4 +-
 ..._gem_cma_helper.c => drm_gem_dma_helper.c} | 302 +++++++++---------
 drivers/gpu/drm/drm_mipi_dbi.c                |   2 +-
 drivers/gpu/drm/fsl-dcu/Kconfig               |   2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |   8 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c     |   2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c   |  10 +-
 drivers/gpu/drm/hisilicon/kirin/Kconfig       |   2 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  14 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |   4 +-
 drivers/gpu/drm/imx/Kconfig                   |   2 +-
 drivers/gpu/drm/imx/dcss/Kconfig              |   2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c           |   6 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c         |  18 +-
 drivers/gpu/drm/imx/imx-drm-core.c            |  10 +-
 drivers/gpu/drm/imx/imx-drm.h                 |   2 +-
 drivers/gpu/drm/imx/ipuv3-crtc.c              |   4 +-
 drivers/gpu/drm/imx/ipuv3-plane.c             |  28 +-
 drivers/gpu/drm/ingenic/Kconfig               |   2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  14 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c         |  12 +-
 drivers/gpu/drm/kmb/Kconfig                   |   2 +-
 drivers/gpu/drm/kmb/kmb_drv.c                 |   6 +-
 drivers/gpu/drm/kmb/kmb_plane.c               |  10 +-
 drivers/gpu/drm/logicvc/logicvc_crtc.c        |   2 +-
 drivers/gpu/drm/logicvc/logicvc_drm.c         |  10 +-
 drivers/gpu/drm/logicvc/logicvc_interface.c   |   2 +-
 drivers/gpu/drm/logicvc/logicvc_layer.c       |   6 +-
 drivers/gpu/drm/logicvc/logicvc_mode.c        |   4 +-
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
 drivers/gpu/drm/mxsfb/Kconfig                 |   2 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c             |   6 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c             |   8 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |   6 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             |  34 +-
 drivers/gpu/drm/panel/Kconfig                 |   2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c  |   6 +-
 drivers/gpu/drm/pl111/Kconfig                 |   2 +-
 drivers/gpu/drm/pl111/pl111_display.c         |   8 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |  10 +-
 drivers/gpu/drm/rcar-du/Kconfig               |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |   4 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  38 +--
 drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  10 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |   8 +-
 drivers/gpu/drm/rockchip/Kconfig              |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |   4 +-
 drivers/gpu/drm/shmobile/Kconfig              |   2 +-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c     |  14 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c      |   6 +-
 drivers/gpu/drm/shmobile/shmob_drm_kms.c      |   4 +-
 drivers/gpu/drm/shmobile/shmob_drm_kms.h      |   2 +-
 drivers/gpu/drm/shmobile/shmob_drm_plane.c    |  14 +-
 drivers/gpu/drm/solomon/ssd130x.c             |   2 +-
 drivers/gpu/drm/sprd/Kconfig                  |   2 +-
 drivers/gpu/drm/sprd/sprd_dpu.c               |  10 +-
 drivers/gpu/drm/sprd/sprd_drm.c               |   6 +-
 drivers/gpu/drm/sti/Kconfig                   |   2 +-
 drivers/gpu/drm/sti/sti_cursor.c              |  14 +-
 drivers/gpu/drm/sti/sti_drv.c                 |   8 +-
 drivers/gpu/drm/sti/sti_gdp.c                 |  18 +-
 drivers/gpu/drm/sti/sti_hqvdp.c               |  18 +-
 drivers/gpu/drm/sti/sti_plane.c               |   4 +-
 drivers/gpu/drm/stm/Kconfig                   |   2 +-
 drivers/gpu/drm/stm/drv.c                     |  12 +-
 drivers/gpu/drm/stm/ltdc.c                    |  16 +-
 drivers/gpu/drm/sun4i/Kconfig                 |   2 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c         |  16 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  10 +-
 drivers/gpu/drm/sun4i/sun4i_frontend.c        |  26 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c           |   4 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  22 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  22 +-
 drivers/gpu/drm/tegra/fb.c                    |   2 +-
 drivers/gpu/drm/tidss/Kconfig                 |   2 +-
 drivers/gpu/drm/tidss/tidss_crtc.c            |   4 +-
 drivers/gpu/drm/tidss/tidss_dispc.c           |  28 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |   6 +-
 drivers/gpu/drm/tidss/tidss_kms.c             |   2 +-
 drivers/gpu/drm/tidss/tidss_plane.c           |   2 +-
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
 drivers/gpu/drm/tve200/tve200_drv.c           |   8 +-
 drivers/gpu/drm/v3d/v3d_drv.c                 |   2 +-
 drivers/gpu/drm/v3d/v3d_gem.c                 |   4 +-
 drivers/gpu/drm/vc4/Kconfig                   |   2 +-
 drivers/gpu/drm/vc4/vc4_bo.c                  |  46 +--
 drivers/gpu/drm/vc4/vc4_crtc.c                |  18 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |   8 +-
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
 154 files changed, 913 insertions(+), 919 deletions(-)
 rename drivers/gpu/drm/{drm_fb_cma_helper.c => drm_fb_dma_helper.c} (60%)
 rename drivers/gpu/drm/{drm_gem_cma_helper.c => drm_gem_dma_helper.c} (61%)
 rename include/drm/{drm_fb_cma_helper.h => drm_fb_dma_helper.h} (56%)
 rename include/drm/{drm_gem_cma_helper.h => drm_gem_dma_helper.h} (53%)

-- 
2.36.1

