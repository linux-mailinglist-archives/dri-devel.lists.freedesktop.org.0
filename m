Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B190A6D7D9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 10:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F56110E29E;
	Mon, 24 Mar 2025 09:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RCy2EBEH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i7QAjN8i";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RCy2EBEH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i7QAjN8i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3CF10E29E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 09:48:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E5FB01F387;
 Mon, 24 Mar 2025 09:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742809736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=auie4mRct3kmguusvxIE5XJBvm6b9M5M9w7zYQ0YMnY=;
 b=RCy2EBEHgeNJc7lhdolXVBTF8BUwNujyO21lsANRyxjHLi0XWzxuyoq0E26UcTmKI7JoGl
 n8RurxEGLfVoLqbVuO6DDjKEdneQO13v0oz6TDVanKHKpAxksc0I2iQGJALGQeJBc8Bc5Y
 ycW60fak9onjYXHHUurjOF7MYb02pvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742809736;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=auie4mRct3kmguusvxIE5XJBvm6b9M5M9w7zYQ0YMnY=;
 b=i7QAjN8i1z6AYcdnpC+oaSMezoQLF5iCMPfl72KwAlMZijw0iWGWro/iYE5afxSJNBjJcD
 p3xm7Swcmm/wrgBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742809736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=auie4mRct3kmguusvxIE5XJBvm6b9M5M9w7zYQ0YMnY=;
 b=RCy2EBEHgeNJc7lhdolXVBTF8BUwNujyO21lsANRyxjHLi0XWzxuyoq0E26UcTmKI7JoGl
 n8RurxEGLfVoLqbVuO6DDjKEdneQO13v0oz6TDVanKHKpAxksc0I2iQGJALGQeJBc8Bc5Y
 ycW60fak9onjYXHHUurjOF7MYb02pvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742809736;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=auie4mRct3kmguusvxIE5XJBvm6b9M5M9w7zYQ0YMnY=;
 b=i7QAjN8i1z6AYcdnpC+oaSMezoQLF5iCMPfl72KwAlMZijw0iWGWro/iYE5afxSJNBjJcD
 p3xm7Swcmm/wrgBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BFE28137AC;
 Mon, 24 Mar 2025 09:48:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QGZyLYgq4Wf3aAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Mar 2025 09:48:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/3] drm/ast: Remove vaddr field from struct ast_plane
Date: Mon, 24 Mar 2025 10:44:10 +0100
Message-ID: <20250324094520.192974-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250324094520.192974-1-tzimmermann@suse.de>
References: <20250324094520.192974-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
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

The vaddr field in struct ast_plane serves no purpose. Its value
can be calculated easily from the VRAM base plus the plane offset.
Do so and remove the field.

In ast_primary_plane_helper_get_scanout_buffer(), remove the test
for vaddr being NULL. This cannot legally happen.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c |  8 +++-----
 drivers/gpu/drm/ast/ast_drv.h    |  4 ++--
 drivers/gpu/drm/ast/ast_mode.c   | 19 ++++++++++++-------
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 5ee724bfd682..2d3ad7610c2e 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -91,7 +91,7 @@ static u32 ast_cursor_calculate_checksum(const void *src, unsigned int width, un
 static void ast_set_cursor_image(struct ast_device *ast, const u8 *src,
 				 unsigned int width, unsigned int height)
 {
-	u8 __iomem *dst = ast->cursor_plane.base.vaddr;
+	u8 __iomem *dst = ast_plane_vaddr(&ast->cursor_plane.base);
 	u32 csum;
 
 	csum = ast_cursor_calculate_checksum(src, width, height);
@@ -193,7 +193,7 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	struct ast_device *ast = to_ast_device(plane->dev);
 	struct drm_rect damage;
 	u64 dst_off = ast_plane->offset;
-	u8 __iomem *dst = ast_plane->vaddr; /* TODO: Use mapping abstraction properly */
+	u8 __iomem *dst = ast_plane_vaddr(ast_plane); /* TODO: Use mapping abstraction properly */
 	u8 __iomem *sig = dst + AST_HWC_SIZE; /* TODO: Use mapping abstraction properly */
 	unsigned int offset_x, offset_y;
 	u16 x, y;
@@ -291,7 +291,6 @@ int ast_cursor_plane_init(struct ast_device *ast)
 	struct ast_plane *ast_plane = &ast_cursor_plane->base;
 	struct drm_plane *cursor_plane = &ast_plane->base;
 	unsigned long size;
-	void __iomem *vaddr;
 	long offset;
 	int ret;
 
@@ -299,9 +298,8 @@ int ast_cursor_plane_init(struct ast_device *ast)
 	offset = ast_cursor_vram_offset(ast);
 	if (offset < 0)
 		return offset;
-	vaddr = ast->vram + offset;
 
-	ret = ast_plane_init(dev, ast_plane, vaddr, offset, size,
+	ret = ast_plane_init(dev, ast_plane, offset, size,
 			     0x01, &ast_cursor_plane_funcs,
 			     ast_cursor_plane_formats, ARRAY_SIZE(ast_cursor_plane_formats),
 			     NULL, DRM_PLANE_TYPE_CURSOR);
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index d9da2328d46b..2ee402096cd9 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -122,7 +122,6 @@ enum ast_config_mode {
 struct ast_plane {
 	struct drm_plane base;
 
-	void __iomem *vaddr;
 	u64 offset;
 	unsigned long size;
 };
@@ -443,11 +442,12 @@ int ast_astdp_output_init(struct ast_device *ast);
 /* ast_mode.c */
 int ast_mode_config_init(struct ast_device *ast);
 int ast_plane_init(struct drm_device *dev, struct ast_plane *ast_plane,
-		   void __iomem *vaddr, u64 offset, unsigned long size,
+		   u64 offset, unsigned long size,
 		   uint32_t possible_crtcs,
 		   const struct drm_plane_funcs *funcs,
 		   const uint32_t *formats, unsigned int format_count,
 		   const uint64_t *format_modifiers,
 		   enum drm_plane_type type);
+void __iomem *ast_plane_vaddr(struct ast_plane *ast);
 
 #endif
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 20fbea11b710..d3ed27faefd1 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -457,7 +457,7 @@ static void ast_wait_for_vretrace(struct ast_device *ast)
  */
 
 int ast_plane_init(struct drm_device *dev, struct ast_plane *ast_plane,
-		   void __iomem *vaddr, u64 offset, unsigned long size,
+		   u64 offset, unsigned long size,
 		   uint32_t possible_crtcs,
 		   const struct drm_plane_funcs *funcs,
 		   const uint32_t *formats, unsigned int format_count,
@@ -466,7 +466,6 @@ int ast_plane_init(struct drm_device *dev, struct ast_plane *ast_plane,
 {
 	struct drm_plane *plane = &ast_plane->base;
 
-	ast_plane->vaddr = vaddr;
 	ast_plane->offset = offset;
 	ast_plane->size = size;
 
@@ -475,6 +474,13 @@ int ast_plane_init(struct drm_device *dev, struct ast_plane *ast_plane,
 					type, NULL);
 }
 
+void __iomem *ast_plane_vaddr(struct ast_plane *ast_plane)
+{
+	struct ast_device *ast = to_ast_device(ast_plane->base.dev);
+
+	return ast->vram + ast_plane->offset;
+}
+
 /*
  * Primary plane
  */
@@ -521,7 +527,7 @@ static void ast_handle_damage(struct ast_plane *ast_plane, struct iosys_map *src
 			      struct drm_framebuffer *fb,
 			      const struct drm_rect *clip)
 {
-	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane->vaddr);
+	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane_vaddr(ast_plane));
 
 	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
 	drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
@@ -594,12 +600,12 @@ static int ast_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
 {
 	struct ast_plane *ast_plane = to_ast_plane(plane);
 
-	if (plane->state && plane->state->fb && ast_plane->vaddr) {
+	if (plane->state && plane->state->fb) {
 		sb->format = plane->state->fb->format;
 		sb->width = plane->state->fb->width;
 		sb->height = plane->state->fb->height;
 		sb->pitch[0] = plane->state->fb->pitches[0];
-		iosys_map_set_vaddr_iomem(&sb->map[0], ast_plane->vaddr);
+		iosys_map_set_vaddr_iomem(&sb->map[0], ast_plane_vaddr(ast_plane));
 		return 0;
 	}
 	return -ENODEV;
@@ -626,12 +632,11 @@ static int ast_primary_plane_init(struct ast_device *ast)
 	struct drm_device *dev = &ast->base;
 	struct ast_plane *ast_primary_plane = &ast->primary_plane;
 	struct drm_plane *primary_plane = &ast_primary_plane->base;
-	void __iomem *vaddr = ast->vram;
 	u64 offset = ast_fb_vram_offset();
 	unsigned long size = ast_fb_vram_size(ast);
 	int ret;
 
-	ret = ast_plane_init(dev, ast_primary_plane, vaddr, offset, size,
+	ret = ast_plane_init(dev, ast_primary_plane, offset, size,
 			     0x01, &ast_primary_plane_funcs,
 			     ast_primary_plane_formats, ARRAY_SIZE(ast_primary_plane_formats),
 			     NULL, DRM_PLANE_TYPE_PRIMARY);
-- 
2.48.1

