Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C65E905D1C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 22:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68B610E908;
	Wed, 12 Jun 2024 20:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8CjNz5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F023E10E908;
 Wed, 12 Jun 2024 20:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718225288; x=1749761288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/pKd89+ozql4v/W1n5kfMCtH8BRinVKi9rNCEihGLMU=;
 b=l8CjNz5IKmJpsS+5HCdMQSBf+FcWaJOdEOQjFO7X4Xru6GIuO+7V/upM
 6gqiUp5Hc+UWxadQ4wPQbSwtsX8wFhbFW4Q6y5p+riYcu9IJFFXicZoAu
 hPsiUMp8PUXY+/d1XDbyjhLx7D5yKrxieduyWl7wLVOBQQNuZSVFY/hP6
 Bw+ZNsqPn/Z3lEyFWSNNz2seOrSOsb6DI9C6l4RCsz1FreAoVNpfuwdCm
 6fjDbdG5jNNshve27IByUskqYFSbiehNqHBm6IgcGB0dU33QoKLfszUzn
 795GZqKrhrxfiIkEhQjzdaI0Z8eGm2SgogFUxx+by2CE4IPhPUCUB24CX Q==;
X-CSE-ConnectionGUID: LHBMmYJ0RxGZZvAdmE3YSg==
X-CSE-MsgGUID: Bj6qkX7zQE2KuvPEfTsevg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14976627"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14976627"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 13:47:37 -0700
X-CSE-ConnectionGUID: CeC3RZfjRFe2Bj1iJdWpJQ==
X-CSE-MsgGUID: ZFyrwhJnRXi9lPAZ/2TP4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="39863963"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Jun 2024 13:47:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Jun 2024 23:47:34 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Imre Deak <imre.deak@intel.com>
Subject: [PATCH v2 7/9] drm/i915: Move intel_surf_alignment() into
 skl_univerals_plane.c
Date: Wed, 12 Jun 2024 23:47:10 +0300
Message-ID: <20240612204712.31404-8-ville.syrjala@linux.intel.com>
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

Now that all pre-skl platforms have their own .min_alignment()
functions the remainder of intel_surf_alignment() can be hoisted
into skl_univerals_plane.c (and renamed appropriately).

Reviewed-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c       | 77 +------------------
 drivers/gpu/drm/i915/display/intel_fb.h       |  4 +-
 .../drm/i915/display/skl_universal_plane.c    | 77 ++++++++++++++++++-
 3 files changed, 78 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 7f6a3de07cad..a11c1cf6f548 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -585,7 +585,7 @@ static bool is_gen12_ccs_cc_plane(const struct drm_framebuffer *fb, int color_pl
 	return intel_fb_rc_ccs_cc_plane(fb) == color_plane;
 }
 
-static bool is_semiplanar_uv_plane(const struct drm_framebuffer *fb, int color_plane)
+bool is_semiplanar_uv_plane(const struct drm_framebuffer *fb, int color_plane)
 {
 	return intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier) &&
 		color_plane == 1;
@@ -777,81 +777,6 @@ bool intel_fb_uses_dpt(const struct drm_framebuffer *fb)
 		intel_fb_modifier_uses_dpt(to_i915(fb->dev), fb->modifier);
 }
 
-unsigned int intel_surf_alignment(struct intel_plane *plane,
-				  const struct drm_framebuffer *fb,
-				  int color_plane)
-{
-	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
-
-	if (intel_fb_uses_dpt(fb)) {
-		/* AUX_DIST needs only 4K alignment */
-		if (intel_fb_is_ccs_aux_plane(fb, color_plane))
-			return 512 * 4096;
-
-		/*
-		 * FIXME ADL sees GGTT/DMAR faults with async
-		 * flips unless we align to 16k at least.
-		 * Figure out what's going on here...
-		 */
-		if (IS_ALDERLAKE_P(dev_priv) &&
-		    !intel_fb_is_ccs_modifier(fb->modifier) &&
-		    HAS_ASYNC_FLIPS(dev_priv))
-			return 512 * 16 * 1024;
-
-		return 512 * 4096;
-	}
-
-	/* AUX_DIST needs only 4K alignment */
-	if (intel_fb_is_ccs_aux_plane(fb, color_plane))
-		return 4096;
-
-	if (is_semiplanar_uv_plane(fb, color_plane)) {
-		/*
-		 * TODO: cross-check wrt. the bspec stride in bytes * 64 bytes
-		 * alignment for linear UV planes on all platforms.
-		 */
-		if (DISPLAY_VER(dev_priv) >= 12) {
-			if (fb->modifier == DRM_FORMAT_MOD_LINEAR)
-				return 256 * 1024;
-
-			return intel_tile_row_size(fb, color_plane);
-		}
-
-		return 4096;
-	}
-
-	drm_WARN_ON(&dev_priv->drm, color_plane != 0);
-
-	switch (fb->modifier) {
-	case DRM_FORMAT_MOD_LINEAR:
-		return 256 * 1024;
-	case I915_FORMAT_MOD_X_TILED:
-		if (HAS_ASYNC_FLIPS(dev_priv))
-			return 256 * 1024;
-		return 0;
-	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
-	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
-	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
-	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
-	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
-	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC:
-		return 16 * 1024;
-	case I915_FORMAT_MOD_Y_TILED_CCS:
-	case I915_FORMAT_MOD_Yf_TILED_CCS:
-	case I915_FORMAT_MOD_Y_TILED:
-	case I915_FORMAT_MOD_4_TILED:
-	case I915_FORMAT_MOD_Yf_TILED:
-		return 1 * 1024 * 1024;
-	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
-	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
-	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
-		return 16 * 1024;
-	default:
-		MISSING_CASE(fb->modifier);
-		return 0;
-	}
-}
-
 void intel_fb_plane_get_subsampling(int *hsub, int *vsub,
 				    const struct drm_framebuffer *fb,
 				    int color_plane)
diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
index 16ebb573643f..1b1fef2dc39a 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.h
+++ b/drivers/gpu/drm/i915/display/intel_fb.h
@@ -34,6 +34,7 @@ bool intel_fb_is_ccs_modifier(u64 modifier);
 bool intel_fb_is_rc_ccs_cc_modifier(u64 modifier);
 bool intel_fb_is_mc_ccs_modifier(u64 modifier);
 
+bool is_semiplanar_uv_plane(const struct drm_framebuffer *fb, int color_plane);
 bool intel_fb_is_ccs_aux_plane(const struct drm_framebuffer *fb, int color_plane);
 int intel_fb_rc_ccs_cc_plane(const struct drm_framebuffer *fb);
 
@@ -60,9 +61,6 @@ unsigned int intel_tile_height(const struct drm_framebuffer *fb, int color_plane
 unsigned int intel_tile_row_size(const struct drm_framebuffer *fb, int color_plane);
 unsigned int intel_fb_align_height(const struct drm_framebuffer *fb,
 				   int color_plane, unsigned int height);
-unsigned int intel_surf_alignment(struct intel_plane *plane,
-				  const struct drm_framebuffer *fb,
-				  int color_plane);
 
 void intel_fb_plane_get_subsampling(int *hsub, int *vsub,
 				    const struct drm_framebuffer *fb,
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 7e4417459c41..d4c1db3fb9e3 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -503,6 +503,81 @@ skl_plane_max_stride(struct intel_plane *plane,
 				max_pixels, max_bytes);
 }
 
+static unsigned int skl_plane_min_alignment(struct intel_plane *plane,
+					    const struct drm_framebuffer *fb,
+					    int color_plane)
+{
+	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
+
+	if (intel_fb_uses_dpt(fb)) {
+		/* AUX_DIST needs only 4K alignment */
+		if (intel_fb_is_ccs_aux_plane(fb, color_plane))
+			return 512 * 4096;
+
+		/*
+		 * FIXME ADL sees GGTT/DMAR faults with async
+		 * flips unless we align to 16k at least.
+		 * Figure out what's going on here...
+		 */
+		if (IS_ALDERLAKE_P(dev_priv) &&
+		    !intel_fb_is_ccs_modifier(fb->modifier) &&
+		    HAS_ASYNC_FLIPS(dev_priv))
+			return 512 * 16 * 1024;
+
+		return 512 * 4096;
+	}
+
+	/* AUX_DIST needs only 4K alignment */
+	if (intel_fb_is_ccs_aux_plane(fb, color_plane))
+		return 4096;
+
+	if (is_semiplanar_uv_plane(fb, color_plane)) {
+		/*
+		 * TODO: cross-check wrt. the bspec stride in bytes * 64 bytes
+		 * alignment for linear UV planes on all platforms.
+		 */
+		if (DISPLAY_VER(dev_priv) >= 12) {
+			if (fb->modifier == DRM_FORMAT_MOD_LINEAR)
+				return 256 * 1024;
+
+			return intel_tile_row_size(fb, color_plane);
+		}
+
+		return 4096;
+	}
+
+	drm_WARN_ON(&dev_priv->drm, color_plane != 0);
+
+	switch (fb->modifier) {
+	case DRM_FORMAT_MOD_LINEAR:
+		return 256 * 1024;
+	case I915_FORMAT_MOD_X_TILED:
+		if (HAS_ASYNC_FLIPS(dev_priv))
+			return 256 * 1024;
+		return 0;
+	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
+	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
+	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
+	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
+	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC:
+		return 16 * 1024;
+	case I915_FORMAT_MOD_Y_TILED_CCS:
+	case I915_FORMAT_MOD_Yf_TILED_CCS:
+	case I915_FORMAT_MOD_Y_TILED:
+	case I915_FORMAT_MOD_4_TILED:
+	case I915_FORMAT_MOD_Yf_TILED:
+		return 1 * 1024 * 1024;
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
+	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
+		return 16 * 1024;
+	default:
+		MISSING_CASE(fb->modifier);
+		return 0;
+	}
+}
+
 /* Preoffset values for YUV to RGB Conversion */
 #define PREOFF_YUV_TO_RGB_HI		0x1800
 #define PREOFF_YUV_TO_RGB_ME		0x0000
@@ -2431,7 +2506,7 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 	else
 		plane->max_stride = skl_plane_max_stride;
 
-	plane->min_alignment = intel_surf_alignment;
+	plane->min_alignment = skl_plane_min_alignment;
 
 	if (DISPLAY_VER(dev_priv) >= 11) {
 		plane->update_noarm = icl_plane_update_noarm;
-- 
2.44.2

