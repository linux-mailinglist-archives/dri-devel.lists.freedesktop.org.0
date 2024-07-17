Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8F0933E82
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 16:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991FF10E120;
	Wed, 17 Jul 2024 14:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBCD10E0C2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 14:33:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CF85821C11;
 Wed, 17 Jul 2024 14:33:28 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97BE91368F;
 Wed, 17 Jul 2024 14:33:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mBrUIzjWl2YmCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 17 Jul 2024 14:33:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/5] drm/ast: astdp: Perform link training during atomic_enable
Date: Wed, 17 Jul 2024 16:24:19 +0200
Message-ID: <20240717143319.104012-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240717143319.104012-1-tzimmermann@suse.de>
References: <20240717143319.104012-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Queue-Id: CF85821C11
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Level: 
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

The place for link training is in the encoder's atomic_enable
helper. Remove all related tests from other helper ASTDP functions;
especially ast_astdp_is_connected(), which tests HPD status.

DP link training is controlled by the firmware. A status flag reports
success or failure. The process can be fragile on Aspeed hardware. Moving
the test from connector detection to the atomic_enable allows for several
retries and a longer timeout.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c   | 45 +++++++++++++++++-----------------
 drivers/gpu/drm/ast/ast_drv.h  |  1 +
 drivers/gpu/drm/ast/ast_mode.c |  2 ++
 drivers/gpu/drm/ast/ast_reg.h  |  3 +--
 4 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index c45b336baf45..6cbde46f24dc 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -11,8 +11,6 @@ bool ast_astdp_is_connected(struct ast_device *ast)
 {
 	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, AST_IO_VGACRDF_HPD))
 		return false;
-	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS))
-		return false;
 	return true;
 }
 
@@ -22,14 +20,10 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 	u8 i = 0, j = 0;
 
 	/*
-	 * CRDC[b0]: DP link success
 	 * CRE5[b0]: Host reading EDID process is done
 	 */
-	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS) &&
-		ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE5,
-								ASTDP_HOST_EDID_READ_DONE_MASK))) {
+	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE5, ASTDP_HOST_EDID_READ_DONE_MASK)))
 		goto err_astdp_edid_not_ready;
-	}
 
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE5, (u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
 							0x00);
@@ -58,11 +52,6 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 			 */
 			mdelay(j+1);
 
-			if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC,
-							ASTDP_LINK_SUCCESS))) {
-				goto err_astdp_jump_out_loop_of_edid;
-			}
-
 			j++;
 			if (j > 200)
 				goto err_astdp_jump_out_loop_of_edid;
@@ -106,8 +95,6 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 	return (~(j+256) + 1);
 
 err_astdp_edid_not_ready:
-	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS)))
-		return (~0xDC + 1);
 	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE5, ASTDP_HOST_EDID_READ_DONE_MASK)))
 		return (~0xE5 + 1);
 
@@ -165,7 +152,22 @@ void ast_dp_power_on_off(struct drm_device *dev, bool on)
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, (u8) ~AST_DP_PHY_SLEEP, bE3);
 }
 
+void ast_dp_link_training(struct ast_device *ast)
+{
+	struct drm_device *dev = &ast->base;
+	unsigned int i = 10;
+
+	while (i--) {
+		u8 vgacrdc = ast_get_index_reg(ast, AST_IO_VGACRI, 0xdc);
 
+		if (vgacrdc & AST_IO_VGACRDC_LINK_SUCCESS)
+			break;
+		if (i)
+			msleep(100);
+	}
+	if (!i)
+		drm_err(dev, "Link training failed\n");
+}
 
 void ast_dp_set_on_off(struct drm_device *dev, bool on)
 {
@@ -176,16 +178,13 @@ void ast_dp_set_on_off(struct drm_device *dev, bool on)
 	// Video On/Off
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, (u8) ~AST_DP_VIDEO_ENABLE, on);
 
-	// If DP plug in and link successful then check video on / off status
-	if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS)) {
-		video_on_off <<= 4;
-		while (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF,
+	video_on_off <<= 4;
+	while (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF,
 						ASTDP_MIRROR_VIDEO_ENABLE) != video_on_off) {
-			// wait 1 ms
-			mdelay(1);
-			if (++i > 200)
-				break;
-		}
+		// wait 1 ms
+		mdelay(1);
+		if (++i > 200)
+			break;
 	}
 }
 
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 02476eb78119..d23b98ce4359 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -474,6 +474,7 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
 int ast_dp_launch(struct ast_device *ast);
 bool ast_dp_power_is_on(struct ast_device *ast);
 void ast_dp_power_on_off(struct drm_device *dev, bool no);
+void ast_dp_link_training(struct ast_device *ast);
 void ast_dp_set_on_off(struct drm_device *dev, bool no);
 void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode);
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 049ee1477c33..ddb7696acc04 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1622,6 +1622,8 @@ static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 	struct ast_device *ast = to_ast_device(dev);
 
 	ast_dp_power_on_off(dev, AST_DP_POWER_ON);
+	ast_dp_link_training(ast);
+
 	ast_wait_for_vretrace(ast);
 	ast_dp_set_on_off(dev, 1);
 }
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index e61954dabf1a..28bb43f6795b 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -38,6 +38,7 @@
 #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
 
 #define AST_IO_VGACRD1_MCU_FW_EXECUTING	BIT(5)
+#define AST_IO_VGACRDC_LINK_SUCCESS	BIT(0)
 #define AST_IO_VGACRDF_HPD		BIT(0)
 
 #define AST_IO_VGAIR1_R			(0x5A)
@@ -70,10 +71,8 @@
 #define AST_DP_VIDEO_ENABLE		BIT(0)
 
 /*
- * CRDC[b0]: DP link success
  * CRE5[b0]: Host reading EDID process is done
  */
-#define ASTDP_LINK_SUCCESS		BIT(0)
 #define ASTDP_HOST_EDID_READ_DONE	BIT(0)
 #define ASTDP_HOST_EDID_READ_DONE_MASK	GENMASK(0, 0)
 
-- 
2.45.2

