Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CBBA4DAA9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7F910E580;
	Tue,  4 Mar 2025 10:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nisrfzF3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEF510E57C;
 Tue,  4 Mar 2025 10:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741084421; x=1772620421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2MG108yKyBuU1Yn5qassrlEEQrgpjTPqvtc7vP6xwV8=;
 b=nisrfzF3eKyF05HT7+r9Qr/0iLXkDTuVIh/3JJaNG6O0qZzbBnNnwYwI
 sE7xtHohvLxhkAU18RrVadiQKe/CDkOGVWoQoE9R/L8HX3C2BMSiCdMR7
 1Gg2PgHai4EdgzbL0qpNli8dL/1PTrVD2DIBdspttfxMsgW79RXWyGaeZ
 SHErbYZiC7KSPHTLdhBqrJ8xZQ11evHBPZp7TUw7NrsS2XHueFqVBeKEq
 88VmL0mjfazTvFWMhw8QeaM6LuoInN4Jd/IZAldPa7FgHNUIevVp7sEFs
 9vOxFdbb/APYNgtSQkGjoppbdCKh8cncRi8anCPyG5ntLFL8tynyzFhT3 A==;
X-CSE-ConnectionGUID: cGc9yby2TdGd5D3ACFY4+w==
X-CSE-MsgGUID: ocVffuAsQ3y/36p3p1GivA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="29584092"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="29584092"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 02:33:41 -0800
X-CSE-ConnectionGUID: xmQieIq3RGa9Y29+vs5Msw==
X-CSE-MsgGUID: DYHweJtoRMCI1JabCJa83A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="118064032"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 02:33:38 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 05/10] drm/i915/display: Compute the scaler filter coefficients
Date: Tue,  4 Mar 2025 15:58:52 +0530
Message-Id: <20250304102857.326544-6-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304102857.326544-1-nemesa.garg@intel.com>
References: <20250304102857.326544-1-nemesa.garg@intel.com>
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

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c     | 124 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h     |   2 +
 .../gpu/drm/i915/display/intel_casf_regs.h    |   7 +
 .../drm/i915/display/intel_display_types.h    |   8 ++
 4 files changed, 141 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index ed72bccbb93f..ff34e390c8fe 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -12,6 +12,13 @@
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
@@ -33,6 +40,24 @@ static const u16 sharpness_lut[] = {
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
@@ -88,3 +113,102 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
 
 	return 0;
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
+
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
+
+void intel_casf_enable(struct intel_crtc_state *crtc_state)
+{
+	intel_casf_write_coeff(crtc_state);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
index faeed50de2ba..507a3fe49753 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.h
+++ b/drivers/gpu/drm/i915/display/intel_casf.h
@@ -15,5 +15,7 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
 void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
 void intel_filter_lut_load(struct intel_crtc *crtc,
 			   const struct intel_crtc_state *crtc_state);
+void intel_casf_enable(struct intel_crtc_state *crtc_state);
+void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CASF_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
index c61755a401ff..0305604b4c87 100644
--- a/drivers/gpu/drm/i915/display/intel_casf_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
@@ -30,5 +30,12 @@
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
index ccaf9dd4f6a8..b96dec938185 100644
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

