Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AF5549E51
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF2510F398;
	Mon, 13 Jun 2022 20:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6F810F75B;
 Mon, 13 Jun 2022 20:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655150623; x=1686686623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fyu/Ko3dHMwqSKE1FtLdRuaatSXOE8rzyHRi0ne3+uY=;
 b=XLgna6p23rtoZDEkAGINNuZqLCkdsTHwe7MukdfcK2OiYXL1RZo7mXMw
 dpglQT2BjpWe7fpBL80zuzZEVfibjgt+7vXkfqvEfscVQvZrKWyb7ksNd
 bSmP8QpMcuF3lG8HQC7A9oCqgzKpLDaGQY0FY9fDFTEXOLNXYZkwKuNcL
 zOjm3lziVqhLQOLR7jsbOK8GKilojXqPH2IfnLrzOodr7k8w1kSYY6ANZ
 Y1IdKLaePAjFnHTGJUpLbxRBVGzB1b74i3Lz8XwE0rmrNYPVLUrg/iiPm
 v9YPPQkIoh8d03ZCddqMwE+AXux9VXPiK48D7gfGWabtxqEplXw+PX+uD Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="277172660"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="277172660"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 13:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="617654706"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga001.jf.intel.com with SMTP; 13 Jun 2022 13:03:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 Jun 2022 23:03:39 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm: Remove linux/media-bus-format.h from drm_crtc.h
Date: Mon, 13 Jun 2022 23:03:16 +0300
Message-Id: <20220613200317.11305-8-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

drm_crtc.h has no need for linux/media-bus-format.h, so don't
include it. Avoids useless rebuilds of the entire universe when
touching linux/media-bus-format.h.

Quite a few placs do currently depend on linux/media-bus-format.h
without actually including it directly. All of those need to be
fixed up.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c        | 1 +
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c   | 1 +
 drivers/gpu/drm/bridge/chipone-icn6211.c              | 1 +
 drivers/gpu/drm/bridge/display-connector.c            | 1 +
 drivers/gpu/drm/bridge/fsl-ldb.c                      | 1 +
 drivers/gpu/drm/bridge/ite-it66121.c                  | 1 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c              | 1 +
 drivers/gpu/drm/bridge/lontium-lt9211.c               | 1 +
 drivers/gpu/drm/bridge/lontium-lt9611.c               | 1 +
 drivers/gpu/drm/bridge/nwl-dsi.c                      | 1 +
 drivers/gpu/drm/bridge/sii902x.c                      | 1 +
 drivers/gpu/drm/bridge/tc358767.c                     | 1 +
 drivers/gpu/drm/bridge/tc358775.c                     | 1 +
 drivers/gpu/drm/bridge/ti-dlpc3433.c                  | 1 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c                 | 1 +
 drivers/gpu/drm/bridge/ti-tfp410.c                    | 1 +
 drivers/gpu/drm/drm_bridge.c                          | 1 +
 drivers/gpu/drm/drm_of.c                              | 1 +
 drivers/gpu/drm/imx/imx-ldb.c                         | 1 +
 drivers/gpu/drm/imx/parallel-display.c                | 1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c                    | 1 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                     | 1 +
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 1 +
 drivers/gpu/drm/panel/panel-raydium-rm67191.c         | 1 +
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c           | 1 +
 drivers/gpu/drm/panel/panel-simple.c                  | 1 +
 drivers/gpu/drm/pl111/pl111_display.c                 | 1 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c                   | 1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c          | 1 +
 drivers/gpu/drm/rockchip/rockchip_rgb.c               | 1 +
 drivers/gpu/drm/stm/ltdc.c                            | 1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c                    | 1 +
 drivers/gpu/drm/tidss/tidss_dispc.c                   | 1 +
 drivers/gpu/drm/vc4/vc4_dpi.c                         | 1 +
 include/drm/drm_crtc.h                                | 1 -
 35 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index cfe4fc69277e..58184cd6ab0b 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/media-bus-format.h>
 #include <linux/mfd/atmel-hlcdc.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm.h>
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index ba5f695703dc..ab63e7b11944 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -26,6 +26,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index d25bc62bfebd..481c86b2406e 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index e4d52a7e31b7..9a12449ad7b8 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -6,6 +6,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index b2675c769a55..8d091521ccba 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/media-bus-format.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 448c58e60c11..44278d54d35d 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -7,6 +7,7 @@
  *
  */
 
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 6a7a6983e796..28bad30dc4e5 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -7,6 +7,7 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/media-bus-format.h>
 #include <linux/regmap.h>
 
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index 84d764b4139b..9a3e90427d12 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -14,6 +14,7 @@
 #include <linux/clk.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 88f2a4f43cfb..585506eae10c 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -6,6 +6,7 @@
 
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index d83111be4829..6dc2a4e191d7 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -12,6 +12,7 @@
 #include <linux/irq.h>
 #include <linux/math64.h>
 #include <linux/mfd/syscon.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/mux/consumer.h>
 #include <linux/of.h>
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 65549fbfdc87..281f8a9ba4fd 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -15,6 +15,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c-mux.h>
 #include <linux/i2c.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index e4dd4f05f94b..6d5feba93ce4 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -24,6 +24,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index e5d00a6e7880..f3a207c79877 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
index 06e519798ac5..cef454862b67 100644
--- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
+++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
@@ -16,6 +16,7 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index b27c0d7c451a..69eb90e80f2c 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -29,6 +29,7 @@
 #include <linux/clk.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 4541126a45ea..401fe61217c7 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -6,6 +6,7 @@
 
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e275b4ca344b..6abf7a2407e9 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -22,6 +22,7 @@
  */
 
 #include <linux/err.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 
diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 6d640d2ab4d4..7bbcb999bb75 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -2,6 +2,7 @@
 #include <linux/component.h>
 #include <linux/export.h>
 #include <linux/list.h>
+#include <linux/media-bus-format.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
 
diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index 4f2fd69c4a4e..1ecaac16dd03 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -7,6 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/component.h>
+#include <linux/media-bus-format.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
 #include <linux/module.h>
diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index 5a91a5c82057..100ebdf3dafb 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/component.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/videodev2.h>
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index e61cd67b978f..6dafa6116546 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -8,6 +8,7 @@
 #include <linux/component.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/media-bus-format.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_gpio.h>
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 7d38769821c3..e38ce5737a5f 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -11,6 +11,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/media-bus-format.h>
 #include <linux/pm_runtime.h>
 #include <linux/spinlock.h>
 
diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 145047e19394..a6dc5ab182fa 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -45,6 +45,7 @@
 #include <linux/err.h>
 #include <linux/fb.h>
 #include <linux/i2c.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
index 572547d1aa83..4e021a572211 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
@@ -8,6 +8,7 @@
 #include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/regulator/consumer.h>
diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 3939b25e6666..76160e5d43bd 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index e24e463a0220..27a8894ef5c9 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -23,6 +23,7 @@
 
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index ccf5f02b2962..74f59a8049b2 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-buf.h>
+#include <linux/media-bus-format.h>
 #include <linux/of_graph.h>
 
 #include <drm/drm_fb_cma_helper.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 8dbfbbd3cad1..830aac0a2cb4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 16791693b8e6..e4631f515ba4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/media-bus-format.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index 418eb631d7cd..75eb7cca3d82 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/component.h>
+#include <linux/media-bus-format.h>
 #include <linux/of_graph.h>
 
 #include <drm/display/drm_dp_helper.h>
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 76230f775081..f13e296f9000 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -12,6 +12,7 @@
 #include <linux/component.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_graph.h>
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 2ee158aaeb9e..523a6d787921 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -8,6 +8,7 @@
 
 #include <linux/component.h>
 #include <linux/ioport.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 73f591cfb5a0..dd3c6a606ae2 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -11,6 +11,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index c180eb60bee8..661e2f7f4b70 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -20,6 +20,7 @@
 #include <drm/drm_simple_kms_helper.h>
 #include <linux/clk.h>
 #include <linux/component.h>
+#include <linux/media-bus-format.h>
 #include <linux/of_graph.h>
 #include <linux/of_platform.h>
 #include "vc4_drv.h"
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 146898220d5b..a583669eb443 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -28,7 +28,6 @@
 #include <linux/i2c.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
-#include <linux/media-bus-format.h>
 #include <drm/drm_modeset_lock.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_modes.h>
-- 
2.35.1

