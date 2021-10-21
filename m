Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C6043642F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 16:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B126ECA4;
	Thu, 21 Oct 2021 14:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F93F6EC9F;
 Thu, 21 Oct 2021 14:24:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="216212286"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="216212286"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 07:24:27 -0700
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="495170621"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 07:24:23 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, CQ Tang <cq.tang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, lucas.demarchi@intel.com,
 <rodrigo.vivi@intel.com>, Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Imre Deak <imre.deak@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 13/17] drm/i915/dg2: Tile 4 plane format support
Date: Thu, 21 Oct 2021 19:56:23 +0530
Message-Id: <20211021142627.31058-14-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211021142627.31058-1-ramalingam.c@intel.com>
References: <20211021142627.31058-1-ramalingam.c@intel.com>
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

From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

TileF(Tile4 in bspec) format is 4K tile organized into
64B subtiles with same basic shape as for legacy TileY
which will be supported by Display13.

v2: - Fixed wrong case condition(Jani Nikula)
    - Increased I915_FORMAT_MOD_F_TILED up to 12(Imre Deak)

v3: - s/I915_TILING_F/TILING_4/g
    - s/I915_FORMAT_MOD_F_TILED/I915_FORMAT_MOD_4_TILED/g
    - Removed unneeded fencing code

Cc: Imre Deak <imre.deak@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  1 +
 drivers/gpu/drm/i915/display/intel_fb.c       |  7 ++++
 drivers/gpu/drm/i915/display/intel_fbc.c      |  1 +
 .../drm/i915/display/intel_plane_initial.c    |  1 +
 .../drm/i915/display/skl_universal_plane.c    | 36 ++++++++++++++-----
 drivers/gpu/drm/i915/i915_drv.h               |  1 +
 drivers/gpu/drm/i915/i915_pci.c               |  1 +
 drivers/gpu/drm/i915/i915_reg.h               |  1 +
 drivers/gpu/drm/i915/intel_device_info.h      |  1 +
 drivers/gpu/drm/i915/intel_pm.c               |  1 +
 include/uapi/drm/drm_fourcc.h                 |  8 +++++
 11 files changed, 50 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index ce5d6633029a..9b678839bf2b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8877,6 +8877,7 @@ static int intel_atomic_check_async(struct intel_atomic_state *state)
 		case I915_FORMAT_MOD_X_TILED:
 		case I915_FORMAT_MOD_Y_TILED:
 		case I915_FORMAT_MOD_Yf_TILED:
+		case I915_FORMAT_MOD_4_TILED:
 			break;
 		default:
 			drm_dbg_kms(&i915->drm,
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index fa1f375e696b..e19739fef825 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -127,6 +127,12 @@ intel_tile_width_bytes(const struct drm_framebuffer *fb, int color_plane)
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
 		if (is_ccs_plane(fb, color_plane))
 			return 128;
@@ -305,6 +311,7 @@ unsigned int intel_surf_alignment(const struct drm_framebuffer *fb,
 	case I915_FORMAT_MOD_Y_TILED_CCS:
 	case I915_FORMAT_MOD_Yf_TILED_CCS:
 	case I915_FORMAT_MOD_Y_TILED:
+	case I915_FORMAT_MOD_4_TILED:
 	case I915_FORMAT_MOD_Yf_TILED:
 		return 1 * 1024 * 1024;
 	default:
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 1f66de77a6b1..f079a771f802 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -747,6 +747,7 @@ static bool tiling_is_valid(struct drm_i915_private *dev_priv,
 	case DRM_FORMAT_MOD_LINEAR:
 	case I915_FORMAT_MOD_Y_TILED:
 	case I915_FORMAT_MOD_Yf_TILED:
+	case I915_FORMAT_MOD_4_TILED:
 		return DISPLAY_VER(dev_priv) >= 9;
 	case I915_FORMAT_MOD_X_TILED:
 		return true;
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index dcd698a02da2..d80855ee9b96 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -125,6 +125,7 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
 	case DRM_FORMAT_MOD_LINEAR:
 	case I915_FORMAT_MOD_X_TILED:
 	case I915_FORMAT_MOD_Y_TILED:
+	case I915_FORMAT_MOD_4_TILED:
 		break;
 	default:
 		drm_dbg(&dev_priv->drm,
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 7444b88829ea..0eb4509f7f7a 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -207,6 +207,13 @@ static const u64 adlp_step_a_plane_format_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
+static const u64 dg2_plane_format_modifiers[] = {
+	I915_FORMAT_MOD_X_TILED,
+	I915_FORMAT_MOD_4_TILED,
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
 int skl_format_to_fourcc(int format, bool rgb_order, bool alpha)
 {
 	switch (format) {
@@ -795,6 +802,8 @@ static u32 skl_plane_ctl_tiling(u64 fb_modifier)
 		return PLANE_CTL_TILED_X;
 	case I915_FORMAT_MOD_Y_TILED:
 		return PLANE_CTL_TILED_Y;
+	case I915_FORMAT_MOD_4_TILED:
+		return PLANE_CTL_TILED_F;
 	case I915_FORMAT_MOD_Y_TILED_CCS:
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
 		return PLANE_CTL_TILED_Y | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
@@ -1283,6 +1292,7 @@ static int skl_plane_check_fb(const struct intel_crtc_state *crtc_state,
 	     fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
 	     fb->modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
 	     fb->modifier == I915_FORMAT_MOD_Yf_TILED_CCS ||
+	     fb->modifier == I915_FORMAT_MOD_4_TILED ||
 	     fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
 	     fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS ||
 	     fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)) {
@@ -2001,6 +2011,10 @@ static bool gen12_plane_format_mod_supported(struct drm_plane *_plane,
 		if (IS_ADLP_DISPLAY_STEP(dev_priv, STEP_A0, STEP_B0))
 			return false;
 		break;
+	case I915_FORMAT_MOD_4_TILED:
+		if (!HAS_FTILE(dev_priv))
+			return false;
+		break;
 	default:
 		return false;
 	}
@@ -2041,9 +2055,7 @@ static bool gen12_plane_format_mod_supported(struct drm_plane *_plane,
 	case DRM_FORMAT_Y216:
 	case DRM_FORMAT_XVYU12_16161616:
 	case DRM_FORMAT_XVYU16161616:
-		if (modifier == DRM_FORMAT_MOD_LINEAR ||
-		    modifier == I915_FORMAT_MOD_X_TILED ||
-		    modifier == I915_FORMAT_MOD_Y_TILED)
+		if (!is_ccs_modifier(modifier))
 			return true;
 		fallthrough;
 	default:
@@ -2054,8 +2066,10 @@ static bool gen12_plane_format_mod_supported(struct drm_plane *_plane,
 static const u64 *gen12_get_plane_modifiers(struct drm_i915_private *dev_priv,
 					    enum plane_id plane_id)
 {
+	if (HAS_FTILE(dev_priv))
+		return dg2_plane_format_modifiers;
 	/* Wa_22011186057 */
-	if (IS_ADLP_DISPLAY_STEP(dev_priv, STEP_A0, STEP_B0))
+	else if (IS_ADLP_DISPLAY_STEP(dev_priv, STEP_A0, STEP_B0))
 		return adlp_step_a_plane_format_modifiers;
 	else if (gen12_plane_supports_mc_ccs(dev_priv, plane_id))
 		return gen12_plane_format_modifiers_mc_ccs;
@@ -2325,11 +2339,15 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 		else
 			fb->modifier = I915_FORMAT_MOD_Y_TILED;
 		break;
-	case PLANE_CTL_TILED_YF:
-		if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
-			fb->modifier = I915_FORMAT_MOD_Yf_TILED_CCS;
-		else
-			fb->modifier = I915_FORMAT_MOD_Yf_TILED;
+	case PLANE_CTL_TILED_YF: /* aka PLANE_CTL_TILED_F on XE_LPD+ */
+		if (DISPLAY_VER(dev_priv) >= 13) {
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
index 57948e0ee48b..fdd8ddb0cdf6 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1628,6 +1628,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define CMDPARSER_USES_GGTT(dev_priv) (GRAPHICS_VER(dev_priv) == 7)
 
 #define HAS_LLC(dev_priv)	(INTEL_INFO(dev_priv)->has_llc)
+#define HAS_FTILE(dev_priv)    (INTEL_INFO(dev_priv)->has_ftile)
 #define HAS_SNOOP(dev_priv)	(INTEL_INFO(dev_priv)->has_snoop)
 #define HAS_EDRAM(dev_priv)	((dev_priv)->edram_size_mb)
 #define HAS_SECURE_BATCHES(dev_priv) (GRAPHICS_VER(dev_priv) < 6)
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 68367b505dc4..0d7d88ee43ca 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -972,6 +972,7 @@ static const struct intel_device_info adl_p_info = {
 	.display.has_cdclk_crawl = 1,
 	.display.has_modular_fia = 1,
 	.display.has_psr_hw_tracking = 0,
+	.has_ftile = 1, \
 	.platform_engine_mask =
 		BIT(RCS0) | BIT(BCS0) | BIT(VECS0) | BIT(VCS0) | BIT(VCS2),
 	.ppgtt_size = 48,
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 3693eb03f5aa..0fe8e8e6cc31 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7195,6 +7195,7 @@ enum {
 #define   PLANE_CTL_TILED_X			(1 << 10)
 #define   PLANE_CTL_TILED_Y			(4 << 10)
 #define   PLANE_CTL_TILED_YF			(5 << 10)
+#define   PLANE_CTL_TILED_F			(5 << 10)
 #define   PLANE_CTL_ASYNC_FLIP			(1 << 9)
 #define   PLANE_CTL_FLIP_HORIZONTAL		(1 << 8)
 #define   PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE	(1 << 4) /* TGL+ */
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 87ee1d86d2ac..f95d4a939e10 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -126,6 +126,7 @@ enum intel_ppgtt_type {
 	func(has_64k_pages); \
 	func(gpu_reset_clobbers_display); \
 	func(has_reset_engine); \
+	func(has_ftile); \
 	func(has_flat_ccs); \
 	func(has_global_mocs); \
 	func(has_gt_uc); \
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 201477ca408a..0db5f32adfd5 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -5377,6 +5377,7 @@ skl_compute_wm_params(const struct intel_crtc_state *crtc_state,
 	}
 
 	wp->y_tiled = modifier == I915_FORMAT_MOD_Y_TILED ||
+		      modifier == I915_FORMAT_MOD_4_TILED ||
 		      modifier == I915_FORMAT_MOD_Yf_TILED ||
 		      modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
 		      modifier == I915_FORMAT_MOD_Yf_TILED_CCS;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 45a914850be0..982b0a9fa78b 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -558,6 +558,14 @@ extern "C" {
  * pitch is required to be a multiple of 4 tile widths.
  */
 #define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC fourcc_mod_code(INTEL, 8)
+/*
+ * Intel F-tiling(aka Tile4) layout
+ *
+ * This is a tiled layout using 4Kb tiles in row-major layout.
+ * Within the tile pixels are laid out in 64 byte units / sub-tiles in OWORD
+ * (16 bytes) chunks column-major..
+ */
+#define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 12)
 
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
-- 
2.20.1

