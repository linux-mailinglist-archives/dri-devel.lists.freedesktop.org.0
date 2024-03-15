Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4141D87CFEC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 16:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E367910F20C;
	Fri, 15 Mar 2024 15:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="crhJy1VA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4633D10ECBE
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710515642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxRkBido81ACyG7M2oINz27nnYIAZ+/9JeSjoE/UBcs=;
 b=crhJy1VAOm3eTzxBYJjmKGw9OuxBRsDT0X4cIMK8LgUHQ9D+PsY5+lSmsiJ93vM3sEw3IO
 6cR5H3AF/cJ4/oVL61NIPPW6M9cHMKStzy33hkoH/tH8gK216u/CJdbD/yMFFMbtvnC6EQ
 R4CAZq22me+i83xSbTAmJj1dsdP7ayU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-304-YqTkJ-OwOaeEwr5JGfWu-A-1; Fri,
 15 Mar 2024 11:13:59 -0400
X-MC-Unique: YqTkJ-OwOaeEwr5JGfWu-A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D79B32804811;
 Fri, 15 Mar 2024 15:13:58 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F03BF492BCD;
 Fri, 15 Mar 2024 15:13:56 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org,
 sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v10 3/9] drm/panic: Add support for color format conversion
Date: Fri, 15 Mar 2024 16:10:55 +0100
Message-ID: <20240315151317.857684-4-jfalempe@redhat.com>
In-Reply-To: <20240315151317.857684-1-jfalempe@redhat.com>
References: <20240315151317.857684-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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

Add support for the following formats:
DRM_FORMAT_RGB565
DRM_FORMAT_RGBA5551
DRM_FORMAT_XRGB1555
DRM_FORMAT_ARGB1555
DRM_FORMAT_RGB888
DRM_FORMAT_XRGB8888
DRM_FORMAT_ARGB8888
DRM_FORMAT_XBGR8888
DRM_FORMAT_XRGB2101010
DRM_FORMAT_ARGB2101010

v10:
 * move and simplify the functions from the drm format helper to drm_panic

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 272 ++++++++++++++++++++++++++++++++++--
 1 file changed, 262 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index faa64961c0f2..2c3b2fffe659 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -81,15 +81,155 @@ static const struct drm_panic_line logo[] = {
 	PANIC_LINE(" \\___)=(___/"),
 };
 
-static void drm_panic_fill32(struct iosys_map *map, unsigned int pitch,
+/*
+ * Color conversion
+ */
+
+static u16 convert_xrgb8888_to_rgb565(u32 pix)
+{
+	return ((pix & 0x00F80000) >> 8) |
+	       ((pix & 0x0000FC00) >> 5) |
+	       ((pix & 0x000000F8) >> 3);
+}
+
+static u16 convert_xrgb8888_to_rgba5551(u32 pix)
+{
+	return ((pix & 0x00f80000) >> 8) |
+	       ((pix & 0x0000f800) >> 5) |
+	       ((pix & 0x000000f8) >> 2) |
+	       BIT(0); /* set alpha bit */
+}
+
+static u16 convert_xrgb8888_to_xrgb1555(u32 pix)
+{
+	return ((pix & 0x00f80000) >> 9) |
+	       ((pix & 0x0000f800) >> 6) |
+	       ((pix & 0x000000f8) >> 3);
+}
+
+static u16 convert_xrgb8888_to_argb1555(u32 pix)
+{
+	return BIT(15) | /* set alpha bit */
+	       ((pix & 0x00f80000) >> 9) |
+	       ((pix & 0x0000f800) >> 6) |
+	       ((pix & 0x000000f8) >> 3);
+}
+
+static u32 convert_xrgb8888_to_argb8888(u32 pix)
+{
+	return pix | GENMASK(31, 24); /* fill alpha bits */
+}
+
+static u32 convert_xrgb8888_to_xbgr8888(u32 pix)
+{
+	return ((pix & 0x00ff0000) >> 16) <<  0 |
+	       ((pix & 0x0000ff00) >>  8) <<  8 |
+	       ((pix & 0x000000ff) >>  0) << 16 |
+	       ((pix & 0xff000000) >> 24) << 24;
+}
+
+static u32 convert_xrgb8888_to_abgr8888(u32 pix)
+{
+	return ((pix & 0x00ff0000) >> 16) <<  0 |
+	       ((pix & 0x0000ff00) >>  8) <<  8 |
+	       ((pix & 0x000000ff) >>  0) << 16 |
+	       GENMASK(31, 24); /* fill alpha bits */
+}
+
+static u32 convert_xrgb8888_to_xrgb2101010(u32 pix)
+{
+	pix = ((pix & 0x000000FF) << 2) |
+	      ((pix & 0x0000FF00) << 4) |
+	      ((pix & 0x00FF0000) << 6);
+	return pix | ((pix >> 8) & 0x00300C03);
+}
+
+static u32 convert_xrgb8888_to_argb2101010(u32 pix)
+{
+	pix = ((pix & 0x000000FF) << 2) |
+	      ((pix & 0x0000FF00) << 4) |
+	      ((pix & 0x00FF0000) << 6);
+	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
+}
+
+/*
+ * convert_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
+ * @color: input color, in xrgb8888 format
+ * @format: output format
+ *
+ * Returns:
+ * Color in the format specified, casted to u32.
+ * Or 0 if the format is not supported.
+ */
+static u32 convert_from_xrgb8888(u32 color, u32 format)
+{
+	switch (format) {
+	case DRM_FORMAT_RGB565:
+		return convert_xrgb8888_to_rgb565(color);
+	case DRM_FORMAT_RGBA5551:
+		return convert_xrgb8888_to_rgba5551(color);
+	case DRM_FORMAT_XRGB1555:
+		return convert_xrgb8888_to_xrgb1555(color);
+	case DRM_FORMAT_ARGB1555:
+		return convert_xrgb8888_to_argb1555(color);
+	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_XRGB8888:
+		return color;
+	case DRM_FORMAT_ARGB8888:
+		return convert_xrgb8888_to_argb8888(color);
+	case DRM_FORMAT_XBGR8888:
+		return convert_xrgb8888_to_xbgr8888(color);
+	case DRM_FORMAT_ABGR8888:
+		return convert_xrgb8888_to_abgr8888(color);
+	case DRM_FORMAT_XRGB2101010:
+		return convert_xrgb8888_to_xrgb2101010(color);
+	case DRM_FORMAT_ARGB2101010:
+		return convert_xrgb8888_to_argb2101010(color);
+	default:
+		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
+		return 0;
+	}
+}
+
+/*
+ * Blit & Fill
+ */
+static void drm_panic_blit16(struct iosys_map *dmap, unsigned int dpitch,
+			     const u8 *sbuf8, unsigned int spitch,
 			     unsigned int height, unsigned int width,
-			     u32 color)
+			     u16 fg16, u16 bg16)
 {
 	unsigned int y, x;
+	u16 val16;
 
-	for (y = 0; y < height; y++)
-		for (x = 0; x < width; x++)
-			iosys_map_wr(map, y * pitch + x * sizeof(u32), u32, color);
+	for (y = 0; y < height; y++) {
+		for (x = 0; x < width; x++) {
+			val16 = (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8))) ? fg16 : bg16;
+			iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, val16);
+		}
+	}
+}
+
+static void drm_panic_blit24(struct iosys_map *dmap, unsigned int dpitch,
+			     const u8 *sbuf8, unsigned int spitch,
+			     unsigned int height, unsigned int width,
+			     u32 fg32, u32 bg32)
+{
+	unsigned int y, x;
+	u32 val32;
+
+	for (y = 0; y < height; y++) {
+		for (x = 0; x < width; x++) {
+			u32 off = y * dpitch + x * 3;
+
+			val32 = (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8))) ? fg32 : bg32;
+
+			/* write blue-green-red to output in little endianness */
+			iosys_map_wr(dmap, off, u8, (val32 & 0x000000FF) >> 0);
+			iosys_map_wr(dmap, off + 1, u8, (val32 & 0x0000FF00) >> 8);
+			iosys_map_wr(dmap, off + 2, u8, (val32 & 0x00FF0000) >> 16);
+		}
+	}
 }
 
 static void drm_panic_blit32(struct iosys_map *dmap, unsigned int dpitch,
@@ -108,6 +248,115 @@ static void drm_panic_blit32(struct iosys_map *dmap, unsigned int dpitch,
 	}
 }
 
+/*
+ * drm_panic_blit - convert a monochrome image to a linear framebuffer
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
+static void drm_panic_blit(struct iosys_map *dmap, unsigned int dpitch,
+			   const u8 *sbuf8, unsigned int spitch,
+			   unsigned int height, unsigned int width,
+			   u32 fg_color, u32 bg_color,
+			   unsigned int pixel_width)
+{
+	switch (pixel_width) {
+	case 2:
+		drm_panic_blit16(dmap, dpitch, sbuf8, spitch,
+				 height, width, fg_color, bg_color);
+	break;
+	case 3:
+		drm_panic_blit24(dmap, dpitch, sbuf8, spitch,
+				 height, width, fg_color, bg_color);
+	break;
+	case 4:
+		drm_panic_blit32(dmap, dpitch, sbuf8, spitch,
+				 height, width, fg_color, bg_color);
+	break;
+	default:
+		WARN_ONCE(1, "Can't blit with pixel width %d\n", pixel_width);
+	}
+}
+
+static void drm_panic_fill16(struct iosys_map *dmap, unsigned int dpitch,
+			     unsigned int height, unsigned int width,
+			     u16 color)
+{
+	unsigned int y, x;
+
+	for (y = 0; y < height; y++)
+		for (x = 0; x < width; x++)
+			iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, color);
+}
+
+static void drm_panic_fill24(struct iosys_map *dmap, unsigned int dpitch,
+			     unsigned int height, unsigned int width,
+			     u32 color)
+{
+	unsigned int y, x;
+
+	for (y = 0; y < height; y++) {
+		for (x = 0; x < width; x++) {
+			unsigned int off = y * dpitch + x * 3;
+
+			/* write blue-green-red to output in little endianness */
+			iosys_map_wr(dmap, off, u8, (color & 0x000000FF) >> 0);
+			iosys_map_wr(dmap, off + 1, u8, (color & 0x0000FF00) >> 8);
+			iosys_map_wr(dmap, off + 2, u8, (color & 0x00FF0000) >> 16);
+		}
+	}
+}
+
+static void drm_panic_fill32(struct iosys_map *dmap, unsigned int dpitch,
+			     unsigned int height, unsigned int width,
+			     u32 color)
+{
+	unsigned int y, x;
+
+	for (y = 0; y < height; y++)
+		for (x = 0; x < width; x++)
+			iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, color);
+}
+
+/*
+ * drm_panic_fill - Fill a rectangle with a color
+ * @dmap: destination iosys_map, pointing to the top left corner of the rectangle
+ * @dpitch: destination pitch in bytes
+ * @height: height of the rectangle, in pixels
+ * @width: width of the rectangle, in pixels
+ * @color: color to fill the rectangle.
+ * @pixel_width: pixel width in bytes
+ *
+ * Fill a rectangle with a color, in a linear framebuffer.
+ */
+static void drm_panic_fill(struct iosys_map *dmap, unsigned int dpitch,
+			   unsigned int height, unsigned int width,
+			   u32 color, unsigned int pixel_width)
+{
+	switch (pixel_width) {
+	case 2:
+		drm_panic_fill16(dmap, dpitch, height, width, color);
+	break;
+	case 3:
+		drm_panic_fill24(dmap, dpitch, height, width, color);
+	break;
+	case 4:
+		drm_panic_fill32(dmap, dpitch, height, width, color);
+	break;
+	default:
+		WARN_ONCE(1, "Can't fill with pixel width %d\n", pixel_width);
+	}
+}
+
 static const u8 *get_char_bitmap(const struct font_desc *font, char c, size_t font_pitch)
 {
 	return font->data + (c * font->height) * font_pitch;
@@ -153,9 +402,9 @@ static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
 				     (clip->x1 + left) * px_width);
 		for (j = 0; j < line_len; j++) {
 			src = get_char_bitmap(font, msg[i].txt[j], font_pitch);
-			drm_panic_blit32(&dst, sb->pitch, src, font_pitch,
-					 font->height, font->width,
-					 fg_color, bg_color);
+			drm_panic_blit(&dst, sb->pitch, src, font_pitch,
+				       font->height, font->width,
+				       fg_color, bg_color, px_width);
 			iosys_map_incr(&dst, font->width * px_width);
 		}
 	}
@@ -177,6 +426,9 @@ static void draw_panic_static(struct drm_scanout_buffer *sb)
 	if (!font)
 		return;
 
+	fg_color = convert_from_xrgb8888(fg_color, sb->format->format);
+	bg_color = convert_from_xrgb8888(bg_color, sb->format->format);
+
 	r_logo = DRM_RECT_INIT(0, 0,
 			       get_max_line_len(logo, logo_lines) * font->width,
 			       logo_lines * font->height);
@@ -188,7 +440,7 @@ static void draw_panic_static(struct drm_scanout_buffer *sb)
 	drm_rect_translate(&r_msg, (sb->width - r_msg.x2) / 2, (sb->height - r_msg.y2) / 2);
 
 	/* Fill with the background color, and draw text on top */
-	drm_panic_fill32(&sb->map, sb->pitch, sb->height, sb->width, bg_color);
+	drm_panic_fill(&sb->map, sb->pitch, sb->height, sb->width, bg_color, sb->format->cpp[0]);
 
 	if ((r_msg.x1 >= drm_rect_width(&r_logo) || r_msg.y1 >= drm_rect_height(&r_logo)) &&
 	     drm_rect_width(&r_logo) < sb->width && drm_rect_height(&r_logo) < sb->height) {
@@ -206,7 +458,7 @@ static void draw_panic_static(struct drm_scanout_buffer *sb)
  */
 static bool drm_panic_is_format_supported(u32 format)
 {
-	return format == DRM_FORMAT_XRGB8888;
+	return convert_from_xrgb8888(0xffffff, format) != 0;
 }
 
 static void draw_panic_plane(struct drm_plane *plane)
-- 
2.44.0

