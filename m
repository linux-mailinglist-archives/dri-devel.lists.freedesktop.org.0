Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E686F9D333D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 06:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F7510E6B2;
	Wed, 20 Nov 2024 05:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/d+oLZK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF4E10E392
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 05:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732081508; x=1763617508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lTHjX1idi3g3Tb4no0RbTTjWeLXYL5GOI0/yVZchYWI=;
 b=S/d+oLZK2zY0O/LTD9d2vBgayZ/c9uLq6fyIl+Sf3Kk4VHZiuhXlXV19
 jQ4f965LpcXcnFGExaUJQdmF5Mu8TJxykQTy8gxF+/IwuwpcqNa7IIcP0
 HRFslNed3B8F2T68f6NVC+YtF93ugGAgd6B4NX0Mb1TkoXwzkQVyTJCNd
 ybpsevJ4Zj5eVQ3aNkLhvbIpTJspNp7Ci+BJ4hFYQp0UoySEWsftu6omw
 N2Vm7LUJYMxes4+5eKviFZgtTVaKqqLZWGgReVxW76OMYBHKVXiQsqL0V
 wgj7/oo0T1caKGnkrQGtx4RvOv6pl/kT+xZNtikiphuaxANjXG/xaaN+d g==;
X-CSE-ConnectionGUID: XxIA9ZVqTFyIdCdFexxI9g==
X-CSE-MsgGUID: TznakkGEQzyCOFp4qy/RFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31867797"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="31867797"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 21:45:07 -0800
X-CSE-ConnectionGUID: SyhSjh/jTtCNsBZiorVE2w==
X-CSE-MsgGUID: fawxRDWSQIejGBSYvIHoog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="89606927"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa007.fm.intel.com with ESMTP; 19 Nov 2024 21:45:06 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 4/5] drm/i915/display: Add registers and compute the strength
Date: Wed, 20 Nov 2024 11:16:12 +0530
Message-Id: <20241120054613.3797587-5-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241120054613.3797587-1-nemesa.garg@intel.com>
References: <20241120054613.3797587-1-nemesa.garg@intel.com>
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

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c     | 114 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h     |   7 ++
 .../gpu/drm/i915/display/intel_casf_regs.h    |  17 +++
 drivers/gpu/drm/i915/display/intel_display.c  |   7 +-
 4 files changed, 144 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index fce0b997ae62..396a9d0d6d61 100644
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
@@ -55,12 +58,92 @@ static u16 casf_coef(struct intel_crtc_state *crtc_state, int t)
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
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	int i;
+
+	intel_de_write(display, SHRPLUT_INDEX(display, cpu_transcoder),
+		       INDEX_AUTO_INCR | INDEX_VALUE(0));
+
+	for (i = 0; i < ARRAY_SIZE(lut_data); i++)
+		intel_de_write(display, SHRPLUT_DATA(display, cpu_transcoder),
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
+bool intel_casf_strength_changed(struct intel_atomic_state *state)
+{
+	int i;
+	struct intel_crtc_state *old_crtc_state, *new_crtc_state;
+	struct intel_crtc *crtc;
+
+	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
+					    new_crtc_state, i) {
+		if (new_crtc_state->uapi.sharpness_strength !=
+				old_crtc_state->uapi.sharpness_strength)
+			return true;
+	}
+
+	return false;
+}
+
 void intel_casf_enable(struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	int id = crtc_state->scaler_state.scaler_id;
 	int i;
+	u32 sharpness_ctl;
+	u8 val;
+
+	if (crtc_state->uapi.sharpness_strength == 0 ||
+	    crtc_state->pch_pfit.enabled) {
+		intel_casf_disable(crtc_state);
+
+		return;
+	}
+
+	/*
+	 * HW takes a value in form (1.0 + strength) in 4.4 fixed format.
+	 * Strength is from 0.0-14.9375 ie from 0-239.
+	 * User can give value from 0-255 but is clamped to 239.
+	 * Ex. User gives 85 which is 5.3125 and adding 1.0 gives 6.3125.
+	 * 6.3125 in 4.4 format is 01100101 which is equal to 101.
+	 * Also 85 + 16 = 101.
+	 */
+	val = min(crtc_state->uapi.sharpness_strength, 0xEF) + 0x10;
+
+	drm_dbg(display->drm, "Filter strength value: %d\n", val);
+
+	sharpness_ctl =	FILTER_EN | FILTER_STRENGTH(val) |
+		FILTER_SIZE(crtc_state->hw.casf_params.win_size);
+
+	intel_de_write(display, SHARPNESS_CTL(display, cpu_transcoder),
+		       sharpness_ctl);
 
 	intel_de_write_fw(display, GLK_PS_COEF_INDEX_SET(crtc->pipe, id, 0),
 			  PS_COEF_INDEX_AUTO_INC);
@@ -89,9 +172,23 @@ void intel_casf_enable(struct intel_crtc_state *crtc_state)
 
 int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
 {
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	if (crtc_state->uapi.sharpness_strength == 0) {
+		crtc_state->hw.casf_params.need_scaler = false;
+		return 0;
+	}
+
+	if (crtc_state->pch_pfit.enabled)
+		return -EINVAL;
+
 	if (!crtc_state->pch_pfit.enabled)
 		crtc_state->hw.casf_params.need_scaler = true;
 
+	intel_casf_size_compute(crtc_state);
+	drm_dbg(display->drm, "Tap Size: %d\n",
+		crtc_state->hw.casf_params.win_size);
+
 	return 0;
 }
 
@@ -136,3 +233,20 @@ void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
 					      filter_coeff[i]);
 	}
 }
+
+void intel_casf_disable(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+
+	intel_de_write(display, SHARPNESS_CTL(display, cpu_transcoder), 0);
+	drm_dbg(display->drm, "Filter strength value: %d\n", 0);
+}
+
+bool intel_casf_compute(struct intel_crtc_state *crtc_state)
+{
+	if (!(FILTER_EN & 1) && crtc_state->uapi.sharpness_strength != 0)
+		return true;
+
+	return false;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
index 568e0f8083eb..05b0abddd917 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.h
+++ b/drivers/gpu/drm/i915/display/intel_casf.h
@@ -9,9 +9,16 @@
 #include <linux/types.h>
 
 struct intel_crtc_state;
+struct intel_atomic_state;
+struct intel_crtc;
 
 void intel_casf_enable(struct intel_crtc_state *crtc_state);
 void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
 int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
+void intel_filter_lut_load(struct intel_crtc *crtc,
+			   const struct intel_crtc_state *crtc_state);
+bool intel_casf_strength_changed(struct intel_atomic_state *state);
+void intel_casf_disable(struct intel_crtc_state *crtc_state);
+bool intel_casf_compute(struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CASF_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
index 0b3fcdb22c0c..fb92978e386a 100644
--- a/drivers/gpu/drm/i915/display/intel_casf_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
@@ -15,5 +15,22 @@
 #define MANTISSA_MASK			REG_GENMASK(11, 3)
 #define MANTISSA(x)			REG_FIELD_PREP(MANTISSA_MASK, (x))
 
+#define _SHARPNESS_CTL_A                0x682B0
+#define SHARPNESS_CTL(display, trans)   _MMIO_PIPE2(display, trans, _SHARPNESS_CTL_A)
+#define   FILTER_EN                     REG_BIT(31)
+#define   FILTER_STRENGTH_MASK          REG_GENMASK(15, 8)
+#define   FILTER_STRENGTH(x)            REG_FIELD_PREP(FILTER_STRENGTH_MASK, (x))
+#define   FILTER_SIZE_MASK              REG_GENMASK(1, 0)
+#define   FILTER_SIZE(x)                REG_FIELD_PREP(FILTER_SIZE_MASK, (x))
+
+#define _SHRPLUT_DATA_A                 0x682B8
+#define SHRPLUT_DATA(display, trans)    _MMIO_PIPE2(display, trans, _SHRPLUT_DATA_A)
+
+#define _SHRPLUT_INDEX_A                0x682B4
+#define SHRPLUT_INDEX(display, trans)   _MMIO_PIPE2(display, trans, _SHRPLUT_INDEX_A)
+#define   INDEX_AUTO_INCR               REG_BIT(10)
+#define   INDEX_VALUE_MASK              REG_GENMASK(4, 0)
+#define   INDEX_VALUE(x)                REG_FIELD_PREP(INDEX_VALUE_MASK, (x))
+
 #endif /* __INTEL_CASF_REGS__ */
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 1b1335e0af68..f5e837310309 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6198,7 +6198,12 @@ static int intel_atomic_check_planes(struct intel_atomic_state *state)
 		if (ret)
 			return ret;
 
-		intel_casf_scaler_compute_config(new_crtc_state);
+		if (intel_casf_compute(new_crtc_state)) {
+			intel_casf_scaler_compute_config(new_crtc_state);
+			ret = intel_casf_compute_config(new_crtc_state);
+			if (ret)
+				return ret;
+		}
 
 		/*
 		 * On some platforms the number of active planes affects
-- 
2.25.1

