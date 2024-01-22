Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA7F835C9C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 09:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BC110EB4A;
	Mon, 22 Jan 2024 08:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B3D10EB4A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 08:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705912217; x=1737448217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lqB+rFrz8UHAATUAIntAyt5YG+K0J2b3zpuBhYbUSaA=;
 b=IxTQI72+tIfadEaZp258gQDqjpj0MNkKnPFWjo8Ob2Sp8RxLHjX+TlcD
 GvGMIHEVjCG5rFLg4KHq6u29aw3y2jSVhZeRR8S3K994qonIAeHeNdcLp
 1aYJZy/KuaHJLGIU/OF4vbF9k4P4Sj01b5sSeJBJCWvePeAeK82b0L6fu
 KSr1zuv2YrdPjZN/PixYlKDW395Wksts8EYkpZWsh6tpzUPYcrnz3Ui25
 jVu8mXqKBEqdDTDzZQ4lAAntgMreDPRtsXRdkLun5zMvNFfI9DVWjZx/l
 zUjUJAPTfovWEAEWF55R3e4irJgkXyjU/wxP7DiNGTPwN1MuPNLvAxxPD A==;
X-CSE-ConnectionGUID: Rdeq91MiSf2exbg0h6qqSg==
X-CSE-MsgGUID: H633/nq9QU+/AjKWL5u8dg==
X-IronPort-AV: E=Sophos;i="6.05,211,1701154800"; d="scan'208";a="15568732"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jan 2024 01:30:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 01:30:11 -0700
Received: from che-lt-i70843lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 01:30:04 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
To: <manikandan.m@microchip.com>, <dharma.b@microchip.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] drm/bridge: add lvds controller support for sam9x7
Date: Mon, 22 Jan 2024 13:59:46 +0530
Message-ID: <20240122082947.21645-3-dharma.b@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240122082947.21645-1-dharma.b@microchip.com>
References: <20240122082947.21645-1-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: linux4microchip@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new LVDS controller driver for sam9x7 which does the following:
- Prepares and enables the LVDS Peripheral clock
- Defines its connector type as DRM_MODE_CONNECTOR_LVDS and adds itself
to the global bridge list.
- Identifies its output endpoint as panel and adds it to the encoder
display pipeline
- Enables the LVDS serializer

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/gpu/drm/bridge/Kconfig          |   7 +
 drivers/gpu/drm/bridge/Makefile         |   1 +
 drivers/gpu/drm/bridge/microchip-lvds.c | 250 ++++++++++++++++++++++++
 3 files changed, 258 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/microchip-lvds.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 3e6a4e2044c0..200afb36e421 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -173,6 +173,13 @@ config DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW
 	  to DP++. This is used with the i.MX6 imx-ldb
 	  driver. You are likely to say N here.
 
+config DRM_MICROCHIP_LVDS_SERIALIZER
+	tristate "Microchip LVDS serailzer support"
+	depends on OF
+	depends on DRM_ATMEL_HLCDC
+	help
+	  Support for Microchip's LVDS serializer.
+
 config DRM_NWL_MIPI_DSI
 	tristate "Northwest Logic MIPI DSI Host controller"
 	depends on DRM
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 2b892b7ed59e..e3804e93d324 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
 obj-$(CONFIG_DRM_LONTIUM_LT9611UXC) += lontium-lt9611uxc.o
 obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
 obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
+obj-$(CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER) += microchip-lvds.o
 obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
 obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
 obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
new file mode 100644
index 000000000000..297f5ae514f6
--- /dev/null
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 Microchip Technology Inc. and its subsidiaries
+ *
+ * Author: Manikandan Muralidharan <manikandan.m@microchip.com>
+ * Author: Dharma Balasubiramani <dharma.b@microchip.com>
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/delay.h>
+#include <linux/jiffies.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of_graph.h>
+#include <linux/pinctrl/devinfo.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#define LVDS_POLL_TIMEOUT_MS 1000
+
+/* LVDSC register offsets */
+#define LVDSC_CR	0x00
+#define LVDSC_CFGR	0x04
+#define LVDSC_SR	0x0C
+#define LVDSC_WPMR	0xE4
+
+/* Bitfields in LVDSC_CR (Control Register) */
+#define LVDSC_CR_SER_EN	BIT(0)
+
+/* Bitfields in LVDSC_CFGR (Configuration Register) */
+#define LVDSC_CFGR_PIXSIZE_24BITS	0
+#define LVDSC_CFGR_DEN_POL_HIGH		0
+#define LVDSC_CFGR_DC_UNBALANCED	0
+#define LVDSC_CFGR_MAPPING_JEIDA	BIT(6)
+
+/*Bitfields in LVDSC_SR */
+#define LVDSC_SR_CS	BIT(0)
+
+/* Bitfields in LVDSC_WPMR (Write Protection Mode Register) */
+#define LVDSC_WPMR_WPKEY_MASK	GENMASK(31, 8)
+#define LVDSC_WPMR_WPKEY_PSSWD	0x4C5644
+
+struct mchp_lvds {
+	struct device *dev;
+	void __iomem *regs;
+	struct clk *pclk;
+	int format; /* vesa or jeida format */
+	struct drm_panel *panel;
+	struct drm_bridge bridge;
+	struct drm_bridge *panel_bridge;
+};
+
+static inline struct mchp_lvds *bridge_to_lvds(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct mchp_lvds, bridge);
+}
+
+static inline u32 lvds_readl(struct mchp_lvds *lvds, u32 offset)
+{
+	return readl_relaxed(lvds->regs + offset);
+}
+
+static inline void lvds_writel(struct mchp_lvds *lvds, u32 offset, u32 val)
+{
+	writel_relaxed(val, lvds->regs + offset);
+}
+
+static void lvds_serialiser_on(struct mchp_lvds *lvds)
+{
+	unsigned long timeout = jiffies + msecs_to_jiffies(LVDS_POLL_TIMEOUT_MS);
+
+	/* The LVDSC registers can only be written if WPEN is cleared */
+	lvds_writel(lvds, LVDSC_WPMR, (LVDSC_WPMR_WPKEY_PSSWD &
+				LVDSC_WPMR_WPKEY_MASK));
+
+	/* Wait for the status of configuration registers to be changed */
+	while (lvds_readl(lvds, LVDSC_SR) & LVDSC_SR_CS) {
+		if (time_after(jiffies, timeout)) {
+			dev_err(lvds->dev, "%s: timeout error\n", __func__);
+			return;
+		}
+		usleep_range(1000, 2000);
+	}
+
+	/* Configure the LVDSC */
+	lvds_writel(lvds, LVDSC_CFGR, (LVDSC_CFGR_MAPPING_JEIDA |
+				LVDSC_CFGR_DC_UNBALANCED |
+				LVDSC_CFGR_DEN_POL_HIGH |
+				LVDSC_CFGR_PIXSIZE_24BITS));
+
+	/* Enable the LVDS serializer */
+	lvds_writel(lvds, LVDSC_CR, LVDSC_CR_SER_EN);
+}
+
+static int mchp_lvds_attach(struct drm_bridge *bridge,
+			    enum drm_bridge_attach_flags flags)
+{
+	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
+
+	bridge->encoder->encoder_type = DRM_MODE_ENCODER_LVDS;
+
+	return drm_bridge_attach(bridge->encoder, lvds->panel_bridge,
+				 bridge, flags);
+}
+
+static void mchp_lvds_enable(struct drm_bridge *bridge)
+{
+	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
+	int ret;
+
+	ret = clk_enable(lvds->pclk);
+	if (ret < 0) {
+		DRM_DEV_ERROR(lvds->dev, "failed to enable lvds pclk %d\n", ret);
+		return;
+	}
+
+	ret = pm_runtime_get_sync(lvds->dev);
+	if (ret < 0) {
+		DRM_DEV_ERROR(lvds->dev, "failed to get pm runtime: %d\n", ret);
+		clk_disable(lvds->pclk);
+		return;
+	}
+
+	lvds_serialiser_on(lvds);
+}
+
+static void mchp_lvds_disable(struct drm_bridge *bridge)
+{
+	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
+
+	pm_runtime_put(lvds->dev);
+	clk_disable(lvds->pclk);
+}
+
+static const struct drm_bridge_funcs mchp_lvds_bridge_funcs = {
+	.attach = mchp_lvds_attach,
+	.enable = mchp_lvds_enable,
+	.disable = mchp_lvds_disable,
+};
+
+static int mchp_lvds_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mchp_lvds *lvds;
+	struct resource *res;
+	struct device_node *port;
+	int ret;
+
+	if (!dev->of_node)
+		return -ENODEV;
+
+	lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
+	if (!lvds)
+		return -ENOMEM;
+
+	lvds->dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	lvds->regs = devm_ioremap_resource(lvds->dev, res);
+	if (IS_ERR(lvds->regs))
+		return PTR_ERR(lvds->regs);
+
+	lvds->pclk = devm_clk_get(lvds->dev, "pclk");
+	if (IS_ERR(lvds->pclk)) {
+		DRM_DEV_ERROR(lvds->dev, "could not get pclk_lvds\n");
+		return PTR_ERR(lvds->pclk);
+	}
+
+	ret = clk_prepare(lvds->pclk);
+	if (ret < 0) {
+		DRM_DEV_ERROR(lvds->dev, "failed to prepare pclk_lvds\n");
+		return ret;
+	}
+
+	port = of_graph_get_remote_node(dev->of_node, 1, 0);
+	if (!port) {
+		DRM_DEV_ERROR(dev,
+			      "can't find port point, please init lvds panel port!\n");
+		return -EINVAL;
+	}
+
+	lvds->panel = of_drm_find_panel(port);
+	of_node_put(port);
+
+	if (IS_ERR(lvds->panel)) {
+		DRM_DEV_ERROR(dev, "failed to find panel node\n");
+		return -EPROBE_DEFER;
+	}
+
+	lvds->panel_bridge = devm_drm_panel_bridge_add(dev, lvds->panel);
+
+	if (IS_ERR(lvds->panel_bridge))
+		return PTR_ERR(lvds->panel_bridge);
+
+	lvds->bridge.of_node = dev->of_node;
+	lvds->bridge.type = DRM_MODE_CONNECTOR_LVDS;
+	lvds->bridge.funcs = &mchp_lvds_bridge_funcs;
+
+	dev_set_drvdata(dev, lvds);
+	pm_runtime_enable(dev);
+
+	drm_bridge_add(&lvds->bridge);
+
+	return 0;
+}
+
+static int mchp_lvds_remove(struct platform_device *pdev)
+{
+	struct mchp_lvds *lvds = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+	clk_unprepare(lvds->pclk);
+
+	return 0;
+}
+
+static const struct of_device_id mchp_lvds_dt_ids[] = {
+	{
+		.compatible = "microchip,sam9x7-lvds",
+	},
+	{},
+};
+
+struct platform_driver mchp_lvds_driver = {
+	.probe = mchp_lvds_probe,
+	.remove = mchp_lvds_remove,
+	.driver = {
+		   .name = "microchip-lvds",
+		   .of_match_table = mchp_lvds_dt_ids,
+	},
+};
+module_platform_driver(mchp_lvds_driver);
+
+MODULE_AUTHOR("Manikandan Muralidharan <manikandan.m@microchip.com>");
+MODULE_AUTHOR("Dharma Balasubiramani <dharma.b@microchip.com>");
+MODULE_DESCRIPTION("Low Voltage Differential Signaling Controller Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:microchip-lvds");
-- 
2.25.1

