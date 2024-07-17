Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00F6933E80
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 16:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D25B10E0FA;
	Wed, 17 Jul 2024 14:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69BE10E0FA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 14:33:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 563331FB8A;
 Wed, 17 Jul 2024 14:33:28 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DD9A1368F;
 Wed, 17 Jul 2024 14:33:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AOsdBjjWl2YmCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 17 Jul 2024 14:33:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/5] drm/ast: astdp: Test firmware status once during probing
Date: Wed, 17 Jul 2024 16:24:17 +0200
Message-ID: <20240717143319.104012-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240717143319.104012-1-tzimmermann@suse.de>
References: <20240717143319.104012-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 563331FB8A
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Score: -4.00
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

Test for running ASTDP firmware during probe. Do not bother testing
this later. We cannot do much anyway if the firmware fails. Do not
initialize the ASTDP conenctor if the test fails during device probing.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c   | 41 +++++++++++++---------------------
 drivers/gpu/drm/ast/ast_drv.h  |  2 +-
 drivers/gpu/drm/ast/ast_main.c |  6 +++--
 drivers/gpu/drm/ast/ast_post.c |  2 +-
 drivers/gpu/drm/ast/ast_reg.h  |  4 ++--
 5 files changed, 23 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index e6c7f0d64e99..59885d10d308 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -9,8 +9,6 @@
 
 bool ast_astdp_is_connected(struct ast_device *ast)
 {
-	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, ASTDP_MCU_FW_EXECUTING))
-		return false;
 	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD))
 		return false;
 	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS))
@@ -24,13 +22,11 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 	u8 i = 0, j = 0;
 
 	/*
-	 * CRD1[b5]: DP MCU FW is executing
 	 * CRDC[b0]: DP link success
 	 * CRDF[b0]: DP HPD
 	 * CRE5[b0]: Host reading EDID process is done
 	 */
-	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, ASTDP_MCU_FW_EXECUTING) &&
-		ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS) &&
+	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS) &&
 		ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD) &&
 		ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE5,
 								ASTDP_HOST_EDID_READ_DONE_MASK))) {
@@ -64,9 +60,7 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 			 */
 			mdelay(j+1);
 
-			if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1,
-							ASTDP_MCU_FW_EXECUTING) &&
-				ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC,
+			if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC,
 							ASTDP_LINK_SUCCESS) &&
 				ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD))) {
 				goto err_astdp_jump_out_loop_of_edid;
@@ -115,8 +109,6 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 	return (~(j+256) + 1);
 
 err_astdp_edid_not_ready:
-	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, ASTDP_MCU_FW_EXECUTING)))
-		return (~0xD1 + 1);
 	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS)))
 		return (~0xDC + 1);
 	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD)))
@@ -130,32 +122,29 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 /*
  * Launch Aspeed DP
  */
-void ast_dp_launch(struct drm_device *dev)
+int ast_dp_launch(struct ast_device *ast)
 {
-	u32 i = 0;
-	u8 bDPExecute = 1;
-	struct ast_device *ast = to_ast_device(dev);
+	struct drm_device *dev = &ast->base;
+	unsigned int i = 10;
 
-	// Wait one second then timeout.
-	while (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, ASTDP_MCU_FW_EXECUTING) !=
-		ASTDP_MCU_FW_EXECUTING) {
-		i++;
-		// wait 100 ms
-		msleep(100);
+	while (i) {
+		u8 vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
 
-		if (i >= 10) {
-			// DP would not be ready.
-			bDPExecute = 0;
+		if (vgacrd1 & AST_IO_VGACRD1_MCU_FW_EXECUTING)
 			break;
-		}
+		--i;
+		msleep(100);
 	}
-
-	if (!bDPExecute)
+	if (!i) {
 		drm_err(dev, "Wait DPMCU executing timeout\n");
+		return -ENODEV;
+	}
 
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE5,
 			       (u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
 			       ASTDP_HOST_EDID_READ_DONE);
+
+	return 0;
 }
 
 bool ast_dp_power_is_on(struct ast_device *ast)
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 47bab5596c16..02476eb78119 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -471,7 +471,7 @@ void ast_init_3rdtx(struct drm_device *dev);
 /* aspeed DP */
 bool ast_astdp_is_connected(struct ast_device *ast);
 int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
-void ast_dp_launch(struct drm_device *dev);
+int ast_dp_launch(struct ast_device *ast);
 bool ast_dp_power_is_on(struct ast_device *ast);
 void ast_dp_power_on_off(struct drm_device *dev, bool no);
 void ast_dp_set_on_off(struct drm_device *dev, bool no);
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 0637abb70361..d836f2a4f9f3 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -115,8 +115,10 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 	} else if (IS_AST_GEN7(ast)) {
 		if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, TX_TYPE_MASK) ==
 		    ASTDP_DPMCU_TX) {
-			ast->tx_chip_types = AST_TX_ASTDP_BIT;
-			ast_dp_launch(&ast->base);
+			int ret = ast_dp_launch(ast);
+
+			if (!ret)
+				ast->tx_chip_types = AST_TX_ASTDP_BIT;
 		}
 	}
 
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 22f548805dfb..65755798ab94 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -351,7 +351,7 @@ void ast_post_gpu(struct drm_device *dev)
 
 	if (IS_AST_GEN7(ast)) {
 		if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
-			ast_dp_launch(dev);
+			ast_dp_launch(ast);
 	} else if (ast->config_mode == ast_use_p2a) {
 		if (IS_AST_GEN6(ast))
 			ast_post_chip_2500(dev);
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 75671d345057..569de3188191 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -37,6 +37,8 @@
 #define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */
 #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
 
+#define AST_IO_VGACRD1_MCU_FW_EXECUTING	BIT(5)
+
 #define AST_IO_VGAIR1_R			(0x5A)
 #define AST_IO_VGAIR1_VREFRESH		BIT(3)
 
@@ -67,12 +69,10 @@
 #define AST_DP_VIDEO_ENABLE		BIT(0)
 
 /*
- * CRD1[b5]: DP MCU FW is executing
  * CRDC[b0]: DP link success
  * CRDF[b0]: DP HPD
  * CRE5[b0]: Host reading EDID process is done
  */
-#define ASTDP_MCU_FW_EXECUTING		BIT(5)
 #define ASTDP_LINK_SUCCESS		BIT(0)
 #define ASTDP_HPD			BIT(0)
 #define ASTDP_HOST_EDID_READ_DONE	BIT(0)
-- 
2.45.2

