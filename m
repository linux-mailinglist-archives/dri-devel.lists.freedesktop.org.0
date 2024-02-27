Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6197C868CE2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 11:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A0C10EEFE;
	Tue, 27 Feb 2024 10:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BuypG1FO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D319410EE5B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 10:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709028334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LF15U/xSjuKVIEvYZJ5X4RcU8YpgFStYC8xrGGVbmpo=;
 b=BuypG1FOhb27+okDpmC1LBF4xBe/Co82ZdGX60eRE+LgDknyl6bIyHws4WutxBClLKk0e0
 Y1/CP4DXws2/+3bcHq2aSmVAgYttCDw9fEv+wsRJK3LtnsRPCPXoWU+nPM8tP7059+YOUW
 QVcSO5QAQ7LAaBypgTd8C7ejV/f3qkE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-340-Z-UPekbBOGG8_jKqLq8c_g-1; Tue,
 27 Feb 2024 05:05:30 -0500
X-MC-Unique: Z-UPekbBOGG8_jKqLq8c_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 850B61C0691A;
 Tue, 27 Feb 2024 10:05:29 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E90139CAC;
 Tue, 27 Feb 2024 10:05:27 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v8 1/8] drm/format-helper: Add drm_fb_blit_from_r1 and
 drm_fb_fill
Date: Tue, 27 Feb 2024 11:04:12 +0100
Message-ID: <20240227100459.194478-2-jfalempe@redhat.com>
In-Reply-To: <20240227100459.194478-1-jfalempe@redhat.com>
References: <20240227100459.194478-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

This is needed for drm_panic, to draw the font, and fill
the background color, in multiple color format.

v5:
 * Change the drawing API, use drm_fb_blit_from_r1() to draw the font.
 * Also add drm_fb_fill() to fill area with background color.
v6:
 * fix __le32 conversion warning found by the kernel test bot

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_format_helper.c | 432 ++++++++++++++++++++++------
 include/drm/drm_format_helper.h     |   9 +
 2 files changed, 360 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index b1be458ed4dd..2d9646cefc4f 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -111,6 +111,153 @@ void drm_format_conv_state_release(struct drm_format_conv_state *state)
 }
 EXPORT_SYMBOL(drm_format_conv_state_release);
 
+static __le16 drm_format_xrgb8888_to_rgb565(__le32 val32)
+{
+	u16 val16;
+	u32 pix;
+
+	pix = le32_to_cpu(val32);
+	val16 = ((pix & 0x00F80000) >> 8) |
+		((pix & 0x0000FC00) >> 5) |
+		((pix & 0x000000F8) >> 3);
+	return cpu_to_le16(val16);
+}
+
+static __le16 drm_format_xrgb8888_to_rgba5551(__le32 val32)
+{
+	u16 val16;
+	u32 pix;
+
+	pix = le32_to_cpu(val32);
+	val16 = ((pix & 0x00f80000) >> 8) |
+		((pix & 0x0000f800) >> 5) |
+		((pix & 0x000000f8) >> 2) |
+		BIT(0); /* set alpha bit */
+	return cpu_to_le16(val16);
+}
+
+static __le16 drm_format_xrgb8888_to_xrgb1555(__le32 val32)
+{
+	u16 val16;
+	u32 pix;
+
+	pix = le32_to_cpu(val32);
+	val16 = ((pix & 0x00f80000) >> 9) |
+		((pix & 0x0000f800) >> 6) |
+		((pix & 0x000000f8) >> 3);
+	return cpu_to_le16(val16);
+}
+
+static __le16 drm_format_xrgb8888_to_argb1555(__le32 val32)
+{
+	u16 val16;
+	u32 pix;
+
+	pix = le32_to_cpu(val32);
+	val16 = BIT(15) | /* set alpha bit */
+		((pix & 0x00f80000) >> 9) |
+		((pix & 0x0000f800) >> 6) |
+		((pix & 0x000000f8) >> 3);
+	return cpu_to_le16(val16);
+}
+
+static __le32 drm_format_xrgb8888_to_argb8888(__le32 pix)
+{
+	u32 val32;
+
+	val32 = le32_to_cpu(pix);
+	val32 |= GENMASK(31, 24); /* fill alpha bits */
+	return cpu_to_le32(val32);
+}
+
+static __le32 drm_format_xrgb8888_to_xbgr8888(__le32 pix)
+{
+	u32 val32;
+
+	val32 = le32_to_cpu(pix);
+	val32 = ((val32 & 0x00ff0000) >> 16) <<  0 |
+		((val32 & 0x0000ff00) >>  8) <<  8 |
+		((val32 & 0x000000ff) >>  0) << 16 |
+		((val32 & 0xff000000) >> 24) << 24;
+	return cpu_to_le32(val32);
+}
+
+static __le32 drm_format_xrgb8888_to_abgr8888(__le32 pix)
+{
+	u32 val32;
+
+	val32 = le32_to_cpu(pix);
+	val32 = ((val32 & 0x00ff0000) >> 16) <<  0 |
+		((val32 & 0x0000ff00) >>  8) <<  8 |
+		((val32 & 0x000000ff) >>  0) << 16 |
+		GENMASK(31, 24); /* fill alpha bits */
+	return cpu_to_le32(val32);
+}
+
+static __le32 drm_format_xrgb8888_to_xrgb2101010(__le32 pix)
+{
+	u32 val32;
+
+	val32 = le32_to_cpu(pix);
+	val32 = ((val32 & 0x000000FF) << 2) |
+		((val32 & 0x0000FF00) << 4) |
+		((val32 & 0x00FF0000) << 6);
+	return cpu_to_le32(val32 | ((val32 >> 8) & 0x00300C03));
+}
+
+static __le32 drm_format_xrgb8888_to_argb2101010(__le32 pix)
+{
+	u32 val32;
+
+	val32 = le32_to_cpu(pix);
+	val32 = ((val32 & 0x000000FF) << 2) |
+		((val32 & 0x0000FF00) << 4) |
+		((val32 & 0x00FF0000) << 6);
+	val32 = GENMASK(31, 30) | /* set alpha bits */
+	      val32 | ((val32 >> 8) & 0x00300c03);
+	return cpu_to_le32(val32);
+}
+
+/**
+ * drm_fb_convert_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
+ * @color: input color, in xrgb8888 format
+ * @format: output format
+ *
+ * Returns:
+ * Color in the format specified, casted to u32.
+ * Or 0 if the format is unknown.
+ */
+u32 drm_fb_convert_from_xrgb8888(u32 color, u32 format)
+{
+	__le32 pix = cpu_to_le32(color);
+
+	switch (format) {
+	case DRM_FORMAT_RGB565:
+		return le16_to_cpu(drm_format_xrgb8888_to_rgb565(pix));
+	case DRM_FORMAT_RGBA5551:
+		return le16_to_cpu(drm_format_xrgb8888_to_rgba5551(pix));
+	case DRM_FORMAT_XRGB1555:
+		return le16_to_cpu(drm_format_xrgb8888_to_xrgb1555(pix));
+	case DRM_FORMAT_ARGB1555:
+		return le16_to_cpu(drm_format_xrgb8888_to_argb1555(pix));
+	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_XRGB8888:
+		return le32_to_cpu(pix);
+	case DRM_FORMAT_ARGB8888:
+		return le32_to_cpu(drm_format_xrgb8888_to_argb8888(pix));
+	case DRM_FORMAT_XBGR8888:
+		return le32_to_cpu(drm_format_xrgb8888_to_xbgr8888(pix));
+	case DRM_FORMAT_XRGB2101010:
+		return le32_to_cpu(drm_format_xrgb8888_to_xrgb2101010(pix));
+	case DRM_FORMAT_ARGB2101010:
+		return le32_to_cpu(drm_format_xrgb8888_to_argb2101010(pix));
+	default:
+		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
+		return 0;
+	}
+}
+EXPORT_SYMBOL(drm_fb_convert_from_xrgb8888);
+
 static unsigned int clip_offset(const struct drm_rect *clip, unsigned int pitch, unsigned int cpp)
 {
 	return clip->y1 * pitch + clip->x1 * cpp;
@@ -366,6 +513,193 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 }
 EXPORT_SYMBOL(drm_fb_swab);
 
+static void drm_fb_r1_to_16bit(struct iosys_map *dmap, unsigned int dpitch,
+			       const u8 *sbuf8, unsigned int spitch,
+			       unsigned int height, unsigned int width,
+			       __le16 fg16, __le16 bg16)
+{
+	unsigned int l, x;
+	__le16 val16;
+
+	for (l = 0; l < height; l++) {
+		for (x = 0; x < width; x++) {
+			val16 = (sbuf8[(l * spitch) + x / 8] & (0x80 >> (x % 8))) ? fg16 : bg16;
+			iosys_map_wr(dmap, l * dpitch + x * sizeof(u16), u16, le16_to_cpu(val16));
+		}
+	}
+}
+
+static void drm_fb_r1_to_24bit(struct iosys_map *dmap, unsigned int dpitch,
+			       const u8 *sbuf8, unsigned int spitch,
+			       unsigned int height, unsigned int width,
+			       __le32 fg32, __le32 bg32)
+{
+	unsigned int l, x;
+	__le32 color;
+	u32 val32;
+
+	for (l = 0; l < height; l++) {
+		for (x = 0; x < width; x++) {
+			u32 off = l * dpitch + x * 3;
+
+			color = (sbuf8[(l * spitch) + x / 8] & (0x80 >> (x % 8))) ? fg32 : bg32;
+			val32 = le32_to_cpu(color);
+
+			/* write blue-green-red to output in little endianness */
+			iosys_map_wr(dmap, off, u8, (val32 & 0x000000FF) >> 0);
+			iosys_map_wr(dmap, off + 1, u8, (val32 & 0x0000FF00) >> 8);
+			iosys_map_wr(dmap, off + 2, u8, (val32 & 0x00FF0000) >> 16);
+		}
+	}
+}
+
+static void drm_fb_r1_to_32bit(struct iosys_map *dmap, unsigned int dpitch,
+			       const u8 *sbuf8, unsigned int spitch,
+			       unsigned int height, unsigned int width,
+			       __le32 fg32, __le32 bg32)
+{
+	unsigned int l, x;
+	__le32 val32;
+
+	for (l = 0; l < height; l++) {
+		for (x = 0; x < width; x++) {
+			val32 = (sbuf8[(l * spitch) + x / 8] & (0x80 >> (x % 8))) ? fg32 : bg32;
+			iosys_map_wr(dmap, l * dpitch + x * sizeof(u32), u32, le32_to_cpu(val32));
+		}
+	}
+}
+
+/**
+ * drm_fb_blit_from_r1 - convert a monochrome image to a linear framebuffer
+ * @dmap: destination iosys_map
+ * @dpitch: destination pitch in bytes
+ * @sbuf8: source buffer, in monochrome format, 8 pixels per byte.
+ * @spitch: source pitch in bytes
+ * @height: height of the image to copy, in pixels
+ * @width: width of the image to copy, in pixels
+ * @fg_color: foreground color, in destination format
+ * @bg_color: background color, in destination format
+ * @pixel_width: pixel width in bytes.
+ *
+ * This can be used to draw font which are monochrome images, to a framebuffer
+ * in other supported format.
+ */
+void drm_fb_blit_from_r1(struct iosys_map *dmap, unsigned int dpitch,
+			 const u8 *sbuf8, unsigned int spitch,
+			 unsigned int height, unsigned int width,
+			 u32 fg_color, u32 bg_color,
+			 unsigned int pixel_width)
+{
+	switch (pixel_width) {
+	case 2:
+		drm_fb_r1_to_16bit(dmap, dpitch, sbuf8, spitch,
+				   height, width,
+				   cpu_to_le16(fg_color),
+				   cpu_to_le16(bg_color));
+	break;
+	case 3:
+		drm_fb_r1_to_24bit(dmap, dpitch, sbuf8, spitch,
+				   height, width,
+				   cpu_to_le32(fg_color),
+				   cpu_to_le32(bg_color));
+	break;
+	case 4:
+		drm_fb_r1_to_32bit(dmap, dpitch, sbuf8, spitch,
+				   height, width,
+				   cpu_to_le32(fg_color),
+				   cpu_to_le32(bg_color));
+	break;
+	default:
+		WARN_ONCE(1, "Can't blit with pixel width %d\n", pixel_width);
+	}
+}
+EXPORT_SYMBOL(drm_fb_blit_from_r1);
+
+static void drm_fb_fill8(struct iosys_map *dmap, unsigned int dpitch,
+			 unsigned int height, unsigned int width,
+			 u8 color)
+{
+	unsigned int l, x;
+
+	for (l = 0; l < height; l++)
+		for (x = 0; x < width; x++)
+			iosys_map_wr(dmap, l * dpitch + x * sizeof(u8), u8, color);
+}
+
+static void drm_fb_fill16(struct iosys_map *dmap, unsigned int dpitch,
+			  unsigned int height, unsigned int width,
+			  u16 color)
+{
+	unsigned int l, x;
+
+	for (l = 0; l < height; l++)
+		for (x = 0; x < width; x++)
+			iosys_map_wr(dmap, l * dpitch + x * sizeof(u16), u16, color);
+}
+
+static void drm_fb_fill24(struct iosys_map *dmap, unsigned int dpitch,
+			  unsigned int height, unsigned int width,
+			  u32 color)
+{
+	unsigned int l, x;
+
+	for (l = 0; l < height; l++) {
+		for (x = 0; x < width; x++) {
+			unsigned int off = l * dpitch + x * 3;
+
+			/* write blue-green-red to output in little endianness */
+			iosys_map_wr(dmap, off, u8, (color & 0x000000FF) >> 0);
+			iosys_map_wr(dmap, off + 1, u8, (color & 0x0000FF00) >> 8);
+			iosys_map_wr(dmap, off + 2, u8, (color & 0x00FF0000) >> 16);
+		}
+	}
+}
+
+static void drm_fb_fill32(struct iosys_map *dmap, unsigned int dpitch,
+			  unsigned int height, unsigned int width,
+			  u32 color)
+{
+	unsigned int l, x;
+
+	for (l = 0; l < height; l++)
+		for (x = 0; x < width; x++)
+			iosys_map_wr(dmap, l * dpitch + x * sizeof(u32), u32, color);
+}
+
+/**
+ * drm_fb_fill - Fill a rectangle with a color
+ * @dmap: destination iosys_map, pointing to the top left corner of the rectangle
+ * @dpitch: destination pitch in bytes
+ * @height: height of the rectangle, in pixels
+ * @width: width of the rectangle, in pixels
+ * @color: color to fill the rectangle.
+ * @pixel_width: pixel width in bytes
+ *
+ * Fill a rectangle with a color, in a linear framebuffer.
+ */
+void drm_fb_fill(struct iosys_map *dmap, unsigned int dpitch,
+			 unsigned int height, unsigned int width,
+			 u32 color, unsigned int pixel_width)
+{
+	switch (pixel_width) {
+	case 1:
+		drm_fb_fill8(dmap, dpitch, height, width, color);
+	break;
+	case 2:
+		drm_fb_fill16(dmap, dpitch, height, width, color);
+	break;
+	case 3:
+		drm_fb_fill24(dmap, dpitch, height, width, color);
+	break;
+	case 4:
+		drm_fb_fill32(dmap, dpitch, height, width, color);
+	break;
+	default:
+		WARN_ONCE(1, "Can't fill with pixel width %d\n", pixel_width);
+	}
+}
+EXPORT_SYMBOL(drm_fb_fill);
+
 static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	u8 *dbuf8 = dbuf;
@@ -420,15 +754,9 @@ static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigne
 	__le16 *dbuf16 = dbuf;
 	const __le32 *sbuf32 = sbuf;
 	unsigned int x;
-	u16 val16;
-	u32 pix;
 
 	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		val16 = ((pix & 0x00F80000) >> 8) |
-			((pix & 0x0000FC00) >> 5) |
-			((pix & 0x000000F8) >> 3);
-		dbuf16[x] = cpu_to_le16(val16);
+		dbuf16[x] = drm_format_xrgb8888_to_rgb565(sbuf32[x]);
 	}
 }
 
@@ -498,16 +826,9 @@ static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsig
 	__le16 *dbuf16 = dbuf;
 	const __le32 *sbuf32 = sbuf;
 	unsigned int x;
-	u16 val16;
-	u32 pix;
 
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		val16 = ((pix & 0x00f80000) >> 9) |
-			((pix & 0x0000f800) >> 6) |
-			((pix & 0x000000f8) >> 3);
-		dbuf16[x] = cpu_to_le16(val16);
-	}
+	for (x = 0; x < pixels; x++)
+		dbuf16[x] = drm_format_xrgb8888_to_xrgb1555(sbuf32[x]);
 }
 
 /**
@@ -550,17 +871,9 @@ static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsig
 	__le16 *dbuf16 = dbuf;
 	const __le32 *sbuf32 = sbuf;
 	unsigned int x;
-	u16 val16;
-	u32 pix;
 
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		val16 = BIT(15) | /* set alpha bit */
-			((pix & 0x00f80000) >> 9) |
-			((pix & 0x0000f800) >> 6) |
-			((pix & 0x000000f8) >> 3);
-		dbuf16[x] = cpu_to_le16(val16);
-	}
+	for (x = 0; x < pixels; x++)
+		dbuf16[x] = drm_format_xrgb8888_to_argb1555(sbuf32[x]);
 }
 
 /**
@@ -603,17 +916,9 @@ static void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsig
 	__le16 *dbuf16 = dbuf;
 	const __le32 *sbuf32 = sbuf;
 	unsigned int x;
-	u16 val16;
-	u32 pix;
 
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		val16 = ((pix & 0x00f80000) >> 8) |
-			((pix & 0x0000f800) >> 5) |
-			((pix & 0x000000f8) >> 2) |
-			BIT(0); /* set alpha bit */
-		dbuf16[x] = cpu_to_le16(val16);
-	}
+	for (x = 0; x < pixels; x++)
+		dbuf16[x] = drm_format_xrgb8888_to_rgba5551(sbuf32[x]);
 }
 
 /**
@@ -707,13 +1012,9 @@ static void drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf, unsig
 	__le32 *dbuf32 = dbuf;
 	const __le32 *sbuf32 = sbuf;
 	unsigned int x;
-	u32 pix;
 
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		pix |= GENMASK(31, 24); /* fill alpha bits */
-		dbuf32[x] = cpu_to_le32(pix);
-	}
+	for (x = 0; x < pixels; x++)
+		dbuf32[x] = drm_format_xrgb8888_to_argb8888(sbuf32[x]);
 }
 
 /**
@@ -756,16 +1057,9 @@ static void drm_fb_xrgb8888_to_abgr8888_line(void *dbuf, const void *sbuf, unsig
 	__le32 *dbuf32 = dbuf;
 	const __le32 *sbuf32 = sbuf;
 	unsigned int x;
-	u32 pix;
 
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		pix = ((pix & 0x00ff0000) >> 16) <<  0 |
-		      ((pix & 0x0000ff00) >>  8) <<  8 |
-		      ((pix & 0x000000ff) >>  0) << 16 |
-		      GENMASK(31, 24); /* fill alpha bits */
-		*dbuf32++ = cpu_to_le32(pix);
-	}
+	for (x = 0; x < pixels; x++)
+		*dbuf32++ = drm_format_xrgb8888_to_abgr8888(sbuf32[x]);
 }
 
 static void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
@@ -787,16 +1081,9 @@ static void drm_fb_xrgb8888_to_xbgr8888_line(void *dbuf, const void *sbuf, unsig
 	__le32 *dbuf32 = dbuf;
 	const __le32 *sbuf32 = sbuf;
 	unsigned int x;
-	u32 pix;
 
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		pix = ((pix & 0x00ff0000) >> 16) <<  0 |
-		      ((pix & 0x0000ff00) >>  8) <<  8 |
-		      ((pix & 0x000000ff) >>  0) << 16 |
-		      ((pix & 0xff000000) >> 24) << 24;
-		*dbuf32++ = cpu_to_le32(pix);
-	}
+	for (x = 0; x < pixels; x++)
+		*dbuf32++ = drm_format_xrgb8888_to_xbgr8888(sbuf32[x]);
 }
 
 static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
@@ -818,17 +1105,9 @@ static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, un
 	__le32 *dbuf32 = dbuf;
 	const __le32 *sbuf32 = sbuf;
 	unsigned int x;
-	u32 val32;
-	u32 pix;
 
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		val32 = ((pix & 0x000000FF) << 2) |
-			((pix & 0x0000FF00) << 4) |
-			((pix & 0x00FF0000) << 6);
-		pix = val32 | ((val32 >> 8) & 0x00300C03);
-		*dbuf32++ = cpu_to_le32(pix);
-	}
+	for (x = 0; x < pixels; x++)
+		*dbuf32++ = drm_format_xrgb8888_to_xrgb2101010(sbuf32[x]);
 }
 
 /**
@@ -872,18 +1151,9 @@ static void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, un
 	__le32 *dbuf32 = dbuf;
 	const __le32 *sbuf32 = sbuf;
 	unsigned int x;
-	u32 val32;
-	u32 pix;
 
-	for (x = 0; x < pixels; x++) {
-		pix = le32_to_cpu(sbuf32[x]);
-		val32 = ((pix & 0x000000ff) << 2) |
-			((pix & 0x0000ff00) << 4) |
-			((pix & 0x00ff0000) << 6);
-		pix = GENMASK(31, 30) | /* set alpha bits */
-		      val32 | ((val32 >> 8) & 0x00300c03);
-		*dbuf32++ = cpu_to_le32(pix);
-	}
+	for (x = 0; x < pixels; x++)
+		*dbuf32++ = drm_format_xrgb8888_to_argb2101010(sbuf32[x]);
 }
 
 /**
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index f13b34e0b752..f416f0bef52d 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -66,6 +66,7 @@ void *drm_format_conv_state_reserve(struct drm_format_conv_state *state,
 				    size_t new_size, gfp_t flags);
 void drm_format_conv_state_release(struct drm_format_conv_state *state);
 
+u32 drm_fb_convert_from_xrgb8888(u32 color, u32 format);
 unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info *format,
 				const struct drm_rect *clip);
 
@@ -76,6 +77,14 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 		 const struct iosys_map *src, const struct drm_framebuffer *fb,
 		 const struct drm_rect *clip, bool cached,
 		 struct drm_format_conv_state *state);
+void drm_fb_blit_from_r1(struct iosys_map *dmap, unsigned int dpitch,
+			 const u8 *sbuf8, unsigned int spitch,
+			 unsigned int height, unsigned int width,
+			 u32 fg_color, u32 bg_color,
+			 unsigned int pixel_width);
+void drm_fb_fill(struct iosys_map *dmap, unsigned int dpitch,
+		 unsigned int height, unsigned int width,
+		 u32 color, unsigned int pixel_width);
 void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip, struct drm_format_conv_state *state);
-- 
2.43.0

