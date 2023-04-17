Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E1B6E473C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 14:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E33810E485;
	Mon, 17 Apr 2023 12:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4CC10E485
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 12:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qB7f0OxpjeLSdwGu6NC3ZHUTZud7vtOMw2iq1I8ObgU=; b=WrzfAl24Vtw4kthy1KDK/8pnMU
 HuYRHS5ALlydPzxh6iwGqKdxNN3aBu1SwZcBY3+CvQsdW1KbLmaL3r69MaZsgoKZXee8XQkEjYcRP
 Z33HZegAl9zKB9Nh7TRdK6oHlt9Xg0trcu+jMcLR/jVgMyo3YJNb6LiNNnYNfR+B8BaUcsL+Tmar4
 Bt3V0pLcPjI08tQVnQwpAwKa3NQMYYnK+/jA0IneBv+7J4GLbYgMg3ft67vJ+OUZ+QtbZ2LMuYjUo
 6gX9V1S3eONWRwj5oCD+iiapTveayXYSytXN71tKuOi6I/J7fK4GO/r6q+FweYi2QjPqr1iyzUq6I
 NxLAJL9g==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1poNhr-003OAC-TJ; Mon, 17 Apr 2023 14:11:40 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v3 5/6] drm/vkms: add rotate-270 property
Date: Mon, 17 Apr 2023 09:10:55 -0300
Message-Id: <20230417121056.63917-6-mcanal@igalia.com>
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

Currently, vkms supports the rotate-90, rotate-180, reflect-x and
reflect-y properties.  Therefore, improve the vkms IGT test coverage by
adding the rotate-270 property to vkms. The rotation was implement by
software: rotate the way the blending occurs by making the source x axis
be the destination y axis and the source y axis be the destination x
axis and reverse-read the axis.

Now, vkms supports all possible rotation values.

Tested with igt@kms_rotation_crc@primary-rotation-270,
and igt@kms_rotation_crc@sprite-rotation-270.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 11 +++++++++--
 drivers/gpu/drm/vkms/vkms_formats.c  |  8 +++++---
 drivers/gpu/drm/vkms/vkms_plane.c    |  7 ++-----
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index eb07344b7621..0b36b66419cb 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_vblank.h>
@@ -22,6 +23,8 @@ static struct pixel_argb_u16 *get_out_buffer(const struct vkms_frame_info *frame
 	switch (frame_info->rotation & DRM_MODE_ROTATE_MASK) {
 	case DRM_MODE_ROTATE_90:
 		return out - frame_info->dst.y1;
+	case DRM_MODE_ROTATE_270:
+		return out + frame_info->dst.y1;
 	default:
 		return out + frame_info->dst.x1;
 	}
@@ -59,7 +62,7 @@ static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
 	struct pixel_argb_u16 *in = stage_buffer->pixels;
 	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
 
-	if (frame_info->rotation & DRM_MODE_ROTATE_90)
+	if (drm_rotation_90_or_270(frame_info->rotation))
 		limit = min_t(size_t, drm_rect_height(&frame_info->dst), stage_buffer->n_pixels);
 
 	for (int x = 0; x < limit; x++) {
@@ -80,6 +83,10 @@ static int get_y_pos(struct vkms_frame_info *frame_info, int y)
 		if (y - frame_info->dst.x1 < 0)
 			return -1;
 		return frame_info->dst.x2 - y - 1;
+	case DRM_MODE_ROTATE_270:
+		if (y + frame_info->dst.x1 < 0)
+			return -1;
+		return y + frame_info->dst.x1;
 	default:
 		return y;
 	}
@@ -87,7 +94,7 @@ static int get_y_pos(struct vkms_frame_info *frame_info, int y)
 
 static bool check_limit(struct vkms_frame_info *frame_info, int pos)
 {
-	if (frame_info->rotation & DRM_MODE_ROTATE_90) {
+	if (drm_rotation_90_or_270(frame_info->rotation)) {
 		if (pos >= 0 && pos < drm_rect_width(&frame_info->dst))
 			return true;
 	} else {
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 4bf18447c58d..6877299007d8 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -2,6 +2,8 @@
 
 #include <linux/kernel.h>
 #include <linux/minmax.h>
+
+#include <drm/drm_blend.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_fixed.h>
 
@@ -44,14 +46,14 @@ static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y
 
 static int get_x_position(const struct vkms_frame_info *frame_info, int limit, int x)
 {
-	if (frame_info->rotation & DRM_MODE_REFLECT_X)
+	if (frame_info->rotation & (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_270))
 		return limit - x - 1;
 	return x;
 }
 
 static int get_limit(const struct vkms_frame_info *frame_info, struct line_buffer *stage_buffer)
 {
-	if (frame_info->rotation & DRM_MODE_ROTATE_90)
+	if (drm_rotation_90_or_270(frame_info->rotation))
 		return min_t(size_t, drm_rect_height(&frame_info->dst), stage_buffer->n_pixels);
 	return min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
 }
@@ -125,7 +127,7 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
 	for (size_t x = 0; x < limit; x++, src_pixels += plane->frame_info->cpp) {
 		int x_pos = get_x_position(plane->frame_info, limit, x);
 
-		if (plane->frame_info->rotation & DRM_MODE_ROTATE_90)
+		if (drm_rotation_90_or_270(plane->frame_info->rotation))
 			src_pixels = get_packed_src_addr(plane->frame_info, x
 							 + plane->frame_info->dst.y1)
 				+ plane->frame_info->cpp * y;
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index bb7cf4db0888..9ee5de7ef8dd 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -123,6 +123,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	drm_framebuffer_get(frame_info->fb);
 	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
 						     DRM_MODE_ROTATE_90 |
+						     DRM_MODE_ROTATE_270 |
 						     DRM_MODE_REFLECT_X |
 						     DRM_MODE_REFLECT_Y);
 
@@ -239,11 +240,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	drm_plane_helper_add(&plane->base, funcs);
 
 	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
-					   DRM_MODE_ROTATE_0 |
-					   DRM_MODE_ROTATE_90 |
-					   DRM_MODE_ROTATE_180 |
-					   DRM_MODE_REFLECT_X |
-					   DRM_MODE_REFLECT_Y);
+					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
 
 	return plane;
 }
-- 
2.39.2

