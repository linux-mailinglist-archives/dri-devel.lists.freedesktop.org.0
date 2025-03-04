Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E355EA4DAAF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:33:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C06810E574;
	Tue,  4 Mar 2025 10:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rwf/DA90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75FC10E57F;
 Tue,  4 Mar 2025 10:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741084429; x=1772620429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gIwad8f3w4i0FfwmrvRNHqGb+hJSj0Y20i3Xw7MQuVE=;
 b=Rwf/DA90pVqPTgoRFeJ0xniBEm4yRpH/y9rBhpv6IAKIrT4WggZ5A2dF
 Fba5oEflsx73gy+tuz4xjPQARM10H7sFXP1jsmUgM6gq/hDc14OPRmiJq
 /6qbfZQi6RsCjbDyi8Bxtx71dYQPMxNgcFqN4RhxoUWxCbbuVAkEqviIe
 L+c6twfwP31hxiS79kId7v1TjJusOaJ5bokepF3QqngQ7LgHgb41umavW
 wfO2DsSb3m8jRzZVOesK4M2pO93XqjEpnkf9aTdyOnuRI8mWfjgsgG7Gx
 xtvRoKriNfD9c13dQsOK5DX1X45RsUng1iU4VXySkGC95Srrw1Lkic/St Q==;
X-CSE-ConnectionGUID: nU1aN1D8TgmolIrf2FxKKw==
X-CSE-MsgGUID: 37spzuVbSU+NY3ByOUNI1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="29584098"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="29584098"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 02:33:48 -0800
X-CSE-ConnectionGUID: XzlM3r79SlWYewP/sRq8kw==
X-CSE-MsgGUID: LnRgoPEORNSlFvQMjLCdRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="118064052"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 02:33:46 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 07/10] drm/i915/display: Configure the second scaler for
 sharpness
Date: Tue,  4 Mar 2025 15:58:54 +0530
Message-Id: <20250304102857.326544-8-nemesa.garg@intel.com>
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

As only second scaler can be used for sharpness check if it
is available and also check if panel fitting is also not enabled,
then set the sharpness. Panel fitting will have the preference
over sharpness property.

v2: Add the panel fitting check before enabling sharpness
v3: Reframe commit message[Arun]
v4: Replace string based comparison with plane_state[Jani]
v5: Rebase
v6: Fix build issue
v7: Remove scaler id from verify_crtc_state[Ankit]
v8: Change the patch title. Add code comment.
    Move the config part in patch#6. [Ankit]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c    |  8 ++++++
 drivers/gpu/drm/i915/display/intel_casf.h    |  1 +
 drivers/gpu/drm/i915/display/intel_display.c |  6 +++--
 drivers/gpu/drm/i915/display/skl_scaler.c    | 28 +++++++++++++++-----
 4 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index 15ae555e571e..1d9196c4d22f 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -115,6 +115,14 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
 	return 0;
 }
 
+bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state)
+{
+	if (crtc_state->hw.casf_params.casf_enable)
+		return true;
+
+	return false;
+}
+
 static int casf_coeff_tap(int i)
 {
 	return i % SCALER_FILTER_NUM_TAPS;
diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
index 507a3fe49753..c75a4b2f3133 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.h
+++ b/drivers/gpu/drm/i915/display/intel_casf.h
@@ -17,5 +17,6 @@ void intel_filter_lut_load(struct intel_crtc *crtc,
 			   const struct intel_crtc_state *crtc_state);
 void intel_casf_enable(struct intel_crtc_state *crtc_state);
 void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
+bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CASF_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c4b0ec60fded..03acf01cac75 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -60,6 +60,7 @@
 #include "intel_audio.h"
 #include "intel_bo.h"
 #include "intel_bw.h"
+#include "intel_casf.h"
 #include "intel_cdclk.h"
 #include "intel_clock_gating.h"
 #include "intel_color.h"
@@ -1956,7 +1957,7 @@ static void get_crtc_power_domains(struct intel_crtc_state *crtc_state,
 	set_bit(POWER_DOMAIN_PIPE(pipe), mask->bits);
 	set_bit(POWER_DOMAIN_TRANSCODER(cpu_transcoder), mask->bits);
 	if (crtc_state->pch_pfit.enabled ||
-	    crtc_state->pch_pfit.force_thru)
+	    crtc_state->pch_pfit.force_thru || intel_casf_needs_scaler(crtc_state))
 		set_bit(POWER_DOMAIN_PIPE_PANEL_FITTER(pipe), mask->bits);
 
 	drm_for_each_encoder_mask(encoder, &dev_priv->drm,
@@ -2194,7 +2195,7 @@ static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
 	 * PF-ID we'll need to adjust the pixel_rate here.
 	 */
 
-	if (!crtc_state->pch_pfit.enabled)
+	if (!crtc_state->pch_pfit.enabled || intel_casf_needs_scaler(crtc_state))
 		return pixel_rate;
 
 	drm_rect_init(&src, 0, 0,
@@ -5299,6 +5300,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 
 		PIPE_CONF_CHECK_I(scaler_state.scaler_id);
 		PIPE_CONF_CHECK_I(pixel_rate);
+		PIPE_CONF_CHECK_BOOL(hw.casf_params.casf_enable);
 
 		PIPE_CONF_CHECK_X(gamma_mode);
 		if (IS_CHERRYVIEW(dev_priv))
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 39fc537e54f0..93a847c05535 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -5,6 +5,7 @@
 
 #include "i915_drv.h"
 #include "i915_reg.h"
+#include "intel_casf.h"
 #include "intel_casf_regs.h"
 #include "intel_de.h"
 #include "intel_display_trace.h"
@@ -272,7 +273,8 @@ int skl_update_scaler_crtc(struct intel_crtc_state *crtc_state)
 				 drm_rect_width(&crtc_state->pipe_src),
 				 drm_rect_height(&crtc_state->pipe_src),
 				 width, height, NULL, 0,
-				 crtc_state->pch_pfit.enabled);
+				 crtc_state->pch_pfit.enabled ||
+				 intel_casf_needs_scaler(crtc_state));
 }
 
 /**
@@ -311,7 +313,9 @@ int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
 }
 
 static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
-				 struct intel_crtc *crtc)
+				 struct intel_crtc *crtc,
+				 struct intel_plane_state *plane_state,
+				 bool casf_scaler)
 {
 	int i;
 
@@ -319,6 +323,10 @@ static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
 		if (scaler_state->scalers[i].in_use)
 			continue;
 
+		/* CASF needs second scaler */
+		if (!plane_state && casf_scaler && i != 1)
+			continue;
+
 		scaler_state->scalers[i].in_use = true;
 
 		return i;
@@ -369,7 +377,7 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
 				     int num_scalers_need, struct intel_crtc *crtc,
 				     const char *name, int idx,
 				     struct intel_plane_state *plane_state,
-				     int *scaler_id)
+				     int *scaler_id, bool casf_scaler)
 {
 	struct intel_display *display = to_intel_display(crtc);
 	struct intel_crtc_scaler_state *scaler_state = &crtc_state->scaler_state;
@@ -378,12 +386,15 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
 	int vscale = 0;
 
 	if (*scaler_id < 0)
-		*scaler_id = intel_allocate_scaler(scaler_state, crtc);
+		*scaler_id = intel_allocate_scaler(scaler_state, crtc, plane_state, casf_scaler);
 
 	if (drm_WARN(display->drm, *scaler_id < 0,
 		     "Cannot find scaler for %s:%d\n", name, idx))
 		return -EINVAL;
 
+	if (casf_scaler)
+		mode = SKL_PS_SCALER_MODE_HQ;
+
 	/* set scaler mode */
 	if (plane_state && plane_state->hw.fb &&
 	    plane_state->hw.fb->format->is_yuv &&
@@ -510,10 +521,14 @@ static int setup_crtc_scaler(struct intel_atomic_state *state,
 	struct intel_crtc_scaler_state *scaler_state =
 		&crtc_state->scaler_state;
 
+	if (intel_casf_needs_scaler(crtc_state) && crtc_state->pch_pfit.enabled)
+		return -EINVAL;
+
 	return intel_atomic_setup_scaler(crtc_state,
 					 hweight32(scaler_state->scaler_users),
 					 crtc, "CRTC", crtc->base.base.id,
-					 NULL, &scaler_state->scaler_id);
+					 NULL, &scaler_state->scaler_id,
+					 intel_casf_needs_scaler(crtc_state));
 }
 
 static int setup_plane_scaler(struct intel_atomic_state *state,
@@ -548,7 +563,8 @@ static int setup_plane_scaler(struct intel_atomic_state *state,
 	return intel_atomic_setup_scaler(crtc_state,
 					 hweight32(scaler_state->scaler_users),
 					 crtc, "PLANE", plane->base.base.id,
-					 plane_state, &plane_state->scaler_id);
+					 plane_state, &plane_state->scaler_id,
+					 false);
 }
 
 /**
-- 
2.25.1

