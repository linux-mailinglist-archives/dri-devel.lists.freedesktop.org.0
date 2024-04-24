Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9008B12F7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 20:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FAB113D48;
	Wed, 24 Apr 2024 18:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGTbmCMD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D42113D45;
 Wed, 24 Apr 2024 18:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713984850; x=1745520850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/PYPM7WmyrH4bINC6h6YXD5v1j1LI34qGzh7mKWxLrM=;
 b=NGTbmCMDDf4jqC1IId3hnJpMAOsVSlKgHiZkMM2nkox7CTygwrkQv8PY
 txtNhtO0dcfPHfDgfDj7Sk7xQ6NFiYUca8FMxVcxAWgzFn94pt5XlYbWW
 TT+QrMmr6OapkOOl+EKSaSgMScQEnwl064MJL2H7J+9X9UKJLv0NEU3I7
 oMEVFpKTSQ6UWBqq37JGuiZgnbka9qhY7aLISSe/27QTVtYuephSvWMko
 m05Xf46/p5qj95Zn6AQnxRqKveV3D16qjeeSqhXLLSEcLDXRXctjlRn+6
 HLr3GWW6uHzF8/a/80+aYSU1AUqLcIpxzz3f2a3u4pMo78mix2ayUS2xp g==;
X-CSE-ConnectionGUID: DZ4a1HLiSIiTBOCznEbXpg==
X-CSE-MsgGUID: I6OYQpwXTgCxl3nuA1/lIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="21061121"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="21061121"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 11:54:10 -0700
X-CSE-ConnectionGUID: lMSZ5c+/QkeZCRPjYDwg8A==
X-CSE-MsgGUID: k7obtwabQXCmBYfVTVDaOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="25240506"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 24 Apr 2024 11:54:09 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v3 4/6] drm/i915/alpm: Add compute config for lobf
Date: Thu, 25 Apr 2024 00:08:18 +0530
Message-Id: <20240424183820.3591593-5-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240424183820.3591593-1-animesh.manna@intel.com>
References: <20240424183820.3591593-1-animesh.manna@intel.com>
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

Link Off Between Active Frames, is a new feature for eDP
that allows the panel to go to lower power state after
transmission of data. This is a feature on top of ALPM, AS SDP.
Add compute config during atomic-check phase.

v1: RFC version.
v2: Add separate flag for auxless-alpm. [Jani]
v3:
- intel_dp->lobf_supported replaced with crtc_state->has_lobf. [Jouni]
- Add DISPLAY_VER() check. [Jouni]
- Modify function name of get_aux_less_status. [Jani]

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c     | 48 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h     |  5 ++
 .../drm/i915/display/intel_display_types.h    |  4 ++
 drivers/gpu/drm/i915/display/intel_dp.c       |  4 ++
 4 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 13bac3e8c8fa..3bb69ed16aab 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -11,6 +11,16 @@
 #include "intel_dp_aux.h"
 #include "intel_psr_regs.h"
 
+bool intel_alpm_get_aux_less_status(struct intel_dp *intel_dp)
+{
+	u8 alpm_caps = 0;
+
+	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_RECEIVER_ALPM_CAP,
+			      &alpm_caps) != 1)
+		return false;
+	return alpm_caps & DP_ALPM_AUX_LESS_CAP;
+}
+
 /*
  * See Bspec: 71632 for the table
  *
@@ -242,6 +252,44 @@ bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 	return true;
 }
 
+void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
+				    struct intel_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	int waketime_in_lines, first_sdp_position;
+	int context_latency, guardband;
+
+	crtc_state->has_lobf = false;
+
+	if (!intel_dp_is_edp(intel_dp))
+		return;
+
+	if (DISPLAY_VER(i915) < 20)
+		return;
+
+	if (!intel_dp_as_sdp_supported(intel_dp))
+		return;
+
+	if (crtc_state->has_psr)
+		return;
+
+	if (intel_alpm_compute_params(intel_dp, crtc_state)) {
+		context_latency = adjusted_mode->crtc_vblank_start - adjusted_mode->crtc_vdisplay;
+		guardband = adjusted_mode->crtc_vtotal -
+			    adjusted_mode->crtc_vdisplay - context_latency;
+		first_sdp_position = adjusted_mode->crtc_vtotal - adjusted_mode->crtc_vsync_start;
+		if (intel_dp->alpm_parameters.auxless_alpm_supported)
+			waketime_in_lines = intel_dp->alpm_parameters.io_wake_lines;
+		else
+			waketime_in_lines = intel_dp->alpm_parameters.fast_wake_lines;
+
+		if ((context_latency + guardband) > (first_sdp_position + waketime_in_lines))
+			crtc_state->has_lobf = true;
+	}
+}
+
 static void lnl_alpm_configure(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index c45d078e5a6b..b9602b71d28f 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -10,9 +10,14 @@
 
 struct intel_dp;
 struct intel_crtc_state;
+struct drm_connector_state;
 
+bool intel_alpm_get_aux_less_status(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 			       struct intel_crtc_state *crtc_state);
+void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
+				    struct intel_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state);
 void intel_alpm_configure(struct intel_dp *intel_dp);
 
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index d94f50c6dc6c..5a0ffd5aa48b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1405,6 +1405,9 @@ struct intel_crtc_state {
 
 	/* for loading single buffered registers during vblank */
 	struct drm_vblank_work vblank_work;
+
+	/* LOBF flag */
+	bool has_lobf;
 };
 
 enum intel_pipe_crc_source {
@@ -1835,6 +1838,7 @@ struct intel_dp {
 		u8 fast_wake_lines;
 
 		/* LNL and beyond */
+		bool auxless_alpm_supported;
 		u8 check_entry_lines;
 		u8 silence_period_sym_clocks;
 		u8 lfps_half_cycle_num_of_syms;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e05e25cd4a94..563739c6014c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -48,6 +48,7 @@
 #include "i915_drv.h"
 #include "i915_irq.h"
 #include "i915_reg.h"
+#include "intel_alpm.h"
 #include "intel_atomic.h"
 #include "intel_audio.h"
 #include "intel_backlight.h"
@@ -2997,6 +2998,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	intel_vrr_compute_config(pipe_config, conn_state);
 	intel_dp_compute_as_sdp(intel_dp, pipe_config);
 	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
+	intel_alpm_compute_lobf_config(intel_dp, pipe_config, conn_state);
 	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp_x16);
 	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
 	intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp, pipe_config, conn_state);
@@ -6612,6 +6614,8 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 
 	intel_pps_init_late(intel_dp);
 
+	intel_dp->alpm_parameters.auxless_alpm_supported = intel_alpm_get_aux_less_status(intel_dp);
+
 	return true;
 
 out_vdd_off:
-- 
2.29.0

