Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77263A7F38F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 06:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11A610E5B8;
	Tue,  8 Apr 2025 04:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JMYHmaUH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C989210E5B4;
 Tue,  8 Apr 2025 04:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744086318; x=1775622318;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=KEcIuOCrSSuglA3RtYj5vhNDafqgLC1de3Gt9qJW1BA=;
 b=JMYHmaUHEWEUyDFth+0MwI7bS9eUlIWmGbGjUO3b/p+3dU+C8DC30RPQ
 NY22V11/2hlXAX0qyU1X5SL7l7wJwPZuvXRwpUS7FgyEozQK2nEN1TN4v
 v0inqSi6uIB42U5qbY7Zuw84mGpNHXkm3BfZ5WMjnBMIeHhpE26MyairD
 zREh4RM0EI2icO/BlUan3Bxd30/0RaXNUhZaP+DbVNcQWcGH8otYxeCD5
 IxKEUPSRAZY4xk/ErdCLjpSuLSZ+kVrZ52u2nLoI/aAIZKGedHQI/rh6R
 v0DR4RuQFj1giohTBUyxGAPTxi7HeR6iptUfiTGouS8TVG7R1MlyA2i5X g==;
X-CSE-ConnectionGUID: 4wDavFTCTw+WxadeCAy4fQ==
X-CSE-MsgGUID: Arp5kPbmRBGgFHKDPKZNAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="63043688"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="63043688"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 21:25:18 -0700
X-CSE-ConnectionGUID: wKJLJl4CTYyfDfs2t7WqRQ==
X-CSE-MsgGUID: QcVuGxqLQ+Sa7tkXn3OrnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="128479411"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa008.fm.intel.com with ESMTP; 07 Apr 2025 21:25:17 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 08 Apr 2025 09:40:36 +0530
Subject: [PATCH 3/3] drm/i915/audio: move min_hblank from dp_mst to audio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-hblank-v1-3-4ba17aebee65@intel.com>
References: <20250408-hblank-v1-0-4ba17aebee65@intel.com>
In-Reply-To: <20250408-hblank-v1-0-4ba17aebee65@intel.com>
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

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c  | 78 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 51 +------------------
 2 files changed, 79 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index ea935a5d94c87202a68f84b28b0152835f47fe73..b73cb208a37c6d4928c1ce16d2ab689626dcbbc5 100644
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
@@ -184,6 +188,62 @@ static const struct hdmi_aud_ncts hdmi_aud_ncts_36bpp[] = {
 	{ 192000, TMDS_445_5M, 20480, 371250 },
 };
 
+static void intel_audio_compute_min_hblank(struct intel_crtc_state *crtc_state,
+					   struct drm_connector_state *conn_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	const struct drm_display_mode *adjusted_mode =
+					&crtc_state->hw.adjusted_mode;
+	struct intel_connector *connector = to_intel_connector(conn_state->connector);
+	int symbol_size = intel_dp_is_uhbr(crtc_state) ? 32 : 8;
+	int min_sym_cycles = intel_dp_is_uhbr(crtc_state) ? 3 : 5;
+	bool is_dsc = crtc_state->dsc.compression_enable;
+	int bpp = is_dsc ? crtc_state->dsc.compressed_bpp_x16 :
+			   crtc_state->pipe_bpp;
+	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
+	u8 lane_count = crtc_state->lane_count;
+	int min_hblank, htotal, hactive;
+	int hactive_sym_cycles, htotal_sym_cycles;
+	int dsc_slices = intel_dp_mst_dsc_get_slice_count(connector,
+							  crtc_state);
+
+	if (DISPLAY_VER(display) < 30)
+		return;
+
+	/* Calculate min Hblank Link Layer Symbol Cycle Count for 8b/10b MST & 128b/132b */
+	hactive = adjusted_mode->hdisplay;
+	htotal = adjusted_mode->htotal;
+
+	hactive_sym_cycles = is_dsc ? drm_dp_link_dsc_symbol_cycles(lane_count,
+								    hactive,
+								    dsc_slices,
+								    bpp,
+								    symbol_size,
+								    is_mst) :
+				      drm_dp_link_symbol_cycles(lane_count,
+								hactive,
+								bpp,
+								symbol_size,
+								is_mst);
+	htotal_sym_cycles = htotal * hactive_sym_cycles / hactive;
+
+	min_hblank = DIV_ROUND_UP((htotal_sym_cycles * bpp),
+				  (4 * symbol_size)) - hactive_sym_cycles;
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
+
 /*
  * WA_14020863754: Implement Audio Workaround
  * Corner case with Min Hblank Fix can cause audio hang
@@ -715,6 +775,8 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
 	memcpy(crtc_state->eld, connector->eld, sizeof(crtc_state->eld));
 
 	crtc_state->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
+
+	intel_audio_compute_min_hblank(crtc_state, conn_state);
 	mutex_unlock(&connector->eld_mutex);
 
 	return true;
@@ -778,6 +840,19 @@ void intel_audio_codec_enable(struct intel_encoder *encoder,
 	intel_lpe_audio_notify(display, cpu_transcoder, port, crtc_state->eld,
 			       crtc_state->port_clock,
 			       intel_crtc_has_dp_encoder(crtc_state));
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
 
 /**
@@ -834,6 +909,9 @@ void intel_audio_codec_disable(struct intel_encoder *encoder,
 	}
 
 	intel_lpe_audio_notify(display, cpu_transcoder, port, NULL, 0, false);
+
+	if (DISPLAY_VER(display) >= 30)
+		intel_de_write(display, DP_MIN_HBLANK_CTL(cpu_transcoder), 0);
 }
 
 static void intel_acomp_get_config(struct intel_encoder *encoder,
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

