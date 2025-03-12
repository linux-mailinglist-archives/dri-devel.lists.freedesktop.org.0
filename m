Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731E2A5D708
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFA510E70C;
	Wed, 12 Mar 2025 07:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n5YwrWGb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08DF10E706;
 Wed, 12 Mar 2025 07:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741763607; x=1773299607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zjqtk2efhfnn+R639p5SupcG96rkfGmCZzyjd3IPaA8=;
 b=n5YwrWGbtskea9XeBboBcHR1Y0ALlag7PxlmNPY7rMd0+Pguq+vTNfk8
 KF3umfmxfbuwtwA+Pvz50SHf8ZT7XH2Rs91Hg/4ySDNUGR6f4q+LSy1fj
 tg0rPuhdMKMu3W1LOMxPYCvveca4p9JkmS2s84t7npYNAu1ERzCQ9BPbS
 8DlontBjSRJHpsRnNBKUWyFKflQ4MrkD4JmwbwZdCfWeGCbcmWM1SahjO
 uCphniZ6PJXXWWf8ubA7z94o0YjOjL0G/ipIwOf7vPE8c6f1itM14Pvzh
 9UxCzd+x9RmOe3C5kfQ9WQtv+BVgvVatcNGfEQRakM8A9nYMS9ohJs9e6 A==;
X-CSE-ConnectionGUID: Xf4SjzunQZqdMB9cPzRJNA==
X-CSE-MsgGUID: kiRwCfpMQ6WNO2c/KVKbLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65288859"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65288859"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 00:13:18 -0700
X-CSE-ConnectionGUID: stcZciMOTxGuxuQDEWL16A==
X-CSE-MsgGUID: fSpkumOuTfuFZKqY678xeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120367496"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2025 00:13:14 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 16/23] drm/i915/color: Add plane CTM callback for D13 and beyond
Date: Wed, 12 Mar 2025 12:54:18 +0530
Message-ID: <20250312072425.3099205-17-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250312072425.3099205-1-uma.shankar@intel.com>
References: <20250312072425.3099205-1-uma.shankar@intel.com>
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

Add callback for setting CTM block in platforms D13 and beyond

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 45f46d7db15b..9fe5f29c9e68 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3816,6 +3816,84 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
 	}
 }
 
+static void xelpd_load_plane_csc_matrix(const struct drm_plane_state *state,
+					const struct drm_property_blob *blob)
+{
+	struct intel_display *display = to_intel_display(state->plane->dev);
+	enum pipe pipe = to_intel_plane(state->plane)->pipe;
+	enum plane_id plane = to_intel_plane(state->plane)->id;
+	struct drm_color_ctm *ctm;
+	const u64 *input;
+	u16 coeffs[9] = {};
+	u16 postoff = 0;
+	int i;
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
+	intel_de_write_fw(display, PLANE_CSC_COEFF(pipe, plane, 0),
+			  coeffs[0] << 16 | coeffs[1]);
+	intel_de_write_fw(display, PLANE_CSC_COEFF(pipe, plane, 1),
+			  coeffs[2] << 16);
+
+	intel_de_write_fw(display, PLANE_CSC_COEFF(pipe, plane, 2),
+			  coeffs[3] << 16 | coeffs[4]);
+	intel_de_write_fw(display, PLANE_CSC_COEFF(pipe, plane, 3),
+			  coeffs[5] << 16);
+
+	intel_de_write_fw(display, PLANE_CSC_COEFF(pipe, plane, 4),
+			  coeffs[6] << 16 | coeffs[7]);
+	intel_de_write_fw(display, PLANE_CSC_COEFF(pipe, plane, 5),
+			  coeffs[8] << 16);
+
+	intel_de_write_fw(display, PLANE_CSC_PREOFF(pipe, plane, 0), 0);
+	intel_de_write_fw(display, PLANE_CSC_PREOFF(pipe, plane, 1), 0);
+	intel_de_write_fw(display, PLANE_CSC_PREOFF(pipe, plane, 2), 0);
+
+	intel_de_write_fw(display, PLANE_CSC_POSTOFF(pipe, plane, 0), postoff);
+	intel_de_write_fw(display, PLANE_CSC_POSTOFF(pipe, plane, 1), postoff);
+	intel_de_write_fw(display, PLANE_CSC_POSTOFF(pipe, plane, 2), postoff);
+}
+
 void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state,
 				       const struct drm_property_blob *blob)
 {
@@ -3883,6 +3961,7 @@ static const struct intel_color_funcs xelpd_color_funcs = {
 	.lut_equal = icl_lut_equal,
 	.read_csc = icl_read_csc,
 	.get_config = skl_get_config,
+	.load_plane_csc_matrix = xelpd_load_plane_csc_matrix,
 };
 
 static const struct intel_color_funcs icl_color_funcs = {
-- 
2.42.0

