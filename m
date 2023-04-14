Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA9E6E24C8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 15:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A8E10ED58;
	Fri, 14 Apr 2023 13:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4924B10ED58
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 13:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=094L5f5WCBPZfzTO8UsZcIEKiunO/ad34q1icxwMEpM=; b=IYylu9m+TezHGIMBRqf5apGoPk
 kmyuo5DaGpT/uSb4wVakawUThuia9t6r4j2FAHTKD8O5Lsakok8kyJQa8FF8CoNbzMZirNtlljRpH
 zcmsG/NHAARx0sMhN176tLFw+yZ++pmLTMmPanMm/svPKviVV+TwCZV0eRgUbpbndzZiy1tbahajF
 8xsgDWqt8BWy2ivHjYBsTpShOUXDoU8uuH0/sgmgm0r4gWi0sSKSVtllUdRtDnxgRgRpY6ROFsS06
 oYr/sgpnz7d6G9g3PgcPv8Gz4xBSZWyaEhgIDrlltc8J/CxL4vbBHLIBMmLE/x58/MSGRR0vwmrn1
 e0L/hMMg==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pnJqm-0015Av-1I; Fri, 14 Apr 2023 15:52:28 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v2 6/7] drm/vkms: add reflect-y property
Date: Fri, 14 Apr 2023 10:51:50 -0300
Message-Id: <20230414135151.75975-7-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414135151.75975-1-mcanal@igalia.com>
References: <20230414135151.75975-1-mcanal@igalia.com>
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
index b05bd008aeab..19d1078e9d34 100644
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
index 11662afa9fe4..d08bda869a24 100644
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

