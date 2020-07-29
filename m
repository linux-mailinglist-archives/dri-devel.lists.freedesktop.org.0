Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B25C232C60
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 09:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A166E880;
	Thu, 30 Jul 2020 07:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BB56E58A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 16:46:16 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BGzvV2rzFz1qsjf;
 Wed, 29 Jul 2020 18:46:14 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BGzvV14RWz1qy69;
 Wed, 29 Jul 2020 18:46:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id HcfDVpqUZsZJ; Wed, 29 Jul 2020 18:46:12 +0200 (CEST)
X-Auth-Info: amuYlSgJSicXZpeD4I981ctVnEg7qDF0lEtmHFeRY84=
Received: from desktop.lan (ip-86-49-101-166.net.upcbroadband.cz
 [86.49.101.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 29 Jul 2020 18:46:12 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 2/2] drm/bridge: tc358762: Add basic driver for Toshiba
 TC358762 DSI-to-DPI bridge
Date: Wed, 29 Jul 2020 18:45:54 +0200
Message-Id: <20200729164554.114735-2-marex@denx.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729164554.114735-1-marex@denx.de>
References: <20200729164554.114735-1-marex@denx.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Jul 2020 07:16:49 +0000
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
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add very basic driver for Toshiba TC358762 DSI-to-DPI bridge, derived
from tc358764 driver and panel-raspberrypi-touchscreen. This driver is
meant to replace the panel-raspberrypi-touchscreen too, as the bridge
connection can be described in DT too.

Signed-off-by: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Eric Anholt <eric@anholt.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
---
V2: Switch to DRM_PANEL_BRIDGE
---
 drivers/gpu/drm/bridge/Kconfig    |   8 +
 drivers/gpu/drm/bridge/Makefile   |   1 +
 drivers/gpu/drm/bridge/tc358762.c | 280 ++++++++++++++++++++++++++++++
 3 files changed, 289 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/tc358762.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 43271c21d3fc..58e879852082 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -153,6 +153,14 @@ config DRM_THINE_THC63LVD1024
 	help
 	  Thine THC63LVD1024 LVDS/parallel converter driver.
 
+config DRM_TOSHIBA_TC358762
+	tristate "TC358762 DSI/DPI bridge"
+	depends on OF
+	select DRM_MIPI_DSI
+	select DRM_PANEL_BRIDGE
+	help
+	  Toshiba TC358762 DSI/DPI bridge driver.
+
 config DRM_TOSHIBA_TC358764
 	tristate "TC358764 DSI/LVDS bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index d63d4b7e4347..b341c60ee96a 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_DRM_SII902X) += sii902x.o
 obj-$(CONFIG_DRM_SII9234) += sii9234.o
 obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += simple-bridge.o
 obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
+obj-$(CONFIG_DRM_TOSHIBA_TC358762) += tc358762.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358764) += tc358764.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358767) += tc358767.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358768) += tc358768.o
diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
new file mode 100644
index 000000000000..1bfdfc6affaf
--- /dev/null
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -0,0 +1,280 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Marek Vasut <marex@denx.de>
+ *
+ * Based on tc358764.c by
+ *  Andrzej Hajda <a.hajda@samsung.com>
+ *  Maciej Purski <m.purski@samsung.com>
+ *
+ * Based on rpi_touchscreen.c by
+ *  Eric Anholt <eric@anholt.net>
+ */
+
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+/* PPI layer registers */
+#define PPI_STARTPPI		0x0104 /* START control bit */
+#define PPI_LPTXTIMECNT		0x0114 /* LPTX timing signal */
+#define PPI_D0S_ATMR		0x0144
+#define PPI_D1S_ATMR		0x0148
+#define PPI_D0S_CLRSIPOCOUNT	0x0164 /* Assertion timer for Lane 0 */
+#define PPI_D1S_CLRSIPOCOUNT	0x0168 /* Assertion timer for Lane 1 */
+#define PPI_START_FUNCTION	1
+
+/* DSI layer registers */
+#define DSI_STARTDSI		0x0204 /* START control bit of DSI-TX */
+#define DSI_LANEENABLE		0x0210 /* Enables each lane */
+#define DSI_RX_START		1
+
+/* LCDC/DPI Host Registers */
+#define LCDCTRL			0x0420
+
+/* SPI Master Registers */
+#define SPICMR			0x0450
+#define SPITCR			0x0454
+
+/* System Controller Registers */
+#define SYSCTRL			0x0464
+
+/* System registers */
+#define LPX_PERIOD		3
+
+/* Lane enable PPI and DSI register bits */
+#define LANEENABLE_CLEN		BIT(0)
+#define LANEENABLE_L0EN		BIT(1)
+#define LANEENABLE_L1EN		BIT(2)
+
+struct tc358762 {
+	struct device *dev;
+	struct drm_bridge bridge;
+	struct drm_connector connector;
+	struct regulator *regulator;
+	struct drm_bridge *panel_bridge;
+	bool pre_enabled;
+	int error;
+};
+
+static int tc358762_clear_error(struct tc358762 *ctx)
+{
+	int ret = ctx->error;
+
+	ctx->error = 0;
+	return ret;
+}
+
+static void tc358762_write(struct tc358762 *ctx, u16 addr, u32 val)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	ssize_t ret;
+	u8 data[6];
+
+	if (ctx->error)
+		return;
+
+	data[0] = addr;
+	data[1] = addr >> 8;
+	data[2] = val;
+	data[3] = val >> 8;
+	data[4] = val >> 16;
+	data[5] = val >> 24;
+
+	ret = mipi_dsi_generic_write(dsi, data, sizeof(data));
+	if (ret < 0)
+		ctx->error = ret;
+}
+
+static inline struct tc358762 *bridge_to_tc358762(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct tc358762, bridge);
+}
+
+static int tc358762_init(struct tc358762 *ctx)
+{
+	tc358762_write(ctx, DSI_LANEENABLE,
+		       LANEENABLE_L0EN | LANEENABLE_CLEN);
+	tc358762_write(ctx, PPI_D0S_CLRSIPOCOUNT, 5);
+	tc358762_write(ctx, PPI_D1S_CLRSIPOCOUNT, 5);
+	tc358762_write(ctx, PPI_D0S_ATMR, 0);
+	tc358762_write(ctx, PPI_D1S_ATMR, 0);
+	tc358762_write(ctx, PPI_LPTXTIMECNT, LPX_PERIOD);
+
+	tc358762_write(ctx, SPICMR, 0x00);
+	tc358762_write(ctx, LCDCTRL, 0x00100150);
+	tc358762_write(ctx, SYSCTRL, 0x040f);
+	msleep(100);
+
+	tc358762_write(ctx, PPI_STARTPPI, PPI_START_FUNCTION);
+	tc358762_write(ctx, DSI_STARTDSI, DSI_RX_START);
+
+	msleep(100);
+
+	return tc358762_clear_error(ctx);
+}
+
+static void tc358762_post_disable(struct drm_bridge *bridge)
+{
+	struct tc358762 *ctx = bridge_to_tc358762(bridge);
+	int ret;
+
+	/*
+	 * The post_disable hook might be called multiple times.
+	 * We want to avoid regulator imbalance below.
+	 */
+	if (!ctx->pre_enabled)
+		return;
+
+	ctx->pre_enabled = false;
+
+	ret = regulator_disable(ctx->regulator);
+	if (ret < 0)
+		dev_err(ctx->dev, "error disabling regulators (%d)\n", ret);
+}
+
+static void tc358762_pre_enable(struct drm_bridge *bridge)
+{
+	struct tc358762 *ctx = bridge_to_tc358762(bridge);
+	int ret;
+
+	ret = regulator_enable(ctx->regulator);
+	if (ret < 0)
+		dev_err(ctx->dev, "error enabling regulators (%d)\n", ret);
+
+	ret = tc358762_init(ctx);
+	if (ret < 0)
+		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
+
+	ctx->pre_enabled = true;
+}
+
+static int tc358762_attach(struct drm_bridge *bridge,
+			   enum drm_bridge_attach_flags flags)
+{
+	struct tc358762 *ctx = bridge_to_tc358762(bridge);
+
+	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
+				 bridge, flags);
+}
+
+static const struct drm_bridge_funcs tc358762_bridge_funcs = {
+	.post_disable = tc358762_post_disable,
+	.pre_enable = tc358762_pre_enable,
+	.attach = tc358762_attach,
+};
+
+static int tc358762_parse_dt(struct tc358762 *ctx)
+{
+	struct drm_bridge *panel_bridge;
+	struct device *dev = ctx->dev;
+	struct drm_panel *panel;
+	int ret;
+
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
+	if (ret)
+		return ret;
+
+	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+
+	if (IS_ERR(panel_bridge))
+		return PTR_ERR(panel_bridge);
+
+	ctx->panel_bridge = panel_bridge;
+
+	return 0;
+}
+
+static int tc358762_configure_regulators(struct tc358762 *ctx)
+{
+	ctx->regulator = devm_regulator_get(ctx->dev, "vddc");
+	if (IS_ERR(ctx->regulator))
+		return PTR_ERR(ctx->regulator);
+
+	return 0;
+}
+
+static int tc358762_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct tc358762 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(struct tc358762), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	ctx->dev = dev;
+	ctx->pre_enabled = false;
+
+	/* TODO: Find out how to get dual-lane mode working */
+	dsi->lanes = 1;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+			  MIPI_DSI_MODE_LPM;
+
+	ret = tc358762_parse_dt(ctx);
+	if (ret < 0)
+		return ret;
+
+	ret = tc358762_configure_regulators(ctx);
+	if (ret < 0)
+		return ret;
+
+	ctx->bridge.funcs = &tc358762_bridge_funcs;
+	ctx->bridge.type = DRM_MODE_CONNECTOR_DPI;
+	ctx->bridge.of_node = dev->of_node;
+
+	drm_bridge_add(&ctx->bridge);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		drm_bridge_remove(&ctx->bridge);
+		dev_err(dev, "failed to attach dsi\n");
+	}
+
+	return ret;
+}
+
+static int tc358762_remove(struct mipi_dsi_device *dsi)
+{
+	struct tc358762 *ctx = mipi_dsi_get_drvdata(dsi);
+
+	mipi_dsi_detach(dsi);
+	drm_bridge_remove(&ctx->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id tc358762_of_match[] = {
+	{ .compatible = "toshiba,tc358762" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tc358762_of_match);
+
+static struct mipi_dsi_driver tc358762_driver = {
+	.probe = tc358762_probe,
+	.remove = tc358762_remove,
+	.driver = {
+		.name = "tc358762",
+		.of_match_table = tc358762_of_match,
+	},
+};
+module_mipi_dsi_driver(tc358762_driver);
+
+MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
+MODULE_DESCRIPTION("MIPI-DSI based Driver for TC358762 DSI/DPI Bridge");
+MODULE_LICENSE("GPL v2");
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
