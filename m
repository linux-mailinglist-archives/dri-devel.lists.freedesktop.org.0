Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7445A6D9786
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 15:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B2610E391;
	Thu,  6 Apr 2023 13:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CA010E370
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 13:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mAXYJfVMl6MbhpO8q1jmwzjnQfk9vRmbQou0gYkg6Ds=; b=lWqmwW6fFvebc2pkw0xiqQtf2e
 a4fKK3lEOdYr5XixBX+MCyuOv2BBgPfV41HrhtXH5HeklV9GkAIP/YJ+PoC7aTqv2sw3KZ99ipVEb
 OxGbDMyFC5t4zNIV7FXS6l5+1qXhiMB+NZbnPPyKmCgd0gWxErAtoLoM2hYX0BmvUS/eo+zIL4G7i
 Zkb4Y+D92Mn+ex9sZ+PwldnEDzhtE6ISNDQuA6yTfp130gVQ1mOAr44IHGAHLFvbfiGFw7wtUWQwY
 hExJ4Pvoa/V3DoAzc+rMFoweROKHLfGkn9oM0zTwDWUqOXZ2dSheedSbXqiuXLZcwjSMD0xsFZ0pG
 S/oHWrnw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pkPFo-0084OI-El; Thu, 06 Apr 2023 15:02:16 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH 5/6] drm/vkms: add reflect-y property
Date: Thu,  6 Apr 2023 10:01:37 -0300
Message-Id: <20230406130138.70752-6-mcanal@igalia.com>
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

Currently, vkms only support the reflect-x property. Therefore, add the
reflect-y property to vkms through a software implementation of the
operation. This is possible by reverse reading the y axis during the
blending.

Now, vkms support all possible rotation values.

Tested with igt@kms_rotation_crc@primary-reflect-y and
igt@kms_rotation_crc@sprite-reflect-y [1].

[1] https://patchwork.freedesktop.org/series/116025/

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c |  7 ++++++-
 drivers/gpu/drm/vkms/vkms_plane.c    | 16 ++++------------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 25d412f555ae..0566eb8e2dee 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -92,8 +92,13 @@ static int get_y_pos(struct vkms_frame_info *frame_info, int y)
 			return -1;
 		return y + frame_info->dst.x1;
 	default:
-		return y;
+		break;
 	}
+
+	if (frame_info->rotation & DRM_MODE_REFLECT_Y)
+		return drm_rect_height(&frame_info->dst) - y - 1;
+
+	return y;
 }
 
 static bool check_limit(struct vkms_frame_info *frame_info, int pos)
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e2bd2231fe4c..3f82b5315fef 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -121,12 +121,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	frame_info->fb = fb;
 	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
 	drm_framebuffer_get(frame_info->fb);
-	frame_info->rotation = drm_rotation_simplify(new_state->rotation,
-						     DRM_MODE_ROTATE_0 |
-						     DRM_MODE_ROTATE_90 |
-						     DRM_MODE_ROTATE_180 |
-						     DRM_MODE_ROTATE_270 |
-						     DRM_MODE_REFLECT_X);
+	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_MASK |
+						     DRM_MODE_REFLECT_MASK);
 
 	drm_rect_rotate(&frame_info->dst, drm_rect_width(&frame_info->dst),
 			drm_rect_height(&frame_info->dst), frame_info->rotation);
@@ -240,12 +236,8 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	drm_plane_helper_add(&plane->base, funcs);
 
-	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
-					   DRM_MODE_ROTATE_0 |
-					   DRM_MODE_ROTATE_90 |
-					   DRM_MODE_ROTATE_180 |
-					   DRM_MODE_ROTATE_270 |
-					   DRM_MODE_REFLECT_X);
+	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0, DRM_MODE_ROTATE_MASK |
+					   DRM_MODE_REFLECT_MASK);
 
 	return plane;
 }
-- 
2.39.2

