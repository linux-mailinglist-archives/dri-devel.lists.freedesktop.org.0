Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D011EB8F94F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 10:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C02D10E3DA;
	Mon, 22 Sep 2025 08:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B29A10E3D9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 08:40:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EA23E22043;
 Mon, 22 Sep 2025 08:39:59 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AFA8E1388C;
 Mon, 22 Sep 2025 08:39:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gCFxKV8L0WikFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 22 Sep 2025 08:39:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 02/12] drm/ast: Move mode-detection helpers to Gen2 source
 files
Date: Mon, 22 Sep 2025 10:36:02 +0200
Message-ID: <20250922083708.45564-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922083708.45564-1-tzimmermann@suse.de>
References: <20250922083708.45564-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: EA23E22043
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
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

Wide-screen modes are only available on Gen2 and later. Move the
detection helpers to the appropriate source file.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_2100.c | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_drv.h  |  2 ++
 drivers/gpu/drm/ast/ast_main.c | 27 ---------------------------
 3 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
index 829e3b8b0d19..16a279ec8351 100644
--- a/drivers/gpu/drm/ast/ast_2100.c
+++ b/drivers/gpu/drm/ast/ast_2100.c
@@ -386,3 +386,34 @@ int ast_2100_post(struct ast_device *ast)
 
 	return 0;
 }
+
+/*
+ * Widescreen detection
+ */
+
+/* Try to detect WSXGA+ on Gen2+ */
+bool __ast_2100_detect_wsxga_p(struct ast_device *ast)
+{
+	u8 vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
+
+	if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
+		return true;
+	if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
+		return true;
+
+	return false;
+}
+
+/* Try to detect WUXGA on Gen2+ */
+bool __ast_2100_detect_wuxga(struct ast_device *ast)
+{
+	u8 vgacrd1;
+
+	if (ast->support_fullhd) {
+		vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
+		if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
+			return true;
+	}
+
+	return false;
+}
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 482d1eb79d64..c75600981251 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -421,6 +421,8 @@ extern const struct ast_vbios_dclk_info ast_2000_dclk_table[];
 
 /* ast_2100.c */
 int ast_2100_post(struct ast_device *ast);
+bool __ast_2100_detect_wsxga_p(struct ast_device *ast);
+bool __ast_2100_detect_wuxga(struct ast_device *ast);
 
 /* ast_2300.c */
 int ast_2300_post(struct ast_device *ast);
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 3eea6a6cdacd..1678845274c7 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -36,33 +36,6 @@
 
 #include "ast_drv.h"
 
-/* Try to detect WSXGA+ on Gen2+ */
-static bool __ast_2100_detect_wsxga_p(struct ast_device *ast)
-{
-	u8 vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
-
-	if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
-		return true;
-	if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
-		return true;
-
-	return false;
-}
-
-/* Try to detect WUXGA on Gen2+ */
-static bool __ast_2100_detect_wuxga(struct ast_device *ast)
-{
-	u8 vgacrd1;
-
-	if (ast->support_fullhd) {
-		vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
-		if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
-			return true;
-	}
-
-	return false;
-}
-
 static void ast_detect_widescreen(struct ast_device *ast)
 {
 	ast->support_wsxga_p = false;
-- 
2.51.0

