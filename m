Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426EF8C46A0
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 20:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF2410E906;
	Mon, 13 May 2024 18:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EugyD1c6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB6E10E8FD;
 Mon, 13 May 2024 18:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715623203; x=1747159203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2yPPAi7hidpmgrX/v6bpAVQ4+gAoRiPdhi91dvRXl8E=;
 b=EugyD1c6aerF6jmW40naTzedBMHjh7E+9qAn/m4AQ2ZT3jeRCW0MxshB
 dkNBIiiy7xTd5wWb0wtWBtZ5BSkaXy0/ani8Fp2MHOvB/jCddSzmrnJz2
 wiHS8UMCjf4aEhSM1iuzIyatYFBfhcdH6fKXhjfnWLvazGaq9JT0GnocO
 dxDg9/Gl8mSKG7ZoTCKzuO5AB+fYIsTTuBixiFAK8cxXXWqBTj4jtvd9z
 XgezauJGO0AWFl+gN9w/Mqh4FP1bhmpVJWoxOyu/zsP/TV6BHyXSrl0TV
 R1CX0Q45qhjen0wvamqqDw7ZQtzdohJYoLN3AJycXxsJXCVvzWqac4mMr w==;
X-CSE-ConnectionGUID: OroVL9t5QdSzX6w7yjtc5Q==
X-CSE-MsgGUID: lHGJFHC4ROGcQi4FCag37w==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="14517968"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="14517968"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 11:00:02 -0700
X-CSE-ConnectionGUID: aHFACelrSgGy1WC4EdWG1A==
X-CSE-MsgGUID: MVyWQofbQWWpLw+8tS9FXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30395199"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 13 May 2024 11:00:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 May 2024 21:00:00 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/9] drm/i915: Split pre-skl platforms out from
 intel_surf_alignment()
Date: Mon, 13 May 2024 20:59:39 +0300
Message-ID: <20240513175942.12910-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240513175942.12910-1-ville.syrjala@linux.intel.com>
References: <20240513175942.12910-1-ville.syrjala@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Extract the necessary chunks from intel_surf_alignment()
into per-platform variants for all pre-skl primary/sprite
planes.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_plane.c   | 69 ++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_fb.c     | 17 +----
 drivers/gpu/drm/i915/display/intel_sprite.c | 28 ++++++++-
 3 files changed, 96 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index 85dbf5b950e2..0d64176c1e6f 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -762,6 +762,66 @@ i8xx_plane_max_stride(struct intel_plane *plane,
 		return 8 * 1024;
 }
 
+static unsigned int vlv_primary_min_alignment(struct intel_plane *plane,
+					      const struct drm_framebuffer *fb,
+					      int color_plane)
+{
+	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+
+	switch (fb->modifier) {
+	case I915_FORMAT_MOD_X_TILED:
+		if (HAS_ASYNC_FLIPS(i915))
+			return 256 * 1024;
+		return 4 * 1024;
+	case DRM_FORMAT_MOD_LINEAR:
+		return 128 * 1024;
+	default:
+		MISSING_CASE(fb->modifier);
+		return 0;
+	}
+}
+
+static unsigned int g4x_primary_min_alignment(struct intel_plane *plane,
+					      const struct drm_framebuffer *fb,
+					      int color_plane)
+{
+	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+
+	switch (fb->modifier) {
+	case I915_FORMAT_MOD_X_TILED:
+		if (HAS_ASYNC_FLIPS(i915))
+			return 256 * 1024;
+		return 4 * 1024;
+	case DRM_FORMAT_MOD_LINEAR:
+		return 4 * 1024;
+	default:
+		MISSING_CASE(fb->modifier);
+		return 0;
+	}
+}
+
+static unsigned int i965_plane_min_alignment(struct intel_plane *plane,
+					     const struct drm_framebuffer *fb,
+					     int color_plane)
+{
+	switch (fb->modifier) {
+	case I915_FORMAT_MOD_X_TILED:
+		return 4 * 1024;
+	case DRM_FORMAT_MOD_LINEAR:
+		return 128 * 1024;
+	default:
+		MISSING_CASE(fb->modifier);
+		return 0;
+	}
+}
+
+static unsigned int i9xx_plane_min_alignment(struct intel_plane *plane,
+					     const struct drm_framebuffer *fb,
+					     int color_plane)
+{
+	return 0;
+}
+
 static const struct drm_plane_funcs i965_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
@@ -867,7 +927,14 @@ intel_primary_plane_create(struct drm_i915_private *dev_priv, enum pipe pipe)
 			plane->max_stride = ilk_primary_max_stride;
 	}
 
-	plane->min_alignment = intel_surf_alignment;
+	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
+		plane->min_alignment = vlv_primary_min_alignment;
+	else if (DISPLAY_VER(dev_priv) >= 5 || IS_G4X(dev_priv))
+		plane->min_alignment = g4x_primary_min_alignment;
+	else if (DISPLAY_VER(dev_priv) == 4)
+		plane->min_alignment = i965_plane_min_alignment;
+	else
+		plane->min_alignment = i9xx_plane_min_alignment;
 
 	if (IS_I830(dev_priv) || IS_I845G(dev_priv)) {
 		plane->update_arm = i830_plane_update_arm;
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index c84ecae3a57c..eea93d84a16e 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -776,19 +776,6 @@ bool intel_fb_uses_dpt(const struct drm_framebuffer *fb)
 		intel_fb_modifier_uses_dpt(to_i915(fb->dev), fb->modifier);
 }
 
-static unsigned int intel_linear_alignment(const struct drm_i915_private *dev_priv)
-{
-	if (DISPLAY_VER(dev_priv) >= 9)
-		return 256 * 1024;
-	else if (IS_I965G(dev_priv) || IS_I965GM(dev_priv) ||
-		 IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
-		return 128 * 1024;
-	else if (DISPLAY_VER(dev_priv) >= 4)
-		return 4 * 1024;
-	else
-		return 0;
-}
-
 unsigned int intel_surf_alignment(struct intel_plane *plane,
 				  const struct drm_framebuffer *fb,
 				  int color_plane)
@@ -824,7 +811,7 @@ unsigned int intel_surf_alignment(struct intel_plane *plane,
 		 */
 		if (DISPLAY_VER(dev_priv) >= 12) {
 			if (fb->modifier == DRM_FORMAT_MOD_LINEAR)
-				return intel_linear_alignment(dev_priv);
+				return 256 * 1024;
 
 			return intel_tile_row_size(fb, color_plane);
 		}
@@ -836,7 +823,7 @@ unsigned int intel_surf_alignment(struct intel_plane *plane,
 
 	switch (fb->modifier) {
 	case DRM_FORMAT_MOD_LINEAR:
-		return intel_linear_alignment(dev_priv);
+		return 256 * 1024;
 	case I915_FORMAT_MOD_X_TILED:
 		if (HAS_ASYNC_FLIPS(dev_priv))
 			return 256 * 1024;
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 1727d98d1339..2b8fa59c409f 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -254,6 +254,21 @@ int vlv_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
 	return DIV_ROUND_UP(pixel_rate * num, den);
 }
 
+static unsigned int vlv_sprite_min_alignment(struct intel_plane *plane,
+					     const struct drm_framebuffer *fb,
+					     int color_plane)
+{
+	switch (fb->modifier) {
+	case I915_FORMAT_MOD_X_TILED:
+		return 4 * 1024;
+	case DRM_FORMAT_MOD_LINEAR:
+		return 128 * 1024;
+	default:
+		MISSING_CASE(fb->modifier);
+		return 0;
+	}
+}
+
 static u32 vlv_sprite_ctl_crtc(const struct intel_crtc_state *crtc_state)
 {
 	u32 sprctl = 0;
@@ -965,6 +980,13 @@ hsw_sprite_max_stride(struct intel_plane *plane,
 	return min(8192 * cpp, 16 * 1024);
 }
 
+static unsigned int g4x_sprite_min_alignment(struct intel_plane *plane,
+					     const struct drm_framebuffer *fb,
+					     int color_plane)
+{
+	return 4 * 1024;
+}
+
 static u32 g4x_sprite_ctl_crtc(const struct intel_crtc_state *crtc_state)
 {
 	u32 dvscntr = 0;
@@ -1571,6 +1593,7 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 		plane->get_hw_state = vlv_sprite_get_hw_state;
 		plane->check_plane = vlv_sprite_check;
 		plane->max_stride = i965_plane_max_stride;
+		plane->min_alignment = vlv_sprite_min_alignment;
 		plane->min_cdclk = vlv_plane_min_cdclk;
 
 		if (IS_CHERRYVIEW(dev_priv) && pipe == PIPE_B) {
@@ -1597,6 +1620,8 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 			plane->min_cdclk = ivb_sprite_min_cdclk;
 		}
 
+		plane->min_alignment = g4x_sprite_min_alignment;
+
 		formats = snb_sprite_formats;
 		num_formats = ARRAY_SIZE(snb_sprite_formats);
 
@@ -1608,6 +1633,7 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 		plane->get_hw_state = g4x_sprite_get_hw_state;
 		plane->check_plane = g4x_sprite_check;
 		plane->max_stride = g4x_sprite_max_stride;
+		plane->min_alignment = g4x_sprite_min_alignment;
 		plane->min_cdclk = g4x_sprite_min_cdclk;
 
 		if (IS_SANDYBRIDGE(dev_priv)) {
@@ -1623,8 +1649,6 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 		}
 	}
 
-	plane->min_alignment = intel_surf_alignment;
-
 	if (IS_CHERRYVIEW(dev_priv) && pipe == PIPE_B) {
 		supported_rotations =
 			DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 |
-- 
2.43.2

