Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 257C7A50506
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 17:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAEF88A27;
	Wed,  5 Mar 2025 16:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E35910E808
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 16:35:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4F8D2211D4;
 Wed,  5 Mar 2025 16:35:06 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A3D41366F;
 Wed,  5 Mar 2025 16:35:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oCoECTp9yGfxfQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Mar 2025 16:35:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/7] drm/ast: cursor: Add helpers for computing location in
 video memory
Date: Wed,  5 Mar 2025 17:30:43 +0100
Message-ID: <20250305163207.267650-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305163207.267650-1-tzimmermann@suse.de>
References: <20250305163207.267650-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 4F8D2211D4
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

The ast drivers stores the cursor image at the end of the video memory.
Add helpers to calculate the offset and size.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 21 +++++++++++++++++++--
 drivers/gpu/drm/ast/ast_drv.h    |  1 +
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 139ab00dee8f..05e297f30b4e 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -45,6 +45,21 @@
 #define AST_HWC_SIGNATURE_HOTSPOTX	0x14
 #define AST_HWC_SIGNATURE_HOTSPOTY	0x18
 
+static unsigned long ast_cursor_vram_size(void)
+{
+	return AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE;
+}
+
+long ast_cursor_vram_offset(struct ast_device *ast)
+{
+	unsigned long size = ast_cursor_vram_size();
+
+	if (size > ast->vram_size)
+		return -EINVAL;
+
+	return PAGE_ALIGN_DOWN(ast->vram_size - size);
+}
+
 static u32 ast_cursor_calculate_checksum(const void *src, unsigned int width, unsigned int height)
 {
 	u32 csum = 0;
@@ -276,7 +291,7 @@ int ast_cursor_plane_init(struct ast_device *ast)
 	struct drm_plane *cursor_plane = &ast_plane->base;
 	size_t size;
 	void __iomem *vaddr;
-	u64 offset;
+	long offset;
 	int ret;
 
 	/*
@@ -290,7 +305,9 @@ int ast_cursor_plane_init(struct ast_device *ast)
 		return -ENOMEM;
 
 	vaddr = ast->vram + ast->vram_fb_available - size;
-	offset = ast->vram_fb_available - size;
+	offset = ast_cursor_vram_offset(ast);
+	if (offset < 0)
+		return offset;
 
 	ret = ast_plane_init(dev, ast_plane, vaddr, offset, size,
 			     0x01, &ast_cursor_plane_funcs,
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 2c7861835cfb..ec9ec77260e9 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -432,6 +432,7 @@ int ast_vga_output_init(struct ast_device *ast);
 int ast_sil164_output_init(struct ast_device *ast);
 
 /* ast_cursor.c */
+long ast_cursor_vram_offset(struct ast_device *ast);
 int ast_cursor_plane_init(struct ast_device *ast);
 
 /* ast dp501 */
-- 
2.48.1

