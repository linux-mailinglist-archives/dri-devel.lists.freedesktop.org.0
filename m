Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EB6A50507
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 17:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CEF10E80B;
	Wed,  5 Mar 2025 16:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364AC10E80B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 16:35:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7BCBD211C8;
 Wed,  5 Mar 2025 16:35:06 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 567831366F;
 Wed,  5 Mar 2025 16:35:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4M2sEzp9yGfxfQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Mar 2025 16:35:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 5/7] drm/ast: Add helper for computing framebuffer location
 in video memory
Date: Wed,  5 Mar 2025 17:30:44 +0100
Message-ID: <20250305163207.267650-6-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 7BCBD211C8
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

The ast driver stores the primary plane's image in the framebuffer
memory up to where the cursor is located. Add helpers to calculate
the offset and size.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index c3b950675485..4cac5c7f4547 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -51,6 +51,24 @@
 
 #define AST_LUT_SIZE 256
 
+static unsigned long ast_fb_vram_offset(void)
+{
+	return 0; // with shmem, the primary plane is always at offset 0
+}
+
+static unsigned long ast_fb_vram_size(struct ast_device *ast)
+{
+	struct drm_device *dev = &ast->base;
+	unsigned long offset = ast_fb_vram_offset(); // starts at offset
+	long cursor_offset = ast_cursor_vram_offset(ast); // ends at cursor offset
+
+	if (cursor_offset < 0)
+		cursor_offset = ast->vram_size; // no cursor; it's all ours
+	if (drm_WARN_ON_ONCE(dev, offset > cursor_offset))
+		return 0; // cannot legally happen; signal error
+	return cursor_offset - offset;
+}
+
 static inline void ast_load_palette_index(struct ast_device *ast,
 				     u8 index, u8 red, u8 green,
 				     u8 blue)
@@ -609,9 +627,8 @@ static int ast_primary_plane_init(struct ast_device *ast)
 	struct ast_plane *ast_primary_plane = &ast->primary_plane;
 	struct drm_plane *primary_plane = &ast_primary_plane->base;
 	void __iomem *vaddr = ast->vram;
-	u64 offset = 0; /* with shmem, the primary plane is always at offset 0 */
-	unsigned long cursor_size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
-	unsigned long size = ast->vram_fb_available - cursor_size;
+	u64 offset = ast_fb_vram_offset();
+	unsigned long size = ast_fb_vram_size(ast);
 	int ret;
 
 	ret = ast_plane_init(dev, ast_primary_plane, vaddr, offset, size,
@@ -942,7 +959,7 @@ static enum drm_mode_status ast_mode_config_mode_valid(struct drm_device *dev,
 	struct ast_device *ast = to_ast_device(dev);
 	unsigned long fbsize, fbpages, max_fbpages;
 
-	max_fbpages = (ast->vram_fb_available) >> PAGE_SHIFT;
+	max_fbpages = ast_fb_vram_size(ast) >> PAGE_SHIFT;
 
 	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;
 	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);
-- 
2.48.1

