Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C62B9D333A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 06:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED3510E38C;
	Wed, 20 Nov 2024 05:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZC4c82HP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE2510E38C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 05:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732081503; x=1763617503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JCwUWzeQ7ZmCOLVrVzlx2U/a4HZTGVGpRrD1mb2IAQ4=;
 b=ZC4c82HPPRwoEvQus6jwQQDF3JLIDcZq6oQrptaPVIucEYIe3b/CHlkL
 DQfEJZWhNlHihr1N2L5tluYVXsz0Hjc0scUbsxzwO0kFaEFm6g3YtTXpf
 j7YGDYdVzPNes8Y5xQEWrCvIC6Hazitk2VekGQb862injTvWrdjxmjSnv
 /k3F/VVH59LHLZkSRihh7RLYdHXOk5NhG5kWnH9cuExvUpuMjGSsCN25h
 hCl2ByeOW+GsjwZWbMxoKrBHf+43hy+zk/+DahEPN41darQ1UyoZn9G7w
 Fejm6bQYCPJrvu2gIffCFy/sLYMu9ZCnMjvY6gfZhFg/y6BUgg/hfFpXq A==;
X-CSE-ConnectionGUID: oudJibLpSimCRCGaKn0GMQ==
X-CSE-MsgGUID: p0iFS9d2RC2VB+B57ddGTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31867790"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="31867790"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 21:45:03 -0800
X-CSE-ConnectionGUID: 1xXmtMtTQAq2CqUbBWLoXQ==
X-CSE-MsgGUID: lgvnNSvdRg6kZjguDyrq4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="89606900"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa007.fm.intel.com with ESMTP; 19 Nov 2024 21:45:02 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Naga Venkata Srikanth V <nagavenkata.srikanth.v@intel.com>
Subject: [PATCH 2/5] drm/i915/display: Compute the scaler filter coefficients
Date: Wed, 20 Nov 2024 11:16:10 +0530
Message-Id: <20241120054613.3797587-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241120054613.3797587-1-nemesa.garg@intel.com>
References: <20241120054613.3797587-1-nemesa.garg@intel.com>
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
v5: Fix build issue

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Naga Venkata Srikanth V <nagavenkata.srikanth.v@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_casf.c     | 128 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h     |  16 +++
 .../gpu/drm/i915/display/intel_casf_regs.h    |  19 +++
 drivers/gpu/drm/i915/display/intel_display.c  |   3 +
 .../drm/i915/display/intel_display_types.h    |  14 ++
 drivers/gpu/drm/i915/i915_reg.h               |   2 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 8 files changed, 184 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 31710d98cad5..b3ca13df8c58 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -283,6 +283,7 @@ i915-y += \
 	display/intel_pmdemand.o \
 	display/intel_psr.o \
 	display/intel_quirks.o \
+	display/intel_casf.o \
 	display/intel_sprite.o \
 	display/intel_sprite_uapi.o \
 	display/intel_tc.o \
diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
new file mode 100644
index 000000000000..d186dea75cbf
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -0,0 +1,128 @@
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
+void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
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
index e790a2de5b3d..86d5f916dfe1 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -111,6 +111,7 @@
 #include "intel_psr.h"
 #include "intel_psr_regs.h"
 #include "intel_sdvo.h"
+#include "intel_casf.h"
 #include "intel_snps_phy.h"
 #include "intel_tc.h"
 #include "intel_tdf.h"
@@ -6193,6 +6194,8 @@ static int intel_atomic_check_planes(struct intel_atomic_state *state)
 		if (ret)
 			return ret;
 
+		intel_casf_scaler_compute_config(new_crtc_state);
+
 		/*
 		 * On some platforms the number of active planes affects
 		 * the planes' minimum cdclk calculation. Add such planes
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 339e4b0f7698..19a671848f42 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -909,6 +909,19 @@ struct intel_csc_matrix {
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
 void intel_io_mmio_fw_write(void *ctx, i915_reg_t reg, u32 val);
 
 typedef void (*intel_io_reg_write)(void *ctx, i915_reg_t reg, u32 val);
@@ -949,6 +962,7 @@ struct intel_crtc_state {
 		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
 		struct drm_display_mode mode, pipe_mode, adjusted_mode;
 		enum drm_scaling_filter scaling_filter;
+		struct intel_casf casf_params;
 	} hw;
 
 	/* actual state of LUTs */
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 7a35be56b7ef..2458bad38e74 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2203,6 +2203,8 @@
 #define   PS_VERT_INT_INVERT_FIELD		REG_BIT(20)
 #define   PS_PROG_SCALE_FACTOR			REG_BIT(19) /* tgl+ */
 #define   PS_PWRUP_PROGRESS			REG_BIT(17)
+#define   PS_BYPASS_ARMING			REG_BIT(10)
+#define   PS_DB_STALL				REG_BIT(9)
 #define   PS_V_FILTER_BYPASS			REG_BIT(8)
 #define   PS_VADAPT_EN				REG_BIT(7) /* skl/bxt */
 #define   PS_VADAPT_MODE_MASK			REG_GENMASK(6, 5) /* skl/bxt */
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a93e6fcc0ad9..fbc45a66b429 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -260,6 +260,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_psr.o \
 	i915-display/intel_qp_tables.o \
 	i915-display/intel_quirks.o \
+	i915-display/intel_casf.o \
 	i915-display/intel_snps_phy.o \
 	i915-display/intel_tc.o \
 	i915-display/intel_vblank.o \
-- 
2.25.1

