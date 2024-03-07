Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BCB8749C2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 09:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BB71136EE;
	Thu,  7 Mar 2024 08:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSApQs/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031CE1136CC;
 Thu,  7 Mar 2024 08:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709800561; x=1741336561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3GLw80IAgklsAsJUUbolyi247xdQfuoHo7SWxtlMJqE=;
 b=OSApQs/R+IFyzoyBpj6hIHXyG0Gjl9+zFn0x2PyR7LK41k8TAuQcNdLr
 CA1HLi/GZxc5rIj/TIgcGZcra10rDAzks4a25xEhD+/VKchCvvL9/Qaia
 4Ck/tW2sDHDK990U8+3xcwbdtKjiJT0Oc4ifgGWiVjzUpeNmlXrb42qC3
 w37zkPv5LIydko2Sywg/VWvjhqCt+jVZqaTzttiU4hWKGUz9Dtj5gsLpH
 fp2tHKwB/8kZId+OsVnS/hCS1Q/L4/S2FBfe0j9kqjjgtwetP9hEkOP5R
 i088Mn7X0EZwh/Ne++VfDlKKpQQRHbhzKzkMHX771986r+Bv83rnuo8CQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15598037"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; d="scan'208";a="15598037"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 00:35:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="9937522"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa009.fm.intel.com with ESMTP; 07 Mar 2024 00:35:56 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 2/5] drm/i915/display: Compute the scaler filter coefficients
Date: Thu,  7 Mar 2024 14:02:34 +0530
Message-Id: <20240307083237.576177-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240307083237.576177-1-nemesa.garg@intel.com>
References: <20240307083237.576177-1-nemesa.garg@intel.com>
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

Scaler coefficient values are based on experiments
and vary for different tap value/win size. These values
are normalized by taking the sum of all values and then
dividing each value with a sum.

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_display.c  |   3 +
 .../drm/i915/display/intel_display_types.h    |   9 ++
 .../drm/i915/display/intel_sharpen_filter.c   | 121 ++++++++++++++++++
 .../drm/i915/display/intel_sharpen_filter.h   |  27 ++++
 drivers/gpu/drm/i915/i915_reg.h               |   2 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 7 files changed, 164 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_sharpen_filter.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_sharpen_filter.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index c13f14edb508..97d1cf705b40 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -305,6 +305,7 @@ i915-y += \
 	display/intel_pmdemand.o \
 	display/intel_psr.o \
 	display/intel_quirks.o \
+	display/intel_sharpen_filter.o \
 	display/intel_sprite.o \
 	display/intel_sprite_uapi.o \
 	display/intel_tc.o \
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7db0655d8c9e..5a93bbd1fe25 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2444,6 +2444,9 @@ static int intel_crtc_compute_config(struct intel_atomic_state *state,
 	if (crtc_state->has_pch_encoder)
 		return ilk_fdi_compute_config(crtc, crtc_state);
 
+	if (crtc_state->hw.casf_params.strength_changed)
+		intel_sharpness_scaler_compute_config(crtc_state);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 01eb6e4e6049..a7a24d177586 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -53,6 +53,7 @@
 #include "intel_display_limits.h"
 #include "intel_display_power.h"
 #include "intel_dpll_mgr.h"
+#include "intel_sharpen_filter.h"
 #include "intel_wm_types.h"
 
 struct drm_printer;
@@ -794,6 +795,13 @@ struct intel_scaler {
 	u32 mode;
 };
 
+struct intel_sharpen_filter {
+	struct scaler_filter_coeff coeff[7];
+	u32 scaler_coefficient[119];
+	bool strength_changed;
+	u8 win_size;
+};
+
 struct intel_crtc_scaler_state {
 #define SKL_NUM_SCALERS 2
 	struct intel_scaler scalers[SKL_NUM_SCALERS];
@@ -1075,6 +1083,7 @@ struct intel_crtc_state {
 		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
 		struct drm_display_mode mode, pipe_mode, adjusted_mode;
 		enum drm_scaling_filter scaling_filter;
+		struct intel_sharpen_filter casf_params;
 	} hw;
 
 	/* actual state of LUTs */
diff --git a/drivers/gpu/drm/i915/display/intel_sharpen_filter.c b/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
new file mode 100644
index 000000000000..366739d9dead
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ *
+ */
+
+#include "i915_reg.h"
+#include "intel_de.h"
+#include "intel_display_types.h"
+#include "skl_scaler.h"
+
+#define MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER 7
+#define SCALER_FILTER_NUM_TAPS 7
+#define SCALER_FILTER_NUM_PHASES 17
+#define filter_coeff_0_125 125
+#define filter_coeff_0_25 250
+#define filter_coeff_0_5 500
+#define filter_coeff_1_0 1000
+#define filter_coeff_0_0 0
+
+void intel_sharpen_filter_enable(struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	int id = crtc_state->scaler_state.scaler_id;
+
+	intel_de_write_fw(dev_priv, GLK_PS_COEF_INDEX_SET(crtc->pipe, id, 0),
+			  PS_COEF_INDEX_AUTO_INC);
+
+	intel_de_write_fw(dev_priv, GLK_PS_COEF_INDEX_SET(crtc->pipe, id, 1),
+			  PS_COEF_INDEX_AUTO_INC);
+
+	for (int index = 0; index < 60; index++) {
+		intel_de_write_fw(dev_priv, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 0),
+				  crtc_state->hw.casf_params.scaler_coefficient[index]);
+		intel_de_write_fw(dev_priv, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 1),
+				  crtc_state->hw.casf_params. scaler_coefficient[index]);
+	}
+}
+
+static void convert_sharpness_coef_binary(struct scaler_filter_coeff *coeff,
+					  u16 coefficient)
+{
+	if (coefficient < 25) {
+		coeff->mantissa = (coefficient * 2048) / 100;
+		coeff->exp = 3;
+	}
+
+	else if (coefficient < 50) {
+		coeff->mantissa = (coefficient * 1024) / 100;
+		coeff->exp = 2;
+	}
+
+	else if (coefficient < 100) {
+		coeff->mantissa = (coefficient * 512) / 100;
+		coeff->exp = 1;
+	} else {
+		coeff->mantissa = (coefficient * 256) / 100;
+		coeff->exp = 0;
+	}
+}
+
+static void intel_sharpness_filter_coeff(struct intel_crtc_state *crtc_state)
+{
+	u16 filtercoeff[MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER];
+	u16 sumcoeff = 0;
+	u8 i;
+
+	if (crtc_state->hw.casf_params.win_size == 0) {
+		filtercoeff[0] = filter_coeff_0_0;
+		filtercoeff[1] = filter_coeff_0_0;
+		filtercoeff[2] = filter_coeff_0_5;
+		filtercoeff[3] = filter_coeff_1_0;
+		filtercoeff[4] = filter_coeff_0_5;
+		filtercoeff[5] = filter_coeff_0_0;
+		filtercoeff[6] = filter_coeff_0_0;
+	}
+
+	else if (crtc_state->hw.casf_params.win_size == 1) {
+		filtercoeff[0] = filter_coeff_0_0;
+		filtercoeff[1] = filter_coeff_0_25;
+		filtercoeff[2] = filter_coeff_0_5;
+		filtercoeff[3] = filter_coeff_1_0;
+		filtercoeff[4] = filter_coeff_0_5;
+		filtercoeff[5] = filter_coeff_0_25;
+		filtercoeff[6] = filter_coeff_0_0;
+	} else {
+		filtercoeff[0] = filter_coeff_0_125;
+		filtercoeff[1] = filter_coeff_0_25;
+		filtercoeff[2] = filter_coeff_0_5;
+		filtercoeff[3] = filter_coeff_1_0;
+		filtercoeff[4] = filter_coeff_0_5;
+		filtercoeff[5] = filter_coeff_0_25;
+		filtercoeff[6] = filter_coeff_0_125;
+	}
+
+	for (i = 0; i < MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER; i++)
+		sumcoeff += filtercoeff[i];
+
+	for (i = 0; i < MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER; i++) {
+		filtercoeff[i] = (filtercoeff[i] * 100 / sumcoeff);
+		convert_sharpness_coef_binary(&crtc_state->hw.casf_params.coeff[i],
+					      filtercoeff[i]);
+	}
+}
+
+void intel_sharpness_scaler_compute_config(struct intel_crtc_state *crtc_state)
+{
+	u16 phase, tapindex, phaseoffset;
+	u16 *coeff = (u16 *)crtc_state->hw.casf_params.scaler_coefficient;
+
+	intel_sharpness_filter_coeff(crtc_state);
+
+	for (phase = 0; phase < SCALER_FILTER_NUM_PHASES; phase++) {
+		phaseoffset = SCALER_FILTER_NUM_TAPS * phase;
+		for (tapindex = 0; tapindex < SCALER_FILTER_NUM_TAPS; tapindex++) {
+			coeff[phaseoffset + tapindex] =
+				SHARP_COEFF_TO_REG_FORMAT(crtc_state->hw.casf_params.coeff[tapindex]);
+		}
+	}
+}
diff --git a/drivers/gpu/drm/i915/display/intel_sharpen_filter.h b/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
new file mode 100644
index 000000000000..6b668aaedf65
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __INTEL_SHARPEN_FLITER_H__
+#define __INTEL_SHARPEN_FILTER_H__
+
+#include <linux/types.h>
+
+#define SHARP_COEFF_TO_REG_FORMAT(coefficient) ((u16)(coefficient.sign << 15 | \
+			coefficient.exp << 12 | coefficient.mantissa << 3))
+
+struct intel_crtc;
+struct intel_crtc_state;
+struct intel_atomic_state;
+
+struct scaler_filter_coeff {
+	u16 sign;
+	u16 exp;
+	u16 mantissa;
+};
+
+void intel_sharpen_filter_enable(struct intel_crtc_state *crtc_state);
+void intel_sharpness_scaler_compute_config(struct intel_crtc_state *crtc_state);
+
+#endif /* __INTEL_SHARPEN_FLITER_H__ */
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index e00557e1a57f..9d759026add4 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -4072,6 +4072,8 @@
 #define   PS_VERT_INT_INVERT_FIELD		REG_BIT(20)
 #define   PS_PROG_SCALE_FACTOR			REG_BIT(19) /* tgl+ */
 #define   PS_PWRUP_PROGRESS			REG_BIT(17)
+#define   PS_BYPASS_ARMING			REG_BIT(10)
+#define   PS_DB_STALL				REG_BIT(9)
 #define   PS_V_FILTER_BYPASS			REG_BIT(8)
 #define   PS_VADAPT_EN				REG_BIT(7) /* skl/bxt */
 #define   PS_VADAPT_MODE_MASK			REG_GENMASK(6, 5) /* skl/bxt */
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c531210695db..4148eb015c11 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -269,6 +269,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_psr.o \
 	i915-display/intel_qp_tables.o \
 	i915-display/intel_quirks.o \
+	i915-display/intel_sharpen_filter.o \
 	i915-display/intel_snps_phy.o \
 	i915-display/intel_tc.o \
 	i915-display/intel_vblank.o \
-- 
2.25.1

