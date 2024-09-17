Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BE197ADDB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 11:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2098910E44D;
	Tue, 17 Sep 2024 09:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSMK9nSn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8167710E448;
 Tue, 17 Sep 2024 09:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726565224; x=1758101224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ePJfw7sNgoP9Y4K7TXzuce9Abu7t09sxYL8TLIiGjkA=;
 b=WSMK9nSn1AbUMIqK+LGp3NtB8qRVtOqC9VaWe2tWOfSJmH3dtHoB6x0/
 U1NO7uN3AYWYGjIig/XMVwZzkJu02vD/JEXboCtdvYMRMoHu+KJmjjX4k
 fSSwVRYvaWgIo5+gW+H/7swj/DGiBr/Y1fx3sUctUh7GEWXBaawemHZxe
 IJErvkcrgjfroU2JUsCbERQ4g71hTa7eJxuf8SSfgV3qM1DRxeHGNNc6v
 cKuwaOKPtY5LEM7+Iu7HRMFR8h1HEMyE5+ZoSRvRida0zjwbz1siL44DA
 a/jxYX7Gk0YoDrjEIesjclkZnZ34gQ8k/SXDIJnOv8MNS2E31RD9KS3+b A==;
X-CSE-ConnectionGUID: RMlQmHvtRaCPJCnW+6hawg==
X-CSE-MsgGUID: nPFf8wclTtuoaEtHuA07CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36789048"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="36789048"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 02:27:03 -0700
X-CSE-ConnectionGUID: 9g68xvxpRW+9cy5AFK9u4g==
X-CSE-MsgGUID: yQR0wJYCTiiYnauxSZOtDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="99816001"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa002.jf.intel.com with ESMTP; 17 Sep 2024 02:27:02 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH v2 4/5] drm/i915/display: Add registers and compute the
 strength
Date: Tue, 17 Sep 2024 14:56:33 +0530
Message-Id: <20240917092634.1109572-5-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240917092634.1109572-1-nemesa.garg@intel.com>
References: <20240917092634.1109572-1-nemesa.garg@intel.com>
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

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |   7 +-
 .../drm/i915/display/intel_sharpness_filter.c | 112 +++++++++++++++++-
 .../drm/i915/display/intel_sharpness_filter.h |   5 +
 drivers/gpu/drm/i915/i915_reg.h               |  17 +++
 4 files changed, 139 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a6e33238dac8..6fe434708cd7 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5921,7 +5921,12 @@ static int intel_atomic_check_planes(struct intel_atomic_state *state)
 		if (ret)
 			return ret;
 
-		intel_sharpness_scaler_compute_config(new_crtc_state);
+		if (sharp_compute(new_crtc_state)) {
+			intel_sharpness_scaler_compute_config(new_crtc_state);
+			ret = intel_sharpness_filter_compute_config(new_crtc_state);
+			if (ret)
+				return ret;
+		}
 
 		/*
 		 * On some platforms the number of active planes affects
diff --git a/drivers/gpu/drm/i915/display/intel_sharpness_filter.c b/drivers/gpu/drm/i915/display/intel_sharpness_filter.c
index 42073aa25edc..28cd5c51e5b8 100644
--- a/drivers/gpu/drm/i915/display/intel_sharpness_filter.c
+++ b/drivers/gpu/drm/i915/display/intel_sharpness_filter.c
@@ -27,11 +27,88 @@ FILTER_COEFF_0_5, FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25, FILTER_
 const u16 filtercoeff_3[] = {FILTER_COEFF_0_125, FILTER_COEFF_0_25,
 FILTER_COEFF_0_5, FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25, FILTER_COEFF_0_125};
 
-void intel_sharpness_filter_enable(struct intel_crtc_state *crtc_state)
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
 {
 	struct intel_display *display = to_intel_display(crtc);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	int i;
+
+	intel_de_write(display, SHRPLUT_INDEX(crtc->pipe), INDEX_AUTO_INCR | INDEX_VALUE(0));
+
+	for (i = 0; i < ARRAY_SIZE(lut_data); i++)
+		intel_de_write(display, SHRPLUT_DATA(crtc->pipe), lut_data[i]);
+}
+
+static void intel_sharpness_filter_size_compute(struct intel_crtc_state *crtc_state)
+{
+	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
+
+	if (mode->hdisplay <= 1920 && mode->vdisplay <= 1080)
+		crtc_state->hw.casf_params.win_size = 0;
+	else if (mode->hdisplay <= 3840 && mode->vdisplay <= 2160)
+		crtc_state->hw.casf_params.win_size = 1;
+	else
+		crtc_state->hw.casf_params.win_size = 2;
+}
+
+bool intel_sharpness_strength_changed(struct intel_atomic_state *state)
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
+void intel_sharpness_filter_enable(struct intel_crtc_state *crtc_state)
+{
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct intel_display *display = to_intel_display(crtc);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	int id = crtc_state->scaler_state.scaler_id;
+	u32 sharpness_ctl;
+	u8 val;
+
+	if (crtc_state->uapi.sharpness_strength == 0 ||
+	    crtc_state->pch_pfit.enabled) {
+		intel_sharpness_disable(crtc_state);
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
+	drm_dbg(&dev_priv->drm, "Filter strength value: %d\n", val);
+
+	sharpness_ctl =	FILTER_EN | FILTER_STRENGTH(val) |
+		FILTER_SIZE(crtc_state->hw.casf_params.win_size);
+
+	intel_de_write(display, SHARPNESS_CTL(crtc->pipe),
+		       sharpness_ctl);
 
 	intel_de_write_fw(display, GLK_PS_COEF_INDEX_SET(crtc->pipe, id, 0),
 			  PS_COEF_INDEX_AUTO_INC);
@@ -51,9 +128,24 @@ void intel_sharpness_filter_enable(struct intel_crtc_state *crtc_state)
 
 int intel_sharpness_filter_compute_config(struct intel_crtc_state *crtc_state)
 {
+	struct intel_crtc *intel_crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct drm_i915_private *dev_priv = to_i915(intel_crtc->base.dev);
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
 
+	intel_sharpness_filter_size_compute(crtc_state);
+	drm_dbg(&dev_priv->drm, "Tap Size: %d\n",
+		crtc_state->hw.casf_params.win_size);
+
 	return 0;
 }
 
@@ -114,3 +206,21 @@ void intel_sharpness_scaler_compute_config(struct intel_crtc_state *crtc_state)
 		}
 	}
 }
+
+void intel_sharpness_disable(struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct intel_display *display = to_intel_display(crtc);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+
+	intel_de_write(display, SHARPNESS_CTL(crtc->pipe), 0);
+	drm_dbg(&dev_priv->drm, "Filter strength value: %d\n", 0);
+}
+
+bool sharp_compute(struct intel_crtc_state *crtc_state)
+{
+	if (!(FILTER_EN & 1) && crtc_state->uapi.sharpness_strength != 0)
+		return true;
+
+	return false;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_sharpness_filter.h b/drivers/gpu/drm/i915/display/intel_sharpness_filter.h
index 84f47d511cdc..85b2b8975383 100644
--- a/drivers/gpu/drm/i915/display/intel_sharpness_filter.h
+++ b/drivers/gpu/drm/i915/display/intel_sharpness_filter.h
@@ -35,5 +35,10 @@ struct intel_sharpness_filter {
 void intel_sharpness_filter_enable(struct intel_crtc_state *crtc_state);
 void intel_sharpness_scaler_compute_config(struct intel_crtc_state *crtc_state);
 int intel_sharpness_filter_compute_config(struct intel_crtc_state *crtc_state);
+void intel_filter_lut_load(struct intel_crtc *crtc,
+			   const struct intel_crtc_state *crtc_state);
+bool intel_sharpness_strength_changed(struct intel_atomic_state *state);
+void intel_sharpness_disable(struct intel_crtc_state *crtc_state);
+bool sharp_compute(struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_SHARPEN_FILTER_H__ */
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 84b05b57ad52..41c6c56d83d6 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2396,6 +2396,23 @@
 			_ID(id, _PS_COEF_SET0_DATA_1A, _PS_COEF_SET0_DATA_2A) + (set) * 8, \
 			_ID(id, _PS_COEF_SET0_DATA_1B, _PS_COEF_SET0_DATA_2B) + (set) * 8)
 
+#define _SHARPNESS_CTL_A               0x682B0
+#define SHARPNESS_CTL(trans)           _MMIO_PIPE2(dev_priv, trans, _SHARPNESS_CTL_A)
+#define  FILTER_EN                      REG_BIT(31)
+#define  FILTER_STRENGTH_MASK           REG_GENMASK(15, 8)
+#define  FILTER_STRENGTH(x)             REG_FIELD_PREP(FILTER_STRENGTH_MASK, (x))
+#define  FILTER_SIZE_MASK               REG_GENMASK(1, 0)
+#define  FILTER_SIZE(x)                 REG_FIELD_PREP(FILTER_SIZE_MASK, (x))
+
+#define _SHRPLUT_DATA_A                        0x682B8
+#define SHRPLUT_DATA(trans)            _MMIO_PIPE2(dev_priv, trans, _SHRPLUT_DATA_A)
+
+#define _SHRPLUT_INDEX_A               0x682B4
+#define SHRPLUT_INDEX(trans)           _MMIO_PIPE2(dev_priv, trans, _SHRPLUT_INDEX_A)
+#define  INDEX_AUTO_INCR               REG_BIT(10)
+#define  INDEX_VALUE_MASK              REG_GENMASK(4, 0)
+#define  INDEX_VALUE(x)                        REG_FIELD_PREP(INDEX_VALUE_MASK, (x))
+
 /* Display Internal Timeout Register */
 #define RM_TIMEOUT		_MMIO(0x42060)
 #define RM_TIMEOUT_REG_CAPTURE	_MMIO(0x420E0)
-- 
2.25.1

