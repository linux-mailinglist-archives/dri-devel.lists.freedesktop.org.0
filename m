Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C949F6E656E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 15:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736EB10E7AA;
	Tue, 18 Apr 2023 13:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8783410E345
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 13:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c1m5pO08F7dRdS08VWBoek/1y4D/PHa7s9ISk4N2M8s=; b=OdP27EBw4F9vzBPKnMUNNDy0vp
 JYMiH/CwYah7hxMwEbppgwyvxjU9EvpsIwiaiXUMib9osNvXDPzG31YMhOE5TUimXalPrdpqPvlOw
 Q2x0aOQrM3djE34U3YAv+iav+vptfP+rMvackM2SNF7H7wl5qV7k5sCou+cXB6+Ipn2qVItIFweN1
 1zjfd0YFhU/vxqEt4M+tAbEBweKzUfrnkC1j8VB27wNjekozWKOSqXJ30HYKH30a7s4WHpfKYFdLp
 JEq7jlf1Mmvy6K5g3dGl+NdbTq0mnWAq3/OdBzQLMpzUxhdKeLMg6C6Id6a01dDPWoXk1flQ+FPgZ
 LKYwiGQA==;
Received: from [143.107.183.66] (helo=bowie.hotspot.icmc.usp.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pol3Y-0041UK-CN; Tue, 18 Apr 2023 15:07:36 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v4 3/6] drm/vkms: add reflect-y and rotate-180 property
Date: Tue, 18 Apr 2023 10:05:23 -0300
Message-Id: <20230418130525.128733-4-mcanal@igalia.com>
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
index a4436981cbcd..6c5ef11b3943 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -53,6 +53,13 @@ static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
 	}
 }
 
+static int get_y_pos(struct vkms_frame_info *frame_info, int y)
+{
+	if (frame_info->rotation & DRM_MODE_REFLECT_Y)
+		return drm_rect_height(&frame_info->rotated) - y - 1;
+	return y;
+}
+
 static bool check_y_limit(struct vkms_frame_info *frame_info, int y)
 {
 	if (y >= frame_info->rotated.y1 && y < frame_info->rotated.y2)
@@ -86,6 +93,7 @@ static void blend(struct vkms_writeback_job *wb,
 {
 	struct vkms_plane_state **plane = crtc_state->active_planes;
 	u32 n_active_planes = crtc_state->num_active_planes;
+	int y_pos;
 
 	const struct pixel_argb_u16 background_color = { .a = 0xffff };
 
@@ -96,10 +104,12 @@ static void blend(struct vkms_writeback_job *wb,
 
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
@@ -107,7 +117,7 @@ static void blend(struct vkms_writeback_job *wb,
 		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
 
 		if (wb)
-			wb->wb_write(&wb->wb_frame_info, output_buffer, y);
+			wb->wb_write(&wb->wb_frame_info, output_buffer, y_pos);
 	}
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 3639afd7da47..904a278e07d7 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -123,7 +123,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
 	drm_framebuffer_get(frame_info->fb);
 	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
-						     DRM_MODE_REFLECT_X);
+						     DRM_MODE_REFLECT_X |
+						     DRM_MODE_REFLECT_Y);
 
 	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotated),
 			drm_rect_height(&frame_info->rotated), frame_info->rotation);
@@ -239,7 +240,9 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
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

