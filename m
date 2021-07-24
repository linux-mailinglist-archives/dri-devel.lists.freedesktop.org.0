Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B23F13D43CF
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 02:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0D46FD41;
	Sat, 24 Jul 2021 00:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70FD6FD21;
 Sat, 24 Jul 2021 00:11:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="191563456"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="191563456"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="434270010"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 14/30] drm/i915/display: remove explicit CNL handling from
 skl_universal_plane.c
Date: Fri, 23 Jul 2021 17:10:58 -0700
Message-Id: <20210724001114.249295-15-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724001114.249295-1-lucas.demarchi@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Jose Souza <jose.souza@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only real platform with DISPLAY_VER == 10 is GLK. We don't need to
handle CNL explicitly in skl_universal_plane.c.

Remove code and rename functions/macros accordingly to use ICL prefix.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 3ad04bf2a0fd..0f40f8b07724 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -835,7 +835,7 @@ static u32 skl_plane_ctl_rotate(unsigned int rotate)
 	return 0;
 }
 
-static u32 cnl_plane_ctl_flip(unsigned int reflect)
+static u32 icl_plane_ctl_flip(unsigned int reflect)
 {
 	switch (reflect) {
 	case 0:
@@ -917,8 +917,8 @@ static u32 skl_plane_ctl(const struct intel_crtc_state *crtc_state,
 	plane_ctl |= skl_plane_ctl_tiling(fb->modifier);
 	plane_ctl |= skl_plane_ctl_rotate(rotation & DRM_MODE_ROTATE_MASK);
 
-	if (DISPLAY_VER(dev_priv) >= 11 || IS_CANNONLAKE(dev_priv))
-		plane_ctl |= cnl_plane_ctl_flip(rotation &
+	if (DISPLAY_VER(dev_priv) >= 11)
+		plane_ctl |= icl_plane_ctl_flip(rotation &
 						DRM_MODE_REFLECT_MASK);
 
 	if (key->flags & I915_SET_COLORKEY_DESTINATION)
@@ -1828,7 +1828,7 @@ static bool skl_plane_has_ccs(struct drm_i915_private *dev_priv,
 	if (plane_id == PLANE_CURSOR)
 		return false;
 
-	if (DISPLAY_VER(dev_priv) >= 11 || IS_CANNONLAKE(dev_priv))
+	if (DISPLAY_VER(dev_priv) >= 11)
 		return true;
 
 	if (IS_GEMINILAKE(dev_priv))
@@ -2144,7 +2144,7 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 			DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_90 |
 			DRM_MODE_ROTATE_180 | DRM_MODE_ROTATE_270;
 
-	if (DISPLAY_VER(dev_priv) >= 11 || IS_CANNONLAKE(dev_priv))
+	if (DISPLAY_VER(dev_priv) >= 11)
 		supported_rotations |= DRM_MODE_REFLECT_X;
 
 	drm_plane_create_rotation_property(&plane->base,
@@ -2174,7 +2174,7 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 	if (DISPLAY_VER(dev_priv) >= 12)
 		drm_plane_enable_fb_damage_clips(&plane->base);
 
-	if (DISPLAY_VER(dev_priv) >= 11 || IS_CANNONLAKE(dev_priv))
+	if (DISPLAY_VER(dev_priv) >= 11)
 		drm_plane_create_scaling_filter_property(&plane->base,
 						BIT(DRM_SCALING_FILTER_DEFAULT) |
 						BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
@@ -2295,7 +2295,7 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 		break;
 	}
 
-	if ((DISPLAY_VER(dev_priv) >= 11 || IS_CANNONLAKE(dev_priv)) && val & PLANE_CTL_FLIP_HORIZONTAL)
+	if (DISPLAY_VER(dev_priv) >= 11 && val & PLANE_CTL_FLIP_HORIZONTAL)
 		plane_config->rotation |= DRM_MODE_REFLECT_X;
 
 	/* 90/270 degree rotation would require extra work */
-- 
2.31.1

