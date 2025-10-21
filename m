Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B67FBBF4678
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 04:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77A410E55B;
	Tue, 21 Oct 2025 02:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="GnshVp0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m15573.qiye.163.com (mail-m15573.qiye.163.com
 [101.71.155.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D82410E55B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 02:53:53 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 26977ba16;
 Tue, 21 Oct 2025 10:53:49 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 05/18] drm/bridge: Move legacy bridge driver out of imx
 directory for multi-platform use
Date: Tue, 21 Oct 2025 10:52:38 +0800
Message-Id: <20251021025240.1524169-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021025240.1524169-1-damon.ding@rock-chips.com>
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
 <20251021025240.1524169-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a04afea5203a3kunmb53d69df5a2adf
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk1OGFZIHhhLQ0lLGU9NH0pWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=GnshVp0OzrW9u2bdxYNS1XPQscOwJX+Is/k7TmpGaSpEPyKcYb3KYCUSxsshX7ypjAkFbIpcSzoOZf09ICA9ayJvQ7M2QU7aF9BSQjpjMuMuab6JrweKf5a6whhB8zI1coJCEVDzpQX+XHUOGv9kXTLRk8NPhZd8kcNTeZfxvoU=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=wn/0FMb5NWz8CX0eF2jdz/28ju6jlJOjooQCvTXYq4k=;
 h=date:mime-version:subject:message-id:from;
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

As suggested by Dmitry, the DRM legacy bridge driver can be pulled
out of imx/ subdir for multi-platform use. The driver is also renamed
to make it more generic and suitable for platforms other than i.MX.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

---

Changes in v7:
- Rename legacy-bridge to of-display-mode-bridge.
- Remove unnecessary API drm_bridge_is_legacy().
---
 drivers/gpu/drm/bridge/Kconfig                | 10 ++
 drivers/gpu/drm/bridge/Makefile               |  1 +
 drivers/gpu/drm/bridge/imx/Kconfig            | 10 --
 drivers/gpu/drm/bridge/imx/Makefile           |  1 -
 .../gpu/drm/bridge/imx/imx-legacy-bridge.c    | 91 ------------------
 .../gpu/drm/bridge/of-display-mode-bridge.c   | 93 +++++++++++++++++++
 drivers/gpu/drm/imx/ipuv3/Kconfig             |  4 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |  6 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c  |  5 +-
 include/drm/bridge/imx.h                      | 17 ----
 include/drm/bridge/of-display-mode-bridge.h   | 17 ++++
 11 files changed, 129 insertions(+), 126 deletions(-)
 delete mode 100644 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
 create mode 100644 drivers/gpu/drm/bridge/of-display-mode-bridge.c
 delete mode 100644 include/drm/bridge/imx.h
 create mode 100644 include/drm/bridge/of-display-mode-bridge.h

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index a250afd8d662..65784f6db797 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -244,6 +244,16 @@ config DRM_NXP_PTN3460
 	help
 	  NXP PTN3460 eDP-LVDS bridge chip driver.
 
+config DRM_OF_DISPLAY_MODE_BRIDGE
+	tristate
+	depends on DRM_BRIDGE && OF
+	help
+	  This is a DRM bridge implementation that uses of_get_drm_display_mode
+	  to acquire display mode.
+
+	  Newer designs should not use this bridge and should use proper panel
+	  driver instead.
+
 config DRM_PARADE_PS8622
 	tristate "Parade eDP/LVDS bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index c7dc03182e59..41146faef91a 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
 obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
 obj-$(CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER) += microchip-lvds.o
 obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
+obj-$(CONFIG_DRM_OF_DISPLAY_MODE_BRIDGE) += of-display-mode-bridge.o
 obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
 obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
 obj-$(CONFIG_DRM_SAMSUNG_DSIM) += samsung-dsim.o
diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 9a480c6abb85..8dd89efa8ea7 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -3,16 +3,6 @@ if ARCH_MXC || COMPILE_TEST
 config DRM_IMX_LDB_HELPER
 	tristate
 
-config DRM_IMX_LEGACY_BRIDGE
-	tristate
-	depends on DRM_IMX
-	help
-	  This is a DRM bridge implementation for the DRM i.MX IPUv3 driver,
-	  that uses of_get_drm_display_mode to acquire display mode.
-
-	  Newer designs should not use this bridge and should use proper panel
-	  driver instead.
-
 config DRM_IMX8MP_DW_HDMI_BRIDGE
 	tristate "Freescale i.MX8MP HDMI-TX bridge support"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index dd5d48584806..edb0a7b71b30 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,5 +1,4 @@
 obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
-obj-$(CONFIG_DRM_IMX_LEGACY_BRIDGE) += imx-legacy-bridge.o
 obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) += imx8mp-hdmi-tx.o
 obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) += imx8mp-hdmi-pvi.o
 obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
diff --git a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
deleted file mode 100644
index 0e31d5000e7c..000000000000
--- a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
+++ /dev/null
@@ -1,91 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Freescale i.MX drm driver
- *
- * bridge driver for legacy DT bindings, utilizing display-timings node
- */
-
-#include <linux/export.h>
-
-#include <drm/drm_bridge.h>
-#include <drm/drm_modes.h>
-#include <drm/drm_probe_helper.h>
-#include <drm/bridge/imx.h>
-
-#include <video/of_display_timing.h>
-#include <video/of_videomode.h>
-
-struct imx_legacy_bridge {
-	struct drm_bridge base;
-
-	struct drm_display_mode mode;
-	u32 bus_flags;
-};
-
-#define to_imx_legacy_bridge(bridge)	container_of(bridge, struct imx_legacy_bridge, base)
-
-static int imx_legacy_bridge_attach(struct drm_bridge *bridge,
-				    struct drm_encoder *encoder,
-				    enum drm_bridge_attach_flags flags)
-{
-	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
-		return -EINVAL;
-
-	return 0;
-}
-
-static int imx_legacy_bridge_get_modes(struct drm_bridge *bridge,
-				       struct drm_connector *connector)
-{
-	struct imx_legacy_bridge *imx_bridge = to_imx_legacy_bridge(bridge);
-	int ret;
-
-	ret = drm_connector_helper_get_modes_fixed(connector, &imx_bridge->mode);
-	if (ret)
-		return ret;
-
-	connector->display_info.bus_flags = imx_bridge->bus_flags;
-
-	return 0;
-}
-
-struct drm_bridge_funcs imx_legacy_bridge_funcs = {
-	.attach = imx_legacy_bridge_attach,
-	.get_modes = imx_legacy_bridge_get_modes,
-};
-
-struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
-					      struct device_node *np,
-					      int type)
-{
-	struct imx_legacy_bridge *imx_bridge;
-	int ret;
-
-	imx_bridge = devm_drm_bridge_alloc(dev, struct imx_legacy_bridge,
-					   base, &imx_legacy_bridge_funcs);
-	if (IS_ERR(imx_bridge))
-		return ERR_CAST(imx_bridge);
-
-	ret = of_get_drm_display_mode(np,
-				      &imx_bridge->mode,
-				      &imx_bridge->bus_flags,
-				      OF_USE_NATIVE_MODE);
-	if (ret)
-		return ERR_PTR(ret);
-
-	imx_bridge->mode.type |= DRM_MODE_TYPE_DRIVER;
-
-	imx_bridge->base.of_node = np;
-	imx_bridge->base.ops = DRM_BRIDGE_OP_MODES;
-	imx_bridge->base.type = type;
-
-	ret = devm_drm_bridge_add(dev, &imx_bridge->base);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return &imx_bridge->base;
-}
-EXPORT_SYMBOL_GPL(devm_imx_drm_legacy_bridge);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("Freescale i.MX DRM bridge driver for legacy DT bindings");
diff --git a/drivers/gpu/drm/bridge/of-display-mode-bridge.c b/drivers/gpu/drm/bridge/of-display-mode-bridge.c
new file mode 100644
index 000000000000..cb15713f3a79
--- /dev/null
+++ b/drivers/gpu/drm/bridge/of-display-mode-bridge.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2012 Sascha Hauer, Pengutronix
+ *
+ * bridge driver for legacy DT bindings, utilizing display-timings node
+ *
+ * Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+ */
+
+#include <linux/export.h>
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/bridge/of-display-mode-bridge.h>
+
+#include <video/of_display_timing.h>
+#include <video/of_videomode.h>
+
+struct of_display_mode_bridge {
+	struct drm_bridge base;
+
+	struct drm_display_mode mode;
+	u32 bus_flags;
+};
+
+#define to_of_display_mode_bridge(bridge) container_of(bridge, struct of_display_mode_bridge, base)
+
+static int of_display_mode_bridge_attach(struct drm_bridge *bridge,
+					 struct drm_encoder *encoder,
+					 enum drm_bridge_attach_flags flags)
+{
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int of_display_mode_bridge_get_modes(struct drm_bridge *bridge,
+					    struct drm_connector *connector)
+{
+	struct of_display_mode_bridge *of_bridge = to_of_display_mode_bridge(bridge);
+	int ret;
+
+	ret = drm_connector_helper_get_modes_fixed(connector, &of_bridge->mode);
+	if (ret)
+		return ret;
+
+	connector->display_info.bus_flags = of_bridge->bus_flags;
+
+	return 0;
+}
+
+struct drm_bridge_funcs of_display_mode_bridge_funcs = {
+	.attach = of_display_mode_bridge_attach,
+	.get_modes = of_display_mode_bridge_get_modes,
+};
+
+struct drm_bridge *devm_drm_of_display_mode_bridge(struct device *dev,
+						   struct device_node *np,
+						   int type)
+{
+	struct of_display_mode_bridge *of_bridge;
+	int ret;
+
+	of_bridge = devm_drm_bridge_alloc(dev, struct of_display_mode_bridge,
+					  base, &of_display_mode_bridge_funcs);
+	if (IS_ERR(of_bridge))
+		return ERR_CAST(of_bridge);
+
+	ret = of_get_drm_display_mode(np,
+				      &of_bridge->mode,
+				      &of_bridge->bus_flags,
+				      OF_USE_NATIVE_MODE);
+	if (ret)
+		return ERR_PTR(ret);
+
+	of_bridge->mode.type |= DRM_MODE_TYPE_DRIVER;
+
+	of_bridge->base.of_node = np;
+	of_bridge->base.ops = DRM_BRIDGE_OP_MODES;
+	of_bridge->base.type = type;
+
+	ret = devm_drm_bridge_add(dev, &of_bridge->base);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &of_bridge->base;
+}
+EXPORT_SYMBOL_GPL(devm_drm_of_display_mode_bridge);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DRM bridge driver for legacy DT bindings");
diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index acaf25089001..e98f8d35efaa 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -15,7 +15,7 @@ config DRM_IMX_PARALLEL_DISPLAY
 	depends on DRM_IMX
 	select DRM_BRIDGE
 	select DRM_BRIDGE_CONNECTOR
-	select DRM_IMX_LEGACY_BRIDGE
+	select DRM_OF_DISPLAY_MODE_BRIDGE
 	select DRM_PANEL_BRIDGE
 	select VIDEOMODE_HELPERS
 
@@ -36,7 +36,7 @@ config DRM_IMX_LDB
 	select DRM_BRIDGE
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_PANEL_BRIDGE
-	select DRM_IMX_LEGACY_BRIDGE
+	select DRM_OF_DISPLAY_MODE_BRIDGE
 	help
 	  Choose this to enable the internal LVDS Display Bridge (LDB)
 	  found on i.MX53 and i.MX6 processors.
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 6be7a57ad03d..ccbd872da10f 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -28,7 +28,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
-#include <drm/bridge/imx.h>
+#include <drm/bridge/of-display-mode-bridge.h>
 
 #include "imx-drm.h"
 
@@ -605,8 +605,8 @@ static int imx_ldb_probe(struct platform_device *pdev)
 		 * checking the bus_format property.
 		 */
 		if (!channel->bridge) {
-			channel->bridge = devm_imx_drm_legacy_bridge(dev, child,
-								     DRM_MODE_CONNECTOR_LVDS);
+			channel->bridge = devm_drm_of_display_mode_bridge(dev, child,
+									  DRM_MODE_CONNECTOR_LVDS);
 			if (IS_ERR(channel->bridge)) {
 				ret = PTR_ERR(channel->bridge);
 				goto free_child;
diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 6d8325c76697..2349cc2ce1fc 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -19,7 +19,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
-#include <drm/bridge/imx.h>
+#include <drm/bridge/of-display-mode-bridge.h>
 
 #include "imx-drm.h"
 
@@ -235,7 +235,8 @@ static int imx_pd_probe(struct platform_device *pdev)
 	/* port@1 is the output port */
 	imxpd->next_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
 	if (imxpd->next_bridge == ERR_PTR(-ENODEV))
-		imxpd->next_bridge = devm_imx_drm_legacy_bridge(dev, np, DRM_MODE_CONNECTOR_DPI);
+		imxpd->next_bridge = devm_drm_of_display_mode_bridge(dev, np,
+								     DRM_MODE_CONNECTOR_DPI);
 	if (IS_ERR(imxpd->next_bridge)) {
 		ret = PTR_ERR(imxpd->next_bridge);
 		return ret;
diff --git a/include/drm/bridge/imx.h b/include/drm/bridge/imx.h
deleted file mode 100644
index b93f719fe0e7..000000000000
--- a/include/drm/bridge/imx.h
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Copyright (C) 2012 Sascha Hauer, Pengutronix
- */
-
-#ifndef DRM_IMX_BRIDGE_H
-#define DRM_IMX_BRIDGE_H
-
-struct device;
-struct device_node;
-struct drm_bridge;
-
-struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
-					      struct device_node *np,
-					      int type);
-
-#endif
diff --git a/include/drm/bridge/of-display-mode-bridge.h b/include/drm/bridge/of-display-mode-bridge.h
new file mode 100644
index 000000000000..89fcfedf68d8
--- /dev/null
+++ b/include/drm/bridge/of-display-mode-bridge.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2012 Sascha Hauer, Pengutronix
+ */
+
+#ifndef DRM_OF_DISPLAY_MODE_BRIDGE_H
+#define DRM_OF_DISPLAY_MODE_BRIDGE_H
+
+struct device;
+struct device_node;
+struct drm_bridge;
+
+struct drm_bridge *devm_drm_of_display_mode_bridge(struct device *dev,
+						   struct device_node *np,
+						   int type);
+
+#endif
-- 
2.34.1

