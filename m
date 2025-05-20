Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D5EABD3C8
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 11:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595D3892A6;
	Tue, 20 May 2025 09:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22896892A6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 09:45:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AEFF322385;
 Tue, 20 May 2025 09:45:11 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E0D513A3E;
 Tue, 20 May 2025 09:45:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gN2IGSdPLGhVXwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 May 2025 09:45:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, airlied@redhat.com,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/5] drm/ast: Use helpers for programming gamma ramps and
 palettes
Date: Tue, 20 May 2025 11:40:04 +0200
Message-ID: <20250520094203.30545-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520094203.30545-1-tzimmermann@suse.de>
References: <20250520094203.30545-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: AEFF322385
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
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

Replace ast's code for programming the hardware gamma/palette LUT
with DRM helpers. Either load provided data or program a default.
Set the individual entries with a callback.

Each gamma/palette value is given as 3 individual 16-bit values
for red, green and blue. The driver reduces them to 8 bit to make
them fit into hardware registers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 69 +++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 1de832964e92..7908087bcb5a 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -34,6 +34,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_format_helper.h>
@@ -71,31 +72,44 @@ static unsigned long ast_fb_vram_size(struct ast_device *ast)
 	return cursor_offset - offset;
 }
 
-static inline void ast_load_palette_index(struct ast_device *ast,
-				     u8 index, u8 red, u8 green,
-				     u8 blue)
+static void ast_set_gamma_lut(struct drm_crtc *crtc, unsigned int index,
+			      u16 red, u16 green, u16 blue)
 {
-	ast_io_write8(ast, AST_IO_VGADWR, index);
+	struct drm_device *dev = crtc->dev;
+	struct ast_device *ast = to_ast_device(dev);
+	u8 i8 = index & 0xff;
+	u8 r8 = red >> 8;
+	u8 g8 = green >> 8;
+	u8 b8 = blue >> 8;
+
+	if (drm_WARN_ON_ONCE(dev, index != i8))
+		return; /* driver bug */
+
+	ast_io_write8(ast, AST_IO_VGADWR, i8);
 	ast_io_read8(ast, AST_IO_VGASRI);
-	ast_io_write8(ast, AST_IO_VGAPDR, red);
+	ast_io_write8(ast, AST_IO_VGAPDR, r8);
 	ast_io_read8(ast, AST_IO_VGASRI);
-	ast_io_write8(ast, AST_IO_VGAPDR, green);
+	ast_io_write8(ast, AST_IO_VGAPDR, g8);
 	ast_io_read8(ast, AST_IO_VGASRI);
-	ast_io_write8(ast, AST_IO_VGAPDR, blue);
+	ast_io_write8(ast, AST_IO_VGAPDR, b8);
 	ast_io_read8(ast, AST_IO_VGASRI);
 }
 
-static void ast_crtc_set_gamma_linear(struct ast_device *ast,
-				      const struct drm_format_info *format)
+static void ast_crtc_fill_gamma(struct ast_device *ast,
+				const struct drm_format_info *format)
 {
-	int i;
+	struct drm_crtc *crtc = &ast->crtc;
 
 	switch (format->format) {
-	case DRM_FORMAT_C8: /* In this case, gamma table is used as color palette */
+	case DRM_FORMAT_C8:
+		/* gamma table is used as color palette */
+		drm_crtc_fill_palette_8(crtc, ast_set_gamma_lut);
+		break;
 	case DRM_FORMAT_RGB565:
+		/* also uses 8-bit gamma ramp on low-color modes */
+		fallthrough;
 	case DRM_FORMAT_XRGB8888:
-		for (i = 0; i < AST_LUT_SIZE; i++)
-			ast_load_palette_index(ast, i, i, i, i);
+		drm_crtc_fill_gamma_888(crtc, ast_set_gamma_lut);
 		break;
 	default:
 		drm_warn_once(&ast->base, "Unsupported format %p4cc for gamma correction\n",
@@ -104,21 +118,22 @@ static void ast_crtc_set_gamma_linear(struct ast_device *ast,
 	}
 }
 
-static void ast_crtc_set_gamma(struct ast_device *ast,
-			       const struct drm_format_info *format,
-			       struct drm_color_lut *lut)
+static void ast_crtc_load_gamma(struct ast_device *ast,
+				const struct drm_format_info *format,
+				struct drm_color_lut *lut)
 {
-	int i;
+	struct drm_crtc *crtc = &ast->crtc;
 
 	switch (format->format) {
-	case DRM_FORMAT_C8: /* In this case, gamma table is used as color palette */
+	case DRM_FORMAT_C8:
+		/* gamma table is used as color palette */
+		drm_crtc_load_palette_8(crtc, lut, ast_set_gamma_lut);
+		break;
 	case DRM_FORMAT_RGB565:
+		/* also uses 8-bit gamma ramp on low-color modes */
+		fallthrough;
 	case DRM_FORMAT_XRGB8888:
-		for (i = 0; i < AST_LUT_SIZE; i++)
-			ast_load_palette_index(ast, i,
-					       lut[i].red >> 8,
-					       lut[i].green >> 8,
-					       lut[i].blue >> 8);
+		drm_crtc_load_gamma_888(crtc, lut, ast_set_gamma_lut);
 		break;
 	default:
 		drm_warn_once(&ast->base, "Unsupported format %p4cc for gamma correction\n",
@@ -811,11 +826,11 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 	 */
 	if (crtc_state->enable && crtc_state->color_mgmt_changed) {
 		if (crtc_state->gamma_lut)
-			ast_crtc_set_gamma(ast,
-					   ast_crtc_state->format,
-					   crtc_state->gamma_lut->data);
+			ast_crtc_load_gamma(ast,
+					    ast_crtc_state->format,
+					    crtc_state->gamma_lut->data);
 		else
-			ast_crtc_set_gamma_linear(ast, ast_crtc_state->format);
+			ast_crtc_fill_gamma(ast, ast_crtc_state->format);
 	}
 }
 
-- 
2.49.0

