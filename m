Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C898749CE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 09:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1100D1136F4;
	Thu,  7 Mar 2024 08:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OnC+Y+uD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA6E1136F4;
 Thu,  7 Mar 2024 08:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709800602; x=1741336602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tRcKOKYsQP7/EZcGFq4splKgiu/URSDc1tDNc5jEi1E=;
 b=OnC+Y+uDi12CS+GMFcGBqHeFYDv+UVWMgROEUscIyvNapJn57Xfopmyo
 kG7Mq0nXmLN/vjgWalqvrUVHgDIfPvOmx3QheGrRvCEvPBEsg8p4RIHp+
 zzfXszcCmd2sjNGCYCF2dHFl3uigBoa5Lmm0f0yVx/B6mpKP0mnHUwI6P
 mjjiXnBPjWvyVVgF7OJscjXttOrrov7wmKnvfZg33WvLveOSKd3Q1Dj5u
 KZ3zp7mV89Bnh9U4adcHgStqpQGVAvBwDu5vbwiDiPDAEBjTpxqYWWqDW
 miGmIQ5A+GqYTBV3IfXlAqdBkayD7h2k6aWaCaQuS9RN6zOtCcQMZ84M/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15598099"
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; d="scan'208";a="15598099"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 00:36:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="9937715"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa009.fm.intel.com with ESMTP; 07 Mar 2024 00:36:14 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH v2 5/5] drm/i915/display: Load the lut values and enable
 sharpness
Date: Thu,  7 Mar 2024 14:02:37 +0530
Message-Id: <20240307083237.576177-6-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240307083237.576177-1-nemesa.garg@intel.com>
References: <20240307083237.576177-1-nemesa.garg@intel.com>
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

Load the lut values during pipe enable.

v2: Add the display version check 

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c    |  3 +++
 drivers/gpu/drm/i915/display/intel_display.c | 14 +++++++++++++-
 drivers/gpu/drm/i915/display/skl_scaler.c    | 13 ++++++++++++-
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 25593f6aae7d..74c498733283 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -383,6 +383,9 @@ int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 
 	drm_WARN_ON(&dev_priv->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
 
+	if (DISPLAY_VER(dev_priv) >= 20)
+		drm_crtc_create_sharpening_strength_property(&crtc->base);
+
 	return 0;
 
 fail:
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 3d05bd203ca8..b1384a8d9e5d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1722,6 +1722,9 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
 		intel_crtc_wait_for_next_vblank(wa_crtc);
 		intel_crtc_wait_for_next_vblank(wa_crtc);
 	}
+
+	if (new_crtc_state->hw.casf_params.strength_changed)
+		intel_filter_lut_load(crtc, new_crtc_state);
 }
 
 void ilk_pfit_disable(const struct intel_crtc_state *old_crtc_state)
@@ -2444,8 +2447,12 @@ static int intel_crtc_compute_config(struct intel_atomic_state *state,
 	if (crtc_state->has_pch_encoder)
 		return ilk_fdi_compute_config(crtc, crtc_state);
 
-	if (crtc_state->hw.casf_params.strength_changed)
+	intel_sharpen_strength_changed(state);
+
+	if (crtc_state->hw.casf_params.strength_changed) {
 		intel_sharpness_scaler_compute_config(crtc_state);
+		intel_filter_compute_config(crtc_state);
+	}
 
 	return 0;
 }
@@ -6340,6 +6347,8 @@ int intel_atomic_check(struct drm_device *dev,
 
 	intel_vrr_check_modeset(state);
 
+	intel_sharpen_strength_changed(state);
+
 	ret = drm_atomic_helper_check_modeset(dev, &state->base);
 	if (ret)
 		goto fail;
@@ -6695,6 +6704,9 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
 			intel_vrr_set_transcoder_timings(new_crtc_state);
 	}
 
+	if (new_crtc_state->hw.casf_params.strength_changed)
+		intel_sharpen_filter_enable(new_crtc_state);
+
 	intel_fbc_update(state, crtc);
 
 	drm_WARN_ON(&i915->drm, !intel_display_power_is_enabled(i915, POWER_DOMAIN_DC_OFF));
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 5784947175a8..ee5d52244cd4 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -932,7 +932,7 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 
 	/* find scaler attached to this pipe */
 	for (i = 0; i < crtc->num_scalers; i++) {
-		u32 ctl, pos, size;
+		u32 ctl, pos, size, sharp;
 
 		ctl = intel_de_read(dev_priv, SKL_PS_CTRL(crtc->pipe, i));
 		if ((ctl & (PS_SCALER_EN | PS_BINDING_MASK)) != (PS_SCALER_EN | PS_BINDING_PIPE))
@@ -940,6 +940,17 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 
 		id = i;
 
+		if (DISPLAY_VER(dev_priv) >= 20) {
+			sharp = intel_de_read(dev_priv, SHARPNESS_CTL(crtc->pipe));
+			if (sharp & FILTER_EN) {
+				crtc_state->hw.casf_params.strength =
+					REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp) - 16;
+				crtc_state->hw.casf_params.need_scaler = true;
+				crtc_state->hw.casf_params.win_size =
+					REG_FIELD_GET(FILTER_SIZE_MASK, sharp);
+			}
+		}
+
 		if (!crtc_state->hw.casf_params.need_scaler)
 			crtc_state->pch_pfit.enabled = true;
 
-- 
2.25.1

