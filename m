Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1451C933E81
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 16:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C618810E115;
	Wed, 17 Jul 2024 14:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB7310E0D7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 14:33:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 198891FCEF;
 Wed, 17 Jul 2024 14:33:29 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D5BDD1396E;
 Wed, 17 Jul 2024 14:33:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gH7nMjjWl2YmCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 17 Jul 2024 14:33:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/5] drm/ast: astdp: Clean up EDID reading
Date: Wed, 17 Jul 2024 16:24:20 +0200
Message-ID: <20240717143319.104012-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240717143319.104012-1-tzimmermann@suse.de>
References: <20240717143319.104012-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 198891FCEF
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

Simplify ast_astdp_read_edid(). Rename register constants. Drop
unnecessary error handling. On success, the helper returns 0; an
error code otherwise.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c  | 93 ++++++++++++++++-------------------
 drivers/gpu/drm/ast/ast_reg.h | 12 +----
 2 files changed, 44 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 6cbde46f24dc..5d07678b502c 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -17,54 +17,55 @@ bool ast_astdp_is_connected(struct ast_device *ast)
 int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 {
 	struct ast_device *ast = to_ast_device(dev);
-	u8 i = 0, j = 0;
+	int ret = 0;
+	u8 i;
 
-	/*
-	 * CRE5[b0]: Host reading EDID process is done
-	 */
-	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE5, ASTDP_HOST_EDID_READ_DONE_MASK)))
-		goto err_astdp_edid_not_ready;
-
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE5, (u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
-							0x00);
+	/* Start reading EDID data */
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe5, (u8)~AST_IO_VGACRE5_EDID_READ_DONE, 0x00);
 
 	for (i = 0; i < 32; i++) {
+		unsigned int j;
+
 		/*
 		 * CRE4[7:0]: Read-Pointer for EDID (Unit: 4bytes); valid range: 0~64
 		 */
-		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE4,
-				       ASTDP_AND_CLEAR_MASK, (u8)i);
-		j = 0;
+		ast_set_index_reg(ast, AST_IO_VGACRI, 0xe4, i);
 
 		/*
 		 * CRD7[b0]: valid flag for EDID
 		 * CRD6[b0]: mirror read pointer for EDID
 		 */
-		while ((ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD7,
-				ASTDP_EDID_VALID_FLAG_MASK) != 0x01) ||
-			(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD6,
-						ASTDP_EDID_READ_POINTER_MASK) != i)) {
+		for (j = 0; j < 200; ++j) {
+			u8 vgacrd7, vgacrd6;
+
 			/*
 			 * Delay are getting longer with each retry.
-			 * 1. The Delays are often 2 loops when users request "Display Settings"
+			 *
+			 * 1. No delay on first try
+			 * 2. The Delays are often 2 loops when users request "Display Settings"
 			 *	  of right-click of mouse.
-			 * 2. The Delays are often longer a lot when system resume from S3/S4.
+			 * 3. The Delays are often longer a lot when system resume from S3/S4.
 			 */
-			mdelay(j+1);
-
-			j++;
-			if (j > 200)
-				goto err_astdp_jump_out_loop_of_edid;
+			if (j)
+				mdelay(j + 1);
+
+			/* Wait for EDID offset to show up in mirror register */
+			vgacrd7 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd7);
+			if (vgacrd7 & AST_IO_VGACRD7_EDID_VALID_FLAG) {
+				vgacrd6 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd6);
+				if (vgacrd6 == i)
+					break;
+			}
+		}
+		if (j == 200) {
+			ret = -EBUSY;
+			goto out;
 		}
 
-		*(ediddata) = ast_get_index_reg_mask(ast, AST_IO_VGACRI,
-							0xD8, ASTDP_EDID_READ_DATA_MASK);
-		*(ediddata + 1) = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD9,
-								ASTDP_EDID_READ_DATA_MASK);
-		*(ediddata + 2) = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDA,
-								ASTDP_EDID_READ_DATA_MASK);
-		*(ediddata + 3) = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDB,
-								ASTDP_EDID_READ_DATA_MASK);
+		ediddata[0] = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd8);
+		ediddata[1] = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd9);
+		ediddata[2] = ast_get_index_reg(ast, AST_IO_VGACRI, 0xda);
+		ediddata[3] = ast_get_index_reg(ast, AST_IO_VGACRI, 0xdb);
 
 		if (i == 31) {
 			/*
@@ -76,29 +77,19 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 			 *		The Bytes-126 indicates the Number of extensions to
 			 *		follow. 0 represents noextensions.
 			 */
-			*(ediddata + 3) = *(ediddata + 3) + *(ediddata + 2);
-			*(ediddata + 2) = 0;
+			ediddata[3] = ediddata[3] + ediddata[2];
+			ediddata[2] = 0;
 		}
 
 		ediddata += 4;
 	}
 
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE5, (u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
-							ASTDP_HOST_EDID_READ_DONE);
-
-	return 0;
-
-err_astdp_jump_out_loop_of_edid:
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE5,
-							(u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
-							ASTDP_HOST_EDID_READ_DONE);
-	return (~(j+256) + 1);
-
-err_astdp_edid_not_ready:
-	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE5, ASTDP_HOST_EDID_READ_DONE_MASK)))
-		return (~0xE5 + 1);
+out:
+	/* Signal end of reading */
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe5, (u8)~AST_IO_VGACRE5_EDID_READ_DONE,
+			       AST_IO_VGACRE5_EDID_READ_DONE);
 
-	return	0;
+	return ret;
 }
 
 /*
@@ -122,9 +113,9 @@ int ast_dp_launch(struct ast_device *ast)
 		return -ENODEV;
 	}
 
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE5,
-			       (u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
-			       ASTDP_HOST_EDID_READ_DONE);
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe5,
+			       (u8) ~AST_IO_VGACRE5_EDID_READ_DONE,
+			       AST_IO_VGACRE5_EDID_READ_DONE);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 28bb43f6795b..040961cc1a19 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -38,8 +38,10 @@
 #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
 
 #define AST_IO_VGACRD1_MCU_FW_EXECUTING	BIT(5)
+#define AST_IO_VGACRD7_EDID_VALID_FLAG	BIT(0)
 #define AST_IO_VGACRDC_LINK_SUCCESS	BIT(0)
 #define AST_IO_VGACRDF_HPD		BIT(0)
+#define AST_IO_VGACRE5_EDID_READ_DONE	BIT(0)
 
 #define AST_IO_VGAIR1_R			(0x5A)
 #define AST_IO_VGAIR1_VREFRESH		BIT(3)
@@ -70,12 +72,6 @@
 #define AST_DP_PHY_SLEEP		BIT(4)
 #define AST_DP_VIDEO_ENABLE		BIT(0)
 
-/*
- * CRE5[b0]: Host reading EDID process is done
- */
-#define ASTDP_HOST_EDID_READ_DONE	BIT(0)
-#define ASTDP_HOST_EDID_READ_DONE_MASK	GENMASK(0, 0)
-
 /*
  * CRDF[b4]: Mirror of AST_DP_VIDEO_ENABLE
  * Precondition:	A. ~AST_DP_PHY_SLEEP  &&
@@ -84,10 +80,6 @@
  */
 #define ASTDP_MIRROR_VIDEO_ENABLE	BIT(4)
 
-#define ASTDP_EDID_READ_POINTER_MASK	GENMASK(7, 0)
-#define ASTDP_EDID_VALID_FLAG_MASK	GENMASK(0, 0)
-#define ASTDP_EDID_READ_DATA_MASK	GENMASK(7, 0)
-
 /*
  * ASTDP setmode registers:
  * CRE0[7:0]: MISC0 ((0x00: 18-bpp) or (0x20: 24-bpp)
-- 
2.45.2

