Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLvTN3HaimngOQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 08:12:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D07117BD8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 08:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A222A10E4D6;
	Tue, 10 Feb 2026 07:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="g1GCpY5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49238.qiye.163.com (mail-m49238.qiye.163.com
 [45.254.49.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DDE10E4D6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 07:12:45 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 33b5149f6;
 Tue, 10 Feb 2026 15:12:41 +0800 (GMT+08:00)
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
Subject: [PATCH v9 02/15] drm/bridge: Move legacy bridge driver out of imx
 directory for multi-platform use
Date: Tue, 10 Feb 2026 15:12:12 +0800
Message-Id: <20260210071225.2566099-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210071225.2566099-1-damon.ding@rock-chips.com>
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c46652c4203a3kunm1f53a888aef94f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk8dSFZMGUtNHUlIHk5DS09WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=g1GCpY5nd3lRnBCRARtiHOmgwrDOKG+bpIORjHuu8bdFAHb2M7gFjSVAT7gJMwud7LInm4qoHM0Pa8ItmFTnhqpIfiUeoolm+6Bx9blBBlWJipNiy1MTIkN9UFXtsflHJS2U72g+KuecqZf9zpy899i/fFWvCc94Gx4meooIxTw=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=M7d1+B8V/Ds8hVVt94otD+oETRw/7Hiw294dBIg1HVU=;
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:jingoohan1@gmail.com,m:p.zabel@pengutronix.de,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:m.szyprowski@samsung.com,m:luca.ceresoli@bootlin.com,m:jani.nikula@intel.com,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:damon.ding@rock-chips.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[damon.ding@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,samsung.com,rock-chips.com,sntech.de,oss.qualcomm.com,chromium.org,bootlin.com,intel.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[damon.ding@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sntech.de:email,rock-chips.com:mid,rock-chips.com:dkim,rock-chips.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 57D07117BD8
X-Rspamd-Action: no action

As suggested by Dmitry, the DRM legacy bridge driver can be pulled
out of imx/ subdir for multi-platform use. The driver is also renamed
to make it more generic and suitable for platforms other than i.MX.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

---

Changes in v7:
- Rename legacy-bridge to of-display-mode-bridge.
- Remove unnecessary API drm_bridge_is_legacy().

Changes in v9
- Fix the Kconfig help text.
- Add Tested-by tag.
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
index 39385deafc68..6563d367cad8 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -251,6 +251,16 @@ config DRM_NXP_PTN3460
 	help
 	  NXP PTN3460 eDP-LVDS bridge chip driver.
 
+config DRM_OF_DISPLAY_MODE_BRIDGE
+	tristate
+	depends on DRM_BRIDGE && OF
+	help
+	  This is a DRM bridge implementation that uses of_get_drm_display_mode
+	  to acquire display mode.
+
+	  It exists for compatibility with legacy display mode parsing, in order
+	  to conform to the panel-bridge framework.
+
 config DRM_PARADE_PS8622
 	tristate "Parade eDP/LVDS bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 909c21cc3acd..c54018a014d3 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
 obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
 obj-$(CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER) += microchip-lvds.o
 obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
+obj-$(CONFIG_DRM_OF_DISPLAY_MODE_BRIDGE) += of-display-mode-bridge.o
 obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
 obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
 obj-$(CONFIG_DRM_SAMSUNG_DSIM) += samsung-dsim.o
diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index b9028a5e5a06..8877b9789868 100644
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
index 8d01fda25451..69d9f9abbe36 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,5 +1,4 @@
 obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
-obj-$(CONFIG_DRM_IMX_LEGACY_BRIDGE) += imx-legacy-bridge.o
 obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) += imx8mp-hdmi-tx.o
 obj-$(CONFIG_DRM_IMX8MP_HDMI_PAI) += imx8mp-hdmi-pai.o
 obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) += imx8mp-hdmi-pvi.o
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
index 626d410d9150..730caf883e83 100644
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
index 6fbf505d2801..1109cb1badcb 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -19,7 +19,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
-#include <drm/bridge/imx.h>
+#include <drm/bridge/of-display-mode-bridge.h>
 
 #include "imx-drm.h"
 
@@ -233,7 +233,8 @@ static int imx_pd_probe(struct platform_device *pdev)
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

