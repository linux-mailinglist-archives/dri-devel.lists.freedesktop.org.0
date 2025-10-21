Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50C0BF7A8F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 18:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B5110E61B;
	Tue, 21 Oct 2025 16:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7nRF5NK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D50710E61A;
 Tue, 21 Oct 2025 16:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761064187; x=1792600187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WshM12clDtmRk6rntdT52P13vwgEwl3YBrl1Ev7Ui94=;
 b=n7nRF5NKWn/I4WW+ly92eC5W4/oNV3jU3ONPuBL3d7n1Us0ar8MYhMyX
 N14kzWBb29Ez79pZJHclD7+gySCfVo1v1VXYWp/hD1Fh6KirwwaLeziu5
 xo5tLXCvGlFLlyEwzRQKT426ESnSi3It5yWiUKWHl44YyqkjXuwSKHorE
 cZdpSB220W2UypXN4LQ1zgDHDmli1YrG8P6bIibLaj6OY9bUEwl9UAUQX
 4mqaC1zejCrrSi9iyONnjPr64nomfulJxf14RirGSsGnwFA1lePgBbCv2
 3GjlGGdSbxWxfOuvTuKqtvGwfW6wydmqwExh4DuOrTaZQw8E4H9W2MZDg w==;
X-CSE-ConnectionGUID: bU9tUbo4TEiCbfuCSEZ/Ww==
X-CSE-MsgGUID: ka6xfIg2QSW0NivbhGDehw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66837325"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="66837325"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 09:29:46 -0700
X-CSE-ConnectionGUID: MdfGPWGDTeGoVMqLtoNExQ==
X-CSE-MsgGUID: kShLdWcHRTiqa04i39mUhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="220809841"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.52])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 09:29:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 simona.vetter@ffwll.ch
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/mm: replace drm_print.h include with a forward
 declaration
Date: Tue, 21 Oct 2025 19:29:26 +0300
Message-ID: <05a996d685afb1facfdd5aef1eab1680fa5eb0a0.1761063757.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1761063757.git.jani.nikula@intel.com>
References: <cover.1761063757.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
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

The drm_mm.h header does not really need anything from drm_print.h. A
simple forward declaration for struct drm_printer is sufficient.

Alas, a gazillion files depend on that indirect include, and need the
explicit drm_print.h include. Add them all over the place.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/accel/amdxdna/amdxdna_gem.c                     | 1 +
 drivers/accel/rocket/rocket_gem.c                       | 1 +
 drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c | 1 +
 drivers/gpu/drm/arm/hdlcd_crtc.c                        | 1 +
 drivers/gpu/drm/arm/hdlcd_drv.c                         | 1 +
 drivers/gpu/drm/arm/malidp_drv.c                        | 1 +
 drivers/gpu/drm/arm/malidp_mw.c                         | 1 +
 drivers/gpu/drm/armada/armada_crtc.c                    | 1 +
 drivers/gpu/drm/armada/armada_debugfs.c                 | 1 +
 drivers/gpu/drm/armada/armada_fb.c                      | 1 +
 drivers/gpu/drm/armada/armada_fbdev.c                   | 1 +
 drivers/gpu/drm/armada/armada_gem.c                     | 1 +
 drivers/gpu/drm/armada/armada_overlay.c                 | 1 +
 drivers/gpu/drm/armada/armada_plane.c                   | 1 +
 drivers/gpu/drm/ast/ast_mode.c                          | 1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c            | 1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c         | 1 +
 drivers/gpu/drm/drm_dumb_buffers.c                      | 1 +
 drivers/gpu/drm/drm_fbdev_dma.c                         | 1 +
 drivers/gpu/drm/drm_fbdev_shmem.c                       | 1 +
 drivers/gpu/drm/drm_gem_dma_helper.c                    | 1 +
 drivers/gpu/drm/drm_gem_framebuffer_helper.c            | 1 +
 drivers/gpu/drm/drm_gpuvm.c                             | 1 +
 drivers/gpu/drm/drm_mipi_dbi.c                          | 1 +
 drivers/gpu/drm/drm_mm.c                                | 1 +
 drivers/gpu/drm/drm_prime.c                             | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c                | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c                   | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c                   | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c            | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c                   | 2 ++
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c                   | 2 ++
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c           | 1 +
 drivers/gpu/drm/exynos/exynos7_drm_decon.c              | 1 +
 drivers/gpu/drm/exynos/exynos_drm_fb.c                  | 1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c               | 1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c                | 1 +
 drivers/gpu/drm/exynos/exynos_drm_g2d.c                 | 1 +
 drivers/gpu/drm/exynos/exynos_drm_gem.c                 | 1 +
 drivers/gpu/drm/exynos/exynos_drm_ipp.c                 | 1 +
 drivers/gpu/drm/exynos/exynos_drm_plane.c               | 1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c                | 1 +
 drivers/gpu/drm/exynos/exynos_mixer.c                   | 1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c             | 1 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c         | 1 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c         | 1 +
 drivers/gpu/drm/i915/display/intel_display_debugfs.c    | 1 +
 drivers/gpu/drm/i915/display/intel_frontbuffer.c        | 1 +
 drivers/gpu/drm/i915/display/intel_plane.c              | 1 +
 drivers/gpu/drm/i915/display/intel_psr.c                | 1 +
 drivers/gpu/drm/imagination/pvr_ccb.c                   | 1 +
 drivers/gpu/drm/imagination/pvr_fw.c                    | 1 +
 drivers/gpu/drm/imagination/pvr_fw_meta.c               | 2 ++
 drivers/gpu/drm/imagination/pvr_fw_trace.c              | 1 +
 drivers/gpu/drm/imagination/pvr_power.c                 | 1 +
 drivers/gpu/drm/imagination/pvr_vm.c                    | 1 +
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c                 | 1 +
 drivers/gpu/drm/kmb/kmb_drv.c                           | 1 +
 drivers/gpu/drm/kmb/kmb_plane.c                         | 1 +
 drivers/gpu/drm/lima/lima_sched.c                       | 2 ++
 drivers/gpu/drm/mcde/mcde_display.c                     | 1 +
 drivers/gpu/drm/mediatek/mtk_crtc.c                     | 1 +
 drivers/gpu/drm/mediatek/mtk_gem.c                      | 1 +
 drivers/gpu/drm/mediatek/mtk_plane.c                    | 1 +
 drivers/gpu/drm/meson/meson_overlay.c                   | 1 +
 drivers/gpu/drm/meson/meson_plane.c                     | 1 +
 drivers/gpu/drm/mgag200/mgag200_drv.c                   | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200.c                  | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200eh.c                | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c               | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200eh5.c               | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200er.c                | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200ev.c                | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c               | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200se.c                | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200wb.c                | 1 +
 drivers/gpu/drm/mgag200/mgag200_vga.c                   | 1 +
 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c               | 1 +
 drivers/gpu/drm/mxsfb/lcdif_kms.c                       | 1 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                       | 1 +
 drivers/gpu/drm/omapdrm/omap_crtc.c                     | 1 +
 drivers/gpu/drm/omapdrm/omap_debugfs.c                  | 1 +
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c                | 2 ++
 drivers/gpu/drm/omapdrm/omap_drv.c                      | 1 +
 drivers/gpu/drm/omapdrm/omap_fb.c                       | 1 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c                    | 1 +
 drivers/gpu/drm/omapdrm/omap_gem.c                      | 1 +
 drivers/gpu/drm/omapdrm/omap_irq.c                      | 1 +
 drivers/gpu/drm/omapdrm/omap_overlay.c                  | 1 +
 drivers/gpu/drm/omapdrm/omap_plane.c                    | 1 +
 drivers/gpu/drm/panfrost/panfrost_devfreq.c             | 2 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c                 | 1 +
 drivers/gpu/drm/panfrost/panfrost_gem.c                 | 1 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c                 | 2 ++
 drivers/gpu/drm/panfrost/panfrost_mmu.c                 | 1 +
 drivers/gpu/drm/pl111/pl111_display.c                   | 1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c          | 1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c           | 1 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c         | 1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c                  | 1 +
 drivers/gpu/drm/rockchip/cdn-dp-reg.c                   | 2 ++
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c         | 1 +
 drivers/gpu/drm/rockchip/inno_hdmi.c                    | 1 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c                  | 1 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c             | 1 +
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c             | 1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c             | 1 +
 drivers/gpu/drm/rockchip/rockchip_lvds.c                | 1 +
 drivers/gpu/drm/rockchip/rockchip_rgb.c                 | 1 +
 drivers/gpu/drm/sitronix/st7586.c                       | 1 +
 drivers/gpu/drm/sitronix/st7735r.c                      | 1 +
 drivers/gpu/drm/solomon/ssd130x.c                       | 1 +
 drivers/gpu/drm/sti/sti_cursor.c                        | 1 +
 drivers/gpu/drm/sti/sti_drv.c                           | 1 +
 drivers/gpu/drm/sti/sti_gdp.c                           | 1 +
 drivers/gpu/drm/sti/sti_hqvdp.c                         | 1 +
 drivers/gpu/drm/sti/sti_plane.c                         | 1 +
 drivers/gpu/drm/stm/drv.c                               | 1 +
 drivers/gpu/drm/stm/ltdc.c                              | 1 +
 drivers/gpu/drm/sun4i/sun4i_backend.c                   | 1 +
 drivers/gpu/drm/sun4i/sun4i_drv.c                       | 1 +
 drivers/gpu/drm/sun4i/sun4i_frontend.c                  | 1 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c                     | 1 +
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c                  | 1 +
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c                  | 1 +
 drivers/gpu/drm/sysfb/efidrm.c                          | 1 +
 drivers/gpu/drm/sysfb/ofdrm.c                           | 1 +
 drivers/gpu/drm/sysfb/simpledrm.c                       | 1 +
 drivers/gpu/drm/sysfb/vesadrm.c                         | 1 +
 drivers/gpu/drm/tegra/dc.c                              | 1 +
 drivers/gpu/drm/tegra/drm.c                             | 1 +
 drivers/gpu/drm/tegra/dsi.c                             | 1 +
 drivers/gpu/drm/tegra/fb.c                              | 1 +
 drivers/gpu/drm/tegra/hdmi.c                            | 1 +
 drivers/gpu/drm/tegra/hub.c                             | 1 +
 drivers/gpu/drm/tegra/sor.c                             | 1 +
 drivers/gpu/drm/tests/drm_mm_test.c                     | 1 +
 drivers/gpu/drm/tidss/tidss_crtc.c                      | 1 +
 drivers/gpu/drm/tidss/tidss_dispc.c                     | 1 +
 drivers/gpu/drm/tiny/bochs.c                            | 1 +
 drivers/gpu/drm/tiny/cirrus-qemu.c                      | 1 +
 drivers/gpu/drm/tiny/gm12u320.c                         | 1 +
 drivers/gpu/drm/tiny/hx8357d.c                          | 1 +
 drivers/gpu/drm/tiny/ili9163.c                          | 1 +
 drivers/gpu/drm/tiny/ili9225.c                          | 1 +
 drivers/gpu/drm/tiny/ili9341.c                          | 1 +
 drivers/gpu/drm/tiny/ili9486.c                          | 1 +
 drivers/gpu/drm/tiny/mi0283qt.c                         | 1 +
 drivers/gpu/drm/tiny/panel-mipi-dbi.c                   | 1 +
 drivers/gpu/drm/tiny/pixpaper.c                         | 1 +
 drivers/gpu/drm/tiny/repaper.c                          | 1 +
 drivers/gpu/drm/tve200/tve200_display.c                 | 1 +
 drivers/gpu/drm/udl/udl_edid.c                          | 1 +
 drivers/gpu/drm/v3d/v3d_bo.c                            | 2 ++
 drivers/gpu/drm/v3d/v3d_debugfs.c                       | 1 +
 drivers/gpu/drm/v3d/v3d_drv.c                           | 1 +
 drivers/gpu/drm/v3d/v3d_gem.c                           | 1 +
 drivers/gpu/drm/v3d/v3d_gemfs.c                         | 2 ++
 drivers/gpu/drm/v3d/v3d_irq.c                           | 2 ++
 drivers/gpu/drm/v3d/v3d_sched.c                         | 1 +
 drivers/gpu/drm/v3d/v3d_submit.c                        | 1 +
 drivers/gpu/drm/vc4/vc4_bo.c                            | 1 +
 drivers/gpu/drm/vc4/vc4_debugfs.c                       | 1 +
 drivers/gpu/drm/vc4/vc4_dpi.c                           | 1 +
 drivers/gpu/drm/vc4/vc4_drv.c                           | 1 +
 drivers/gpu/drm/vc4/vc4_dsi.c                           | 1 +
 drivers/gpu/drm/vc4/vc4_gem.c                           | 1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                          | 1 +
 drivers/gpu/drm/vc4/vc4_hvs.c                           | 1 +
 drivers/gpu/drm/vc4/vc4_irq.c                           | 1 +
 drivers/gpu/drm/vc4/vc4_kms.c                           | 1 +
 drivers/gpu/drm/vc4/vc4_perfmon.c                       | 2 ++
 drivers/gpu/drm/vc4/vc4_plane.c                         | 1 +
 drivers/gpu/drm/vc4/vc4_render_cl.c                     | 2 ++
 drivers/gpu/drm/vc4/vc4_txp.c                           | 1 +
 drivers/gpu/drm/vc4/vc4_v3d.c                           | 2 ++
 drivers/gpu/drm/vc4/vc4_validate.c                      | 2 ++
 drivers/gpu/drm/vc4/vc4_validate_shaders.c              | 2 ++
 drivers/gpu/drm/vc4/vc4_vec.c                           | 1 +
 drivers/gpu/drm/virtio/virtgpu_debugfs.c                | 1 +
 drivers/gpu/drm/virtio/virtgpu_display.c                | 1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c                    | 1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c                    | 1 +
 drivers/gpu/drm/virtio/virtgpu_object.c                 | 2 ++
 drivers/gpu/drm/virtio/virtgpu_plane.c                  | 1 +
 drivers/gpu/drm/virtio/virtgpu_vq.c                     | 1 +
 drivers/gpu/drm/vkms/vkms_composer.c                    | 1 +
 drivers/gpu/drm/vkms/vkms_crtc.c                        | 1 +
 drivers/gpu/drm/vkms/vkms_drv.c                         | 1 +
 drivers/gpu/drm/vkms/vkms_output.c                      | 1 +
 drivers/gpu/drm/vkms/vkms_plane.c                       | 1 +
 drivers/gpu/drm/vkms/vkms_writeback.c                   | 1 +
 drivers/gpu/drm/xen/xen_drm_front.c                     | 1 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c                 | 1 +
 drivers/gpu/drm/xen/xen_drm_front_kms.c                 | 1 +
 include/drm/drm_mm.h                                    | 2 +-
 196 files changed, 213 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index 61e0136c21a8..dfa916eeb2d9 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -8,6 +8,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-direct.h>
diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index 0551e11cc184..624c4ecf5a34 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -2,6 +2,7 @@
 /* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
 
 #include <drm/drm_device.h>
+#include <drm/drm_print.h>
 #include <drm/drm_utils.h>
 #include <drm/rocket_accel.h>
 #include <linux/dma-mapping.h>
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 901f938aefe0..3ca461eb0a24 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -9,6 +9,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 
 #include "komeda_framebuffer.h"
 #include "komeda_dev.h"
diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index 806da0aaedf7..4b4a08cb396d 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -22,6 +22,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index c3179d74f3f5..81d45f2dd6a7 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -33,6 +33,7 @@
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index bc5f5e9798c3..b765f6c9eea4 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -29,6 +29,7 @@
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 600af5ad81b1..47733c85d271 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -14,6 +14,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_writeback.h>
 
diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index 0900e4466ffb..033b19b31f63 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/armada/armada_debugfs.c b/drivers/gpu/drm/armada/armada_debugfs.c
index a763349dd89f..2445365c823f 100644
--- a/drivers/gpu/drm/armada/armada_debugfs.c
+++ b/drivers/gpu/drm/armada/armada_debugfs.c
@@ -12,6 +12,7 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 
 #include "armada_crtc.h"
 #include "armada_drm.h"
diff --git a/drivers/gpu/drm/armada/armada_fb.c b/drivers/gpu/drm/armada/armada_fb.c
index aa4289127086..77098928f821 100644
--- a/drivers/gpu/drm/armada/armada_fb.c
+++ b/drivers/gpu/drm/armada/armada_fb.c
@@ -6,6 +6,7 @@
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 
 #include "armada_drm.h"
 #include "armada_fb.h"
diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index cb53cc91bafb..3e08b25723b5 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -13,6 +13,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 
 #include "armada_crtc.h"
 #include "armada_drm.h"
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 1a1680d71486..35fcfa0d85ff 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -10,6 +10,7 @@
 
 #include <drm/armada_drm.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 
 #include "armada_drm.h"
 #include "armada_gem.h"
diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
index 3b9bd8ecda13..21fd3b4ba10f 100644
--- a/drivers/gpu/drm/armada/armada_overlay.c
+++ b/drivers/gpu/drm/armada/armada_overlay.c
@@ -12,6 +12,7 @@
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_print.h>
 
 #include "armada_crtc.h"
 #include "armada_drm.h"
diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
index dae81ebafdb4..a0326b4f568e 100644
--- a/drivers/gpu/drm/armada/armada_plane.c
+++ b/drivers/gpu/drm/armada/armada_plane.c
@@ -8,6 +8,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_print.h>
 
 #include "armada_crtc.h"
 #include "armada_drm.h"
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 9ce874dba69c..de7b6294ce40 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -43,6 +43,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_panic.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "ast_drv.h"
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index acb017a2486b..dd70894c8f38 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -25,6 +25,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 38f60befd7d7..92132be9823f 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -16,6 +16,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 #include "atmel_hlcdc_dc.h"
 
diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index e9eed9a5b760..e2b62e5fb891 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -29,6 +29,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_mode.h>
+#include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 8bd626ef16c7..cdcdd4258c3f 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -10,6 +10,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 /*
  * struct fb_ops
diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
index 1e827bf8b815..715e56669ad8 100644
--- a/drivers/gpu/drm/drm_fbdev_shmem.c
+++ b/drivers/gpu/drm/drm_fbdev_shmem.c
@@ -9,6 +9,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_print.h>
 
 /*
  * struct fb_ops
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 9c9bfc9e85c6..12d8307997a0 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -22,6 +22,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_dumb_buffers.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vma_manager.h>
 
 /**
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 4bc89d33df59..9fd4eb02a20f 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -16,6 +16,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 
 #include "drm_internal.h"
 
diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 936e6c1a60c1..8a06d296561d 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -26,6 +26,7 @@
  */
 
 #include <drm/drm_gpuvm.h>
+#include <drm/drm_print.h>
 
 #include <linux/export.h>
 #include <linux/interval_tree_generic.h>
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index b488c91c20a5..00482227a9cd 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -26,6 +26,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_modes.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
 #include <video/mipi_display.h>
diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index ca254611b382..6692abe564d3 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -49,6 +49,7 @@
 #include <linux/stacktrace.h>
 
 #include <drm/drm_mm.h>
+#include <drm/drm_print.h>
 
 /**
  * DOC: Overview
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 43a10b4af43a..21809a82187b 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -37,6 +37,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 
 #include "drm_internal.h"
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index b13a17276d07..d4f1307d574f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 #include "etnaviv_cmdbuf.h"
 #include "etnaviv_gpu.h"
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 3e91747ed339..54ceae87b401 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -17,6 +17,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_of.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 
 #include "etnaviv_cmdbuf.h"
 #include "etnaviv_drv.h"
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 2f844e82bc46..5d8f3b03d4ae 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <linux/dma-mapping.h>
 #include <linux/shmem_fs.h>
 #include <linux/spinlock.h>
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 76c742328edb..a9611c1a773f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 #include <linux/dma-fence-array.h>
 #include <linux/file.h>
 #include <linux/dma-resv.h>
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index cf0d9049bcf1..ca0be293f5fe 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -16,6 +16,8 @@
 #include <linux/reset.h>
 #include <linux/thermal.h>
 
+#include <drm/drm_print.h>
+
 #include "etnaviv_cmdbuf.h"
 #include "etnaviv_dump.h"
 #include "etnaviv_gpu.h"
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index df5192083b20..a992be2ede88 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -6,6 +6,8 @@
 #include <linux/dma-mapping.h>
 #include <linux/scatterlist.h>
 
+#include <drm/drm_print.h>
+
 #include "common.xml.h"
 #include "etnaviv_cmdbuf.h"
 #include "etnaviv_drv.h"
diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index b9e206303b48..9ae0fa4667a9 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -20,6 +20,7 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "exynos_drm_crtc.h"
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index b8d9b7251319..bb74b17f9753 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -20,6 +20,7 @@
 
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <drm/exynos_drm.h>
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index ddd73e7f26a3..6ecd95bcb0c4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -14,6 +14,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/exynos_drm.h>
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 93de25b77e68..43de263bc35f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -16,6 +16,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <drm/exynos_drm.h>
 
 #include "exynos_drm_drv.h"
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 205c238cc73a..b6abdc4f2b0a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -23,6 +23,7 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <drm/exynos_drm.h>
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index d32f2474cbaa..2bea107dd960 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -21,6 +21,7 @@
 #include <linux/workqueue.h>
 
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 #include <drm/exynos_drm.h>
 
 #include "exynos_drm_drv.h"
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 02714c9ab639..b9b2f000072d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -12,6 +12,7 @@
 
 #include <drm/drm_dumb_buffers.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vma_manager.h>
 #include <drm/exynos_drm.h>
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 03c8490af4f4..008def51225a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -22,6 +22,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_mode.h>
+#include <drm/drm_print.h>
 #include <drm/exynos_drm.h>
 
 #include "exynos_drm_drv.h"
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 6400070a4c9b..67afddd566e2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -9,6 +9,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 #include <drm/exynos_drm.h>
 
 #include "exynos_drm_crtc.h"
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index e094b8bbc0f1..64c69dd2966e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -14,6 +14,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index a3670d2eaab2..69dea5049309 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -28,6 +28,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <drm/exynos_drm.h>
 
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index 794a87d16f88..a9a341ea6507 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -15,6 +15,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "fsl_dcu_drm_drv.h"
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 45c4eb008ad5..76384b4581bf 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -29,6 +29,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 1e1c87be1204..8a11c2df5b88 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -24,6 +24,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 10dddec3796f..8345faa38f04 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -12,6 +12,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 
 #include "hsw_ips.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 73ed28ac9573..c88bef22d366 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -56,6 +56,7 @@
  */
 
 #include <drm/drm_gem.h>
+#include <drm/drm_print.h>
 
 #include "i915_active.h"
 #include "i915_vma.h"
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index 78329deb395a..505c776c0585 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -43,6 +43,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_panic.h>
+#include <drm/drm_print.h>
 
 #include "gem/i915_gem_object.h"
 #include "i9xx_plane_regs.h"
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 9c7364d6d69d..264c51471520 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -26,6 +26,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/imagination/pvr_ccb.c
index 2bbdc05a3b97..9294b4ba1de7 100644
--- a/drivers/gpu/drm/imagination/pvr_ccb.c
+++ b/drivers/gpu/drm/imagination/pvr_ccb.c
@@ -10,6 +10,7 @@
 #include "pvr_power.h"
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <linux/compiler.h>
 #include <linux/delay.h>
 #include <linux/jiffies.h>
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index b2f8cba77346..779a58fe6ee8 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -17,6 +17,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_mm.h>
+#include <drm/drm_print.h>
 #include <linux/clk.h>
 #include <linux/firmware.h>
 #include <linux/math.h>
diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index 60db3668ad3c..9ff03bc60a08 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -16,6 +16,8 @@
 #include <linux/ktime.h>
 #include <linux/types.h>
 
+#include <drm/drm_print.h>
+
 #define ROGUE_FW_HEAP_META_SHIFT 25 /* 32 MB */
 
 #define POLL_TIMEOUT_USEC 1000000
diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
index a1098b521485..8a56952f6730 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -9,6 +9,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 
 #include <linux/build_bug.h>
 #include <linux/dcache.h>
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index c6e7ff9e935d..b9f801c63260 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/interrupt.h>
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 3d97990170bf..48e52c5561be 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -13,6 +13,7 @@
 #include <drm/drm_exec.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gpuvm.h>
+#include <drm/drm_print.h>
 
 #include <linux/bug.h>
 #include <linux/container_of.h>
diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index df19560e41b4..db50eccea0ca 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -14,6 +14,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include <video/imx-ipu-v3.h>
 
diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 32cda134ae3e..7c2eb1152fc2 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -20,6 +20,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 9562fe6711ff..a935ff1503cd 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -12,6 +12,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "kmb_drv.h"
 #include "kmb_plane.h"
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 739e8c6c6d90..9a1e6b9ecbe5 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -8,6 +8,8 @@
 #include <linux/vmalloc.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_print.h>
+
 #include "lima_devfreq.h"
 #include "lima_drv.h"
 #include "lima_sched.h"
diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 52043a12a2e8..257a6e84dd58 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -17,6 +17,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index bc7527542fdc..68646a61f74d 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -16,6 +16,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.c b/drivers/gpu/drm/mediatek/mtk_gem.c
index a172456d1d7b..024cc7e9036c 100644
--- a/drivers/gpu/drm/mediatek/mtk_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_gem.c
@@ -11,6 +11,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 
 #include "mtk_drm_drv.h"
 #include "mtk_gem.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 1b5667ddbb03..c22166476423 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -11,6 +11,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <linux/align.h>
 
 #include "mtk_crtc.h"
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 7f98de38842b..783572b16963 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -16,6 +16,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 #include "meson_overlay.h"
 #include "meson_registers.h"
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index b43ac61201f3..f8d0e0874a5d 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -20,6 +20,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 #include "meson_plane.h"
 #include "meson_registers.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 32cd8ac018c0..a32be27c39e8 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -20,6 +20,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_module.h>
 #include <drm/drm_pciids.h>
+#include <drm/drm_print.h>
 
 #include "mgag200_drv.h"
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index f874e2949840..a5e291b344db 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index e2305f8e00f8..d2aa931f579d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index 11ae76eb081d..7bea7a728f56 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -6,6 +6,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh5.c b/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
index e2a2942a80a0..36da6529d74f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
@@ -8,6 +8,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index 23debc70dc54..8fa8fe943abf 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index f8796e2b7a0f..3fadbeb10af9 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 31624c9ab7b7..e387a455eae5 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -6,6 +6,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index e80da12ba1fe..a0ac19ee0353 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index a0e7b9ad46cd..d847fa8ded8c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_vga.c b/drivers/gpu/drm/mgag200/mgag200_vga.c
index 60568f32736d..b07c1362ddd4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_vga.c
+++ b/drivers/gpu/drm/mgag200/mgag200_vga.c
@@ -2,6 +2,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_ddc.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
index a5a3ac108bd5..a855f1734316 100644
--- a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
+++ b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
@@ -3,6 +3,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_ddc.h"
diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 1c3b33be6c40..72eb0de46b54 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -26,6 +26,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_plane.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "lcdif_drv.h"
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 7ed2516b6de0..8cac0a275b7d 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -26,6 +26,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_plane.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "mxsfb_drv.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 63ddc5127f7b..1c2a1920c0a6 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -10,6 +10,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_mode.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "omap_drv.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_debugfs.c b/drivers/gpu/drm/omapdrm/omap_debugfs.c
index a3d470468e5b..9edc1b3f9f95 100644
--- a/drivers/gpu/drm/omapdrm/omap_debugfs.c
+++ b/drivers/gpu/drm/omapdrm/omap_debugfs.c
@@ -11,6 +11,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 
 #include "omap_drv.h"
 #include "omap_dmm_tiler.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index 3fff32c000a6..bbe427ab43c1 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -26,6 +26,8 @@
 #include <linux/vmalloc.h>
 #include <linux/wait.h>
 
+#include <drm/drm_print.h>
+
 #include "omap_dmm_tiler.h"
 #include "omap_dmm_priv.h"
 
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 794267f0f007..1b96343226a5 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -19,6 +19,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index bb3105556f19..b8c249ec1891 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -12,6 +12,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 
 #include "omap_dmm_tiler.h"
 #include "omap_drv.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 948af7ec1130..e864bc8f9a4a 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -15,6 +15,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/drm_util.h>
 
 #include "omap_drv.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 78563a8d8732..71e79f53489a 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -12,6 +12,7 @@
 
 #include <drm/drm_dumb_buffers.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vma_manager.h>
 
 #include "omap_drv.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
index a6f0bbc879d2..943c5307da00 100644
--- a/drivers/gpu/drm/omapdrm/omap_irq.c
+++ b/drivers/gpu/drm/omapdrm/omap_irq.c
@@ -5,6 +5,7 @@
  */
 
 #include <drm/drm_vblank.h>
+#include <drm/drm_print.h>
 
 #include "omap_drv.h"
 
diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.c b/drivers/gpu/drm/omapdrm/omap_overlay.c
index fb97c74386f2..6fb7510cbebb 100644
--- a/drivers/gpu/drm/omapdrm/omap_overlay.c
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.c
@@ -6,6 +6,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_print.h>
 
 #include "omap_dmm_tiler.h"
 #include "omap_drv.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index d74ef6694c10..f9698890c989 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -10,6 +10,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 
 #include "omap_dmm_tiler.h"
 #include "omap_drv.h"
diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index ac05df2a54fe..b51c30778811 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -8,6 +8,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 
+#include <drm/drm_print.h>
+
 #include "panfrost_device.h"
 #include "panfrost_devfreq.h"
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 1c3c574cd64a..7d8c7c337606 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -16,6 +16,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
 #include <drm/drm_utils.h>
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 0528de674a4f..8041b65c6609 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -8,6 +8,7 @@
 #include <linux/dma-mapping.h>
 
 #include <drm/panfrost_drm.h>
+#include <drm/drm_print.h>
 #include "panfrost_device.h"
 #include "panfrost_gem.h"
 #include "panfrost_mmu.h"
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 8d049a07d393..483d278eb154 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -12,6 +12,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_print.h>
+
 #include "panfrost_device.h"
 #include "panfrost_features.h"
 #include "panfrost_issues.h"
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 02ccc05e23bb..8f3b7a7b6ad0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -2,6 +2,7 @@
 /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
 
 #include <drm/panfrost_drm.h>
+#include <drm/drm_print.h>
 
 #include <linux/atomic.h>
 #include <linux/bitfield.h>
diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index 6d567e5c7c6f..3a9661b9b1fc 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -20,6 +20,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "pl111_drm.h"
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
index 7e175dbfd892..289f245c517e 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
@@ -17,6 +17,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "rcar_cmm.h"
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index d948ff3594c4..031d07f4508e 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -24,6 +24,7 @@
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "rcar_du_drv.h"
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 937f83cf42fc..d30fef00c34c 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -28,6 +28,7 @@
 #include <drm/bridge/analogix_dp.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index b7e3f5dcf8d5..177e30445ee8 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -21,6 +21,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-reg.c b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
index 924fb1d3ece2..0dc3804051a9 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-reg.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
@@ -11,6 +11,8 @@
 #include <linux/iopoll.h>
 #include <linux/reset.h>
 
+#include <drm/drm_print.h>
+
 #include "cdn-dp-core.h"
 #include "cdn-dp-reg.h"
 
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index de8405ee8241..2dad6b7b61b2 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -24,6 +24,7 @@
 #include <drm/bridge/dw_mipi_dsi.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index f24827dc1421..9f7a8cf0ab44 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -22,6 +22,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ae4a5ac2299a..997429115068 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -10,6 +10,7 @@
 #include <drm/display/drm_hdmi_state_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index eb77bde9f628..c5c6e2b5772d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -22,6 +22,7 @@
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 3bd06202e232..df9a8bff2e22 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -14,6 +14,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vma_manager.h>
 
 #include "rockchip_drm_drv.h"
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 5369b77ea434..ad4ab894391a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -27,6 +27,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_self_refresh_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 2411260db51d..75f898a10cbc 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -22,6 +22,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index 811020665120..5c0c6e2cc28d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -15,6 +15,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/sitronix/st7586.c b/drivers/gpu/drm/sitronix/st7586.c
index a29672d84ede..b57ebf37a664 100644
--- a/drivers/gpu/drm/sitronix/st7586.c
+++ b/drivers/gpu/drm/sitronix/st7586.c
@@ -25,6 +25,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_mipi_dbi.h>
+#include <drm/drm_print.h>
 #include <drm/drm_rect.h>
 
 /* controller-specific commands */
diff --git a/drivers/gpu/drm/sitronix/st7735r.c b/drivers/gpu/drm/sitronix/st7735r.c
index 1d60f6e5b3bc..c1f8228495f6 100644
--- a/drivers/gpu/drm/sitronix/st7735r.c
+++ b/drivers/gpu/drm/sitronix/st7735r.c
@@ -24,6 +24,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_mipi_dbi.h>
+#include <drm/drm_print.h>
 
 #define ST7735R_FRMCTR1		0xb1
 #define ST7735R_FRMCTR2		0xb2
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 7e2e69ce890f..96cf39320137 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -33,6 +33,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_rect.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "ssd130x.h"
diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index c59fcb4dca32..4e12a465be7f 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -14,6 +14,7 @@
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 #include "sti_compositor.h"
 #include "sti_cursor.h"
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 5e9332df21df..4980aadb218e 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -22,6 +22,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "sti_drv.h"
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index f046f5f7ad25..1e5aa8c30645 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -16,6 +16,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 #include "sti_compositor.h"
 #include "sti_gdp.h"
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index b76606e9a82d..57ef4ba3554e 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -20,6 +20,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 #include "sti_compositor.h"
 #include "sti_drv.h"
diff --git a/drivers/gpu/drm/sti/sti_plane.c b/drivers/gpu/drm/sti/sti_plane.c
index 29e669ccec5b..948f947b5cad 100644
--- a/drivers/gpu/drm/sti/sti_plane.c
+++ b/drivers/gpu/drm/sti/sti_plane.c
@@ -12,6 +12,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 #include "sti_compositor.h"
 #include "sti_drv.h"
diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index ab00d1a6140c..56d53ac3082d 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -25,6 +25,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index d1501e86a5b1..f7e847cfa38f 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -34,6 +34,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 2dded3b828df..40405a52a073 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -23,6 +23,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "sun4i_backend.h"
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index c11dfb2739fa..8a409eee1dca 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -22,6 +22,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/sun4i_frontend.c
index 5ab1604f12dd..5e9c4b97c84c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
@@ -19,6 +19,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_plane.h>
+#include <drm/drm_print.h>
 
 #include "sun4i_drv.h"
 #include "sun4i_frontend.h"
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 31a8409b98f4..e2a532e11183 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -21,6 +21,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "sun4i_drv.h"
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 94ac6ad6f306..6108dda1e414 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -18,6 +18,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "sun8i_mixer.h"
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 1f77e1d29845..de2fe1942840 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -11,6 +11,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "sun8i_csc.h"
diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
index 1883c4a8604c..1b683d55d6ea 100644
--- a/drivers/gpu/drm/sysfb/efidrm.c
+++ b/drivers/gpu/drm/sysfb/efidrm.c
@@ -21,6 +21,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include <video/edid.h>
diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
index 8d8ab39c5f36..d38ba70f4e0d 100644
--- a/drivers/gpu/drm/sysfb/ofdrm.c
+++ b/drivers/gpu/drm/sysfb/ofdrm.c
@@ -21,6 +21,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "drm_sysfb_helper.h"
diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index 9b16d5164ef4..7a95d2dacd9d 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -25,6 +25,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "drm_sysfb_helper.h"
diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index c318df0adad5..7b7b5ba26317 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -22,6 +22,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include <video/edid.h>
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 0f80da3544c9..5d0f0a8de8ff 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -27,6 +27,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "dc.h"
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 4596073fe28f..4bf10c1bc373 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -22,6 +22,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index b5089b772267..ae7aeb8e90ef 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -22,6 +22,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "dc.h"
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index dd041089f797..1cef8c5cac50 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -13,6 +13,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 
 #include "drm.h"
 #include "gem.h"
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index c4820f5e7658..0adcd4244a42 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -28,6 +28,7 @@
 #include <drm/drm_eld.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 8f779f23dc09..c924ffba4094 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -20,6 +20,7 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "drm.h"
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index bc7dd562cf6b..4023cb5998f1 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -24,6 +24,7 @@
 #include <drm/drm_eld.h>
 #include <drm/drm_file.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "dc.h"
diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
index 6174d0929020..aec9eccdeae9 100644
--- a/drivers/gpu/drm/tests/drm_mm_test.c
+++ b/drivers/gpu/drm/tests/drm_mm_test.c
@@ -14,6 +14,7 @@
 #include <linux/ktime.h>
 
 #include <drm/drm_mm.h>
+#include <drm/drm_print.h>
 
 #include "../lib/drm_random.h"
 
diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 8fcc6a2f9477..722b6e7b232c 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -8,6 +8,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "tidss_crtc.h"
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index d0b191c470ca..7892168d3f3d 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -27,6 +27,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 
 #include "tidss_crtc.h"
 #include "tidss_dispc.h"
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 71e874c19610..222e4ae1abbd 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -21,6 +21,7 @@
 #include <drm/drm_module.h>
 #include <drm/drm_panic.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_helper.h>
diff --git a/drivers/gpu/drm/tiny/cirrus-qemu.c b/drivers/gpu/drm/tiny/cirrus-qemu.c
index f728fa48ac88..9ba0eab489bb 100644
--- a/drivers/gpu/drm/tiny/cirrus-qemu.c
+++ b/drivers/gpu/drm/tiny/cirrus-qemu.c
@@ -44,6 +44,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_module.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_helper.h>
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index fb0004166f4a..d73dfebb4353 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -25,6 +25,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
index df263818f45f..9f26aaca0bfa 100644
--- a/drivers/gpu/drm/tiny/hx8357d.c
+++ b/drivers/gpu/drm/tiny/hx8357d.c
@@ -25,6 +25,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 #include <video/mipi_display.h>
 
 #define HX8357D_SETOSC 0xb0
diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
index 62cadf5e033d..7c154c008344 100644
--- a/drivers/gpu/drm/tiny/ili9163.c
+++ b/drivers/gpu/drm/tiny/ili9163.c
@@ -15,6 +15,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 
 #include <video/mipi_display.h>
 
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index 6de44ff69b51..d32538b1eb09 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -29,6 +29,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_mipi_dbi.h>
+#include <drm/drm_print.h>
 #include <drm/drm_rect.h>
 
 #define ILI9225_DRIVER_READ_CODE	0x00
diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
index e55029433509..2ab750cba505 100644
--- a/drivers/gpu/drm/tiny/ili9341.c
+++ b/drivers/gpu/drm/tiny/ili9341.c
@@ -24,6 +24,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 #include <video/mipi_display.h>
 
 #define ILI9341_FRMCTR1		0xb1
diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 093661c771a0..1e411a0f4567 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -23,6 +23,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 
 #define ILI9486_ITFCTR1         0xb0
 #define ILI9486_PWCTRL1         0xc2
diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
index b6b4664908ae..a063eff77624 100644
--- a/drivers/gpu/drm/tiny/mi0283qt.c
+++ b/drivers/gpu/drm/tiny/mi0283qt.c
@@ -22,6 +22,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 #include <video/mipi_display.h>
 
 #define ILI9341_FRMCTR1		0xb1
diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index 23914a9f7fd3..82dfa169f762 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -25,6 +25,7 @@
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 
 #include <video/mipi_display.h>
 
diff --git a/drivers/gpu/drm/tiny/pixpaper.c b/drivers/gpu/drm/tiny/pixpaper.c
index 32598fb2fee7..df3ec42edd57 100644
--- a/drivers/gpu/drm/tiny/pixpaper.c
+++ b/drivers/gpu/drm/tiny/pixpaper.c
@@ -17,6 +17,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 /*
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 4824f863fdba..c8270591afc7 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -36,6 +36,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_rect.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tve200/tve200_display.c
index 37bdd976ae59..26b6c65ef6fd 100644
--- a/drivers/gpu/drm/tve200/tve200_display.c
+++ b/drivers/gpu/drm/tve200/tve200_display.c
@@ -21,6 +21,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "tve200_drm.h"
diff --git a/drivers/gpu/drm/udl/udl_edid.c b/drivers/gpu/drm/udl/udl_edid.c
index 12f48ae17073..af4cff2a7c51 100644
--- a/drivers/gpu/drm/udl/udl_edid.c
+++ b/drivers/gpu/drm/udl/udl_edid.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 
 #include "udl_drv.h"
 #include "udl_edid.h"
diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index c41476ddde68..d9547f5117b9 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -18,6 +18,8 @@
 #include <linux/dma-buf.h>
 #include <linux/vmalloc.h>
 
+#include <drm/drm_print.h>
+
 #include "v3d_drv.h"
 #include "uapi/drm/v3d_drm.h"
 
diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index 7e789e181af0..89f24eec62a7 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -8,6 +8,7 @@
 #include <linux/string_helpers.h>
 
 #include <drm/drm_debugfs.h>
+#include <drm/drm_print.h>
 
 #include "v3d_drv.h"
 #include "v3d_regs.h"
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index c5a3bbbc74c5..e8a46c8bad8a 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -25,6 +25,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <uapi/drm/v3d_drm.h>
 
 #include "v3d_drv.h"
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index bb110d35f749..5a180dc6c452 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -11,6 +11,7 @@
 #include <linux/uaccess.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "v3d_drv.h"
 #include "v3d_regs.h"
diff --git a/drivers/gpu/drm/v3d/v3d_gemfs.c b/drivers/gpu/drm/v3d/v3d_gemfs.c
index c1a30166c099..bf351fc0d488 100644
--- a/drivers/gpu/drm/v3d/v3d_gemfs.c
+++ b/drivers/gpu/drm/v3d/v3d_gemfs.c
@@ -5,6 +5,8 @@
 #include <linux/mount.h>
 #include <linux/fs_context.h>
 
+#include <drm/drm_print.h>
+
 #include "v3d_drv.h"
 
 void v3d_gemfs_init(struct v3d_dev *v3d)
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index 31ecc5b4ba5a..b55880fd6c50 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -16,6 +16,8 @@
 #include <linux/platform_device.h>
 #include <linux/sched/clock.h>
 
+#include <drm/drm_print.h>
+
 #include "v3d_drv.h"
 #include "v3d_regs.h"
 #include "v3d_trace.h"
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 0ec06bfbbebb..0867250db7a6 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -21,6 +21,7 @@
 #include <linux/sched/clock.h>
 #include <linux/kthread.h>
 
+#include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
 
 #include "v3d_drv.h"
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index f3652e90683c..7de5a95ee7ca 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2023 Raspberry Pi
  */
 
+#include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
 
 #include "v3d_drv.h"
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 4aaa587be3a5..46b4474ac41d 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -19,6 +19,7 @@
 #include <linux/dma-buf.h>
 
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 
 #include "vc4_drv.h"
 #include "uapi/drm/vc4_drm.h"
diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index fac624a663ea..e765904e13f3 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 #include <linux/seq_file.h>
 #include <linux/circ_buf.h>
diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 960550c166d9..2afc88394d64 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <linux/clk.h>
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index c7cb1e3a6434..3846996f9028 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -36,6 +36,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include <soc/bcm2835/raspberrypi-firmware.h>
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 458e5d987964..deeeaebc702f 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -36,6 +36,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 255e5817618e..ab16164b5eda 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -30,6 +30,7 @@
 #include <linux/dma-fence-array.h>
 
 #include <drm/drm_exec.h>
+#include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
 
 #include "uapi/drm/vc4_drm.h"
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 049c92dd5d27..1798d1156d10 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -39,6 +39,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <linux/clk.h>
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 4811d794001f..ee8d0738501b 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -26,6 +26,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include <soc/bcm2835/raspberrypi-firmware.h>
diff --git a/drivers/gpu/drm/vc4/vc4_irq.c b/drivers/gpu/drm/vc4/vc4_irq.c
index 69b399f3b802..63e88f90eef7 100644
--- a/drivers/gpu/drm/vc4/vc4_irq.c
+++ b/drivers/gpu/drm/vc4/vc4_irq.c
@@ -48,6 +48,7 @@
 #include <linux/platform_device.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 #include "vc4_drv.h"
 #include "vc4_regs.h"
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 8f983edb81ff..e563c1210937 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -19,6 +19,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
index f1342f917cf7..1ac80c0b258f 100644
--- a/drivers/gpu/drm/vc4/vc4_perfmon.c
+++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
@@ -9,6 +9,8 @@
  * The V3D block provides 16 hardware counters which can count various events.
  */
 
+#include <drm/drm_print.h>
+
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index b4a53f68865b..f00d4076ba07 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -24,6 +24,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 
 #include "uapi/drm/vc4_drm.h"
 
diff --git a/drivers/gpu/drm/vc4/vc4_render_cl.c b/drivers/gpu/drm/vc4/vc4_render_cl.c
index 14079853338e..edc471e71c0e 100644
--- a/drivers/gpu/drm/vc4/vc4_render_cl.c
+++ b/drivers/gpu/drm/vc4/vc4_render_cl.c
@@ -35,6 +35,8 @@
  * actually fairly low.
  */
 
+#include <drm/drm_print.h>
+
 #include "uapi/drm/vc4_drm.h"
 #include "vc4_drv.h"
 #include "vc4_packet.h"
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 42acac05fe47..9082902100e4 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -21,6 +21,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index bb09df5000bd..3ffe09bc89d2 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -10,6 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_print.h>
+
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
diff --git a/drivers/gpu/drm/vc4/vc4_validate.c b/drivers/gpu/drm/vc4/vc4_validate.c
index 1e7bdda55698..545c4c3608f5 100644
--- a/drivers/gpu/drm/vc4/vc4_validate.c
+++ b/drivers/gpu/drm/vc4/vc4_validate.c
@@ -43,6 +43,8 @@
  * to use) happens.
  */
 
+#include <drm/drm_print.h>
+
 #include "uapi/drm/vc4_drm.h"
 #include "vc4_drv.h"
 #include "vc4_packet.h"
diff --git a/drivers/gpu/drm/vc4/vc4_validate_shaders.c b/drivers/gpu/drm/vc4/vc4_validate_shaders.c
index 2d74e786914c..b50b6cdac3f4 100644
--- a/drivers/gpu/drm/vc4/vc4_validate_shaders.c
+++ b/drivers/gpu/drm/vc4/vc4_validate_shaders.c
@@ -41,6 +41,8 @@
  * this validation is only performed at BO creation time.
  */
 
+#include <drm/drm_print.h>
+
 #include "vc4_drv.h"
 #include "vc4_qpu_defines.h"
 
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 06d702e879b0..b84fad2a5b23 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -17,6 +17,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <linux/clk.h>
diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index 853dd9aa397e..3a68a16b58ae 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -27,6 +27,7 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 
 #include "virtgpu_drv.h"
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index e972d9b015a9..6a962c1d6e95 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -30,6 +30,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 71c6ccad4b99..a5ce96fb8a1d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -39,6 +39,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 
 #include "virtgpu_drv.h"
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 1c15cbf326b7..f3594695bb82 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -29,6 +29,7 @@
 
 #include <drm/drm_file.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "virtgpu_drv.h"
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index e6363c887500..4270bfede7b9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -26,6 +26,8 @@
 #include <linux/dma-mapping.h>
 #include <linux/moduleparam.h>
 
+#include <drm/drm_print.h>
+
 #include "virtgpu_drv.h"
 
 static int virtio_gpu_virglrenderer_workaround = 1;
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 29e4b458ae57..a7863f8ee4ee 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -30,6 +30,7 @@
 #include <linux/virtio_dma_buf.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_panic.h>
+#include <drm/drm_print.h>
 
 #include "virtgpu_drv.h"
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 8181b22b9b46..0c194b4e9488 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -32,6 +32,7 @@
 #include <linux/virtio_ring.h>
 
 #include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 
 #include "virtgpu_drv.h"
 #include "virtgpu_trace.h"
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index fa269d279e25..c1ab12a44621 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -8,6 +8,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <linux/minmax.h>
 
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index bac0790c6577..9a7db1d51022 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -5,6 +5,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_helper.h>
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index e8472d9b6e3b..65133b62fb5c 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -23,6 +23,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 2ee3749e2b28..81d17b7dc0eb 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -4,6 +4,7 @@
 #include "vkms_connector.h"
 #include "vkms_drv.h"
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 int vkms_output_init(struct vkms_device *vkmsdev)
 {
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e592e47a5736..89a9fc91e059 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -8,6 +8,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 
 #include "vkms_drv.h"
 #include "vkms_formats.h"
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 45d69a3b85f6..097ae1f0a230 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -6,6 +6,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_writeback.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 1bda7ef606cc..4fa45dbe1dcb 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -18,6 +18,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_print.h>
 
 #include <xen/platform_pci.h>
 #include <xen/xen.h>
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index 63112ed975c4..386ae7441093 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -15,6 +15,7 @@
 
 #include <drm/drm_gem.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include <xen/balloon.h>
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index 806ec66ee7f7..48772b5fe71c 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -16,6 +16,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index f654874c4ce6..16ce0e8f36a6 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -48,7 +48,7 @@
 #endif
 #include <linux/types.h>
 
-#include <drm/drm_print.h>
+struct drm_printer;
 
 #ifdef CONFIG_DRM_DEBUG_MM
 #define DRM_MM_BUG_ON(expr) BUG_ON(expr)
-- 
2.47.3

