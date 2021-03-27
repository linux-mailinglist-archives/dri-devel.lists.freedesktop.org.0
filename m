Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 936C634B6CA
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 12:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1486E175;
	Sat, 27 Mar 2021 11:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EA16E175
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 11:22:27 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: DON'T require each CRTC to have a unique primary plane
Date: Sat, 27 Mar 2021 11:22:14 +0000
Message-Id: <20210327112214.10252-1-paul@crapouillou.net>
MIME-Version: 1.0
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
Cc: Paul Cercueil <paul@crapouillou.net>, stable@vger.kernel.org, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ingenic-drm driver has two mutually exclusive primary planes
already; so the fact that a CRTC must have one and only one primary
plane is an invalid assumption.

Fixes: 96962e3de725 ("drm: require each CRTC to have a unique primary plane")
Cc: <stable@vger.kernel.org> # 5.11
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_mode_config.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 37b4b9f0e468..d86621c41047 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -626,9 +626,7 @@ void drm_mode_config_validate(struct drm_device *dev)
 {
 	struct drm_encoder *encoder;
 	struct drm_crtc *crtc;
-	struct drm_plane *plane;
 	u32 primary_with_crtc = 0, cursor_with_crtc = 0;
-	unsigned int num_primary = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return;
@@ -676,13 +674,4 @@ void drm_mode_config_validate(struct drm_device *dev)
 			cursor_with_crtc |= drm_plane_mask(crtc->cursor);
 		}
 	}
-
-	drm_for_each_plane(plane, dev) {
-		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
-			num_primary++;
-	}
-
-	WARN(num_primary != dev->mode_config.num_crtc,
-	     "Must have as many primary planes as there are CRTCs, but have %u primary planes and %u CRTCs",
-	     num_primary, dev->mode_config.num_crtc);
 }
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
