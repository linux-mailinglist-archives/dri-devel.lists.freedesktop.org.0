Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B2C4DC0CF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 09:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFFC10F009;
	Thu, 17 Mar 2022 08:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4900A10EFFF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 08:18:37 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f500:58f9:d953:424b])
 by laurent.telenet-ops.be with bizsmtp
 id 7LJa2700A0M4NNo01LJaHP; Thu, 17 Mar 2022 09:18:36 +0100
Received: from rox.of.borg ([192.168.97.57] helo=rox)
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nUlL7-004vC8-Kq; Thu, 17 Mar 2022 09:18:33 +0100
Received: from geert by rox with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nUlL7-00559j-7g; Thu, 17 Mar 2022 09:18:33 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v2 2/5] drm/format-helper: Fix XRGB888 to monochrome conversion
Date: Thu, 17 Mar 2022 09:18:27 +0100
Message-Id: <20220317081830.1211400-3-geert@linux-m68k.org>
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

The conversion functions drm_fb_xrgb8888_to_mono() and
drm_fb_gray8_to_mono_line() do not behave correctly when the
horizontal boundaries of the clip rectangle are not multiples of 8:
  a. When x1 % 8 != 0, the calculated pitch is not correct,
  b. When x2 % 8 != 0, the pixel data for the last byte is wrong.

Simplify the code and fix (a) by:
  1. Removing start_offset, and always storing the first pixel in the
     first bit of the monochrome destination buffer.
     Drivers that require the first pixel in a byte to be located at an
     x-coordinate that is a multiple of 8 can always align the clip
     rectangle before calling drm_fb_xrgb8888_to_mono().
     Note that:
       - The ssd130x driver does not need the alignment, as the
	 monochrome buffer is a temporary format,
       - The repaper driver always updates the full screen, so the clip
	 rectangle is always aligned.
  2. Passing the number of pixels to drm_fb_gray8_to_mono_line(),
     instead of the number of bytes, and the number of pixels in the
     last byte.

Fix (b) by explicitly setting the target bit, instead of always setting
bit 7 and shifting the value in each loop iteration.

Remove the bogus pitch check, which operates on bytes instead of pixels,
and triggers when e.g. flashing the cursor on a text console with a font
that is 8 pixels wide.

Drop the confusing comment about scanlines, as a pitch in bytes always
contains a multiple of 8 pixels.

While at it, use the drm_rect_height() helper instead of open-coding the
same operation.

Update the comments accordingly.

Fixes: bcf8b616deb87941 ("drm/format-helper: Add drm_fb_xrgb8888_to_mono_reversed()")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2:
  - Add Acked-by, Reviewed-by,
  - Use ">= 128" instead of "& BIT(7)" to increase readability.

I tried hard to fix this in small steps, but everything was no
intertangled that this turned out to be unfeasible.

Note that making these changes does not introduce regressions in the
ssd130x driver, as the latter is broken for x1 != 0 or y1 != 0 anyway.
---
 drivers/gpu/drm/drm_format_helper.c | 55 ++++++++++-------------------
 1 file changed, 18 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 5d9d0c695845f575..e085f855a199013f 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -594,27 +594,16 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
 }
 EXPORT_SYMBOL(drm_fb_blit_toio);
 
-static void drm_fb_gray8_to_mono_line(u8 *dst, const u8 *src, unsigned int pixels,
-				      unsigned int start_offset, unsigned int end_len)
-{
-	unsigned int xb, i;
-
-	for (xb = 0; xb < pixels; xb++) {
-		unsigned int start = 0, end = 8;
-		u8 byte = 0x00;
-
-		if (xb == 0 && start_offset)
-			start = start_offset;
 
-		if (xb == pixels - 1 && end_len)
-			end = end_len;
-
-		for (i = start; i < end; i++) {
-			unsigned int x = xb * 8 + i;
+static void drm_fb_gray8_to_mono_line(u8 *dst, const u8 *src, unsigned int pixels)
+{
+	while (pixels) {
+		unsigned int i, bits = min(pixels, 8U);
+		u8 byte = 0;
 
-			byte >>= 1;
-			if (src[x] >> 7)
-				byte |= BIT(7);
+		for (i = 0; i < bits; i++, pixels--) {
+			if (*src++ >= 128)
+				byte |= BIT(i);
 		}
 		*dst++ = byte;
 	}
@@ -634,16 +623,22 @@ static void drm_fb_gray8_to_mono_line(u8 *dst, const u8 *src, unsigned int pixel
  *
  * This function uses drm_fb_xrgb8888_to_gray8() to convert to grayscale and
  * then the result is converted from grayscale to monochrome.
+ *
+ * The first pixel (upper left corner of the clip rectangle) will be converted
+ * and copied to the first bit (LSB) in the first byte of the monochrome
+ * destination buffer.
+ * If the caller requires that the first pixel in a byte must be located at an
+ * x-coordinate that is a multiple of 8, then the caller must take care itself
+ * of supplying a suitable clip rectangle.
  */
 void drm_fb_xrgb8888_to_mono(void *dst, unsigned int dst_pitch, const void *vaddr,
 			     const struct drm_framebuffer *fb, const struct drm_rect *clip)
 {
 	unsigned int linepixels = drm_rect_width(clip);
-	unsigned int lines = clip->y2 - clip->y1;
+	unsigned int lines = drm_rect_height(clip);
 	unsigned int cpp = fb->format->cpp[0];
 	unsigned int len_src32 = linepixels * cpp;
 	struct drm_device *dev = fb->dev;
-	unsigned int start_offset, end_len;
 	unsigned int y;
 	u8 *mono = dst, *gray8;
 	u32 *src32;
@@ -652,14 +647,11 @@ void drm_fb_xrgb8888_to_mono(void *dst, unsigned int dst_pitch, const void *vadd
 		return;
 
 	/*
-	 * The mono destination buffer contains 1 bit per pixel and
-	 * destination scanlines have to be in multiple of 8 pixels.
+	 * The mono destination buffer contains 1 bit per pixel
 	 */
 	if (!dst_pitch)
 		dst_pitch = DIV_ROUND_UP(linepixels, 8);
 
-	drm_WARN_ONCE(dev, dst_pitch % 8 != 0, "dst_pitch is not a multiple of 8\n");
-
 	/*
 	 * The cma memory is write-combined so reads are uncached.
 	 * Speed up by fetching one line at a time.
@@ -677,22 +669,11 @@ void drm_fb_xrgb8888_to_mono(void *dst, unsigned int dst_pitch, const void *vadd
 
 	gray8 = (u8 *)src32 + len_src32;
 
-	/*
-	 * For damage handling, it is possible that only parts of the source
-	 * buffer is copied and this could lead to start and end pixels that
-	 * are not aligned to multiple of 8.
-	 *
-	 * Calculate if the start and end pixels are not aligned and set the
-	 * offsets for the mono line conversion function to adjust.
-	 */
-	start_offset = clip->x1 % 8;
-	end_len = clip->x2 % 8;
-
 	vaddr += clip_offset(clip, fb->pitches[0], cpp);
 	for (y = 0; y < lines; y++) {
 		src32 = memcpy(src32, vaddr, len_src32);
 		drm_fb_xrgb8888_to_gray8_line(gray8, src32, linepixels);
-		drm_fb_gray8_to_mono_line(mono, gray8, dst_pitch, start_offset, end_len);
+		drm_fb_gray8_to_mono_line(mono, gray8, linepixels);
 		vaddr += fb->pitches[0];
 		mono += dst_pitch;
 	}
-- 
2.25.1

