Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9109BCF98E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D5010E33E;
	Sat, 11 Oct 2025 17:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="s9ByYmY/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JEjGKGlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F7010E33C
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:04:13 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ckVMH6spdz9srG;
 Sat, 11 Oct 2025 19:04:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wH5Oywl+53G65dp8ULRyl1Gb1Vx4oyWZL4/EGnhp3CA=;
 b=s9ByYmY/V3UCNoI3qv2JObgbp7q6z0s5hCoYuyd5BcMULVt+H2DveSEX1lMYn6CaLX4cjK
 gNFzeKHCRCBMsiC8gnvupfvmsLSTj53T+gnFo4yWwbnJ5DsOi50nQTzIQ+xLf4yD4uB7qs
 G1pYA5jqMOKwDPCGP8tvs8Dc5hN7MamPlOjCG+XGCsBBWCDI4BEunMeyt3jpByXyOxHsjs
 rYUrluXzHw5s9GvZQhMLGXB/xJCNkO9429AeN+KEIlT84znxmIzozToE6dYMAz4QKgbKn2
 qQ/22QeKJIJ86DavcG6uEzSxYblH6VHJzUOW39YRSQWrSbMnoi7vGeCkLlhX2Q==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wH5Oywl+53G65dp8ULRyl1Gb1Vx4oyWZL4/EGnhp3CA=;
 b=JEjGKGlJQQiz71zkDIx8/sSTS5HUm8PdKqy1NJoYUhja4OZ+gNeRjGarL+Zs4CQNn5gs6x
 iIsYJcw5Z92cl9KIJ781UMGNOKoYk5MGYDTHUfp4//MP9xpOAeuhX0U/c4ov4Hb/B9oOF7
 GeprK87JQSGAP6fEnjwjjnLoF84xTS1bvebMlJ1iScoIPThrUs5rrlw3ee0PAjM83GsMku
 yESlCT5cQrU+9dclNX+UFV4mE/BTwLFTJkT9BW8joMNpE+NInV8lBg0Ioja4JU6qCR6YSg
 +nsaPTwcw9Jsz7t7OJxYo72sQoQujz135IcAb/+d44KbZBjdVU8dGd8LQMCnlQ==
To: dri-devel@lists.freedesktop.org
Cc: Liu Ying <victor.liu@nxp.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Sandor Yu <Sandor.yu@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 28/39] drm/bridge: imx: Add NXP i.MX95 pixel link support
Date: Sat, 11 Oct 2025 18:51:43 +0200
Message-ID: <20251011170213.128907-29-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6bb21575346cb44c0a1
X-MBO-RS-META: d9x9ksg3dmityi96ijfr5ex4tsykdr9t
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

Add NXP i.MX95 pixel link bridge support.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Sandor Yu <Sandor.yu@nxp.com>
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
 drivers/gpu/drm/bridge/imx/imx95-pixel-link.c | 184 ++++++++++++++++++
 3 files changed, 194 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx95-pixel-link.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 3e1b1d825d7bf..8baa335deac49 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -97,4 +97,13 @@ config DRM_IMX95_PIXEL_INTERLEAVER
 	  Choose this to enable pixel interleaver found in NXP i.MX95
 	  processors.
 
+config DRM_IMX95_PIXEL_LINK
+	tristate "NXP i.MX95 display pixel link"
+	depends on OF && MFD_SYSCON
+	select DRM_KMS_HELPER
+	select REGMAP_MMIO
+	help
+	  Choose this to enable display pixel link found in NXP i.MX95
+	  processors.
+
 endif # ARCH_MXC || COMPILE_TEST
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index 583054c70f002..b6b2e1bc8d4bd 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
 obj-$(CONFIG_DRM_IMX93_MIPI_DSI) += imx93-mipi-dsi.o
 obj-$(CONFIG_DRM_IMX95_PIXEL_INTERLEAVER) += imx95-pixel-interleaver.o
+obj-$(CONFIG_DRM_IMX95_PIXEL_LINK) += imx95-pixel-link.o
diff --git a/drivers/gpu/drm/bridge/imx/imx95-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx95-pixel-link.c
new file mode 100644
index 0000000000000..747d2d77b59ef
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx95-pixel-link.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2023 NXP
+ */
+
+#include <linux/bits.h>
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
+#define CTRL		0x8
+#define  PL_VALID(n)	BIT(1 + 4 * (n))
+#define  PL_ENABLE(n)	BIT(4 * (n))
+
+#define OUT_ENDPOINTS	2
+
+#define DRIVER_NAME	"imx95-pixel-link"
+
+struct imx95_pixel_link_bridge {
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct device *dev;
+	struct regmap *regmap;
+	u8 stream_id;
+};
+
+static int imx95_pixel_link_bridge_attach(struct drm_bridge *bridge,
+					  struct drm_encoder *encoder,
+					  enum drm_bridge_attach_flags flags)
+{
+	struct imx95_pixel_link_bridge *pl = bridge->driver_private;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		dev_err(pl->dev, "do not support creating a drm_connector\n");
+		return -EINVAL;
+	}
+
+	return drm_bridge_attach(encoder, pl->next_bridge, bridge,
+				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+}
+
+static void imx95_pixel_link_bridge_disable(struct drm_bridge *bridge)
+{
+	struct imx95_pixel_link_bridge *pl = bridge->driver_private;
+	unsigned int id = pl->stream_id;
+
+	regmap_update_bits(pl->regmap, CTRL, PL_ENABLE(id), 0);
+	regmap_update_bits(pl->regmap, CTRL, PL_VALID(id), 0);
+}
+
+static void imx95_pixel_link_bridge_enable(struct drm_bridge *bridge)
+{
+	struct imx95_pixel_link_bridge *pl = bridge->driver_private;
+	unsigned int id = pl->stream_id;
+
+	regmap_update_bits(pl->regmap, CTRL, PL_VALID(id), PL_VALID(id));
+	regmap_update_bits(pl->regmap, CTRL, PL_ENABLE(id), PL_ENABLE(id));
+}
+
+static u32 *
+imx95_pixel_link_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+						  struct drm_bridge_state *bridge_state,
+						  struct drm_crtc_state *crtc_state,
+						  struct drm_connector_state *conn_state,
+						  u32 output_fmt,
+						  unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	if (output_fmt != MEDIA_BUS_FMT_RGB888_1X36_CPADLO &&
+	    output_fmt != MEDIA_BUS_FMT_FIXED)
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
+static const struct drm_bridge_funcs imx95_pixel_link_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.attach			= imx95_pixel_link_bridge_attach,
+	.disable		= imx95_pixel_link_bridge_disable,
+	.enable			= imx95_pixel_link_bridge_enable,
+	.atomic_get_input_bus_fmts =
+				imx95_pixel_link_bridge_atomic_get_input_bus_fmts,
+};
+
+static int imx95_pixel_link_bridge_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *remote, *np = dev->of_node;
+	struct imx95_pixel_link_bridge *pl;
+	int i, ret;
+
+	pl = devm_drm_bridge_alloc(dev, struct imx95_pixel_link_bridge, bridge,
+				   &imx95_pixel_link_bridge_funcs);
+	if (IS_ERR(pl))
+		return PTR_ERR(pl);
+
+	pl->dev = dev;
+	platform_set_drvdata(pdev, pl);
+
+	pl->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,syscon");
+	if (IS_ERR(pl->regmap))
+		return dev_err_probe(dev, PTR_ERR(pl->regmap), "failed to get regmap\n");
+
+	ret = of_property_read_u8(np, "fsl,dc-stream-id", &pl->stream_id);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get stream index\n");
+
+	pl->bridge.driver_private = pl;
+	pl->bridge.of_node = of_graph_get_port_by_id(np, 0);
+	if (!pl->bridge.of_node)
+		return dev_err_probe(dev, -ENODEV, "failed to get port@0\n");
+	of_node_put(pl->bridge.of_node);
+
+	for (i = 0; i < OUT_ENDPOINTS; i++) {
+		remote = of_graph_get_remote_node(np, 1, i);
+		if (!remote) {
+			dev_dbg(dev, "no remote node for port@1 ep%u\n", i);
+			continue;
+		}
+
+		pl->next_bridge = of_drm_find_bridge(remote);
+		if (!pl->next_bridge) {
+			dev_dbg(dev, "failed to find next bridge for port@1 ep%u\n", i);
+			of_node_put(remote);
+			return -EPROBE_DEFER;
+		}
+
+		of_node_put(remote);
+
+		drm_bridge_add(&pl->bridge);
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static void imx95_pixel_link_bridge_remove(struct platform_device *pdev)
+{
+	struct imx95_pixel_link_bridge *pl = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&pl->bridge);
+}
+
+static const struct of_device_id imx95_pixel_link_bridge_dt_ids[] = {
+	{ .compatible = "fsl,imx95-dc-pixel-link", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx95_pixel_link_bridge_dt_ids);
+
+static struct platform_driver imx95_pixel_link_bridge_driver = {
+	.probe	= imx95_pixel_link_bridge_probe,
+	.remove	= imx95_pixel_link_bridge_remove,
+	.driver	= {
+		.of_match_table = imx95_pixel_link_bridge_dt_ids,
+		.name = DRIVER_NAME,
+	},
+};
+
+module_platform_driver(imx95_pixel_link_bridge_driver);
+
+MODULE_DESCRIPTION("i.MX95 display pixel link bridge driver");
+MODULE_AUTHOR("NXP Semiconductor");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRIVER_NAME);
-- 
2.51.0

