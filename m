Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F47A46EEFA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4944510EA15;
	Thu,  9 Dec 2021 16:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EC689A72;
 Thu,  9 Dec 2021 10:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639046895; x=1670582895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ufyRm7rfKYhiPrbJJ6u4+XIyL1a3y5Zvh7lisw9g/DI=;
 b=ki4Li8wnocS2z+JR9ykQeUsADdXIGiFSzEBOooDgO97z0mdfbsahztEH
 Bzx+/JRA93f5+qxO3uiCbbacWky1b0Fg4FieMIRSubpAloWSHCdYo8VCP
 pEYIib1fqBOct135Vkj58JR0v8WiztOIv4wJp+RlmIJDWwuNlmfsteXmq
 FsqNVkTC0SZTaZ2faG8xKj7jMWj4VvmlmEu236cdhQcoBwtVVcATvNaXj
 Ia42ADsKLeOJlOOoAN/kejdIj3qDyFtdeG6qdsF3wLvccssZC4TZX21pu
 8qlT9n0R8mzFJ/O2Iv2QZAmg+LV+4e0reDYvxjdrZGQ9kxG1AcxHyfPWV A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="218761069"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="218761069"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 02:47:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="680287481"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.167])
 by orsmga005.jf.intel.com with ESMTP; 09 Dec 2021 02:47:15 -0800
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/dg2: Tile 4 plane format support
Date: Thu,  9 Dec 2021 12:47:11 +0200
Message-Id: <20211209104711.14790-2-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
In-Reply-To: <20211209104711.14790-1-stanislav.lisovskiy@intel.com>
References: <20211209104711.14790-1-stanislav.lisovskiy@intel.com>
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
Cc: nanley.g.chery@intel.com, dri-devel@lists.freedesktop.org,
 Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tile4 in bspec format is 4K tile organized into
64B subtiles with same basic shape as for legacy TileY
which will be supported by Display13.

v2: - Moved Tile4 assocating struct for modifier/display to
      the beginning(Imre Deak)
    - Removed unneeded case I915_FORMAT_MOD_4_TILED modifier
      checks(Imre Deak)
    - Fixed I915_FORMAT_MOD_4_TILED to be 9 instead of 12
      (Imre Deak)

v3: - Rebased patch on top of new changes related to plane_caps.
    - Added static assert to check that PLANE_CTL_TILING_YF
      matches PLANE_CTL_TILING_4(Nanley Chery)
    - Fixed naming and layout description for Tile 4 in drm uapi
      header(Nanley Chery)

v4: - Extracted drm_fourcc changes to separate patch(Nanley Chery)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  1 +
 drivers/gpu/drm/i915/display/intel_fb.c       | 15 +++++++++++-
 drivers/gpu/drm/i915/display/intel_fb.h       |  1 +
 drivers/gpu/drm/i915/display/intel_fbc.c      |  1 +
 .../drm/i915/display/intel_plane_initial.c    |  1 +
 .../drm/i915/display/skl_universal_plane.c    | 23 ++++++++++++-------
 drivers/gpu/drm/i915/i915_drv.h               |  1 +
 drivers/gpu/drm/i915/i915_pci.c               |  1 +
 drivers/gpu/drm/i915/i915_reg.h               |  1 +
 drivers/gpu/drm/i915/intel_device_info.h      |  1 +
 drivers/gpu/drm/i915/intel_pm.c               |  1 +
 11 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 128d4943a43b..83253c62b6d6 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7777,6 +7777,7 @@ static int intel_atomic_check_async(struct intel_atomic_state *state, struct int
 		case I915_FORMAT_MOD_X_TILED:
 		case I915_FORMAT_MOD_Y_TILED:
 		case I915_FORMAT_MOD_Yf_TILED:
+		case I915_FORMAT_MOD_4_TILED:
 			break;
 		default:
 			drm_dbg_kms(&i915->drm,
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 23cfe2e5ce2a..94c57facbb46 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -135,11 +135,16 @@ struct intel_modifier_desc {
 					 INTEL_PLANE_CAP_CCS_MC)
 #define INTEL_PLANE_CAP_TILING_MASK	(INTEL_PLANE_CAP_TILING_X | \
 					 INTEL_PLANE_CAP_TILING_Y | \
-					 INTEL_PLANE_CAP_TILING_Yf)
+					 INTEL_PLANE_CAP_TILING_Yf | \
+					 INTEL_PLANE_CAP_TILING_4)
 #define INTEL_PLANE_CAP_TILING_NONE	0
 
 static const struct intel_modifier_desc intel_modifiers[] = {
 	{
+		.modifier = I915_FORMAT_MOD_4_TILED,
+		.display_ver = { 13, 13 },
+		.plane_caps = INTEL_PLANE_CAP_TILING_4,
+	}, {
 		.modifier = I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS,
 		.display_ver = { 12, 13 },
 		.plane_caps = INTEL_PLANE_CAP_TILING_Y | INTEL_PLANE_CAP_CCS_MC,
@@ -545,6 +550,12 @@ intel_tile_width_bytes(const struct drm_framebuffer *fb, int color_plane)
 			return 128;
 		else
 			return 512;
+	case I915_FORMAT_MOD_4_TILED:
+		/*
+		 * Each 4K tile consists of 64B(8*8) subtiles, with
+		 * same shape as Y Tile(i.e 4*16B OWords)
+		 */
+		return 128;
 	case I915_FORMAT_MOD_Y_TILED_CCS:
 		if (intel_fb_is_ccs_aux_plane(fb, color_plane))
 			return 128;
@@ -650,6 +661,7 @@ static unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier)
 		return I915_TILING_Y;
 	case INTEL_PLANE_CAP_TILING_X:
 		return I915_TILING_X;
+	case INTEL_PLANE_CAP_TILING_4:
 	case INTEL_PLANE_CAP_TILING_Yf:
 	case INTEL_PLANE_CAP_TILING_NONE:
 		return I915_TILING_NONE;
@@ -737,6 +749,7 @@ unsigned int intel_surf_alignment(const struct drm_framebuffer *fb,
 	case I915_FORMAT_MOD_Y_TILED_CCS:
 	case I915_FORMAT_MOD_Yf_TILED_CCS:
 	case I915_FORMAT_MOD_Y_TILED:
+	case I915_FORMAT_MOD_4_TILED:
 	case I915_FORMAT_MOD_Yf_TILED:
 		return 1 * 1024 * 1024;
 	default:
diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
index ba9df8986c1e..12386f13a4e0 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.h
+++ b/drivers/gpu/drm/i915/display/intel_fb.h
@@ -27,6 +27,7 @@ struct intel_plane_state;
 #define INTEL_PLANE_CAP_TILING_X	BIT(3)
 #define INTEL_PLANE_CAP_TILING_Y	BIT(4)
 #define INTEL_PLANE_CAP_TILING_Yf	BIT(5)
+#define INTEL_PLANE_CAP_TILING_4	BIT(6)
 
 bool intel_fb_is_ccs_modifier(u64 modifier);
 bool intel_fb_is_rc_ccs_cc_modifier(u64 modifier);
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 6efbef7a1fc0..aee3c9b48b84 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -936,6 +936,7 @@ static bool tiling_is_valid(const struct intel_plane_state *plane_state)
 	case I915_FORMAT_MOD_Y_TILED:
 	case I915_FORMAT_MOD_Yf_TILED:
 		return DISPLAY_VER(i915) >= 9;
+	case I915_FORMAT_MOD_4_TILED:
 	case I915_FORMAT_MOD_X_TILED:
 		return true;
 	default:
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 01ce1d72297f..4ae9730ceeff 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -126,6 +126,7 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
 	case DRM_FORMAT_MOD_LINEAR:
 	case I915_FORMAT_MOD_X_TILED:
 	case I915_FORMAT_MOD_Y_TILED:
+	case I915_FORMAT_MOD_4_TILED:
 		break;
 	default:
 		drm_dbg(&dev_priv->drm,
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index d5359cf3d270..f62ba027fcf9 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -762,6 +762,8 @@ static u32 skl_plane_ctl_tiling(u64 fb_modifier)
 		return PLANE_CTL_TILED_X;
 	case I915_FORMAT_MOD_Y_TILED:
 		return PLANE_CTL_TILED_Y;
+	case I915_FORMAT_MOD_4_TILED:
+		return PLANE_CTL_TILED_4;
 	case I915_FORMAT_MOD_Y_TILED_CCS:
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
 		return PLANE_CTL_TILED_Y | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
@@ -1990,9 +1992,7 @@ static bool gen12_plane_format_mod_supported(struct drm_plane *_plane,
 	case DRM_FORMAT_Y216:
 	case DRM_FORMAT_XVYU12_16161616:
 	case DRM_FORMAT_XVYU16161616:
-		if (modifier == DRM_FORMAT_MOD_LINEAR ||
-		    modifier == I915_FORMAT_MOD_X_TILED ||
-		    modifier == I915_FORMAT_MOD_Y_TILED)
+		if (!intel_fb_is_ccs_modifier(modifier))
 			return true;
 		fallthrough;
 	default:
@@ -2085,6 +2085,8 @@ static u8 skl_get_plane_caps(struct drm_i915_private *i915,
 		caps |= INTEL_PLANE_CAP_TILING_Y;
 	if (DISPLAY_VER(i915) < 12)
 		caps |= INTEL_PLANE_CAP_TILING_Yf;
+	if (HAS_4TILE(i915))
+		caps |= INTEL_PLANE_CAP_TILING_4;
 
 	if (skl_plane_has_rc_ccs(i915, pipe, plane_id)) {
 		caps |= INTEL_PLANE_CAP_CCS_RC;
@@ -2257,6 +2259,7 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 	unsigned int aligned_height;
 	struct drm_framebuffer *fb;
 	struct intel_framebuffer *intel_fb;
+	static_assert(PLANE_CTL_TILED_YF == PLANE_CTL_TILED_4);
 
 	if (!plane->get_hw_state(plane, &pipe))
 		return;
@@ -2318,11 +2321,15 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 		else
 			fb->modifier = I915_FORMAT_MOD_Y_TILED;
 		break;
-	case PLANE_CTL_TILED_YF:
-		if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
-			fb->modifier = I915_FORMAT_MOD_Yf_TILED_CCS;
-		else
-			fb->modifier = I915_FORMAT_MOD_Yf_TILED;
+	case PLANE_CTL_TILED_YF: /* aka PLANE_CTL_TILED_4 on XE_LPD+ */
+		if (HAS_4TILE(dev_priv)) {
+			fb->modifier = I915_FORMAT_MOD_4_TILED;
+		} else {
+			if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
+				fb->modifier = I915_FORMAT_MOD_Yf_TILED_CCS;
+			else
+				fb->modifier = I915_FORMAT_MOD_Yf_TILED;
+		}
 		break;
 	default:
 		MISSING_CASE(tiling);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index ae7dc7862b5d..3e247881862c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1444,6 +1444,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define CMDPARSER_USES_GGTT(dev_priv) (GRAPHICS_VER(dev_priv) == 7)
 
 #define HAS_LLC(dev_priv)	(INTEL_INFO(dev_priv)->has_llc)
+#define HAS_4TILE(dev_priv)	(INTEL_INFO(dev_priv)->has_4tile)
 #define HAS_SNOOP(dev_priv)	(INTEL_INFO(dev_priv)->has_snoop)
 #define HAS_EDRAM(dev_priv)	((dev_priv)->edram_size_mb)
 #define HAS_SECURE_BATCHES(dev_priv) (GRAPHICS_VER(dev_priv) < 6)
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index c8f574eea5aa..3aeb05aa45c0 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1046,6 +1046,7 @@ static const struct intel_device_info dg2_info = {
 	DGFX_FEATURES,
 	.graphics.rel = 55,
 	.media.rel = 55,
+	.has_4tile = 1,
 	PLATFORM(INTEL_DG2),
 	.platform_engine_mask =
 		BIT(RCS0) | BIT(BCS0) |
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index d27ba273cc68..a6bb55e5ecde 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7285,6 +7285,7 @@ enum {
 #define   PLANE_CTL_TILED_X			(1 << 10)
 #define   PLANE_CTL_TILED_Y			(4 << 10)
 #define   PLANE_CTL_TILED_YF			(5 << 10)
+#define   PLANE_CTL_TILED_4			(5 << 10)
 #define   PLANE_CTL_ASYNC_FLIP			(1 << 9)
 #define   PLANE_CTL_FLIP_HORIZONTAL		(1 << 8)
 #define   PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE	(1 << 4) /* TGL+ */
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 2bedf73e0a7d..82c0a78e2e49 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -128,6 +128,7 @@ enum intel_ppgtt_type {
 	func(has_64bit_reloc); \
 	func(gpu_reset_clobbers_display); \
 	func(has_reset_engine); \
+	func(has_4tile); \
 	func(has_global_mocs); \
 	func(has_gt_uc); \
 	func(has_l3_dpf); \
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index fe3787425780..145b2fb60ca8 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -5381,6 +5381,7 @@ skl_compute_wm_params(const struct intel_crtc_state *crtc_state,
 	}
 
 	wp->y_tiled = modifier == I915_FORMAT_MOD_Y_TILED ||
+		      modifier == I915_FORMAT_MOD_4_TILED ||
 		      modifier == I915_FORMAT_MOD_Yf_TILED ||
 		      modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
 		      modifier == I915_FORMAT_MOD_Yf_TILED_CCS;
-- 
2.24.1.485.gad05a3d8e5

