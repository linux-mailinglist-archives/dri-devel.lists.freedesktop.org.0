Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDD7A34A2A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:39:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64F510EB2A;
	Thu, 13 Feb 2025 16:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AIOy0h8l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N0rzD6OG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AIOy0h8l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N0rzD6OG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9192410EB29
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:38:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3EAE121C40;
 Thu, 13 Feb 2025 16:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739464731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0pMjFYFf/TlVJOFIt7rHPab7qXCWq23eUZWeiuHSFo=;
 b=AIOy0h8lsg/3GPVDlcwVSpE5HnzSRce7UZ6TB2Tbv13Gefy88klqVbmVIXurQDqIxvb40/
 91EoAkaS2MiWBP2oqSk/cqqi8rshrrDne/jEvQSen9tUYVlKFEJN7B55Gqeu62Zfab7qvv
 WGcTybu0IyOft0kAPoBf0Q48IteI8jw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739464731;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0pMjFYFf/TlVJOFIt7rHPab7qXCWq23eUZWeiuHSFo=;
 b=N0rzD6OGyoyw47hXQsB9mTL6JJCqmt/UZg6Fqmk3/AOzD7yy1XsLnAUaLTMMCcuEiiPN+7
 QCEp1XtWQLJfn5Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739464731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0pMjFYFf/TlVJOFIt7rHPab7qXCWq23eUZWeiuHSFo=;
 b=AIOy0h8lsg/3GPVDlcwVSpE5HnzSRce7UZ6TB2Tbv13Gefy88klqVbmVIXurQDqIxvb40/
 91EoAkaS2MiWBP2oqSk/cqqi8rshrrDne/jEvQSen9tUYVlKFEJN7B55Gqeu62Zfab7qvv
 WGcTybu0IyOft0kAPoBf0Q48IteI8jw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739464731;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0pMjFYFf/TlVJOFIt7rHPab7qXCWq23eUZWeiuHSFo=;
 b=N0rzD6OGyoyw47hXQsB9mTL6JJCqmt/UZg6Fqmk3/AOzD7yy1XsLnAUaLTMMCcuEiiPN+7
 QCEp1XtWQLJfn5Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19D45137DB;
 Thu, 13 Feb 2025 16:38:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WIK8BBsgrmfpFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Feb 2025 16:38:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/4] drm/ast: cursor: Move format conversion to shared helper
Date: Thu, 13 Feb 2025 17:25:47 +0100
Message-ID: <20250213163845.118207-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213163845.118207-1-tzimmermann@suse.de>
References: <20250213163845.118207-1-tzimmermann@suse.de>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
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

User-space cursor-image data is encoded in ARBG8888, while hardware
supports ARGB4444. Implement the format conversion as part of the
format-helper framework, so that other drivers can benefit.

This allows to respect the damage area of the cursor update. In
previous code, all cursor image data had to be converted on each
update. Now, only the changed areas require an update. The hardware
image is always updated completely, as it is required for the
checksum update.

The format-conversion helper still contains the old implementation's
optimization of writing 2 output pixels at the same time.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h       |  4 +-
 drivers/gpu/drm/ast/ast_mode.c      | 71 +++++++----------------------
 drivers/gpu/drm/drm_format_helper.c | 69 ++++++++++++++++++++++++++++
 include/drm/drm_format_helper.h     |  3 ++
 4 files changed, 92 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index d3115b31b032..973abd0cbd42 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -113,7 +113,9 @@ enum ast_config_mode {
 #define AST_MAX_HWC_WIDTH	64
 #define AST_MAX_HWC_HEIGHT	64
 
-#define AST_HWC_SIZE		(AST_MAX_HWC_WIDTH * AST_MAX_HWC_HEIGHT * 2)
+#define AST_HWC_PITCH		(AST_MAX_HWC_WIDTH * SZ_2)
+#define AST_HWC_SIZE		(AST_MAX_HWC_HEIGHT * AST_HWC_PITCH)
+
 #define AST_HWC_SIGNATURE_SIZE	32
 
 /* define for signature structure */
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 974f4eb46bc3..ed00275d6418 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -657,61 +657,16 @@ static u32 ast_cursor_calculate_checksum(const u8 *src, unsigned int width, unsi
 	return csum;
 }
 
-static void ast_update_cursor_image(u8 __iomem *dst, const u8 *src, u8 *tmp, int width, int height)
+static void ast_set_cursor_image(struct ast_device *ast, const u8 *src,
+				 unsigned int width, unsigned int height)
 {
-	union {
-		u32 ul;
-		u8 b[4];
-	} srcdata32[2], data32;
-	union {
-		u16 us;
-		u8 b[2];
-	} data16;
+	u8 __iomem *dst = ast->cursor_plane.base.vaddr;
 	u32 csum = 0;
-	s32 alpha_dst_delta, last_alpha_dst_delta;
-	u8 *dstxor;
-	const u8 *srcxor;
-	int i, j;
-	u32 per_pixel_copy, two_pixel_copy;
 
-	alpha_dst_delta = AST_MAX_HWC_WIDTH << 1;
-	last_alpha_dst_delta = alpha_dst_delta - (width << 1);
-
-	srcxor = src;
-	dstxor = tmp + last_alpha_dst_delta + (AST_MAX_HWC_HEIGHT - height) * alpha_dst_delta;
-	per_pixel_copy = width & 1;
-	two_pixel_copy = width >> 1;
-
-	for (j = 0; j < height; j++) {
-		for (i = 0; i < two_pixel_copy; i++) {
-			srcdata32[0].ul = *((u32 *)srcxor) & 0xf0f0f0f0;
-			srcdata32[1].ul = *((u32 *)(srcxor + 4)) & 0xf0f0f0f0;
-			data32.b[0] = srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
-			data32.b[1] = srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
-			data32.b[2] = srcdata32[1].b[1] | (srcdata32[1].b[0] >> 4);
-			data32.b[3] = srcdata32[1].b[3] | (srcdata32[1].b[2] >> 4);
-			memcpy(dstxor, &data32, 4);
-
-			dstxor += 4;
-			srcxor += 8;
-		}
-
-		for (i = 0; i < per_pixel_copy; i++) {
-			srcdata32[0].ul = *((u32 *)srcxor) & 0xf0f0f0f0;
-			data16.b[0] = srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
-			data16.b[1] = srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
-			memcpy(dstxor, &data16, 2);
-
-			dstxor += 2;
-			srcxor += 4;
-		}
-		dstxor += last_alpha_dst_delta;
-	}
-
-	csum = ast_cursor_calculate_checksum(tmp, width, height);
+	csum = ast_cursor_calculate_checksum(src, width, height);
 
 	/* write pixel data */
-	memcpy_toio(dst, tmp, AST_HWC_SIZE);
+	memcpy_toio(dst, src, AST_HWC_SIZE);
 
 	/* write checksum + signature */
 	dst += AST_HWC_SIZE;
@@ -800,9 +755,7 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct ast_device *ast = to_ast_device(plane->dev);
-	struct iosys_map src_map = shadow_plane_state->data[0];
 	struct drm_rect damage;
-	const u8 *src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
 	u64 dst_off = ast_plane->offset;
 	u8 __iomem *dst = ast_plane->vaddr; /* TODO: Use mapping abstraction properly */
 	u8 __iomem *sig = dst + AST_HWC_SIZE; /* TODO: Use mapping abstraction properly */
@@ -816,8 +769,18 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	 */
 
 	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &damage)) {
-		ast_update_cursor_image(dst, src, ast_cursor_plane->argb4444,
-					fb->width, fb->height);
+		u8 *argb4444 = ast_cursor_plane->argb4444;
+		struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
+			IOSYS_MAP_INIT_VADDR(argb4444),
+		};
+		unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+			AST_HWC_PITCH,
+		};
+
+		drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
+					    shadow_plane_state->data, fb, &damage,
+					    &shadow_plane_state->fmtcnv_state);
+		ast_set_cursor_image(ast, argb4444, fb->width, fb->height);
 		ast_set_cursor_base(ast, dst_off);
 	}
 
diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index b1be458ed4dd..ecb278b63e8c 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -978,6 +978,75 @@ void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pit
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
 
+static void drm_fb_argb8888_to_argb4444_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	unsigned int pixels2 = pixels & ~GENMASK_ULL(0, 0);
+	__le32 *dbuf32 = dbuf;
+	__le16 *dbuf16 = dbuf + pixels2 * sizeof(*dbuf16);
+	const __le32 *sbuf32 = sbuf;
+	unsigned int x;
+	u32 val32;
+	u16 val16;
+	u32 pix[2];
+
+	for (x = 0; x < pixels2; x += 2, ++dbuf32) {
+		pix[0] = le32_to_cpu(sbuf32[x]);
+		pix[1] = le32_to_cpu(sbuf32[x + 1]);
+		val32 = ((pix[0] & 0xf0000000) >> 16) |
+			((pix[0] & 0x00f00000) >> 12) |
+			((pix[0] & 0x0000f000) >> 8) |
+			((pix[0] & 0x000000f0) >> 4) |
+			((pix[1] & 0xf0000000) >> 0) |
+			((pix[1] & 0x00f00000) << 4) |
+			((pix[1] & 0x0000f000) << 8) |
+			((pix[1] & 0x000000f0) << 12);
+		*dbuf32 = cpu_to_le32(val32);
+	}
+	for (; x < pixels; x++) {
+		pix[0] = le32_to_cpu(sbuf32[x]);
+		val16 = ((pix[0] & 0xf0000000) >> 16) |
+			((pix[0] & 0x00f00000) >> 12) |
+			((pix[0] & 0x0000f000) >> 8) |
+			((pix[0] & 0x000000f0) >> 4);
+		dbuf16[x] = cpu_to_le16(val16);
+	}
+}
+
+/**
+ * drm_fb_argb8888_to_argb4444 - Convert ARGB8888 to ARGB4444 clip buffer
+ * @dst: Array of ARGB4444 destination buffers
+ * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
+ *             within @dst; can be NULL if scanlines are stored next to each other.
+ * @src: Array of ARGB8888 source buffer
+ * @fb: DRM framebuffer
+ * @clip: Clip rectangle area to copy
+ * @state: Transform and conversion state
+ *
+ * This function copies parts of a framebuffer to display memory and converts
+ * the color format during the process. The parameters @dst, @dst_pitch and
+ * @src refer to arrays. Each array must have at least as many entries as
+ * there are planes in @fb's format. Each entry stores the value for the
+ * format's respective color plane at the same index.
+ *
+ * This function does not apply clipping on @dst (i.e. the destination is at the
+ * top-left corner).
+ *
+ * Drivers can use this function for ARGB4444 devices that don't support
+ * ARGB8888 natively.
+ */
+void drm_fb_argb8888_to_argb4444(struct iosys_map *dst, const unsigned int *dst_pitch,
+				 const struct iosys_map *src, const struct drm_framebuffer *fb,
+				 const struct drm_rect *clip, struct drm_format_conv_state *state)
+{
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		2,
+	};
+
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
+		    drm_fb_argb8888_to_argb4444_line);
+}
+EXPORT_SYMBOL(drm_fb_argb8888_to_argb4444);
+
 /**
  * drm_fb_blit - Copy parts of a framebuffer to display memory
  * @dst:	Array of display-memory addresses to copy to
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 428d81afe215..a1347e47e9d5 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -110,6 +110,9 @@ void drm_fb_xrgb8888_to_argb2101010(struct iosys_map *dst, const unsigned int *d
 void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pitch,
 			      const struct iosys_map *src, const struct drm_framebuffer *fb,
 			      const struct drm_rect *clip, struct drm_format_conv_state *state);
+void drm_fb_argb8888_to_argb4444(struct iosys_map *dst, const unsigned int *dst_pitch,
+				 const struct iosys_map *src, const struct drm_framebuffer *fb,
+				 const struct drm_rect *clip, struct drm_format_conv_state *state);
 
 int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
 		const struct iosys_map *src, const struct drm_framebuffer *fb,
-- 
2.48.1

