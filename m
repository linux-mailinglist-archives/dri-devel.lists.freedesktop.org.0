Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349226E6570
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 15:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9A010E69C;
	Tue, 18 Apr 2023 13:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C6A10E345
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 13:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wdmR7+AWaJhLthumC5+E12PpwQGBUeaQGyGy0Jgis50=; b=Q5SK0lSJfccasQFQZTEvey/gjW
 o5Ckbhw3KwNK4v1ebXknDOV65nx00Zcw5YStLosW/iz0jYETsTwSoXT2/5tdv9WJ4U+Vj/8bNLMAS
 X5EUZl6pmZI6mQ7XnrdZTKrhwy7ntFuAf/RVhoSWbKtw4UE8y3KPxg7CXLN9bG5gcRdDHWRTsOL9h
 s/Bhlr6HBUl3q7g5i2RBIRibT40Q21/XWfus1IbD48LYwSM2SKdwPb1gRYRyl2LdB/2eiITorwLSi
 qH0j0DWJiJqK5PSWhgNyJbV7uqMCKzSy8+qz/HpTvnQ9DWKcRfupxKHL0Sgll1hxSJZ9dIPjdRXUI
 uRIaEWtw==;
Received: from [143.107.183.66] (helo=bowie.hotspot.icmc.usp.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pol3U-0041UK-4I; Tue, 18 Apr 2023 15:07:32 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v4 2/6] drm/vkms: add rotate-0 and reflect-x property
Date: Tue, 18 Apr 2023 10:05:22 -0300
Message-Id: <20230418130525.128733-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418130525.128733-1-mcanal@igalia.com>
References: <20230418130525.128733-1-mcanal@igalia.com>
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
 drivers/gpu/drm/vkms/vkms_composer.c |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h      |  2 ++
 drivers/gpu/drm/vkms/vkms_formats.c  | 16 +++++++++++++---
 drivers/gpu/drm/vkms/vkms_plane.c    | 12 ++++++++++++
 4 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 80164e79af00..a4436981cbcd 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -55,7 +55,7 @@ static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
 
 static bool check_y_limit(struct vkms_frame_info *frame_info, int y)
 {
-	if (y >= frame_info->dst.y1 && y < frame_info->dst.y2)
+	if (y >= frame_info->rotated.y1 && y < frame_info->rotated.y2)
 		return true;
 
 	return false;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index f152d54baf76..5f1a0a44a78c 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -26,7 +26,9 @@
 struct vkms_frame_info {
 	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
+	struct drm_rect rotated;
 	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
+	unsigned int rotation;
 	unsigned int offset;
 	unsigned int pitch;
 	unsigned int cpp;
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 8d948c73741e..f59b1c48a563 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -37,11 +37,18 @@ static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
 static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y)
 {
 	int x_src = frame_info->src.x1 >> 16;
-	int y_src = y - frame_info->dst.y1 + (frame_info->src.y1 >> 16);
+	int y_src = y - frame_info->rotated.y1 + (frame_info->src.y1 >> 16);
 
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
 	u8 *src_pixels = get_packed_src_addr(frame_info, y);
 	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
 
-	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->cpp)
-		plane->pixel_read(src_pixels, &out_pixels[x]);
+	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->cpp) {
+		int x_pos = get_x_position(frame_info, limit, x);
+
+		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
+	}
 }
 
 /*
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 0a23875900ec..3639afd7da47 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -117,9 +118,16 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	frame_info = vkms_plane_state->frame_info;
 	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
 	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
+	memcpy(&frame_info->rotated, &new_state->dst, sizeof(struct drm_rect));
 	frame_info->fb = fb;
 	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
 	drm_framebuffer_get(frame_info->fb);
+	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
+						     DRM_MODE_REFLECT_X);
+
+	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotated),
+			drm_rect_height(&frame_info->rotated), frame_info->rotation);
+
 	frame_info->offset = fb->offsets[0];
 	frame_info->pitch = fb->pitches[0];
 	frame_info->cpp = fb->format->cpp[0];
@@ -229,5 +237,9 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	drm_plane_helper_add(&plane->base, funcs);
 
+	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
+					   DRM_MODE_ROTATE_0 |
+					   DRM_MODE_REFLECT_X);
+
 	return plane;
 }
-- 
2.39.2

