Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EDB8C46A4
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 20:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D7410E913;
	Mon, 13 May 2024 18:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DbHxS2kF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019E610E900;
 Mon, 13 May 2024 18:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715623209; x=1747159209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jISLBm69kOGmtjQzO/GWgJ0IBMaPjfhqAfwIobbx4NY=;
 b=DbHxS2kFhEa/5GzFYd8H+XBaD3cXvK/FHtHEu1W3XzH6mI9TusEkBE2m
 eBE2/maJdQXGlFdUMY3QlkoSMMMkt09hg/E1uHp9HNiySZrXXnJvwti9i
 Wzcv2VTdi4t+vdIiOGNv/C3TI3cNPphsXV1nt6svAdZNxp5dNB1fchn4a
 4v1feVb0qT+BecleGNpZmEyuPKRd59kg6kOps9IGwwO9oSh9XTFsL5xZa
 5/yqqFzYtF74iXfUDU8W9cOx2WFtgUw3lmdCjgijYmveykjw0FPVVYT4Y
 iE/gXClBlZJJejVnb186NRNrqABzJNNlZ3Rdikv2/0bK7zHTXzafUUKOr g==;
X-CSE-ConnectionGUID: RG7QTTcTSQ+gtK7Bab1wCg==
X-CSE-MsgGUID: B/TcYB0TRCm6DZE0BJYyBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="14517978"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="14517978"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 11:00:08 -0700
X-CSE-ConnectionGUID: RCZaoYjYRHq24Ds9WGoUjw==
X-CSE-MsgGUID: wDioGZ88SHiBCwN1qHuBXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30395270"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 13 May 2024 11:00:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 May 2024 21:00:06 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/i915: Update plane alignment requirements for TGL+
Date: Mon, 13 May 2024 20:59:41 +0300
Message-ID: <20240513175942.12910-9-ville.syrjala@linux.intel.com>
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

Currently we still use the SKL+ PLANE_SURF alignment even
for TGL+ even though the hardware no longer needs it.
Introduce a separate tgl_plane_min_alignment() and update
it to more accurately reflect the hardware requirements.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/skl_universal_plane.c    | 103 ++++++++++--------
 1 file changed, 55 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 1ecd7c691317..ca7fc9fae990 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -502,75 +502,79 @@ skl_plane_max_stride(struct intel_plane *plane,
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
+	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
 	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
 	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC:
-		return 16 * 1024;
+		/* 4x1 main surface tiles (16K) match 64B of AUX */
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
@@ -2442,7 +2446,10 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
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
2.43.2

