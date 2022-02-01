Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 480CB4A5A50
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540AD10EDA4;
	Tue,  1 Feb 2022 10:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF47510E8E0;
 Tue,  1 Feb 2022 10:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643712133; x=1675248133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WSc7WgPD3QBnvDv0Mu+abIs9EHRxztNU+ddCsY9KOoA=;
 b=cYBq7HROtjIPMza3HfOXDfWzMGgCgxcJxGpDHLoKLl0HuXWu8EHuBUPt
 E1e/+9dmfbfsxyFCpI/gX2qpPmHPJM44Axn9EWXUSdobH0GSSTAsc6Q+v
 y8K/lACxECJ353uypC6uQ9I2fzcjpPp3MEpQLV5/VECTd1Et7DH5dyVbu
 DU2DQeJiZsh30cErKoSHzB7zDSuOZFKqWdf1W/6rKSZrFLWhIUdiiaMIO
 +HoYW/TSsSjXDQ0UPuR+DesxP4Gj8cmO9DkKvHqqVEjIbfBn5EtfyK37I
 vcfvVjJcGlZWlF3k5v2aZ4g5pcou2Cpn7Slg2DVAX3S9AK2up96lsRSal w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="334020652"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="334020652"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:42:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="523011292"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:42:10 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v5 14/19] drm/i915/dg2: Tile 4 plane format support
Date: Tue,  1 Feb 2022 16:11:27 +0530
Message-Id: <20220201104132.3050-15-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220201104132.3050-1-ramalingam.c@intel.com>
References: <20220201104132.3050-1-ramalingam.c@intel.com>
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
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

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

Reviewed-by: Imre Deak <imre.deak@intel.com>
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
index 75de794185b2..189767cef356 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7737,6 +7737,7 @@ static int intel_atomic_check_async(struct intel_atomic_state *state, struct int
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
index bcdffe62f3cb..dccd9b7cde3f 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -946,6 +946,7 @@ static bool tiling_is_valid(const struct intel_plane_state *plane_state)
 	case I915_FORMAT_MOD_Y_TILED:
 	case I915_FORMAT_MOD_Yf_TILED:
 		return DISPLAY_VER(i915) >= 9;
+	case I915_FORMAT_MOD_4_TILED:
 	case I915_FORMAT_MOD_X_TILED:
 		return true;
 	default:
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index e4186a0b8edb..426a8bd30abc 100644
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
index 1223075595ff..5299dfe68802 100644
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
@@ -2011,9 +2013,7 @@ static bool gen12_plane_format_mod_supported(struct drm_plane *_plane,
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
@@ -2106,6 +2106,8 @@ static u8 skl_get_plane_caps(struct drm_i915_private *i915,
 		caps |= INTEL_PLANE_CAP_TILING_Y;
 	if (DISPLAY_VER(i915) < 12)
 		caps |= INTEL_PLANE_CAP_TILING_Yf;
+	if (HAS_4TILE(i915))
+		caps |= INTEL_PLANE_CAP_TILING_4;
 
 	if (skl_plane_has_rc_ccs(i915, pipe, plane_id)) {
 		caps |= INTEL_PLANE_CAP_CCS_RC;
@@ -2278,6 +2280,7 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 	unsigned int aligned_height;
 	struct drm_framebuffer *fb;
 	struct intel_framebuffer *intel_fb;
+	static_assert(PLANE_CTL_TILED_YF == PLANE_CTL_TILED_4);
 
 	if (!plane->get_hw_state(plane, &pipe))
 		return;
@@ -2340,11 +2343,15 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
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
index 384977798c8e..3011c05b5b9c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1424,6 +1424,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define CMDPARSER_USES_GGTT(dev_priv) (GRAPHICS_VER(dev_priv) == 7)
 
 #define HAS_LLC(dev_priv)	(INTEL_INFO(dev_priv)->has_llc)
+#define HAS_4TILE(dev_priv)	(INTEL_INFO(dev_priv)->has_4tile)
 #define HAS_SNOOP(dev_priv)	(INTEL_INFO(dev_priv)->has_snoop)
 #define HAS_EDRAM(dev_priv)	((dev_priv)->edram_size_mb)
 #define HAS_SECURE_BATCHES(dev_priv) (GRAPHICS_VER(dev_priv) < 6)
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 3976482582b8..436aae34b1f1 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1045,6 +1045,7 @@ static const struct intel_device_info dg2_info = {
 	DGFX_FEATURES,
 	.graphics.rel = 55,
 	.media.rel = 55,
+	.has_4tile = 1,
 	PLATFORM(INTEL_DG2),
 	.has_guc_deprivilege = 1,
 	.has_64k_pages = 1,
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 9b5423572fe9..14065164fdcf 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -6450,6 +6450,7 @@ enum {
 #define   PLANE_CTL_TILED_X			REG_FIELD_PREP(PLANE_CTL_TILED_MASK, 1)
 #define   PLANE_CTL_TILED_Y			REG_FIELD_PREP(PLANE_CTL_TILED_MASK, 4)
 #define   PLANE_CTL_TILED_YF			REG_FIELD_PREP(PLANE_CTL_TILED_MASK, 5)
+#define   PLANE_CTL_TILED_4                     REG_FIELD_PREP(PLANE_CTL_TILED_MASK, 5)
 #define   PLANE_CTL_ASYNC_FLIP			REG_BIT(9)
 #define   PLANE_CTL_FLIP_HORIZONTAL		REG_BIT(8)
 #define   PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE	REG_BIT(4) /* TGL+ */
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index ef7c7c988b7b..081f9849797d 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -134,6 +134,7 @@ enum intel_ppgtt_type {
 	func(gpu_reset_clobbers_display); \
 	func(has_reset_engine); \
 	func(has_flat_ccs); \
+	func(has_4tile); \
 	func(has_global_mocs); \
 	func(has_gt_uc); \
 	func(has_guc_deprivilege); \
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 46b21680e601..e81791bf7d03 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -5402,6 +5402,7 @@ skl_compute_wm_params(const struct intel_crtc_state *crtc_state,
 	}
 
 	wp->y_tiled = modifier == I915_FORMAT_MOD_Y_TILED ||
+		      modifier == I915_FORMAT_MOD_4_TILED ||
 		      modifier == I915_FORMAT_MOD_Yf_TILED ||
 		      modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
 		      modifier == I915_FORMAT_MOD_Yf_TILED_CCS;
-- 
2.20.1

