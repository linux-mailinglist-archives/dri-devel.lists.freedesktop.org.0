Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87314441C6E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 15:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2D36E86D;
	Mon,  1 Nov 2021 14:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A9E6E867
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 14:15:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C2A5B1FD74;
 Mon,  1 Nov 2021 14:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635776135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hScU7rOmYO0QByee7LvgjaIzNQXX2kN/xQAMO9xPv6E=;
 b=nCbROcnk3iKrU9F3GNYRH4TV4xoVZVHEI0LVuWqazAQDaKyVRDCPUnsEegO9ydU1jZTnl5
 tYUYpSLHetA9mbrq7b36eewJAMYKpqN8mYTeklRPo9zygLDyS54Uoqzk9a/iUxzy/InIzF
 exlVoS/7ByRKWA98ZozpO6jtulD9jQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635776135;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hScU7rOmYO0QByee7LvgjaIzNQXX2kN/xQAMO9xPv6E=;
 b=UUET6DpeWDt3VMfnHME3mdxGIsO15VAGU9byygMRQZn5cFMBaP4bUs/rKP7G4nBq35UZca
 xt7hn1a8eqXixLDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 52A281342A;
 Mon,  1 Nov 2021 14:15:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sB0kE4f2f2GlHwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Nov 2021 14:15:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com,
 michael+lkml@stapelberg.ch, aros@gmx.com, joshua@stroblindustries.com,
 arnd@arndb.de
Subject: [PATCH v2 4/9] drm/format-helper: Rework format-helper conversion
 functions
Date: Mon,  1 Nov 2021 15:15:27 +0100
Message-Id: <20211101141532.26655-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101141532.26655-1-tzimmermann@suse.de>
References: <20211101141532.26655-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-hyperv@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move destination-buffer clipping from all format-helper conversion
functions into callers. Support destination-buffer pitch. Only
distinguish between system and I/O memory, but use same logic
everywhere.

Simply harmonize the interface and semantics of the existing code.
Not all conversion helpers support all combinations of parameters.
We have to add additional features when we need them.

v2:
	* fix default destination pitch in drm_fb_xrgb8888_to_gray8()
	  (Noralf)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Noralf Trønnes <noralf@tronnes.org>
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_format_helper.c | 131 +++++++++++++++-------------
 drivers/gpu/drm/drm_mipi_dbi.c      |   2 +-
 drivers/gpu/drm/gud/gud_pipe.c      |  10 +--
 drivers/gpu/drm/tiny/cirrus.c       |  10 +--
 drivers/gpu/drm/tiny/repaper.c      |   2 +-
 drivers/gpu/drm/tiny/st7586.c       |   2 +-
 include/drm/drm_format_helper.h     |  30 +++----
 7 files changed, 97 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index dac355320287..0c8933390fdd 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -165,7 +165,7 @@ void drm_fb_swab(void *dst, unsigned int dst_pitch, const void *src,
 }
 EXPORT_SYMBOL(drm_fb_swab);
 
-static void drm_fb_xrgb8888_to_rgb332_line(u8 *dbuf, __le32 *sbuf, unsigned int pixels)
+static void drm_fb_xrgb8888_to_rgb332_line(u8 *dbuf, const __le32 *sbuf, unsigned int pixels)
 {
 	unsigned int x;
 	u32 pix;
@@ -181,23 +181,24 @@ static void drm_fb_xrgb8888_to_rgb332_line(u8 *dbuf, __le32 *sbuf, unsigned int
 /**
  * drm_fb_xrgb8888_to_rgb332 - Convert XRGB8888 to RGB332 clip buffer
  * @dst: RGB332 destination buffer
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @src: XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
  * Drivers can use this function for RGB332 devices that don't natively support XRGB8888.
- *
- * This function does not apply clipping on dst, i.e. the destination is a small buffer
- * containing the clip rect only.
  */
-void drm_fb_xrgb8888_to_rgb332(void *dst, void *src, struct drm_framebuffer *fb,
-			       struct drm_rect *clip)
+void drm_fb_xrgb8888_to_rgb332(void *dst, unsigned int dst_pitch, const void *src,
+			       const struct drm_framebuffer *fb, const struct drm_rect *clip)
 {
 	size_t width = drm_rect_width(clip);
 	size_t src_len = width * sizeof(u32);
 	unsigned int y;
 	void *sbuf;
 
+	if (!dst_pitch)
+		dst_pitch = width;
+
 	/* Use a buffer to speed up access on buffers with uncached read mapping (i.e. WC) */
 	sbuf = kmalloc(src_len, GFP_KERNEL);
 	if (!sbuf)
@@ -208,14 +209,14 @@ void drm_fb_xrgb8888_to_rgb332(void *dst, void *src, struct drm_framebuffer *fb,
 		memcpy(sbuf, src, src_len);
 		drm_fb_xrgb8888_to_rgb332_line(dst, sbuf, width);
 		src += fb->pitches[0];
-		dst += width;
+		dst += dst_pitch;
 	}
 
 	kfree(sbuf);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
 
-static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, u32 *sbuf,
+static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, const u32 *sbuf,
 					   unsigned int pixels,
 					   bool swab)
 {
@@ -236,6 +237,7 @@ static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, u32 *sbuf,
 /**
  * drm_fb_xrgb8888_to_rgb565 - Convert XRGB8888 to RGB565 clip buffer
  * @dst: RGB565 destination buffer
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @vaddr: XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
@@ -243,13 +245,10 @@ static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, u32 *sbuf,
  *
  * Drivers can use this function for RGB565 devices that don't natively
  * support XRGB8888.
- *
- * This function does not apply clipping on dst, i.e. the destination
- * is a small buffer containing the clip rect only.
  */
-void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
-			       struct drm_framebuffer *fb,
-			       struct drm_rect *clip, bool swab)
+void drm_fb_xrgb8888_to_rgb565(void *dst, unsigned int dst_pitch, const void *vaddr,
+			       const struct drm_framebuffer *fb, const struct drm_rect *clip,
+			       bool swab)
 {
 	size_t linepixels = clip->x2 - clip->x1;
 	size_t src_len = linepixels * sizeof(u32);
@@ -257,6 +256,9 @@ void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
 	unsigned y, lines = clip->y2 - clip->y1;
 	void *sbuf;
 
+	if (!dst_pitch)
+		dst_pitch = dst_len;
+
 	/*
 	 * The cma memory is write-combined so reads are uncached.
 	 * Speed up by fetching one line at a time.
@@ -270,7 +272,7 @@ void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
 		memcpy(sbuf, vaddr, src_len);
 		drm_fb_xrgb8888_to_rgb565_line(dst, sbuf, linepixels, swab);
 		vaddr += fb->pitches[0];
-		dst += dst_len;
+		dst += dst_pitch;
 	}
 
 	kfree(sbuf);
@@ -278,9 +280,9 @@ void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
 
 /**
- * drm_fb_xrgb8888_to_rgb565_dstclip - Convert XRGB8888 to RGB565 clip buffer
+ * drm_fb_xrgb8888_to_rgb565_toio - Convert XRGB8888 to RGB565 clip buffer
  * @dst: RGB565 destination buffer (iomem)
- * @dst_pitch: destination buffer pitch
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @vaddr: XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
@@ -288,37 +290,36 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
  *
  * Drivers can use this function for RGB565 devices that don't natively
  * support XRGB8888.
- *
- * This function applies clipping on dst, i.e. the destination is a
- * full (iomem) framebuffer but only the clip rect content is copied over.
  */
-void drm_fb_xrgb8888_to_rgb565_dstclip(void __iomem *dst, unsigned int dst_pitch,
-				       void *vaddr, struct drm_framebuffer *fb,
-				       struct drm_rect *clip, bool swab)
+void drm_fb_xrgb8888_to_rgb565_toio(void __iomem *dst, unsigned int dst_pitch,
+				    const void *vaddr, const struct drm_framebuffer *fb,
+				    const struct drm_rect *clip, bool swab)
 {
 	size_t linepixels = clip->x2 - clip->x1;
 	size_t dst_len = linepixels * sizeof(u16);
 	unsigned y, lines = clip->y2 - clip->y1;
 	void *dbuf;
 
+	if (!dst_pitch)
+		dst_pitch = dst_len;
+
 	dbuf = kmalloc(dst_len, GFP_KERNEL);
 	if (!dbuf)
 		return;
 
 	vaddr += clip_offset(clip, fb->pitches[0], sizeof(u32));
-	dst += clip_offset(clip, dst_pitch, sizeof(u16));
 	for (y = 0; y < lines; y++) {
 		drm_fb_xrgb8888_to_rgb565_line(dbuf, vaddr, linepixels, swab);
 		memcpy_toio(dst, dbuf, dst_len);
 		vaddr += fb->pitches[0];
-		dst += dst_len;
+		dst += dst_pitch;
 	}
 
 	kfree(dbuf);
 }
-EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565_dstclip);
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565_toio);
 
-static void drm_fb_xrgb8888_to_rgb888_line(u8 *dbuf, u32 *sbuf,
+static void drm_fb_xrgb8888_to_rgb888_line(u8 *dbuf, const u32 *sbuf,
 					   unsigned int pixels)
 {
 	unsigned int x;
@@ -333,24 +334,25 @@ static void drm_fb_xrgb8888_to_rgb888_line(u8 *dbuf, u32 *sbuf,
 /**
  * drm_fb_xrgb8888_to_rgb888 - Convert XRGB8888 to RGB888 clip buffer
  * @dst: RGB888 destination buffer
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @src: XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
  * Drivers can use this function for RGB888 devices that don't natively
  * support XRGB8888.
- *
- * This function does not apply clipping on dst, i.e. the destination
- * is a small buffer containing the clip rect only.
  */
-void drm_fb_xrgb8888_to_rgb888(void *dst, void *src, struct drm_framebuffer *fb,
-			       struct drm_rect *clip)
+void drm_fb_xrgb8888_to_rgb888(void *dst, unsigned int dst_pitch, const void *src,
+			       const struct drm_framebuffer *fb, const struct drm_rect *clip)
 {
 	size_t width = drm_rect_width(clip);
 	size_t src_len = width * sizeof(u32);
 	unsigned int y;
 	void *sbuf;
 
+	if (!dst_pitch)
+		dst_pitch = width * 3;
+
 	/* Use a buffer to speed up access on buffers with uncached read mapping (i.e. WC) */
 	sbuf = kmalloc(src_len, GFP_KERNEL);
 	if (!sbuf)
@@ -361,7 +363,7 @@ void drm_fb_xrgb8888_to_rgb888(void *dst, void *src, struct drm_framebuffer *fb,
 		memcpy(sbuf, src, src_len);
 		drm_fb_xrgb8888_to_rgb888_line(dst, sbuf, width);
 		src += fb->pitches[0];
-		dst += width * 3;
+		dst += dst_pitch;
 	}
 
 	kfree(sbuf);
@@ -369,48 +371,48 @@ void drm_fb_xrgb8888_to_rgb888(void *dst, void *src, struct drm_framebuffer *fb,
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
 
 /**
- * drm_fb_xrgb8888_to_rgb888_dstclip - Convert XRGB8888 to RGB888 clip buffer
+ * drm_fb_xrgb8888_to_rgb888_toio - Convert XRGB8888 to RGB888 clip buffer
  * @dst: RGB565 destination buffer (iomem)
- * @dst_pitch: destination buffer pitch
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @vaddr: XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
  * Drivers can use this function for RGB888 devices that don't natively
  * support XRGB8888.
- *
- * This function applies clipping on dst, i.e. the destination is a
- * full (iomem) framebuffer but only the clip rect content is copied over.
  */
-void drm_fb_xrgb8888_to_rgb888_dstclip(void __iomem *dst, unsigned int dst_pitch,
-				       void *vaddr, struct drm_framebuffer *fb,
-				       struct drm_rect *clip)
+void drm_fb_xrgb8888_to_rgb888_toio(void __iomem *dst, unsigned int dst_pitch,
+				    const void *vaddr, const struct drm_framebuffer *fb,
+				    const struct drm_rect *clip)
 {
 	size_t linepixels = clip->x2 - clip->x1;
 	size_t dst_len = linepixels * 3;
 	unsigned y, lines = clip->y2 - clip->y1;
 	void *dbuf;
 
+	if (!dst_pitch)
+		dst_pitch = dst_len;
+
 	dbuf = kmalloc(dst_len, GFP_KERNEL);
 	if (!dbuf)
 		return;
 
 	vaddr += clip_offset(clip, fb->pitches[0], sizeof(u32));
-	dst += clip_offset(clip, dst_pitch, sizeof(u16));
 	for (y = 0; y < lines; y++) {
 		drm_fb_xrgb8888_to_rgb888_line(dbuf, vaddr, linepixels);
 		memcpy_toio(dst, dbuf, dst_len);
 		vaddr += fb->pitches[0];
-		dst += dst_len;
+		dst += dst_pitch;
 	}
 
 	kfree(dbuf);
 }
-EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888_dstclip);
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888_toio);
 
 /**
  * drm_fb_xrgb8888_to_gray8 - Convert XRGB8888 to grayscale
  * @dst: 8-bit grayscale destination buffer
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @vaddr: XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
@@ -424,16 +426,21 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888_dstclip);
  *
  * ITU BT.601 is used for the RGB -> luma (brightness) conversion.
  */
-void drm_fb_xrgb8888_to_gray8(u8 *dst, void *vaddr, struct drm_framebuffer *fb,
-			       struct drm_rect *clip)
+void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vaddr,
+			      const struct drm_framebuffer *fb, const struct drm_rect *clip)
 {
 	unsigned int len = (clip->x2 - clip->x1) * sizeof(u32);
 	unsigned int x, y;
 	void *buf;
-	u32 *src;
+	u8 *dst8;
+	u32 *src32;
 
 	if (WARN_ON(fb->format->format != DRM_FORMAT_XRGB8888))
 		return;
+
+	if (!dst_pitch)
+		dst_pitch = drm_rect_width(clip);
+
 	/*
 	 * The cma memory is write-combined so reads are uncached.
 	 * Speed up by fetching one line at a time.
@@ -442,20 +449,22 @@ void drm_fb_xrgb8888_to_gray8(u8 *dst, void *vaddr, struct drm_framebuffer *fb,
 	if (!buf)
 		return;
 
+	vaddr += clip_offset(clip, fb->pitches[0], sizeof(u32));
 	for (y = clip->y1; y < clip->y2; y++) {
-		src = vaddr + (y * fb->pitches[0]);
-		src += clip->x1;
-		memcpy(buf, src, len);
-		src = buf;
+		dst8 = dst;
+		src32 = memcpy(buf, vaddr, len);
 		for (x = clip->x1; x < clip->x2; x++) {
-			u8 r = (*src & 0x00ff0000) >> 16;
-			u8 g = (*src & 0x0000ff00) >> 8;
-			u8 b =  *src & 0x000000ff;
+			u8 r = (*src32 & 0x00ff0000) >> 16;
+			u8 g = (*src32 & 0x0000ff00) >> 8;
+			u8 b =  *src32 & 0x000000ff;
 
 			/* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
-			*dst++ = (3 * r + 6 * g + b) / 10;
-			src++;
+			*dst8++ = (3 * r + 6 * g + b) / 10;
+			src32++;
 		}
+
+		vaddr += fb->pitches[0];
+		dst += dst_pitch;
 	}
 
 	kfree(buf);
@@ -502,15 +511,15 @@ int drm_fb_blit_rect_dstclip(void __iomem *dst, unsigned int dst_pitch,
 
 	} else if (dst_format == DRM_FORMAT_RGB565) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
-			drm_fb_xrgb8888_to_rgb565_dstclip(dst, dst_pitch,
-							  vmap, fb, clip,
-							  false);
+			dst += clip_offset(clip, dst_pitch, fb->format->cpp[0]);
+			drm_fb_xrgb8888_to_rgb565_toio(dst, dst_pitch, vmap, fb, clip,
+						       false);
 			return 0;
 		}
 	} else if (dst_format == DRM_FORMAT_RGB888) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
-			drm_fb_xrgb8888_to_rgb888_dstclip(dst, dst_pitch,
-							  vmap, fb, clip);
+			dst += clip_offset(clip, dst_pitch, fb->format->cpp[0]);
+			drm_fb_xrgb8888_to_rgb888_toio(dst, dst_pitch, vmap, fb, clip);
 			return 0;
 		}
 	}
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 7ce89917d761..b75403f3251a 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -216,7 +216,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 			drm_fb_memcpy(dst, 0, src, fb, clip);
 		break;
 	case DRM_FORMAT_XRGB8888:
-		drm_fb_xrgb8888_to_rgb565(dst, src, fb, clip, swap);
+		drm_fb_xrgb8888_to_rgb565(dst, 0, src, fb, clip, swap);
 		break;
 	default:
 		drm_err_once(fb->dev, "Format is not supported: %p4cc\n",
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index e0b117b2559f..a150a5a4b5d4 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -74,7 +74,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
 	if (!buf)
 		return 0;
 
-	drm_fb_xrgb8888_to_gray8(buf, src, fb, rect);
+	drm_fb_xrgb8888_to_gray8(buf, 0, src, fb, rect);
 	pix8 = buf;
 
 	for (y = 0; y < height; y++) {
@@ -190,13 +190,13 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 				goto end_cpu_access;
 			}
 		} else if (format->format == DRM_FORMAT_R8) {
-			drm_fb_xrgb8888_to_gray8(buf, vaddr, fb, rect);
+			drm_fb_xrgb8888_to_gray8(buf, 0, vaddr, fb, rect);
 		} else if (format->format == DRM_FORMAT_RGB332) {
-			drm_fb_xrgb8888_to_rgb332(buf, vaddr, fb, rect);
+			drm_fb_xrgb8888_to_rgb332(buf, 0, vaddr, fb, rect);
 		} else if (format->format == DRM_FORMAT_RGB565) {
-			drm_fb_xrgb8888_to_rgb565(buf, vaddr, fb, rect, gud_is_big_endian());
+			drm_fb_xrgb8888_to_rgb565(buf, 0, vaddr, fb, rect, gud_is_big_endian());
 		} else if (format->format == DRM_FORMAT_RGB888) {
-			drm_fb_xrgb8888_to_rgb888(buf, vaddr, fb, rect);
+			drm_fb_xrgb8888_to_rgb888(buf, 0, vaddr, fb, rect);
 		} else {
 			len = gud_xrgb8888_to_color(buf, format, vaddr, fb, rect);
 		}
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 5344e506e8a9..9327001d35dd 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -329,14 +329,12 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_
 		drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, rect);
 
 	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 2) {
-		drm_fb_xrgb8888_to_rgb565_dstclip(cirrus->vram,
-						  cirrus->pitch,
-						  vmap, fb, rect, false);
+		dst += drm_fb_clip_offset(cirrus->pitch, fb->format, rect);
+		drm_fb_xrgb8888_to_rgb565_toio(dst, cirrus->pitch, vmap, fb, rect, false);
 
 	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 3) {
-		drm_fb_xrgb8888_to_rgb888_dstclip(cirrus->vram,
-						  cirrus->pitch,
-						  vmap, fb, rect);
+		dst += drm_fb_clip_offset(cirrus->pitch, fb->format, rect);
+		drm_fb_xrgb8888_to_rgb888_toio(dst, cirrus->pitch, vmap, fb, rect);
 
 	} else {
 		WARN_ON_ONCE("cpp mismatch");
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 4d07b21a16e6..97a775c48cea 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -560,7 +560,7 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb)
 	if (ret)
 		goto out_free;
 
-	drm_fb_xrgb8888_to_gray8(buf, cma_obj->vaddr, fb, &clip);
+	drm_fb_xrgb8888_to_gray8(buf, 0, cma_obj->vaddr, fb, &clip);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index ad0faa8723c2..51b9b9fb3ead 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -73,7 +73,7 @@ static void st7586_xrgb8888_to_gray332(u8 *dst, void *vaddr,
 	if (!buf)
 		return;
 
-	drm_fb_xrgb8888_to_gray8(buf, vaddr, fb, clip);
+	drm_fb_xrgb8888_to_gray8(buf, 0, vaddr, fb, clip);
 	src = buf;
 
 	for (y = clip->y1; y < clip->y2; y++) {
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index ddcba5abe306..6b366f422a24 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -20,21 +20,21 @@ void drm_fb_memcpy_toio(void __iomem *dst, unsigned int dst_pitch, const void *v
 void drm_fb_swab(void *dst, unsigned int dst_pitch, const void *src,
 		 const struct drm_framebuffer *fb, const struct drm_rect *clip,
 		 bool cached);
-void drm_fb_xrgb8888_to_rgb332(void *dst, void *vaddr, struct drm_framebuffer *fb,
-			       struct drm_rect *clip);
-void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
-			       struct drm_framebuffer *fb,
-			       struct drm_rect *clip, bool swab);
-void drm_fb_xrgb8888_to_rgb565_dstclip(void __iomem *dst, unsigned int dst_pitch,
-				       void *vaddr, struct drm_framebuffer *fb,
-				       struct drm_rect *clip, bool swab);
-void drm_fb_xrgb8888_to_rgb888(void *dst, void *src, struct drm_framebuffer *fb,
-			       struct drm_rect *clip);
-void drm_fb_xrgb8888_to_rgb888_dstclip(void __iomem *dst, unsigned int dst_pitch,
-				       void *vaddr, struct drm_framebuffer *fb,
-				       struct drm_rect *clip);
-void drm_fb_xrgb8888_to_gray8(u8 *dst, void *vaddr, struct drm_framebuffer *fb,
-			      struct drm_rect *clip);
+void drm_fb_xrgb8888_to_rgb332(void *dst, unsigned int dst_pitch, const void *vaddr,
+			       const struct drm_framebuffer *fb, const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_rgb565(void *dst, unsigned int dst_pitch, const void *vaddr,
+			       const struct drm_framebuffer *fb, const struct drm_rect *clip,
+			       bool swab);
+void drm_fb_xrgb8888_to_rgb565_toio(void __iomem *dst, unsigned int dst_pitch,
+				    const void *vaddr, const struct drm_framebuffer *fb,
+				    const struct drm_rect *clip, bool swab);
+void drm_fb_xrgb8888_to_rgb888(void *dst, unsigned int dst_pitch, const void *src,
+			       const struct drm_framebuffer *fb, const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_rgb888_toio(void __iomem *dst, unsigned int dst_pitch,
+				    const void *vaddr, const struct drm_framebuffer *fb,
+				    const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vaddr,
+			      const struct drm_framebuffer *fb, const struct drm_rect *clip);
 
 int drm_fb_blit_rect_dstclip(void __iomem *dst, unsigned int dst_pitch,
 			     uint32_t dst_format, void *vmap,
-- 
2.33.1

