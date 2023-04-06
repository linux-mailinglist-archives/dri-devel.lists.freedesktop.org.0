Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B446D9784
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 15:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4F310E327;
	Thu,  6 Apr 2023 13:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA1B10E327
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 13:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KZtzwbgRkPBAD2f5TyDUjsuO3SzbvI5CoR/uh0Sv7i4=; b=P1j11yIBQUSLU8/iL26kIDIqgE
 TFnLIzcgu82gX/rzQBYDBxt2wuJzeqBbx6dL+DD1kW5oNCBgTo0kNZ/aRbsfw9YnB9QOInqRgZZMK
 fq4mogm3gK1kNr07HVzt2fumKwDdETbuhlKoj9mtSqf/XBOD2zz0VRgHwwkXkM2F5QkqVIash6pBW
 VM9sH9mhErhyLt64T7oecJ7Pp948yO6dOQjfPum6u5PmdbTzGt15nYOewA9YtbvH/9HgWRZO7y3wH
 oE+j7Smc1CTeMexo31IoAlNzHRlRevsWEwOiq5b34cwPrzEV84uX/84HQSNSA+KMua3fI6Cs2hZdR
 jfKeozag==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pkPFh-0084OI-UN; Thu, 06 Apr 2023 15:02:10 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH 3/6] drm/vkms: add rotate-270 property
Date: Thu,  6 Apr 2023 10:01:35 -0300
Message-Id: <20230406130138.70752-4-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406130138.70752-1-mcanal@igalia.com>
References: <20230406130138.70752-1-mcanal@igalia.com>
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

Currently, vkms only supports the rotate-90 and rotate-180 properties.
Therefore, improve the vkms IGT test coverage by adding the rotate-270
property to vkms. The rotation was implement by software: rotate the way
the blending occurs by making the source x axis be the destination y axis
and the source y axis be the destination x axis and reverse-read the axis.

Tested with igt@kms_rotation_crc@primary-rotation-270, and
igt@kms_rotation_crc@sprite-rotation-270.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 12 ++++++++++--
 drivers/gpu/drm/vkms/vkms_formats.c  |  7 ++++---
 drivers/gpu/drm/vkms/vkms_plane.c    |  6 ++++--
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index ef4e5181d512..25d412f555ae 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_vblank.h>
@@ -23,6 +24,9 @@ static struct pixel_argb_u16 *get_out_buffer(const struct vkms_frame_info *frame
 	case DRM_MODE_ROTATE_180:
 		out -= frame_info->dst.x1;
 		break;
+	case DRM_MODE_ROTATE_270:
+		out += frame_info->dst.y1;
+		break;
 	default:
 		out += frame_info->dst.x1;
 		break;
@@ -63,7 +67,7 @@ static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
 	struct pixel_argb_u16 *in = stage_buffer->pixels;
 	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
 
-	if (frame_info->rotation & DRM_MODE_ROTATE_90)
+	if (drm_rotation_90_or_270(frame_info->rotation))
 		limit = min_t(size_t, drm_rect_height(&frame_info->dst), stage_buffer->n_pixels);
 
 	for (int x = 0; x < limit; x++) {
@@ -83,6 +87,10 @@ static int get_y_pos(struct vkms_frame_info *frame_info, int y)
 		return frame_info->dst.x2 - y - 1;
 	case DRM_MODE_ROTATE_180:
 		return drm_rect_height(&frame_info->dst) - y - 1;
+	case DRM_MODE_ROTATE_270:
+		if (y + frame_info->dst.x1 < 0)
+			return -1;
+		return y + frame_info->dst.x1;
 	default:
 		return y;
 	}
@@ -90,7 +98,7 @@ static int get_y_pos(struct vkms_frame_info *frame_info, int y)
 
 static bool check_limit(struct vkms_frame_info *frame_info, int pos)
 {
-	if (frame_info->rotation & DRM_MODE_ROTATE_90) {
+	if (drm_rotation_90_or_270(frame_info->rotation)) {
 		if (pos >= 0 && pos < drm_rect_width(&frame_info->dst))
 			return true;
 	} else {
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index b874786be6b1..07976194882b 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -2,6 +2,7 @@
 
 #include <linux/kernel.h>
 #include <linux/minmax.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_fixed.h>
 
@@ -44,21 +45,21 @@ static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y
 
 static int get_x_position(const struct vkms_frame_info *frame_info, int x_limit, int x)
 {
-	if (frame_info->rotation & DRM_MODE_ROTATE_180)
+	if (frame_info->rotation & (DRM_MODE_ROTATE_180 | DRM_MODE_ROTATE_270))
 		return x_limit - x - 1;
 	return x;
 }
 
 static int get_limit(const struct vkms_frame_info *frame_info, struct line_buffer *stage_buffer)
 {
-	if (frame_info->rotation & DRM_MODE_ROTATE_90)
+	if (drm_rotation_90_or_270(frame_info->rotation))
 		return min_t(size_t, drm_rect_height(&frame_info->dst), stage_buffer->n_pixels);
 	return min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
 }
 
 static u8 *get_src_pixels(const struct vkms_frame_info *frame_info, int x, int y, int pixel_size)
 {
-	if (frame_info->rotation & DRM_MODE_ROTATE_90)
+	if (drm_rotation_90_or_270(frame_info->rotation))
 		return get_packed_src_addr(frame_info, x + frame_info->dst.y1) + pixel_size * y;
 	return get_packed_src_addr(frame_info, y) + pixel_size * x;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 94c1e5d891cc..abaacad3bef2 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -124,7 +124,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	frame_info->rotation = drm_rotation_simplify(new_state->rotation,
 						     DRM_MODE_ROTATE_0 |
 						     DRM_MODE_ROTATE_90 |
-						     DRM_MODE_ROTATE_180);
+						     DRM_MODE_ROTATE_180 |
+						     DRM_MODE_ROTATE_270);
 
 	drm_rect_rotate(&frame_info->dst, drm_rect_width(&frame_info->dst),
 			drm_rect_height(&frame_info->dst), frame_info->rotation);
@@ -241,7 +242,8 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
 					   DRM_MODE_ROTATE_0 |
 					   DRM_MODE_ROTATE_90 |
-					   DRM_MODE_ROTATE_180);
+					   DRM_MODE_ROTATE_180 |
+					   DRM_MODE_ROTATE_270);
 
 	return plane;
 }
-- 
2.39.2

