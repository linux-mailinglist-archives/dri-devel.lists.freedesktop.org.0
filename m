Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DD78420C7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D8F112ED8;
	Tue, 30 Jan 2024 10:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B9F112EEE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:07:51 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EABF0222E1;
 Tue, 30 Jan 2024 10:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3keziLJgNM2y0DIEDQeOvoIzfq4mkjYkQjirruLdWu4=;
 b=S0c2bHSoDUO3jgKz3yXXU0vTs11i+1lMPWEjMia3NxgDQz+X8jbqKegFy0ox7mB0nDR6EP
 qG2A5BVYSh8aw47zdq5WDLxXMAyUR07ocehkVL19tuemACPaCL0O1JpqJBneV/dgeFu/EG
 qhDn6MAD3HQzsBjydWMgTsQTGs7a3XY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3keziLJgNM2y0DIEDQeOvoIzfq4mkjYkQjirruLdWu4=;
 b=h+jntL7tyBUvvHA4Srtb1M3tChBouPZzSls84KlqYplpMdMyntMmIjZ9b6eT8dP6OU874A
 A6phTTouacXX33Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3keziLJgNM2y0DIEDQeOvoIzfq4mkjYkQjirruLdWu4=;
 b=0o0dBXfy/cStvdjD4f7Op0DD2Y68K7/A6zVHCpf5MhWdPAQD3tHbTQHYgCPcsRByPVt2gw
 OeNu8QTfgzFAYgtdAd/efg3lE/0jiknGXjqe8NKaHTgAA55cA+7UOvDwQsam4XnItChe1L
 DkF1eemN/xsi8Ik9MUeDAbFfAOs45X0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609239;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3keziLJgNM2y0DIEDQeOvoIzfq4mkjYkQjirruLdWu4=;
 b=+LdTPxrrhT8quoc+gTsGdXkgrNuw4p+6X1R3sMIqVjMtMwDBQxRK0ae4QgJn91jsfhYFVd
 uEbg5Re0FPBm+8AQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id BCFD51376E;
 Tue, 30 Jan 2024 10:07:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id sGQOLVfKuGXdcwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 10:07:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com
Subject: [PATCH 19/23] drm/format-helper: Use struct drm_pixmap for
 drm_fb_blit()
Date: Tue, 30 Jan 2024 10:53:54 +0100
Message-ID: <20240130100714.12608-20-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130100714.12608-1-tzimmermann@suse.de>
References: <20240130100714.12608-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [1.90 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; TO_DN_SOME(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLson8px8pywph8mow9a7f4xe8)];
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

Store the source-buffer parameters of drm_fb_blit() in struct
drm_pixmap. Update the function's interface and all of its callers.

Callers of drm_fb_blit() initialize the pixmap's instance from a
pre-existing instance of struct drm_framebuffer. There's potential
to simplify some of that code in a later patch.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c           | 24 +++++-------
 .../gpu/drm/tests/drm_format_helper_test.c    | 38 ++++++++++---------
 drivers/gpu/drm/tiny/cirrus.c                 |  6 ++-
 drivers/gpu/drm/tiny/ofdrm.c                  |  6 ++-
 drivers/gpu/drm/tiny/simpledrm.c              |  6 ++-
 include/drm/drm_format_helper.h               |  7 ++--
 6 files changed, 47 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 1dc59c750c3b4..6b80be55cc5c0 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -999,19 +999,18 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
 
 /**
  * drm_fb_blit - Copy parts of a framebuffer to display memory
+ * @dev:	DRM device
  * @dst:	Array of display-memory addresses to copy to
  * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
  *             within @dst; can be NULL if scanlines are stored next to each other.
  * @dst_format:	FOURCC code of the display's color format
- * @src:	The framebuffer memory to copy from
- * @fb:		The framebuffer to copy from
- * @clip:	Clip rectangle area to copy
+ * @src_pix: Source pixmap to copy from
  * @state: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory. If the
  * formats of the display and the framebuffer mismatch, the blit function
- * will attempt to convert between them during the process. The parameters @dst,
- * @dst_pitch and @src refer to arrays. Each array must have at least as many
+ * will attempt to convert between them during the process. The parameters @dst
+ * and @dst_pitch refer to arrays. Each array must have at least as many
  * entries as there are planes in @dst_format's format. Each entry stores the
  * value for the format's respective color plane at the same index.
  *
@@ -1023,15 +1022,12 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
  * -EINVAL if the color-format conversion failed, or
  * a negative error code otherwise.
  */
-int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
-		const struct iosys_map *src, const struct drm_framebuffer *fb,
-		const struct drm_rect *clip, struct drm_format_conv_state *state)
+int drm_fb_blit(struct drm_device *dev,
+		struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
+		const struct drm_pixmap *src_pix,
+		struct drm_format_conv_state *state)
 {
-	struct drm_device *dev = fb->dev;
-	uint32_t fb_format = fb->format->format;
-	struct drm_pixmap pixmap;
-	struct drm_pixmap *src_pix = &pixmap;
-	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
+	uint32_t fb_format = src_pix->format->format;
 
 	if (fb_format == dst_format) {
 		drm_fb_memcpy(dst, dst_pitch, src_pix);
@@ -1079,7 +1075,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		}
 	}
 
-	drm_warn_once(fb->dev, "No conversion helper from %p4cc to %p4cc found.\n",
+	drm_warn_once(dev, "No conversion helper from %p4cc to %p4cc found.\n",
 		      &fb_format, &dst_format);
 
 	return -EINVAL;
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 8c3de91191006..568d6aecc1776 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -723,7 +723,7 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGB565, &src, &fb, &params->clip,
+	blit_result = drm_fb_blit(NULL, &dst, dst_pitch, DRM_FORMAT_RGB565, &src_pix,
 				  &fmtcnv_state);
 
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
@@ -772,7 +772,7 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB1555, &src, &fb, &params->clip,
+	blit_result = drm_fb_blit(NULL, &dst, dst_pitch, DRM_FORMAT_XRGB1555, &src_pix,
 				  &fmtcnv_state);
 
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
@@ -822,7 +822,7 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB1555, &src, &fb, &params->clip,
+	blit_result = drm_fb_blit(NULL, &dst, dst_pitch, DRM_FORMAT_ARGB1555, &src_pix,
 				  &fmtcnv_state);
 
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
@@ -872,7 +872,7 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGBA5551, &src, &fb, &params->clip,
+	blit_result = drm_fb_blit(NULL, &dst, dst_pitch, DRM_FORMAT_RGBA5551, &src_pix,
 				  &fmtcnv_state);
 
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
@@ -925,7 +925,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGB888, &src, &fb, &params->clip,
+	blit_result = drm_fb_blit(NULL, &dst, dst_pitch, DRM_FORMAT_RGB888, &src_pix,
 				  &fmtcnv_state);
 
 	KUNIT_EXPECT_FALSE(test, blit_result);
@@ -973,7 +973,7 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB8888, &src, &fb, &params->clip,
+	blit_result = drm_fb_blit(NULL, &dst, dst_pitch, DRM_FORMAT_ARGB8888, &src_pix,
 				  &fmtcnv_state);
 
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
@@ -1023,8 +1023,8 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB2101010, &src, &fb,
-				  &params->clip, &fmtcnv_state);
+	blit_result = drm_fb_blit(NULL, &dst, dst_pitch, DRM_FORMAT_XRGB2101010, &src_pix,
+				  &fmtcnv_state);
 
 	KUNIT_EXPECT_FALSE(test, blit_result);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
@@ -1071,8 +1071,8 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB2101010, &src, &fb,
-				  &params->clip, &fmtcnv_state);
+	blit_result = drm_fb_blit(NULL, &dst, dst_pitch, DRM_FORMAT_ARGB2101010, &src_pix,
+				  &fmtcnv_state);
 
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 
@@ -1157,8 +1157,8 @@ static void drm_test_fb_swab(struct kunit *test)
 
 	int blit_result;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB8888 | DRM_FORMAT_BIG_ENDIAN,
-				  &src, &fb, &params->clip, &fmtcnv_state);
+	blit_result = drm_fb_blit(NULL, &dst, dst_pitch, DRM_FORMAT_XRGB8888 | DRM_FORMAT_BIG_ENDIAN,
+				  &src_pix, &fmtcnv_state);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 
 	KUNIT_EXPECT_FALSE(test, blit_result);
@@ -1167,7 +1167,7 @@ static void drm_test_fb_swab(struct kunit *test)
 	buf = dst.vaddr;
 	memset(buf, 0, dst_size);
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_BGRX8888, &src, &fb, &params->clip,
+	blit_result = drm_fb_blit(NULL, &dst, dst_pitch, DRM_FORMAT_BGRX8888, &src_pix,
 				  &fmtcnv_state);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 
@@ -1182,7 +1182,7 @@ static void drm_test_fb_swab(struct kunit *test)
 	mock_format.format |= DRM_FORMAT_BIG_ENDIAN;
 	fb.format = &mock_format;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB8888, &src, &fb, &params->clip,
+	blit_result = drm_fb_blit(NULL, &dst, dst_pitch, DRM_FORMAT_XRGB8888, &src_pix,
 				  &fmtcnv_state);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 
@@ -1198,6 +1198,7 @@ static void drm_test_fb_xrgb8888_to_abgr8888(struct kunit *test)
 	u32 *buf = NULL;
 	__le32 *xrgb8888 = NULL;
 	struct iosys_map dst, src;
+	struct drm_pixmap src_pix;
 
 	struct drm_framebuffer fb = {
 		.format = drm_format_info(DRM_FORMAT_XRGB8888),
@@ -1221,7 +1222,8 @@ static void drm_test_fb_xrgb8888_to_abgr8888(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ABGR8888, &src, &fb, &params->clip,
+	drm_pixmap_init_from_framebuffer(&src_pix, &fb, &src, &params->clip);
+	blit_result = drm_fb_blit(NULL, &dst, dst_pitch, DRM_FORMAT_ABGR8888, &src_pix,
 				  &fmtcnv_state);
 
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
@@ -1238,6 +1240,7 @@ static void drm_test_fb_xrgb8888_to_xbgr8888(struct kunit *test)
 	u32 *buf = NULL;
 	__le32 *xrgb8888 = NULL;
 	struct iosys_map dst, src;
+	struct drm_pixmap src_pix;
 
 	struct drm_framebuffer fb = {
 		.format = drm_format_info(DRM_FORMAT_XRGB8888),
@@ -1261,7 +1264,8 @@ static void drm_test_fb_xrgb8888_to_xbgr8888(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XBGR8888, &src, &fb, &params->clip,
+	drm_pixmap_init_from_framebuffer(&src_pix, &fb, &src, &params->clip);
+	blit_result = drm_fb_blit(NULL, &dst, dst_pitch, DRM_FORMAT_XBGR8888, &src_pix,
 				  &fmtcnv_state);
 
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
@@ -1868,7 +1872,7 @@ static void drm_test_fb_memcpy(struct kunit *test)
 
 	int blit_result;
 
-	blit_result = drm_fb_blit(dst, dst_pitches, params->format, src, &fb, &params->clip,
+	blit_result = drm_fb_blit(NULL, dst, dst_pitches, params->format, &src_pix,
 				  &fmtcnv_state);
 
 	KUNIT_EXPECT_FALSE(test, blit_result);
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 4e3a152f897ac..07dae69613733 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -410,9 +410,11 @@ static void cirrus_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		unsigned int offset = drm_fb_clip_offset(pitch, format, &damage);
 		struct iosys_map dst = IOSYS_MAP_INIT_OFFSET(&vaddr, offset);
+		struct drm_pixmap src_pix;
 
-		drm_fb_blit(&dst, &pitch, format->format, shadow_plane_state->data, fb,
-			    &damage, &shadow_plane_state->fmtcnv_state);
+		drm_pixmap_init_from_framebuffer(&src_pix, fb, shadow_plane_state->data, &damage);
+		drm_fb_blit(plane->dev, &dst, &pitch, format->format, &src_pix,
+			    &shadow_plane_state->fmtcnv_state);
 	}
 
 	drm_dev_exit(idx);
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index ab89b7fc7bf61..d99bcdcdbc6b8 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -824,13 +824,15 @@ static void ofdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		struct iosys_map dst = odev->screen_base;
 		struct drm_rect dst_clip = plane_state->dst;
+		struct drm_pixmap src_pix;
 
 		if (!drm_rect_intersect(&dst_clip, &damage))
 			continue;
 
 		iosys_map_incr(&dst, drm_fb_clip_offset(dst_pitch, dst_format, &dst_clip));
-		drm_fb_blit(&dst, &dst_pitch, dst_format->format, shadow_plane_state->data, fb,
-			    &damage, &shadow_plane_state->fmtcnv_state);
+		drm_pixmap_init_from_framebuffer(&src_pix, fb, shadow_plane_state->data, &damage);
+		drm_fb_blit(dev, &dst, &dst_pitch, dst_format->format, &src_pix,
+			    &shadow_plane_state->fmtcnv_state);
 	}
 
 	drm_dev_exit(idx);
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 7ce1c46176750..7ea2b28652715 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -641,13 +641,15 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		struct drm_rect dst_clip = plane_state->dst;
 		struct iosys_map dst = sdev->screen_base;
+		struct drm_pixmap src_pix;
 
 		if (!drm_rect_intersect(&dst_clip, &damage))
 			continue;
 
 		iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
-		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data,
-			    fb, &damage, &shadow_plane_state->fmtcnv_state);
+		drm_pixmap_init_from_framebuffer(&src_pix, fb, shadow_plane_state->data, &damage);
+		drm_fb_blit(dev, &dst, &sdev->pitch, sdev->format->format, &src_pix,
+			    &shadow_plane_state->fmtcnv_state);
 	}
 
 	drm_dev_exit(idx);
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 5e188bcc18b7f..a78360e229a45 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -133,9 +133,10 @@ void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pit
 			      const struct drm_pixmap *src_pix,
 			      struct drm_format_conv_state *state);
 
-int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
-		const struct iosys_map *src, const struct drm_framebuffer *fb,
-		const struct drm_rect *clip, struct drm_format_conv_state *state);
+int drm_fb_blit(struct drm_device *dev,
+		struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
+		const struct drm_pixmap *src_pix,
+		struct drm_format_conv_state *state);
 
 void drm_fb_xrgb8888_to_mono(struct drm_device *dev,
 			     struct iosys_map *dst, const unsigned int *dst_pitch,
-- 
2.43.0

