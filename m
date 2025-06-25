Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 762E0AE81FD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 13:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F0610E21B;
	Wed, 25 Jun 2025 11:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RySJgz+u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TK9CH2SU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RySJgz+u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TK9CH2SU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E13210E21B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:52:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2EC491F441;
 Wed, 25 Jun 2025 11:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750852333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GnfgQPDtUCaCiC5U4ogm1lurvTCX9rTQH+ttp1Y5z7E=;
 b=RySJgz+ueBcuSlAKa19NkBZz0a483gloVbzxshMwDZsl00XZGN4/WC9tPXG62jdvqgQgjB
 +0//V1eFeksEz/aoh6YUjOpTtZ9jSULzEKH7COj+RyIN9WtHP8TIBrLV9Hj5BGH09GzbaS
 OIwHjNJIYENi6MKihd98CG5IPecImfo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750852333;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GnfgQPDtUCaCiC5U4ogm1lurvTCX9rTQH+ttp1Y5z7E=;
 b=TK9CH2SUKxktVcnBjYINLeE+SuUjJVWK5tzBur2nJDfMtYr7Dhs2kiIq1q4g7bIcdQmle2
 x0W0wBzJvkKZ8uDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750852333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GnfgQPDtUCaCiC5U4ogm1lurvTCX9rTQH+ttp1Y5z7E=;
 b=RySJgz+ueBcuSlAKa19NkBZz0a483gloVbzxshMwDZsl00XZGN4/WC9tPXG62jdvqgQgjB
 +0//V1eFeksEz/aoh6YUjOpTtZ9jSULzEKH7COj+RyIN9WtHP8TIBrLV9Hj5BGH09GzbaS
 OIwHjNJIYENi6MKihd98CG5IPecImfo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750852333;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GnfgQPDtUCaCiC5U4ogm1lurvTCX9rTQH+ttp1Y5z7E=;
 b=TK9CH2SUKxktVcnBjYINLeE+SuUjJVWK5tzBur2nJDfMtYr7Dhs2kiIq1q4g7bIcdQmle2
 x0W0wBzJvkKZ8uDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F007913301;
 Wed, 25 Jun 2025 11:52:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zx0AOeziW2iiYQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 25 Jun 2025 11:52:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, jose.exposito89@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/format-helper: Split off byte swapping from
 drm_fb_xrgb8888_to_rgb565()
Date: Wed, 25 Jun 2025 13:48:22 +0200
Message-ID: <20250625114911.1121301-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,linux.intel.com,kernel.org];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_FIVE(0.00)[6];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.30
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

Move big-endian support from drm_fb_xrgb8888_to_rgb565() into the new
helper drm_xrgb8888_to_rgb565be(). The functionality is required for
displays with big-endian byte order. Update all callers.

With the change applied, drm_fb_xrgb8888_to_rgb565() has the same
signature as the other conversion functions, which is required for
further updates to drm_fb_blit(). Also makes the format-conversion
helper available to panic handlers, if necessary.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c           | 66 ++++++++++++-------
 drivers/gpu/drm/drm_format_internal.h         |  6 ++
 drivers/gpu/drm/drm_mipi_dbi.c                |  8 ++-
 drivers/gpu/drm/gud/gud_pipe.c                |  9 ++-
 .../gpu/drm/tests/drm_format_helper_test.c    |  8 +--
 include/drm/drm_format_helper.h               |  6 +-
 6 files changed, 71 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 99d9f7bbc261..8f3daf38ca63 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -559,18 +559,6 @@ static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigne
 	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_rgb565);
 }
 
-static __always_inline u32 drm_xrgb8888_to_rgb565_swab(u32 pix)
-{
-	return swab16(drm_pixel_xrgb8888_to_rgb565(pix));
-}
-
-/* TODO: implement this helper as conversion to RGB565|BIG_ENDIAN */
-static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
-						unsigned int pixels)
-{
-	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_xrgb8888_to_rgb565_swab);
-}
-
 /**
  * drm_fb_xrgb8888_to_rgb565 - Convert XRGB8888 to RGB565 clip buffer
  * @dst: Array of RGB565 destination buffers
@@ -580,7 +568,6 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  * @state: Transform and conversion state
- * @swab: Swap bytes
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
@@ -595,23 +582,56 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
  */
 void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
-			       const struct drm_rect *clip, struct drm_format_conv_state *state,
-			       bool swab)
+			       const struct drm_rect *clip, struct drm_format_conv_state *state)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		2,
 	};
 
-	void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels);
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
+		    drm_fb_xrgb8888_to_rgb565_line);
+}
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
+
+static void drm_fb_xrgb8888_to_rgb565be_line(void *dbuf, const void *sbuf,
+					     unsigned int pixels)
+{
+	drm_fb_xfrm_line_32to16(dbuf, sbuf, pixels, drm_pixel_xrgb8888_to_rgb565be);
+}
 
-	if (swab)
-		xfrm_line = drm_fb_xrgb8888_to_rgb565_swab_line;
-	else
-		xfrm_line = drm_fb_xrgb8888_to_rgb565_line;
+/**
+ * drm_fb_xrgb8888_to_rgb565be - Convert XRGB8888 to RGB565|DRM_FORMAT_BIG_ENDIAN clip buffer
+ * @dst: Array of RGB565BE destination buffers
+ * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
+ *             within @dst; can be NULL if scanlines are stored next to each other.
+ * @src: Array of XRGB8888 source buffer
+ * @fb: DRM framebuffer
+ * @clip: Clip rectangle area to copy
+ * @state: Transform and conversion state
+ *
+ * This function copies parts of a framebuffer to display memory and converts the
+ * color format during the process. Destination and framebuffer formats must match. The
+ * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
+ * least as many entries as there are planes in @fb's format. Each entry stores the
+ * value for the format's respective color plane at the same index.
+ *
+ * This function does not apply clipping on @dst (i.e. the destination is at the
+ * top-left corner).
+ *
+ * Drivers can use this function for RGB565BE devices that don't support XRGB8888 natively.
+ */
+void drm_fb_xrgb8888_to_rgb565be(struct iosys_map *dst, const unsigned int *dst_pitch,
+				 const struct iosys_map *src, const struct drm_framebuffer *fb,
+				 const struct drm_rect *clip, struct drm_format_conv_state *state)
+{
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		2,
+	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state, xfrm_line);
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
+		    drm_fb_xrgb8888_to_rgb565be_line);
 }
-EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565be);
 
 static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
@@ -1188,7 +1208,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		return 0;
 	} else if (fb_format == DRM_FORMAT_XRGB8888) {
 		if (dst_format == DRM_FORMAT_RGB565) {
-			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, src, fb, clip, state, false);
+			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, src, fb, clip, state);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_XRGB1555) {
 			drm_fb_xrgb8888_to_xrgb1555(dst, dst_pitch, src, fb, clip, state);
diff --git a/drivers/gpu/drm/drm_format_internal.h b/drivers/gpu/drm/drm_format_internal.h
index 9428d5cfebc5..ce29dd05bcc5 100644
--- a/drivers/gpu/drm/drm_format_internal.h
+++ b/drivers/gpu/drm/drm_format_internal.h
@@ -5,6 +5,7 @@
 
 #include <linux/bits.h>
 #include <linux/types.h>
+#include <linux/swab.h>
 
 /*
  * Each pixel-format conversion helper takes a raw pixel in a
@@ -59,6 +60,11 @@ static inline u32 drm_pixel_xrgb8888_to_rgb565(u32 pix)
 	       ((pix & 0x000000f8) >> 3);
 }
 
+static inline u32 drm_pixel_xrgb8888_to_rgb565be(u32 pix)
+{
+	return swab16(drm_pixel_xrgb8888_to_rgb565(pix));
+}
+
 static inline u32 drm_pixel_xrgb8888_to_rgbx5551(u32 pix)
 {
 	return ((pix & 0x00f80000) >> 8) |
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index ba4be6be5d28..e33c78fc8fbd 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -230,7 +230,13 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *
 	case DRM_FORMAT_XRGB8888:
 		switch (dbidev->pixel_format) {
 		case DRM_FORMAT_RGB565:
-			drm_fb_xrgb8888_to_rgb565(&dst_map, NULL, src, fb, clip, fmtcnv_state, swap);
+			if (swap) {
+				drm_fb_xrgb8888_to_rgb565be(&dst_map, NULL, src, fb, clip,
+							    fmtcnv_state);
+			} else {
+				drm_fb_xrgb8888_to_rgb565(&dst_map, NULL, src, fb, clip,
+							  fmtcnv_state);
+			}
 			break;
 		case DRM_FORMAT_RGB888:
 			drm_fb_xrgb8888_to_rgb888(&dst_map, NULL, src, fb, clip, fmtcnv_state);
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index adadd526641d..8d548d08f127 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -188,8 +188,13 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 		} else if (format->format == DRM_FORMAT_RGB332) {
 			drm_fb_xrgb8888_to_rgb332(&dst, NULL, src, fb, rect, fmtcnv_state);
 		} else if (format->format == DRM_FORMAT_RGB565) {
-			drm_fb_xrgb8888_to_rgb565(&dst, NULL, src, fb, rect, fmtcnv_state,
-						  gud_is_big_endian());
+			if (gud_is_big_endian()) {
+				drm_fb_xrgb8888_to_rgb565be(&dst, NULL, src, fb, rect,
+							    fmtcnv_state);
+			} else {
+				drm_fb_xrgb8888_to_rgb565(&dst, NULL, src, fb, rect,
+							  fmtcnv_state);
+			}
 		} else if (format->format == DRM_FORMAT_RGB888) {
 			drm_fb_xrgb8888_to_rgb888(&dst, NULL, src, fb, rect, fmtcnv_state);
 		} else {
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index ad06762db671..7299fa8971ce 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -735,13 +735,13 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 		NULL : &result->dst_pitch;
 
 	drm_fb_xrgb8888_to_rgb565(&dst, dst_pitch, &src, &fb, &params->clip,
-				  &fmtcnv_state, false);
+				  &fmtcnv_state);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
 	buf = dst.vaddr; /* restore original value of buf */
-	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip,
-				  &fmtcnv_state, true);
+	drm_fb_xrgb8888_to_rgb565be(&dst, &result->dst_pitch, &src, &fb, &params->clip,
+				    &fmtcnv_state);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected_swab, dst_size);
 
@@ -749,7 +749,7 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 	memset(buf, 0, dst_size);
 
 	drm_fb_xrgb8888_to_rgb565(&dst, dst_pitch, &src, &fb, &params->clip,
-				  &fmtcnv_state, false);
+				  &fmtcnv_state);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 0d3ee2a1313f..562bc383ece4 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -82,8 +82,10 @@ void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pi
 			       const struct drm_rect *clip, struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
-			       const struct drm_rect *clip, struct drm_format_conv_state *state,
-			       bool swab);
+			       const struct drm_rect *clip, struct drm_format_conv_state *state);
+void drm_fb_xrgb8888_to_rgb565be(struct iosys_map *dst, const unsigned int *dst_pitch,
+				 const struct iosys_map *src, const struct drm_framebuffer *fb,
+				 const struct drm_rect *clip, struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
 				 const struct drm_rect *clip, struct drm_format_conv_state *state);
-- 
2.50.0

