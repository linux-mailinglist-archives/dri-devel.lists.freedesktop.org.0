Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5145F4020EF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 23:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5A489D49;
	Mon,  6 Sep 2021 21:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264F189C99;
 Mon,  6 Sep 2021 21:01:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="283747528"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="283747528"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:39 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="537362307"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:37 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, ville.syrjala@linux.intel.com, ppaalanen@gmail.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net,
 Shashank.Sharma@amd.com, Uma Shankar <uma.shankar@intel.com>
Subject: [RFC v2 16/22] drm/i915/xelpd: Enable Plane CSC
Date: Tue,  7 Sep 2021 03:08:58 +0530
Message-Id: <20210906213904.27918-17-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210906213904.27918-1-uma.shankar@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
MIME-Version: 1.0
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

Implement plane CSC for ICL+

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c |  5 +-
 drivers/gpu/drm/i915/display/intel_color.c    | 82 +++++++++++++++++++
 .../drm/i915/display/skl_universal_plane.c    |  4 +
 drivers/gpu/drm/i915/i915_reg.h               |  1 +
 4 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 8796fc86b2e5..1637f7890f42 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -499,6 +499,7 @@ void skl_update_planes_on_crtc(struct intel_atomic_state *state,
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct skl_ddb_entry entries_y[I915_MAX_PLANES];
 	struct skl_ddb_entry entries_uv[I915_MAX_PLANES];
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	u32 update_mask = new_crtc_state->update_planes;
 	struct intel_plane *plane;
 
@@ -513,8 +514,10 @@ void skl_update_planes_on_crtc(struct intel_atomic_state *state,
 		struct intel_plane_state *new_plane_state =
 			intel_atomic_get_new_plane_state(state, plane);
 
-		if (new_plane_state->uapi.color_mgmt_changed)
+		if (new_plane_state->uapi.color_mgmt_changed) {
 			intel_color_load_plane_luts(&new_plane_state->uapi);
+			dev_priv->display.load_plane_csc_matrix(&new_plane_state->uapi);
+		}
 
 		if (new_plane_state->uapi.visible ||
 		    new_plane_state->planar_slave) {
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index f5a9af858d1b..e9c80ed41466 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -2118,6 +2118,83 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
 	}
 }
 
+static void icl_load_plane_csc_matrix(const struct drm_plane_state *state)
+{
+	struct drm_i915_private *dev_priv = to_i915(state->plane->dev);
+	enum pipe pipe = to_intel_plane(state->plane)->pipe;
+	enum plane_id plane = to_intel_plane(state->plane)->id;
+	struct drm_color_ctm *ctm;
+	const u64 *input;
+	u16 coeffs[9] = {};
+	u16 postoff = 0;
+	int i;
+
+	if (!icl_is_hdr_plane(dev_priv, plane) || !state->ctm)
+		return;
+
+	ctm = state->ctm->data;
+	input = ctm->matrix;
+
+	/*
+	 * Convert fixed point S31.32 input to format supported by the
+	 * hardware.
+	 */
+	for (i = 0; i < ARRAY_SIZE(coeffs); i++) {
+		u64 abs_coeff = ((1ULL << 63) - 1) & input[i];
+
+		/*
+		 * Clamp input value to min/max supported by
+		 * hardware.
+		 */
+		abs_coeff = clamp_val(abs_coeff, 0, CTM_COEFF_4_0 - 1);
+
+		/* sign bit */
+		if (CTM_COEFF_NEGATIVE(input[i]))
+			coeffs[i] |= 1 << 15;
+
+		if (abs_coeff < CTM_COEFF_0_125)
+			coeffs[i] |= (3 << 12) |
+				ILK_CSC_COEFF_FP(abs_coeff, 12);
+		else if (abs_coeff < CTM_COEFF_0_25)
+			coeffs[i] |= (2 << 12) |
+				ILK_CSC_COEFF_FP(abs_coeff, 11);
+		else if (abs_coeff < CTM_COEFF_0_5)
+			coeffs[i] |= (1 << 12) |
+				ILK_CSC_COEFF_FP(abs_coeff, 10);
+		else if (abs_coeff < CTM_COEFF_1_0)
+			coeffs[i] |= ILK_CSC_COEFF_FP(abs_coeff, 9);
+		else if (abs_coeff < CTM_COEFF_2_0)
+			coeffs[i] |= (7 << 12) |
+				ILK_CSC_COEFF_FP(abs_coeff, 8);
+		else
+			coeffs[i] |= (6 << 12) |
+				ILK_CSC_COEFF_FP(abs_coeff, 7);
+	}
+
+	intel_de_write(dev_priv, PLANE_CSC_COEFF(pipe, plane, 0),
+		       coeffs[0] << 16 | coeffs[1]);
+	intel_de_write(dev_priv, PLANE_CSC_COEFF(pipe, plane, 1),
+		       coeffs[2] << 16);
+
+	intel_de_write(dev_priv, PLANE_CSC_COEFF(pipe, plane, 2),
+		       coeffs[3] << 16 | coeffs[4]);
+	intel_de_write(dev_priv, PLANE_CSC_COEFF(pipe, plane, 3),
+		       coeffs[5] << 16);
+
+	intel_de_write(dev_priv, PLANE_CSC_COEFF(pipe, plane, 4),
+		       coeffs[6] << 16 | coeffs[7]);
+	intel_de_write(dev_priv, PLANE_CSC_COEFF(pipe, plane, 5),
+		       coeffs[8] << 16);
+
+	intel_de_write(dev_priv, PLANE_CSC_PREOFF(pipe, plane, 0), 0);
+	intel_de_write(dev_priv, PLANE_CSC_PREOFF(pipe, plane, 1), 0);
+	intel_de_write(dev_priv, PLANE_CSC_PREOFF(pipe, plane, 2), 0);
+
+	intel_de_write(dev_priv, PLANE_CSC_POSTOFF(pipe, plane, 0), postoff);
+	intel_de_write(dev_priv, PLANE_CSC_POSTOFF(pipe, plane, 1), postoff);
+	intel_de_write(dev_priv, PLANE_CSC_POSTOFF(pipe, plane, 2), postoff);
+}
+
  /* FIXME input bpc? */
 static const struct drm_color_lut_range d13_degamma_hdr[] = {
 	/* segment 1 */
@@ -2342,7 +2419,12 @@ int intel_plane_color_init(struct drm_plane *plane)
 									   LUT_TYPE_DEGAMMA);
 
 		dev_priv->display.load_plane_luts = d13_plane_load_luts;
+		dev_priv->display.load_plane_csc_matrix = icl_load_plane_csc_matrix;
+
 		drm_plane_attach_degamma_properties(plane);
+
+		if (icl_is_hdr_plane(dev_priv, to_intel_plane(plane)->id))
+			drm_plane_attach_ctm_property(plane);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index c4e01ae4343c..61eff22a3503 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -965,6 +965,10 @@ static u32 glk_plane_color_ctl(const struct intel_crtc_state *crtc_state,
 	if (plane_state->uapi.degamma_lut)
 		plane_color_ctl |= PLANE_PRE_CSC_GAMMA_ENABLE;
 
+	/* FIXME needs hw.ctm */
+	if (plane_state->uapi.ctm)
+		plane_color_ctl |= PLANE_COLOR_PLANE_CSC_ENABLE;
+
 	plane_color_ctl |= glk_plane_color_ctl_alpha(plane_state);
 
 	if (fb->format->is_yuv && !icl_is_hdr_plane(dev_priv, plane->id)) {
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 20c1b8ddded8..ceee500e64d7 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7230,6 +7230,7 @@ enum {
 #define _PLANE_COLOR_CTL_3_A			0x703CC /* GLK+ */
 #define   PLANE_COLOR_PIPE_GAMMA_ENABLE		(1 << 30) /* Pre-ICL */
 #define   PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE	(1 << 28)
+#define   PLANE_COLOR_PLANE_CSC_ENABLE		(1 << 21) /* ICL+ */
 #define   PLANE_COLOR_INPUT_CSC_ENABLE		(1 << 20) /* ICL+ */
 #define   PLANE_COLOR_PIPE_CSC_ENABLE		(1 << 23) /* Pre-ICL */
 #define   PLANE_PRE_CSC_GAMMA_ENABLE		(1 << 14)
-- 
2.26.2

