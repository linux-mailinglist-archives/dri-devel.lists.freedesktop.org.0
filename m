Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1650B93AD77
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 09:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE8B10E3BA;
	Wed, 24 Jul 2024 07:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FleB8go5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C364E10E3B0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 07:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721807583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wow2DOZEOdRXjdtqLL8h4gRN0xm65cnUGcVv4lm1nN8=;
 b=FleB8go59kpjXKR4LhWGJTEBHWwPmSWlAK58jwS0Gl5gst2FSgP3aS2P3vHnzblFt7quLL
 W1P1M6LzoKb53KrXRd4Pm70x9v7bbzoG336JhJ015W5bAZWLxcIvdd7cpJA9NEKde51Ux5
 hmwgdiRx/b19X0c7jU1wb9eHlBsKOgM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-85-Rc-3qBeWMMSO4XO0kHsccw-1; Wed,
 24 Jul 2024 03:52:57 -0400
X-MC-Unique: Rc-3qBeWMMSO4XO0kHsccw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1EB0319560BF; Wed, 24 Jul 2024 07:52:54 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.4])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CB5651955D45; Wed, 24 Jul 2024 07:52:48 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 "Bjorn Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v5 1/4] drm/panic: Add integer scaling to blit()
Date: Wed, 24 Jul 2024 09:48:42 +0200
Message-ID: <20240724075227.541245-2-jfalempe@redhat.com>
In-Reply-To: <20240724075227.541245-1-jfalempe@redhat.com>
References: <20240724075227.541245-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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

Add a parameter to the blit function, to upscale the image.
This is necessary to draw a QR code, otherwise, the pixels are
usually too small to be readable by most QR code reader.
It can also be used later for drawing fonts on high DPI display.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 072752b658f0..940e25949fd5 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -251,20 +251,20 @@ static bool drm_panic_is_pixel_fg(const u8 *sbuf8, unsigned int spitch, int x, i
 static void drm_panic_blit16(struct iosys_map *dmap, unsigned int dpitch,
 			     const u8 *sbuf8, unsigned int spitch,
 			     unsigned int height, unsigned int width,
-			     u16 fg16)
+			     unsigned int scale, u16 fg16)
 {
 	unsigned int y, x;
 
 	for (y = 0; y < height; y++)
 		for (x = 0; x < width; x++)
-			if (drm_panic_is_pixel_fg(sbuf8, spitch, x, y))
+			if (drm_panic_is_pixel_fg(sbuf8, spitch, x / scale, y / scale))
 				iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, fg16);
 }
 
 static void drm_panic_blit24(struct iosys_map *dmap, unsigned int dpitch,
 			     const u8 *sbuf8, unsigned int spitch,
 			     unsigned int height, unsigned int width,
-			     u32 fg32)
+			     unsigned int scale, u32 fg32)
 {
 	unsigned int y, x;
 
@@ -272,7 +272,7 @@ static void drm_panic_blit24(struct iosys_map *dmap, unsigned int dpitch,
 		for (x = 0; x < width; x++) {
 			u32 off = y * dpitch + x * 3;
 
-			if (drm_panic_is_pixel_fg(sbuf8, spitch, x, y)) {
+			if (drm_panic_is_pixel_fg(sbuf8, spitch, x / scale, y / scale)) {
 				/* write blue-green-red to output in little endianness */
 				iosys_map_wr(dmap, off, u8, (fg32 & 0x000000FF) >> 0);
 				iosys_map_wr(dmap, off + 1, u8, (fg32 & 0x0000FF00) >> 8);
@@ -285,24 +285,25 @@ static void drm_panic_blit24(struct iosys_map *dmap, unsigned int dpitch,
 static void drm_panic_blit32(struct iosys_map *dmap, unsigned int dpitch,
 			     const u8 *sbuf8, unsigned int spitch,
 			     unsigned int height, unsigned int width,
-			     u32 fg32)
+			     unsigned int scale, u32 fg32)
 {
 	unsigned int y, x;
 
 	for (y = 0; y < height; y++)
 		for (x = 0; x < width; x++)
-			if (drm_panic_is_pixel_fg(sbuf8, spitch, x, y))
+			if (drm_panic_is_pixel_fg(sbuf8, spitch, x / scale, y / scale))
 				iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, fg32);
 }
 
 static void drm_panic_blit_pixel(struct drm_scanout_buffer *sb, struct drm_rect *clip,
-				 const u8 *sbuf8, unsigned int spitch, u32 fg_color)
+				 const u8 *sbuf8, unsigned int spitch, unsigned int scale,
+				 u32 fg_color)
 {
 	unsigned int y, x;
 
 	for (y = 0; y < drm_rect_height(clip); y++)
 		for (x = 0; x < drm_rect_width(clip); x++)
-			if (drm_panic_is_pixel_fg(sbuf8, spitch, x, y))
+			if (drm_panic_is_pixel_fg(sbuf8, spitch, x / scale, y / scale))
 				sb->set_pixel(sb, clip->x1 + x, clip->y1 + y, fg_color);
 }
 
@@ -312,18 +313,22 @@ static void drm_panic_blit_pixel(struct drm_scanout_buffer *sb, struct drm_rect
  * @clip: destination rectangle
  * @sbuf8: source buffer, in monochrome format, 8 pixels per byte.
  * @spitch: source pitch in bytes
+ * @scale: integer scale, source buffer is scale time smaller than destination
+ *         rectangle
  * @fg_color: foreground color, in destination format
  *
  * This can be used to draw a font character, which is a monochrome image, to a
  * framebuffer in other supported format.
  */
 static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm_rect *clip,
-			   const u8 *sbuf8, unsigned int spitch, u32 fg_color)
+			   const u8 *sbuf8, unsigned int spitch,
+			   unsigned int scale, u32 fg_color)
+
 {
 	struct iosys_map map;
 
 	if (sb->set_pixel)
-		return drm_panic_blit_pixel(sb, clip, sbuf8, spitch, fg_color);
+		return drm_panic_blit_pixel(sb, clip, sbuf8, spitch, scale, fg_color);
 
 	map = sb->map[0];
 	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
@@ -331,15 +336,15 @@ static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm_rect *clip,
 	switch (sb->format->cpp[0]) {
 	case 2:
 		drm_panic_blit16(&map, sb->pitch[0], sbuf8, spitch,
-				 drm_rect_height(clip), drm_rect_width(clip), fg_color);
+				 drm_rect_height(clip), drm_rect_width(clip), scale, fg_color);
 	break;
 	case 3:
 		drm_panic_blit24(&map, sb->pitch[0], sbuf8, spitch,
-				 drm_rect_height(clip), drm_rect_width(clip), fg_color);
+				 drm_rect_height(clip), drm_rect_width(clip), scale, fg_color);
 	break;
 	case 4:
 		drm_panic_blit32(&map, sb->pitch[0], sbuf8, spitch,
-				 drm_rect_height(clip), drm_rect_width(clip), fg_color);
+				 drm_rect_height(clip), drm_rect_width(clip), scale, fg_color);
 	break;
 	default:
 		WARN_ONCE(1, "Can't blit with pixel width %d\n", sb->format->cpp[0]);
@@ -479,7 +484,7 @@ static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
 		for (j = 0; j < line_len; j++) {
 			src = get_char_bitmap(font, msg[i].txt[j], font_pitch);
 			rec.x2 = rec.x1 + font->width;
-			drm_panic_blit(sb, &rec, src, font_pitch, color);
+			drm_panic_blit(sb, &rec, src, font_pitch, 1, color);
 			rec.x1 += font->width;
 		}
 	}
-- 
2.45.2

