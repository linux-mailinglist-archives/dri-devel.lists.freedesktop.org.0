Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3D4B1BE52
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 03:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A8E10E6F8;
	Wed,  6 Aug 2025 01:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CCA10E6F8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 01:34:19 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1339F1A1D4F;
 Wed,  6 Aug 2025 03:34:18 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D39951A1D4A;
 Wed,  6 Aug 2025 03:34:17 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com
 (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 1538818000AB;
 Wed,  6 Aug 2025 09:34:14 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Wed, 06 Aug 2025 10:33:34 +0900
Subject: [PATCH v3 3/3] drm: bridge: Add waveshare DSI2DPI unit driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-waveshare-v3-3-fd28e01f064f@nxp.com>
References: <20250806-waveshare-v3-0-fd28e01f064f@nxp.com>
In-Reply-To: <20250806-waveshare-v3-0-fd28e01f064f@nxp.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, victor.liu@nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754444048; l=8308;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=WdFAsa0ufaMayNtK1EnOAsVxDcm3sLPL+1c7SzaBcwk=;
 b=dg6jnFh7be3vjeF8KWQ0FY0xJPXuYaLvEnpybswkUY3OwLtgu0VpHHZAE/yTogYyEGUtb7ivR
 diyvFZyoQiODfJ2/7D8GQgedjZ/5Xr/ZWe8BV9L35MR97xaXK2r/k4N
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
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

Waveshare touchscreen consists of a DPI panel and a driver board.
The waveshare driver board consists of ICN6211 and a MCU to
convert DSI to DPI and control the backlight.
This driver treats the MCU and ICN6211 board as a whole unit.
It can support all resolution waveshare DSI2DPI based panel,
the timing table should come from 'panel-dpi' panel in the device tree.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
Suggested-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Change from v2 to v3
- Sort the config names alphabetically
- Add depends on BACKLIGHT_CLASS_DEVICE
- Drop disable_debugfs in regmap_config
- Sort the variables in reverse Christmas tree
- Drop inappropriate blank line
- Drop duplicate backlight variable
- Change API to upstream version
---
 drivers/gpu/drm/bridge/Kconfig         |  12 ++
 drivers/gpu/drm/bridge/Makefile        |   1 +
 drivers/gpu/drm/bridge/waveshare-dsi.c | 203 +++++++++++++++++++++++++++++++++
 3 files changed, 216 insertions(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index cb3b797fcea1c73e83c9187fef6582296b340305..0447967d125fe8c4cb7dccf3f55323086e7c6ef7 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -446,6 +446,18 @@ config DRM_TI_TPD12S015
 	  Texas Instruments TPD12S015 HDMI level shifter and ESD protection
 	  driver.
 
+config DRM_WAVESHARE_BRIDGE
+	tristate "Waveshare DSI bridge"
+	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_PANEL_BRIDGE
+	select DRM_KMS_HELPER
+	select DRM_MIPI_DSI
+	select REGMAP_I2C
+	help
+	  Driver for waveshare DSI to DPI bridge board.
+	  Please say Y if you have such hardware
+
 source "drivers/gpu/drm/bridge/analogix/Kconfig"
 
 source "drivers/gpu/drm/bridge/adv7511/Kconfig"
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 72185bfd87e4ff6e6ef367edb9d9f52d92bc75fa..fcec44cb273eb99fce08fc924d0d86eab67356ad 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
 obj-$(CONFIG_DRM_TI_TDP158) += ti-tdp158.o
 obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
 obj-$(CONFIG_DRM_TI_TPD12S015) += ti-tpd12s015.o
+obj-$(CONFIG_DRM_WAVESHARE_BRIDGE) += waveshare-dsi.o
 obj-$(CONFIG_DRM_NWL_MIPI_DSI) += nwl-dsi.o
 obj-$(CONFIG_DRM_ITE_IT66121) += ite-it66121.o
 
diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
new file mode 100644
index 0000000000000000000000000000000000000000..01c70e7d3d3bd50b17b25396ed9507a2a7e96d18
--- /dev/null
+++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ * Based on panel-raspberrypi-touchscreen by Broadcom
+ */
+
+#include <linux/backlight.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+
+struct ws_bridge {
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct backlight_device *backlight;
+	struct device *dev;
+	struct regmap *reg_map;
+};
+
+static const struct regmap_config ws_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xff,
+};
+
+static struct ws_bridge *bridge_to_ws_bridge(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct ws_bridge, bridge);
+}
+
+static int ws_bridge_attach_dsi(struct ws_bridge *ws)
+{
+	const struct mipi_dsi_device_info info = {
+		.type = "ws-bridge",
+		.channel = 0,
+		.node = NULL,
+	};
+	struct device_node *dsi_host_node;
+	struct device *dev = ws->dev;
+	struct mipi_dsi_device *dsi;
+	struct mipi_dsi_host *host;
+	int ret;
+
+	dsi_host_node = of_graph_get_remote_node(dev->of_node, 0, 0);
+	if (!dsi_host_node) {
+		dev_err(dev, "Failed to get remote port\n");
+		return -ENODEV;
+	}
+	host = of_find_mipi_dsi_host_by_node(dsi_host_node);
+	of_node_put(dsi_host_node);
+	if (!host)
+		return dev_err_probe(dev, -EPROBE_DEFER, "Failed to find dsi_host\n");
+
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
+	if (IS_ERR(dsi))
+		return dev_err_probe(dev, PTR_ERR(dsi), "Failed to create dsi device\n");
+
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->lanes = 2;
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to attach dsi to host\n");
+
+	return 0;
+}
+
+static int ws_bridge_bridge_attach(struct drm_bridge *bridge,
+				   struct drm_encoder *encoder,
+				   enum drm_bridge_attach_flags flags)
+{
+	struct ws_bridge *ws = bridge_to_ws_bridge(bridge);
+	int ret;
+
+	ret = ws_bridge_attach_dsi(ws);
+	if (ret)
+		return ret;
+
+	return drm_bridge_attach(encoder, ws->next_bridge,
+				 &ws->bridge, flags);
+}
+
+static void ws_bridge_bridge_enable(struct drm_bridge *bridge)
+{
+	struct ws_bridge *ws = bridge_to_ws_bridge(bridge);
+
+	regmap_write(ws->reg_map, 0xad, 0x01);
+	backlight_enable(ws->backlight);
+}
+
+static void ws_bridge_bridge_disable(struct drm_bridge *bridge)
+{
+	struct ws_bridge *ws = bridge_to_ws_bridge(bridge);
+
+	backlight_disable(ws->backlight);
+	regmap_write(ws->reg_map, 0xad, 0x00);
+}
+
+static const struct drm_bridge_funcs ws_bridge_bridge_funcs = {
+	.enable = ws_bridge_bridge_enable,
+	.disable = ws_bridge_bridge_disable,
+	.attach = ws_bridge_bridge_attach,
+};
+
+static int ws_bridge_bl_update_status(struct backlight_device *bl)
+{
+	struct ws_bridge *ws = bl_get_data(bl);
+
+	regmap_write(ws->reg_map, 0xab, 0xff - backlight_get_brightness(bl));
+	regmap_write(ws->reg_map, 0xaa, 0x01);
+
+	return 0;
+}
+
+static const struct backlight_ops ws_bridge_bl_ops = {
+	.update_status = ws_bridge_bl_update_status,
+};
+
+static struct backlight_device *ws_bridge_create_backlight(struct ws_bridge *ws)
+{
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 255,
+		.max_brightness = 255,
+	};
+	struct device *dev = ws->dev;
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, ws,
+					      &ws_bridge_bl_ops, &props);
+}
+
+static int ws_bridge_probe(struct i2c_client *i2c)
+{
+	struct device *dev = &i2c->dev;
+	struct drm_panel *panel;
+	struct ws_bridge *ws;
+	int ret;
+
+	ws = devm_drm_bridge_alloc(dev, struct ws_bridge, bridge, &ws_bridge_bridge_funcs);
+	if (!ws)
+		return -ENOMEM;
+
+	ws->dev = dev;
+
+	ws->reg_map = devm_regmap_init_i2c(i2c, &ws_regmap_config);
+	if (IS_ERR(ws->reg_map))
+		return dev_err_probe(dev, PTR_ERR(ws->reg_map), "Failed to allocate regmap\n");
+
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, &panel, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to find remote panel\n");
+
+	ws->next_bridge = devm_drm_panel_bridge_add(dev, panel);
+	if (IS_ERR(ws->next_bridge))
+		return PTR_ERR(ws->next_bridge);
+
+	ws->backlight = ws_bridge_create_backlight(ws);
+	if (IS_ERR(ws->backlight)) {
+		ret = PTR_ERR(ws->backlight);
+		dev_err(dev, "Failed to create backlight: %d\n", ret);
+		return ret;
+	}
+
+	regmap_write(ws->reg_map, 0xc0, 0x01);
+	regmap_write(ws->reg_map, 0xc2, 0x01);
+	regmap_write(ws->reg_map, 0xac, 0x01);
+
+	ws->bridge.type = DRM_MODE_CONNECTOR_DPI;
+	ws->bridge.of_node = dev->of_node;
+	devm_drm_bridge_add(dev, &ws->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id ws_bridge_of_ids[] = {
+	{.compatible = "waveshare,dsi2dpi",},
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, ws_bridge_of_ids);
+
+static struct i2c_driver ws_bridge_driver = {
+	.driver = {
+		.name = "ws_dsi2dpi",
+		.of_match_table = ws_bridge_of_ids,
+	},
+	.probe = ws_bridge_probe,
+};
+module_i2c_driver(ws_bridge_driver);
+
+MODULE_AUTHOR("Joseph Guo <qijian.guo@nxp.com>");
+MODULE_DESCRIPTION("Waveshare DSI2DPI bridge driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

