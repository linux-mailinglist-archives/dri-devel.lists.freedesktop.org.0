Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9416C99C855
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 13:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3EB10E42C;
	Mon, 14 Oct 2024 11:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVnqqOZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A614E10E42C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 11:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728904390; x=1760440390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+4j8gmObtxkyuwKjkgR/XDLA0wjlR4I2COWfEtjo8ZU=;
 b=GVnqqOZpudZhm7laNoGS3IgYk4A9eQENw8pA2uDbVeK+7PT2gtwE7So/
 UPpcrnyYxl+Ryn96vf9/TPpqt/6qMIfp05QghzFpZRb4vf/6YoqGvKWms
 cYyw6v4lMJLQVXm+gkc6RPUKioDq82S2kGFATBEABq80drI0lp0wFo7I7
 OE5Onve+O2NfbPlSo94jAZhwfAjCnaUjZELuXRc5HQ42EWu7RgibRK8zj
 ou3j5eOCBA28GhRo+fMCttTGIu/vIoyTZrcWKJlbksr/I/XwxjzwPfCiQ
 ywjFF5UsSd8Y7Z/R8RFt+9dJ1DsWLYlz+raQL7QMSHCvJc0PitBTcameV Q==;
X-CSE-ConnectionGUID: revheDj7T7quBhH5xi1gGw==
X-CSE-MsgGUID: ZuGfIAQQRNuxUyL+3A3e9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28377998"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="28377998"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 04:13:10 -0700
X-CSE-ConnectionGUID: RTMEEvf6SmyOLSl3M1o/oA==
X-CSE-MsgGUID: EUYMlIc6TfGThQLSN8vipA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77473430"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa010.jf.intel.com with ESMTP; 14 Oct 2024 04:13:08 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH v4 2/5] drm/i915/display: Compute the scaler filter
 coefficients
Date: Mon, 14 Oct 2024 16:43:46 +0530
Message-Id: <20241014111349.95435-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241014111349.95435-1-nemesa.garg@intel.com>
References: <20241014111349.95435-1-nemesa.garg@intel.com>
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
v4: Correct the register format[Jani]
    Add brief comment and expalin about file[Jani]
    Remove coefficient value from crtc_state[Jani]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_casf.c     | 131 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h     |  16 +++
 .../gpu/drm/i915/display/intel_casf_regs.h    |  19 +++
 drivers/gpu/drm/i915/display/intel_display.c  |   3 +
 .../drm/i915/display/intel_display_types.h    |  14 ++
 drivers/gpu/drm/i915/i915_reg.h               |   2 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 8 files changed, 187 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index c63fa2133ccb..ba3c33ca3149 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -280,6 +280,7 @@ i915-y += \
 	display/intel_pmdemand.o \
 	display/intel_psr.o \
 	display/intel_quirks.o \
+	display/intel_casf.o \
 	display/intel_sprite.o \
 	display/intel_sprite_uapi.o \
 	display/intel_tc.o \
diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
new file mode 100644
index 000000000000..75c1ae37ae1e
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ *
+ */
+#include "i915_reg.h"
+#include "intel_de.h"
+#include "intel_display_types.h"
+#include "intel_casf.h"
+#include "intel_casf_regs.h"
+#include "skl_scaler.h"
+
+#define FILTER_COEFF_0_125 125
+#define FILTER_COEFF_0_25 250
+#define FILTER_COEFF_0_5 500
+#define FILTER_COEFF_1_0 1000
+#define FILTER_COEFF_0_0 0
+#define SET_POSITIVE_SIGN(x) ((x) & (~SIGN))
+
+/**
+ * DOC: Content Adaptive Sharpness Filter (CASF)
+ *
+ * From LNL onwards the display engine based adaptive
+ * sharpening filter is supported. This helps in
+ * improving the image quality. The display hardware
+ * uses one of the pipe scaler for implementing casf.
+ * It works on a region of pixels depending on the
+ * tap size. The coefficients are used to generate an
+ * alpha value which is used to blend the sharpened image
+ * to original image.
+ */
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
+static int casf_coef_tap(int i)
+{
+	return i % 7;
+}
+
+static u16 casf_coef(struct intel_crtc_state *crtc_state, int t)
+{
+	struct scaler_filter_coeff value;
+	u16 coeff;
+
+	value = crtc_state->hw.casf_params.coeff[t];
+	coeff = SET_POSITIVE_SIGN(0) | EXPONENT(value.exp) | MANTISSA(value.mantissa);
+
+	return coeff;
+}
+
+void intel_casf_enable(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	int id = crtc_state->scaler_state.scaler_id;
+	int i;
+
+	intel_de_write_fw(display, GLK_PS_COEF_INDEX_SET(crtc->pipe, id, 0),
+			  PS_COEF_INDEX_AUTO_INC);
+
+	intel_de_write_fw(display, GLK_PS_COEF_INDEX_SET(crtc->pipe, id, 1),
+			  PS_COEF_INDEX_AUTO_INC);
+
+	for (i = 0; i < 17 * 7; i += 2) {
+		u32 tmp;
+		int t;
+
+		t = casf_coef_tap(i);
+		tmp = casf_coef(crtc_state, t);
+
+		t = casf_coef_tap(i + 1);
+		tmp |= casf_coef(crtc_state, t) << 16;
+
+		intel_de_write_fw(display, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 0),
+				  tmp);
+		intel_de_write_fw(display, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 1),
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
+static void intel_casf_coeff(struct intel_crtc_state *crtc_state)
+{
+	const u16 *filtercoeff;
+	u16 filter_coeff[SCALER_FILTER_NUM_TAPS];
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
+void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
+{
+	intel_casf_coeff(crtc_state);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
new file mode 100644
index 000000000000..8e0b67a2fd99
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_casf.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __INTEL_CASF_H__
+#define __INTEL_CASF_H__
+
+#include <linux/types.h>
+
+struct intel_crtc_state;
+
+void intel_casf_enable(struct intel_crtc_state *crtc_state);
+void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
+
+#endif /* __INTEL_CASF_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
new file mode 100644
index 000000000000..0b3fcdb22c0c
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __INTEL_CASF_REGS_H__
+#define __INTEL_CASF_REGS_H__
+
+#include "intel_display_reg_defs.h"
+
+/* Scaler Coefficient structure */
+#define SIGN				REG_BIT(15)
+#define EXPONENT_MASK			REG_GENMASK(13, 12)
+#define EXPONENT(x)			REG_FIELD_PREP(EXPONENT_MASK, (x))
+#define MANTISSA_MASK			REG_GENMASK(11, 3)
+#define MANTISSA(x)			REG_FIELD_PREP(MANTISSA_MASK, (x))
+
+#endif /* __INTEL_CASF_REGS__ */
+
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b4ef4d59da1a..224fd0c84f18 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -112,6 +112,7 @@
 #include "intel_psr.h"
 #include "intel_psr_regs.h"
 #include "intel_sdvo.h"
+#include "intel_casf.h"
 #include "intel_snps_phy.h"
 #include "intel_tc.h"
 #include "intel_tdf.h"
@@ -5917,6 +5918,8 @@ static int intel_atomic_check_planes(struct intel_atomic_state *state)
 		if (ret)
 			return ret;
 
+		intel_casf_scaler_compute_config(new_crtc_state);
+
 		/*
 		 * On some platforms the number of active planes affects
 		 * the planes' minimum cdclk calculation. Add such planes
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index f29e5dc3db91..de3867faa4d7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1036,6 +1036,19 @@ struct intel_csc_matrix {
 	u16 postoff[3];
 };
 
+struct scaler_filter_coeff {
+	u16 sign;
+	u16 exp;
+	u16 mantissa;
+};
+
+struct intel_casf {
+#define SCALER_FILTER_NUM_TAPS 7
+	struct scaler_filter_coeff coeff[SCALER_FILTER_NUM_TAPS];
+	u8 win_size;
+	bool need_scaler;
+};
+
 struct intel_crtc_state {
 	/*
 	 * uapi (drm) state. This is the software state shown to userspace.
@@ -1072,6 +1085,7 @@ struct intel_crtc_state {
 		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
 		struct drm_display_mode mode, pipe_mode, adjusted_mode;
 		enum drm_scaling_filter scaling_filter;
+		struct intel_casf casf_params;
 	} hw;
 
 	/* actual state of LUTs */
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
index 8f1c5c329f79..59dc97f30caa 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -254,6 +254,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_psr.o \
 	i915-display/intel_qp_tables.o \
 	i915-display/intel_quirks.o \
+	i915-display/intel_casf.o \
 	i915-display/intel_snps_phy.o \
 	i915-display/intel_tc.o \
 	i915-display/intel_vblank.o \
-- 
2.25.1

