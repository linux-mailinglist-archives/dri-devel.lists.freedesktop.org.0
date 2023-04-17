Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2726E473E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 14:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF5A10E491;
	Mon, 17 Apr 2023 12:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C723410E485
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 12:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sADe04wwWZszY1CGbC6v3amZ7OvJh4+Qfe74/FIjaSE=; b=SFIVyPaL+BlK9bQB7SSMpwOdwd
 CTrexelLjzSNrnw8j+VS/fYH8+jc0QGiNamb4aODARg00mQIlQx/seu5Zqtzwy5y9uE7YHdJhQXnk
 9JBcZv5bXjS3ClMgeVydrTSSkNqAeo+JiGycUkdTStjnT76Qp3a4j4fT5B5AFOsNj9YHzgc9dIBRm
 ql3CYKIX3uCG13D04CGt0Gv2oUdq8gWta5zsPhnflBKMO/aZ4fvCKxBiX7fwKm97KQRFH/fcOFykW
 kJ6tVdbOrGolcZy3iqeCuNwali3IeUkBFC6nfGjAXd6BcHCzvtiMtgHUAsboQ5h5n2Ck6DETezc/o
 +bQAAy1Q==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1poNhn-003OAC-QG; Mon, 17 Apr 2023 14:11:36 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v3 4/6] drm/vkms: add rotate-90 property
Date: Mon, 17 Apr 2023 09:10:54 -0300
Message-Id: <20230417121056.63917-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417121056.63917-1-mcanal@igalia.com>
References: <20230417121056.63917-1-mcanal@igalia.com>
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

Currently, vkms only supports the rotate-180, reflect-x and reflect-y
properties. Therefore, improve the vkms IGT test coverage by adding the
rotate-90 property to vkms. The rotation was implement by software: rotate
the way the blending occurs by making the source x axis be the destination
y axis and the source y axis be the destination x axis.

Tested with igt@kms_rotation_crc@primary-rotation-90,
igt@kms_rotation_crc@sprite-rotation-90, and
igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 38 +++++++++++++++++++++-------
 drivers/gpu/drm/vkms/vkms_formats.c  | 15 +++++++++--
 drivers/gpu/drm/vkms/vkms_plane.c    |  2 ++
 3 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index c6e2f046c1f9..eb07344b7621 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -19,7 +19,12 @@ static struct pixel_argb_u16 *get_out_buffer(const struct vkms_frame_info *frame
 	if (frame_info->rotation & DRM_MODE_REFLECT_X)
 		return out - frame_info->dst.x1;
 
-	return out + frame_info->dst.x1;
+	switch (frame_info->rotation & DRM_MODE_ROTATE_MASK) {
+	case DRM_MODE_ROTATE_90:
+		return out - frame_info->dst.y1;
+	default:
+		return out + frame_info->dst.x1;
+	}
 }
 
 static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
@@ -52,10 +57,12 @@ static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
 {
 	struct pixel_argb_u16 *out = get_out_buffer(frame_info, output_buffer);
 	struct pixel_argb_u16 *in = stage_buffer->pixels;
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    stage_buffer->n_pixels);
+	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
+
+	if (frame_info->rotation & DRM_MODE_ROTATE_90)
+		limit = min_t(size_t, drm_rect_height(&frame_info->dst), stage_buffer->n_pixels);
 
-	for (int x = 0; x < x_limit; x++) {
+	for (int x = 0; x < limit; x++) {
 		out[x].a = (u16)0xffff;
 		out[x].r = pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
 		out[x].g = pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
@@ -67,13 +74,26 @@ static int get_y_pos(struct vkms_frame_info *frame_info, int y)
 {
 	if (frame_info->rotation & DRM_MODE_REFLECT_Y)
 		return drm_rect_height(&frame_info->dst) - y - 1;
-	return y;
+
+	switch (frame_info->rotation & DRM_MODE_ROTATE_MASK) {
+	case DRM_MODE_ROTATE_90:
+		if (y - frame_info->dst.x1 < 0)
+			return -1;
+		return frame_info->dst.x2 - y - 1;
+	default:
+		return y;
+	}
 }
 
-static bool check_y_limit(struct vkms_frame_info *frame_info, int y)
+static bool check_limit(struct vkms_frame_info *frame_info, int pos)
 {
-	if (y >= frame_info->dst.y1 && y < frame_info->dst.y2)
-		return true;
+	if (frame_info->rotation & DRM_MODE_ROTATE_90) {
+		if (pos >= 0 && pos < drm_rect_width(&frame_info->dst))
+			return true;
+	} else {
+		if (pos >= frame_info->dst.y1 && pos < frame_info->dst.y2)
+			return true;
+	}
 
 	return false;
 }
@@ -116,7 +136,7 @@ static void blend(struct vkms_writeback_job *wb,
 		for (size_t i = 0; i < n_active_planes; i++) {
 			y_pos = get_y_pos(plane[i]->frame_info, y);
 
-			if (!check_y_limit(plane[i]->frame_info, y_pos))
+			if (!check_limit(plane[i]->frame_info, y_pos))
 				continue;
 
 			vkms_compose_row(stage_buffer, plane[i], y_pos);
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 42076df864ec..4bf18447c58d 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -49,6 +49,13 @@ static int get_x_position(const struct vkms_frame_info *frame_info, int limit, i
 	return x;
 }
 
+static int get_limit(const struct vkms_frame_info *frame_info, struct line_buffer *stage_buffer)
+{
+	if (frame_info->rotation & DRM_MODE_ROTATE_90)
+		return min_t(size_t, drm_rect_height(&frame_info->dst), stage_buffer->n_pixels);
+	return min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
+}
+
 static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 {
 	/*
@@ -113,12 +120,16 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
 {
 	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
 	u8 *src_pixels = get_packed_src_addr(plane->frame_info, y);
-	int limit = min_t(size_t, drm_rect_width(&plane->frame_info->dst),
-			  stage_buffer->n_pixels);
+	int limit = get_limit(plane->frame_info, stage_buffer);
 
 	for (size_t x = 0; x < limit; x++, src_pixels += plane->frame_info->cpp) {
 		int x_pos = get_x_position(plane->frame_info, limit, x);
 
+		if (plane->frame_info->rotation & DRM_MODE_ROTATE_90)
+			src_pixels = get_packed_src_addr(plane->frame_info, x
+							 + plane->frame_info->dst.y1)
+				+ plane->frame_info->cpp * y;
+
 		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
 	}
 }
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 020d098f710e..bb7cf4db0888 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -122,6 +122,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
 	drm_framebuffer_get(frame_info->fb);
 	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
+						     DRM_MODE_ROTATE_90 |
 						     DRM_MODE_REFLECT_X |
 						     DRM_MODE_REFLECT_Y);
 
@@ -239,6 +240,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
 					   DRM_MODE_ROTATE_0 |
+					   DRM_MODE_ROTATE_90 |
 					   DRM_MODE_ROTATE_180 |
 					   DRM_MODE_REFLECT_X |
 					   DRM_MODE_REFLECT_Y);
-- 
2.39.2

