Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AABB7873A6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 17:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C082310E586;
	Thu, 24 Aug 2023 15:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B6610E58B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 15:08:55 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:3c6b:f703:5ab5:f36d])
 by baptiste.telenet-ops.be with bizsmtp
 id dT8t2A00701sfPQ01T8tZW; Thu, 24 Aug 2023 17:08:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qZBwx-001dhJ-Gu;
 Thu, 24 Aug 2023 17:08:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qZBx7-000Vyw-5y;
 Thu, 24 Aug 2023 17:08:53 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 4/8] drm/ssd130x: Add support for DRM_FORMAT_R1
Date: Thu, 24 Aug 2023 17:08:42 +0200
Message-Id: <d5f342b5382653c1f1fb72dbedb783f9ea42416e.1692888745.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692888745.git.geert@linux-m68k.org>
References: <cover.1692888745.git.geert@linux-m68k.org>
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
Hence add support for R1, so monochrome applications not only look
better, but also avoid the overhead of back-and-forth conversions
between R1 and XR24.

Do not allocate the intermediate conversion buffer when it is not
needed, and reorder the two buffer allocations to streamline operation.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - Rework on top op commit 8c3926367ac9df6c ("drm/ssd130x: Use
    shadow-buffer helpers when managing plane's state") in drm/drm-next.
    Hence I did not add Javier's tags given on v1.
  - Do not allocate intermediate buffer when not needed.
---
 drivers/gpu/drm/solomon/ssd130x.c | 76 +++++++++++++++++++++----------
 1 file changed, 51 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 78272b1f9d5b167f..18007cb4f3de5aa1 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -449,15 +449,14 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
 
 static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 			       struct ssd130x_plane_state *ssd130x_state,
+			       u8 *buf, unsigned int pitch,
 			       struct drm_rect *rect)
 {
 	unsigned int x = rect->x1;
 	unsigned int y = rect->y1;
-	u8 *buf = ssd130x_state->buffer;
 	u8 *data_array = ssd130x_state->data_array;
 	unsigned int width = drm_rect_width(rect);
 	unsigned int height = drm_rect_height(rect);
-	unsigned int line_length = DIV_ROUND_UP(width, 8);
 	unsigned int page_height = ssd130x->device_info->page_height;
 	unsigned int pages = DIV_ROUND_UP(height, page_height);
 	struct drm_device *drm = &ssd130x->drm;
@@ -516,7 +515,7 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 			u8 data = 0;
 
 			for (k = 0; k < m; k++) {
-				u8 byte = buf[(8 * i + k) * line_length + j / 8];
+				u8 byte = buf[(8 * i + k) * pitch + j / 8];
 				u8 bit = (byte >> (j % 8)) & 1;
 
 				data |= bit << k;
@@ -602,27 +601,51 @@ static int ssd130x_fb_blit_rect(struct drm_plane_state *state,
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
 	unsigned int page_height = ssd130x->device_info->page_height;
 	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(state);
-	u8 *buf = ssd130x_state->buffer;
 	struct iosys_map dst;
 	unsigned int dst_pitch;
 	int ret = 0;
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
+
+		dst_pitch = fb->pitches[0];
+		buf = vmap[0].vaddr + rect->y1 * dst_pitch + rect->x1 / 8;
+
+		ssd130x_update_rect(ssd130x, ssd130x_state, buf, dst_pitch,
+				    rect);
+
+		drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+		break;
+
+	case DRM_FORMAT_XRGB8888:
+		dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
+		buf = ssd130x_state->buffer;
+
+		ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+		if (ret)
+			return ret;
 
-	iosys_map_set_vaddr(&dst, buf);
-	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
+		iosys_map_set_vaddr(&dst, buf);
+		drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
 
-	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+		drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
-	ssd130x_update_rect(ssd130x, ssd130x_state, rect);
+		ssd130x_update_rect(ssd130x, ssd130x_state, buf, dst_pitch,
+				    rect);
+		break;
+	}
 
 	return ret;
 }
@@ -644,22 +667,24 @@ static int ssd130x_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
-	fi = drm_format_info(DRM_FORMAT_R1);
-	if (!fi)
-		return -EINVAL;
+	ssd130x_state->data_array = kcalloc(ssd130x->width, pages, GFP_KERNEL);
+	if (!ssd130x_state->data_array)
+		return -ENOMEM;
 
-	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
+	if (plane_state->fb->format->format != DRM_FORMAT_R1) {
+		fi = drm_format_info(DRM_FORMAT_R1);
+		if (!fi)
+			return -EINVAL;
 
-	ssd130x_state->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
-	if (!ssd130x_state->buffer)
-		return -ENOMEM;
+		pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
 
-	ssd130x_state->data_array = kcalloc(ssd130x->width, pages, GFP_KERNEL);
-	if (!ssd130x_state->data_array) {
-		kfree(ssd130x_state->buffer);
-		/* Set to prevent a double free in .atomic_destroy_state() */
-		ssd130x_state->buffer = NULL;
-		return -ENOMEM;
+		ssd130x_state->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
+		if (!ssd130x_state->buffer) {
+			kfree(ssd130x_state->data_array);
+			/* Set to prevent a double free in .atomic_destroy_state() */
+			ssd130x_state->data_array = NULL;
+			return -ENOMEM;
+		}
 	}
 
 	return 0;
@@ -898,6 +923,7 @@ static const struct drm_mode_config_funcs ssd130x_mode_config_funcs = {
 };
 
 static const uint32_t ssd130x_formats[] = {
+	DRM_FORMAT_R1,
 	DRM_FORMAT_XRGB8888,
 };
 
-- 
2.34.1

