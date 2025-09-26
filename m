Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FD7BA381C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 13:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4904010EA3A;
	Fri, 26 Sep 2025 11:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdGODOX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD3310EA36;
 Fri, 26 Sep 2025 11:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758886934; x=1790422934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UAkFBn36GxAO554Mwv4m9Oqs/u5adjaaJzrmrgFFAxs=;
 b=bdGODOX9hnWaP4nzZR2/BOsxRIQH2P98e7eEPRvXSetTH9o47ZyW36hg
 DzoSDmaxZCIycPgxVCClWCgcJR9kEhtsbCUnC6e/OYgmOyp+cPPoF1QoW
 aD/OkjTse0/j4bKBD6sZvL5DZ6UH0g1B9nUIYmOVfENHon/oWqxZG3xLR
 1fi4l2nRgwlUk30wKtbmt3zjrlSMmkAKO4OTjBK2xYkjQ35xq55j49vKO
 9Zc+aC0Ma7Rf0DJ1YS2iSrG5cSF2J8Wi7MjURi+NCUj3yYfGs0jqELT/U
 xTkaIvMy99EZxDBm/Z5+ubyIZE0qe0acP3OEufINn6Dty8He4fcfV7H4s Q==;
X-CSE-ConnectionGUID: flnV9CJvSvyuUZA7OPrEAw==
X-CSE-MsgGUID: XScJmUCCTNiGPGwKrInBrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78860086"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="78860086"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:42:14 -0700
X-CSE-ConnectionGUID: tT9FZbizT+6K8vImV9b9Hg==
X-CSE-MsgGUID: NberAXUmRrCKkYz35VRKFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="176723463"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa006.jf.intel.com with ESMTP; 26 Sep 2025 04:42:12 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 05/10] drm/i915/display: Compute the scaler coefficients
Date: Fri, 26 Sep 2025 17:07:23 +0530
Message-Id: <20250926113728.606315-6-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250926113728.606315-1-nemesa.garg@intel.com>
References: <20250926113728.606315-1-nemesa.garg@intel.com>
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

The sharpness property requires the use of one of the scaler
so need to set the sharpness scaler coefficient values.
These values are based on experiments and vary for different
tap value/win size. These values are normalized by taking the
sum of all values and then dividing each value with a sum.

v2: Fix ifndef header naming issue reported by kernel test robot
v3: Rename file name[Arun]
    Replace array size number with macro[Arun]
v4: Correct the register format[Jani]
    Add brief comment and expalin about file[Jani]
    Remove coefficient value from crtc_state[Jani]
v5: Fix build issue
v6: Add new function for writing coefficients[Ankit]
v7: Add cooments and add a scaler id check [Ankit]
v8: Remove casf_enable from here[Ankit]
v9: Removed REG and use shift operator[Jani]
v10: Introduce the casf_enable function
     Remove filter macros from here

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c     | 102 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h     |   2 +
 .../drm/i915/display/intel_display_types.h    |   8 ++
 3 files changed, 112 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index 45bc67377d21..63efba10d6f2 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -133,6 +133,8 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
 
 	intel_casf_compute_win_size(crtc_state);
 
+	intel_casf_scaler_compute_config(crtc_state);
+
 	return 0;
 }
 
@@ -155,3 +157,103 @@ void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state)
 			REG_FIELD_GET(FILTER_SIZE_MASK, sharp);
 	}
 }
+
+static int casf_coeff_tap(int i)
+{
+	return i % SCALER_FILTER_NUM_TAPS;
+}
+
+static u32 casf_coeff(struct intel_crtc_state *crtc_state, int t)
+{
+	struct scaler_filter_coeff value;
+	u32 coeff;
+
+	value = crtc_state->hw.casf_params.coeff[t];
+	value.sign = 0;
+
+	coeff = value.sign << 15 | value.exp << 12 | value.mantissa << 3;
+	return coeff;
+}
+
+/*
+ * 17 phase of 7 taps requires 119 coefficients in 60 dwords per set.
+ * To enable casf:  program scaler coefficients with the coeffients
+ * that are calculated and stored in hw.casf_params.coeff as per
+ * SCALER_COEFFICIENT_FORMAT
+ */
+static void intel_casf_write_coeff(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	int id = crtc_state->scaler_state.scaler_id;
+	int i;
+
+	if (id != 1) {
+		drm_WARN(display->drm, 0, "Second scaler not enabled\n");
+		return;
+	}
+
+	intel_de_write_fw(display, GLK_PS_COEF_INDEX_SET(crtc->pipe, id, 0),
+			  PS_COEF_INDEX_AUTO_INC);
+
+	for (i = 0; i < 17 * SCALER_FILTER_NUM_TAPS; i += 2) {
+		u32 tmp;
+		int t;
+
+		t = casf_coeff_tap(i);
+		tmp = casf_coeff(crtc_state, t);
+
+		t = casf_coeff_tap(i + 1);
+		tmp |= casf_coeff(crtc_state, t) << 16;
+
+		intel_de_write_fw(display, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 0),
+				  tmp);
+	}
+}
+
+static void convert_sharpness_coef_binary(struct scaler_filter_coeff *coeff,
+					  u16 coefficient)
+{
+	if (coefficient < 25) {
+		coeff->mantissa = (coefficient * 2048) / 100;
+		coeff->exp = 3;
+	} else if (coefficient < 50) {
+		coeff->mantissa = (coefficient * 1024) / 100;
+		coeff->exp = 2;
+	} else if (coefficient < 100) {
+		coeff->mantissa = (coefficient * 512) / 100;
+		coeff->exp = 1;
+	} else {
+		coeff->mantissa = (coefficient * 256) / 100;
+		coeff->exp = 0;
+	}
+}
+
+void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
+{
+	const u16 *filtercoeff;
+	u16 filter_coeff[SCALER_FILTER_NUM_TAPS];
+	u16 sumcoeff = 0;
+	int i;
+
+	if (crtc_state->hw.casf_params.win_size == 0)
+		filtercoeff = filtercoeff_1;
+	else if (crtc_state->hw.casf_params.win_size == 1)
+		filtercoeff = filtercoeff_2;
+	else
+		filtercoeff = filtercoeff_3;
+
+	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++)
+		sumcoeff += *(filtercoeff + i);
+
+	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++) {
+		filter_coeff[i] = (*(filtercoeff + i) * 100 / sumcoeff);
+		convert_sharpness_coef_binary(&crtc_state->hw.casf_params.coeff[i],
+					      filter_coeff[i]);
+	}
+}
+
+void intel_casf_enable(struct intel_crtc_state *crtc_state)
+{
+	intel_casf_write_coeff(crtc_state);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
index 3edbc3ad51cf..ddd7e00ba52d 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.h
+++ b/drivers/gpu/drm/i915/display/intel_casf.h
@@ -16,5 +16,7 @@ void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
 void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state);
 void intel_casf_filter_lut_load(struct intel_crtc *crtc,
 				const struct intel_crtc_state *crtc_state);
+void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
+void intel_casf_enable(struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CASF_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index a9642641f702..b03d94e6e96b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -946,7 +946,15 @@ struct intel_csc_matrix {
 	u16 postoff[3];
 };
 
+struct scaler_filter_coeff {
+	u16 sign;
+	u16 exp;
+	u16 mantissa;
+};
+
 struct intel_casf {
+#define SCALER_FILTER_NUM_TAPS 7
+	struct scaler_filter_coeff coeff[SCALER_FILTER_NUM_TAPS];
 	u8 strength;
 	u8 win_size;
 	bool casf_enable;
-- 
2.25.1

