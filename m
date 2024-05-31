Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725898D5C5B
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 10:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AEF10EF16;
	Fri, 31 May 2024 08:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HwgyRvkR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25B71136D6
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 08:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717142906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Noz5/Cq7B48TTwvYOq18m2v7kLGAGmxTvOAWczyRKFo=;
 b=HwgyRvkRv8gXsVSLZ+spqSPYKgWv9gW2wcz5cw6dCapdQmaepC8KELeytZk1fZJGLpuHXc
 /iMFtqrhg7LwXdBSr5p2QDRwbQ33UViRQx69sZD1Ei0s3XibYierHPn9ga5g0VQRl/GqRi
 WkSOQ27P2ba7EXnek1Fs2kyZJJCYXZk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-zFB9qjD1OH2JC9wfoLL8fw-1; Fri, 31 May 2024 04:08:19 -0400
X-MC-Unique: zFB9qjD1OH2JC9wfoLL8fw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B940101A54F;
 Fri, 31 May 2024 08:08:19 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 065CB4B400E;
 Fri, 31 May 2024 08:08:17 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 1/3] drm/panic: only draw the foreground color in
 drm_panic_blit()
Date: Fri, 31 May 2024 10:06:32 +0200
Message-ID: <20240531080750.765982-2-jfalempe@redhat.com>
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

The whole framebuffer is cleared, so it's useless to rewrite the
background colored pixels. It allows to simplify the drawing
functions, and prepare the work for the set_pixel() callback.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 63 +++++++++++++++----------------------
 1 file changed, 26 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 7ece67086cec..9d95c7eaae83 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -197,37 +197,33 @@ static u32 convert_from_xrgb8888(u32 color, u32 format)
 static void drm_panic_blit16(struct iosys_map *dmap, unsigned int dpitch,
 			     const u8 *sbuf8, unsigned int spitch,
 			     unsigned int height, unsigned int width,
-			     u16 fg16, u16 bg16)
+			     u16 color)
 {
 	unsigned int y, x;
-	u16 val16;
 
-	for (y = 0; y < height; y++) {
-		for (x = 0; x < width; x++) {
-			val16 = (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8))) ? fg16 : bg16;
-			iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, val16);
-		}
-	}
+	for (y = 0; y < height; y++)
+		for (x = 0; x < width; x++)
+			if (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8)))
+				iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, color);
 }
 
 static void drm_panic_blit24(struct iosys_map *dmap, unsigned int dpitch,
 			     const u8 *sbuf8, unsigned int spitch,
 			     unsigned int height, unsigned int width,
-			     u32 fg32, u32 bg32)
+			     u32 color)
 {
 	unsigned int y, x;
-	u32 val32;
 
 	for (y = 0; y < height; y++) {
 		for (x = 0; x < width; x++) {
 			u32 off = y * dpitch + x * 3;
 
-			val32 = (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8))) ? fg32 : bg32;
-
-			/* write blue-green-red to output in little endianness */
-			iosys_map_wr(dmap, off, u8, (val32 & 0x000000FF) >> 0);
-			iosys_map_wr(dmap, off + 1, u8, (val32 & 0x0000FF00) >> 8);
-			iosys_map_wr(dmap, off + 2, u8, (val32 & 0x00FF0000) >> 16);
+			if (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8))) {
+				/* write blue-green-red to output in little endianness */
+				iosys_map_wr(dmap, off, u8, (color & 0x000000FF) >> 0);
+				iosys_map_wr(dmap, off + 1, u8, (color & 0x0000FF00) >> 8);
+				iosys_map_wr(dmap, off + 2, u8, (color & 0x00FF0000) >> 16);
+			}
 		}
 	}
 }
@@ -235,17 +231,14 @@ static void drm_panic_blit24(struct iosys_map *dmap, unsigned int dpitch,
 static void drm_panic_blit32(struct iosys_map *dmap, unsigned int dpitch,
 			     const u8 *sbuf8, unsigned int spitch,
 			     unsigned int height, unsigned int width,
-			     u32 fg32, u32 bg32)
+			     u32 color)
 {
 	unsigned int y, x;
-	u32 val32;
 
-	for (y = 0; y < height; y++) {
-		for (x = 0; x < width; x++) {
-			val32 = (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8))) ? fg32 : bg32;
-			iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, val32);
-		}
-	}
+	for (y = 0; y < height; y++)
+		for (x = 0; x < width; x++)
+			if (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8)))
+				iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, color);
 }
 
 /*
@@ -256,8 +249,7 @@ static void drm_panic_blit32(struct iosys_map *dmap, unsigned int dpitch,
  * @spitch: source pitch in bytes
  * @height: height of the image to copy, in pixels
  * @width: width of the image to copy, in pixels
- * @fg_color: foreground color, in destination format
- * @bg_color: background color, in destination format
+ * @color: foreground color, in destination format
  * @pixel_width: pixel width in bytes.
  *
  * This can be used to draw a font character, which is a monochrome image, to a
@@ -266,21 +258,20 @@ static void drm_panic_blit32(struct iosys_map *dmap, unsigned int dpitch,
 static void drm_panic_blit(struct iosys_map *dmap, unsigned int dpitch,
 			   const u8 *sbuf8, unsigned int spitch,
 			   unsigned int height, unsigned int width,
-			   u32 fg_color, u32 bg_color,
-			   unsigned int pixel_width)
+			   u32 color, unsigned int pixel_width)
 {
 	switch (pixel_width) {
 	case 2:
 		drm_panic_blit16(dmap, dpitch, sbuf8, spitch,
-				 height, width, fg_color, bg_color);
+				 height, width, color);
 	break;
 	case 3:
 		drm_panic_blit24(dmap, dpitch, sbuf8, spitch,
-				 height, width, fg_color, bg_color);
+				 height, width, color);
 	break;
 	case 4:
 		drm_panic_blit32(dmap, dpitch, sbuf8, spitch,
-				 height, width, fg_color, bg_color);
+				 height, width, color);
 	break;
 	default:
 		WARN_ONCE(1, "Can't blit with pixel width %d\n", pixel_width);
@@ -381,8 +372,7 @@ static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
 			       unsigned int msg_lines,
 			       bool centered,
 			       struct drm_rect *clip,
-			       u32 fg_color,
-			       u32 bg_color)
+			       u32 color)
 {
 	int i, j;
 	const u8 *src;
@@ -404,8 +394,7 @@ static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
 		for (j = 0; j < line_len; j++) {
 			src = get_char_bitmap(font, msg[i].txt[j], font_pitch);
 			drm_panic_blit(&dst, sb->pitch[0], src, font_pitch,
-				       font->height, font->width,
-				       fg_color, bg_color, px_width);
+				       font->height, font->width, color, px_width);
 			iosys_map_incr(&dst, font->width * px_width);
 		}
 	}
@@ -445,9 +434,9 @@ static void draw_panic_static(struct drm_scanout_buffer *sb)
 
 	if ((r_msg.x1 >= drm_rect_width(&r_logo) || r_msg.y1 >= drm_rect_height(&r_logo)) &&
 	    drm_rect_width(&r_logo) < sb->width && drm_rect_height(&r_logo) < sb->height) {
-		draw_txt_rectangle(sb, font, logo, logo_lines, false, &r_logo, fg_color, bg_color);
+		draw_txt_rectangle(sb, font, logo, logo_lines, false, &r_logo, fg_color);
 	}
-	draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color, bg_color);
+	draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color);
 }
 
 /*
-- 
2.45.1

