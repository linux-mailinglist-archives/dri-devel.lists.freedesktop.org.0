Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6298D7B2A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 07:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD40510E2B3;
	Mon,  3 Jun 2024 05:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kdDP4uTI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99A510E2AB;
 Mon,  3 Jun 2024 05:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717394379; x=1748930379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xAxQ9V7JQknexOjcOjn056EfHQrxLKJmYtQNurS7NHw=;
 b=kdDP4uTIxTp9hzTU7wEtoA0Dsia6ZIidzEwt2nYcQdSYa+c3zhr535M7
 PccsjG0coGGR0lQp31xSJ6Z0xKEt/o2DkelZRp8OWaHEWtpv3np3NTaoM
 kn7281k+j5ULtHhnt1zjdzrfPnc39Q9g6kJNaJSi7OFdhlDrCuc6K9Oa/
 3w06LrEjMNjQlQ2cVf1/LebZPhMRuf5yFRQ6mhcEvhEFmvBMlut+AbxnI
 SfF+8p7DXSqcYWkEN694Ota2KUI1zQ3GEUfWSoL3NyUv4LuGPUrnb4CnU
 r2/qq5djutsOPZQHJFaqFLhlLXbGKuMX8OMy95OAas9qNhWHTdhXfGvfV Q==;
X-CSE-ConnectionGUID: uHjKhNl5SEOAKrf2QOx3kw==
X-CSE-MsgGUID: 1BHHpw+GR9GMph/RjA9/Kg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="24527527"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="24527527"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 22:59:39 -0700
X-CSE-ConnectionGUID: IGxDexTpTxqJ0lfINfgHiw==
X-CSE-MsgGUID: CvTLB4okSraSXWXfh7TPFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="67616505"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa002.jf.intel.com with ESMTP; 02 Jun 2024 22:59:38 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v11 8/8] drm/i915: Compute CMRR and calculate vtotal
Date: Mon,  3 Jun 2024 11:19:04 +0530
Message-Id: <20240603054904.222589-9-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240603054904.222589-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240603054904.222589-1-mitulkumar.ajitkumar.golani@intel.com>
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

Compute Fixed Average Vtotal/CMRR with resepect to
userspace VRR enablement. Also calculate required
parameters in case of CMRR is  enabled. During
intel_vrr_compute_config, CMRR is getting enabled
based on userspace has enabled Variable refresh mode
with VRR timing generator or not. Make CMRR as small subset of
FAVT mode, when Panel is running on Fixed refresh rate
and on VRR framework then only enable CMRR to match with
actual refresh rate.

--v2:
- Update is_cmrr_frac_required function return as bool, not int. [Jani]
- Use signed int math instead of unsigned in cmrr_get_vtotal2. [Jani]
- Fix typo and usage of camel case in cmrr_get_vtotal. [Jani]
- Use do_div in cmrr_get_vtotalwhile calculating cmrr_m. [ Jani]
- Simplify cmrr and vrr compute config in intel_vrr_compute_config. [Jani]
- Correct valiable name usage in is_cmrr_frac_required. [Ville]

--v3:
- Removing RFC tag.

--v4:
- Added edp check to address edp usecase for now. (ville)
- Updated is_cmrr_fraction_required to more simplified calculation.
- on longterm goal to be worked upon uapi as suggestion from ville.

--v5:
- Correct vtotal paramas accuracy and add 2 digit precision.
- Avoid using DIV_ROUND_UP and improve scanline precision.

--v6:
- Make CMRR a small subset of FAVT mode.

--v7:
- Update commit message to avoid confusion with Legacy VRR (Ankit).
- Add cmrr.enable in last, so remove from this patch.

--v8:
- Set cmrr.enable in current patch instead of separate patch (Ankit).
- Since vrr.enable and cmrr.enable are not mutually exclusive,
handle accordingly (Ankit).
- is_edp is not required inside is_cmrr_frac_required function (Ankit).
- Add video_mode_required flag for future enhancement.
- Correct cmrr_m/cmrr_n calculation.

--v9:
- Move patch to last and set other bits before computing
cmrr.enable.(Ankit)
- Add TODO: for to address target refresh rate precision as future
enhancement.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  1 +
 .../drm/i915/display/intel_display_device.h   |  1 +
 drivers/gpu/drm/i915/display/intel_vrr.c      | 92 ++++++++++++++++---
 3 files changed, 83 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 29d750d2e6f7..634ffff64b1a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5451,6 +5451,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		PIPE_CONF_CHECK_I(vrr.vsync_end);
 		PIPE_CONF_CHECK_LLI(cmrr.cmrr_m);
 		PIPE_CONF_CHECK_LLI(cmrr.cmrr_n);
+		PIPE_CONF_CHECK_BOOL(cmrr.enable);
 	}
 
 #undef PIPE_CONF_CHECK_X
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index e1d9947394dc..92a438ad45a8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -152,6 +152,7 @@ enum intel_display_subplatform {
 					  BIT(trans)) != 0)
 #define HAS_VRR(i915)			(DISPLAY_VER(i915) >= 11)
 #define HAS_AS_SDP(i915)		(DISPLAY_VER(i915) >= 13)
+#define HAS_CMRR(i915)			(DISPLAY_VER(i915) >= 20)
 #define INTEL_NUM_PIPES(i915)		(hweight8(DISPLAY_RUNTIME_INFO(i915)->pipe_mask))
 #define I915_HAS_HOTPLUG(i915)		(DISPLAY_INFO(i915)->has_hotplug)
 #define OVERLAY_NEEDS_PHYSICAL(i915)	(DISPLAY_INFO(i915)->overlay_needs_physical)
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 4ad99a54aa83..05f67dc9d98d 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -12,6 +12,9 @@
 #include "intel_vrr_regs.h"
 #include "intel_dp.h"
 
+#define FIXED_POINT_PRECISION		100
+#define CMRR_PRECISION_TOLERANCE	10
+
 bool intel_vrr_is_capable(struct intel_connector *connector)
 {
 	const struct drm_display_info *info = &connector->base.display_info;
@@ -107,6 +110,52 @@ int intel_vrr_vmax_vblank_start(const struct intel_crtc_state *crtc_state)
 	return crtc_state->vrr.vmax - intel_vrr_vblank_exit_length(crtc_state);
 }
 
+static bool
+is_cmrr_frac_required(struct intel_crtc_state *crtc_state)
+{
+	int calculated_refresh_k, actual_refresh_k, pixel_clock_per_line;
+	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+
+	if (!HAS_CMRR(i915))
+		return false;
+
+	actual_refresh_k =
+		drm_mode_vrefresh(adjusted_mode) * FIXED_POINT_PRECISION;
+	pixel_clock_per_line =
+		adjusted_mode->crtc_clock * 1000 / adjusted_mode->crtc_htotal;
+	calculated_refresh_k =
+		pixel_clock_per_line * FIXED_POINT_PRECISION / adjusted_mode->crtc_vtotal;
+
+	if ((actual_refresh_k - calculated_refresh_k) < CMRR_PRECISION_TOLERANCE)
+		return false;
+
+	return true;
+}
+
+static unsigned int
+cmrr_get_vtotal(struct intel_crtc_state *crtc_state, bool video_mode_required)
+{
+	int multiplier_m = 1, multiplier_n = 1, vtotal, desired_refresh_rate;
+	long long adjusted_pixel_rate;
+	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+
+	desired_refresh_rate = drm_mode_vrefresh(adjusted_mode);
+
+	if (video_mode_required) {
+		multiplier_m = 1001;
+		multiplier_n = 1000;
+	}
+
+	crtc_state->cmrr.cmrr_n =
+		desired_refresh_rate * adjusted_mode->crtc_htotal * multiplier_n;
+	vtotal = (adjusted_mode->crtc_clock * 1000 * multiplier_n) / crtc_state->cmrr.cmrr_n;
+	adjusted_pixel_rate = adjusted_mode->crtc_clock * 1000 * multiplier_m;
+	crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);
+
+	return vtotal;
+}
+
 void
 intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 			 struct drm_connector_state *conn_state)
@@ -116,6 +165,7 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
+	bool is_edp = intel_dp_is_edp(intel_dp);
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	const struct drm_display_info *info = &connector->base.display_info;
 	int vmin, vmax;
@@ -160,21 +210,26 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	crtc_state->vrr.flipline = crtc_state->vrr.vmin + 1;
 
 	/*
-	 * For XE_LPD+, we use guardband and pipeline override
-	 * is deprecated.
+	 * When panel is VRR capable and userspace has
+	 * not enabled adaptive sync mode then Fixed Average
+	 * Vtotal mode should be enabled.
 	 */
-	if (DISPLAY_VER(i915) >= 13) {
-		crtc_state->vrr.guardband =
-			crtc_state->vrr.vmin + 1 - adjusted_mode->crtc_vblank_start;
-	} else {
-		crtc_state->vrr.pipeline_full =
-			min(255, crtc_state->vrr.vmin - adjusted_mode->crtc_vblank_start -
-			    crtc_state->framestart_delay - 1);
-	}
-
 	if (crtc_state->uapi.vrr_enabled) {
 		crtc_state->vrr.enable = true;
 		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
+	} else if (is_cmrr_frac_required(crtc_state) && is_edp) {
+		crtc_state->vrr.enable = true;
+		crtc_state->cmrr.enable = true;
+		/*
+		 * TODO: Compute precise target refresh rate to determine
+		 * if video_mode_required should be true. Currently set to
+		 * false due to uncertainty about the precise target
+		 * refresh Rate.
+		 */
+		crtc_state->vrr.vmax = cmrr_get_vtotal(crtc_state, false);
+		crtc_state->vrr.vmin = crtc_state->vrr.vmax;
+		crtc_state->vrr.flipline = crtc_state->vrr.vmin;
+		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
 	}
 
 	if (intel_dp_as_sdp_supported(intel_dp)) {
@@ -185,6 +240,19 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 			(crtc_state->hw.adjusted_mode.crtc_vtotal -
 			 crtc_state->hw.adjusted_mode.vsync_end);
 	}
+
+	/*
+	 * For XE_LPD+, we use guardband and pipeline override
+	 * is deprecated.
+	 */
+	if (DISPLAY_VER(i915) >= 13) {
+		crtc_state->vrr.guardband =
+			crtc_state->vrr.vmin + 1 - adjusted_mode->crtc_vblank_start;
+	} else {
+		crtc_state->vrr.pipeline_full =
+			min(255, crtc_state->vrr.vmin - adjusted_mode->crtc_vblank_start -
+			    crtc_state->framestart_delay - 1);
+	}
 }
 
 static u32 trans_vrr_ctl(const struct intel_crtc_state *crtc_state)
@@ -324,6 +392,8 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 				      TRANS_VRR_CTL(dev_priv, cpu_transcoder));
 
 	crtc_state->vrr.enable = trans_vrr_ctl & VRR_CTL_VRR_ENABLE;
+	if (HAS_CMRR(dev_priv))
+		crtc_state->cmrr.enable = (trans_vrr_ctl & VRR_CTL_CMRR_ENABLE);
 
 	if (crtc_state->cmrr.enable) {
 		crtc_state->cmrr.cmrr_n =
-- 
2.25.1

