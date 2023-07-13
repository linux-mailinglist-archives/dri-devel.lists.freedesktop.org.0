Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59646752338
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 15:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6D510E6D3;
	Thu, 13 Jul 2023 13:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C8510E6D3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 13:17:26 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6264:77e5:42e2:477d])
 by laurent.telenet-ops.be with bizsmtp
 id LdHN2A00U3wy6xv01dHNpb; Thu, 13 Jul 2023 15:17:23 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qJwC3-001Gqw-2D;
 Thu, 13 Jul 2023 15:17:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qJwCA-00GWyh-OV;
 Thu, 13 Jul 2023 15:17:22 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/8] drm/ssd130x: Add support for DRM_FORMAT_R1
Date: Thu, 13 Jul 2023 15:17:12 +0200
Message-Id: <72746f6d9c47f09fc057ad7a4bbb3b7f423af803.1689252746.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689252746.git.geert@linux-m68k.org>
References: <cover.1689252746.git.geert@linux-m68k.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The native display format is monochrome light-on-dark (R1).
Hence add support for R1, so monochrome applications can avoid the
overhead of back-and-forth conversions between R1 and XR24.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
This work interfered with commit 49d7d581ceaf4cf8 ("drm/ssd130x: Don't
allocate buffers on each plane update") in drm-misc/for-linux-next,
which always allocates the buffer upfront, while it is no longer needed
when never using XR24.

Probably ssd130x->buffer should be allocated on first use.
And why not allocate the buffers using devm_kcalloc()?
---
 drivers/gpu/drm/solomon/ssd130x.c | 57 ++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 8ef5f61854fd7340..130e33a1ba3cba00 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -466,15 +466,14 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
 				 SSD130X_SET_ADDRESS_MODE_HORIZONTAL);
 }
 
-static int ssd130x_update_rect(struct ssd130x_device *ssd130x, struct drm_rect *rect)
+static int ssd130x_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
+			       unsigned int pitch, struct drm_rect *rect)
 {
 	unsigned int x = rect->x1;
 	unsigned int y = rect->y1;
-	u8 *buf = ssd130x->buffer;
 	u8 *data_array = ssd130x->data_array;
 	unsigned int width = drm_rect_width(rect);
 	unsigned int height = drm_rect_height(rect);
-	unsigned int line_length = DIV_ROUND_UP(width, 8);
 	unsigned int page_height = ssd130x->device_info->page_height;
 	unsigned int pages = DIV_ROUND_UP(height, page_height);
 	struct drm_device *drm = &ssd130x->drm;
@@ -534,7 +533,7 @@ if (!data_array) { pr_info("%s: data_array not yet initialized\n", __func__); re
 			u8 data = 0;
 
 			for (k = 0; k < m; k++) {
-				u8 byte = buf[(8 * i + k) * line_length + j / 8];
+				u8 byte = buf[(8 * i + k) * pitch + j / 8];
 				u8 bit = (byte >> (j % 8)) & 1;
 
 				data |= bit << k;
@@ -570,6 +569,8 @@ if (!data_array) { pr_info("%s: data_array not yet initialized\n", __func__); re
 
 static void ssd130x_clear_screen(struct ssd130x_device *ssd130x)
 {
+	unsigned int pitch = DIV_ROUND_UP(ssd130x->width, 8);
+	u8 *buf = ssd130x->buffer;
 	struct drm_rect fullscreen = {
 		.x1 = 0,
 		.x2 = ssd130x->width,
@@ -577,7 +578,7 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x)
 		.y2 = ssd130x->height,
 	};
 
-	ssd130x_update_rect(ssd130x, &fullscreen);
+	ssd130x_update_rect(ssd130x, buf, pitch, &fullscreen);
 }
 
 static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_map *vmap,
@@ -588,27 +589,48 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
 	struct iosys_map dst;
 	unsigned int dst_pitch;
 	int ret = 0;
-	u8 *buf = ssd130x->buffer;
-
-	if (!buf)
-		return 0;
+	u8 *buf;
 
 	/* Align y to display page boundaries */
 	rect->y1 = round_down(rect->y1, page_height);
 	rect->y2 = min_t(unsigned int, round_up(rect->y2, page_height), ssd130x->height);
 
-	dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
+	switch (fb->format->format) {
+	case DRM_FORMAT_R1:
+		/* Align x to byte boundaries */
+		rect->x1 = round_down(rect->x1, 8);
+		rect->x2 = round_up(rect->x2, 8);
 
-	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
-	if (ret)
-		return ret;
+		ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+		if (ret)
+			return ret;
 
-	iosys_map_set_vaddr(&dst, buf);
-	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
+		dst_pitch = fb->pitches[0];
+		buf = vmap[0].vaddr + rect->y1 * dst_pitch + rect->x1 / 8;
 
-	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+		ssd130x_update_rect(ssd130x, buf, dst_pitch, rect);
 
-	ssd130x_update_rect(ssd130x, rect);
+		drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+		break;
+
+	case DRM_FORMAT_XRGB8888:
+		dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
+		buf = ssd130x->buffer;
+		if (!buf)
+			return 0;
+
+		ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+		if (ret)
+			return ret;
+
+		iosys_map_set_vaddr(&dst, buf);
+		drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
+
+		drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+
+		ssd130x_update_rect(ssd130x, buf, dst_pitch, rect);
+		break;
+	}
 
 	return ret;
 }
@@ -797,6 +819,7 @@ static const struct drm_mode_config_funcs ssd130x_mode_config_funcs = {
 };
 
 static const uint32_t ssd130x_formats[] = {
+	DRM_FORMAT_R1,
 	DRM_FORMAT_XRGB8888,
 };
 
-- 
2.34.1

