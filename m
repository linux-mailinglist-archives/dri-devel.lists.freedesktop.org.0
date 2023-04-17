Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C056E4739
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 14:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E5D10E47B;
	Mon, 17 Apr 2023 12:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF2E10E47B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eRqjKKG18QTIqDCVmI1dj2n0Rr0vqDkvgDlNU9ShCAI=; b=iY2w1NDExN84CDF79z+TS1EXEb
 /+AvKJzXF+GgcrEPaB7HAGCbozHJv8wYKZ2iDGavy6AqGfw+SDqe+vzax7DmelMvxJzVoclZbImKz
 1NUUqrDdxTU62B334piMQBZ3OM4H5cqZKMq7WVmMAD1hK8mpnHNLDCPlzP37Q9T0MV3p31MXXJ9Xb
 IXyzHO3mDUu2ZS4+MNCRbqNHT8hFcG/Y30Snx/Ccg3AGrbOTi8DGfSghHSDMT3N3oBMbSKrV8Llv+
 362RwzaRC2xIedlFfvtiWdN9uE8PJv3WTM4l0mwwLOhrffSG9G50yLSnHJlD3sDlagdOmsFuwFhhY
 4yYbOoLA==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1poNhg-003OAC-4k; Mon, 17 Apr 2023 14:11:28 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v3 2/6] drm/vkms: add rotate-0 and reflect-x property
Date: Mon, 17 Apr 2023 09:10:52 -0300
Message-Id: <20230417121056.63917-3-mcanal@igalia.com>
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

Currently, vkms doesn't support any reflection property. Therefore, add
the reflect-x property to vkms through a software implementation of the
operation. This is possible by reverse reading the x axis during the
blending.

Tested with igt@kms_rotation_crc@primary-reflect-x and
igt@kms_rotation_crc@sprite-reflect-x [1].

[1] https://patchwork.freedesktop.org/series/116025/

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 14 ++++++++++++--
 drivers/gpu/drm/vkms/vkms_drv.h      |  1 +
 drivers/gpu/drm/vkms/vkms_formats.c  | 14 ++++++++++++--
 drivers/gpu/drm/vkms/vkms_plane.c    | 11 +++++++++++
 4 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 80164e79af00..0f65c8c2e85e 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -11,6 +11,17 @@
 
 #include "vkms_drv.h"
 
+static struct pixel_argb_u16 *get_out_buffer(const struct vkms_frame_info *frame_info,
+					     struct line_buffer *output_buffer)
+{
+	struct pixel_argb_u16 *out = output_buffer->pixels;
+
+	if (frame_info->rotation & DRM_MODE_REFLECT_X)
+		return out - frame_info->dst.x1;
+
+	return out + frame_info->dst.x1;
+}
+
 static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 {
 	u32 new_color;
@@ -39,8 +50,7 @@ static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
 				struct line_buffer *stage_buffer,
 				struct line_buffer *output_buffer)
 {
-	int x_dst = frame_info->dst.x1;
-	struct pixel_argb_u16 *out = output_buffer->pixels + x_dst;
+	struct pixel_argb_u16 *out = get_out_buffer(frame_info, output_buffer);
 	struct pixel_argb_u16 *in = stage_buffer->pixels;
 	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
 			    stage_buffer->n_pixels);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index f152d54baf76..21627cdea025 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -27,6 +27,7 @@ struct vkms_frame_info {
 	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
 	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
+	unsigned int rotation;
 	unsigned int offset;
 	unsigned int pitch;
 	unsigned int cpp;
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index bd542fd00698..42076df864ec 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -42,6 +42,13 @@ static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y
 	return packed_pixels_addr(frame_info, x_src, y_src);
 }
 
+static int get_x_position(const struct vkms_frame_info *frame_info, int limit, int x)
+{
+	if (frame_info->rotation & DRM_MODE_REFLECT_X)
+		return limit - x - 1;
+	return x;
+}
+
 static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 {
 	/*
@@ -109,8 +116,11 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
 	int limit = min_t(size_t, drm_rect_width(&plane->frame_info->dst),
 			  stage_buffer->n_pixels);
 
-	for (size_t x = 0; x < limit; x++, src_pixels += plane->frame_info->cpp)
-		plane->pixel_read(src_pixels, &out_pixels[x]);
+	for (size_t x = 0; x < limit; x++, src_pixels += plane->frame_info->cpp) {
+		int x_pos = get_x_position(plane->frame_info, limit, x);
+
+		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
+	}
 }
 
 /*
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 0a23875900ec..729ea7ce2ad3 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -120,6 +121,12 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	frame_info->fb = fb;
 	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
 	drm_framebuffer_get(frame_info->fb);
+	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
+						     DRM_MODE_REFLECT_X);
+
+	drm_rect_rotate(&frame_info->dst, drm_rect_width(&frame_info->dst),
+			drm_rect_height(&frame_info->dst), frame_info->rotation);
+
 	frame_info->offset = fb->offsets[0];
 	frame_info->pitch = fb->pitches[0];
 	frame_info->cpp = fb->format->cpp[0];
@@ -229,5 +236,9 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	drm_plane_helper_add(&plane->base, funcs);
 
+	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
+					   DRM_MODE_ROTATE_0 |
+					   DRM_MODE_REFLECT_X);
+
 	return plane;
 }
-- 
2.39.2

