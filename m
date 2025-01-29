Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEF5A21A87
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 10:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999A710E78A;
	Wed, 29 Jan 2025 09:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF8B10E77B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 09:58:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 68D8A21111;
 Wed, 29 Jan 2025 09:58:47 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 446A1137DB;
 Wed, 29 Jan 2025 09:58:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oKhID9f7mWflDQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 29 Jan 2025 09:58:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 04/16] drm/ast: Reorganize widescreen test around hardware
 Gens
Date: Wed, 29 Jan 2025 10:54:50 +0100
Message-ID: <20250129095840.20629-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129095840.20629-1-tzimmermann@suse.de>
References: <20250129095840.20629-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 68D8A21111
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Testing for support of widescreen modes mixes up various hardware
Gens. First branch by hardware Gen, then do specific tests for each
Gen. By default, widesscreen support is disabled.

Later patches will add more specific tests for each Gen.

v2:
- move shared detection code into helper (Jocelyn)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 54 ++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 1cfbe404e5a0a..93ae9a275c960 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -36,33 +36,43 @@
 
 #include "ast_drv.h"
 
+/* Try to detect WSXGA+ on Gen2+ */
+static bool __ast_2100_detect_wsxga_p(struct ast_device *ast)
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
 static void ast_detect_widescreen(struct ast_device *ast)
 {
-	u8 vgacrd0;
+	ast->support_wsxga_p = false;
 
-	/* Check if we support wide screen */
-	switch (AST_GEN(ast)) {
-	case 1:
-		ast->support_wsxga_p = false;
-		break;
-	default:
-		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
-		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
+	if (AST_GEN(ast) >= 7) {
+		ast->support_wsxga_p = true;
+	} else if (AST_GEN(ast) >= 6) {
+		if (__ast_2100_detect_wsxga_p(ast))
 			ast->support_wsxga_p = true;
-		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
+		else if (ast->chip == AST2510)
+			ast->support_wsxga_p = true;
+	} else if (AST_GEN(ast) >= 5) {
+		if (__ast_2100_detect_wsxga_p(ast))
+			ast->support_wsxga_p = true;
+		else if (ast->chip == AST1400)
+			ast->support_wsxga_p = true;
+	} else if (AST_GEN(ast) >= 4) {
+		if (__ast_2100_detect_wsxga_p(ast))
+			ast->support_wsxga_p = true;
+		else if (ast->chip == AST1300)
+			ast->support_wsxga_p = true;
+	} else if (AST_GEN(ast) >= 2) {
+		if (__ast_2100_detect_wsxga_p(ast))
 			ast->support_wsxga_p = true;
-		else {
-			ast->support_wsxga_p = false;
-			if (ast->chip == AST1300)
-				ast->support_wsxga_p = true;
-			if (ast->chip == AST1400)
-				ast->support_wsxga_p = true;
-			if (ast->chip == AST2510)
-				ast->support_wsxga_p = true;
-			if (IS_AST_GEN7(ast))
-				ast->support_wsxga_p = true;
-		}
-		break;
 	}
 }
 
-- 
2.48.1

