Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B954F6412
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 18:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0110F10E3FB;
	Wed,  6 Apr 2022 16:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157B710E3E2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 16:01:42 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nc865-0002Pq-8x; Wed, 06 Apr 2022 18:01:29 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v0 05/10] drm/imx: add driver for HDMI TX Parallel Video
 Interface
Date: Wed,  6 Apr 2022 18:01:18 +0200
Message-Id: <20220406160123.1272911-6-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406160123.1272911-1-l.stach@pengutronix.de>
References: <20220406160123.1272911-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-phy@lists.infradead.org, patchwork-lst@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This IP block is found in the HDMI subsystem of the i.MX8MP SoC. It has a
full timing generator and can switch between different video sources. On
the i.MX8MP however the only supported source is the LCDIF. The block
just needs to be powered up and told about the polarity of the video
sync signals to act in bypass mode.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/imx/bridge/Kconfig        |   8 +
 drivers/gpu/drm/imx/bridge/Makefile       |   1 +
 drivers/gpu/drm/imx/bridge/imx-hdmi-pvi.c | 209 ++++++++++++++++++++++
 3 files changed, 218 insertions(+)
 create mode 100644 drivers/gpu/drm/imx/bridge/imx-hdmi-pvi.c

diff --git a/drivers/gpu/drm/imx/bridge/Kconfig b/drivers/gpu/drm/imx/bridge/Kconfig
index 8b02dc5606ba..486e4b2ad81a 100644
--- a/drivers/gpu/drm/imx/bridge/Kconfig
+++ b/drivers/gpu/drm/imx/bridge/Kconfig
@@ -8,3 +8,11 @@ config DRM_IMX_DW_HDMI_BRIDGE
 	help
 	  Enable support for the internal HDMI encoder on i.MX8MP SoC
 
+config DRM_IMX_HDMI_PVI
+	tristate "HDMI encoder support"
+	depends on (ARCH_MXC && ARM64) || COMPILE_TEST
+	depends on DRM && OF
+	help
+	  Enable support for the internal HDMI TX Parallel Video Interface
+	  found on the i.MX8MP SoC.
+
diff --git a/drivers/gpu/drm/imx/bridge/Makefile b/drivers/gpu/drm/imx/bridge/Makefile
index 1cfe9623c0d8..512ea98722b8 100644
--- a/drivers/gpu/drm/imx/bridge/Makefile
+++ b/drivers/gpu/drm/imx/bridge/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_DRM_IMX_DW_HDMI_BRIDGE)	+= imx-hdmi.o
+obj-$(CONFIG_DRM_IMX_HDMI_PVI)		+= imx-hdmi-pvi.o
diff --git a/drivers/gpu/drm/imx/bridge/imx-hdmi-pvi.c b/drivers/gpu/drm/imx/bridge/imx-hdmi-pvi.c
new file mode 100644
index 000000000000..cdf296858062
--- /dev/null
+++ b/drivers/gpu/drm/imx/bridge/imx-hdmi-pvi.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright (C) 2022 Pengutronix, Lucas Stach <kernel@pengutronix.de>
+ */
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/pm_runtime.h>
+
+#define HTX_PVI_CTL	0x0
+#define  PVI_CTL_OP_VSYNC_POL	BIT(18)
+#define  PVI_CTL_OP_HSYNC_POL	BIT(17)
+#define  PVI_CTL_OP_DE_POL	BIT(16)
+#define  PVI_CTL_INP_VSYNC_POL	BIT(14)
+#define  PVI_CTL_INP_HSYNC_POL	BIT(13)
+#define  PVI_CTL_INP_DE_POL	BIT(12)
+#define  PVI_CTL_INPUT_LCDIF	BIT(2)
+#define  PVI_CTL_EN		BIT(0)
+
+struct imx_hdmi_pvi {
+	struct drm_bridge	bridge;
+	struct device		*dev;
+	struct drm_bridge	*next_bridge;
+	void __iomem		*regs;
+};
+
+static inline struct imx_hdmi_pvi *
+to_imx_hdmi_pvi(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct imx_hdmi_pvi, bridge);
+}
+
+static int imx_hdmi_pvi_bridge_attach(struct drm_bridge *bridge,
+				enum drm_bridge_attach_flags flags)
+{
+	struct imx_hdmi_pvi *pvi = to_imx_hdmi_pvi(bridge);
+
+	return drm_bridge_attach(bridge->encoder, pvi->next_bridge, bridge, flags);
+}
+
+static void imx_hdmi_pvi_bridge_enable(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state)
+{
+	struct drm_atomic_state *state = bridge_state->base.state;
+	struct imx_hdmi_pvi *pvi = to_imx_hdmi_pvi(bridge);
+	struct drm_connector_state *conn_state;
+	const struct drm_display_mode *mode;
+	struct drm_crtc_state *crtc_state;
+	struct drm_connector *connector;
+	u32 bus_flags, val;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (WARN_ON(!connector))
+		return;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (WARN_ON(!conn_state))
+		return;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return;
+
+	if (WARN_ON(pm_runtime_resume_and_get(pvi->dev)))
+		return;
+
+	mode = &crtc_state->adjusted_mode;
+
+	val = PVI_CTL_INPUT_LCDIF;
+
+	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
+		val |= PVI_CTL_OP_VSYNC_POL | PVI_CTL_INP_VSYNC_POL;
+
+	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
+		val |= PVI_CTL_OP_HSYNC_POL | PVI_CTL_INP_HSYNC_POL;
+
+	if (pvi->next_bridge->timings)
+		bus_flags = pvi->next_bridge->timings->input_bus_flags;
+	else if (bridge_state)
+		bus_flags = bridge_state->input_bus_cfg.flags;
+
+	if (bus_flags & DRM_BUS_FLAG_DE_HIGH)
+		val |= PVI_CTL_OP_DE_POL | PVI_CTL_INP_DE_POL;
+
+	writel(val, pvi->regs + HTX_PVI_CTL);
+	val |= PVI_CTL_EN;
+	writel(val, pvi->regs + HTX_PVI_CTL);
+}
+
+static void imx_hdmi_pvi_bridge_disable(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state)
+{
+	struct imx_hdmi_pvi *pvi = to_imx_hdmi_pvi(bridge);
+
+	writel(0x0, pvi->regs + HTX_PVI_CTL);
+
+	pm_runtime_put(pvi->dev);
+}
+
+static u32 *pvi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state,
+					  u32 output_fmt,
+					  unsigned int *num_input_fmts)
+{
+	struct imx_hdmi_pvi *pvi = to_imx_hdmi_pvi(bridge);
+	struct drm_bridge *next_bridge = pvi->next_bridge;
+	struct drm_bridge_state *next_state;
+
+	if (!next_bridge->funcs->atomic_get_input_bus_fmts)
+		return 0;
+
+	next_state = drm_atomic_get_new_bridge_state(crtc_state->state,
+						     next_bridge);
+
+	return next_bridge->funcs->atomic_get_input_bus_fmts(next_bridge,
+							     next_state,
+							     crtc_state,
+							     conn_state,
+							     output_fmt,
+							     num_input_fmts);
+}
+
+static const struct drm_bridge_funcs imx_hdmi_pvi_bridge_funcs = {
+	.attach		= imx_hdmi_pvi_bridge_attach,
+	.atomic_enable	= imx_hdmi_pvi_bridge_enable,
+	.atomic_disable	= imx_hdmi_pvi_bridge_disable,
+	.atomic_get_input_bus_fmts = pvi_bridge_get_input_bus_fmts,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+};
+
+static int imx_hdmi_pvi_probe(struct platform_device *pdev)
+{
+	struct device_node *remote;
+	struct imx_hdmi_pvi *pvi;
+
+	pvi = devm_kzalloc(&pdev->dev, sizeof(*pvi), GFP_KERNEL);
+	if (!pvi)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, pvi);
+	pvi->dev = &pdev->dev;
+
+	pvi->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pvi->regs))
+		return PTR_ERR(pvi->regs);
+
+	/* Get the next bridge in the pipeline. */
+	remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
+	if (!remote)
+		return -EINVAL;
+
+	pvi->next_bridge = of_drm_find_bridge(remote);
+	of_node_put(remote);
+
+	if (!pvi->next_bridge)
+		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
+				     "could not find next bridge\n");
+
+	/* Register the bridge. */
+	pvi->bridge.funcs = &imx_hdmi_pvi_bridge_funcs;
+	pvi->bridge.of_node = pdev->dev.of_node;
+	pvi->bridge.timings = pvi->next_bridge->timings;
+
+	drm_bridge_add(&pvi->bridge);
+
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+}
+
+static int imx_hdmi_pvi_remove(struct platform_device *pdev)
+{
+	struct imx_hdmi_pvi *pvi = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&pvi->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id imx_hdmi_pvi_match[] = {
+	{
+		.compatible = "fsl,imx8mp-hdmi-pvi",
+	}, {
+		/* sentinel */
+	},
+};
+MODULE_DEVICE_TABLE(of, imx_hdmi_pvi_match);
+
+static struct platform_driver imx_hdmi_pvi_driver = {
+	.probe	= imx_hdmi_pvi_probe,
+	.remove	= imx_hdmi_pvi_remove,
+	.driver		= {
+		.name = "imx-hdmi-pvi",
+		.of_match_table	= imx_hdmi_pvi_match,
+	},
+};
+module_platform_driver(imx_hdmi_pvi_driver);
+
+MODULE_DESCRIPTION("i.MX8MP HDMI TX Parallel Video Interface bridge driver");
+MODULE_LICENSE("GPL");
-- 
2.30.2

