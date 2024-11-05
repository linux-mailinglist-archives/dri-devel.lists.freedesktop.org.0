Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C994B9BCA93
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 11:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DE510E564;
	Tue,  5 Nov 2024 10:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JnS2uiaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299E710E561;
 Tue,  5 Nov 2024 10:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730802954; x=1762338954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K561lNM8d1Ta6+TAW7FBmInhy80OTedU+3RWLOc5eVA=;
 b=JnS2uiaDUdSlDSk8FZ1OtInbg9nin+De5Pa1T35WBmVV877Meg1XRq5l
 QbNyhL9c+80bbDFj1zEBJI87Ee5kefQLnfFUgOpTXgUBBKmE65FBwqFv0
 mcJ3tFLyjhgR7XfnddCtFwyo7MXP4IOPz1uDz4vX7O2G2zHZwm97Wm7Si
 ZFsGzWRASWhCHcbAtst2QBhunFdOun9lyUyUoEbFbi23EN7H79ILSfKDI
 6TlBBt+LQ1cEPiUmZc/MYGFHusWdE3mASvFJ5fouvu5rfXfyNc0pDhtuZ
 3KXkxZbZRPf9pNBQoneZthQViM6VhOFwkyd2DSJhKDubKPC5BT31azTPn A==;
X-CSE-ConnectionGUID: lIEgieMOSJaHuGS9ySql1w==
X-CSE-MsgGUID: nT/Fzo99QdGvKBc+KMs30w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34230852"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34230852"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 02:35:54 -0800
X-CSE-ConnectionGUID: CP1RPsdXQyW9BJixwGSw+A==
X-CSE-MsgGUID: FSf/r3PWRlGDnsl5jEme0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83485571"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa006.fm.intel.com with ESMTP; 05 Nov 2024 02:35:52 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 3/4] drm/i915/display: Add async_flip flag in get_modifiers
Date: Tue,  5 Nov 2024 15:56:07 +0530
Message-Id: <20241105102608.3912133-4-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241105102608.3912133-1-arun.r.murthy@intel.com>
References: <20241105102608.3912133-1-arun.r.murthy@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

get_modifiers will get the list of modifiers supported by the plane. Add
a flag async_flip to fetch only the async_flip supported modifiers.
Also expose function to get the number of modifiers supported by the
platform.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_plane.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_cursor.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_fb.c       | 40 +++++++++++++++----
 drivers/gpu/drm/i915/display/intel_fb.h       |  4 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |  2 +-
 .../drm/i915/display/skl_universal_plane.c    |  3 +-
 6 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index 17a1e3801a85..08d8bb6c770e 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -973,7 +973,7 @@ intel_primary_plane_create(struct drm_i915_private *dev_priv, enum pipe pipe)
 		plane->disable_flip_done = ilk_primary_disable_flip_done;
 	}
 
-	modifiers = intel_fb_plane_get_modifiers(dev_priv, INTEL_PLANE_CAP_TILING_X);
+	modifiers = intel_fb_plane_get_modifiers(dev_priv, INTEL_PLANE_CAP_TILING_X, false);
 
 	if (DISPLAY_VER(dev_priv) >= 5 || IS_G4X(dev_priv))
 		ret = drm_universal_plane_init(&dev_priv->drm, &plane->base,
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 9ba77970dab7..a08f445fbcc7 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -1026,7 +1026,7 @@ intel_cursor_plane_create(struct drm_i915_private *dev_priv,
 	if (IS_I845G(dev_priv) || IS_I865G(dev_priv) || HAS_CUR_FBC(dev_priv))
 		cursor->cursor.size = ~0;
 
-	modifiers = intel_fb_plane_get_modifiers(dev_priv, INTEL_PLANE_CAP_NONE);
+	modifiers = intel_fb_plane_get_modifiers(dev_priv, INTEL_PLANE_CAP_NONE, false);
 
 	ret = drm_universal_plane_init(&dev_priv->drm, &cursor->base,
 				       0, &intel_cursor_plane_funcs,
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index f05e0c444618..fba1b6fb38ad 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -554,7 +554,8 @@ static bool check_modifier_display_ver_range(const struct intel_modifier_desc *m
 
 static bool plane_has_modifier(struct drm_i915_private *i915,
 			       u8 plane_caps,
-			       const struct intel_modifier_desc *md)
+			       const struct intel_modifier_desc *md,
+			       bool is_async_flip)
 {
 	if (!IS_DISPLAY_VER(i915, md->display_ver.from, md->display_ver.until))
 		return false;
@@ -562,6 +563,9 @@ static bool plane_has_modifier(struct drm_i915_private *i915,
 	if (!plane_caps_contain_all(plane_caps, md->plane_caps))
 		return false;
 
+	if (!(is_async_flip && md->async_flip))
+		return false;
+
 	/*
 	 * Separate AuxCCS and Flat CCS modifiers to be run only on platforms
 	 * where supported.
@@ -581,26 +585,48 @@ static bool plane_has_modifier(struct drm_i915_private *i915,
 	return true;
 }
 
+/**
+ * intel_fb_plane_get_modifiers_count - return the number of supported modifiers for a
+ *					given platform and plane capabilities
+ * @i915: i915 device instance
+ * @plane_caps: capabilities for the plane the modifiers are queried for
+ * @async_flip: flag to convey modifiers that support async flip
+ *
+ * Returns:
+ * Returns the number for modifiers supported by the @i915 platform and @plane_caps
+ * with/without @async_flip.
+ */
+int intel_fb_plane_get_modifiers_count(struct drm_i915_private *i915,
+				       u8 plane_caps, bool async_flip)
+{
+	int count = 1;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(intel_modifiers); i++) {
+		if (plane_has_modifier(i915, plane_caps, &intel_modifiers[i], async_flip))
+			count++;
+	}
+	return count;
+}
+
 /**
  * intel_fb_plane_get_modifiers: Get the modifiers for the given platform and plane capabilities
  * @i915: i915 device instance
  * @plane_caps: capabilities for the plane the modifiers are queried for
+ * @async_flip: flag to convey modifiers that support async flip
  *
  * Returns:
  * Returns the list of modifiers allowed by the @i915 platform and @plane_caps.
  * The caller must free the returned buffer.
  */
 u64 *intel_fb_plane_get_modifiers(struct drm_i915_private *i915,
-				  u8 plane_caps)
+				  u8 plane_caps, bool async_flip)
 {
 	u64 *list, *p;
 	int count = 1;		/* +1 for invalid modifier terminator */
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(intel_modifiers); i++) {
-		if (plane_has_modifier(i915, plane_caps, &intel_modifiers[i]))
-			count++;
-	}
+	count = intel_fb_plane_get_modifiers_count(i915, plane_caps, async_flip);
 
 	list = kmalloc_array(count, sizeof(*list), GFP_KERNEL);
 	if (drm_WARN_ON(&i915->drm, !list))
@@ -608,7 +634,7 @@ u64 *intel_fb_plane_get_modifiers(struct drm_i915_private *i915,
 
 	p = list;
 	for (i = 0; i < ARRAY_SIZE(intel_modifiers); i++) {
-		if (plane_has_modifier(i915, plane_caps, &intel_modifiers[i]))
+		if (plane_has_modifier(i915, plane_caps, &intel_modifiers[i], async_flip))
 			*p++ = intel_modifiers[i].modifier;
 	}
 	*p++ = DRM_FORMAT_MOD_INVALID;
diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
index d78993e5eb62..4ae7cc75fe77 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.h
+++ b/drivers/gpu/drm/i915/display/intel_fb.h
@@ -41,8 +41,10 @@ bool intel_fb_is_tile4_modifier(u64 modifier);
 bool intel_fb_is_ccs_aux_plane(const struct drm_framebuffer *fb, int color_plane);
 int intel_fb_rc_ccs_cc_plane(const struct drm_framebuffer *fb);
 
+int intel_fb_plane_get_modifiers_count(struct drm_i915_private *i915,
+				       u8 plane_caps, bool async_flip);
 u64 *intel_fb_plane_get_modifiers(struct drm_i915_private *i915,
-				  u8 plane_caps);
+				  u8 plane_caps, bool async_flip);
 bool intel_fb_plane_supports_modifier(struct intel_plane *plane, u64 modifier);
 
 const struct drm_format_info *
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index e6fadcef58e0..d1c5a3a3f13e 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -1685,7 +1685,7 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 	plane->id = PLANE_SPRITE0 + sprite;
 	plane->frontbuffer_bit = INTEL_FRONTBUFFER(pipe, plane->id);
 
-	modifiers = intel_fb_plane_get_modifiers(dev_priv, INTEL_PLANE_CAP_TILING_X);
+	modifiers = intel_fb_plane_get_modifiers(dev_priv, INTEL_PLANE_CAP_TILING_X, false);
 
 	ret = drm_universal_plane_init(display->drm, &plane->base,
 				       0, plane_funcs,
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 038ca2ec5d7a..54cf2c9374cb 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2673,7 +2673,8 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 		plane_type = DRM_PLANE_TYPE_OVERLAY;
 
 	modifiers = intel_fb_plane_get_modifiers(dev_priv,
-						 skl_get_plane_caps(dev_priv, pipe, plane_id));
+						 skl_get_plane_caps(dev_priv, pipe, plane_id),
+						 false);
 
 	ret = drm_universal_plane_init(&dev_priv->drm, &plane->base,
 				       0, plane_funcs,
-- 
2.25.1

