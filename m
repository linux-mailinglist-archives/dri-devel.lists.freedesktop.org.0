Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA76B905D19
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 22:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9985A10E90E;
	Wed, 12 Jun 2024 20:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bI13r8W4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206AD10E908;
 Wed, 12 Jun 2024 20:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718225257; x=1749761257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U5YV44t1bMCu01b9NYmorfCyyJGbKhdaGtpGvXsXmYU=;
 b=bI13r8W4AD4Pip+givCCXaF7VMa9XJELcR8poQBs4IEY59wR+iwW9lC8
 JtRDn2m03P5KHShkfEnBil42Qyo3F8XBn8fzBDdJGEKSUFDXC8s1m4yWN
 zvmXZ6I5VLdqQaui2VORtlzmjqiDHYDhj6OUcA1HY9wyfB3Vn1erLiRu6
 wzcX8KPt1jtLEHfEsunePnDX8P0b2YfdeeKZVRDx1IHTHFi4N0tlqJLkX
 IDJYQXjYrYsNkYUKd0yEbfePyw0th4MOvah/3JycifdBYKrPDllTG9tIP
 flkDj1quKg+n6Rl2Swwa8tO7yAZIBStlwPR0JJdmRfcZ2FH5n0vHsjfPj Q==;
X-CSE-ConnectionGUID: 87Eh4HXbRiij6aWXk8OaaQ==
X-CSE-MsgGUID: 1iEt7WHgShSWoXoVE0WX7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14976606"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14976606"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 13:47:34 -0700
X-CSE-ConnectionGUID: FXUtVTK7SY68qZzNkTKV9A==
X-CSE-MsgGUID: wAaXwUnhRdKayY0qeTfXGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="39863960"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Jun 2024 13:47:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Jun 2024 23:47:31 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Imre Deak <imre.deak@intel.com>
Subject: [PATCH v2 6/9] drm/i915: Split pre-skl platforms out from
 intel_surf_alignment()
Date: Wed, 12 Jun 2024 23:47:09 +0300
Message-ID: <20240612204712.31404-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240612204712.31404-1-ville.syrjala@linux.intel.com>
References: <20240612204712.31404-1-ville.syrjala@linux.intel.com>
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

Reviewed-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_plane.c   | 69 ++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_fb.c     | 17 +----
 drivers/gpu/drm/i915/display/intel_sprite.c | 28 ++++++++-
 3 files changed, 96 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index 53b18efaa88c..9447f7229b60 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -764,6 +764,66 @@ i8xx_plane_max_stride(struct intel_plane *plane,
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
@@ -869,7 +929,14 @@ intel_primary_plane_create(struct drm_i915_private *dev_priv, enum pipe pipe)
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
index b5d31ccf013a..7f6a3de07cad 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -777,19 +777,6 @@ bool intel_fb_uses_dpt(const struct drm_framebuffer *fb)
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
@@ -825,7 +812,7 @@ unsigned int intel_surf_alignment(struct intel_plane *plane,
 		 */
 		if (DISPLAY_VER(dev_priv) >= 12) {
 			if (fb->modifier == DRM_FORMAT_MOD_LINEAR)
-				return intel_linear_alignment(dev_priv);
+				return 256 * 1024;
 
 			return intel_tile_row_size(fb, color_plane);
 		}
@@ -837,7 +824,7 @@ unsigned int intel_surf_alignment(struct intel_plane *plane,
 
 	switch (fb->modifier) {
 	case DRM_FORMAT_MOD_LINEAR:
-		return intel_linear_alignment(dev_priv);
+		return 256 * 1024;
 	case I915_FORMAT_MOD_X_TILED:
 		if (HAS_ASYNC_FLIPS(dev_priv))
 			return 256 * 1024;
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 6f9ae83b095c..f8cceb3e5d8e 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -253,6 +253,21 @@ int vlv_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
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
@@ -964,6 +979,13 @@ hsw_sprite_max_stride(struct intel_plane *plane,
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
@@ -1570,6 +1592,7 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 		plane->get_hw_state = vlv_sprite_get_hw_state;
 		plane->check_plane = vlv_sprite_check;
 		plane->max_stride = i965_plane_max_stride;
+		plane->min_alignment = vlv_sprite_min_alignment;
 		plane->min_cdclk = vlv_plane_min_cdclk;
 
 		if (IS_CHERRYVIEW(dev_priv) && pipe == PIPE_B) {
@@ -1596,6 +1619,8 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 			plane->min_cdclk = ivb_sprite_min_cdclk;
 		}
 
+		plane->min_alignment = g4x_sprite_min_alignment;
+
 		formats = snb_sprite_formats;
 		num_formats = ARRAY_SIZE(snb_sprite_formats);
 
@@ -1607,6 +1632,7 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 		plane->get_hw_state = g4x_sprite_get_hw_state;
 		plane->check_plane = g4x_sprite_check;
 		plane->max_stride = g4x_sprite_max_stride;
+		plane->min_alignment = g4x_sprite_min_alignment;
 		plane->min_cdclk = g4x_sprite_min_cdclk;
 
 		if (IS_SANDYBRIDGE(dev_priv)) {
@@ -1622,8 +1648,6 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 		}
 	}
 
-	plane->min_alignment = intel_surf_alignment;
-
 	if (IS_CHERRYVIEW(dev_priv) && pipe == PIPE_B) {
 		supported_rotations =
 			DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 |
-- 
2.44.2

