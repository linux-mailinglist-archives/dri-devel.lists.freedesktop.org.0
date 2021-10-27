Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCFA43D4FD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 23:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A616E919;
	Wed, 27 Oct 2021 21:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9086E912;
 Wed, 27 Oct 2021 21:21:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230217442"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="230217442"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:21:33 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="665154289"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:21:28 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Ramalingam C <ramalingam.c@intel.com>, Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>, mesa-dev@lists.freedesktop.org,
 Tony Ye <tony.ye@intel.com>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>
Subject: [PATCH v3 13/17] uapi/drm/dg2: Format modifier for DG2 unified
 compression and clear color
Date: Thu, 28 Oct 2021 02:53:35 +0530
Message-Id: <20211027212339.29259-14-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027212339.29259-1-ramalingam.c@intel.com>
References: <20211027212339.29259-1-ramalingam.c@intel.com>
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

v2: Rebased on new format modifier check [Ram]

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Mika Kahola <mika.kahola@intel.com> (v2)
Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: mesa-dev@lists.freedesktop.org
Cc: Tony Ye <tony.ye@intel.com>
Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
Acked-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/i915/display/intel_fb.c       | 43 +++++++++++++++++++
 .../drm/i915/display/skl_universal_plane.c    | 29 ++++++++++++-
 include/uapi/drm/drm_fourcc.h                 | 30 +++++++++++++
 3 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 562d5244688d..484ae1fd0e94 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -106,6 +106,21 @@ static const struct drm_format_info gen12_ccs_cc_formats[] = {
 	  .hsub = 1, .vsub = 1, .has_alpha = true },
 };
 
+static const struct drm_format_info gen12_flat_ccs_cc_formats[] = {
+	{ .format = DRM_FORMAT_XRGB8888, .depth = 24, .num_planes = 2,
+	  .char_per_block = { 4, 0 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
+	  .hsub = 1, .vsub = 1, },
+	{ .format = DRM_FORMAT_XBGR8888, .depth = 24, .num_planes = 2,
+	  .char_per_block = { 4, 0 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
+	  .hsub = 1, .vsub = 1, },
+	{ .format = DRM_FORMAT_ARGB8888, .depth = 32, .num_planes = 2,
+	  .char_per_block = { 4, 0 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
+	  .hsub = 1, .vsub = 1, .has_alpha = true },
+	{ .format = DRM_FORMAT_ABGR8888, .depth = 32, .num_planes = 2,
+	  .char_per_block = { 4, 0 }, .block_w = { 1, 2 }, .block_h = { 1, 1 },
+	  .hsub = 1, .vsub = 1, .has_alpha = true },
+};
+
 struct intel_modifier_desc {
 	u64 modifier;
 	struct {
@@ -166,6 +181,27 @@ static const struct intel_modifier_desc intel_modifiers[] = {
 		.ccs.packed_aux_planes = BIT(1),
 
 		FORMAT_OVERRIDE(gen12_ccs_cc_formats),
+	}, {
+		.modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
+		.display_ver = { 12, 13 },
+		.tiling = I915_TILING_NONE,
+
+		.ccs.type = INTEL_CCS_RC,
+	}, {
+		.modifier = I915_FORMAT_MOD_4_TILED_DG2_MC_CCS,
+		.display_ver = { 12, 13 },
+		.tiling = I915_TILING_NONE,
+
+		.ccs.type = INTEL_CCS_MC,
+	}, {
+		.modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC,
+		.display_ver = { 12, 13 },
+		.tiling = I915_TILING_NONE,
+
+		.ccs.type = INTEL_CCS_RC_CC,
+		.ccs.cc_planes = BIT(1),
+
+		FORMAT_OVERRIDE(gen12_flat_ccs_cc_formats),
 	}, {
 		.modifier = I915_FORMAT_MOD_Yf_TILED_CCS,
 		.display_ver = { 9, 11 },
@@ -582,6 +618,9 @@ intel_tile_width_bytes(const struct drm_framebuffer *fb, int color_plane)
 			return 128;
 		else
 			return 512;
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
 	case I915_FORMAT_MOD_4_TILED:
 		/*
 		 * Each 4K tile consists of 64B(8*8) subtiles, with
@@ -759,6 +798,10 @@ unsigned int intel_surf_alignment(const struct drm_framebuffer *fb,
 	case I915_FORMAT_MOD_4_TILED:
 	case I915_FORMAT_MOD_Yf_TILED:
 		return 1 * 1024 * 1024;
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
+	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
+		return 16 * 1024;
 	default:
 		MISSING_CASE(fb->modifier);
 		return 0;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index aeca96925feb..136b3f74a290 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -753,6 +753,16 @@ static u32 skl_plane_ctl_tiling(u64 fb_modifier)
 		return PLANE_CTL_TILED_Y;
 	case I915_FORMAT_MOD_4_TILED:
 		return PLANE_CTL_TILED_4;
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+		return PLANE_CTL_TILED_4 |
+			PLANE_CTL_RENDER_DECOMPRESSION_ENABLE |
+			PLANE_CTL_CLEAR_COLOR_DISABLE;
+	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
+		return PLANE_CTL_TILED_4 |
+			PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE |
+			PLANE_CTL_CLEAR_COLOR_DISABLE;
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
+		return PLANE_CTL_TILED_4 | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
 	case I915_FORMAT_MOD_Y_TILED_CCS:
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
 		return PLANE_CTL_TILED_Y | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
@@ -1983,6 +1993,9 @@ skl_plane_disable_flip_done(struct intel_plane *plane)
 static bool skl_plane_has_rc_ccs(struct drm_i915_private *i915,
 				 enum pipe pipe, enum plane_id plane_id)
 {
+	if (IS_DG2(i915) && !HAS_4TILE(i915))
+		return false;
+
 	/* Wa_22011186057 */
 	if (IS_ADLP_DISPLAY_STEP(i915, STEP_A0, STEP_B0))
 		return false;
@@ -2001,6 +2014,10 @@ static bool skl_plane_has_rc_ccs(struct drm_i915_private *i915,
 static bool gen12_plane_has_mc_ccs(struct drm_i915_private *i915,
 				   enum plane_id plane_id)
 {
+	/* Wa_14013215631:dg2[a0,b0] */
+	if (IS_DG2_DISP_STEP(i915, STEP_A0, STEP_C0))
+		return false;
+
 	/* Wa_14010477008:tgl[a0..c0],rkl[all],dg1[all] */
 	if (IS_DG1(i915) || IS_ROCKETLAKE(i915) ||
 	    IS_TGL_DISPLAY_STEP(i915, STEP_A0, STEP_D0))
@@ -2243,7 +2260,17 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 		break;
 	case PLANE_CTL_TILED_YF: /* aka PLANE_CTL_TILED_4 on XE_LPD+ */
 		if (DISPLAY_VER(dev_priv) >= 13) {
-			fb->modifier = I915_FORMAT_MOD_4_TILED;
+			u32 rc_mask = PLANE_CTL_RENDER_DECOMPRESSION_ENABLE |
+					PLANE_CTL_CLEAR_COLOR_DISABLE;
+
+			if ((val & rc_mask) == rc_mask)
+				fb->modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
+			else if (val & PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE)
+				fb->modifier = I915_FORMAT_MOD_4_TILED_DG2_MC_CCS;
+			else if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
+				fb->modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC;
+			else
+				fb->modifier = I915_FORMAT_MOD_4_TILED;
 		} else {
 			if (val & PLANE_CTL_RENDER_DECOMPRESSION_ENABLE)
 				fb->modifier = I915_FORMAT_MOD_Yf_TILED_CCS;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 982b0a9fa78b..719c17847e07 100644
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
+#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS fourcc_mod_code(INTEL, 13)
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
+#define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 14)
+
+/*
+ * Intel color control surfaces (CCS) for DG2 clear color render compression.
+ *
+ * DG2 uses a unified compression format for clear color render compression.
+ * The general layout is a tiled layout using 4Kb tiles i.e. Tile4 layout.
+ */
+#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 15)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
-- 
2.20.1

