Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 553E8549E58
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB2110F73A;
	Mon, 13 Jun 2022 20:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFC110F7BD;
 Mon, 13 Jun 2022 20:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655150635; x=1686686635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N4gO7KplL3/sIy/7mYG9HCDGgGgdobcgu2ws6Ey0QXY=;
 b=QjgRQsg6CWDt3+ZeVbiyrm3Jsza8AociN9rr442C1BXRjTpQA7vqPcMZ
 WFI8pfX3cEJcO6FjC8rhIs45SrCR6oAqqnRpqdKaRsXGEyIHjJCF+H36E
 mEWmSUZZBJwVj06XXegaOM6OijzWaDQ5o0T4UCz4L/IJn8rpvmMnutPw7
 gY2Qqc9ojCM2DlXL49RHLV6+p1GQhKDCX2bmKuY9PLpkLgENBV/NNSg1F
 zx26/pzhcBaXtlcAsPjZ1Y8EyUt62pnQbh21X5PF0XapnAjmDJxKoo/IO
 lGReBiD1k6WcATidNwrUoBidpECidQ1762kyl/PkdL+PP1Us4Ry8jgmK0 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="340067718"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="340067718"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 13:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="557929833"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga006.jf.intel.com with SMTP; 13 Jun 2022 13:03:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 Jun 2022 23:03:36 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm: Remove linux/fb.h from drm_crtc.h
Date: Mon, 13 Jun 2022 23:03:15 +0300
Message-Id: <20220613200317.11305-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220613200317.11305-1-ville.syrjala@linux.intel.com>
References: <20220613200317.11305-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

drm_crtc.h has no need for linux/fb.h, so don't include it.
Avoids useless rebuilds of the entire universe when
touching linux/fb.h.

Quite a few placs do currently depend on linux/fb.h or other
headers pulled in by it without actually including any of it
directly. All of those need to be fixed up.

vmwgfx also needs some weird 'TRUE' definition from somewhere.
Not even sure where that is coming from tbh. Just replace that
with a raw number.

Cc: Zack Rusin <zackr@vmware.com>
Cc: VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c | 2 ++
 drivers/gpu/drm/armada/armada_510.c                  | 1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c     | 1 +
 drivers/gpu/drm/bridge/tc358764.c                    | 1 +
 drivers/gpu/drm/display/drm_dp_helper.c              | 1 +
 drivers/gpu/drm/drm_connector.c                      | 1 +
 drivers/gpu/drm/drm_mipi_dbi.c                       | 1 +
 drivers/gpu/drm/drm_modes.c                          | 1 +
 drivers/gpu/drm/drm_of.c                             | 1 +
 drivers/gpu/drm/exynos/exynos_drm_dpi.c              | 1 +
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c         | 1 +
 drivers/gpu/drm/i915/display/intel_backlight.c       | 1 +
 drivers/gpu/drm/imx/dcss/dcss-drv.c                  | 1 +
 drivers/gpu/drm/kmb/kmb_dsi.c                        | 1 +
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c             | 1 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c            | 1 +
 drivers/gpu/drm/sti/sti_compositor.c                 | 1 +
 drivers/gpu/drm/sti/sti_gdp.c                        | 1 +
 drivers/gpu/drm/sti/sti_hda.c                        | 1 +
 drivers/gpu/drm/sti/sti_hqvdp.c                      | 1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.h                   | 1 +
 drivers/gpu/drm/tilcdc/tilcdc_panel.c                | 1 +
 drivers/gpu/drm/vc4/vc4_drv.h                        | 1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                   | 1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                  | 2 +-
 include/drm/drm_crtc.h                               | 1 -
 include/drm/drm_fb_helper.h                          | 1 +
 27 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
index 06c595378dda..4b7d94961527 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
@@ -4,6 +4,8 @@
  * Author: James.Qian.Wang <james.qian.wang@arm.com>
  *
  */
+#include <linux/of.h>
+
 #include <drm/drm_print.h>
 
 #include "komeda_dev.h"
diff --git a/drivers/gpu/drm/armada/armada_510.c b/drivers/gpu/drm/armada/armada_510.c
index 93d5c0a2d49a..93cd7e1a08ab 100644
--- a/drivers/gpu/drm/armada/armada_510.c
+++ b/drivers/gpu/drm/armada/armada_510.c
@@ -6,6 +6,7 @@
  */
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/of.h>
 #include <drm/drm_probe_helper.h>
 #include "armada_crtc.h"
 #include "armada_drm.h"
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index 43bc709e3523..50fee6a93964 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/media-bus-format.h>
+#include <linux/of.h>
 #include <linux/of_graph.h>
 
 #include <drm/drm_bridge.h>
diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index dca41ed32f8a..fdfb14aca926 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -9,6 +9,7 @@
 
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 8eb3172b4b36..4c7c489428c3 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -20,6 +20,7 @@
  * OF THIS SOFTWARE.
  */
 
+#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 1c48d162c77e..bf271aebf531 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -32,6 +32,7 @@
 #include <drm/drm_sysfs.h>
 
 #include <linux/uaccess.h>
+#include <linux/fb.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 0eda9dcb0e52..2f61f53d472f 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -5,6 +5,7 @@
  * Copyright 2016 Noralf Trønnes
  */
 
+#include <linux/backlight.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index a2542254233e..304004fb80aa 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -34,6 +34,7 @@
 #include <linux/list.h>
 #include <linux/list_sort.h>
 #include <linux/export.h>
+#include <linux/fb.h>
 
 #include <video/of_display_timing.h>
 #include <video/of_videomode.h>
diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 2c1ee601f1d8..6d640d2ab4d4 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -2,6 +2,7 @@
 #include <linux/component.h>
 #include <linux/export.h>
 #include <linux/list.h>
+#include <linux/of.h>
 #include <linux/of_graph.h>
 
 #include <drm/drm_bridge.h>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 741323a2e6c3..378e5381978f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -7,6 +7,7 @@
  * Contacts: Andrzej Hajda <a.hajda@samsung.com>
 */
 
+#include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 
diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index 1d556482bb46..a0d5aa727d58 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -14,6 +14,7 @@
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/delay.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index 68513206a66a..110fc98ec280 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -3,6 +3,7 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include <linux/backlight.h>
 #include <linux/kernel.h>
 #include <linux/pwm.h>
 #include <linux/string_helpers.h>
diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
index 24147ee7080e..1c70f70247f6 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
@@ -5,6 +5,7 @@
 
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index f6071882054c..cf7cf0b07541 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index 852e78a5f142..ac869acf80ea 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -17,6 +17,7 @@
 #include <linux/list.h>
 #include <linux/mm.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h> /* platform_device() */
 #include <linux/sched.h>
 #include <linux/seq_file.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 3977aaa1ab5a..abf8022eb884 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 
 #include <drm/drm_bridge.h>
diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/sti/sti_compositor.c
index 9caaf3ccfabe..142a8e1b4436 100644
--- a/drivers/gpu/drm/sti/sti_compositor.c
+++ b/drivers/gpu/drm/sti/sti_compositor.c
@@ -9,6 +9,7 @@
 #include <linux/component.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index a1f78d52fb33..af783f599306 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <linux/of.h>
 #include <linux/seq_file.h>
 
 #include <drm/drm_atomic.h>
diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index 03f3377f918c..03cc401ed593 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index b5ae5d217bc0..271982080437 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -10,6 +10,7 @@
 #include <linux/firmware.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/reset.h>
 #include <linux/seq_file.h>
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index e624f6977eb8..fa23aa23fe4a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -14,6 +14,7 @@
 
 #include <linux/kernel.h>
 #include <linux/list.h>
+#include <linux/mod_devicetable.h>
 #include <linux/reset.h>
 
 #define SUN4I_TCON_GCTL_REG			0x0
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
index 42357808eaf2..2729e16bc053 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/backlight.h>
 #include <linux/gpio/consumer.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 15e0c2ac3940..c4928a4d5763 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -6,6 +6,7 @@
 #define _VC4_DRV_H_
 
 #include <linux/delay.h>
+#include <linux/of.h>
 #include <linux/refcount.h>
 #include <linux/uaccess.h>
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
index 0ba9739f406d..5b85b477e4c6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
@@ -26,6 +26,7 @@
  *
  **************************************************************************/
 
+#include <linux/fb.h>
 #include <linux/pci.h>
 
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 693028c31b6b..ff2f735bbe7a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -252,7 +252,7 @@ static void vmw_cursor_update_position(struct vmw_private *dev_priv,
 		vmw_write(dev_priv, SVGA_REG_CURSOR4_Y, y);
 		vmw_write(dev_priv, SVGA_REG_CURSOR4_SCREEN_ID, SVGA3D_INVALID_ID);
 		vmw_write(dev_priv, SVGA_REG_CURSOR4_ON, svga_cursor_on);
-		vmw_write(dev_priv, SVGA_REG_CURSOR4_SUBMIT, TRUE);
+		vmw_write(dev_priv, SVGA_REG_CURSOR4_SUBMIT, 1);
 	} else if (vmw_is_cursor_bypass3_enabled(dev_priv)) {
 		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_ON, svga_cursor_on);
 		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_X, x);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 1cbd95689f33..146898220d5b 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -28,7 +28,6 @@
 #include <linux/i2c.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
-#include <linux/fb.h>
 #include <linux/media-bus-format.h>
 #include <drm/drm_modeset_lock.h>
 #include <drm/drm_mode_object.h>
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 329607ca65c0..fddd0d1af689 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -35,6 +35,7 @@ struct drm_fb_helper;
 #include <drm/drm_client.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
+#include <linux/fb.h>
 #include <linux/kgdb.h>
 
 enum mode_set_atomic {
-- 
2.35.1

