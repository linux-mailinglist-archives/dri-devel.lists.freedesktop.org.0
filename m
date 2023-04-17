Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A37646E473D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 14:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B97E10E488;
	Mon, 17 Apr 2023 12:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D1510E47F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 12:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=02QiWHuuetES8shmh8njcRkJDQMn1lUi7WscOtFz8EA=; b=keX2tVfpG5wQkFjsZ6LtU3GIn9
 CfcUBxb1ojl6/ivWYdxw/H1+WFGpXijr/T7olX2hQE8F2z5UlYTQ+v+FdilHU+MWXE7J6jSl8koyJ
 D13cNzUzOFvUQTfm989kVoc3pOQi7vo4pOLggjIU6jtB2Ero0dyTYoBRF0Uzz5VGzkKj/jv/y7yOi
 /S9YYEbc7w9GAdVcrCj7vS/eF/o+fL1Uodu0zx5rpO0ffL7/R0yxvBPpXg7WdnAbvVz5ZLCQGEwg6
 WM/G/h+sM/1i1GLLofopX9AEPqExfDWutqogpuDRYmoMo1mXndgaOl1X3sF1qUtn7hSgs17Z7SOUx
 MjKfYirQ==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1poNhk-003OAC-0l; Mon, 17 Apr 2023 14:11:32 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v3 3/6] drm/vkms: add reflect-y and rotate-180 property
Date: Mon, 17 Apr 2023 09:10:53 -0300
Message-Id: <20230417121056.63917-4-mcanal@igalia.com>
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

Currently, vkms only supports the reflect-x property. Therefore, add the
reflect-y property to vkms through a software implementation of the
operation. This is possible by reverse reading the y axis during the
blending.

Note that, by implementing the reflect-x and reflect-y properties, it is
also possible to add the rotate-180 property, as it is a combination
of those two properties.

Tested with igt@kms_rotation_crc@primary-reflect-y [1],
igt@kms_rotation_crc@sprite-reflect-y [1],
igt@kms_rotation_crc@primary-rotation-180,
igt@kms_rotation_crc@sprite-rotation-180,
and igt@kms_rotation_crc@cursor-rotation-180.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 16 +++++++++++++---
 drivers/gpu/drm/vkms/vkms_plane.c    |  7 +++++--
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 0f65c8c2e85e..c6e2f046c1f9 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -63,6 +63,13 @@ static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
 	}
 }
 
+static int get_y_pos(struct vkms_frame_info *frame_info, int y)
+{
+	if (frame_info->rotation & DRM_MODE_REFLECT_Y)
+		return drm_rect_height(&frame_info->dst) - y - 1;
+	return y;
+}
+
 static bool check_y_limit(struct vkms_frame_info *frame_info, int y)
 {
 	if (y >= frame_info->dst.y1 && y < frame_info->dst.y2)
@@ -96,6 +103,7 @@ static void blend(struct vkms_writeback_job *wb,
 {
 	struct vkms_plane_state **plane = crtc_state->active_planes;
 	u32 n_active_planes = crtc_state->num_active_planes;
+	int y_pos;
 
 	const struct pixel_argb_u16 background_color = { .a = 0xffff };
 
@@ -106,10 +114,12 @@ static void blend(struct vkms_writeback_job *wb,
 
 		/* The active planes are composed associatively in z-order. */
 		for (size_t i = 0; i < n_active_planes; i++) {
-			if (!check_y_limit(plane[i]->frame_info, y))
+			y_pos = get_y_pos(plane[i]->frame_info, y);
+
+			if (!check_y_limit(plane[i]->frame_info, y_pos))
 				continue;
 
-			vkms_compose_row(stage_buffer, plane[i], y);
+			vkms_compose_row(stage_buffer, plane[i], y_pos);
 			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
 					    output_buffer);
 		}
@@ -117,7 +127,7 @@ static void blend(struct vkms_writeback_job *wb,
 		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
 
 		if (wb)
-			wb->wb_write(&wb->wb_frame_info, output_buffer, y);
+			wb->wb_write(&wb->wb_frame_info, output_buffer, y_pos);
 	}
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 729ea7ce2ad3..020d098f710e 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -122,7 +122,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
 	drm_framebuffer_get(frame_info->fb);
 	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
-						     DRM_MODE_REFLECT_X);
+						     DRM_MODE_REFLECT_X |
+						     DRM_MODE_REFLECT_Y);
 
 	drm_rect_rotate(&frame_info->dst, drm_rect_width(&frame_info->dst),
 			drm_rect_height(&frame_info->dst), frame_info->rotation);
@@ -238,7 +239,9 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
 					   DRM_MODE_ROTATE_0 |
-					   DRM_MODE_REFLECT_X);
+					   DRM_MODE_ROTATE_180 |
+					   DRM_MODE_REFLECT_X |
+					   DRM_MODE_REFLECT_Y);
 
 	return plane;
 }
-- 
2.39.2

