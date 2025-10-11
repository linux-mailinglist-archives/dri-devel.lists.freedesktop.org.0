Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24441BCF973
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7E910E335;
	Sat, 11 Oct 2025 17:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="V/NBhwku";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="flYZoeLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7132D10E336
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:04:07 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ckVMB1Fvfz9tX0;
 Sat, 11 Oct 2025 19:04:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=akAwwF92F0bL8qDhbAfkRRIHkYWWhZlXcSimxJHfzsM=;
 b=V/NBhwkugsuOQZHJ1WnG6sfmaUaEYWmE43903UXrcIaimAp1lACUfAv+QHqUsP/w7vUhuY
 L6iwrosCLBzvSQdXZALC8BDxbwNBNwnnwKqIiX1hnCIBuj+060MbKzueVNt+L3KS2+T1W7
 KwBdxborO+TPNHJmzdyu/m6fgXuz3qyr6mWHgJe9/DQGb8omuN/zdicpPPX47PvYjpB3bM
 d/Y+qbbnocp+5JmccX3O2rGX7cNjVL/ZZaM8pnZqlfYgSHMumOZCEVhqaPBrThEwRAtBay
 DeIMxqIothatZBi8ykMjVT3HWUz4eXx66KKeiKBp35gvgnc3ivKoBz+UQQ96Uw==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=flYZoeLq;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=akAwwF92F0bL8qDhbAfkRRIHkYWWhZlXcSimxJHfzsM=;
 b=flYZoeLqo+zdn3oj7YA7Bzek7fwaZpbslGk5hYteXOnbFNz5iRN/5EvniLpbxNBgieZNNU
 /uO9c27hGibSh/VBbXUoArr04UZOKjIVQsNNsApDEKexVa+4xRZdK+d5ZEwomm/M+xxuto
 tlqwzFTNImW8d2YYUO1g/xAze0bvEBfG5lndmvdz/8CpLo/tMqRoCyanPAiXpVoly2icKK
 VbsbXJvdQLRJ+AmtpzQbG8XDkQBQp6ibZlSY7Jm6jgH8qcb1EeGc1+PaJ3BnOlNs1zvdcF
 qt6WZK+nd2ZZu6fGDIp8a0u4Q+QjmXe1Efs7l97CgYiNLW4RVT9g+KT8VKW9NQ==
To: dri-devel@lists.freedesktop.org
Cc: Liu Ying <victor.liu@nxp.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 26/39] drm/bridge: imx: Add NXP i.MX95 pixel interleaver
 support
Date: Sat, 11 Oct 2025 18:51:41 +0200
Message-ID: <20251011170213.128907-27-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 421cb1fb8e538102114
X-MBO-RS-META: r9yqd9xepapd5wwiy4b87ttwgzstkoqx
X-Rspamd-Queue-Id: 4ckVMB1Fvfz9tX0
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

From: Liu Ying <victor.liu@nxp.com>

Add NXP i.MX95 pixel interleaver support.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/bridge/imx/Kconfig            |   9 +
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 .../drm/bridge/imx/imx95-pixel-interleaver.c  | 217 ++++++++++++++++++
 3 files changed, 227 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx95-pixel-interleaver.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 9a480c6abb856..3e1b1d825d7bf 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -88,4 +88,13 @@ config DRM_IMX93_MIPI_DSI
 	  Choose this to enable MIPI DSI controller found in Freescale i.MX93
 	  processor.
 
+config DRM_IMX95_PIXEL_INTERLEAVER
+	tristate "NXP i.MX95 pixel interleaver"
+	depends on OF && MFD_SYSCON && COMMON_CLK
+	select DRM_KMS_HELPER
+	select REGMAP_MMIO
+	help
+	  Choose this to enable pixel interleaver found in NXP i.MX95
+	  processors.
+
 endif # ARCH_MXC || COMPILE_TEST
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index dd5d485848066..583054c70f002 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
 obj-$(CONFIG_DRM_IMX93_MIPI_DSI) += imx93-mipi-dsi.o
+obj-$(CONFIG_DRM_IMX95_PIXEL_INTERLEAVER) += imx95-pixel-interleaver.o
diff --git a/drivers/gpu/drm/bridge/imx/imx95-pixel-interleaver.c b/drivers/gpu/drm/bridge/imx/imx95-pixel-interleaver.c
new file mode 100644
index 0000000000000..e6d96e68db895
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx95-pixel-interleaver.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2023 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/media-bus-format.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+
+#define PIXEL_INTERLEAVER_CTRL	0x4
+#define  DISP_IN_SEL		BIT(1)
+#define  MODE			BIT(0)
+
+#define CTRL			0x0
+#define  VSYNC_POLARITY		BIT(10)
+#define  HSYNC_POLARITY		BIT(9)
+
+#define SWRST			0x20
+#define  SW_RST			BIT(1)
+
+#define IE			0x30
+
+#define DRIVER_NAME		"imx95-pixel-interleaver"
+
+struct imx95_pixel_interleaver_bridge {
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct device *dev;
+	void __iomem *regs;
+	struct regmap *regmap;
+	struct clk *clk_bus;
+};
+
+static void
+imx95_pixel_interleaver_bridge_sw_reset(struct imx95_pixel_interleaver_bridge *pi)
+{
+	clk_prepare_enable(pi->clk_bus);
+
+	writel(SW_RST, pi->regs + SWRST);
+	usleep_range(10, 20);
+	writel(0, pi->regs + SWRST);
+
+	clk_disable_unprepare(pi->clk_bus);
+}
+
+static int
+imx95_pixel_interleaver_bridge_attach(struct drm_bridge *bridge,
+					     struct drm_encoder *encoder,
+					     enum drm_bridge_attach_flags flags)
+{
+	struct imx95_pixel_interleaver_bridge *pi = bridge->driver_private;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		dev_err(pi->dev, "do not support creating a drm_connector\n");
+		return -EINVAL;
+	}
+
+	return drm_bridge_attach(encoder, pi->next_bridge, bridge,
+				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+}
+
+static void
+imx95_pixel_interleaver_bridge_mode_set(struct drm_bridge *bridge,
+					       const struct drm_display_mode *mode,
+					       const struct drm_display_mode *adjusted_mode)
+{
+	struct imx95_pixel_interleaver_bridge *pi = bridge->driver_private;
+
+	imx95_pixel_interleaver_bridge_sw_reset(pi);
+
+	clk_prepare_enable(pi->clk_bus);
+
+	/* HSYNC and VSYNC are active low. Data Enable is active high */
+	writel(HSYNC_POLARITY | VSYNC_POLARITY, pi->regs + CTRL);
+
+	/* Disable interrupts */
+	writel(0, pi->regs + IE);
+
+	clk_disable_unprepare(pi->clk_bus);
+}
+
+static void
+imx95_pixel_interleaver_bridge_enable(struct drm_bridge *bridge)
+{
+	struct imx95_pixel_interleaver_bridge *pi = bridge->driver_private;
+
+	regmap_write(pi->regmap, PIXEL_INTERLEAVER_CTRL, 0);
+}
+
+static u32 *
+imx95_pixel_interleaver_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+							 struct drm_bridge_state *bridge_state,
+							 struct drm_crtc_state *crtc_state,
+							 struct drm_connector_state *conn_state,
+							 u32 output_fmt,
+							 unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	if (output_fmt != MEDIA_BUS_FMT_RGB888_1X24)
+		return NULL;
+
+	*num_input_fmts = 1;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+
+	return input_fmts;
+}
+
+static const struct drm_bridge_funcs imx95_pixel_interleaver_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.attach			= imx95_pixel_interleaver_bridge_attach,
+	.mode_set		= imx95_pixel_interleaver_bridge_mode_set,
+	.enable			= imx95_pixel_interleaver_bridge_enable,
+	.atomic_get_input_bus_fmts =
+				imx95_pixel_interleaver_bridge_atomic_get_input_bus_fmts,
+};
+
+static int imx95_pixel_interleaver_bridge_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *remote, *remote_port, *np = dev->of_node;
+	struct imx95_pixel_interleaver_bridge *pi;
+
+	pi = devm_drm_bridge_alloc(dev, struct imx95_pixel_interleaver_bridge, bridge,
+				   &imx95_pixel_interleaver_bridge_funcs);
+	if (IS_ERR(pi))
+		return PTR_ERR(pi);
+
+	pi->dev = dev;
+	platform_set_drvdata(pdev, pi);
+
+	pi->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pi->regs))
+		return PTR_ERR(pi->regs);
+
+	pi->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,syscon");
+	if (IS_ERR(pi->regmap))
+		return dev_err_probe(dev, PTR_ERR(pi->regmap), "failed to get regmap\n");
+
+	pi->clk_bus = devm_clk_get(dev, NULL);
+	if (IS_ERR(pi->clk_bus))
+		return dev_err_probe(dev, PTR_ERR(pi->clk_bus), "failed to get clock\n");
+
+	pi->bridge.driver_private = pi;
+	pi->bridge.of_node = np;
+
+	remote = of_graph_get_remote_node(np, 1, 0);
+	if (!remote)
+		return dev_err_probe(dev, -EINVAL, "no remote node for port@1 endpoint\n");
+
+	remote_port = of_graph_get_port_by_id(remote, 0);
+	of_node_put(remote);
+	if (!remote_port)
+		return dev_err_probe(dev, -EINVAL, "no remote port\n");
+
+	pi->next_bridge = of_drm_find_bridge(remote_port);
+	of_node_put(remote_port);
+	if (!pi->next_bridge) {
+		dev_err(dev, "failed to find next bridge for port@1 endpoint\n");
+		return -EPROBE_DEFER;
+	}
+
+	imx95_pixel_interleaver_bridge_sw_reset(pi);
+
+	drm_bridge_add(&pi->bridge);
+
+	return 0;
+}
+
+static void imx95_pixel_interleaver_bridge_remove(struct platform_device *pdev)
+{
+	struct imx95_pixel_interleaver_bridge *pi = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&pi->bridge);
+}
+
+static const struct of_device_id imx95_pixel_interleaver_bridge_dt_ids[] = {
+	{ .compatible = "fsl,imx95-pixel-interleaver", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx95_pixel_interleaver_bridge_dt_ids);
+
+static struct platform_driver imx95_pixel_interleaver_bridge_driver = {
+	.probe	= imx95_pixel_interleaver_bridge_probe,
+	.remove	= imx95_pixel_interleaver_bridge_remove,
+	.driver	= {
+		.of_match_table = imx95_pixel_interleaver_bridge_dt_ids,
+		.name = DRIVER_NAME,
+	},
+};
+
+module_platform_driver(imx95_pixel_interleaver_bridge_driver);
+
+MODULE_DESCRIPTION("i.MX95 display pixel interleaver bridge driver");
+MODULE_AUTHOR("NXP Semiconductor");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.51.0

