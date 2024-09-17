Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BEC97ADD6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 11:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D92D10E44E;
	Tue, 17 Sep 2024 09:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ILyqUGrN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42F510E44C;
 Tue, 17 Sep 2024 09:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726565218; x=1758101218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h44K62pB2weucxX5xc7OLq6Qiu/UYAXUNC70yt/j+7A=;
 b=ILyqUGrNdoHI0lDQdKGFVQYSiKWDEMJeedxUsOGk80/Zy6RToOQYL4IS
 DwgumwK7HC0Xn0XVKiqGmi2cm25iSqzzaoqH/7yd3zTsqP7tlK2B43MCe
 uy+pEoL67yC4XtV3D0zzmY1sb+FJ8uShkP7I+/l+ZDmBME8fNlQZ+LpCb
 E9uj4KkoKUxc9AbXCXT4FWBItJTWgmMLksWZ+ha9TJbSFIHeFXcXDU3vP
 Ei2oMsLR+JOrCdaG3Uzu1omp1+Pqybkhmw/+IVW4zGLAjcm75024S2j6b
 uGmDOrXMo2LogEfJ7uLJ7y0khhrqyiq1CeD3Ya7jc6pc/az8aCVscpLq0 w==;
X-CSE-ConnectionGUID: MKuCLlNXThaluPzMXHWong==
X-CSE-MsgGUID: zoyNt5v4Suy7eGP9c+MQKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36789037"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="36789037"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 02:26:58 -0700
X-CSE-ConnectionGUID: dpFWG49pTFqiZK15fthDlw==
X-CSE-MsgGUID: AfOp+nAbSW65yrGI6+CqLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="99815986"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa002.jf.intel.com with ESMTP; 17 Sep 2024 02:26:56 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH v3 2/5] drm/i915/display: Compute the scaler filter
 coefficients
Date: Tue, 17 Sep 2024 14:56:31 +0530
Message-Id: <20240917092634.1109572-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240917092634.1109572-1-nemesa.garg@intel.com>
References: <20240917092634.1109572-1-nemesa.garg@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_display.c  |   2 +
 .../drm/i915/display/intel_display_types.h    |   2 +
 .../drm/i915/display/intel_sharpness_filter.c | 106 ++++++++++++++++++
 .../drm/i915/display/intel_sharpness_filter.h |  38 +++++++
 drivers/gpu/drm/i915/i915_reg.h               |   2 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 7 files changed, 152 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_sharpness_filter.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_sharpness_filter.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index c63fa2133ccb..28e5f3b95371 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -280,6 +280,7 @@ i915-y += \
 	display/intel_pmdemand.o \
 	display/intel_psr.o \
 	display/intel_quirks.o \
+	display/intel_sharpness_filter.o \
 	display/intel_sprite.o \
 	display/intel_sprite_uapi.o \
 	display/intel_tc.o \
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b4ef4d59da1a..e447a316ec38 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5917,6 +5917,8 @@ static int intel_atomic_check_planes(struct intel_atomic_state *state)
 		if (ret)
 			return ret;
 
+		intel_sharpness_scaler_compute_config(new_crtc_state);
+
 		/*
 		 * On some platforms the number of active planes affects
 		 * the planes' minimum cdclk calculation. Add such planes
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index f29e5dc3db91..5636f9b60d5d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -56,6 +56,7 @@
 #include "intel_display_power.h"
 #include "intel_dpll_mgr.h"
 #include "intel_wm_types.h"
+#include "intel_sharpness_filter.h"
 
 struct drm_printer;
 struct __intel_global_objs_state;
@@ -1072,6 +1073,7 @@ struct intel_crtc_state {
 		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
 		struct drm_display_mode mode, pipe_mode, adjusted_mode;
 		enum drm_scaling_filter scaling_filter;
+		struct intel_sharpness_filter casf_params;
 	} hw;
 
 	/* actual state of LUTs */
diff --git a/drivers/gpu/drm/i915/display/intel_sharpness_filter.c b/drivers/gpu/drm/i915/display/intel_sharpness_filter.c
new file mode 100644
index 000000000000..e5fbffbe0428
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_sharpness_filter.c
@@ -0,0 +1,106 @@
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
+#define FILTER_COEFF_0_125 125
+#define FILTER_COEFF_0_25 250
+#define FILTER_COEFF_0_5 500
+#define FILTER_COEFF_1_0 1000
+#define FILTER_COEFF_0_0 0
+
+const u16 filtercoeff_1[] = {FILTER_COEFF_0_0, FILTER_COEFF_0_0,
+FILTER_COEFF_0_5, FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_0, FILTER_COEFF_0_0};
+
+const u16 filtercoeff_2[] = {FILTER_COEFF_0_0, FILTER_COEFF_0_25,
+FILTER_COEFF_0_5, FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25, FILTER_COEFF_0_0};
+
+const u16 filtercoeff_3[] = {FILTER_COEFF_0_125, FILTER_COEFF_0_25,
+FILTER_COEFF_0_5, FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25, FILTER_COEFF_0_125};
+
+void intel_sharpness_filter_enable(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	int id = crtc_state->scaler_state.scaler_id;
+
+	intel_de_write_fw(display, GLK_PS_COEF_INDEX_SET(crtc->pipe, id, 0),
+			  PS_COEF_INDEX_AUTO_INC);
+
+	intel_de_write_fw(display, GLK_PS_COEF_INDEX_SET(crtc->pipe, id, 1),
+			  PS_COEF_INDEX_AUTO_INC);
+
+	for (int index = 0; index < 60; index++) {
+		intel_de_write_fw(display, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 0),
+				  crtc_state->hw.casf_params.scaler_coefficient[index]);
+		intel_de_write_fw(display, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 1),
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
+static void intel_sharpness_filter_coeff(struct intel_crtc_state *crtc_state)
+{
+	const u16 *filtercoeff;
+	u16 filter_coeff[MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER];
+	u16 sumcoeff = 0;
+	u8 i;
+
+	if (crtc_state->hw.casf_params.win_size == 0)
+		filtercoeff = filtercoeff_1;
+	else if (crtc_state->hw.casf_params.win_size == 1)
+		filtercoeff = filtercoeff_2;
+	else
+		filtercoeff = filtercoeff_3;
+
+	for (i = 0; i < MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER; i++)
+		sumcoeff += *(filtercoeff + i);
+
+	for (i = 0; i < MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER; i++) {
+		filter_coeff[i] = (*(filtercoeff + i) * 100 / sumcoeff);
+		convert_sharpness_coef_binary(&crtc_state->hw.casf_params.coeff[i],
+					      filter_coeff[i]);
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
diff --git a/drivers/gpu/drm/i915/display/intel_sharpness_filter.h b/drivers/gpu/drm/i915/display/intel_sharpness_filter.h
new file mode 100644
index 000000000000..d1dc65e747fe
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_sharpness_filter.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __INTEL_SHARPNESS_FILTER_H__
+#define __INTEL_SHARPNESS_FILTER_H__
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
+struct intel_sharpness_filter {
+#define SCALER_FILTER_NUM_TAPS 7
+#define SCLAER_FILTER_COEFF 119
+	struct scaler_filter_coeff coeff[SCALER_FILTER_NUM_TAPS];
+	u32 scaler_coefficient[SCLAER_FILTER_COEFF];
+	bool strength_changed;
+	u8 win_size;
+	bool need_scaler;
+	u8 strength;
+};
+
+void intel_sharpness_filter_enable(struct intel_crtc_state *crtc_state);
+void intel_sharpness_scaler_compute_config(struct intel_crtc_state *crtc_state);
+
+#endif /* __INTEL_SHARPEN_FILTER_H__ */
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 41f4350a7c6c..84b05b57ad52 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2257,6 +2257,8 @@
 #define   PS_VERT_INT_INVERT_FIELD		REG_BIT(20)
 #define   PS_PROG_SCALE_FACTOR			REG_BIT(19) /* tgl+ */
 #define   PS_PWRUP_PROGRESS			REG_BIT(17)
+#define   PS_BYPASS_ARMING			REG_BIT(10)
+#define   PS_DB_STALL				REG_BIT(9)
 #define   PS_V_FILTER_BYPASS			REG_BIT(8)
 #define   PS_VADAPT_EN				REG_BIT(7) /* skl/bxt */
 #define   PS_VADAPT_MODE_MASK			REG_GENMASK(6, 5) /* skl/bxt */
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8f1c5c329f79..26b4b516c9ec 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -254,6 +254,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_psr.o \
 	i915-display/intel_qp_tables.o \
 	i915-display/intel_quirks.o \
+	i915-display/intel_sharpness_filter.o \
 	i915-display/intel_snps_phy.o \
 	i915-display/intel_tc.o \
 	i915-display/intel_vblank.o \
-- 
2.25.1

