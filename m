Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806DEA3613E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE2F10ECD8;
	Fri, 14 Feb 2025 15:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dr9o4S6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31FC10ECE5;
 Fri, 14 Feb 2025 15:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739546150; x=1771082150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WpVZpCg/0XLtfScWnpsgUb6CV2Fce8c9T2D7+v27SX8=;
 b=dr9o4S6nwBBdGK3dfcUVw6/nZ5h9W+N758Xkzceddif2Ytgw7ZW9bPp4
 eNdZcZmmDvs03KyKYRdo4BKWJV2XhTSgytT7ERg/zNGVDGVnidzsas2xx
 T9XAUJMW0KbnLNaH3uDXPcliPpJKbBf1yyxFHPcWeFLlgk9U4gFKbeS7r
 QjiNCKrIgEkb9CYd/d25zyccAv/2W/0FrV6Bcfqw7LcX3MWSkAGfmoN6D
 hkVswGJCcB78N9dSA24tluAZ1Hf6jkQiSb+S2/g21F6vmWeXGO+oXyh3E
 +qDD6x5W0AhrD1oblq82qtqYa5EsyXXVOZwRWY1AcJf2UrWkJJF6DRR28 Q==;
X-CSE-ConnectionGUID: JBWTgjAHTjqVZ4zfCY/cLA==
X-CSE-MsgGUID: k6v6l4j0T5Sx9z32MOV4RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50510844"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="50510844"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 07:15:50 -0800
X-CSE-ConnectionGUID: V+K0lCvLQvq2zLAZ1kwK0A==
X-CSE-MsgGUID: axNwHU5mR5i4+sAH9ak3Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="118413204"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa003.jf.intel.com with ESMTP; 14 Feb 2025 07:15:49 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH v8 5/6] drm/i915/display: Add registers and compute the
 strength
Date: Fri, 14 Feb 2025 20:41:31 +0530
Message-Id: <20250214151132.1811682-6-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214151132.1811682-1-nemesa.garg@intel.com>
References: <20250214151132.1811682-1-nemesa.garg@intel.com>
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

Add new registers and related bits. Compute the strength
value and tap value based on display mode.

v2: Replace i915/dev_priv with display[Jani]
v3: Create separate file for defining register[Jani]
    Add display->drm in debug prints[Jani]
v4: Rebase
v5: Fix build issue
v6: Remove erraneous condition[Ankit]
v7: Change the place of compute function
v8: Add strength, size in crtc_state_dump.
    Add bits for filter size. [Ankit]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c     | 96 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h     |  6 +-
 .../gpu/drm/i915/display/intel_casf_regs.h    | 22 +++++
 .../drm/i915/display/intel_crtc_state_dump.c  |  5 +
 drivers/gpu/drm/i915/display/intel_display.c  |  4 +
 5 files changed, 131 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index f3c5a3f11128..aa38921f27b0 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -17,6 +17,9 @@
 #define FILTER_COEFF_0_0 0
 #define SET_POSITIVE_SIGN(x) ((x) & (~SIGN))
 
+#define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
+#define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
+
 /**
  * DOC: Content Adaptive Sharpness Filter (CASF)
  *
@@ -64,6 +67,64 @@ static u16 casf_coeff(struct intel_crtc_state *crtc_state, int t)
 	return coeff;
 }
 
+/* Default LUT values to be loaded one time. */
+static const u16 lut_data[] = {
+	4095, 2047, 1364, 1022, 816, 678, 579,
+	504, 444, 397, 357, 323, 293, 268, 244, 224,
+	204, 187, 170, 154, 139, 125, 111, 98, 85,
+	73, 60, 48, 36, 24, 12, 0
+};
+
+void intel_filter_lut_load(struct intel_crtc *crtc,
+			   const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	int i;
+
+	intel_de_write(display, SHRPLUT_INDEX(crtc->pipe),
+		       INDEX_AUTO_INCR | INDEX_VALUE(0));
+
+	for (i = 0; i < ARRAY_SIZE(lut_data); i++)
+		intel_de_write(display, SHRPLUT_DATA(crtc->pipe),
+			       lut_data[i]);
+}
+
+static void intel_casf_size_compute(struct intel_crtc_state *crtc_state)
+{
+	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
+	u16 total_pixels = mode->hdisplay * mode->vdisplay;
+
+	if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
+		crtc_state->hw.casf_params.win_size = 0;
+	else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
+		crtc_state->hw.casf_params.win_size = 1;
+	else
+		crtc_state->hw.casf_params.win_size = 2;
+}
+
+void intel_casf_update_strength(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	u32 sharpness_ctl;
+
+	sharpness_ctl = FILTER_EN | FILTER_STRENGTH(crtc_state->hw.casf_params.strength);
+
+	switch (crtc_state->hw.casf_params.win_size) {
+	case 0:
+		sharpness_ctl |= SHARPNESS_FILTER_SIZE_3X3;
+		break;
+	case 1:
+		sharpness_ctl |= SHARPNESS_FILTER_SIZE_5X5;
+		break;
+	default:
+		sharpness_ctl |= SHARPNESS_FILTER_SIZE_7X7;
+		break;
+	}
+
+	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), sharpness_ctl);
+}
+
 /*
  * 17 phase of 7 taps requires 119 coefficients in 60 dwords per set.
  * To enable casf:  program scaler coefficients with the coeffients
@@ -108,6 +169,8 @@ static void intel_casf_write_coeff(struct intel_crtc_state *crtc_state)
 
 void intel_casf_enable(struct intel_crtc_state *crtc_state)
 {
+	intel_casf_update_strength(crtc_state);
+
 	intel_casf_write_coeff(crtc_state);
 
 	skl_scaler_setup_casf(crtc_state);
@@ -128,8 +191,33 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
 	if (!HAS_CASF(display))
 		return -EINVAL;
 
+	if (crtc_state->uapi.sharpness_strength == 0) {
+		crtc_state->hw.casf_params.casf_enable = false;
+		crtc_state->hw.casf_params.strength = 0;
+		return 0;
+	}
+
+	/* If panel fitting enabled casf cannot be enabled */
+	if (crtc_state->pch_pfit.enabled)
+		return -EINVAL;
+
 	crtc_state->hw.casf_params.casf_enable = true;
 
+	/*
+	 * HW takes a value in form (1.0 + strength) in 4.4 fixed format.
+	 * Strength is from 0.0-14.9375 ie from 0-239.
+	 * User can give value from 0-255 but is clamped to 239.
+	 * Ex. User gives 85 which is 5.3125 and adding 1.0 gives 6.3125.
+	 * 6.3125 in 4.4 format is b01100101 which is equal to 101.
+	 * Also 85 + 16 = 101.
+	 */
+	crtc_state->hw.casf_params.strength =
+		 min(crtc_state->uapi.sharpness_strength, 0xEF) + 0x10;
+
+	intel_casf_size_compute(crtc_state);
+
+	intel_casf_scaler_compute_config(crtc_state);
+
 	return 0;
 }
 
@@ -174,3 +262,11 @@ void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
 					      filter_coeff[i]);
 	}
 }
+
+void intel_casf_disable(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+
+	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), 0);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
index 6ab30af9d959..26c7f31a8085 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.h
+++ b/drivers/gpu/drm/i915/display/intel_casf.h
@@ -9,6 +9,8 @@
 #include <linux/types.h>
 
 struct intel_crtc_state;
+struct intel_atomic_state;
+struct intel_crtc;
 
 void intel_casf_enable(struct intel_crtc_state *crtc_state);
 void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
@@ -16,7 +18,7 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
 bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state);
 void intel_filter_lut_load(struct intel_crtc *crtc,
 			   const struct intel_crtc_state *crtc_state);
-bool intel_casf_strength_changed(struct intel_crtc_state *new_crtc_state,
-				 const struct intel_crtc_state *old_crtc_state);
+void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
+void intel_casf_disable(const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CASF_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
index 0b3fcdb22c0c..f02d01a7a9f1 100644
--- a/drivers/gpu/drm/i915/display/intel_casf_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
@@ -15,5 +15,27 @@
 #define MANTISSA_MASK			REG_GENMASK(11, 3)
 #define MANTISSA(x)			REG_FIELD_PREP(MANTISSA_MASK, (x))
 
+#define _SHARPNESS_CTL_A		0x682B0
+#define _SHARPNESS_CTL_B		0x68AB0
+#define SHARPNESS_CTL(pipe)		_MMIO_PIPE(pipe, _SHARPNESS_CTL_A, _SHARPNESS_CTL_B)
+#define   FILTER_EN			REG_BIT(31)
+#define   FILTER_STRENGTH_MASK		REG_GENMASK(15, 8)
+#define   FILTER_STRENGTH(x)		REG_FIELD_PREP(FILTER_STRENGTH_MASK, (x))
+#define   FILTER_SIZE_MASK		REG_GENMASK(1, 0)
+#define   SHARPNESS_FILTER_SIZE_3X3	REG_FIELD_PREP(FILTER_SIZE_MASK, 0)
+#define   SHARPNESS_FILTER_SIZE_5X5	REG_FIELD_PREP(FILTER_SIZE_MASK, 1)
+#define   SHARPNESS_FILTER_SIZE_7X7	REG_FIELD_PREP(FILTER_SIZE_MASK, 2)
+
+#define _SHRPLUT_DATA_A			0x682B8
+#define _SHRPLUT_DATA_B			0x68AB8
+#define SHRPLUT_DATA(pipe)		_MMIO_PIPE(pipe, _SHRPLUT_DATA_A, _SHRPLUT_DATA_B)
+
+#define _SHRPLUT_INDEX_A		0x682B4
+#define _SHRPLUT_INDEX_B		0x68AB4
+#define SHRPLUT_INDEX(pipe)		_MMIO_PIPE(pipe, _SHRPLUT_INDEX_A, _SHRPLUT_INDEX_B)
+#define   INDEX_AUTO_INCR		REG_BIT(10)
+#define   INDEX_VALUE_MASK		REG_GENMASK(4, 0)
+#define   INDEX_VALUE(x)		REG_FIELD_PREP(INDEX_VALUE_MASK, (x))
+
 #endif /* __INTEL_CASF_REGS__ */
 
diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 599ddce96371..99f0fbd14c4f 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -372,6 +372,11 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 
 	intel_vdsc_state_dump(&p, 0, pipe_config);
 
+	if (HAS_CASF(i915)) {
+		drm_printf(&p, "sharpness strength : %d\n",  pipe_config->hw.casf_params.strength);
+		drm_printf(&p, "sharpness tap size : %d\n",  pipe_config->hw.casf_params.win_size);
+	}
+
 dump_planes:
 	if (!state)
 		return;
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 49a3b32a4c9b..9c568395da16 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4655,6 +4655,10 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 		return ret;
 	}
 
+	ret = intel_casf_compute_config(crtc_state);
+	if (ret)
+		return ret;
+
 	if (DISPLAY_VER(dev_priv) >= 9) {
 		if (intel_crtc_needs_modeset(crtc_state) ||
 		    intel_crtc_needs_fastset(crtc_state) ||
-- 
2.25.1

