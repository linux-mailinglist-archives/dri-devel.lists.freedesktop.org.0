Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727D992E347
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 11:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE90910E9C8;
	Thu, 11 Jul 2024 09:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="cGJ5E1pv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id DBF3510E9CE
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 09:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=lCt6G
 meRArF+8nUi6YqN2qNoWrWjqPoXRRKGa+JcmaQ=; b=cGJ5E1pvgWniLR7qe03g7
 t73P+5lb1lZ1BwaJDUwGcdk+8XHcITbKKJ3i7r7ByUHVjNHkPglwgYc2sASzwWpd
 SSJdQ4xJQnn/bWK5qpLKK9fY7dAbOr98Dn1OBOBtyck6YqDNOheE0XpzvFKKENpz
 g11etsTzAb06CEhBw0XvAA=
Received: from localhost.localdomain (unknown [111.48.69.247])
 by gzga-smtp-mta-g3-1 (Coremail) with SMTP id _____wCXb29Qn49mDOmHBA--.34288S2;
 Thu, 11 Jul 2024 17:01:05 +0800 (CST)
From: oushixiong1025@163.com
To: Dave Airlie <airlied@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/ast: add multiple connectors support
Date: Thu, 11 Jul 2024 17:01:02 +0800
Message-Id: <20240711090102.352213-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXb29Qn49mDOmHBA--.34288S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3JF45Kw1DJFyfJF15CFyxGrg_yoWxtrW7pr
 W8trZavr48XrsxWFn8AF4kGrnIyF9FyayUtr1rWw4a9w1kGw1DAF48Jrs8Za4DGrZ5AFyU
 JanFqF47C3WUuw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5BMtUUUUU=
X-Originating-IP: [111.48.69.247]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXRQZD2XAmK5qkwAAs1
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

From: Shixiong Ou <oushixiong@kylinos.cn>

[WHY]
The AST2600 tx_chip_types will be detected as AST_TX_DP, but some BMC
boards that use AST2600 use the VGA interface instead of the DP interface.
In this case, it will use Virtual connector as the DP is disconnected.

[HOW]
Allows multiple physical connectors to exist at the same time.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/ast/ast_drv.h  |  6 ++++-
 drivers/gpu/drm/ast/ast_main.c |  8 +++----
 drivers/gpu/drm/ast/ast_mode.c | 40 ++++++++++++++++++++--------------
 3 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index ba3d86973995..e326124b3fec 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -150,9 +150,13 @@ static inline struct ast_plane *to_ast_plane(struct drm_plane *plane)
  * BMC
  */
 
+#define MAX_CONNECTORS 2
+
 struct ast_bmc_connector {
 	struct drm_connector base;
-	struct drm_connector *physical_connector;
+
+	struct drm_connector *physical_connectors[MAX_CONNECTORS];
+	int count;
 };
 
 static inline struct ast_bmc_connector *
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 0637abb70361..428529749ae6 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -85,7 +85,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 	if (!need_post) {
 		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
 		if (jreg & 0x80)
-			ast->tx_chip_types = AST_TX_SIL164_BIT;
+			ast->tx_chip_types |= AST_TX_SIL164_BIT;
 	}
 
 	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast)) {
@@ -97,7 +97,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, 0xff);
 		switch (jreg) {
 		case 0x04:
-			ast->tx_chip_types = AST_TX_SIL164_BIT;
+			ast->tx_chip_types |= AST_TX_SIL164_BIT;
 			break;
 		case 0x08:
 			ast->dp501_fw_addr = drmm_kzalloc(dev, 32*1024, GFP_KERNEL);
@@ -110,12 +110,12 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 			}
 			fallthrough;
 		case 0x0c:
-			ast->tx_chip_types = AST_TX_DP501_BIT;
+			ast->tx_chip_types |= AST_TX_DP501_BIT;
 		}
 	} else if (IS_AST_GEN7(ast)) {
 		if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, TX_TYPE_MASK) ==
 		    ASTDP_DPMCU_TX) {
-			ast->tx_chip_types = AST_TX_ASTDP_BIT;
+			ast->tx_chip_types |= AST_TX_ASTDP_BIT;
 			ast_dp_launch(&ast->base);
 		}
 	}
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 6695af70768f..31a49d32e506 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1717,7 +1717,8 @@ static int ast_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
 					       bool force)
 {
 	struct ast_bmc_connector *bmc_connector = to_ast_bmc_connector(connector);
-	struct drm_connector *physical_connector = bmc_connector->physical_connector;
+	struct drm_connector *physical_connector;
+	int i, count = bmc_connector->count;
 
 	/*
 	 * Most user-space compositors cannot handle more than one connected
@@ -1730,10 +1731,13 @@ static int ast_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
 	 *        than one connector per CRTC. The BMC should always be connected.
 	 */
 
-	if (physical_connector && physical_connector->status == connector_status_disconnected)
-		return connector_status_connected;
+	for (i = 0; i < count; i++) {
+		physical_connector = bmc_connector->physical_connectors[i];
+		if (physical_connector && physical_connector->status == connector_status_connected)
+			return connector_status_disconnected;
+	}
 
-	return connector_status_disconnected;
+	return connector_status_connected;
 }
 
 static int ast_bmc_connector_helper_get_modes(struct drm_connector *connector)
@@ -1756,10 +1760,11 @@ static const struct drm_connector_funcs ast_bmc_connector_funcs = {
 
 static int ast_bmc_connector_init(struct drm_device *dev,
 				  struct ast_bmc_connector *bmc_connector,
-				  struct drm_connector *physical_connector)
+				  struct drm_connector **physical_connector,
+				  int count)
 {
 	struct drm_connector *connector = &bmc_connector->base;
-	int ret;
+	int i, ret;
 
 	ret = drm_connector_init(dev, connector, &ast_bmc_connector_funcs,
 				 DRM_MODE_CONNECTOR_VIRTUAL);
@@ -1768,13 +1773,16 @@ static int ast_bmc_connector_init(struct drm_device *dev,
 
 	drm_connector_helper_add(connector, &ast_bmc_connector_helper_funcs);
 
-	bmc_connector->physical_connector = physical_connector;
+	for (i = 0; i < count; i++)
+		bmc_connector->physical_connectors[i] = physical_connector[i];
+	bmc_connector->count = count;
 
 	return 0;
 }
 
 static int ast_bmc_output_init(struct ast_device *ast,
-			       struct drm_connector *physical_connector)
+			       struct drm_connector **physical_connector,
+			       int count)
 {
 	struct drm_device *dev = &ast->base;
 	struct drm_crtc *crtc = &ast->crtc;
@@ -1790,7 +1798,7 @@ static int ast_bmc_output_init(struct ast_device *ast,
 		return ret;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
-	ret = ast_bmc_connector_init(dev, bmc_connector, physical_connector);
+	ret = ast_bmc_connector_init(dev, bmc_connector, physical_connector, count);
 	if (ret)
 		return ret;
 
@@ -1852,8 +1860,8 @@ static const struct drm_mode_config_funcs ast_mode_config_funcs = {
 int ast_mode_config_init(struct ast_device *ast)
 {
 	struct drm_device *dev = &ast->base;
-	struct drm_connector *physical_connector = NULL;
-	int ret;
+	struct drm_connector *physical_connector[MAX_CONNECTORS] = {NULL};
+	int count, ret;
 
 	ret = drmm_mutex_init(dev, &ast->modeset_lock);
 	if (ret)
@@ -1897,27 +1905,27 @@ int ast_mode_config_init(struct ast_device *ast)
 		ret = ast_vga_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.vga.connector;
+		physical_connector[count++] = &ast->output.vga.connector;
 	}
 	if (ast->tx_chip_types & AST_TX_SIL164_BIT) {
 		ret = ast_sil164_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.sil164.connector;
+		physical_connector[count++] = &ast->output.sil164.connector;
 	}
 	if (ast->tx_chip_types & AST_TX_DP501_BIT) {
 		ret = ast_dp501_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.dp501.connector;
+		physical_connector[count++] = &ast->output.dp501.connector;
 	}
 	if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
 		ret = ast_astdp_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.astdp.connector;
+		physical_connector[count++] = &ast->output.astdp.connector;
 	}
-	ret = ast_bmc_output_init(ast, physical_connector);
+	ret = ast_bmc_output_init(ast, physical_connector, count);
 	if (ret)
 		return ret;
 
-- 
2.25.1

