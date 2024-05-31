Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8A28D5C58
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 10:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C15113249;
	Fri, 31 May 2024 08:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZBWHrwNq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA1111352D
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 08:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717142904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/soml8FAMcfJeklG6pBeKlCKu2fzh07f7rLuMOYOmcg=;
 b=ZBWHrwNqQUSk6kO7OQ3kZ+9zi/irOIqO5+HXrgOPykeZxO+BbDGMx/U+jwjSxfAB3TModL
 lE+/0ksc6BTwzP6JWO7aWdfs5sBhCIdeyQl/Aj5bfja1F7Et2A7sE7KPGvDQXRefHEDgAC
 LQzo+Tm/ffCeIpdr5UuCmDJR0+7FI2U=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-407-ELeDlVJbMPuV-f0p_b78vg-1; Fri,
 31 May 2024 04:08:20 -0400
X-MC-Unique: ELeDlVJbMPuV-f0p_b78vg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4464C3806701;
 Fri, 31 May 2024 08:08:20 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FA0A40EFD4;
 Fri, 31 May 2024 08:08:19 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 2/3] drm/panic: Add a set_pixel() callback to
 drm_scanout_buffer
Date: Fri, 31 May 2024 10:06:33 +0200
Message-ID: <20240531080750.765982-3-jfalempe@redhat.com>
In-Reply-To: <20240531080750.765982-1-jfalempe@redhat.com>
References: <20240531080750.765982-1-jfalempe@redhat.com>
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

This allows drivers to draw the pixel, and handle tiling, or specific
color formats.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 120 +++++++++++++++++++++++-------------
 include/drm/drm_panic.h     |   9 +++
 2 files changed, 85 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 9d95c7eaae83..27e26b9d842c 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -241,40 +241,54 @@ static void drm_panic_blit32(struct iosys_map *dmap, unsigned int dpitch,
 				iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, color);
 }
 
+static void drm_panic_blit_pixel(struct drm_scanout_buffer *sb, struct drm_rect *clip,
+				 const u8 *sbuf8, unsigned int spitch, u32 color)
+{
+	unsigned int y, x;
+
+	for (y = 0; y < drm_rect_height(clip); y++)
+		for (x = 0; x < drm_rect_width(clip); x++)
+			if (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8)))
+				sb->set_pixel(sb, clip->x1 + x, clip->y1 + y, color);
+}
+
 /*
  * drm_panic_blit - convert a monochrome image to a linear framebuffer
- * @dmap: destination iosys_map
- * @dpitch: destination pitch in bytes
+ * @sb: destination scanout buffer
+ * @clip: destination rectangle
  * @sbuf8: source buffer, in monochrome format, 8 pixels per byte.
  * @spitch: source pitch in bytes
- * @height: height of the image to copy, in pixels
- * @width: width of the image to copy, in pixels
  * @color: foreground color, in destination format
- * @pixel_width: pixel width in bytes.
  *
  * This can be used to draw a font character, which is a monochrome image, to a
  * framebuffer in other supported format.
  */
-static void drm_panic_blit(struct iosys_map *dmap, unsigned int dpitch,
-			   const u8 *sbuf8, unsigned int spitch,
-			   unsigned int height, unsigned int width,
-			   u32 color, unsigned int pixel_width)
+static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm_rect *clip,
+			   const u8 *sbuf8, unsigned int spitch, u32 color)
 {
-	switch (pixel_width) {
+	struct iosys_map map;
+
+	if (sb->set_pixel)
+		return drm_panic_blit_pixel(sb, clip, sbuf8, spitch, color);
+
+	map = sb->map[0];
+	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
+
+	switch (sb->format->cpp[0]) {
 	case 2:
-		drm_panic_blit16(dmap, dpitch, sbuf8, spitch,
-				 height, width, color);
+		drm_panic_blit16(&map, sb->pitch[0], sbuf8, spitch,
+				 drm_rect_height(clip), drm_rect_width(clip), color);
 	break;
 	case 3:
-		drm_panic_blit24(dmap, dpitch, sbuf8, spitch,
-				 height, width, color);
+		drm_panic_blit24(&map, sb->pitch[0], sbuf8, spitch,
+				 drm_rect_height(clip), drm_rect_width(clip), color);
 	break;
 	case 4:
-		drm_panic_blit32(dmap, dpitch, sbuf8, spitch,
-				 height, width, color);
+		drm_panic_blit32(&map, sb->pitch[0], sbuf8, spitch,
+				 drm_rect_height(clip), drm_rect_width(clip), color);
 	break;
 	default:
-		WARN_ONCE(1, "Can't blit with pixel width %d\n", pixel_width);
+		WARN_ONCE(1, "Can't blit with pixel width %d\n", sb->format->cpp[0]);
 	}
 }
 
@@ -318,33 +332,51 @@ static void drm_panic_fill32(struct iosys_map *dmap, unsigned int dpitch,
 			iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, color);
 }
 
+static void drm_panic_fill_pixel(struct drm_scanout_buffer *sb,
+				 struct drm_rect *clip,
+				 u32 color)
+{
+	unsigned int y, x;
+
+	for (y = 0; y < drm_rect_height(clip); y++)
+		for (x = 0; x < drm_rect_width(clip); x++)
+			sb->set_pixel(sb, clip->x1 + x, clip->y1 + y, color);
+}
+
 /*
  * drm_panic_fill - Fill a rectangle with a color
- * @dmap: destination iosys_map, pointing to the top left corner of the rectangle
- * @dpitch: destination pitch in bytes
- * @height: height of the rectangle, in pixels
- * @width: width of the rectangle, in pixels
- * @color: color to fill the rectangle.
- * @pixel_width: pixel width in bytes
+ * @sb: destination scanout buffer
+ * @clip: destination rectangle
+ * @color: foreground color, in destination format
  *
  * Fill a rectangle with a color, in a linear framebuffer.
  */
-static void drm_panic_fill(struct iosys_map *dmap, unsigned int dpitch,
-			   unsigned int height, unsigned int width,
-			   u32 color, unsigned int pixel_width)
+static void drm_panic_fill(struct drm_scanout_buffer *sb, struct drm_rect *clip,
+			   u32 color)
 {
-	switch (pixel_width) {
+	struct iosys_map map;
+
+	if (sb->set_pixel)
+		return drm_panic_fill_pixel(sb, clip, color);
+
+	map = sb->map[0];
+	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
+
+	switch (sb->format->cpp[0]) {
 	case 2:
-		drm_panic_fill16(dmap, dpitch, height, width, color);
+		drm_panic_fill16(&map, sb->pitch[0], drm_rect_height(clip),
+				 drm_rect_width(clip), color);
 	break;
 	case 3:
-		drm_panic_fill24(dmap, dpitch, height, width, color);
+		drm_panic_fill24(&map, sb->pitch[0], drm_rect_height(clip),
+				 drm_rect_width(clip), color);
 	break;
 	case 4:
-		drm_panic_fill32(dmap, dpitch, height, width, color);
+		drm_panic_fill32(&map, sb->pitch[0], drm_rect_height(clip),
+				 drm_rect_width(clip), color);
 	break;
 	default:
-		WARN_ONCE(1, "Can't fill with pixel width %d\n", pixel_width);
+		WARN_ONCE(1, "Can't fill with pixel width %d\n", sb->format->cpp[0]);
 	}
 }
 
@@ -377,25 +409,24 @@ static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
 	int i, j;
 	const u8 *src;
 	size_t font_pitch = DIV_ROUND_UP(font->width, 8);
-	struct iosys_map dst;
-	unsigned int px_width = sb->format->cpp[0];
-	int left = 0;
+	struct drm_rect rec;
 
 	msg_lines = min(msg_lines,  drm_rect_height(clip) / font->height);
 	for (i = 0; i < msg_lines; i++) {
 		size_t line_len = min(msg[i].len, drm_rect_width(clip) / font->width);
 
+		rec.y1 = clip->y1 +  i * font->height;
+		rec.y2 = rec.y1 + font->height;
+		rec.x1 = clip->x1;
+
 		if (centered)
-			left = (drm_rect_width(clip) - (line_len * font->width)) / 2;
+			rec.x1 += (drm_rect_width(clip) - (line_len * font->width)) / 2;
 
-		dst = sb->map[0];
-		iosys_map_incr(&dst, (clip->y1 + i * font->height) * sb->pitch[0] +
-				     (clip->x1 + left) * px_width);
 		for (j = 0; j < line_len; j++) {
 			src = get_char_bitmap(font, msg[i].txt[j], font_pitch);
-			drm_panic_blit(&dst, sb->pitch[0], src, font_pitch,
-				       font->height, font->width, color, px_width);
-			iosys_map_incr(&dst, font->width * px_width);
+			rec.x2 = rec.x1 + font->width;
+			drm_panic_blit(sb, &rec, src, font_pitch, color);
+			rec.x1 += font->width;
 		}
 	}
 }
@@ -410,7 +441,7 @@ static void draw_panic_static(struct drm_scanout_buffer *sb)
 	u32 fg_color = CONFIG_DRM_PANIC_FOREGROUND_COLOR;
 	u32 bg_color = CONFIG_DRM_PANIC_BACKGROUND_COLOR;
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
-	struct drm_rect r_logo, r_msg;
+	struct drm_rect r_screen, r_logo, r_msg;
 
 	if (!font)
 		return;
@@ -418,6 +449,8 @@ static void draw_panic_static(struct drm_scanout_buffer *sb)
 	fg_color = convert_from_xrgb8888(fg_color, sb->format->format);
 	bg_color = convert_from_xrgb8888(bg_color, sb->format->format);
 
+	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
+
 	r_logo = DRM_RECT_INIT(0, 0,
 			       get_max_line_len(logo, logo_lines) * font->width,
 			       logo_lines * font->height);
@@ -429,8 +462,7 @@ static void draw_panic_static(struct drm_scanout_buffer *sb)
 	drm_rect_translate(&r_msg, (sb->width - r_msg.x2) / 2, (sb->height - r_msg.y2) / 2);
 
 	/* Fill with the background color, and draw text on top */
-	drm_panic_fill(&sb->map[0], sb->pitch[0], sb->height, sb->width,
-		       bg_color, sb->format->cpp[0]);
+	drm_panic_fill(sb, &r_screen, bg_color);
 
 	if ((r_msg.x1 >= drm_rect_width(&r_logo) || r_msg.y1 >= drm_rect_height(&r_logo)) &&
 	    drm_rect_width(&r_logo) < sb->width && drm_rect_height(&r_logo) < sb->height) {
diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index 822dbb1aa9d6..73bb3f3d9ed9 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -50,6 +50,15 @@ struct drm_scanout_buffer {
 	 * @pitch: Length in bytes between the start of two consecutive lines.
 	 */
 	unsigned int pitch[DRM_FORMAT_MAX_PLANES];
+
+	/**
+	 * @set_pixel: Optional function, to set a pixel color on the
+	 * framebuffer. It allows to handle special tiling format inside the
+	 * driver.
+	 */
+	void (*set_pixel)(struct drm_scanout_buffer *sb, unsigned int x,
+			  unsigned int y, u32 color);
+
 };
 
 /**
-- 
2.45.1

