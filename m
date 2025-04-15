Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8261A8961B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 10:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D1D10E68B;
	Tue, 15 Apr 2025 08:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjwsSMNS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DF510E686;
 Tue, 15 Apr 2025 08:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744704599; x=1776240599;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=laMVwuquxzSo3gaZBBZfKh/Wc5qA0iiGgAzCjYeUFCA=;
 b=fjwsSMNSxGijqwcfKE1RlFPN7hhi9ew3TqWEf1tkTV0B7VBtp/m1aF0B
 XSQml2UCvEXZ71jL8FQJtktBA2OMV2Vr3c1Mmb/OjHH55x2nSmzzWXk6E
 53xIT7P/w17DNz0ctcZmJL/8lia9R5EYMnlzExUB2zZSB9m29pKi9Tk1Z
 nB/idE3DeSeuzBBxOBTeDai7ZirBQqTJAwgUbljzym1tcNwhRRIwXI2QP
 qdZstVLieGj6OuMmFDmoWK2xFudEw7FLLnQruVH7HRZSm1xUwLkf1shD8
 vBOkvMzXmeZczOip1GcqKArnrY8KbOp6PJPXarpWhBC0IfL2vSzy72CIG Q==;
X-CSE-ConnectionGUID: 80YrmJPyQZ6WggOyQDThXw==
X-CSE-MsgGUID: NXTPzNoTRyCp3IqXZmECSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57191757"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="57191757"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 01:09:59 -0700
X-CSE-ConnectionGUID: wTa8zdVyTL+H6dGRNiPRlA==
X-CSE-MsgGUID: l6r/+lurQjawCOpcTUXUtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130594878"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa010.fm.intel.com with ESMTP; 15 Apr 2025 01:09:56 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 15 Apr 2025 13:25:09 +0530
Subject: [PATCH v2 3/3] drm/i915/display: move min_hblank from dp_mst.c to dp.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-hblank-v2-3-1a23e9d97360@intel.com>
References: <20250415-hblank-v2-0-1a23e9d97360@intel.com>
In-Reply-To: <20250415-hblank-v2-0-1a23e9d97360@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Minimum HBlank is programmed to address jitter for high resolutions with
high refresh rates that have small Hblank, specifically where Hblank is
smaller than one MTP.

TODO: Add the min_hblank calculation for hdmi as well.

v2: move from intel_audio.c to intel_dp.c
    some correction in link_bpp_x16 (Imre)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c   |  7 ++++
 drivers/gpu/drm/i915/display/intel_display.c | 19 +++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c      | 47 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c  | 51 +---------------------------
 4 files changed, 74 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index ea935a5d94c87202a68f84b28b0152835f47fe73..76107d566d6d7d78c0faf59d049651e1efe2a76d 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -27,9 +27,11 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
 #include <drm/drm_fixed.h>
+#include <drm/display/drm_dp_helper.h>
 #include <drm/intel/i915_component.h>
 
 #include "i915_drv.h"
+#include "i915_reg.h"
 #include "intel_atomic.h"
 #include "intel_audio.h"
 #include "intel_audio_regs.h"
@@ -37,6 +39,8 @@
 #include "intel_crtc.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
+#include "intel_dp.h"
+#include "intel_dp_mst.h"
 #include "intel_lpe_audio.h"
 
 /**
@@ -715,6 +719,7 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
 	memcpy(crtc_state->eld, connector->eld, sizeof(crtc_state->eld));
 
 	crtc_state->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
+
 	mutex_unlock(&connector->eld_mutex);
 
 	return true;
@@ -778,6 +783,7 @@ void intel_audio_codec_enable(struct intel_encoder *encoder,
 	intel_lpe_audio_notify(display, cpu_transcoder, port, crtc_state->eld,
 			       crtc_state->port_clock,
 			       intel_crtc_has_dp_encoder(crtc_state));
+
 }
 
 /**
@@ -834,6 +840,7 @@ void intel_audio_codec_disable(struct intel_encoder *encoder,
 	}
 
 	intel_lpe_audio_notify(display, cpu_transcoder, port, NULL, 0, false);
+
 }
 
 static void intel_acomp_get_config(struct intel_encoder *encoder,
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index dc7517da2ed5c75fb1715d43e6bfc792a8420f30..781b7ab1315730965d255cf14c0a193d226d7ac1 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1782,6 +1782,7 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
 	struct intel_crtc *pipe_crtc;
+	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
 	int i;
 
 	/*
@@ -1797,6 +1798,9 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
 
 	for_each_pipe_crtc_modeset_disable(display, pipe_crtc, old_crtc_state, i)
 		intel_dmc_disable_pipe(display, pipe_crtc->pipe);
+
+	if (DISPLAY_VER(display) >= 30)
+		intel_de_write(display, DP_MIN_HBLANK_CTL(cpu_transcoder), 0);
 }
 
 /* Prefer intel_encoder_is_combo() */
@@ -2726,6 +2730,19 @@ static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_sta
 		intel_de_write(display, TRANS_VTOTAL(display, pipe),
 			       VACTIVE(crtc_vdisplay - 1) |
 			       VTOTAL(crtc_vtotal - 1));
+
+	if (DISPLAY_VER(display) >= 30 && crtc_state->min_hblank) {
+		/*
+		 * Address issues for resolutions with high refresh rate that
+		 * have small Hblank, specifically where Hblank is smaller than
+		 * one MTP. Simulations indicate this will address the
+		 * jitter issues that currently causes BS to be immediately
+		 * followed by BE which DPRX devices are unable to handle.
+		 * https://groups.vesa.org/wg/DP/document/20494
+		 */
+		intel_de_write(display, DP_MIN_HBLANK_CTL(cpu_transcoder),
+			       crtc_state->min_hblank);
+	}
 }
 
 static void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc_state)
@@ -5221,6 +5238,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	PIPE_CONF_CHECK_I(lane_count);
 	PIPE_CONF_CHECK_X(lane_lat_optim_mask);
 
+	PIPE_CONF_CHECK_I(min_hblank);
+
 	if (HAS_DOUBLE_BUFFERED_M_N(display)) {
 		if (!fastset || !pipe_config->update_m_n)
 			PIPE_CONF_CHECK_M_N(dp_m_n);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7b95d62730e6f0c27c07fb59f16476369c4762a4..03bcf0b891a72167cd6249f07802debbffdc78ef 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3103,6 +3103,51 @@ intel_dp_queue_modeset_retry_for_link(struct intel_atomic_state *state,
 	}
 }
 
+static void intel_dp_compute_min_hblank(int link_bpp_x16,
+					struct intel_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	const struct drm_display_mode *adjusted_mode =
+					&crtc_state->hw.adjusted_mode;
+	struct intel_connector *connector = to_intel_connector(conn_state->connector);
+	int symbol_size = intel_dp_is_uhbr(crtc_state) ? 32 : 8;
+	int min_sym_cycles = intel_dp_is_uhbr(crtc_state) ? 3 : 5;
+	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
+	int min_hblank;
+	int max_lane_count = 4;
+	int hactive_sym_cycles, htotal_sym_cycles;
+	int dsc_slices = intel_dp_mst_dsc_get_slice_count(connector,
+							  crtc_state);
+
+	if (DISPLAY_VER(display) < 30)
+		return;
+
+	/* Calculate min Hblank Link Layer Symbol Cycle Count for 8b/10b MST & 128b/132b */
+	hactive_sym_cycles = drm_dp_link_symbol_cycles(max_lane_count,
+						       adjusted_mode->hdisplay,
+						       link_bpp_x16,
+						       symbol_size,
+						       is_mst,
+						       dsc_slices);
+	htotal_sym_cycles = adjusted_mode->htotal *
+			    (hactive_sym_cycles / adjusted_mode->hdisplay);
+
+	min_hblank = htotal_sym_cycles - hactive_sym_cycles;
+	/* minimum Hblank calculation: https://groups.vesa.org/wg/DP/document/20494 */
+	min_hblank = max(min_hblank, min_sym_cycles);
+
+	/*
+	 * adjust the BlankingStart/BlankingEnd framing control from
+	 * the calculated value
+	 */
+	min_hblank = min_hblank - 2;
+
+	/* Maximum value to be programmed is limited to 10 */
+	min_hblank = min(10, min_hblank);
+	crtc_state->min_hblank = min_hblank;
+}
+
 int
 intel_dp_compute_config(struct intel_encoder *encoder,
 			struct intel_crtc_state *pipe_config,
@@ -3202,6 +3247,8 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 				       &pipe_config->dp_m_n);
 	}
 
+	intel_dp_compute_min_hblank(link_bpp_x16, pipe_config, conn_state);
+
 	/* FIXME: abstract this better */
 	if (pipe_config->splitter.enable)
 		pipe_config->dp_m_n.data_m *= pipe_config->splitter.link_count;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index af98a0d0e8376a79ce1ab6ff3c4f6af30f4d3e73..dae74c645c1a1d716504b7843fe1a5c8ace0d87d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -211,26 +211,6 @@ int intel_dp_mst_dsc_get_slice_count(const struct intel_connector *connector,
 					    num_joined_pipes);
 }
 
-static void intel_dp_mst_compute_min_hblank(struct intel_crtc_state *crtc_state,
-					    int bpp_x16)
-{
-	struct intel_display *display = to_intel_display(crtc_state);
-	const struct drm_display_mode *adjusted_mode =
-					&crtc_state->hw.adjusted_mode;
-	int symbol_size = intel_dp_is_uhbr(crtc_state) ? 32 : 8;
-	int hblank;
-
-	if (DISPLAY_VER(display) < 20)
-		return;
-
-	/* Calculate min Hblank Link Layer Symbol Cycle Count for 8b/10b MST & 128b/132b */
-	hblank = DIV_ROUND_UP((DIV_ROUND_UP
-			       (adjusted_mode->htotal - adjusted_mode->hdisplay, 4) * bpp_x16),
-			      symbol_size);
-
-	crtc_state->min_hblank = hblank;
-}
-
 int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
 				   struct intel_crtc_state *crtc_state,
 				   struct drm_connector_state *conn_state,
@@ -301,8 +281,6 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
 		local_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
 							     false, dsc_slice_count, link_bpp_x16);
 
-		intel_dp_mst_compute_min_hblank(crtc_state, link_bpp_x16);
-
 		intel_dp_mst_compute_m_n(crtc_state,
 					 local_bw_overhead,
 					 link_bpp_x16,
@@ -998,7 +976,6 @@ static void mst_stream_disable(struct intel_atomic_state *state,
 	struct intel_dp *intel_dp = to_primary_dp(encoder);
 	struct intel_connector *connector =
 		to_intel_connector(old_conn_state->connector);
-	enum transcoder trans = old_crtc_state->cpu_transcoder;
 
 	drm_dbg_kms(display->drm, "active links %d\n",
 		    intel_dp->mst.active_links);
@@ -1009,9 +986,6 @@ static void mst_stream_disable(struct intel_atomic_state *state,
 	intel_hdcp_disable(intel_mst->connector);
 
 	intel_dp_sink_disable_decompression(state, connector, old_crtc_state);
-
-	if (DISPLAY_VER(display) >= 20)
-		intel_de_write(display, DP_MIN_HBLANK_CTL(trans), 0);
 }
 
 static void mst_stream_post_disable(struct intel_atomic_state *state,
@@ -1286,7 +1260,7 @@ static void mst_stream_enable(struct intel_atomic_state *state,
 	enum transcoder trans = pipe_config->cpu_transcoder;
 	bool first_mst_stream = intel_dp->mst.active_links == 1;
 	struct intel_crtc *pipe_crtc;
-	int ret, i, min_hblank;
+	int ret, i;
 
 	drm_WARN_ON(display->drm, pipe_config->has_pch_encoder);
 
@@ -1301,29 +1275,6 @@ static void mst_stream_enable(struct intel_atomic_state *state,
 			       TRANS_DP2_VFREQ_PIXEL_CLOCK(crtc_clock_hz & 0xffffff));
 	}
 
-	if (DISPLAY_VER(display) >= 20) {
-		/*
-		 * adjust the BlankingStart/BlankingEnd framing control from
-		 * the calculated value
-		 */
-		min_hblank = pipe_config->min_hblank - 2;
-
-		/* Maximum value to be programmed is limited to 0x10 */
-		min_hblank = min(0x10, min_hblank);
-
-		/*
-		 * Minimum hblank accepted for 128b/132b would be 5 and for
-		 * 8b/10b would be 3 symbol count
-		 */
-		if (intel_dp_is_uhbr(pipe_config))
-			min_hblank = max(min_hblank, 5);
-		else
-			min_hblank = max(min_hblank, 3);
-
-		intel_de_write(display, DP_MIN_HBLANK_CTL(trans),
-			       min_hblank);
-	}
-
 	enable_bs_jitter_was(pipe_config);
 
 	intel_ddi_enable_transcoder_func(encoder, pipe_config);

-- 
2.25.1

