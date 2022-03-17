Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986E24DC0CE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 09:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265A610F008;
	Thu, 17 Mar 2022 08:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE8E10F001
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 08:18:38 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f500:58f9:d953:424b])
 by michel.telenet-ops.be with bizsmtp
 id 7LJa2700B0M4NNo06LJaKN; Thu, 17 Mar 2022 09:18:36 +0100
Received: from rox.of.borg ([192.168.97.57] helo=rox)
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nUlL7-004vC7-Rj; Thu, 17 Mar 2022 09:18:33 +0100
Received: from geert by rox with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nUlL7-00559d-6n; Thu, 17 Mar 2022 09:18:33 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v2 1/5] drm/format-helper: Rename
 drm_fb_xrgb8888_to_mono_reversed()
Date: Thu, 17 Mar 2022 09:18:26 +0100
Message-Id: <20220317081830.1211400-2-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317081830.1211400-1-geert@linux-m68k.org>
References: <20220317081830.1211400-1-geert@linux-m68k.org>
MIME-Version: 1.0
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no "reversed" handling in drm_fb_xrgb8888_to_mono_reversed():
the function just converts from color to grayscale, and reduces the
number of grayscale levels from 256 to 2 (i.e. brightness 0-127 is
mapped to 0, 128-255 to 1).  All "reversed" handling is done in the
repaper driver, where this function originated.

Hence make this clear by renaming drm_fb_xrgb8888_to_mono_reversed() to
drm_fb_xrgb8888_to_mono(), and documenting the black/white pixel
mapping.

Fixes: bcf8b616deb87941 ("drm/format-helper: Add drm_fb_xrgb8888_to_mono_reversed()")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2:
  - Add Acked-by, Reviewed-by,
  - Join 2 lines.
---
 drivers/gpu/drm/drm_format_helper.c | 31 ++++++++++++++---------------
 drivers/gpu/drm/solomon/ssd130x.c   |  2 +-
 drivers/gpu/drm/tiny/repaper.c      |  2 +-
 include/drm/drm_format_helper.h     |  5 ++---
 4 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index bc0f49773868a9b0..5d9d0c695845f575 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -594,8 +594,8 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
 }
 EXPORT_SYMBOL(drm_fb_blit_toio);
 
-static void drm_fb_gray8_to_mono_reversed_line(u8 *dst, const u8 *src, unsigned int pixels,
-					       unsigned int start_offset, unsigned int end_len)
+static void drm_fb_gray8_to_mono_line(u8 *dst, const u8 *src, unsigned int pixels,
+				      unsigned int start_offset, unsigned int end_len)
 {
 	unsigned int xb, i;
 
@@ -621,8 +621,8 @@ static void drm_fb_gray8_to_mono_reversed_line(u8 *dst, const u8 *src, unsigned
 }
 
 /**
- * drm_fb_xrgb8888_to_mono_reversed - Convert XRGB8888 to reversed monochrome
- * @dst: reversed monochrome destination buffer
+ * drm_fb_xrgb8888_to_mono - Convert XRGB8888 to monochrome
+ * @dst: monochrome destination buffer (0=black, 1=white)
  * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @src: XRGB8888 source buffer
  * @fb: DRM framebuffer
@@ -633,10 +633,10 @@ static void drm_fb_gray8_to_mono_reversed_line(u8 *dst, const u8 *src, unsigned
  * and use this function to convert to the native format.
  *
  * This function uses drm_fb_xrgb8888_to_gray8() to convert to grayscale and
- * then the result is converted from grayscale to reversed monohrome.
+ * then the result is converted from grayscale to monochrome.
  */
-void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *vaddr,
-				      const struct drm_framebuffer *fb, const struct drm_rect *clip)
+void drm_fb_xrgb8888_to_mono(void *dst, unsigned int dst_pitch, const void *vaddr,
+			     const struct drm_framebuffer *fb, const struct drm_rect *clip)
 {
 	unsigned int linepixels = drm_rect_width(clip);
 	unsigned int lines = clip->y2 - clip->y1;
@@ -652,8 +652,8 @@ void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const v
 		return;
 
 	/*
-	 * The reversed mono destination buffer contains 1 bit per pixel
-	 * and destination scanlines have to be in multiple of 8 pixels.
+	 * The mono destination buffer contains 1 bit per pixel and
+	 * destination scanlines have to be in multiple of 8 pixels.
 	 */
 	if (!dst_pitch)
 		dst_pitch = DIV_ROUND_UP(linepixels, 8);
@@ -664,9 +664,9 @@ void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const v
 	 * The cma memory is write-combined so reads are uncached.
 	 * Speed up by fetching one line at a time.
 	 *
-	 * Also, format conversion from XR24 to reversed monochrome
-	 * are done line-by-line but are converted to 8-bit grayscale
-	 * as an intermediate step.
+	 * Also, format conversion from XR24 to monochrome are done
+	 * line-by-line but are converted to 8-bit grayscale as an
+	 * intermediate step.
 	 *
 	 * Allocate a buffer to be used for both copying from the cma
 	 * memory and to store the intermediate grayscale line pixels.
@@ -683,7 +683,7 @@ void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const v
 	 * are not aligned to multiple of 8.
 	 *
 	 * Calculate if the start and end pixels are not aligned and set the
-	 * offsets for the reversed mono line conversion function to adjust.
+	 * offsets for the mono line conversion function to adjust.
 	 */
 	start_offset = clip->x1 % 8;
 	end_len = clip->x2 % 8;
@@ -692,12 +692,11 @@ void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const v
 	for (y = 0; y < lines; y++) {
 		src32 = memcpy(src32, vaddr, len_src32);
 		drm_fb_xrgb8888_to_gray8_line(gray8, src32, linepixels);
-		drm_fb_gray8_to_mono_reversed_line(mono, gray8, dst_pitch,
-						   start_offset, end_len);
+		drm_fb_gray8_to_mono_line(mono, gray8, dst_pitch, start_offset, end_len);
 		vaddr += fb->pitches[0];
 		mono += dst_pitch;
 	}
 
 	kfree(src32);
 }
-EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono_reversed);
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono);
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index d08d86ef07bcbe7f..caee851efd5726e7 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -458,7 +458,7 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
 	if (!buf)
 		return -ENOMEM;
 
-	drm_fb_xrgb8888_to_mono_reversed(buf, 0, vmap, fb, rect);
+	drm_fb_xrgb8888_to_mono(buf, 0, vmap, fb, rect);
 
 	ssd130x_update_rect(ssd130x, buf, rect);
 
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 37b6bb90e46e1fe8..a096fb8b83e99dc8 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -540,7 +540,7 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb)
 	if (ret)
 		goto out_free;
 
-	drm_fb_xrgb8888_to_mono_reversed(buf, 0, cma_obj->vaddr, fb, &clip);
+	drm_fb_xrgb8888_to_mono(buf, 0, cma_obj->vaddr, fb, &clip);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 0b0937c0b2f6324e..55145eca07828321 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -43,8 +43,7 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
 		     const void *vmap, const struct drm_framebuffer *fb,
 		     const struct drm_rect *rect);
 
-void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *src,
-				      const struct drm_framebuffer *fb,
-				      const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_mono(void *dst, unsigned int dst_pitch, const void *src,
+			     const struct drm_framebuffer *fb, const struct drm_rect *clip);
 
 #endif /* __LINUX_DRM_FORMAT_HELPER_H */
-- 
2.25.1

