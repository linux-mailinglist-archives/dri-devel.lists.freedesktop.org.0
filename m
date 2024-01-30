Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 069C28420C0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA78112EC8;
	Tue, 30 Jan 2024 10:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E22C112EEE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:07:49 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 96E461F843;
 Tue, 30 Jan 2024 10:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=esfv2C+DdAQbq4NP1RfpX8fcC5l+lLuDx4mEcT95BcA=;
 b=uA/BfawW6LyYnW0KzEqqyVJOVuIa0ae+YgQQHP+SLJXHJW6c3UDBPra3M0vJug55LgaYoO
 4NVjPSkJ0P1XqTLc8Un9T9C46N/iWSAe7AH0eP3imHLmaEjGPohWOHoJz2Z076D0bMv+R1
 jQQfTFVQ6095pn7I9Sk9NJhE60wDjHA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=esfv2C+DdAQbq4NP1RfpX8fcC5l+lLuDx4mEcT95BcA=;
 b=xAhLPWovRFH6K61dLzCjs7P/0haJHfHnn7AEUiuqtpxm3jZchb3/c6kswt19uF3ajH8DW6
 9KBAi4Yc/X7pfxCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=esfv2C+DdAQbq4NP1RfpX8fcC5l+lLuDx4mEcT95BcA=;
 b=uA/BfawW6LyYnW0KzEqqyVJOVuIa0ae+YgQQHP+SLJXHJW6c3UDBPra3M0vJug55LgaYoO
 4NVjPSkJ0P1XqTLc8Un9T9C46N/iWSAe7AH0eP3imHLmaEjGPohWOHoJz2Z076D0bMv+R1
 jQQfTFVQ6095pn7I9Sk9NJhE60wDjHA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=esfv2C+DdAQbq4NP1RfpX8fcC5l+lLuDx4mEcT95BcA=;
 b=xAhLPWovRFH6K61dLzCjs7P/0haJHfHnn7AEUiuqtpxm3jZchb3/c6kswt19uF3ajH8DW6
 9KBAi4Yc/X7pfxCA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 761BE1376E;
 Tue, 30 Jan 2024 10:07:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id gG+4G1XKuGXdcwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 10:07:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com
Subject: [PATCH 06/23] drm/format-helper: Use struct drm_pixmap for
 drm_fb_xrgb8888_to_rgb332()
Date: Tue, 30 Jan 2024 10:53:41 +0100
Message-ID: <20240130100714.12608-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130100714.12608-1-tzimmermann@suse.de>
References: <20240130100714.12608-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="uA/BfawW";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xAhLPWov
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.49 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 TO_DN_SOME(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: 0.49
X-Rspamd-Queue-Id: 96E461F843
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

Store the source-buffer parameters of drm_fb_xrgb8888_to_rgb332()
in struct drm_pixmap. Update the function's interface and all of its
callers.

Callers of drm_fb_xrgb8888_to_rgb332() initialize the pixmap's
instance from a pre-existing instance of struct drm_framebuffer.
There's potential to simplify some of that code in a later patch.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c            | 14 ++++----------
 drivers/gpu/drm/gud/gud_pipe.c                 |  2 +-
 drivers/gpu/drm/solomon/ssd130x.c              |  4 +++-
 drivers/gpu/drm/tests/drm_format_helper_test.c |  5 ++++-
 include/drm/drm_format_helper.h                |  3 +--
 5 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 6d53620f86f0d..3ce4567c32218 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -433,15 +433,13 @@ static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigne
  * @dst: Array of RGB332 destination buffers
  * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
  *             within @dst; can be NULL if scanlines are stored next to each other.
- * @src: Array of XRGB8888 source buffers
- * @fb: DRM framebuffer
- * @clip: Clip rectangle area to copy
+ * @src_pix: Source pixmap to copy from
  * @state: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
- * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
- * least as many entries as there are planes in @fb's format. Each entry stores the
+ * parameters @dst and @dst_pitch refer to arrays. Each array must have at
+ * least as many entries as there are planes in pixmap's format. Each entry stores the
  * value for the format's respective color plane at the same index.
  *
  * This function does not apply clipping on @dst (i.e. the destination is at the
@@ -450,15 +448,11 @@ static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigne
  * Drivers can use this function for RGB332 devices that don't support XRGB8888 natively.
  */
 void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
-			       const struct iosys_map *src, const struct drm_framebuffer *fb,
-			       const struct drm_rect *clip, struct drm_format_conv_state *state)
+			       const struct drm_pixmap *src_pix, struct drm_format_conv_state *state)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		1,
 	};
-	struct drm_pixmap pixmap;
-	struct drm_pixmap *src_pix = &pixmap;
-	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
 	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src_pix, false, state,
 		    drm_fb_xrgb8888_to_rgb332_line);
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 89e491497210f..94c6da63cbff2 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -190,7 +190,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 		} else if (format->format == DRM_FORMAT_R8) {
 			drm_fb_xrgb8888_to_gray8(&dst, NULL, src, fb, rect, fmtcnv_state);
 		} else if (format->format == DRM_FORMAT_RGB332) {
-			drm_fb_xrgb8888_to_rgb332(&dst, NULL, src, fb, rect, fmtcnv_state);
+			drm_fb_xrgb8888_to_rgb332(&dst, NULL, &src_pix, fmtcnv_state);
 		} else if (format->format == DRM_FORMAT_RGB565) {
 			drm_fb_xrgb8888_to_rgb565(&dst, NULL, src, fb, rect, fmtcnv_state,
 						  gud_is_big_endian());
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index ebd943b9e357b..05305c0788e17 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1069,6 +1069,7 @@ static int ssd133x_fb_blit_rect(struct drm_framebuffer *fb,
 	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
 	unsigned int dst_pitch;
 	struct iosys_map dst;
+	struct drm_pixmap src_pix;
 	int ret = 0;
 
 	if (!fi)
@@ -1081,7 +1082,8 @@ static int ssd133x_fb_blit_rect(struct drm_framebuffer *fb,
 		return ret;
 
 	iosys_map_set_vaddr(&dst, data_array);
-	drm_fb_xrgb8888_to_rgb332(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
+	drm_pixmap_init_from_framebuffer(&src_pix, fb, vmap, rect);
+	drm_fb_xrgb8888_to_rgb332(&dst, &dst_pitch, &src_pix, fmtcnv_state);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 3f27da79a9658..326a4fd3b6141 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -646,6 +646,7 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
 	u8 *buf = NULL;
 	__le32 *xrgb8888 = NULL;
 	struct iosys_map dst, src;
+	struct drm_pixmap src_pix;
 
 	struct drm_framebuffer fb = {
 		.format = drm_format_info(DRM_FORMAT_XRGB8888),
@@ -667,7 +668,9 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_rgb332(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
+	drm_pixmap_init_from_framebuffer(&src_pix, &fb, &src, &params->clip);
+
+	drm_fb_xrgb8888_to_rgb332(&dst, dst_pitch, &src_pix, &fmtcnv_state);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 6227545734bf9..ad4d63d8aa6a9 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -104,8 +104,7 @@ void drm_fb_swab(struct drm_device *dev,
 		 const struct drm_pixmap *src_pix, bool cached,
 		 struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
-			       const struct iosys_map *src, const struct drm_framebuffer *fb,
-			       const struct drm_rect *clip, struct drm_format_conv_state *state);
+			       const struct drm_pixmap *src_pix, struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip, struct drm_format_conv_state *state,
-- 
2.43.0

