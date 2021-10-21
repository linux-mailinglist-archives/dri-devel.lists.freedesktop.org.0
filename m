Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2AA436430
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 16:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889AA6ECA8;
	Thu, 21 Oct 2021 14:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3899F6ECA7;
 Thu, 21 Oct 2021 14:24:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="216212300"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="216212300"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 07:24:31 -0700
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="495170626"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 07:24:27 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, CQ Tang <cq.tang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, lucas.demarchi@intel.com,
 <rodrigo.vivi@intel.com>, Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Ramalingam C <ramalingam.c@intel.com>, Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <ppaalanen@gmail.com>
Subject: [PATCH v2 14/17] uapi/drm/dg2: Format modifier for DG2 unified
 compression and clear color
Date: Thu, 21 Oct 2021 19:56:24 +0530
Message-Id: <20211021142627.31058-15-ramalingam.c@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

DG2 unifies render compression and media compression into a single
format for the first time.  The programming and buffer layout is
supposed to match compression on older gen12 platforms, but the
actual compression algorithm is different from any previous platform; as
such, we need a new framebuffer modifier to represent buffers in this
format, but otherwise we can re-use the existing gen12 compression driver
logic.

DG2 clear color render compression uses Tile4 layout. Therefore, we need
to define a new format modifier for uAPI to support clear color rendering.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Mika Kahola <mika.kahola@intel.com> (v2)
Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  3 ++
 .../drm/i915/display/intel_display_types.h    | 10 +++-
 drivers/gpu/drm/i915/display/intel_fb.c       |  7 +++
 .../drm/i915/display/skl_universal_plane.c    | 49 +++++++++++++++++--
 include/uapi/drm/drm_fourcc.h                 | 30 ++++++++++++
 5 files changed, 94 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9b678839bf2b..2949fe9f5b9f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1013,6 +1013,9 @@ intel_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
 					  cmd->pixel_format);
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
 	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
+	case I915_FORMAT_MOD_F_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_F_TILED_DG2_MC_CCS:
+	case I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC:
 		return lookup_format_info(gen12_ccs_formats,
 					  ARRAY_SIZE(gen12_ccs_formats),
 					  cmd->pixel_format);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 39e11eaec1a3..3aa47a9965d9 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -2047,14 +2047,20 @@ static inline bool is_ccs_modifier(u64 modifier)
 	       modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
 	       modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS ||
 	       modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
-	       modifier == I915_FORMAT_MOD_Yf_TILED_CCS;
+	       modifier == I915_FORMAT_MOD_Yf_TILED_CCS ||
+	       modifier == I915_FORMAT_MOD_F_TILED_DG2_RC_CCS ||
+	       modifier == I915_FORMAT_MOD_F_TILED_DG2_MC_CCS ||
+	       modifier == I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC;
 }
 
 static inline bool is_gen12_ccs_modifier(u64 modifier)
 {
 	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
 	       modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
-	       modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS;
+	       modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS ||
+	       modifier == I915_FORMAT_MOD_F_TILED_DG2_RC_CCS ||
+	       modifier == I915_FORMAT_MOD_F_TILED_DG2_MC_CCS ||
+	       modifier == I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC;
 }
 
 #endif /*  __INTEL_DISPLAY_TYPES_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index e19739fef825..8216b03b8aae 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -127,6 +127,9 @@ intel_tile_width_bytes(const struct drm_framebuffer *fb, int color_plane)
 			return 128;
 		else
 			return 512;
+	case I915_FORMAT_MOD_F_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_F_TILED_DG2_MC_CCS:
+	case I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC:
 	case I915_FORMAT_MOD_4_TILED:
 		/*
 		 * Each 4K tile consists of 64B(8*8) subtiles, with
@@ -314,6 +317,10 @@ unsigned int intel_surf_alignment(const struct drm_framebuffer *fb,
 	case I915_FORMAT_MOD_4_TILED:
 	case I915_FORMAT_MOD_Yf_TILED:
 		return 1 * 1024 * 1024;
+	case I915_FORMAT_MOD_F_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC:
+	case I915_FORMAT_MOD_F_TILED_DG2_MC_CCS:
+		return 16 * 1024;
 	default:
 		MISSING_CASE(fb->modifier);
 		return 0;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 0eb4509f7f7a..0aaccaff46f7 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -207,7 +207,19 @@ static const u64 adlp_step_a_plane_format_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
+static const u64 dg2_step_a_b_plane_format_modifiers[] = {
+	I915_FORMAT_MOD_F_TILED_DG2_RC_CCS,
+	I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC,
+	I915_FORMAT_MOD_X_TILED,
+	I915_FORMAT_MOD_4_TILED,
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
 static const u64 dg2_plane_format_modifiers[] = {
+	I915_FORMAT_MOD_F_TILED_DG2_RC_CCS,
+	I915_FORMAT_MOD_F_TILED_DG2_MC_CCS,
+	I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC,
 	I915_FORMAT_MOD_X_TILED,
 	I915_FORMAT_MOD_4_TILED,
 	DRM_FORMAT_MOD_LINEAR,
@@ -804,6 +816,16 @@ static u32 skl_plane_ctl_tiling(u64 fb_modifier)
 		return PLANE_CTL_TILED_Y;
 	case I915_FORMAT_MOD_4_TILED:
 		return PLANE_CTL_TILED_F;
+	case I915_FORMAT_MOD_F_TILED_DG2_RC_CCS:
+		return PLANE_CTL_TILED_F |
+			PLANE_CTL_RENDER_DECOMPRESSION_ENABLE |
+			PLANE_CTL_CLEAR_COLOR_DISABLE;
+	case I915_FORMAT_MOD_F_TILED_DG2_MC_CCS:
+		return PLANE_CTL_TILED_F |
+			PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE |
+			PLANE_CTL_CLEAR_COLOR_DISABLE;
+	case I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC:
+		return PLANE_CTL_TILED_F | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
 	case I915_FORMAT_MOD_Y_TILED_CCS:
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
 		return PLANE_CTL_TILED_Y | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
@@ -2011,7 +2033,14 @@ static bool gen12_plane_format_mod_supported(struct drm_plane *_plane,
 		if (IS_ADLP_DISPLAY_STEP(dev_priv, STEP_A0, STEP_B0))
 			return false;
 		break;
+	case I915_FORMAT_MOD_F_TILED_DG2_MC_CCS:
+		/* Wa_14013215631 */
+		if (IS_DG2_DISP_STEP(dev_priv, STEP_A0, STEP_C0))
+			return false;
+		fallthrough;
 	case I915_FORMAT_MOD_4_TILED:
+	case I915_FORMAT_MOD_F_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC:
 		if (!HAS_FTILE(dev_priv))
 			return false;
 		break;
@@ -2036,7 +2065,8 @@ static bool gen12_plane_format_mod_supported(struct drm_plane *_plane,
 	case DRM_FORMAT_P010:
 	case DRM_FORMAT_P012:
 	case DRM_FORMAT_P016:
-		if (modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS)
+		if (modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS ||
+		    modifier == I915_FORMAT_MOD_F_TILED_DG2_MC_CCS)
 			return true;
 		fallthrough;
 	case DRM_FORMAT_RGB565:
@@ -2066,7 +2096,10 @@ static bool gen12_plane_format_mod_supported(struct drm_plane *_plane,
 static const u64 *gen12_get_plane_modifiers(struct drm_i915_private *dev_priv,
 					    enum plane_id plane_id)
 {
-	if (HAS_FTILE(dev_priv))
+	/* Wa_14013215631 */
+	if (IS_DG2_DISP_STEP(dev_priv, STEP_A0, STEP_C0))
+		return dg2_step_a_b_plane_format_modifiers;
+	else if (HAS_FTILE(dev_priv))
 		return dg2_plane_format_modifiers;
 	/* Wa_22011186057 */
 	else if (IS_ADLP_DISPLAY_STEP(dev_priv, STEP_A0, STEP_B0))
@@ -2341,7 +2374,17 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 		break;
 	case PLANE_CTL_TILED_YF: /* aka PLANE_CTL_TILED_F on XE_LPD+ */
 		if (DISPLAY_VER(dev_priv) >= 13) {
-			fb->modifier = I915_FORMAT_MOD_4_TILED;
+			u32 rc_mask = PLANE_CTL_RENDER_DECOMPRESSION_ENABLE |
+					PLANE_CTL_CLEAR_COLOR_DISABLE;
+
+			if ((val & rc_mask) == rc_mask)
+				fb->modifier = I915_FORMAT_MOD_F_TILED_DG2_RC_CCS;
+			else if (val & PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE)
+				fb->modifier = I915_FORMAT_MOD_F_TILED_DG2_MC_CCS;
+			else if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
+				fb->modifier = I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC;
+			else
+				fb->modifier = I915_FORMAT_MOD_4_TILED;
 		} else {
 			if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
 				fb->modifier = I915_FORMAT_MOD_Yf_TILED_CCS;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 982b0a9fa78b..606ed0e0c880 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -567,6 +567,36 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 12)
 
+/*
+ * Intel color control surfaces (CCS) for DG2 render compression.
+ *
+ * DG2 uses a new compression format for render compression. The general
+ * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
+ * but a new hashing/compression algorithm is used, so a fresh modifier must
+ * be associated with buffers of this type. Render compression uses 128 byte
+ * compression blocks.
+ */
+#define I915_FORMAT_MOD_F_TILED_DG2_RC_CCS fourcc_mod_code(INTEL, 13)
+
+/*
+ * Intel color control surfaces (CCS) for DG2 media compression.
+ *
+ * DG2 uses a new compression format for media compression. The general
+ * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS,
+ * but a new hashing/compression algorithm is used, so a fresh modifier must
+ * be associated with buffers of this type. Media compression uses 256 byte
+ * compression blocks.
+ */
+#define I915_FORMAT_MOD_F_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 14)
+
+/*
+ * Intel color control surfaces (CCS) for DG2 clear color render compression.
+ *
+ * DG2 uses a unified compression format for clear color render compression.
+ * The general layout is a tiled layout using 4Kb tiles i.e. Tile4 layout.
+ */
+#define I915_FORMAT_MOD_F_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 15)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
-- 
2.20.1

