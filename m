Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 552BDB117C7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B89410E9D4;
	Fri, 25 Jul 2025 05:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5pE13Xi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C44F10E9C9;
 Fri, 25 Jul 2025 05:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419918; x=1784955918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nf1DAReHmvcLlXcKGD+txZ3L4cZ74HBahKwK4GSJCNc=;
 b=A5pE13XiHM9LeZQGFULxxMWvDIgwFhTrl/pPr3RevkveL9eYee7dNne3
 Zfhccql2xKO7qIn/cz5GgRdiqnAuWqy29uIgNTJw3fuGQnPVafmVgXnIi
 MnOQuvKPsLANsmIvWWaKBFg6BYrz3ZfB23xFpGgtD9S5bOqNc4ZEDAAP/
 DF0SpfLp4Xncxih3OcTXjKVTkj2qR/RwbsU3E6p6RR1e9OmQxmMa0hPPy
 GD333FXruo3BjdLH+P9zI42ZLvzJW0MNokGdAC2P7C9DauMXJK6ZhUuhT
 54LwBQhr/FfWYTFdJ3hgLwf5pVeY4A50R0cK2ej4qI0qRNDtlYAAKVadk A==;
X-CSE-ConnectionGUID: IjtzQzPWQMiHZh4K6vEfNw==
X-CSE-MsgGUID: K51RUQKfTKKLFvmD71OKgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299573"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299573"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:05:18 -0700
X-CSE-ConnectionGUID: HKoq4t8HQcelL99wyAoDDw==
X-CSE-MsgGUID: 2LHrlTVURPuS+fBnpoVN5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956817"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:05:15 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 27/28] drm/i915/writeback: Make exception for writeback
 connector
Date: Fri, 25 Jul 2025 10:34:08 +0530
Message-Id: <20250725050409.2687242-28-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
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

Writeback connector is a special connector as it does not actually
exist. This means a lot of checks and computations need to be skipped
and exceptions need to be made when it comes to this connector.
This commit contains all those changes for a writeback connector.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  | 109 +++++++++++++-----
 .../drm/i915/display/intel_display_debugfs.c  |   3 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   3 +
 drivers/gpu/drm/i915/display/intel_opregion.c |   2 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c |   3 +
 drivers/gpu/drm/i915/display/intel_vdsc.c     |   4 +
 .../gpu/drm/i915/display/intel_writeback.c    |   5 +
 .../gpu/drm/i915/display/intel_writeback.h    |   1 +
 8 files changed, 103 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index dbde689713fe..953d14ac342d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -126,6 +126,7 @@
 #include "intel_vrr.h"
 #include "intel_wm.h"
 #include "intel_writeback.h"
+#include "intel_writeback_reg.h"
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
 #include "skl_watermark.h"
@@ -1637,6 +1638,10 @@ static void hsw_configure_cpu_transcoder(const struct intel_crtc_state *crtc_sta
 	}
 
 	intel_set_transcoder_timings(crtc_state);
+
+	if (intel_writeback_transcoder_is_wd(cpu_transcoder))
+		return;
+
 	if (HAS_VRR(display))
 		intel_vrr_set_transcoder_timings(crtc_state);
 
@@ -2652,6 +2657,10 @@ static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_sta
 	crtc_vblank_start = adjusted_mode->crtc_vblank_start;
 	crtc_vblank_end = adjusted_mode->crtc_vblank_end;
 
+	if (intel_writeback_transcoder_is_wd(cpu_transcoder)) {
+		return;
+	}
+
 	if (adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE) {
 		/* the chip adds 2 halflines automatically */
 		crtc_vtotal -= 1;
@@ -2840,6 +2849,15 @@ static void intel_get_transcoder_timings(struct intel_crtc *crtc,
 	struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
 	u32 tmp;
 
+	if (intel_writeback_transcoder_is_wd(cpu_transcoder)) {
+		tmp = intel_de_read(display, TRANS_HTOTAL(display, cpu_transcoder));
+		adjusted_mode->crtc_hdisplay = REG_FIELD_GET(HACTIVE_MASK, tmp) + 1;
+
+		tmp = intel_de_read(display, TRANS_VTOTAL(display, cpu_transcoder));
+		adjusted_mode->crtc_vdisplay = REG_FIELD_GET(VACTIVE_MASK, tmp) + 1;
+		return;
+	}
+
 	tmp = intel_de_read(display, TRANS_HTOTAL(display, cpu_transcoder));
 	adjusted_mode->crtc_hdisplay = REG_FIELD_GET(HACTIVE_MASK, tmp) + 1;
 	adjusted_mode->crtc_htotal = REG_FIELD_GET(HTOTAL_MASK, tmp) + 1;
@@ -3743,32 +3761,59 @@ static u8 hsw_enabled_transcoders(struct intel_crtc *crtc)
 		u32 tmp = 0;
 
 		power_domain = POWER_DOMAIN_TRANSCODER(cpu_transcoder);
-		with_intel_display_power_if_enabled(display, power_domain, wakeref)
-			tmp = intel_de_read(display,
-					    TRANS_DDI_FUNC_CTL(display, cpu_transcoder));
+		if (cpu_transcoder == TRANSCODER_WD_0 ||
+		    cpu_transcoder == TRANSCODER_WD_1) {
+			with_intel_display_power_if_enabled(display, power_domain, wakeref)
+				tmp = intel_de_read(display,
+						    WD_TRANS_FUNC_CTL(cpu_transcoder));
+			if (!(tmp & TRANS_WD_FUNC_ENABLE))
+				continue;
 
-		if (!(tmp & TRANS_DDI_FUNC_ENABLE))
-			continue;
+			switch (tmp & WD_INPUT_SELECT_MASK) {
+			case WD_INPUT_PIPE_A:
+				trans_pipe = PIPE_A;
+				break;
+			case WD_INPUT_PIPE_B:
+				trans_pipe = PIPE_B;
+				break;
+			case WD_INPUT_PIPE_C:
+				trans_pipe = PIPE_C;
+				break;
+			case WD_INPUT_PIPE_D:
+				trans_pipe = PIPE_D;
+				break;
+			default:
+				MISSING_CASE(tmp & WD_INPUT_SELECT_MASK);
+				break;
+			}
+		} else {
+			with_intel_display_power_if_enabled(display, power_domain, wakeref)
+				tmp = intel_de_read(display,
+						    TRANS_DDI_FUNC_CTL(display, cpu_transcoder));
 
-		switch (tmp & TRANS_DDI_EDP_INPUT_MASK) {
-		default:
-			drm_WARN(display->drm, 1,
-				 "unknown pipe linked to transcoder %s\n",
-				 transcoder_name(cpu_transcoder));
-			fallthrough;
-		case TRANS_DDI_EDP_INPUT_A_ONOFF:
-		case TRANS_DDI_EDP_INPUT_A_ON:
-			trans_pipe = PIPE_A;
-			break;
-		case TRANS_DDI_EDP_INPUT_B_ONOFF:
-			trans_pipe = PIPE_B;
-			break;
-		case TRANS_DDI_EDP_INPUT_C_ONOFF:
-			trans_pipe = PIPE_C;
-			break;
-		case TRANS_DDI_EDP_INPUT_D_ONOFF:
-			trans_pipe = PIPE_D;
-			break;
+			if (!(tmp & TRANS_DDI_FUNC_ENABLE))
+				continue;
+
+			switch (tmp & TRANS_DDI_EDP_INPUT_MASK) {
+			default:
+				drm_WARN(display->drm, 1,
+					 "unknown pipe linked to transcoder %s\n",
+					 transcoder_name(cpu_transcoder));
+				fallthrough;
+			case TRANS_DDI_EDP_INPUT_A_ONOFF:
+			case TRANS_DDI_EDP_INPUT_A_ON:
+				trans_pipe = PIPE_A;
+				break;
+			case TRANS_DDI_EDP_INPUT_B_ONOFF:
+				trans_pipe = PIPE_B;
+				break;
+			case TRANS_DDI_EDP_INPUT_C_ONOFF:
+				trans_pipe = PIPE_C;
+				break;
+			case TRANS_DDI_EDP_INPUT_D_ONOFF:
+				trans_pipe = PIPE_D;
+				break;
+			}
 		}
 
 		if (trans_pipe == crtc->pipe)
@@ -3857,6 +3902,13 @@ static bool hsw_get_transcoder_state(struct intel_crtc *crtc,
 			pipe_config->pch_pfit.force_thru = true;
 	}
 
+	if (intel_writeback_transcoder_is_wd(pipe_config->cpu_transcoder)) {
+		tmp = intel_de_read(display,
+				    TRANSCONF_WD(pipe_config->cpu_transcoder));
+
+		return tmp & WD_TRANS_ENABLE;
+	}
+
 	tmp = intel_de_read(display,
 			    TRANSCONF(display, pipe_config->cpu_transcoder));
 
@@ -3952,7 +4004,8 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 	    DISPLAY_VER(display) >= 11)
 		intel_get_transcoder_timings(crtc, pipe_config);
 
-	if (transcoder_has_vrr(pipe_config))
+	if (!intel_writeback_transcoder_is_wd(pipe_config->cpu_transcoder) &&
+	    transcoder_has_vrr(pipe_config))
 		intel_vrr_get_config(pipe_config);
 
 	intel_get_pipe_src_size(crtc, pipe_config);
@@ -3965,6 +4018,8 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 			pipe_config->output_format = INTEL_OUTPUT_FORMAT_YCBCR444;
 		else
 			pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
+	} else if (intel_writeback_transcoder_is_wd(pipe_config->cpu_transcoder)) {
+		pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
 	} else {
 		pipe_config->output_format =
 			bdw_get_pipe_misc_output_format(crtc);
@@ -3991,6 +4046,7 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 	hsw_ips_get_config(pipe_config);
 
 	if (pipe_config->cpu_transcoder != TRANSCODER_EDP &&
+	    !intel_writeback_transcoder_is_wd(pipe_config->cpu_transcoder) &&
 	    !transcoder_is_dsi(pipe_config->cpu_transcoder)) {
 		pipe_config->pixel_multiplier =
 			intel_de_read(display,
@@ -3999,7 +4055,8 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 		pipe_config->pixel_multiplier = 1;
 	}
 
-	if (!transcoder_is_dsi(pipe_config->cpu_transcoder)) {
+	if (!intel_writeback_transcoder_is_wd(pipe_config->cpu_transcoder) &&
+	    !transcoder_is_dsi(pipe_config->cpu_transcoder)) {
 		tmp = intel_de_read(display, CHICKEN_TRANS(display, pipe_config->cpu_transcoder));
 
 		pipe_config->framestart_delay = REG_FIELD_GET(HSW_FRAME_START_DELAY_MASK, tmp) + 1;
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index ce3f9810c42d..8d680a69f773 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -203,6 +203,9 @@ static void intel_panel_info(struct seq_file *m,
 {
 	const struct drm_display_mode *fixed_mode;
 
+	if (connector->base.connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
+		return;
+
 	if (list_empty(&connector->panel.fixed_modes))
 		return;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 33e0398120c8..390edbe90543 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4381,6 +4381,9 @@ int intel_dpll_compute(struct intel_atomic_state *state,
 	struct intel_display *display = to_intel_display(state);
 	const struct intel_dpll_mgr *dpll_mgr = display->dpll.mgr;
 
+	if (encoder->type == INTEL_OUTPUT_WRITEBACK)
+		return 0;
+
 	if (drm_WARN_ON(display->drm, !dpll_mgr))
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index 81efdb17fc0c..cee7d5ed230c 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -395,7 +395,7 @@ int intel_opregion_notify_encoder(struct intel_encoder *encoder,
 	int ret;
 
 	/* don't care about old stuff for now */
-	if (!HAS_DDI(display))
+	if (!HAS_DDI(display) || encoder->type == INTEL_OUTPUT_WRITEBACK)
 		return 0;
 
 	/* Avoid port out of bounds checks if SWSCI isn't there. */
diff --git a/drivers/gpu/drm/i915/display/intel_pmdemand.c b/drivers/gpu/drm/i915/display/intel_pmdemand.c
index d806c15db7ce..add898fe2ac1 100644
--- a/drivers/gpu/drm/i915/display/intel_pmdemand.c
+++ b/drivers/gpu/drm/i915/display/intel_pmdemand.c
@@ -155,6 +155,9 @@ intel_pmdemand_update_phys_mask(struct intel_display *display,
 	if (!encoder)
 		return;
 
+	if (encoder->type == INTEL_OUTPUT_WRITEBACK)
+		return;
+
 	if (intel_encoder_is_tc(encoder))
 		return;
 
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 8e799e225af1..3567e29f1cf9 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -20,6 +20,7 @@
 #include "intel_qp_tables.h"
 #include "intel_vdsc.h"
 #include "intel_vdsc_regs.h"
+#include "intel_writeback.h"
 
 bool intel_dsc_source_support(const struct intel_crtc_state *crtc_state)
 {
@@ -989,6 +990,9 @@ void intel_dsc_get_config(struct intel_crtc_state *crtc_state)
 	if (!intel_dsc_source_support(crtc_state))
 		return;
 
+	if (intel_writeback_transcoder_is_wd(cpu_transcoder))
+		return;
+
 	power_domain = intel_dsc_power_domain(crtc, cpu_transcoder);
 
 	wakeref = intel_display_power_get_if_enabled(display, power_domain);
diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index f8e940d91cb7..f4025a4518e4 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -55,6 +55,11 @@ static const u32 writeback_formats[] = {
 	DRM_FORMAT_XBGR2101010,
 };
 
+bool intel_writeback_transcoder_is_wd(enum transcoder transcoder)
+{
+	return transcoder == TRANSCODER_WD_0 || transcoder == TRANSCODER_WD_1;
+}
+
 static struct intel_writeback_connector
 *enc_to_intel_writeback_connector(struct intel_encoder *encoder)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_writeback.h b/drivers/gpu/drm/i915/display/intel_writeback.h
index 83a986753c4c..3a99a6526841 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.h
+++ b/drivers/gpu/drm/i915/display/intel_writeback.h
@@ -17,6 +17,7 @@ struct intel_writeback_connector;
 int intel_writeback_init(struct intel_display *display);
 void intel_writeback_atomic_commit(struct intel_atomic_state *state);
 void intel_writeback_isr_handler(struct intel_display *display);
+bool intel_writeback_transcoder_is_wd(enum transcoder transcoder);
 
 #endif /* __INTEL_WRITEBACK_H__ */
 
-- 
2.34.1

