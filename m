Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9478AB0D6C
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 10:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E7310E3AE;
	Fri,  9 May 2025 08:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CkpNsqeA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ieNVU10+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CkpNsqeA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ieNVU10+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D5C10E977
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 08:42:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7CE581F74A;
 Fri,  9 May 2025 08:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746780139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30UpwQajeLJRhfjg1SzM9O2ImmNLR7o2h/ZiMbk/Q7I=;
 b=CkpNsqeA8DFA2pmsQcgu8DPsosmyQopC4WY0Ec+VMJEJG+An0hXtzQkyf1tSK7RXdTniAq
 1EkmxCkxFmxxC9KmsJCiyHSkT0P9oqkuTW/JvnjP7/lsEgzUGo+e6YLAitbcWW5XuuRjl4
 rmGZ4lLZ+WPZvqpUrYFBIw1n1SuFN2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746780139;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30UpwQajeLJRhfjg1SzM9O2ImmNLR7o2h/ZiMbk/Q7I=;
 b=ieNVU10+89fFJKx5xxW/uSV6dZEHCfudYPuyn5Xj/PP/Tb/ISjQAtwjY25pXAzIzSWyrxb
 E/PAsru7CVpcevBg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CkpNsqeA;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ieNVU10+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746780139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30UpwQajeLJRhfjg1SzM9O2ImmNLR7o2h/ZiMbk/Q7I=;
 b=CkpNsqeA8DFA2pmsQcgu8DPsosmyQopC4WY0Ec+VMJEJG+An0hXtzQkyf1tSK7RXdTniAq
 1EkmxCkxFmxxC9KmsJCiyHSkT0P9oqkuTW/JvnjP7/lsEgzUGo+e6YLAitbcWW5XuuRjl4
 rmGZ4lLZ+WPZvqpUrYFBIw1n1SuFN2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746780139;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30UpwQajeLJRhfjg1SzM9O2ImmNLR7o2h/ZiMbk/Q7I=;
 b=ieNVU10+89fFJKx5xxW/uSV6dZEHCfudYPuyn5Xj/PP/Tb/ISjQAtwjY25pXAzIzSWyrxb
 E/PAsru7CVpcevBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A26D13931;
 Fri,  9 May 2025 08:42:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yEADDeu/HWgpXwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 09 May 2025 08:42:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, airlied@redhat.com,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/5] drm/ast: Use helpers for programming gamma ramps and
 palettes
Date: Fri,  9 May 2025 10:23:16 +0200
Message-ID: <20250509083911.39018-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509083911.39018-1-tzimmermann@suse.de>
References: <20250509083911.39018-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 7CE581F74A
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_SEVEN(0.00)[9];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
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

