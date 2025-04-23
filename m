Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABFBA98672
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 11:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B936810E66C;
	Wed, 23 Apr 2025 09:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LY9fQ6MX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B83D10E674;
 Wed, 23 Apr 2025 09:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745401939; x=1776937939;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=r4qqDZrWY+GHBfNicFtr7V/j6O/UpFISLIc5BHssD6Q=;
 b=LY9fQ6MXAziex+bYZn1ikXQNc6AUGcKwduZG6deTPFCk/6hn2GMBze9d
 0ZQ/eCIEzfjs8cq/OgSAtgoBRiuUfF/ShejM4xxfqYIjRLgXyZsZMLzEK
 746qrD9aDq7obkLGypih5dHxrL0o7Zkbod/Xa25D86eoO1Z+lNNRH0xRK
 CzjsI8/GVceoSVcBaQndXi+O0ktSEzGGcNxIsdsKEE7pu4UUB4ADwqn+w
 EWWsYEaSP97mL7UnryfpifrbkBpdvJzoslfSxK/VDOU9te4vebeJFF+e6
 6iuBB/VaycdfJEEEzOh/r2KnhR1eVLcM6uiGAdSBSKtzdqcTzSoxgu7rI A==;
X-CSE-ConnectionGUID: jSZsJkNhQWKVsiC6oZIkfQ==
X-CSE-MsgGUID: VOllbdO9RdSO1RgdO6K//w==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46221937"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="46221937"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 02:52:18 -0700
X-CSE-ConnectionGUID: 3lRBdskpTBCacpy0/kkcRw==
X-CSE-MsgGUID: pWcEvlCgR0+51Zoq7CP/gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="163327170"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa001.fm.intel.com with ESMTP; 23 Apr 2025 02:52:16 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 23 Apr 2025 15:07:40 +0530
Subject: [PATCH v4 2/2] drm/i915/display: move min_hblank from dp_mst.c to dp.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-hblank-v4-2-8e513cc54652@intel.com>
References: <20250423-hblank-v4-0-8e513cc54652@intel.com>
In-Reply-To: <20250423-hblank-v4-0-8e513cc54652@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: imre.deak@intel.com, vinod.govindapillai@intel.com, 
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
v4: compute link_bpp_x16 within compute_min_hblank,
    return error in case of compute failure
    call compute_min_hblank() before vrr_compute_config (Imre)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 17 +++++++
 drivers/gpu/drm/i915/display/intel_dp.c      | 76 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h      |  3 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c  | 57 +++------------------
 4 files changed, 102 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 33c09999c42e046c7a8b6e6143be0b81650ee7f7..6425296d99f408582cd10d9ffdae94beb2ea2521 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2723,6 +2723,19 @@ static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_sta
 		intel_de_write(display, TRANS_VTOTAL(display, pipe),
 			       VACTIVE(crtc_vdisplay - 1) |
 			       VTOTAL(crtc_vtotal - 1));
+
+	if (DISPLAY_VER(display) >= 30) {
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
@@ -2866,6 +2879,8 @@ static void intel_get_transcoder_timings(struct intel_crtc *crtc,
 			adjusted_mode->crtc_vdisplay +
 			intel_de_read(display,
 				      TRANS_SET_CONTEXT_LATENCY(display, cpu_transcoder));
+	pipe_config->min_hblank = intel_de_read(display,
+						DP_MIN_HBLANK_CTL(cpu_transcoder));
 }
 
 static void intel_joiner_adjust_pipe_src(struct intel_crtc_state *crtc_state)
@@ -5216,6 +5231,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	PIPE_CONF_CHECK_I(lane_count);
 	PIPE_CONF_CHECK_X(lane_lat_optim_mask);
 
+	PIPE_CONF_CHECK_I(min_hblank);
+
 	if (HAS_DOUBLE_BUFFERED_M_N(display)) {
 		if (!fastset || !pipe_config->update_m_n)
 			PIPE_CONF_CHECK_M_N(dp_m_n);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d7a30d0992b7a65250a3abfecde876321326fa84..c18889cecaf40cd6599adbb3ae0f0feb0c95990f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3104,6 +3104,77 @@ intel_dp_queue_modeset_retry_for_link(struct intel_atomic_state *state,
 	}
 }
 
+int intel_dp_compute_min_hblank(struct intel_crtc_state *crtc_state,
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
+	 * 5(BS, VBID, MVID, MAUD, BE) for 8b/10b
+	 */
+	int min_sym_cycles = intel_dp_is_uhbr(crtc_state) ? 3 : 5;
+	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
+	int num_joined_pipes = intel_crtc_num_joined_pipes(crtc_state);
+	int min_hblank;
+	int max_lane_count = 4;
+	int hactive_sym_cycles, htotal_sym_cycles;
+	int dsc_slices = 0;
+	int link_bpp_x16;
+
+	if (DISPLAY_VER(display) < 30)
+		return 0;
+
+	/* MIN_HBLANK should be set only for 8b/10b MST or for 128b/132b SST/MST */
+	if (!is_mst && !intel_dp_is_uhbr(crtc_state))
+		return 0;
+
+	if (is_dsc) {
+		dsc_slices = intel_dp_dsc_get_slice_count(connector,
+						     adjusted_mode->crtc_clock,
+						     adjusted_mode->crtc_hdisplay,
+						     num_joined_pipes);
+		if (!dsc_slices) {
+			drm_dbg(display->drm, "failed to calculate dsc slice count\n");
+			return -EINVAL;
+		}
+	}
+
+	if (crtc_state->dsc.compression_enable)
+		link_bpp_x16 = crtc_state->dsc.compressed_bpp_x16;
+	else
+		link_bpp_x16 = fxp_q4_from_int(intel_dp_output_bpp(crtc_state->output_format,
+								   crtc_state->pipe_bpp));
+
+	/* Calculate min Hblank Link Layer Symbol Cycle Count for 8b/10b MST & 128b/132b */
+	hactive_sym_cycles = drm_dp_link_symbol_cycles(max_lane_count,
+						       adjusted_mode->hdisplay,
+						       dsc_slices,
+						       link_bpp_x16,
+						       symbol_size, is_mst);
+	htotal_sym_cycles = (adjusted_mode->htotal * hactive_sym_cycles) /
+			     adjusted_mode->hdisplay;
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
+
+	return 0;
+}
+
 int
 intel_dp_compute_config(struct intel_encoder *encoder,
 			struct intel_crtc_state *pipe_config,
@@ -3203,6 +3274,11 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 				       &pipe_config->dp_m_n);
 	}
 
+	ret = intel_dp_compute_min_hblank(pipe_config, conn_state,
+					  pipe_config->dsc.compression_enable);
+	if (ret)
+		return ret;
+
 	/* FIXME: abstract this better */
 	if (pipe_config->splitter.enable)
 		pipe_config->dp_m_n.data_m *= pipe_config->splitter.link_count;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 9189db4c25946a0f082223ce059c242e80cc32dc..6f2f048295ecaa6cc1f967dc7b3b4cc75f3344c0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -208,5 +208,8 @@ bool intel_dp_has_connector(struct intel_dp *intel_dp,
 			    const struct drm_connector_state *conn_state);
 int intel_dp_dsc_max_src_input_bpc(struct intel_display *display);
 int intel_dp_dsc_min_src_input_bpc(void);
+int intel_dp_compute_min_hblank(struct intel_crtc_state *crtc_state,
+				struct drm_connector_state *conn_state,
+				bool is_dsc);
 
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 4c15dcb103aa2ed5650cbbef8c12be53132e6a80..1108c3749d812a45d1675297220dad23969750fe 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -239,26 +239,6 @@ static int intel_dp_mst_dsc_get_slice_count(const struct intel_connector *connec
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
@@ -329,8 +309,6 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
 		local_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
 							     false, dsc_slice_count, link_bpp_x16);
 
-		intel_dp_mst_compute_min_hblank(crtc_state, link_bpp_x16);
-
 		intel_dp_mst_compute_m_n(crtc_state,
 					 local_bw_overhead,
 					 link_bpp_x16,
@@ -739,6 +717,11 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
 		pipe_config->lane_lat_optim_mask =
 			bxt_dpio_phy_calc_lane_lat_optim_mask(pipe_config->lane_count);
 
+	ret = intel_dp_compute_min_hblank(pipe_config, conn_state,
+					  pipe_config->dsc.compression_enable);
+	if (ret)
+		return ret;
+
 	intel_vrr_compute_config(pipe_config, conn_state);
 
 	intel_dp_audio_compute_config(encoder, pipe_config, conn_state);
@@ -1021,12 +1004,10 @@ static void mst_stream_disable(struct intel_atomic_state *state,
 			       const struct intel_crtc_state *old_crtc_state,
 			       const struct drm_connector_state *old_conn_state)
 {
-	struct intel_display *display = to_intel_display(state);
 	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
 	struct intel_dp *intel_dp = to_primary_dp(encoder);
 	struct intel_connector *connector =
 		to_intel_connector(old_conn_state->connector);
-	enum transcoder trans = old_crtc_state->cpu_transcoder;
 
 	if (intel_dp_mst_active_streams(intel_dp) == 1)
 		intel_dp->link.active = false;
@@ -1034,9 +1015,6 @@ static void mst_stream_disable(struct intel_atomic_state *state,
 	intel_hdcp_disable(intel_mst->connector);
 
 	intel_dp_sink_disable_decompression(state, connector, old_crtc_state);
-
-	if (DISPLAY_VER(display) >= 20)
-		intel_de_write(display, DP_MIN_HBLANK_CTL(trans), 0);
 }
 
 static void mst_stream_post_disable(struct intel_atomic_state *state,
@@ -1305,7 +1283,7 @@ static void mst_stream_enable(struct intel_atomic_state *state,
 	enum transcoder trans = pipe_config->cpu_transcoder;
 	bool first_mst_stream = intel_dp_mst_active_streams(intel_dp) == 1;
 	struct intel_crtc *pipe_crtc;
-	int ret, i, min_hblank;
+	int ret, i;
 
 	drm_WARN_ON(display->drm, pipe_config->has_pch_encoder);
 
@@ -1320,29 +1298,6 @@ static void mst_stream_enable(struct intel_atomic_state *state,
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

