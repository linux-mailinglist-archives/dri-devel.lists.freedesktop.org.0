Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFA78420A7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD55112EC1;
	Tue, 30 Jan 2024 10:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0197F112EC1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:07:18 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ECC0A1F841;
 Tue, 30 Jan 2024 10:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iwulALaFyHT07XHNksGcJ5uvE62faLJA1E+ybefy3vg=;
 b=R5H7BtJtrHe3S3GWxml6k4tohwfMGnhnmlkqRqwQ2YAD60itQEQQWQFugstACGJhuvE29d
 6mFC6fcdpuBXET10BSvs6k6idDLvNswmFdQFYCvARVR+MYfzEjCsJmLzlA/Thswb3va0N2
 dqaTNktwB7ReLgOIBjg6q34hab+n+EI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iwulALaFyHT07XHNksGcJ5uvE62faLJA1E+ybefy3vg=;
 b=OfEdS37ONJJLgkQssLwKIHRc0iJ9esD65yh7QWIk3/2X4lXfuftXtnVYeTT3x2wAhAPB+V
 Bp3NksXIrw6sgLBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iwulALaFyHT07XHNksGcJ5uvE62faLJA1E+ybefy3vg=;
 b=BL9PszMC5c3MqJsyrTIGZmpCcnc6jmyKs4Y5ezIi1WMqCYNExRQQRsskQes/U/NAtvK1ui
 EjFz42EQ7FpKlSbgfMyfOg4Bjpk6cGzu3ltbYQcYPSBV7WFhYqFUDj4zNr5XF7tmS19DgJ
 LTVgiIMMqrbHmQNVh0tiQ3kFC0T3sBU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609236;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iwulALaFyHT07XHNksGcJ5uvE62faLJA1E+ybefy3vg=;
 b=hV4kJwJndyDR+owg5ywijGWI4jILUVF4R22WuNhwEAM+RXBUzWjhVvY/EhQlMOnDsJSdlf
 ZCl5muiP8/ZB1lAQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id C73DD139E1;
 Tue, 30 Jan 2024 10:07:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id GF+LL1TKuGXdcwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 10:07:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com
Subject: [PATCH 02/23] drm/format-helper: Use struct drm_pixmap for
 drm_fb_memcpy()
Date: Tue, 30 Jan 2024 10:53:37 +0100
Message-ID: <20240130100714.12608-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130100714.12608-1-tzimmermann@suse.de>
References: <20240130100714.12608-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [1.90 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: *
X-Spam-Score: 1.90
X-Spam-Flag: NO
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Store the source-buffer parameters of drm_fb_memcpy() in struct
drm_pixmap. Update the function's interface and all of its callers.

Callers of drm_fb_memcpy() initialize the pixmap's instance from a
pre-existing instance of struct drm_framebuffer. There's potential
to simplify some of that code in a later patch.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c                |  4 ++-
 drivers/gpu/drm/drm_format_helper.c           | 31 ++++++++++---------
 drivers/gpu/drm/drm_mipi_dbi.c                |  5 ++-
 drivers/gpu/drm/gud/gud_pipe.c                |  9 ++++--
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |  4 ++-
 drivers/gpu/drm/mgag200/mgag200_mode.c        |  4 ++-
 .../gpu/drm/tests/drm_format_helper_test.c    |  5 ++-
 include/drm/drm_format_helper.h               |  3 +-
 8 files changed, 42 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index a718646a66b8f..ef6da4098b2df 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -632,9 +632,11 @@ static void ast_handle_damage(struct ast_plane *ast_plane, struct iosys_map *src
 			      const struct drm_rect *clip)
 {
 	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane->vaddr);
+	struct drm_pixmap src_pix;
 
 	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
-	drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
+	drm_pixmap_init_from_framebuffer(&src_pix, fb, src, clip);
+	drm_fb_memcpy(&dst, fb->pitches, &src_pix);
 }
 
 static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 0b69b16d5802a..593789b7a7be7 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -298,29 +298,29 @@ static int drm_fb_xfrm(struct iosys_map *dst,
  * @dst: Array of destination buffers
  * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
  *             within @dst; can be NULL if scanlines are stored next to each other.
- * @src: Array of source buffers
- * @fb: DRM framebuffer
- * @clip: Clip rectangle area to copy
+ * @src_pix: Source pixmap to copy from
  *
  * This function copies parts of a framebuffer to display memory. Destination and
- * framebuffer formats must match. No conversion takes place. The parameters @dst,
- * @dst_pitch and @src refer to arrays. Each array must have at least as many entries
- * as there are planes in @fb's format. Each entry stores the value for the format's
+ * framebuffer formats must match. No conversion takes place. The parameters @dst
+ * and @dst_pitch refer to arrays. Each array must have at least as many entries
+ * as there are planes in pixmap's format. Each entry stores the value for the format's
  * respective color plane at the same index.
  *
  * This function does not apply clipping on @dst (i.e. the destination is at the
  * top-left corner).
  */
 void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
-		   const struct iosys_map *src, const struct drm_framebuffer *fb,
-		   const struct drm_rect *clip)
+		   const struct drm_pixmap *src_pix)
 {
 	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
 		0, 0, 0, 0
 	};
 
-	const struct drm_format_info *format = fb->format;
-	unsigned int i, y, lines = drm_rect_height(clip);
+	const struct drm_format_info *format = src_pix->format;
+	const struct drm_rect *src_clip = &src_pix->clip;
+	const unsigned int *src_pitches = src_pix->pitches;
+	const struct iosys_map *src = src_pix->data;
+	unsigned int i, y, lines = drm_rect_height(src_clip);
 
 	if (!dst_pitch)
 		dst_pitch = default_dst_pitch;
@@ -328,7 +328,7 @@ void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
 	for (i = 0; i < format->num_planes; ++i) {
 		unsigned int bpp_i = drm_format_info_bpp(format, i);
 		unsigned int cpp_i = DIV_ROUND_UP(bpp_i, 8);
-		size_t len_i = DIV_ROUND_UP(drm_rect_width(clip) * bpp_i, 8);
+		size_t len_i = DIV_ROUND_UP(drm_rect_width(src_clip) * bpp_i, 8);
 		unsigned int dst_pitch_i = dst_pitch[i];
 		struct iosys_map dst_i = dst[i];
 		struct iosys_map src_i = src[i];
@@ -336,11 +336,11 @@ void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
 		if (!dst_pitch_i)
 			dst_pitch_i = len_i;
 
-		iosys_map_incr(&src_i, clip_offset(clip, fb->pitches[i], cpp_i));
+		iosys_map_incr(&src_i, clip_offset(src_clip, src_pitches[i], cpp_i));
 		for (y = 0; y < lines; y++) {
 			/* TODO: handle src_i in I/O memory here */
 			iosys_map_memcpy_to(&dst_i, 0, src_i.vaddr, len_i);
-			iosys_map_incr(&src_i, fb->pitches[i]);
+			iosys_map_incr(&src_i, src_pitches[i]);
 			iosys_map_incr(&dst_i, dst_pitch_i);
 		}
 	}
@@ -1058,9 +1058,12 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		const struct drm_rect *clip, struct drm_format_conv_state *state)
 {
 	uint32_t fb_format = fb->format->format;
+	struct drm_pixmap pixmap;
+	struct drm_pixmap *src_pix = &pixmap;
+	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
 	if (fb_format == dst_format) {
-		drm_fb_memcpy(dst, dst_pitch, src, fb, clip);
+		drm_fb_memcpy(dst, dst_pitch, src_pix);
 		return 0;
 	} else if (fb_format == (dst_format | DRM_FORMAT_BIG_ENDIAN)) {
 		drm_fb_swab(dst, dst_pitch, src, fb, clip, false, state);
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index daac649aabdbe..0ad2bdc19712e 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -208,19 +208,22 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *
 {
 	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
 	struct iosys_map dst_map = IOSYS_MAP_INIT_VADDR(dst);
+	struct drm_pixmap src_pix;
 	int ret;
 
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
 	if (ret)
 		return ret;
 
+	drm_pixmap_init_from_framebuffer(&src_pix, fb, src, clip);
+
 	switch (fb->format->format) {
 	case DRM_FORMAT_RGB565:
 		if (swap)
 			drm_fb_swab(&dst_map, NULL, src, fb, clip, !gem->import_attach,
 				    fmtcnv_state);
 		else
-			drm_fb_memcpy(&dst_map, NULL, src, fb, clip);
+			drm_fb_memcpy(&dst_map, NULL, &src_pix);
 		break;
 	case DRM_FORMAT_XRGB8888:
 		drm_fb_xrgb8888_to_rgb565(&dst_map, NULL, src, fb, clip, fmtcnv_state, swap);
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index e163649816d50..57965400ee4d4 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -160,6 +160,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 	struct iosys_map dst;
 	void *vaddr, *buf;
 	size_t pitch, len;
+	struct drm_pixmap src_pix;
 
 	pitch = drm_format_info_min_pitch(format, 0, drm_rect_width(rect));
 	len = pitch * drm_rect_height(rect);
@@ -174,6 +175,8 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 		buf = gdrm->bulk_buf;
 	iosys_map_set_vaddr(&dst, buf);
 
+	drm_pixmap_init_from_framebuffer(&src_pix, fb, src, rect);
+
 	/*
 	 * Imported buffers are assumed to be write-combined and thus uncached
 	 * with slow reads (at least on ARM).
@@ -201,7 +204,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 		/* can compress directly from the framebuffer */
 		buf = vaddr + rect->y1 * pitch;
 	} else {
-		drm_fb_memcpy(&dst, NULL, src, fb, rect);
+		drm_fb_memcpy(&dst, NULL, &src_pix);
 	}
 
 	memset(req, 0, sizeof(*req));
@@ -392,6 +395,7 @@ static int gud_fb_queue_damage(struct gud_device *gdrm, struct drm_framebuffer *
 {
 	struct drm_framebuffer *old_fb = NULL;
 	struct iosys_map shadow_map;
+	struct drm_pixmap src_pix;
 
 	mutex_lock(&gdrm->damage_lock);
 
@@ -405,7 +409,8 @@ static int gud_fb_queue_damage(struct gud_device *gdrm, struct drm_framebuffer *
 
 	iosys_map_set_vaddr(&shadow_map, gdrm->shadow_buf);
 	iosys_map_incr(&shadow_map, drm_fb_clip_offset(fb->pitches[0], fb->format, damage));
-	drm_fb_memcpy(&shadow_map, fb->pitches, src, fb, damage);
+	drm_pixmap_init_from_framebuffer(&src_pix, fb, src, damage);
+	drm_fb_memcpy(&shadow_map, fb->pitches, &src_pix);
 
 	if (fb != gdrm->fb) {
 		old_fb = gdrm->fb;
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index 6c6b572987973..8bf2b8ea6e447 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -25,13 +25,15 @@ static int hyperv_blit_to_vram_rect(struct drm_framebuffer *fb,
 {
 	struct hyperv_drm_device *hv = to_hv(fb->dev);
 	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(hv->vram);
+	struct drm_pixmap src_pix;
 	int idx;
 
 	if (!drm_dev_enter(&hv->dev, &idx))
 		return -ENODEV;
 
 	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, rect));
-	drm_fb_memcpy(&dst, fb->pitches, vmap, fb, rect);
+	drm_pixmap_init_from_framebuffer(&src_pix, fb, vmap, rect);
+	drm_fb_memcpy(&dst, fb->pitches, &src_pix);
 
 	drm_dev_exit(idx);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 0eb769dd76ce0..c86ad7808a8cf 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -433,9 +433,11 @@ static void mgag200_handle_damage(struct mga_device *mdev, const struct iosys_ma
 				  struct drm_framebuffer *fb, struct drm_rect *clip)
 {
 	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(mdev->vram);
+	struct drm_pixmap src_pix;
 
 	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
-	drm_fb_memcpy(&dst, fb->pitches, vmap, fb, clip);
+	drm_pixmap_init_from_framebuffer(&src_pix, fb, vmap, clip);
+	drm_fb_memcpy(&dst, fb->pitches, &src_pix);
 }
 
 /*
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 08992636ec05f..a1f64872bb431 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -1801,6 +1801,7 @@ static void drm_test_fb_memcpy(struct kunit *test)
 	struct drm_framebuffer fb = {
 		.format = drm_format_info(params->format),
 	};
+	struct drm_pixmap src_pix;
 
 	memcpy(fb.pitches, params->src_pitches, DRM_FORMAT_MAX_PLANES * sizeof(int));
 
@@ -1820,7 +1821,9 @@ static void drm_test_fb_memcpy(struct kunit *test)
 	const unsigned int *dst_pitches = params->dst_pitches[0] == TEST_USE_DEFAULT_PITCH ? NULL :
 		params->dst_pitches;
 
-	drm_fb_memcpy(dst, dst_pitches, src, &fb, &params->clip);
+	drm_pixmap_init_from_framebuffer(&src_pix, &fb, src, &params->clip);
+
+	drm_fb_memcpy(dst, dst_pitches, &src_pix);
 
 	for (size_t i = 0; i < fb.format->num_planes; i++) {
 		expected[i] = cpubuf_to_le32(test, params->expected[i], TEST_BUF_SIZE);
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 56a98999503e2..4e3f6a24430ca 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -98,8 +98,7 @@ unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info
 				const struct drm_rect *clip);
 
 void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
-		   const struct iosys_map *src, const struct drm_framebuffer *fb,
-		   const struct drm_rect *clip);
+		   const struct drm_pixmap *src_pix);
 void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 		 const struct iosys_map *src, const struct drm_framebuffer *fb,
 		 const struct drm_rect *clip, bool cached,
-- 
2.43.0

