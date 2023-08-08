Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37767739C3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 12:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A359E10E0F5;
	Tue,  8 Aug 2023 10:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C9410E0F5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 10:44:10 +0000 (UTC)
Received: from strictly.printclub (unknown [5.151.124.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BF3DB6607207;
 Tue,  8 Aug 2023 11:44:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691491448;
 bh=85vuuRF0tMoEaLhW9I6v3ofumqZOtQ5z2vb4Z7G70ZM=;
 h=From:To:Cc:Subject:Date:From;
 b=DuCREdww2HMkOcLK/te3ska11xe7qdyM48ex64O+vvAXaScULhuPI2ZxLU1nGISyP
 PWclZTevzR5M/pi9ZSx3c+ZhPfsi6sc7+VPLNW7NjHPhPyhZcj/SEo4w0QQe7Qee6x
 p98/mFMhJCpe4oTX6Rm04R2zuEtneMpPssYg2ECkftdRBMoD3RaLa6pvTI/ib7zo7a
 blV9aS7IJvHKBCkOAfQHdgAdH7J3MFoihfrnpeXyKczwBQbuxV8R48AZOqGSRIUWJr
 WQY3XzFZSPWN5z0eR37enmt8dEQQgFb9XTkoiP7ZfoFoIvzHH6lbkif/gZHa8jlFxv
 dsfE5edhFAjLg==
From: Daniel Stone <daniels@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/rockchip: Don't spam logs in atomic check
Date: Tue,  8 Aug 2023 11:44:05 +0100
Message-ID: <20230808104405.522493-1-daniels@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
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
Cc: linux-rockchip@lists.infradead.org, hjc@rock-chips.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Userspace should not be able to trigger DRM_ERROR messages to spam the
logs; especially not through atomic commit parameters which are
completely legitimate for userspace to attempt.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Fixes: 7707f7227f09 ("drm/rockchip: Add support for afbc")
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 86fd9f51c692..14320bc73e5b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -832,12 +832,12 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
 	 * need align with 2 pixel.
 	 */
 	if (fb->format->is_yuv && ((new_plane_state->src.x1 >> 16) % 2)) {
-		DRM_ERROR("Invalid Source: Yuv format not support odd xpos\n");
+		DRM_DEBUG_KMS("Invalid Source: Yuv format not support odd xpos\n");
 		return -EINVAL;
 	}
 
 	if (fb->format->is_yuv && new_plane_state->rotation & DRM_MODE_REFLECT_Y) {
-		DRM_ERROR("Invalid Source: Yuv format does not support this rotation\n");
+		DRM_DEBUG_KMS("Invalid Source: Yuv format does not support this rotation\n");
 		return -EINVAL;
 	}
 
@@ -845,7 +845,7 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
 		struct vop *vop = to_vop(crtc);
 
 		if (!vop->data->afbc) {
-			DRM_ERROR("vop does not support AFBC\n");
+			DRM_DEBUG_KMS("vop does not support AFBC\n");
 			return -EINVAL;
 		}
 
@@ -854,15 +854,16 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
 			return ret;
 
 		if (new_plane_state->src.x1 || new_plane_state->src.y1) {
-			DRM_ERROR("AFBC does not support offset display, xpos=%d, ypos=%d, offset=%d\n",
-				  new_plane_state->src.x1,
-				  new_plane_state->src.y1, fb->offsets[0]);
+			DRM_DEBUG_KMS("AFBC does not support offset display, " \
+				      "xpos=%d, ypos=%d, offset=%d\n",
+				      new_plane_state->src.x1, new_plane_state->src.y1,
+				      fb->offsets[0]);
 			return -EINVAL;
 		}
 
 		if (new_plane_state->rotation && new_plane_state->rotation != DRM_MODE_ROTATE_0) {
-			DRM_ERROR("No rotation support in AFBC, rotation=%d\n",
-				  new_plane_state->rotation);
+			DRM_DEBUG_KMS("No rotation support in AFBC, rotation=%d\n",
+				      new_plane_state->rotation);
 			return -EINVAL;
 		}
 	}
-- 
2.41.0

