Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15A66E6573
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 15:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B4A10E7AB;
	Tue, 18 Apr 2023 13:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619FA10E7AB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 13:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NQEFOA1ZYNO3SdWffhfZXsPPbtE9YhLY4tp4VnX8blE=; b=LRBWZ0dnN7n/oDoB0Nvdi+t3bp
 RfADzbb1zncEZPWZ9cFUmhAvdWGroEVE3OFXzUTzuOS4mG1gc7M8HsEJ0P/T6iXNL3rtT0Bwo8XBV
 eG/N4YWtWPt1AoMWE95dM6RjU7p8LgDtwAQPxmxq2/xaB3/FtP0ecui2PGz4ue76j1tP9osRrpooy
 8mlhkdxiFbPYH0R8JkICw6MZCHoWJBZCpMpAeulYYHwH6mjvoiZ6Yn9S16mJHCUJ1yNKTfyxnRnny
 JSxxx2GkW1D5jCTWhLI5g4sdWg68LARyOQEH8gP2uy1SdX6VJ9elg/hijzQanhrffyWo8QV+mgfsZ
 j3Rqy+oA==;
Received: from [143.107.183.66] (helo=bowie.hotspot.icmc.usp.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pol3h-0041UK-7f; Tue, 18 Apr 2023 15:07:45 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v4 5/6] drm/vkms: add rotate-270 property
Date: Tue, 18 Apr 2023 10:05:25 -0300
Message-Id: <20230418130525.128733-6-mcanal@igalia.com>
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
 drivers/gpu/drm/vkms/vkms_composer.c | 5 ++++-
 drivers/gpu/drm/vkms/vkms_formats.c  | 6 ++++--
 drivers/gpu/drm/vkms/vkms_plane.c    | 7 ++-----
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 491850ffeac9..906d3df40cdb 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_vblank.h>
@@ -61,6 +62,8 @@ static int get_y_pos(struct vkms_frame_info *frame_info, int y)
 	switch (frame_info->rotation & DRM_MODE_ROTATE_MASK) {
 	case DRM_MODE_ROTATE_90:
 		return frame_info->rotated.x2 - y - 1;
+	case DRM_MODE_ROTATE_270:
+		return y + frame_info->rotated.x1;
 	default:
 		return y;
 	}
@@ -68,7 +71,7 @@ static int get_y_pos(struct vkms_frame_info *frame_info, int y)
 
 static bool check_limit(struct vkms_frame_info *frame_info, int pos)
 {
-	if (frame_info->rotation & DRM_MODE_ROTATE_90) {
+	if (drm_rotation_90_or_270(frame_info->rotation)) {
 		if (pos >= 0 && pos < drm_rect_width(&frame_info->rotated))
 			return true;
 	} else {
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index f56f359e0d2d..ebacb8efa055 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -2,6 +2,8 @@
 
 #include <linux/kernel.h>
 #include <linux/minmax.h>
+
+#include <drm/drm_blend.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_fixed.h>
 
@@ -44,7 +46,7 @@ static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y
 
 static int get_x_position(const struct vkms_frame_info *frame_info, int limit, int x)
 {
-	if (frame_info->rotation & DRM_MODE_REFLECT_X)
+	if (frame_info->rotation & (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_270))
 		return limit - x - 1;
 	return x;
 }
@@ -119,7 +121,7 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
 	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->cpp) {
 		int x_pos = get_x_position(frame_info, limit, x);
 
-		if (frame_info->rotation & DRM_MODE_ROTATE_90)
+		if (drm_rotation_90_or_270(frame_info->rotation))
 			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1)
 				+ frame_info->cpp * y;
 
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 9e451ce97099..66263081639d 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -124,6 +124,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	drm_framebuffer_get(frame_info->fb);
 	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
 						     DRM_MODE_ROTATE_90 |
+						     DRM_MODE_ROTATE_270 |
 						     DRM_MODE_REFLECT_X |
 						     DRM_MODE_REFLECT_Y);
 
@@ -240,11 +241,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
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

