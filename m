Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB47905D1F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 22:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A9B10E915;
	Wed, 12 Jun 2024 20:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="inSFiB+S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F53B10E914;
 Wed, 12 Jun 2024 20:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718225293; x=1749761293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S7Sd5YFpCocLsvgg0Z9aYsNrmU1Vr6xLaKotacrmrCo=;
 b=inSFiB+Spor6e2P7FqJ1ItzAQHlXCCGM5R+U/O96AcJSj8Heeq6GKyHS
 0yXszMJImic409nKTuNuicnveQVXrdxlgOSE7weOYo9mCSgmY8U8EvYac
 9iav5+ASoMXUyh7d1/BkePMhm57i1X8OmI2PQa7hxgjJ0NEtKJaau7dGf
 2wwW01Ovw+FRg4uH6F7VH6rwafLfy1UWiaP34eKQ64Hb4YTilrvAhsqqr
 RfU7Ddq7NhANQ6Ty7x07+7sgmfY5YiCWvO+/Ikftfi5o5aImlYEfQ+fwb
 MuTtIJbp3hnV7SU2twhXgGmPu+CC9AMyGV9JOckewPu/Lum29AAucWRfC w==;
X-CSE-ConnectionGUID: YeslfrvkRSiR+g4VGD8IQA==
X-CSE-MsgGUID: T11ry3a7SSW5DfndczDWdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14976642"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14976642"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 13:47:40 -0700
X-CSE-ConnectionGUID: zFStCzkRQCOqpPYJ1YPc6w==
X-CSE-MsgGUID: XbbbyieQQ26PKR8vPonyUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="39863966"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Jun 2024 13:47:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Jun 2024 23:47:37 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Imre Deak <imre.deak@intel.com>
Subject: [PATCH v2 8/9] drm/i915: Update plane alignment requirements for TGL+
Date: Wed, 12 Jun 2024 23:47:11 +0300
Message-ID: <20240612204712.31404-9-ville.syrjala@linux.intel.com>
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

Currently we still use the SKL+ PLANE_SURF alignment even
for TGL+ even though the hardware no longer needs it.
Introduce a separate tgl_plane_min_alignment() and update
it to more accurately reflect the hardware requirements.

v2: Don't screw up DPT+semiplanar 2MiB alignment

Reviewed-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/skl_universal_plane.c    | 109 ++++++++++--------
 1 file changed, 61 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index d4c1db3fb9e3..a1c4778cf656 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -503,75 +503,85 @@ skl_plane_max_stride(struct intel_plane *plane,
 				max_pixels, max_bytes);
 }
 
-static unsigned int skl_plane_min_alignment(struct intel_plane *plane,
-					    const struct drm_framebuffer *fb,
-					    int color_plane)
+static u32 tgl_plane_min_alignment(struct intel_plane *plane,
+				   const struct drm_framebuffer *fb,
+				   int color_plane)
 {
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
+	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	/* PLANE_SURF GGTT -> DPT alignment */
+	int mult = intel_fb_uses_dpt(fb) ? 512 : 1;
 
 	/* AUX_DIST needs only 4K alignment */
 	if (intel_fb_is_ccs_aux_plane(fb, color_plane))
-		return 4096;
+		return mult * 4 * 1024;
 
 	if (is_semiplanar_uv_plane(fb, color_plane)) {
+		if (intel_fb_uses_dpt(fb))
+			return 512 * 4 * 1024;
+
 		/*
 		 * TODO: cross-check wrt. the bspec stride in bytes * 64 bytes
 		 * alignment for linear UV planes on all platforms.
 		 */
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
+		if (fb->modifier == DRM_FORMAT_MOD_LINEAR)
 			return 256 * 1024;
-		return 0;
+
+		return intel_tile_row_size(fb, color_plane);
+	}
+
+	switch (fb->modifier) {
+	case DRM_FORMAT_MOD_LINEAR:
+	case I915_FORMAT_MOD_X_TILED:
+	case I915_FORMAT_MOD_Y_TILED:
+	case I915_FORMAT_MOD_4_TILED:
+		/*
+		 * FIXME ADL sees GGTT/DMAR faults with async
+		 * flips unless we align to 16k at least.
+		 * Figure out what's going on here...
+		 */
+		if (IS_ALDERLAKE_P(i915) && HAS_ASYNC_FLIPS(i915))
+			return mult * 16 * 1024;
+		return mult * 4 * 1024;
 	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
 	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
 	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC:
-		return 16 * 1024;
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
+	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
+		/*
+		 * Align to at least 4x1 main surface
+		 * tiles (16K) to match 64B of AUX.
+		 */
+		return max(mult * 4 * 1024, 16 * 1024);
+	default:
+		MISSING_CASE(fb->modifier);
+		return 0;
+	}
+}
+
+static u32 skl_plane_min_alignment(struct intel_plane *plane,
+				   const struct drm_framebuffer *fb,
+				   int color_plane)
+{
+	/*
+	 * AUX_DIST needs only 4K alignment,
+	 * as does ICL UV PLANE_SURF.
+	 */
+	if (color_plane != 0)
+		return 4 * 1024;
+
+	switch (fb->modifier) {
+	case DRM_FORMAT_MOD_LINEAR:
+	case I915_FORMAT_MOD_X_TILED:
+		return 256 * 1024;
 	case I915_FORMAT_MOD_Y_TILED_CCS:
 	case I915_FORMAT_MOD_Yf_TILED_CCS:
 	case I915_FORMAT_MOD_Y_TILED:
-	case I915_FORMAT_MOD_4_TILED:
 	case I915_FORMAT_MOD_Yf_TILED:
 		return 1 * 1024 * 1024;
-	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
-	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
-	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
-		return 16 * 1024;
 	default:
 		MISSING_CASE(fb->modifier);
 		return 0;
@@ -2506,7 +2516,10 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 	else
 		plane->max_stride = skl_plane_max_stride;
 
-	plane->min_alignment = skl_plane_min_alignment;
+	if (DISPLAY_VER(dev_priv) >= 12)
+		plane->min_alignment = tgl_plane_min_alignment;
+	else
+		plane->min_alignment = skl_plane_min_alignment;
 
 	if (DISPLAY_VER(dev_priv) >= 11) {
 		plane->update_noarm = icl_plane_update_noarm;
-- 
2.44.2

