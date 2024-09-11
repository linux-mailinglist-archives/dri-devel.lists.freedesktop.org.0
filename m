Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910C4975132
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 13:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E320410E9D1;
	Wed, 11 Sep 2024 11:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FE610E9C5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 11:53:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F3AE81F8AA;
 Wed, 11 Sep 2024 11:53:51 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CBC4613A7C;
 Wed, 11 Sep 2024 11:53:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6JdoMM+E4WbGIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Sep 2024 11:53:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/10] drm/ast: astdp: Replace ast_dp_set_on_off()
Date: Wed, 11 Sep 2024 13:51:22 +0200
Message-ID: <20240911115347.899148-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911115347.899148-1-tzimmermann@suse.de>
References: <20240911115347.899148-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: F3AE81F8AA
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Replace ast_dp_set_on_off() with ast_dp_set_enable(). The helper's
new name reflects the performed operation. If enabling fails, the
new helper prints a warning. The code that waits for the programmed
effect to take place is now located in __ast_dp_wait_enable().

Also align the register constants with the rest of the code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c  | 49 +++++++++++++++++++++++------------
 drivers/gpu/drm/ast/ast_reg.h | 13 ++--------
 2 files changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index d4362807d777..0e282b7b167c 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -186,22 +186,39 @@ static void ast_dp_link_training(struct ast_device *ast)
 	drm_err(dev, "Link training failed\n");
 }
 
-static void ast_dp_set_on_off(struct ast_device *ast, bool on)
+static bool __ast_dp_wait_enable(struct ast_device *ast, bool enabled)
 {
-	u8 video_on_off = on;
-	u32 i = 0;
-
-	// Video On/Off
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, (u8) ~AST_DP_VIDEO_ENABLE, on);
-
-	video_on_off <<= 4;
-	while (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF,
-						ASTDP_MIRROR_VIDEO_ENABLE) != video_on_off) {
-		// wait 1 ms
-		mdelay(1);
-		if (++i > 200)
-			break;
+	u8 vgacrdf_test = 0x00;
+	u8 vgacrdf;
+	unsigned int i;
+
+	if (enabled)
+		vgacrdf_test |= AST_IO_VGACRDF_DP_VIDEO_ENABLE;
+
+	for (i = 0; i < 200; ++i) {
+		if (i)
+			mdelay(1);
+		vgacrdf = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xdf,
+						 AST_IO_VGACRDF_DP_VIDEO_ENABLE);
+		if (vgacrdf == vgacrdf_test)
+			return true;
 	}
+
+	return false;
+}
+
+static void ast_dp_set_enable(struct ast_device *ast, bool enabled)
+{
+	struct drm_device *dev = &ast->base;
+	u8 vgacre3 = 0x00;
+
+	if (enabled)
+		vgacre3 |= AST_IO_VGACRE3_DP_VIDEO_ENABLE;
+
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe3, (u8)~AST_IO_VGACRE3_DP_VIDEO_ENABLE,
+			       vgacre3);
+
+	drm_WARN_ON(dev, !__ast_dp_wait_enable(ast, enabled));
 }
 
 static void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode)
@@ -318,7 +335,7 @@ static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 		ast_dp_link_training(ast);
 
 		ast_wait_for_vretrace(ast);
-		ast_dp_set_on_off(ast, 1);
+		ast_dp_set_enable(ast, true);
 	}
 }
 
@@ -327,7 +344,7 @@ static void ast_astdp_encoder_helper_atomic_disable(struct drm_encoder *encoder,
 {
 	struct ast_device *ast = to_ast_device(encoder->dev);
 
-	ast_dp_set_on_off(ast, 0);
+	ast_dp_set_enable(ast, false);
 	ast_dp_set_phy_sleep(ast, true);
 }
 
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index d7a22cea8271..6a1f756650ab 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -41,6 +41,8 @@
 #define AST_IO_VGACRD7_EDID_VALID_FLAG	BIT(0)
 #define AST_IO_VGACRDC_LINK_SUCCESS	BIT(0)
 #define AST_IO_VGACRDF_HPD		BIT(0)
+#define AST_IO_VGACRDF_DP_VIDEO_ENABLE	BIT(4) /* mirrors AST_IO_VGACRE3_DP_VIDEO_ENABLE */
+#define AST_IO_VGACRE3_DP_VIDEO_ENABLE	BIT(0)
 #define AST_IO_VGACRE3_DP_PHY_SLEEP	BIT(4)
 #define AST_IO_VGACRE5_EDID_READ_DONE	BIT(0)
 
@@ -69,17 +71,6 @@
  * AST DisplayPort
  */
 
-/* Define for Soc scratched reg used on ASTDP */
-#define AST_DP_VIDEO_ENABLE		BIT(0)
-
-/*
- * CRDF[b4]: Mirror of AST_DP_VIDEO_ENABLE
- * Precondition:	A. ~AST_DP_PHY_SLEEP  &&
- *			B. DP_HPD &&
- *			C. DP_LINK_SUCCESS
- */
-#define ASTDP_MIRROR_VIDEO_ENABLE	BIT(4)
-
 /*
  * ASTDP setmode registers:
  * CRE0[7:0]: MISC0 ((0x00: 18-bpp) or (0x20: 24-bpp)
-- 
2.46.0

