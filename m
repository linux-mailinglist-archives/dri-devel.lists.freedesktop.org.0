Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D828AF0F20
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA9910E699;
	Wed,  2 Jul 2025 09:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KulCfcJE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E67010E697;
 Wed,  2 Jul 2025 09:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447318; x=1782983318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EwYrCcLwyJctf9Pok6syM97DgTdb+3fMKLLse/O8sI0=;
 b=KulCfcJE88Gu0AHGZb76CIXsHALxy6xOS3UUHBZ4RigheUREuUJGpyf2
 4pwK6sqQIs1uoRS2CiRlPGXnPGvzRbBXJ6iivU16rhPyRXKOxlSsWBpoS
 We4CjwReu9OFnMqAh4Lv7a1dPa2gmN+r+c3Q7MIjXoHNvUz0ozVaAw219
 05ogLp9XuGl76FY2R5pfwQCg5fuamQdVboPGiIVN1nol8t2n3koNnXa5j
 HpPOb87Ks8DHkSNy3HyBTN/vbrZQqjI2tYwGafD+hkmE4xV60LXnyyOtH
 xOhsWQaPrrKW7NqZIEkiyzRo6fNf0quc2lllQtpQU5F9MMjUa/is6A0hI A==;
X-CSE-ConnectionGUID: 76IExaEfTSG09OYXrs/BcQ==
X-CSE-MsgGUID: j3wFTt+qRZ2qG6cUUDlugw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427192"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64427192"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:08:38 -0700
X-CSE-ConnectionGUID: cZ5vlD5CQACIFIaX4w9gIA==
X-CSE-MsgGUID: +Bg+8FoZRb+vWNT511leyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536666"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:08:34 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 16/24] drm/i915/color: Add plane CTM callback for D13 and beyond
Date: Wed,  2 Jul 2025 14:49:28 +0530
Message-ID: <20250702091936.3004854-17-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250702091936.3004854-1-uma.shankar@intel.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
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

v2:
- Add dsb support
- Pass plane_state as we are now doing a uapi to hw state copy
- Add support for 3x4 matrix

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index dcf7cfa722ef..25b992939e42 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3846,6 +3846,101 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
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
+	 * Conversion from S31.32 to S0.12. BIT[12] is the signed but
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
@@ -3904,6 +3999,7 @@ static const struct intel_color_funcs xelpd_color_funcs = {
 	.lut_equal = icl_lut_equal,
 	.read_csc = icl_read_csc,
 	.get_config = skl_get_config,
+	.load_plane_csc_matrix = xelpd_load_plane_csc_matrix,
 };
 
 static const struct intel_color_funcs icl_color_funcs = {
-- 
2.42.0

