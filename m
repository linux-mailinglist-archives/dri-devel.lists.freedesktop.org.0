Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE998722514
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 14:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0F510E295;
	Mon,  5 Jun 2023 12:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0E110E29F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 12:00:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1393C62312;
 Mon,  5 Jun 2023 12:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69A9C433EF;
 Mon,  5 Jun 2023 12:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685966443;
 bh=kfbk3hOkmnywwFv/S2NyjZP/fcC6qc/lEB2wv6BgwAE=;
 h=From:To:Cc:Subject:Date:From;
 b=dcm1pLPbRliA4HEfxQpwnenvf9MqT032BiTxY+XIDpjKUGeff6fxkYTJGsp4eA/V9
 X7fD2FsynBFmB3QGCksv9t79IUelYCxsvZcv47pG7YyMQTjFKLB4Cxb9KY5RHVradX
 8s21MHKxkRvRapw3oNylYJbIaSYEaKLelMWiq9cpFjQTJx7cJu8WXv0vA2Frl1Lxy0
 ea4XIjE35D9Uchqs9X37ZOmf9DKh6geL2UxXX3MTxHxB0SZRYs1SF8NYG9ZoRDktxx
 saM7ZRmuQsNIOaqeEVg5CSADg6W1YVhx7UZgi7R8T7KL5XMtWvAaSopKRkBKRh0OVi
 dEWDehpOkE10A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/bridge: imx: fix mixed module-builtin object
Date: Mon,  5 Jun 2023 21:00:20 +0900
Message-Id: <20230605120021.1774711-1-masahiroy@kernel.org>
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
 linux-kernel@vger.kernel.org, Nick Terrell <terrelln@fb.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With CONFIG_DRM_IMX8QM_LDB=m and CONFIG_DRM_IMX8QXP_LDB=y (or vice
versa), imx-ldb-helper.o is linked to a module and also to vmlinux
even though the expected CFLAGS are different between builtins and
modules.

This is the same situation as fixed by commit 637a642f5ca5 ("zstd:
Fixing mixed module-builtin objects").

Split imx-ldb-helper.c into a separate module.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Liu Ying <victor.liu@nxp.com>
---

Changes in v3:
 - Remove MODULE_ALIAS()

Changes in v2:
 - Add a separate module instead of making the functions static inline

 drivers/gpu/drm/bridge/imx/Kconfig          |  5 +++++
 drivers/gpu/drm/bridge/imx/Makefile         |  5 +++--
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 17 +++++++++++++++++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 608f47f41bcd..9fae28db6aa7 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -1,9 +1,13 @@
 if ARCH_MXC || COMPILE_TEST
 
+config DRM_IMX_LDB_HELPER
+	tristate
+
 config DRM_IMX8QM_LDB
 	tristate "Freescale i.MX8QM LVDS display bridge"
 	depends on OF
 	depends on COMMON_CLK
+	select DRM_IMX_LDB_HELPER
 	select DRM_KMS_HELPER
 	help
 	  Choose this to enable the internal LVDS Display Bridge(LDB) found in
@@ -13,6 +17,7 @@ config DRM_IMX8QXP_LDB
 	tristate "Freescale i.MX8QXP LVDS display bridge"
 	depends on OF
 	depends on COMMON_CLK
+	select DRM_IMX_LDB_HELPER
 	select DRM_KMS_HELPER
 	help
 	  Choose this to enable the internal LVDS Display Bridge(LDB) found in
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index aa90ec8d5433..5fc821278693 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,7 +1,8 @@
-imx8qm-ldb-objs := imx-ldb-helper.o imx8qm-ldb-drv.o
+obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
+imx8qm-ldb-objs := imx8qm-ldb-drv.o
 obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
 
-imx8qxp-ldb-objs := imx-ldb-helper.o imx8qxp-ldb-drv.o
+imx8qxp-ldb-objs := imx8qxp-ldb-drv.o
 obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
 
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
index 7338b84bc83d..6967325cd8ee 100644
--- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
@@ -4,8 +4,10 @@
  * Copyright 2019,2020,2022 NXP
  */
 
+#include <linux/export.h>
 #include <linux/media-bus-format.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
 
@@ -19,12 +21,14 @@ bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch)
 {
 	return ldb_ch->link_type == LDB_CH_SINGLE_LINK;
 }
+EXPORT_SYMBOL_GPL(ldb_channel_is_single_link);
 
 bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch)
 {
 	return ldb_ch->link_type == LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS ||
 	       ldb_ch->link_type == LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
 }
+EXPORT_SYMBOL_GPL(ldb_channel_is_split_link);
 
 int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
 				   struct drm_bridge_state *bridge_state,
@@ -38,6 +42,7 @@ int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(ldb_bridge_atomic_check_helper);
 
 void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
 				const struct drm_display_mode *mode,
@@ -69,6 +74,7 @@ void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
 		break;
 	}
 }
+EXPORT_SYMBOL_GPL(ldb_bridge_mode_set_helper);
 
 void ldb_bridge_enable_helper(struct drm_bridge *bridge)
 {
@@ -81,6 +87,7 @@ void ldb_bridge_enable_helper(struct drm_bridge *bridge)
 	 */
 	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
 }
+EXPORT_SYMBOL_GPL(ldb_bridge_enable_helper);
 
 void ldb_bridge_disable_helper(struct drm_bridge *bridge)
 {
@@ -95,6 +102,7 @@ void ldb_bridge_disable_helper(struct drm_bridge *bridge)
 
 	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
 }
+EXPORT_SYMBOL_GPL(ldb_bridge_disable_helper);
 
 int ldb_bridge_attach_helper(struct drm_bridge *bridge,
 			     enum drm_bridge_attach_flags flags)
@@ -117,6 +125,7 @@ int ldb_bridge_attach_helper(struct drm_bridge *bridge,
 				ldb_ch->next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 }
+EXPORT_SYMBOL_GPL(ldb_bridge_attach_helper);
 
 int ldb_init_helper(struct ldb *ldb)
 {
@@ -157,6 +166,7 @@ int ldb_init_helper(struct ldb *ldb)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(ldb_init_helper);
 
 int ldb_find_next_bridge_helper(struct ldb *ldb)
 {
@@ -184,6 +194,7 @@ int ldb_find_next_bridge_helper(struct ldb *ldb)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(ldb_find_next_bridge_helper);
 
 void ldb_add_bridge_helper(struct ldb *ldb,
 			   const struct drm_bridge_funcs *bridge_funcs)
@@ -204,6 +215,7 @@ void ldb_add_bridge_helper(struct ldb *ldb,
 		drm_bridge_add(&ldb_ch->bridge);
 	}
 }
+EXPORT_SYMBOL_GPL(ldb_add_bridge_helper);
 
 void ldb_remove_bridge_helper(struct ldb *ldb)
 {
@@ -219,3 +231,8 @@ void ldb_remove_bridge_helper(struct ldb *ldb)
 		drm_bridge_remove(&ldb_ch->bridge);
 	}
 }
+EXPORT_SYMBOL_GPL(ldb_remove_bridge_helper);
+
+MODULE_DESCRIPTION("i.MX8 LVDS Display Bridge(LDB)/Pixel Mapper bridge helper");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL");
-- 
2.39.2

