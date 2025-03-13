Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9BAA5EFCE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 10:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F8A10E811;
	Thu, 13 Mar 2025 09:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LXj4IkE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551DB10E811
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 09:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741858991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/ArwIOjx1CNRYk7k0wOi5HipQxAMjs6A01jcZDsat00=;
 b=LXj4IkE8mAo06h5O+wwt0T07F//WShwyqIWp0+uwqPq1dy6ArMhuuolWWmB326VdFr7Xre
 nQUYFIyLIe+EHf/cH7AZHp0juqStASl/VxfVQLFMWWnEaDQS7vhSBh54lMJOANDRxeQtA0
 eOQ0207GLPkXqwzv2uV7z+D3YXUgruU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-447-26bDEJ1TO6WbU2_RRSrz9w-1; Thu,
 13 Mar 2025 05:43:10 -0400
X-MC-Unique: 26bDEJ1TO6WbU2_RRSrz9w-1
X-Mimecast-MFC-AGG-ID: 26bDEJ1TO6WbU2_RRSrz9w_1741858989
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6B1401956087; Thu, 13 Mar 2025 09:43:08 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.32.222])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A543218001DE; Thu, 13 Mar 2025 09:43:04 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ryosuke Yasuoka <ryasuoka@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH] drm/panic: Add support to scanout buffer as array of pages
Date: Thu, 13 Mar 2025 10:42:27 +0100
Message-ID: <20250313094257.1705916-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YX4q2RZhkAkaOpVxv7sHfOR9GCYncTL4g1fQu8d-pcE_1741858989
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Some drivers like virtio-gpu, don't map the scanout buffer in the
kernel. Calling vmap() in a panic handler is not safe, and writing an
atomic_vmap() API is more complex than expected [1].
So instead, pass the array of pages of the scanout buffer to the
panic handler, and map only one page at a time to draw the pixels.
This is obviously slow, but acceptable for a panic handler.

[1] https://lore.kernel.org/dri-devel/20250305152555.318159-1-ryasuoka@redhat.com/

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 139 ++++++++++++++++++++++++++++++++++--
 include/drm/drm_panic.h     |  10 ++-
 2 files changed, 142 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index ab42a2b1567d..e10ab8fe847c 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/font.h>
+#include <linux/highmem.h>
 #include <linux/init.h>
 #include <linux/iosys-map.h>
 #include <linux/kdebug.h>
@@ -154,6 +155,87 @@ static void drm_panic_blit_pixel(struct drm_scanout_buffer *sb, struct drm_rect
 				sb->set_pixel(sb, clip->x1 + x, clip->y1 + y, fg_color);
 }
 
+static void drm_panic_write_pixel16(void *vaddr, unsigned int offset, u16 color)
+{
+	u16 *p = vaddr + offset;
+
+	*p = color;
+}
+
+static void drm_panic_write_pixel24(void *vaddr, unsigned int offset, u32 color)
+{
+	u8 *p = vaddr + offset;
+
+	*p++ = color & 0xff;
+	color >>= 8;
+	*p++ = color & 0xff;
+	color >>= 8;
+	*p = color & 0xff;
+}
+
+static void drm_panic_write_pixel32(void *vaddr, unsigned int offset, u32 color)
+{
+	u32 *p = vaddr + offset;
+
+	*p = color;
+}
+
+static void drm_panic_write_pixel(void *vaddr, unsigned int offset, u32 color, unsigned int cpp)
+{
+	switch (cpp) {
+	case 2:
+		drm_panic_write_pixel16(vaddr, offset, color);
+		break;
+	case 3:
+		drm_panic_write_pixel24(vaddr, offset, color);
+		break;
+	case 4:
+		drm_panic_write_pixel32(vaddr, offset, color);
+		break;
+	default:
+		DRM_WARN_ONCE("Can't blit with pixel width %d\n", cpp);
+	}
+}
+
+/*
+ * The scanout buffer pages are not mapped, so for each pixel,
+ * use kmap_local_page() to map the page, and write the pixel.
+ * Tries to keep the map from the previous pixel, to avoid too much map/unmap.
+ */
+static void drm_panic_blit_page(struct page **pages, unsigned int dpitch,
+				unsigned int cpp, const u8 *sbuf8,
+				unsigned int spitch, struct drm_rect *clip,
+				unsigned int scale, u32 fg32)
+{
+	unsigned int y, x;
+	unsigned int page = ~0;
+	unsigned int height = drm_rect_height(clip);
+	unsigned int width = drm_rect_width(clip);
+	void *vaddr = NULL;
+
+	for (y = 0; y < height; y++) {
+		for (x = 0; x < width; x++) {
+			if (drm_draw_is_pixel_fg(sbuf8, spitch, x / scale, y / scale)) {
+				unsigned int new_page;
+				unsigned int offset;
+
+				offset = (y + clip->y1) * dpitch + (x + clip->x1) * cpp;
+				new_page = offset >> PAGE_SHIFT;
+				offset = offset % PAGE_SIZE;
+				if (new_page != page) {
+					if (vaddr)
+						kunmap_local(vaddr);
+					page = new_page;
+					vaddr = kmap_local_page(pages[page]);
+				}
+				drm_panic_write_pixel(vaddr, offset, fg32, cpp);
+			}
+		}
+	}
+	if (vaddr)
+		kunmap_local(vaddr);
+}
+
 /*
  * drm_panic_blit - convert a monochrome image to a linear framebuffer
  * @sb: destination scanout buffer
@@ -177,6 +259,10 @@ static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm_rect *clip,
 	if (sb->set_pixel)
 		return drm_panic_blit_pixel(sb, clip, sbuf8, spitch, scale, fg_color);
 
+	if (sb->pages)
+		return drm_panic_blit_page(sb->pages, sb->pitch[0], sb->format->cpp[0],
+					   sbuf8, spitch, clip, scale, fg_color);
+
 	map = sb->map[0];
 	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
 
@@ -209,6 +295,35 @@ static void drm_panic_fill_pixel(struct drm_scanout_buffer *sb,
 			sb->set_pixel(sb, clip->x1 + x, clip->y1 + y, color);
 }
 
+static void drm_panic_fill_page(struct page **pages, unsigned int dpitch,
+				unsigned int cpp, struct drm_rect *clip,
+				u32 color)
+{
+	unsigned int y, x;
+	unsigned int page = ~0;
+	void *vaddr = NULL;
+
+	for (y = clip->y1; y < clip->y2; y++) {
+		for (x = clip->x1; x < clip->x2; x++) {
+			unsigned int new_page;
+			unsigned int offset;
+
+			offset = y * dpitch + x * cpp;
+			new_page = offset >> PAGE_SHIFT;
+			offset = offset % PAGE_SIZE;
+			if (new_page != page) {
+				if (vaddr)
+					kunmap_local(vaddr);
+				page = new_page;
+				vaddr = kmap_local_page(pages[page]);
+			}
+			drm_panic_write_pixel(vaddr, offset, color, cpp);
+		}
+	}
+	if (vaddr)
+		kunmap_local(vaddr);
+}
+
 /*
  * drm_panic_fill - Fill a rectangle with a color
  * @sb: destination scanout buffer
@@ -225,6 +340,10 @@ static void drm_panic_fill(struct drm_scanout_buffer *sb, struct drm_rect *clip,
 	if (sb->set_pixel)
 		return drm_panic_fill_pixel(sb, clip, color);
 
+	if (sb->pages)
+		return drm_panic_fill_page(sb->pages, sb->pitch[0], sb->format->cpp[0],
+					   clip, color);
+
 	map = sb->map[0];
 	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
 
@@ -714,16 +833,24 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
 	if (!drm_panic_trylock(plane->dev, flags))
 		return;
 
+	ret = plane->helper_private->get_scanout_buffer(plane, &sb);
+
+	if (ret || !drm_panic_is_format_supported(sb.format))
+		goto unlock;
+
+	/* One of these should be set, or it can't draw pixels */
+	if (!sb.set_pixel && !sb.pages && iosys_map_is_null(&sb.map[0]))
+		goto unlock;
+
 	drm_panic_set_description(description);
 
-	ret = plane->helper_private->get_scanout_buffer(plane, &sb);
+	draw_panic_dispatch(&sb);
+	if (plane->helper_private->panic_flush)
+		plane->helper_private->panic_flush(plane);
 
-	if (!ret && drm_panic_is_format_supported(sb.format)) {
-		draw_panic_dispatch(&sb);
-		if (plane->helper_private->panic_flush)
-			plane->helper_private->panic_flush(plane);
-	}
 	drm_panic_clear_description();
+
+unlock:
 	drm_panic_unlock(plane->dev, flags);
 }
 
diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index f4e1fa9ae607..8b91a13347b9 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -39,6 +39,14 @@ struct drm_scanout_buffer {
 	 */
 	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
 
+	/**
+	 * @pages: Optional, if the scanout buffer is not mapped, set this field
+	 * to the array of pages of the scanout buffer. The panic code will use
+	 * kmap_local_page() to map one page at a time to write all the pixels.
+	 * The scanout buffer should be in linear format.
+	 */
+	struct page **pages;
+
 	/**
 	 * @width: Width of the scanout buffer, in pixels.
 	 */
@@ -57,7 +65,7 @@ struct drm_scanout_buffer {
 	/**
 	 * @set_pixel: Optional function, to set a pixel color on the
 	 * framebuffer. It allows to handle special tiling format inside the
-	 * driver.
+	 * driver. It takes precedence over the @map and @pages fields.
 	 */
 	void (*set_pixel)(struct drm_scanout_buffer *sb, unsigned int x,
 			  unsigned int y, u32 color);

base-commit: 9e75b6ef407fee5d4ed8021cd7ddd9d6a8f7b0e8
-- 
2.47.1

