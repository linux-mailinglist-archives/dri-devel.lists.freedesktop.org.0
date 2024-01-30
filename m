Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2C18420B5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E32112EE4;
	Tue, 30 Jan 2024 10:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDE0112EC3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:07:19 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6F0E7222D9;
 Tue, 30 Jan 2024 10:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GLVGVb50TzQlXs2GeRx5ioUfffWTaEUrVVefmp16LRU=;
 b=JEtJn8GhoglHyq1ZP7kmCavH8cBc/Qa0a1Mx+/V0I6TWTN1v6i9pCXjb9MIi8uBVjiWadc
 tQzehe++EytzDYsRdLg+5MvKP31nHdUZrtXQ5cJL4klGBPIqrMnrA/hmSwN+T2YVuyZRMj
 vkBkDPaiiZRMyirJZKwtvDI6nfmCDSU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GLVGVb50TzQlXs2GeRx5ioUfffWTaEUrVVefmp16LRU=;
 b=zzB8J91AQEhP7TROw0LsiRuKcRieH1bllnuhB2t0+R3GYpJZTB4tvy+vDKZwBGazwO4fwa
 DdKPh5JS723JPmAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GLVGVb50TzQlXs2GeRx5ioUfffWTaEUrVVefmp16LRU=;
 b=JEtJn8GhoglHyq1ZP7kmCavH8cBc/Qa0a1Mx+/V0I6TWTN1v6i9pCXjb9MIi8uBVjiWadc
 tQzehe++EytzDYsRdLg+5MvKP31nHdUZrtXQ5cJL4klGBPIqrMnrA/hmSwN+T2YVuyZRMj
 vkBkDPaiiZRMyirJZKwtvDI6nfmCDSU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GLVGVb50TzQlXs2GeRx5ioUfffWTaEUrVVefmp16LRU=;
 b=zzB8J91AQEhP7TROw0LsiRuKcRieH1bllnuhB2t0+R3GYpJZTB4tvy+vDKZwBGazwO4fwa
 DdKPh5JS723JPmAQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DEE2139E1;
 Tue, 30 Jan 2024 10:07:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id gF7iEVXKuGXdcwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 10:07:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com
Subject: [PATCH 05/23] drm/format-helper: Use struct drm_pixmap for
 drm_fb_swab()
Date: Tue, 30 Jan 2024 10:53:40 +0100
Message-ID: <20240130100714.12608-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130100714.12608-1-tzimmermann@suse.de>
References: <20240130100714.12608-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JEtJn8Gh;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zzB8J91A
X-Spamd-Result: default: False [-0.31 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -0.31
X-Rspamd-Queue-Id: 6F0E7222D9
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /
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

Store the source-buffer parameters of drm_fb_swab() in struct
drm_pixmap. Update the function's interface and all of its callers.

Callers of drm_fb_swab() initialize the pixmap's instance from a
pre-existing instance of struct drm_framebuffer. There's potential
to simplify some of that code in a later patch.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c           | 29 +++++++++----------
 drivers/gpu/drm/drm_mipi_dbi.c                |  2 +-
 drivers/gpu/drm/gud/gud_pipe.c                |  3 +-
 .../gpu/drm/tests/drm_format_helper_test.c    |  5 +++-
 include/drm/drm_format_helper.h               |  6 ++--
 5 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 3bb3fb0703122..6d53620f86f0d 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -368,19 +368,18 @@ static void drm_fb_swab32_line(void *dbuf, const void *sbuf, unsigned int pixels
 
 /**
  * drm_fb_swab - Swap bytes into clip buffer
+ * @dev: DRM device
  * @dst: Array of destination buffers
  * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
  *             within @dst; can be NULL if scanlines are stored next to each other.
- * @src: Array of source buffers
- * @fb: DRM framebuffer
- * @clip: Clip rectangle area to copy
+ * @src_pix: Source pixmap to copy from
  * @cached: Source buffer is mapped cached (eg. not write-combined)
  * @state: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and swaps per-pixel
  * bytes during the process. Destination and framebuffer formats must match. The
- * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
- * least as many entries as there are planes in @fb's format. Each entry stores the
+ * parameters @dst and @dst_pitch refer to arrays. Each array must have at least
+ * as many entries as there are planes in the pixmap's format. Each entry stores the
  * value for the format's respective color plane at the same index. If @cached is
  * false a temporary buffer is used to cache one pixel line at a time to speed up
  * slow uncached reads.
@@ -388,17 +387,14 @@ static void drm_fb_swab32_line(void *dbuf, const void *sbuf, unsigned int pixels
  * This function does not apply clipping on @dst (i.e. the destination is at the
  * top-left corner).
  */
-void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
-		 const struct iosys_map *src, const struct drm_framebuffer *fb,
-		 const struct drm_rect *clip, bool cached,
+void drm_fb_swab(struct drm_device *dev,
+		 struct iosys_map *dst, const unsigned int *dst_pitch,
+		 const struct drm_pixmap *src_pix, bool cached,
 		 struct drm_format_conv_state *state)
 {
-	const struct drm_format_info *format = fb->format;
+	const struct drm_format_info *format = src_pix->format;
 	u8 cpp = DIV_ROUND_UP(drm_format_info_bpp(format, 0), 8);
 	void (*swab_line)(void *dbuf, const void *sbuf, unsigned int npixels);
-	struct drm_pixmap pixmap;
-	struct drm_pixmap *src_pix = &pixmap;
-	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
 	switch (cpp) {
 	case 4:
@@ -408,7 +404,7 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 		swab_line = drm_fb_swab16_line;
 		break;
 	default:
-		drm_warn_once(fb->dev, "Format %p4cc has unsupported pixel size.\n",
+		drm_warn_once(dev, "Format %p4cc has unsupported pixel size.\n",
 			      &format->format);
 		return;
 	}
@@ -1095,6 +1091,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		const struct iosys_map *src, const struct drm_framebuffer *fb,
 		const struct drm_rect *clip, struct drm_format_conv_state *state)
 {
+	struct drm_device *dev = fb->dev;
 	uint32_t fb_format = fb->format->format;
 	struct drm_pixmap pixmap;
 	struct drm_pixmap *src_pix = &pixmap;
@@ -1104,10 +1101,10 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		drm_fb_memcpy(dst, dst_pitch, src_pix);
 		return 0;
 	} else if (fb_format == (dst_format | DRM_FORMAT_BIG_ENDIAN)) {
-		drm_fb_swab(dst, dst_pitch, src, fb, clip, false, state);
+		drm_fb_swab(dev, dst, dst_pitch, src_pix, false, state);
 		return 0;
 	} else if (fb_format == (dst_format & ~DRM_FORMAT_BIG_ENDIAN)) {
-		drm_fb_swab(dst, dst_pitch, src, fb, clip, false, state);
+		drm_fb_swab(dev, dst, dst_pitch, src_pix, false, state);
 		return 0;
 	} else if (fb_format == DRM_FORMAT_XRGB8888) {
 		if (dst_format == DRM_FORMAT_RGB565) {
@@ -1141,7 +1138,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 			drm_fb_xrgb8888_to_argb2101010(dst, dst_pitch, src, fb, clip, state);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_BGRX8888) {
-			drm_fb_swab(dst, dst_pitch, src, fb, clip, false, state);
+			drm_fb_swab(dev, dst, dst_pitch, src_pix, false, state);
 			return 0;
 		}
 	}
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 0ad2bdc19712e..9916a9bd6c978 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -220,7 +220,7 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *
 	switch (fb->format->format) {
 	case DRM_FORMAT_RGB565:
 		if (swap)
-			drm_fb_swab(&dst_map, NULL, src, fb, clip, !gem->import_attach,
+			drm_fb_swab(fb->dev, &dst_map, NULL, &src_pix, !gem->import_attach,
 				    fmtcnv_state);
 		else
 			drm_fb_memcpy(&dst_map, NULL, &src_pix);
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 57965400ee4d4..89e491497210f 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -156,6 +156,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 			  struct gud_set_buffer_req *req,
 			  struct drm_format_conv_state *fmtcnv_state)
 {
+	struct drm_device *drm = &gdrm->drm;
 	u8 compression = gdrm->compression;
 	struct iosys_map dst;
 	void *vaddr, *buf;
@@ -199,7 +200,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 			len = gud_xrgb8888_to_color(buf, format, vaddr, fb, rect);
 		}
 	} else if (gud_is_big_endian() && format->cpp[0] > 1) {
-		drm_fb_swab(&dst, NULL, src, fb, rect, cached_reads, fmtcnv_state);
+		drm_fb_swab(drm, &dst, NULL, &src_pix, cached_reads, fmtcnv_state);
 	} else if (compression && cached_reads && pitch == fb->pitches[0]) {
 		/* can compress directly from the framebuffer */
 		buf = vaddr + rect->y1 * pitch;
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index a1f64872bb431..3f27da79a9658 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -1099,6 +1099,7 @@ static void drm_test_fb_swab(struct kunit *test)
 		.format = drm_format_info(DRM_FORMAT_XRGB8888),
 		.pitches = { params->pitch, 0, 0 },
 	};
+	struct drm_pixmap src_pix;
 
 	dst_size = conversion_buf_size(DRM_FORMAT_XRGB8888, result->dst_pitch, &params->clip, 0);
 
@@ -1115,7 +1116,9 @@ static void drm_test_fb_swab(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_swab(&dst, dst_pitch, &src, &fb, &params->clip, false, &fmtcnv_state);
+	drm_pixmap_init_from_framebuffer(&src_pix, &fb, &src, &params->clip);
+
+	drm_fb_swab(NULL, &dst, dst_pitch, &src_pix, false, &fmtcnv_state);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 4e3f6a24430ca..6227545734bf9 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -99,9 +99,9 @@ unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info
 
 void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
 		   const struct drm_pixmap *src_pix);
-void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
-		 const struct iosys_map *src, const struct drm_framebuffer *fb,
-		 const struct drm_rect *clip, bool cached,
+void drm_fb_swab(struct drm_device *dev,
+		 struct iosys_map *dst, const unsigned int *dst_pitch,
+		 const struct drm_pixmap *src_pix, bool cached,
 		 struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
-- 
2.43.0

