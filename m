Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0BA8A332A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 18:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088E010F765;
	Fri, 12 Apr 2024 16:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZskR6biV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDCB10F765;
 Fri, 12 Apr 2024 16:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712938100; x=1744474100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aDa6qCd6UgHUTchScM1fBTngWe9ITtBi2aKiYyAWoSI=;
 b=ZskR6biViFntheCsvIxXezh+lL8K08OTVWxbgmx7SNcw+KOQYHoBxXkw
 IBj4Hfi4udSRnZuT1/ed0ekLnwoQZG7zF68g9bOis1xs5RLQWiXpBP+Ok
 gTctIYObPKlOehZiRozrSXCWXU3AkAPh7VFt4x628NDAw0otaKhrkGgJW
 BCPG4s4WORtiZ0VTSa7Pia+ohqms2r3oYe4w6Pa3TQCWfe9PaazgwDOeL
 +x04G8lvwwBaS9b+McohZuuAvv8jZ8PZ8ObpJ7mq0aPP9O9jd9W745Ppl
 vgShBYNmUdrCrMub+OHvDIk3E90/fd7ZadUi2BHf3fam/cnVvd1xaJshw g==;
X-CSE-ConnectionGUID: BrpwQYvGQQOHxWqaL5YfVg==
X-CSE-MsgGUID: bEpKwNaZRJKe2l+TytjDBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8256915"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8256915"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 09:08:19 -0700
X-CSE-ConnectionGUID: l+6pKSTZQO+w71gMJ6sKPg==
X-CSE-MsgGUID: zjUsgDbRSjWCDR4NAYfBbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="25964084"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa003.jf.intel.com with ESMTP; 12 Apr 2024 09:08:18 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 jouni.hogander@intel.com, arun.r.murthy@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v2 4/6] drm/i915/alpm: Add compute config for lobf
Date: Fri, 12 Apr 2024 21:22:41 +0530
Message-Id: <20240412155243.2891996-5-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240412155243.2891996-1-animesh.manna@intel.com>
References: <20240412155243.2891996-1-animesh.manna@intel.com>
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

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c     | 44 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h     |  5 +++
 .../drm/i915/display/intel_display_types.h    |  4 ++
 drivers/gpu/drm/i915/display/intel_dp.c       |  5 +++
 4 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 13bac3e8c8fa..699f2f051766 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -11,6 +11,16 @@
 #include "intel_dp_aux.h"
 #include "intel_psr_regs.h"
 
+bool intel_dp_get_aux_less_alpm_status(struct intel_dp *intel_dp)
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
@@ -242,6 +252,40 @@ bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 	return true;
 }
 
+void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
+				    struct intel_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state)
+{
+	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	int waketime_in_lines, first_sdp_position;
+	int context_latency, guardband;
+
+	intel_dp->lobf_supported = false;
+
+	if (!intel_dp_is_edp(intel_dp))
+		return;
+
+	if (!intel_dp_as_sdp_supported(intel_dp))
+		return;
+
+	if (crtc_state->has_psr2 || crtc_state->has_panel_replay)
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
+			intel_dp->lobf_supported = true;
+	}
+}
+
 static void lnl_alpm_configure(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index c45d078e5a6b..c341d2c2b7f7 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -10,9 +10,14 @@
 
 struct intel_dp;
 struct intel_crtc_state;
+struct drm_connector_state;
 
+bool intel_dp_get_aux_less_alpm_status(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 			       struct intel_crtc_state *crtc_state);
+void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
+				    struct intel_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state);
 void intel_alpm_configure(struct intel_dp *intel_dp);
 
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 73197f014510..6116c383b543 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1876,10 +1876,14 @@ struct intel_dp {
 		u8 fast_wake_lines;
 
 		/* LNL and beyond */
+		bool auxless_alpm_supported;
 		u8 check_entry_lines;
 		u8 silence_period_sym_clocks;
 		u8 lfps_half_cycle_num_of_syms;
 	} alpm_parameters;
+
+	/* LOBF flags*/
+	bool lobf_supported;
 };
 
 enum lspcon_vendor {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 163da48bc406..12ec796568d9 100644
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
@@ -3001,6 +3002,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	intel_vrr_compute_config(pipe_config, conn_state);
 	intel_dp_compute_as_sdp(intel_dp, pipe_config);
 	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
+	intel_alpm_compute_lobf_config(intel_dp, pipe_config, conn_state);
 	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp_x16);
 	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
 	intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp, pipe_config, conn_state);
@@ -6616,6 +6618,9 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 
 	intel_pps_init_late(intel_dp);
 
+	if (intel_dp_get_aux_less_alpm_status(intel_dp))
+		intel_dp->alpm_parameters.auxless_alpm_supported = true;
+
 	return true;
 
 out_vdd_off:
-- 
2.29.0

