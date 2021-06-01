Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0DD39712D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1629D6EA02;
	Tue,  1 Jun 2021 10:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98EB26EA01;
 Tue,  1 Jun 2021 10:16:31 +0000 (UTC)
IronPort-SDR: ZIudHiwGzAvZk4Dqc/JR7xAafAjn41SSoUlFUyXaBKrw4DWMmsIWUqvMphMoxz5oxuchROmQN5
 L5W8WEc5QlVg==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203550029"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="203550029"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:31 -0700
IronPort-SDR: Yu1SgrePCtBxoCVbM+NHUMEHwTPY9pDpJBRX99BBVHxXODXMtDM4QeZwA/CM9QH5AimqcPEI8m
 FWc/4L2KEgiA==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="482431365"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:29 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 15/21] drm/i915/xelpd: Enable Plane CSC
Date: Tue,  1 Jun 2021 16:22:12 +0530
Message-Id: <20210601105218.29185-16-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601105218.29185-1-uma.shankar@intel.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>, bhanuprakash.modem@intel.com
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
index 5de9c98beaf6..ec7646790892 100644
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
index 6d57a47d8a60..8b4f653b213d 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -2119,6 +2119,83 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
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
@@ -2343,7 +2420,12 @@ int intel_plane_color_init(struct drm_plane *plane)
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
index aadb984fdf77..6ba670b6a5c9 100644
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
index df8500a86e9d..a8e35357aea0 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7187,6 +7187,7 @@ enum {
 #define _PLANE_COLOR_CTL_3_A			0x703CC /* GLK+ */
 #define   PLANE_COLOR_PIPE_GAMMA_ENABLE		(1 << 30) /* Pre-ICL */
 #define   PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE	(1 << 28)
+#define   PLANE_COLOR_PLANE_CSC_ENABLE		(1 << 21) /* ICL+ */
 #define   PLANE_COLOR_INPUT_CSC_ENABLE		(1 << 20) /* ICL+ */
 #define   PLANE_COLOR_PIPE_CSC_ENABLE		(1 << 23) /* Pre-ICL */
 #define   PLANE_PRE_CSC_GAMMA_ENABLE		(1 << 14)
-- 
2.26.2

