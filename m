Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB182A7FBEE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 12:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E03710E63E;
	Tue,  8 Apr 2025 10:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fiT+OH7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29ED10E639;
 Tue,  8 Apr 2025 10:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744108203; x=1775644203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7iWZ2Pcbn/t98YAAi51OmZwmoQT7Lt8/oI7g2GjbHJk=;
 b=fiT+OH7gjYXVnUnAbMBK98lfJuBSimYmxluIVUgTBC4TAmxv4uO1ayrs
 b1FibPhzsAic4IZygooO4gOH+ndWHej7fr81cfIIJgyji0o7XNxAnRkus
 4p8smL9wUIYN7ERXJYERsihDDYOXq3bi/jQxrVWHCVOTlsyF+U2X2vvI6
 4NhYDdWOMzYVwjLuAij2bScL0zjAufAWVgO9yvovm+sQwPqRyNTVUj7Zf
 Y1jjA4RJLMidA7b4hs06K43s3yTJySUOdrCHsESGmlmRiwxp/Jlhc1SZ0
 gU6a3p9Sg1oVMnY5ifFmWKD8nfbpcWp1G/ntfQyQPPhEhrHXZTHLnMQm2 w==;
X-CSE-ConnectionGUID: wSu7nM0KSC6QTY1n6r36cg==
X-CSE-MsgGUID: krMO0a9bQJi14en1z7cmuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62934153"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="62934153"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 03:30:03 -0700
X-CSE-ConnectionGUID: mXd18FPFQZ6OpXxt0gU3RA==
X-CSE-MsgGUID: guPFOhxeR0Oy7YnRLCDDVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="133392026"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa004.fm.intel.com with ESMTP; 08 Apr 2025 03:30:00 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 05/10] drm/i915/display: Compute the scaler coefficients
Date: Tue,  8 Apr 2025 15:55:01 +0530
Message-Id: <20250408102506.1053569-6-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408102506.1053569-1-nemesa.garg@intel.com>
References: <20250408102506.1053569-1-nemesa.garg@intel.com>
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

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c     | 120 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h     |   1 +
 .../gpu/drm/i915/display/intel_casf_regs.h    |   7 +
 .../drm/i915/display/intel_display_types.h    |   8 ++
 4 files changed, 136 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index cb7d925cd16e..7ac9a8e22132 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -15,6 +15,13 @@
 #define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
 #define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
 
+#define FILTER_COEFF_0_125 125
+#define FILTER_COEFF_0_25 250
+#define FILTER_COEFF_0_5 500
+#define FILTER_COEFF_1_0 1000
+#define FILTER_COEFF_0_0 0
+#define SET_POSITIVE_SIGN(x) ((x) & (~SIGN))
+
 /**
  * DOC: Content Adaptive Sharpness Filter (CASF)
  *
@@ -36,6 +43,24 @@ static const u16 sharpness_lut[] = {
 	73, 60, 48, 36, 24, 12, 0
 };
 
+const u16 filtercoeff_1[] = {
+	FILTER_COEFF_0_0, FILTER_COEFF_0_0, FILTER_COEFF_0_5,
+	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_0,
+	FILTER_COEFF_0_0,
+};
+
+const u16 filtercoeff_2[] = {
+	FILTER_COEFF_0_0, FILTER_COEFF_0_25, FILTER_COEFF_0_5,
+	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,
+	FILTER_COEFF_0_0,
+};
+
+const u16 filtercoeff_3[] = {
+	FILTER_COEFF_0_125, FILTER_COEFF_0_25, FILTER_COEFF_0_5,
+	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,
+	FILTER_COEFF_0_125,
+};
+
 void intel_filter_lut_load(struct intel_crtc *crtc,
 			   const struct intel_crtc_state *crtc_state)
 {
@@ -100,6 +125,8 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
 
 	intel_casf_compute_win_size(crtc_state);
 
+	intel_casf_scaler_compute_config(crtc_state);
+
 	return 0;
 }
 
@@ -122,3 +149,96 @@ void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state)
 			REG_FIELD_GET(FILTER_SIZE_MASK, sharp);
 	}
 }
+
+static int casf_coeff_tap(int i)
+{
+	return i % SCALER_FILTER_NUM_TAPS;
+}
+
+static u16 casf_coeff(struct intel_crtc_state *crtc_state, int t)
+{
+	struct scaler_filter_coeff value;
+	u16 coeff;
+
+	value = crtc_state->hw.casf_params.coeff[t];
+	coeff = SET_POSITIVE_SIGN(0) | EXPONENT(value.exp) | MANTISSA(value.mantissa);
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
index 80642809c08b..381d5e10c70d 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.h
+++ b/drivers/gpu/drm/i915/display/intel_casf.h
@@ -16,5 +16,6 @@ void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
 void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state);
 void intel_filter_lut_load(struct intel_crtc *crtc,
 			   const struct intel_crtc_state *crtc_state);
+void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CASF_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
index b96950a48335..f8c3c86f2949 100644
--- a/drivers/gpu/drm/i915/display/intel_casf_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
@@ -30,4 +30,11 @@
 #define   INDEX_VALUE_MASK             REG_GENMASK(4, 0)
 #define   INDEX_VALUE(x)               REG_FIELD_PREP(INDEX_VALUE_MASK, (x))
 
+/* Scaler Coefficient structure */
+#define SIGN                           REG_BIT(15)
+#define EXPONENT_MASK                  REG_GENMASK(13, 12)
+#define EXPONENT(x)                    REG_FIELD_PREP(EXPONENT_MASK, (x))
+#define MANTISSA_MASK                  REG_GENMASK(11, 3)
+#define MANTISSA(x)                    REG_FIELD_PREP(MANTISSA_MASK, (x))
+
 #endif /* __INTEL_CASF_REGS__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 3af73e7ffdeb..ea7c32283d33 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -931,7 +931,15 @@ struct intel_csc_matrix {
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

