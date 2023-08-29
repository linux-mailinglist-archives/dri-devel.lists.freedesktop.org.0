Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE06878C934
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CCE10E42A;
	Tue, 29 Aug 2023 16:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B8010E418;
 Tue, 29 Aug 2023 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324797; x=1724860797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h+TtI60R4uDvf9766W8wxFFcS3sBK23zc76IxxdG6GA=;
 b=JcEOF+FhUVy1AUVeDI5exqTa4Wux+D6p0+RdETX2jUto73mX9F5mPGen
 4gF9y6OFZ084lb76vwFnVMVp+LyEFRwPefQGETUCd1J4aVYvaE/Kle2bp
 CohExSjdT8/HU/iOSZ/kKQ1daOa6EsHVj72OUTYLCf6wlQjbQbjhRwdpJ
 WQGpZnyyg6XVkGAZzr62JTYv7KPnoWXUitN3Lxi+DSyGWgkh3BTeYune3
 vPlyDx/j7XkKhvC4UiJYAKH08J2Sar1BELPK80IkPqPZlaUejU7kuXjZX
 71Vj3MFzZYzuPcJyjH+laOjCNyEK+phuHpoO2VTi008AbWKdEIDDggX6+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769485"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769485"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555200"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555200"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:43 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 30/33] drm/i915/color: Enable Plane CSC
Date: Tue, 29 Aug 2023 21:34:19 +0530
Message-ID: <20230829160422.1251087-31-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement plane CSC for Xe_LPD.

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c    | 86 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h    |  1 +
 .../drm/i915/display/skl_universal_plane.c    |  4 +-
 3 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index ff996b9ee77d..956080fb7fcd 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -2068,6 +2068,83 @@ static void xelpd_plane_load_luts(const struct drm_plane_state *plane_state)
 	}
 }
 
+static void xelpd_load_plane_csc_matrix(const struct drm_plane_state *state)
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
+	if (!icl_is_hdr_plane(dev_priv, plane) || !state->color.ctm)
+		return;
+
+	ctm = state->color.ctm->data;
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
+	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 0),
+			  coeffs[0] << 16 | coeffs[1]);
+	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 1),
+			  coeffs[2] << 16);
+
+	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 2),
+			  coeffs[3] << 16 | coeffs[4]);
+	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 3),
+			  coeffs[5] << 16);
+
+	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 4),
+			  coeffs[6] << 16 | coeffs[7]);
+	intel_de_write_fw(dev_priv, PLANE_CSC_COEFF(pipe, plane, 5),
+			  coeffs[8] << 16);
+
+	intel_de_write_fw(dev_priv, PLANE_CSC_PREOFF(pipe, plane, 0), 0);
+	intel_de_write_fw(dev_priv, PLANE_CSC_PREOFF(pipe, plane, 1), 0);
+	intel_de_write_fw(dev_priv, PLANE_CSC_PREOFF(pipe, plane, 2), 0);
+
+	intel_de_write_fw(dev_priv, PLANE_CSC_POSTOFF(pipe, plane, 0), postoff);
+	intel_de_write_fw(dev_priv, PLANE_CSC_POSTOFF(pipe, plane, 1), postoff);
+	intel_de_write_fw(dev_priv, PLANE_CSC_POSTOFF(pipe, plane, 2), postoff);
+}
+
 void intel_color_load_luts(const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
@@ -2083,6 +2160,14 @@ void intel_color_load_plane_luts(const struct drm_plane_state *plane_state)
 		i915->display.funcs.color->load_plane_luts(plane_state);
 }
 
+void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state)
+{
+	struct drm_i915_private *i915 = to_i915(plane_state->plane->dev);
+
+	if (i915->display.funcs.color->load_plane_csc_matrix)
+		i915->display.funcs.color->load_plane_csc_matrix(plane_state);
+}
+
 void intel_color_commit_noarm(const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
@@ -3925,6 +4010,7 @@ static const struct intel_color_funcs xelpd_color_funcs = {
 	.lut_equal = icl_lut_equal,
 	.read_csc = icl_read_csc,
 	.load_plane_luts = xelpd_plane_load_luts,
+	.load_plane_csc_matrix = xelpd_load_plane_csc_matrix,
 };
 
 static const struct intel_color_funcs tgl_color_funcs = {
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index 93382df101d9..a513c88d3bfc 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -33,4 +33,5 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
 void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
 void intel_color_plane_init(struct drm_plane *plane);
 void intel_color_load_plane_luts(const struct drm_plane_state *plane_state);
+void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state);
 #endif /* __INTEL_COLOR_H__ */
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index c08875fa965e..c85548d3210a 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1280,8 +1280,10 @@ icl_plane_update_noarm(struct intel_plane *plane,
 	if (plane_state->force_black)
 		icl_plane_csc_load_black(plane);
 
-	if (plane_state->uapi.color_mgmt_changed)
+	if (plane_state->uapi.color_mgmt_changed) {
 		intel_color_load_plane_luts(&plane_state->uapi);
+		intel_color_load_plane_csc_matrix(&plane_state->uapi);
+	}
 
 	intel_psr2_program_plane_sel_fetch_noarm(plane, crtc_state, plane_state, color_plane);
 }
-- 
2.38.1

