Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B217C702ECE
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 15:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51AE10E1E5;
	Mon, 15 May 2023 13:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C1010E1E5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 13:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FT7XvCZK9ALZcawBcwdfPhTfuITlrd7QWtwWLvvAtbU=; b=jfOLsUkbv8K8hj9quF2h8DqqJR
 3LtFB7Ia/EorpF1KllWhRDOBdji1VthPODFAgYvmKMNR5m0rGgA0RAwO51aIZuKHAkaz4pAF/hg1F
 VwQ1AbzBDHvlnE70/eG+54dq1/hFjZtuJBX2dK2lfqx8Nw0wHWLPh7AR0lqlZa59sT/hexiCY9PhG
 +Ddt5HpAZIsHfG0XkBkPMGgn50/iPl6b2CdfVmyetebC1ZCAvP1ANpwziU8tludAz/65FYZdrzQKW
 Ha/Brxlx4P5JeKtI6OzXBVEToaAC3aX24KzDXQO8W+hzabACHr4wu6juB7hC+YirliAfzAZHprMAe
 5vhuZM3w==;
Received: from gwsc.sc.usp.br ([143.107.225.16] helo=bowie.sc.usp.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pyYd0-009tiB-IV; Mon, 15 May 2023 15:52:43 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH 3/3] drm/vkms: Isolate writeback pixel conversion functions
Date: Mon, 15 May 2023 10:52:05 -0300
Message-Id: <20230515135204.115393-4-mcanal@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515135204.115393-1-mcanal@igalia.com>
References: <20230515135204.115393-1-mcanal@igalia.com>
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

All convertions from the ARGB16161616 format follow the same structure.
Instead of repeting the same structure for each supported format, create
a function to encapsulate the common logic and isolate the pixel
conversion functions in a callback function.

Suggested-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c  |   4 +-
 drivers/gpu/drm/vkms/vkms_drv.h       |   4 +-
 drivers/gpu/drm/vkms/vkms_formats.c   | 140 +++++++++++---------------
 drivers/gpu/drm/vkms/vkms_formats.h   |   2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |   2 +-
 5 files changed, 63 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index e65104a2203d..43dc94483846 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -131,7 +131,7 @@ static void blend(struct vkms_writeback_job *wb,
 		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
 
 		if (wb)
-			wb->wb_write(&wb->wb_frame_info, output_buffer, y_pos);
+			vkms_writeback_row(wb, output_buffer, y_pos);
 	}
 }
 
@@ -145,7 +145,7 @@ static int check_format_funcs(struct vkms_crtc_state *crtc_state,
 		if (!planes[i]->pixel_read)
 			return -1;
 
-	if (active_wb && !active_wb->wb_write)
+	if (active_wb && !active_wb->pixel_write)
 		return -1;
 
 	return 0;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 883266bb0d4a..14819c36e2e8 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -46,8 +46,7 @@ struct line_buffer {
 struct vkms_writeback_job {
 	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
 	struct vkms_frame_info wb_frame_info;
-	void (*wb_write)(struct vkms_frame_info *frame_info,
-			 const struct line_buffer *buffer, int y);
+	void (*pixel_write)(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel);
 };
 
 /**
@@ -157,6 +156,7 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 void vkms_composer_worker(struct work_struct *work);
 void vkms_set_composer(struct vkms_output *out, bool enabled);
 void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y);
+void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
 /* Writeback */
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index ebacb8efa055..99fb756ad6fb 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -137,107 +137,81 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
  * They are used in the `compose_active_planes` to convert and store a line
  * from the src_buffer to the writeback buffer.
  */
-static void argb_u16_to_ARGB8888(struct vkms_frame_info *frame_info,
-				 const struct line_buffer *src_buffer, int y)
+static void argb_u16_to_ARGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 {
-	int x_dst = frame_info->dst.x1;
-	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
-	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    src_buffer->n_pixels);
-
-	for (size_t x = 0; x < x_limit; x++, dst_pixels += 4) {
-		/*
-		 * This sequence below is important because the format's byte order is
-		 * in little-endian. In the case of the ARGB8888 the memory is
-		 * organized this way:
-		 *
-		 * | Addr     | = blue channel
-		 * | Addr + 1 | = green channel
-		 * | Addr + 2 | = Red channel
-		 * | Addr + 3 | = Alpha channel
-		 */
-		dst_pixels[3] = DIV_ROUND_CLOSEST(in_pixels[x].a, 257);
-		dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixels[x].r, 257);
-		dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixels[x].g, 257);
-		dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixels[x].b, 257);
-	}
+	/*
+	 * This sequence below is important because the format's byte order is
+	 * in little-endian. In the case of the ARGB8888 the memory is
+	 * organized this way:
+	 *
+	 * | Addr     | = blue channel
+	 * | Addr + 1 | = green channel
+	 * | Addr + 2 | = Red channel
+	 * | Addr + 3 | = Alpha channel
+	 */
+	dst_pixels[3] = DIV_ROUND_CLOSEST(in_pixel->a, 257);
+	dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixel->r, 257);
+	dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixel->g, 257);
+	dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
 }
 
-static void argb_u16_to_XRGB8888(struct vkms_frame_info *frame_info,
-				 const struct line_buffer *src_buffer, int y)
+static void argb_u16_to_XRGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 {
-	int x_dst = frame_info->dst.x1;
-	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
-	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    src_buffer->n_pixels);
-
-	for (size_t x = 0; x < x_limit; x++, dst_pixels += 4) {
-		dst_pixels[3] = 0xff;
-		dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixels[x].r, 257);
-		dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixels[x].g, 257);
-		dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixels[x].b, 257);
-	}
+	dst_pixels[3] = 0xff;
+	dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixel->r, 257);
+	dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixel->g, 257);
+	dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
 }
 
-static void argb_u16_to_ARGB16161616(struct vkms_frame_info *frame_info,
-				     const struct line_buffer *src_buffer, int y)
+static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 {
-	int x_dst = frame_info->dst.x1;
-	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
-	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    src_buffer->n_pixels);
-
-	for (size_t x = 0; x < x_limit; x++, dst_pixels += 4) {
-		dst_pixels[3] = cpu_to_le16(in_pixels[x].a);
-		dst_pixels[2] = cpu_to_le16(in_pixels[x].r);
-		dst_pixels[1] = cpu_to_le16(in_pixels[x].g);
-		dst_pixels[0] = cpu_to_le16(in_pixels[x].b);
-	}
+	u16 *pixels = (u16 *)dst_pixels;
+
+	pixels[3] = cpu_to_le16(in_pixel->a);
+	pixels[2] = cpu_to_le16(in_pixel->r);
+	pixels[1] = cpu_to_le16(in_pixel->g);
+	pixels[0] = cpu_to_le16(in_pixel->b);
 }
 
-static void argb_u16_to_XRGB16161616(struct vkms_frame_info *frame_info,
-				     const struct line_buffer *src_buffer, int y)
+static void argb_u16_to_XRGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 {
-	int x_dst = frame_info->dst.x1;
-	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
-	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    src_buffer->n_pixels);
-
-	for (size_t x = 0; x < x_limit; x++, dst_pixels += 4) {
-		dst_pixels[3] = 0xffff;
-		dst_pixels[2] = cpu_to_le16(in_pixels[x].r);
-		dst_pixels[1] = cpu_to_le16(in_pixels[x].g);
-		dst_pixels[0] = cpu_to_le16(in_pixels[x].b);
-	}
+	u16 *pixels = (u16 *)dst_pixels;
+
+	pixels[3] = 0xffff;
+	pixels[2] = cpu_to_le16(in_pixel->r);
+	pixels[1] = cpu_to_le16(in_pixel->g);
+	pixels[0] = cpu_to_le16(in_pixel->b);
 }
 
-static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
-			       const struct line_buffer *src_buffer, int y)
+static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 {
-	int x_dst = frame_info->dst.x1;
-	u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
-	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    src_buffer->n_pixels);
+	u16 *pixels = (u16 *)dst_pixels;
 
 	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
 	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
 
-	for (size_t x = 0; x < x_limit; x++, dst_pixels++) {
-		s64 fp_r = drm_int2fixp(in_pixels[x].r);
-		s64 fp_g = drm_int2fixp(in_pixels[x].g);
-		s64 fp_b = drm_int2fixp(in_pixels[x].b);
+	s64 fp_r = drm_int2fixp(in_pixel->r);
+	s64 fp_g = drm_int2fixp(in_pixel->g);
+	s64 fp_b = drm_int2fixp(in_pixel->b);
 
-		u16 r = drm_fixp2int(drm_fixp_div(fp_r, fp_rb_ratio));
-		u16 g = drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
-		u16 b = drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
+	u16 r = drm_fixp2int(drm_fixp_div(fp_r, fp_rb_ratio));
+	u16 g = drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
+	u16 b = drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
 
-		*dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
-	}
+	*pixels = cpu_to_le16(r << 11 | g << 5 | b);
+}
+
+void vkms_writeback_row(struct vkms_writeback_job *wb,
+			const struct line_buffer *src_buffer, int y)
+{
+	struct vkms_frame_info *frame_info = &wb->wb_frame_info;
+	int x_dst = frame_info->dst.x1;
+	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
+	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
+	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst), src_buffer->n_pixels);
+
+	for (size_t x = 0; x < x_limit; x++, dst_pixels += frame_info->cpp)
+		wb->pixel_write(dst_pixels, &in_pixels[x]);
 }
 
 void *get_pixel_conversion_function(u32 format)
@@ -258,7 +232,7 @@ void *get_pixel_conversion_function(u32 format)
 	}
 }
 
-void *get_line_to_frame_function(u32 format)
+void *get_pixel_write_function(u32 format)
 {
 	switch (format) {
 	case DRM_FORMAT_ARGB8888:
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index c5b113495d0c..cf59c2ed8e9a 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -7,6 +7,6 @@
 
 void *get_pixel_conversion_function(u32 format);
 
-void *get_line_to_frame_function(u32 format);
+void *get_pixel_write_function(u32 format);
 
 #endif /* _VKMS_FORMATS_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 36e75fcefc1a..d7e63aa14663 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -151,7 +151,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	wb_frame_info->cpp = fb->format->cpp[0];
 
 	drm_writeback_queue_job(wb_conn, connector_state);
-	active_wb->wb_write = get_line_to_frame_function(wb_format);
+	active_wb->pixel_write = get_pixel_write_function(wb_format);
 	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
 	drm_rect_init(&wb_frame_info->dst, 0, 0, crtc_width, crtc_height);
 }
-- 
2.40.1

