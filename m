Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0705B6E24BF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 15:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF8D10ED0E;
	Fri, 14 Apr 2023 13:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F07D10ED0E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 13:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LfM+HIRJX3imjy+dkRaFJxXd5ISj7HhAw502bWnHh4U=; b=Kv8HkoZEpW30Wv7QfQQFSUuoDl
 2TfgAYWbD8qwRf7HCjMP6L1FRcVzq3+1obbrtHcmxwzOH5tGwKdHHK4RZt+menVGB6WXM4F966/ul
 L6BxHyyyHMd2J98i71F+s4eYfy78K8o6R3zPFNvX7S83DG7ygAOFBNSWqTY5bFQR6AavKCSjib7AI
 oLXLnWnEYS9giFMGTmcv+aYX/+A983aWMZEd5rTk20O3dxGkMrgBe4/vqHwZveazQTZQibCy+3LOo
 rJ0xVKz7Kf8/eh0jxgEKBTlN+SS5Pvhuo8+WPxkRgUaSFb/uujwidFfX7A2fylYmrjeq5uX3d9Qlj
 17yzW0IA==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pnJqS-0015Av-M5; Fri, 14 Apr 2023 15:52:09 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v2 1/7] drm/vkms: isolate pixel conversion functionality
Date: Fri, 14 Apr 2023 10:51:45 -0300
Message-Id: <20230414135151.75975-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414135151.75975-1-mcanal@igalia.com>
References: <20230414135151.75975-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the pixel conversion functions repeat the same loop to
iterate the rows. Instead of repeating the same code for each pixel
format, create a function to wrap the loop and isolate the pixel
conversion functionality.

Suggested-by: Arthur Grillo <arthurgrillo@riseup.net>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c |   4 +-
 drivers/gpu/drm/vkms/vkms_drv.h      |   4 +-
 drivers/gpu/drm/vkms/vkms_formats.c  | 136 ++++++++++++---------------
 drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
 drivers/gpu/drm/vkms/vkms_plane.c    |   2 +-
 5 files changed, 65 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 8e53fa80742b..80164e79af00 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -99,7 +99,7 @@ static void blend(struct vkms_writeback_job *wb,
 			if (!check_y_limit(plane[i]->frame_info, y))
 				continue;
 
-			plane[i]->plane_read(stage_buffer, plane[i]->frame_info, y);
+			vkms_compose_row(stage_buffer, plane[i], y);
 			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
 					    output_buffer);
 		}
@@ -118,7 +118,7 @@ static int check_format_funcs(struct vkms_crtc_state *crtc_state,
 	u32 n_active_planes = crtc_state->num_active_planes;
 
 	for (size_t i = 0; i < n_active_planes; i++)
-		if (!planes[i]->plane_read)
+		if (!planes[i]->pixel_read)
 			return -1;
 
 	if (active_wb && !active_wb->wb_write)
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 4a248567efb2..d7ad813d7ae7 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -56,8 +56,7 @@ struct vkms_writeback_job {
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
 	struct vkms_frame_info *frame_info;
-	void (*plane_read)(struct line_buffer *buffer,
-			   const struct vkms_frame_info *frame_info, int y);
+	void (*pixel_read)(u16 *src_buffer, struct pixel_argb_u16 *out_pixels, int x);
 };
 
 struct vkms_plane {
@@ -155,6 +154,7 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 /* Composer Support */
 void vkms_composer_worker(struct work_struct *work);
 void vkms_set_composer(struct vkms_output *out, bool enabled);
+void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y);
 
 /* Writeback */
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index d4950688b3f1..02b0fc5a0839 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -42,100 +42,82 @@ static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y
 	return packed_pixels_addr(frame_info, x_src, y_src);
 }
 
-static void ARGB8888_to_argb_u16(struct line_buffer *stage_buffer,
-				 const struct vkms_frame_info *frame_info, int y)
+static void ARGB8888_to_argb_u16(u16 *src_pixels, struct pixel_argb_u16 *out_pixels, int x)
 {
-	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	u8 *src_pixels = get_packed_src_addr(frame_info, y);
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    stage_buffer->n_pixels);
-
-	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
-		/*
-		 * The 257 is the "conversion ratio". This number is obtained by the
-		 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
-		 * the best color value in a pixel format with more possibilities.
-		 * A similar idea applies to others RGB color conversions.
-		 */
-		out_pixels[x].a = (u16)src_pixels[3] * 257;
-		out_pixels[x].r = (u16)src_pixels[2] * 257;
-		out_pixels[x].g = (u16)src_pixels[1] * 257;
-		out_pixels[x].b = (u16)src_pixels[0] * 257;
-	}
+	u8 *pixels = (u8 *)src_pixels;
+
+	/*
+	 * The 257 is the "conversion ratio". This number is obtained by the
+	 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
+	 * the best color value in a pixel format with more possibilities.
+	 * A similar idea applies to others RGB color conversions.
+	 */
+	out_pixels[x].a = (u16)pixels[3] * 257;
+	out_pixels[x].r = (u16)pixels[2] * 257;
+	out_pixels[x].g = (u16)pixels[1] * 257;
+	out_pixels[x].b = (u16)pixels[0] * 257;
 }
 
-static void XRGB8888_to_argb_u16(struct line_buffer *stage_buffer,
-				 const struct vkms_frame_info *frame_info, int y)
+static void XRGB8888_to_argb_u16(u16 *src_pixels, struct pixel_argb_u16 *out_pixels, int x)
 {
-	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	u8 *src_pixels = get_packed_src_addr(frame_info, y);
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    stage_buffer->n_pixels);
+	u8 *pixels = (u8 *)src_pixels;
 
-	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
-		out_pixels[x].a = (u16)0xffff;
-		out_pixels[x].r = (u16)src_pixels[2] * 257;
-		out_pixels[x].g = (u16)src_pixels[1] * 257;
-		out_pixels[x].b = (u16)src_pixels[0] * 257;
-	}
+	out_pixels[x].a = (u16)0xffff;
+	out_pixels[x].r = (u16)pixels[2] * 257;
+	out_pixels[x].g = (u16)pixels[1] * 257;
+	out_pixels[x].b = (u16)pixels[0] * 257;
 }
 
-static void ARGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
-				     const struct vkms_frame_info *frame_info,
-				     int y)
+static void ARGB16161616_to_argb_u16(u16 *src_pixels, struct pixel_argb_u16 *out_pixels, int x)
 {
-	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	u16 *src_pixels = get_packed_src_addr(frame_info, y);
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    stage_buffer->n_pixels);
-
-	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
-		out_pixels[x].a = le16_to_cpu(src_pixels[3]);
-		out_pixels[x].r = le16_to_cpu(src_pixels[2]);
-		out_pixels[x].g = le16_to_cpu(src_pixels[1]);
-		out_pixels[x].b = le16_to_cpu(src_pixels[0]);
-	}
+	out_pixels[x].a = le16_to_cpu(src_pixels[3]);
+	out_pixels[x].r = le16_to_cpu(src_pixels[2]);
+	out_pixels[x].g = le16_to_cpu(src_pixels[1]);
+	out_pixels[x].b = le16_to_cpu(src_pixels[0]);
 }
 
-static void XRGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
-				     const struct vkms_frame_info *frame_info,
-				     int y)
+static void XRGB16161616_to_argb_u16(u16 *src_pixels, struct pixel_argb_u16 *out_pixels, int x)
 {
-	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	u16 *src_pixels = get_packed_src_addr(frame_info, y);
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    stage_buffer->n_pixels);
-
-	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
-		out_pixels[x].a = (u16)0xffff;
-		out_pixels[x].r = le16_to_cpu(src_pixels[2]);
-		out_pixels[x].g = le16_to_cpu(src_pixels[1]);
-		out_pixels[x].b = le16_to_cpu(src_pixels[0]);
-	}
+	out_pixels[x].a = (u16)0xffff;
+	out_pixels[x].r = le16_to_cpu(src_pixels[2]);
+	out_pixels[x].g = le16_to_cpu(src_pixels[1]);
+	out_pixels[x].b = le16_to_cpu(src_pixels[0]);
 }
 
-static void RGB565_to_argb_u16(struct line_buffer *stage_buffer,
-			       const struct vkms_frame_info *frame_info, int y)
+static void RGB565_to_argb_u16(u16 *src_pixels, struct pixel_argb_u16 *out_pixels, int x)
 {
-	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	u16 *src_pixels = get_packed_src_addr(frame_info, y);
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			       stage_buffer->n_pixels);
-
 	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
 	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
 
-	for (size_t x = 0; x < x_limit; x++, src_pixels++) {
-		u16 rgb_565 = le16_to_cpu(*src_pixels);
-		s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
-		s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
-		s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
+	u16 rgb_565 = le16_to_cpu(*src_pixels);
+	s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
+	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
+	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
 
-		out_pixels[x].a = (u16)0xffff;
-		out_pixels[x].r = drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
-		out_pixels[x].g = drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
-		out_pixels[x].b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
-	}
+	out_pixels[x].a = (u16)0xffff;
+	out_pixels[x].r = drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
+	out_pixels[x].g = drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
+	out_pixels[x].b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
+}
+
+void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y)
+{
+	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
+	u16 *src_pixels = get_packed_src_addr(plane->frame_info, y);
+	int limit = min_t(size_t, drm_rect_width(&plane->frame_info->dst),
+			  stage_buffer->n_pixels);
+	int format = plane->frame_info->fb->format->format;
+	int pixel_size;
+
+	if (format == DRM_FORMAT_RGB565)
+		pixel_size = 1;
+	else if (format == DRM_FORMAT_ARGB8888 || format == DRM_FORMAT_XRGB8888)
+		pixel_size = 2;
+	else
+		pixel_size = 4;
+
+	for (size_t x = 0; x < limit; x++, src_pixels += pixel_size)
+		plane->pixel_read(src_pixels, out_pixels, x);
 }
 
 /*
@@ -249,7 +231,7 @@ static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
 	}
 }
 
-void *get_frame_to_line_function(u32 format)
+void *get_pixel_conversion_function(u32 format)
 {
 	switch (format) {
 	case DRM_FORMAT_ARGB8888:
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index 43b7c1979018..c5b113495d0c 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -5,7 +5,7 @@
 
 #include "vkms_drv.h"
 
-void *get_frame_to_line_function(u32 format);
+void *get_pixel_conversion_function(u32 format);
 
 void *get_line_to_frame_function(u32 format);
 
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index c41cec7dcb70..0a23875900ec 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -123,7 +123,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	frame_info->offset = fb->offsets[0];
 	frame_info->pitch = fb->pitches[0];
 	frame_info->cpp = fb->format->cpp[0];
-	vkms_plane_state->plane_read = get_frame_to_line_function(fmt);
+	vkms_plane_state->pixel_read = get_pixel_conversion_function(fmt);
 }
 
 static int vkms_plane_atomic_check(struct drm_plane *plane,
-- 
2.39.2

