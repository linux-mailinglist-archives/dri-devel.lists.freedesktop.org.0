Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00B3A91A02
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 13:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C5A10EAC2;
	Thu, 17 Apr 2025 11:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBmD98Hr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B4A10EABE;
 Thu, 17 Apr 2025 11:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744888024; x=1776424024;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=scmb6/tCMdoAqD91dD2rOfbcH0PT/S35W4eP7LfFx8Y=;
 b=oBmD98HrIbW5REownFEGnHLAOxrX0m7jFA7pb1xoCmK45CZ2NKUeR/qz
 jXjm888+8fTFR1eMcU9RWAAMzUZnqJpTbAiUbx3E4z4EPWtJQLWJOomTk
 W/1Wp8lCgxsDcB1WadTJ04rYMr/NaUMVnlHG85Z8JB8WcQbVwBx6YBSDb
 fZs8VfzG8zecoB+ipcA2WOdChgEvtOJOgEDp6DYwYFO4P6zxN9WYxjP3j
 TDhNHFVs5FOLv3vNs8VrbGqLth++hJJ1zqVMnQtohZcLA2b/5yv7WiVBd
 ZekhoMmH2n0OF3qOY2PAycI/3n2IxPODnVOwMWqSj70WT4kTdUkpx/SlN A==;
X-CSE-ConnectionGUID: atiN00giSvKyDt4ZDonpwg==
X-CSE-MsgGUID: SnAN9EHjTvybGCFkHeLBHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46481075"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46481075"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 04:07:03 -0700
X-CSE-ConnectionGUID: Ar5rFXUMTnmTC8pf00CiCQ==
X-CSE-MsgGUID: u1ngdMiLRYa3gMpFtXLVKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="131754046"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa008.jf.intel.com with ESMTP; 17 Apr 2025 04:07:01 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 17 Apr 2025 16:22:30 +0530
Subject: [PATCH v3 3/3] drm/i915/display: move min_hblank from dp_mst.c to dp.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-hblank-v3-3-d3387df7efce@intel.com>
References: <20250417-hblank-v3-0-d3387df7efce@intel.com>
In-Reply-To: <20250417-hblank-v3-0-d3387df7efce@intel.com>
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
v3: min_hblank for 8b/10b MST and 128b/132b SST/MST
    handle error for intel_dp_mst_dsc_get_slice_count
    reset min_hblank before disabling transcoder (Imre)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 18 ++++++++
 drivers/gpu/drm/i915/display/intel_dp.c      | 64 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h      |  4 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c  | 52 +---------------------
 4 files changed, 88 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index dc7517da2ed5c75fb1715d43e6bfc792a8420f30..ad41382981299dffab5cc592b43cdab7eebb7b5b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1782,8 +1782,11 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
 	struct intel_crtc *pipe_crtc;
+	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
 	int i;
 
+	if (DISPLAY_VER(display) >= 30)
+		intel_de_write(display, DP_MIN_HBLANK_CTL(cpu_transcoder), 0);
 	/*
 	 * FIXME collapse everything to one hook.
 	 * Need care with mst->ddi interactions.
@@ -2726,6 +2729,19 @@ static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_sta
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
@@ -5221,6 +5237,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	PIPE_CONF_CHECK_I(lane_count);
 	PIPE_CONF_CHECK_X(lane_lat_optim_mask);
 
+	PIPE_CONF_CHECK_I(min_hblank);
+
 	if (HAS_DOUBLE_BUFFERED_M_N(display)) {
 		if (!fastset || !pipe_config->update_m_n)
 			PIPE_CONF_CHECK_M_N(dp_m_n);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7b95d62730e6f0c27c07fb59f16476369c4762a4..7b114b7cc86cc78088ca27e2cb7b08b8491d8283 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3103,6 +3103,67 @@ intel_dp_queue_modeset_retry_for_link(struct intel_atomic_state *state,
 	}
 }
 
+void intel_dp_compute_min_hblank(int link_bpp_x16,
+				 struct intel_crtc_state *crtc_state,
+				 struct drm_connector_state *conn_state,
+				 bool is_dsc)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	const struct drm_display_mode *adjusted_mode =
+					&crtc_state->hw.adjusted_mode;
+	struct intel_connector *connector = to_intel_connector(conn_state->connector);
+	int symbol_size = intel_dp_is_uhbr(crtc_state) ? 32 : 8;
+	/*
+	 * min symbol cycles is 3(BS,VBID, BE) for 128b/132b and
+	 * 5(BS, VBID, MVID, MAUD) for 8b/10b
+	 */
+	int min_sym_cycles = intel_dp_is_uhbr(crtc_state) ? 3 : 5;
+	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
+	int min_hblank;
+	int max_lane_count = 4;
+	int hactive_sym_cycles, htotal_sym_cycles;
+	int dsc_slices = 0;
+
+	if (DISPLAY_VER(display) < 30)
+		return;
+
+	/* MIN_HBLANK should be set only for 8b/10b MST or for 128b/132b SST/MST */
+	if (intel_dp_is_uhbr(crtc_state) || (is_mst && !intel_dp_is_uhbr(crtc_state)))
+		return;
+
+	if (is_dsc) {
+		dsc_slices = intel_dp_mst_dsc_get_slice_count(connector,
+							      crtc_state);
+		if (!dsc_slices) {
+			drm_dbg(display->drm, "failed to calculate dsc slice count\n");
+			return;
+		}
+	}
+
+	/* Calculate min Hblank Link Layer Symbol Cycle Count for 8b/10b MST & 128b/132b */
+	hactive_sym_cycles = drm_dp_link_data_symbol_cycles(max_lane_count,
+							    adjusted_mode->hdisplay,
+							    link_bpp_x16,
+							    symbol_size,
+							    is_mst,
+							    dsc_slices);
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
+	min_hblank = min(10, min_hblank);
+	crtc_state->min_hblank = min_hblank;
+}
+
 int
 intel_dp_compute_config(struct intel_encoder *encoder,
 			struct intel_crtc_state *pipe_config,
@@ -3202,6 +3263,9 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 				       &pipe_config->dp_m_n);
 	}
 
+	intel_dp_compute_min_hblank(link_bpp_x16, pipe_config, conn_state,
+				    pipe_config->dsc.compression_enable);
+
 	/* FIXME: abstract this better */
 	if (pipe_config->splitter.enable)
 		pipe_config->dp_m_n.data_m *= pipe_config->splitter.link_count;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 9189db4c25946a0f082223ce059c242e80cc32dc..43624aead998a8a330a244bb9c85f026e203171b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -208,5 +208,9 @@ bool intel_dp_has_connector(struct intel_dp *intel_dp,
 			    const struct drm_connector_state *conn_state);
 int intel_dp_dsc_max_src_input_bpc(struct intel_display *display);
 int intel_dp_dsc_min_src_input_bpc(void);
+void intel_dp_compute_min_hblank(int link_bpp_x16,
+				 struct intel_crtc_state *crtc_state,
+				 struct drm_connector_state *conn_state,
+				 bool is_dsc);
 
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index af98a0d0e8376a79ce1ab6ff3c4f6af30f4d3e73..4153afa13c618bb4db6dbcdc6e59faddcbeade6b 100644
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
@@ -301,12 +281,11 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
 		local_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
 							     false, dsc_slice_count, link_bpp_x16);
 
-		intel_dp_mst_compute_min_hblank(crtc_state, link_bpp_x16);
-
 		intel_dp_mst_compute_m_n(crtc_state,
 					 local_bw_overhead,
 					 link_bpp_x16,
 					 &crtc_state->dp_m_n);
+		intel_dp_compute_min_hblank(link_bpp_x16, crtc_state, conn_state, dsc);
 
 		if (is_mst) {
 			int remote_bw_overhead;
@@ -998,7 +977,6 @@ static void mst_stream_disable(struct intel_atomic_state *state,
 	struct intel_dp *intel_dp = to_primary_dp(encoder);
 	struct intel_connector *connector =
 		to_intel_connector(old_conn_state->connector);
-	enum transcoder trans = old_crtc_state->cpu_transcoder;
 
 	drm_dbg_kms(display->drm, "active links %d\n",
 		    intel_dp->mst.active_links);
@@ -1009,9 +987,6 @@ static void mst_stream_disable(struct intel_atomic_state *state,
 	intel_hdcp_disable(intel_mst->connector);
 
 	intel_dp_sink_disable_decompression(state, connector, old_crtc_state);
-
-	if (DISPLAY_VER(display) >= 20)
-		intel_de_write(display, DP_MIN_HBLANK_CTL(trans), 0);
 }
 
 static void mst_stream_post_disable(struct intel_atomic_state *state,
@@ -1286,7 +1261,7 @@ static void mst_stream_enable(struct intel_atomic_state *state,
 	enum transcoder trans = pipe_config->cpu_transcoder;
 	bool first_mst_stream = intel_dp->mst.active_links == 1;
 	struct intel_crtc *pipe_crtc;
-	int ret, i, min_hblank;
+	int ret, i;
 
 	drm_WARN_ON(display->drm, pipe_config->has_pch_encoder);
 
@@ -1301,29 +1276,6 @@ static void mst_stream_enable(struct intel_atomic_state *state,
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

