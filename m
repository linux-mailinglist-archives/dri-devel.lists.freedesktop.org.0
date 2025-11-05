Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ABDC359BF
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BC610E72A;
	Wed,  5 Nov 2025 12:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="noO9ssM8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7361B10E715;
 Wed,  5 Nov 2025 12:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345378; x=1793881378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ECtzC6KluGhE+eeeYsGZLt0syb3OEwoxsbNQVeQMaEk=;
 b=noO9ssM8rQq8pZdwvkEfmOCDGLTaMgtU9HL+E6tIkj8czxorJ24OL93K
 vfzXc5kp5Kz+zS1w1Txld+U86zHv90d78c1jlzTx7dR2x2AOKRLUNfTFE
 ODKuW2H8RnV4Ax2MSiS+FMOHL1vixbRkwYj91DgRI+brOp5v4irDteAE/
 y7r67CimCWhKI+KsvsDh8sJeIM9hcXP0nQMlk4GZkHHbp/yYGv1Mxm/HP
 3pVdckT6V2CljNMokS4qtvWMUnaL/lnQsPzJgPp4FZLXJBx0ceya7ZvfR
 xvZKQwPYiOm1dghzSQPIlmPTfMcz7UHIbse1mbDqOjmeHuJZucD59Kf+z A==;
X-CSE-ConnectionGUID: QY34tKsyQeOj3Nv4EGr4Ow==
X-CSE-MsgGUID: 5kI0PDpLT8OvF5EY/IRYfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68317534"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="68317534"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:22:58 -0800
X-CSE-ConnectionGUID: zLShGUZ5SEqPCMWx2UQ7Bg==
X-CSE-MsgGUID: H27LakQRSqaBFGm6BRfkYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187740272"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2025 04:22:54 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 jani.nikula@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v6 08/16] drm/i915/color: Add plane CTM callback for D12 and beyond
Date: Wed,  5 Nov 2025 18:04:04 +0530
Message-ID: <20251105123413.2671075-9-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251105123413.2671075-1-uma.shankar@intel.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
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

Add callback for setting CTM block in platforms D12 and beyond

v2:
- Add dsb support
- Pass plane_state as we are now doing a uapi to hw state copy
- Add support for 3x4 matrix

v3:
- Add relevant header file
- Fix typo (Suraj)
- Add callback to TGL+ (Suraj)

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index aef25cb63457..fd3c6b7b0f38 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -32,6 +32,8 @@
 #include "intel_display_utils.h"
 #include "intel_dsb.h"
 #include "intel_vrr.h"
+#include "skl_universal_plane.h"
+#include "skl_universal_plane_regs.h"
 
 struct intel_color_funcs {
 	int (*color_check)(struct intel_atomic_state *state,
@@ -3841,6 +3843,101 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
 	}
 }
 
+static void
+xelpd_load_plane_csc_matrix(struct intel_dsb *dsb,
+			    const struct intel_plane_state *plane_state)
+{
+	struct intel_display *display = to_intel_display(plane_state);
+	const struct drm_plane_state *state = &plane_state->uapi;
+	enum pipe pipe = to_intel_plane(state->plane)->pipe;
+	enum plane_id plane = to_intel_plane(state->plane)->id;
+	const struct drm_property_blob *blob = plane_state->hw.ctm;
+	struct drm_color_ctm_3x4 *ctm;
+	const u64 *input;
+	u16 coeffs[9] = {};
+	int i, j;
+
+	if (!icl_is_hdr_plane(display, plane) || !blob)
+		return;
+
+	ctm = blob->data;
+	input = ctm->matrix;
+
+	/*
+	 * Convert fixed point S31.32 input to format supported by the
+	 * hardware.
+	 */
+	for (i = 0, j = 0; i < ARRAY_SIZE(coeffs); i++) {
+		u64 abs_coeff = ((1ULL << 63) - 1) & input[j];
+
+		/*
+		 * Clamp input value to min/max supported by
+		 * hardware.
+		 */
+		abs_coeff = clamp_val(abs_coeff, 0, CTM_COEFF_4_0 - 1);
+
+		/* sign bit */
+		if (CTM_COEFF_NEGATIVE(input[j]))
+			coeffs[i] |= 1 << 15;
+
+		if (abs_coeff < CTM_COEFF_0_125)
+			coeffs[i] |= (3 << 12) |
+				      ILK_CSC_COEFF_FP(abs_coeff, 12);
+		else if (abs_coeff < CTM_COEFF_0_25)
+			coeffs[i] |= (2 << 12) |
+				      ILK_CSC_COEFF_FP(abs_coeff, 11);
+		else if (abs_coeff < CTM_COEFF_0_5)
+			coeffs[i] |= (1 << 12) |
+				      ILK_CSC_COEFF_FP(abs_coeff, 10);
+		else if (abs_coeff < CTM_COEFF_1_0)
+			coeffs[i] |= ILK_CSC_COEFF_FP(abs_coeff, 9);
+		else if (abs_coeff < CTM_COEFF_2_0)
+			coeffs[i] |= (7 << 12) |
+				      ILK_CSC_COEFF_FP(abs_coeff, 8);
+		else
+			coeffs[i] |= (6 << 12) |
+				      ILK_CSC_COEFF_FP(abs_coeff, 7);
+
+		/* Skip postoffs */
+		if (!((j + 2) % 4))
+			j += 2;
+		else
+			j++;
+	}
+
+	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 0),
+			   coeffs[0] << 16 | coeffs[1]);
+	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 1),
+			   coeffs[2] << 16);
+
+	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 2),
+			   coeffs[3] << 16 | coeffs[4]);
+	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 3),
+			   coeffs[5] << 16);
+
+	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 4),
+			   coeffs[6] << 16 | coeffs[7]);
+	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 5),
+			   coeffs[8] << 16);
+
+	intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 0), 0);
+	intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 1), 0);
+	intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 2), 0);
+
+	/*
+	 * Conversion from S31.32 to S0.12. BIT[12] is the signed bit
+	 */
+	intel_de_write_dsb(display, dsb,
+			   PLANE_CSC_POSTOFF(pipe, plane, 0),
+			   ctm_to_twos_complement(input[3], 0, 12));
+	intel_de_write_dsb(display, dsb,
+			   PLANE_CSC_POSTOFF(pipe, plane, 1),
+			   ctm_to_twos_complement(input[7], 0, 12));
+	intel_de_write_dsb(display, dsb,
+			   PLANE_CSC_POSTOFF(pipe, plane, 2),
+			   ctm_to_twos_complement(input[11], 0, 12));
+}
+
 static const struct intel_color_funcs chv_color_funcs = {
 	.color_check = chv_color_check,
 	.color_commit_arm = i9xx_color_commit_arm,
@@ -3888,6 +3985,7 @@ static const struct intel_color_funcs tgl_color_funcs = {
 	.lut_equal = icl_lut_equal,
 	.read_csc = icl_read_csc,
 	.get_config = skl_get_config,
+	.load_plane_csc_matrix = xelpd_load_plane_csc_matrix,
 };
 
 static const struct intel_color_funcs icl_color_funcs = {
-- 
2.50.1

