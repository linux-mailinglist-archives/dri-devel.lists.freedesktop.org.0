Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B01F721153
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jun 2023 19:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FC310E02A;
	Sat,  3 Jun 2023 17:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B42210E02A
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jun 2023 17:08:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F189860F8B;
 Sat,  3 Jun 2023 17:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA83C433D2;
 Sat,  3 Jun 2023 17:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685812083;
 bh=YJn97j6iA20HsijrcP7IiRS2WGaA4roV8+a66M4L3KE=;
 h=From:To:Cc:Subject:Date:From;
 b=Z4c+VOGJ1KBlYOgY0pp+zzTr+kYCs2KChCz+CJ9RhZnjK42+hMV3Ow4/mYyKEb4ub
 arcKdCKjD31hYjRHSIrVPPx/otetnP5SPGRBDOpDMfixCStwF+YFKmrzIQK7E197N4
 dK3YS8XlJQi+V/hx1s0+Utzs/tkTpQx1KeXX8gswMT8qLc720CeRlaJ0HPgmUaQN+0
 dNv32+8Kz1FanK2uJrCWtkHCCkIod2yE/dnCI87Hk0J1M7T7DeadSRncnQIC5NPetM
 +8MQr557VV+TVFlWF6eKxbbsxysxy3YWZvn0Bl2YmFEps8mGn9WJImkKJQ+csPm8ab
 YPgkAVHQgwd3A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] drm/bridge: imx: fix mixed module-builtin object
Date: Sun,  4 Jun 2023 02:07:46 +0900
Message-Id: <20230603170747.1753842-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Liu Ying <victor.liu@nxp.com>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nick Terrell <terrelln@fb.com>, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With CONFIG_DRM_IMX8QM_LDB=m and CONFIG_DRM_IMX8QXP_LDB=y (or vice
versa), imx-ldb-helper.o is linked to a module and also to vmlinux
even though the expected CFLAGS are different between builtins and
modules.

This is the same situation as fixed by commit 637a642f5ca5 ("zstd:
Fixing mixed module-builtin objects").

Turn helpers in imx-ldb-helper.c into inline functions.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/gpu/drm/bridge/imx/Makefile         |   4 +-
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 221 --------------------
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h | 213 +++++++++++++++++--
 3 files changed, 197 insertions(+), 241 deletions(-)
 delete mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c

diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index aa90ec8d5433..64b93009376a 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,7 +1,7 @@
-imx8qm-ldb-objs := imx-ldb-helper.o imx8qm-ldb-drv.o
+imx8qm-ldb-objs := imx8qm-ldb-drv.o
 obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
 
-imx8qxp-ldb-objs := imx-ldb-helper.o imx8qxp-ldb-drv.o
+imx8qxp-ldb-objs := imx8qxp-ldb-drv.o
 obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
 
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
deleted file mode 100644
index 7338b84bc83d..000000000000
--- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
+++ /dev/null
@@ -1,221 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Copyright (C) 2012 Sascha Hauer, Pengutronix
- * Copyright 2019,2020,2022 NXP
- */
-
-#include <linux/media-bus-format.h>
-#include <linux/mfd/syscon.h>
-#include <linux/of.h>
-#include <linux/regmap.h>
-
-#include <drm/drm_bridge.h>
-#include <drm/drm_of.h>
-#include <drm/drm_print.h>
-
-#include "imx-ldb-helper.h"
-
-bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch)
-{
-	return ldb_ch->link_type == LDB_CH_SINGLE_LINK;
-}
-
-bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch)
-{
-	return ldb_ch->link_type == LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS ||
-	       ldb_ch->link_type == LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
-}
-
-int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
-				   struct drm_bridge_state *bridge_state,
-				   struct drm_crtc_state *crtc_state,
-				   struct drm_connector_state *conn_state)
-{
-	struct ldb_channel *ldb_ch = bridge->driver_private;
-
-	ldb_ch->in_bus_format = bridge_state->input_bus_cfg.format;
-	ldb_ch->out_bus_format = bridge_state->output_bus_cfg.format;
-
-	return 0;
-}
-
-void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
-				const struct drm_display_mode *mode,
-				const struct drm_display_mode *adjusted_mode)
-{
-	struct ldb_channel *ldb_ch = bridge->driver_private;
-	struct ldb *ldb = ldb_ch->ldb;
-	bool is_split = ldb_channel_is_split_link(ldb_ch);
-
-	if (is_split)
-		ldb->ldb_ctrl |= LDB_SPLIT_MODE_EN;
-
-	switch (ldb_ch->out_bus_format) {
-	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
-		break;
-	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
-		if (ldb_ch->chno == 0 || is_split)
-			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24;
-		if (ldb_ch->chno == 1 || is_split)
-			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24;
-		break;
-	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
-		if (ldb_ch->chno == 0 || is_split)
-			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24 |
-					 LDB_BIT_MAP_CH0_JEIDA;
-		if (ldb_ch->chno == 1 || is_split)
-			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24 |
-					 LDB_BIT_MAP_CH1_JEIDA;
-		break;
-	}
-}
-
-void ldb_bridge_enable_helper(struct drm_bridge *bridge)
-{
-	struct ldb_channel *ldb_ch = bridge->driver_private;
-	struct ldb *ldb = ldb_ch->ldb;
-
-	/*
-	 * Platform specific bridge drivers should set ldb_ctrl properly
-	 * for the enablement, so just write the ctrl_reg here.
-	 */
-	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
-}
-
-void ldb_bridge_disable_helper(struct drm_bridge *bridge)
-{
-	struct ldb_channel *ldb_ch = bridge->driver_private;
-	struct ldb *ldb = ldb_ch->ldb;
-	bool is_split = ldb_channel_is_split_link(ldb_ch);
-
-	if (ldb_ch->chno == 0 || is_split)
-		ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
-	if (ldb_ch->chno == 1 || is_split)
-		ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
-
-	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
-}
-
-int ldb_bridge_attach_helper(struct drm_bridge *bridge,
-			     enum drm_bridge_attach_flags flags)
-{
-	struct ldb_channel *ldb_ch = bridge->driver_private;
-	struct ldb *ldb = ldb_ch->ldb;
-
-	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
-		DRM_DEV_ERROR(ldb->dev,
-			      "do not support creating a drm_connector\n");
-		return -EINVAL;
-	}
-
-	if (!bridge->encoder) {
-		DRM_DEV_ERROR(ldb->dev, "missing encoder\n");
-		return -ENODEV;
-	}
-
-	return drm_bridge_attach(bridge->encoder,
-				ldb_ch->next_bridge, bridge,
-				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-}
-
-int ldb_init_helper(struct ldb *ldb)
-{
-	struct device *dev = ldb->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *child;
-	int ret;
-	u32 i;
-
-	ldb->regmap = syscon_node_to_regmap(np->parent);
-	if (IS_ERR(ldb->regmap)) {
-		ret = PTR_ERR(ldb->regmap);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
-		return ret;
-	}
-
-	for_each_available_child_of_node(np, child) {
-		struct ldb_channel *ldb_ch;
-
-		ret = of_property_read_u32(child, "reg", &i);
-		if (ret || i > MAX_LDB_CHAN_NUM - 1) {
-			ret = -EINVAL;
-			DRM_DEV_ERROR(dev,
-				      "invalid channel node address: %u\n", i);
-			of_node_put(child);
-			return ret;
-		}
-
-		ldb_ch = ldb->channel[i];
-		ldb_ch->ldb = ldb;
-		ldb_ch->chno = i;
-		ldb_ch->is_available = true;
-		ldb_ch->np = child;
-
-		ldb->available_ch_cnt++;
-	}
-
-	return 0;
-}
-
-int ldb_find_next_bridge_helper(struct ldb *ldb)
-{
-	struct device *dev = ldb->dev;
-	struct ldb_channel *ldb_ch;
-	int ret, i;
-
-	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
-		ldb_ch = ldb->channel[i];
-
-		if (!ldb_ch->is_available)
-			continue;
-
-		ldb_ch->next_bridge = devm_drm_of_get_bridge(dev, ldb_ch->np,
-							     1, 0);
-		if (IS_ERR(ldb_ch->next_bridge)) {
-			ret = PTR_ERR(ldb_ch->next_bridge);
-			if (ret != -EPROBE_DEFER)
-				DRM_DEV_ERROR(dev,
-					      "failed to get next bridge: %d\n",
-					      ret);
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
-void ldb_add_bridge_helper(struct ldb *ldb,
-			   const struct drm_bridge_funcs *bridge_funcs)
-{
-	struct ldb_channel *ldb_ch;
-	int i;
-
-	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
-		ldb_ch = ldb->channel[i];
-
-		if (!ldb_ch->is_available)
-			continue;
-
-		ldb_ch->bridge.driver_private = ldb_ch;
-		ldb_ch->bridge.funcs = bridge_funcs;
-		ldb_ch->bridge.of_node = ldb_ch->np;
-
-		drm_bridge_add(&ldb_ch->bridge);
-	}
-}
-
-void ldb_remove_bridge_helper(struct ldb *ldb)
-{
-	struct ldb_channel *ldb_ch;
-	int i;
-
-	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
-		ldb_ch = ldb->channel[i];
-
-		if (!ldb_ch->is_available)
-			continue;
-
-		drm_bridge_remove(&ldb_ch->bridge);
-	}
-}
diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
index a0a5cde27fbc..42e9b4aa8399 100644
--- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
@@ -65,32 +65,209 @@ struct ldb {
 
 #define bridge_to_ldb_ch(b)	container_of(b, struct ldb_channel, bridge)
 
-bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch);
-bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch);
+static inline bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch)
+{
+	return ldb_ch->link_type == LDB_CH_SINGLE_LINK;
+}
 
-int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
-				   struct drm_bridge_state *bridge_state,
-				   struct drm_crtc_state *crtc_state,
-				   struct drm_connector_state *conn_state);
+static inline bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch)
+{
+	return ldb_ch->link_type == LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS ||
+	       ldb_ch->link_type == LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
+}
 
-void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
-				const struct drm_display_mode *mode,
-				const struct drm_display_mode *adjusted_mode);
+static inline int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
+						 struct drm_bridge_state *bridge_state,
+						 struct drm_crtc_state *crtc_state,
+						 struct drm_connector_state *conn_state)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
 
-void ldb_bridge_enable_helper(struct drm_bridge *bridge);
+	ldb_ch->in_bus_format = bridge_state->input_bus_cfg.format;
+	ldb_ch->out_bus_format = bridge_state->output_bus_cfg.format;
 
-void ldb_bridge_disable_helper(struct drm_bridge *bridge);
+	return 0;
+}
 
-int ldb_bridge_attach_helper(struct drm_bridge *bridge,
-			     enum drm_bridge_attach_flags flags);
+static inline void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
+					      const struct drm_display_mode *mode,
+					      const struct drm_display_mode *adjusted_mode)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
 
-int ldb_init_helper(struct ldb *ldb);
+	if (is_split)
+		ldb->ldb_ctrl |= LDB_SPLIT_MODE_EN;
 
-int ldb_find_next_bridge_helper(struct ldb *ldb);
+	switch (ldb_ch->out_bus_format) {
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		if (ldb_ch->chno == 0 || is_split)
+			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24;
+		if (ldb_ch->chno == 1 || is_split)
+			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		if (ldb_ch->chno == 0 || is_split)
+			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH0_24 |
+					 LDB_BIT_MAP_CH0_JEIDA;
+		if (ldb_ch->chno == 1 || is_split)
+			ldb->ldb_ctrl |= LDB_DATA_WIDTH_CH1_24 |
+					 LDB_BIT_MAP_CH1_JEIDA;
+		break;
+	}
+}
 
-void ldb_add_bridge_helper(struct ldb *ldb,
-			   const struct drm_bridge_funcs *bridge_funcs);
+static inline void ldb_bridge_enable_helper(struct drm_bridge *bridge)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
 
-void ldb_remove_bridge_helper(struct ldb *ldb);
+	/*
+	 * Platform specific bridge drivers should set ldb_ctrl properly
+	 * for the enablement, so just write the ctrl_reg here.
+	 */
+	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
+}
+
+static inline void ldb_bridge_disable_helper(struct drm_bridge *bridge)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+	bool is_split = ldb_channel_is_split_link(ldb_ch);
+
+	if (ldb_ch->chno == 0 || is_split)
+		ldb->ldb_ctrl &= ~LDB_CH0_MODE_EN_MASK;
+	if (ldb_ch->chno == 1 || is_split)
+		ldb->ldb_ctrl &= ~LDB_CH1_MODE_EN_MASK;
+
+	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
+}
+
+static inline int ldb_bridge_attach_helper(struct drm_bridge *bridge,
+					   enum drm_bridge_attach_flags flags)
+{
+	struct ldb_channel *ldb_ch = bridge->driver_private;
+	struct ldb *ldb = ldb_ch->ldb;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		DRM_DEV_ERROR(ldb->dev,
+			      "do not support creating a drm_connector\n");
+		return -EINVAL;
+	}
+
+	if (!bridge->encoder) {
+		DRM_DEV_ERROR(ldb->dev, "missing encoder\n");
+		return -ENODEV;
+	}
+
+	return drm_bridge_attach(bridge->encoder,
+				ldb_ch->next_bridge, bridge,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+}
+
+static inline int ldb_init_helper(struct ldb *ldb)
+{
+	struct device *dev = ldb->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *child;
+	int ret;
+	u32 i;
+
+	ldb->regmap = syscon_node_to_regmap(np->parent);
+	if (IS_ERR(ldb->regmap)) {
+		ret = PTR_ERR(ldb->regmap);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
+		return ret;
+	}
+
+	for_each_available_child_of_node(np, child) {
+		struct ldb_channel *ldb_ch;
+
+		ret = of_property_read_u32(child, "reg", &i);
+		if (ret || i > MAX_LDB_CHAN_NUM - 1) {
+			ret = -EINVAL;
+			DRM_DEV_ERROR(dev,
+				      "invalid channel node address: %u\n", i);
+			of_node_put(child);
+			return ret;
+		}
+
+		ldb_ch = ldb->channel[i];
+		ldb_ch->ldb = ldb;
+		ldb_ch->chno = i;
+		ldb_ch->is_available = true;
+		ldb_ch->np = child;
+
+		ldb->available_ch_cnt++;
+	}
+
+	return 0;
+}
+
+static inline int ldb_find_next_bridge_helper(struct ldb *ldb)
+{
+	struct device *dev = ldb->dev;
+	struct ldb_channel *ldb_ch;
+	int ret, i;
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+		ldb_ch = ldb->channel[i];
+
+		if (!ldb_ch->is_available)
+			continue;
+
+		ldb_ch->next_bridge = devm_drm_of_get_bridge(dev, ldb_ch->np,
+							     1, 0);
+		if (IS_ERR(ldb_ch->next_bridge)) {
+			ret = PTR_ERR(ldb_ch->next_bridge);
+			if (ret != -EPROBE_DEFER)
+				DRM_DEV_ERROR(dev,
+					      "failed to get next bridge: %d\n",
+					      ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static inline void ldb_add_bridge_helper(struct ldb *ldb,
+					 const struct drm_bridge_funcs *bridge_funcs)
+{
+	struct ldb_channel *ldb_ch;
+	int i;
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+		ldb_ch = ldb->channel[i];
+
+		if (!ldb_ch->is_available)
+			continue;
+
+		ldb_ch->bridge.driver_private = ldb_ch;
+		ldb_ch->bridge.funcs = bridge_funcs;
+		ldb_ch->bridge.of_node = ldb_ch->np;
+
+		drm_bridge_add(&ldb_ch->bridge);
+	}
+}
+
+static inline void ldb_remove_bridge_helper(struct ldb *ldb)
+{
+	struct ldb_channel *ldb_ch;
+	int i;
+
+	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
+		ldb_ch = ldb->channel[i];
+
+		if (!ldb_ch->is_available)
+			continue;
+
+		drm_bridge_remove(&ldb_ch->bridge);
+	}
+}
 
 #endif /* __IMX_LDB_HELPER__ */
-- 
2.39.2

