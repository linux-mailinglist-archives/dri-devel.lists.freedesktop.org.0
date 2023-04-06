Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CA56D9785
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 15:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D931E10E370;
	Thu,  6 Apr 2023 13:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46A210E327
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aYSMUZld+qVDdtJ5aeTDhvwDtFXn4lMr2FsgVc381v0=; b=ooHXS0E+Yhid2Uh+qty+jGnNij
 plwXZo1HfuvtdHcpj/Bwgoax96iJDgWHbHTqY02oK1qUptmyEgVdqGhc31Zbukzeq4vcQwvZ4Equ+
 q2iw3VHEZlKA1prxS6/g2txw74zHb405nTZ0hP5J7Ub8tdCq8PY2F4wdM1PIcTUHljom4xjXHd1a+
 G2ydWdtmgDgPrxRzKu9j9lV0FJ18EB7KG8hDzeR5cuJV6F9Pr55PjZ6DdjLEoNoe5qBqbSN8iFR+5
 8/calvO0Yy56R3SlDMjOUSsQGMph5FrZyUJRkMDSyoTZmvazowcQFyYmYddVnB+hYfQiiVfJdp0dZ
 QnYGZCxg==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pkPFl-0084OI-75; Thu, 06 Apr 2023 15:02:13 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH 4/6] drm/vkms: add reflect-x property
Date: Thu,  6 Apr 2023 10:01:36 -0300
Message-Id: <20230406130138.70752-5-mcanal@igalia.com>
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

Currently, vkms doesn't support any reflection property. Therefore, add
the reflect-x property to vkms through a software implementation of the
operation. This is possible by reverse reading the x axis during the
blending.

Tested with igt@kms_rotation_crc@primary-reflect-x and
igt@kms_rotation_crc@sprite-reflect-x [1].

[1] https://patchwork.freedesktop.org/series/116025/

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 2 +-
 drivers/gpu/drm/vkms/vkms_plane.c   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 07976194882b..72a57639e1e8 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -45,7 +45,7 @@ static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y
 
 static int get_x_position(const struct vkms_frame_info *frame_info, int x_limit, int x)
 {
-	if (frame_info->rotation & (DRM_MODE_ROTATE_180 | DRM_MODE_ROTATE_270))
+	if (frame_info->rotation & (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_180 | DRM_MODE_ROTATE_270))
 		return x_limit - x - 1;
 	return x;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index abaacad3bef2..e2bd2231fe4c 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -125,7 +125,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 						     DRM_MODE_ROTATE_0 |
 						     DRM_MODE_ROTATE_90 |
 						     DRM_MODE_ROTATE_180 |
-						     DRM_MODE_ROTATE_270);
+						     DRM_MODE_ROTATE_270 |
+						     DRM_MODE_REFLECT_X);
 
 	drm_rect_rotate(&frame_info->dst, drm_rect_width(&frame_info->dst),
 			drm_rect_height(&frame_info->dst), frame_info->rotation);
@@ -243,7 +244,8 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 					   DRM_MODE_ROTATE_0 |
 					   DRM_MODE_ROTATE_90 |
 					   DRM_MODE_ROTATE_180 |
-					   DRM_MODE_ROTATE_270);
+					   DRM_MODE_ROTATE_270 |
+					   DRM_MODE_REFLECT_X);
 
 	return plane;
 }
-- 
2.39.2

