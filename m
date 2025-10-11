Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB73BCF9BE
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFC410E342;
	Sat, 11 Oct 2025 17:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="PW7Y9U7n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397F410E340
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:04:29 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ckVMZ2Lw1z9srG;
 Sat, 11 Oct 2025 19:04:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tjDP8qd2L4y3p6WGuF5y1nQF2MX4DaSUaUT3cZf6lDc=;
 b=PW7Y9U7nQ975964ql1hZgWW2gGjLkliwcjLDu6l3l98DlPcPSHNKzaRxSIdKM/PZlDXxTX
 yN6f0VfZyp9bcCOonGelvmxHrbRjdi74D8zyNygFsF31jGl1PuJOP0YkONCxsYnE/wCnFG
 FLHpoBSi5hXPtwTyfYUqk8oKLC2gLuf8mvCzBfuE44YceelJHmNDYk0cDLV5tA/Nel1+YA
 Rya4ZO7fR07MyzF4/hawEiuEpOw5aV0YT4uiJw6mWA5dejjvQLKdTjwJwmYOaKbwo5rZ9e
 RKtVQoWr9H6TufP2tIh0XzpjoRce67YM/289jE1RgCXPtrWXTQU6XO0xwB7ldA==
From: Marek Vasut <marek.vasut@mailbox.org>
To: dri-devel@lists.freedesktop.org
Cc: Sandor Yu <Sandor.yu@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 33/39] drm: bridge: imx: Add i.MX95 LVDS Display Bridge (LDB)
 driver
Date: Sat, 11 Oct 2025 18:51:48 +0200
Message-ID: <20251011170213.128907-34-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f00d902fcdef00ec43e
X-MBO-RS-META: bnmj4saab33yngubwpdimdhit8tk3q83
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

From: Sandor Yu <Sandor.yu@nxp.com>

Add i.MX95 LVDS Display Bridge (LDB) driver.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
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
 drivers/gpu/drm/bridge/imx/Kconfig          |  10 +
 drivers/gpu/drm/bridge/imx/Makefile         |   1 +
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h |   2 +
 drivers/gpu/drm/bridge/imx/imx95-ldb.c      | 470 ++++++++++++++++++++
 4 files changed, 483 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx95-ldb.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 8baa335deac49..350432f77801c 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -88,6 +88,16 @@ config DRM_IMX93_MIPI_DSI
 	  Choose this to enable MIPI DSI controller found in Freescale i.MX93
 	  processor.
 
+config DRM_IMX95_LDB
+	tristate "Freescale i.MX95 LVDS display bridge"
+	depends on OF
+	depends on COMMON_CLK
+	select DRM_IMX_LDB_HELPER
+	select DRM_KMS_HELPER
+	help
+	  Choose this to enable the internal LVDS Display Bridge(LDB) found in
+	  Freescale i.MX95 processor.
+
 config DRM_IMX95_PIXEL_INTERLEAVER
 	tristate "NXP i.MX95 pixel interleaver"
 	depends on OF && MFD_SYSCON && COMMON_CLK
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index b6b2e1bc8d4bd..1c78cfba16cad 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -8,5 +8,6 @@ obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
 obj-$(CONFIG_DRM_IMX93_MIPI_DSI) += imx93-mipi-dsi.o
+obj-$(CONFIG_DRM_IMX95_LDB) += imx95-ldb.o
 obj-$(CONFIG_DRM_IMX95_PIXEL_INTERLEAVER) += imx95-pixel-interleaver.o
 obj-$(CONFIG_DRM_IMX95_PIXEL_LINK) += imx95-pixel-link.o
diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
index de187e3269996..55fad97c65d2f 100644
--- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
@@ -31,6 +31,8 @@
 #define LDB_BIT_MAP_CH1_JEIDA		BIT(8)
 #define LDB_DI0_VS_POL_ACT_LOW		BIT(9)
 #define LDB_DI1_VS_POL_ACT_LOW		BIT(10)
+#define LDB_DI0_HS_POL_ACT_LOW		BIT(13)
+#define LDB_DI1_HS_POL_ACT_LOW		BIT(14)
 
 #define MAX_LDB_CHAN_NUM		2
 
diff --git a/drivers/gpu/drm/bridge/imx/imx95-ldb.c b/drivers/gpu/drm/bridge/imx/imx95-ldb.c
new file mode 100644
index 0000000000000..19e2d71b9c0c7
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx95-ldb.c
@@ -0,0 +1,470 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2023 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/media-bus-format.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_of.h>
+#include <drm/drm_print.h>
+
+#include "imx-ldb-helper.h"
+
+#define LVDS_PHY_CLK_CTRL		0x00
+#define  LVDS_PHY_DIV2			BIT(0)
+
+#define LDB_DI0_HS_POL_ACT_LOW		BIT(13)
+#define LDB_DI1_HS_POL_ACT_LOW		BIT(14)
+#define LDB_VSYNC_ADJ_EN		BIT(19)
+
+#define DRIVER_NAME			"imx95-ldb"
+
+struct imx95_ldb_channel {
+	struct ldb_channel base;
+};
+
+struct imx95_ldb {
+	struct ldb base;
+	struct device *dev;
+	struct imx95_ldb_channel *channel[MAX_LDB_CHAN_NUM];
+	struct clk *clk_ch[MAX_LDB_CHAN_NUM];
+	struct clk *clk_di[MAX_LDB_CHAN_NUM];
+	int active_chno;
+};
+
+static inline struct imx95_ldb_channel *
+base_to_imx95_ldb_channel(struct ldb_channel *base)
+{
+	return container_of(base, struct imx95_ldb_channel, base);
+}
+
+static inline struct imx95_ldb *base_to_imx95_ldb(struct ldb *base)
+{
+	return container_of(base, struct imx95_ldb, base);
+}
+
+static int imx95_ldb_bridge_atomic_check(struct drm_bridge *bridge,
+					 struct drm_bridge_state *bridge_state,
+					 struct drm_crtc_state *crtc_state,
+					 struct drm_connector_state *conn_state)
+{
+	return ldb_bridge_atomic_check_helper(bridge, bridge_state,
+					     crtc_state, conn_state);
+}
+
+static void
+imx95_ldb_bridge_mode_set(struct drm_bridge *bridge,
+			  const struct drm_display_mode *mode,
+			  const struct drm_display_mode *adjusted_mode)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx95_ldb *imx95_ldb = base_to_imx95_ldb(ldb);
+	struct device *dev = imx95_ldb->dev;
+	unsigned long di_clk = adjusted_mode->clock * 1000;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		dev_err(dev, "failed to get runtime PM sync: %d\n", ret);
+
+	/* set lvds di clock rate */
+	clk_set_rate(imx95_ldb->clk_di[ldb_ch->chno], di_clk);
+
+	ldb->ldb_ctrl |= LDB_VSYNC_ADJ_EN;
+
+	if (ldb_ch->chno == 0 || is_split) {
+		if (adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC)
+			ldb->ldb_ctrl |= LDB_DI0_VS_POL_ACT_LOW;
+		else if (adjusted_mode->flags & DRM_MODE_FLAG_PVSYNC)
+			ldb->ldb_ctrl &= ~LDB_DI0_VS_POL_ACT_LOW;
+
+		if (adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC)
+			ldb->ldb_ctrl |= LDB_DI0_HS_POL_ACT_LOW;
+		else if (adjusted_mode->flags & DRM_MODE_FLAG_PHSYNC)
+			ldb->ldb_ctrl &= ~LDB_DI0_HS_POL_ACT_LOW;
+	}
+	if (ldb_ch->chno == 1 || is_split) {
+		if (adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC)
+			ldb->ldb_ctrl |= LDB_DI1_VS_POL_ACT_LOW;
+		else if (adjusted_mode->flags & DRM_MODE_FLAG_PVSYNC)
+			ldb->ldb_ctrl &= ~LDB_DI1_VS_POL_ACT_LOW;
+
+		if (adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC)
+			ldb->ldb_ctrl |= LDB_DI1_HS_POL_ACT_LOW;
+		else if (adjusted_mode->flags & DRM_MODE_FLAG_PHSYNC)
+			ldb->ldb_ctrl &= ~LDB_DI1_HS_POL_ACT_LOW;
+	}
+
+	ldb_bridge_mode_set_helper(bridge, mode, adjusted_mode);
+}
+
+static void
+imx95_ldb_bridge_atomic_enable(struct drm_bridge *bridge,
+			       struct drm_atomic_state *state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx95_ldb *imx95_ldb = base_to_imx95_ldb(ldb);
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+
+	clk_prepare_enable(imx95_ldb->clk_ch[ldb_ch->chno]);
+	clk_prepare_enable(imx95_ldb->clk_di[ldb_ch->chno]);
+	if (is_split) {
+		clk_prepare_enable(imx95_ldb->clk_ch[ldb_ch->chno ^ 1]);
+		clk_prepare_enable(imx95_ldb->clk_di[ldb_ch->chno ^ 1]);
+	}
+
+	if (ldb_ch->chno == 0 || is_split) {
+		ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
+		ldb->ldb_ctrl |= LDB_CH0_MODE_EN_TO_DI0;
+	}
+	if (ldb_ch->chno == 1 || is_split) {
+		ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
+		ldb->ldb_ctrl |= is_split ?
+			       LDB_CH1_MODE_EN_TO_DI0 : LDB_CH1_MODE_EN_TO_DI1;
+	}
+
+	if (is_split) {
+		/* PHY clock divider 2 */
+		regmap_update_bits(ldb->regmap, LVDS_PHY_CLK_CTRL,
+				   LVDS_PHY_DIV2, LVDS_PHY_DIV2);
+	}
+
+	ldb_bridge_enable_helper(bridge);
+}
+
+static void
+imx95_ldb_bridge_atomic_disable(struct drm_bridge *bridge,
+				struct drm_atomic_state *state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx95_ldb *imx95_ldb = base_to_imx95_ldb(ldb);
+	struct device *dev = imx95_ldb->dev;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+	int ret;
+
+	ldb_bridge_disable_helper(bridge);
+
+	if (is_split) {
+		/* clean PHY clock divider 2 */
+		regmap_update_bits(ldb->regmap, LVDS_PHY_CLK_CTRL, LVDS_PHY_DIV2, 0);
+	}
+
+	if (is_split) {
+		clk_disable_unprepare(imx95_ldb->clk_di[ldb_ch->chno ^ 1]);
+		clk_disable_unprepare(imx95_ldb->clk_ch[ldb_ch->chno ^ 1]);
+	}
+	clk_disable_unprepare(imx95_ldb->clk_di[ldb_ch->chno]);
+	clk_disable_unprepare(imx95_ldb->clk_ch[ldb_ch->chno]);
+
+	ret = pm_runtime_put(dev);
+	if (ret < 0)
+		dev_err(dev, "failed to put runtime PM: %d\n", ret);
+}
+
+static const u32 imx95_ldb_bus_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
+	MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
+	MEDIA_BUS_FMT_FIXED,
+};
+
+static bool imx95_ldb_bus_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx95_ldb_bus_output_fmts); i++) {
+		if (imx95_ldb_bus_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+imx95_ldb_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					   struct drm_bridge_state *bridge_state,
+					   struct drm_crtc_state *crtc_state,
+					   struct drm_connector_state *conn_state,
+					   u32 output_fmt,
+					   unsigned int *num_input_fmts)
+{
+	struct drm_display_info *di;
+	const struct drm_format_info *finfo;
+	u32 *input_fmts;
+
+	if (!imx95_ldb_bus_output_fmt_supported(output_fmt))
+		return NULL;
+
+	*num_input_fmts = 1;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	switch (output_fmt) {
+	case MEDIA_BUS_FMT_FIXED:
+		di = &conn_state->connector->display_info;
+
+		/*
+		 * Look at the first bus format to determine input format.
+		 * Default to MEDIA_BUS_FMT_RGB888_1X36_CPADLO, if no match.
+		 */
+		if (di->num_bus_formats) {
+			finfo = drm_format_info(di->bus_formats[0]);
+
+			input_fmts[0] = finfo->depth == 18 ?
+					MEDIA_BUS_FMT_RGB666_1X36_CPADLO :
+					MEDIA_BUS_FMT_RGB888_1X36_CPADLO;
+		} else {
+			input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X36_CPADLO;
+		}
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X36_CPADLO;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X36_CPADLO;
+		break;
+	default:
+		kfree(input_fmts);
+		input_fmts = NULL;
+		break;
+	}
+
+	return input_fmts;
+}
+
+static u32 *
+imx95_ldb_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
+					    struct drm_bridge_state *bridge_state,
+					    struct drm_crtc_state *crtc_state,
+					    struct drm_connector_state *conn_state,
+					    unsigned int *num_output_fmts)
+{
+	*num_output_fmts = ARRAY_SIZE(imx95_ldb_bus_output_fmts);
+	return kmemdup(imx95_ldb_bus_output_fmts,
+			sizeof(imx95_ldb_bus_output_fmts), GFP_KERNEL);
+}
+
+static enum drm_mode_status
+imx95_ldb_bridge_mode_valid(struct drm_bridge *bridge,
+			    const struct drm_display_info *info,
+			    const struct drm_display_mode *mode)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	struct imx95_ldb *imx95_ldb = base_to_imx95_ldb(ldb);
+	bool is_single = ldb_channel_is_single_link(ldb_ch);
+	struct drm_bridge *next_bridge = bridge;
+	unsigned long pixel_clock_rate;
+	unsigned long rounded_rate;
+
+	if (mode->clock > 330000)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->clock > 165000 && is_single)
+		return MODE_CLOCK_HIGH;
+
+	while (drm_bridge_get_next_bridge(next_bridge))
+		next_bridge = drm_bridge_get_next_bridge(next_bridge);
+
+	if ((next_bridge->ops & DRM_BRIDGE_OP_DETECT) &&
+	    (next_bridge->ops & DRM_BRIDGE_OP_EDID)) {
+		if (imx95_ldb->clk_di[ldb_ch->chno]) {
+			pixel_clock_rate = mode->clock * 1000;
+			rounded_rate = clk_round_rate(imx95_ldb->clk_di[ldb_ch->chno],
+						      pixel_clock_rate);
+			if (rounded_rate != pixel_clock_rate)
+				return MODE_CLOCK_RANGE;
+		}
+	}
+
+	return MODE_OK;
+}
+
+static const struct drm_bridge_funcs imx95_ldb_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.mode_valid		= imx95_ldb_bridge_mode_valid,
+	.attach			= ldb_bridge_attach_helper,
+	.atomic_check		= imx95_ldb_bridge_atomic_check,
+	.mode_set		= imx95_ldb_bridge_mode_set,
+	.atomic_enable		= imx95_ldb_bridge_atomic_enable,
+	.atomic_disable		= imx95_ldb_bridge_atomic_disable,
+	.atomic_get_input_bus_fmts =
+			imx95_ldb_bridge_atomic_get_input_bus_fmts,
+	.atomic_get_output_bus_fmts =
+			imx95_ldb_bridge_atomic_get_output_bus_fmts,
+};
+
+static int imx95_ldb_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imx95_ldb *imx95_ldb;
+	struct imx95_ldb_channel *imx95_ldb_ch;
+	struct ldb *ldb;
+	struct ldb_channel *ldb_ch;
+	struct device_node *port1, *port2;
+	int pixel_order;
+	int ret, i;
+
+	imx95_ldb = devm_kzalloc(dev, sizeof(*imx95_ldb), GFP_KERNEL);
+	if (!imx95_ldb)
+		return -ENOMEM;
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+		char clk_name_ldb_ch[8], clk_name_ldb_di[8];
+
+		snprintf(clk_name_ldb_ch, sizeof(clk_name_ldb_ch), "ldb_ch%d", i);
+		snprintf(clk_name_ldb_di, sizeof(clk_name_ldb_di), "ldb_di%d", i);
+
+		imx95_ldb->clk_ch[i] = devm_clk_get(dev, clk_name_ldb_ch);
+		if (IS_ERR(imx95_ldb->clk_ch[i]))
+			return dev_err_probe(dev, PTR_ERR(imx95_ldb->clk_ch[i]),
+					     "failed to get ldb ch%d clock\n", i);
+
+		imx95_ldb->clk_di[i] = devm_clk_get(dev, clk_name_ldb_di);
+		if (IS_ERR(imx95_ldb->clk_di[i]))
+			return dev_err_probe(dev, PTR_ERR(imx95_ldb->clk_di[i]),
+					     "failed to get ldb di%d clock\n", i);
+	}
+
+	imx95_ldb->dev = dev;
+
+	ldb = &imx95_ldb->base;
+	ldb->dev = dev;
+	ldb->ctrl_reg = 0x4;
+	ldb->ldb_ctrl = 0;
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+		imx95_ldb->channel[i] =
+			devm_drm_bridge_alloc(dev, struct imx95_ldb_channel,
+					      base.bridge, &imx95_ldb_bridge_funcs);
+		if (IS_ERR(imx95_ldb->channel[i]))
+			return PTR_ERR(imx95_ldb->channel[i]);
+	}
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++)
+		ldb->channel[i] = &imx95_ldb->channel[i]->base;
+
+	ret = ldb_init_helper(ldb);
+	if (ret)
+		return ret;
+
+	if (ldb->available_ch_cnt == 0) {
+		dev_dbg(dev, "no available channel\n");
+		return 0;
+	}
+
+	if (ldb->available_ch_cnt == 2) {
+		port1 = of_graph_get_port_by_id(ldb->channel[0]->np, 1);
+		port2 = of_graph_get_port_by_id(ldb->channel[1]->np, 1);
+		pixel_order =
+			drm_of_lvds_get_dual_link_pixel_order(port1, port2);
+		of_node_put(port1);
+		of_node_put(port2);
+
+		if (pixel_order == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
+			dev_err(dev, "invalid dual link pixel order: %d\n", pixel_order);
+			return -EINVAL;
+		}
+
+		imx95_ldb->active_chno = 0;
+		imx95_ldb_ch = imx95_ldb->channel[0];
+		ldb_ch = &imx95_ldb_ch->base;
+		ldb_ch->link_type = pixel_order;
+	} else {
+		for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+			imx95_ldb_ch = imx95_ldb->channel[i];
+			ldb_ch = &imx95_ldb_ch->base;
+
+			if (ldb_ch->is_available) {
+				imx95_ldb->active_chno = ldb_ch->chno;
+				break;
+			}
+		}
+		ldb_ch->link_type = LDB_CH_SINGLE_LINK;
+	}
+
+	ret = ldb_find_next_bridge_helper(ldb);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, imx95_ldb);
+	pm_runtime_enable(dev);
+
+	ldb_add_bridge_helper(ldb);
+
+	return ret;
+}
+
+static void imx95_ldb_remove(struct platform_device *pdev)
+{
+	struct imx95_ldb *imx95_ldb = platform_get_drvdata(pdev);
+	struct ldb *ldb = &imx95_ldb->base;
+
+	ldb_remove_bridge_helper(ldb);
+
+	pm_runtime_disable(&pdev->dev);
+}
+
+static int __maybe_unused imx95_ldb_runtime_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int __maybe_unused imx95_ldb_runtime_resume(struct device *dev)
+{
+	struct imx95_ldb *imx95_ldb = dev_get_drvdata(dev);
+	struct ldb *ldb = &imx95_ldb->base;
+
+	/* disable LDB by resetting the control register to POR default */
+	regmap_write(ldb->regmap, ldb->ctrl_reg, 0);
+
+	return 0;
+}
+
+static const struct dev_pm_ops imx95_ldb_pm_ops = {
+	SET_RUNTIME_PM_OPS(imx95_ldb_runtime_suspend,
+			   imx95_ldb_runtime_resume, NULL)
+};
+
+static const struct of_device_id imx95_ldb_dt_ids[] = {
+	{ .compatible = "fsl,imx95-lvds" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx95_ldb_dt_ids);
+
+static struct platform_driver imx95_ldb_driver = {
+	.probe	= imx95_ldb_probe,
+	.remove = imx95_ldb_remove,
+	.driver	= {
+		.pm = &imx95_ldb_pm_ops,
+		.name = DRIVER_NAME,
+		.of_match_table = imx95_ldb_dt_ids,
+	},
+};
+module_platform_driver(imx95_ldb_driver);
+
+MODULE_DESCRIPTION("i.MX95 LVDS Display Bridge(LDB) bridge driver");
+MODULE_AUTHOR("Sandor Yu <Sandor.yu@nxp.com>");
+MODULE_LICENSE("GPL");
-- 
2.51.0

