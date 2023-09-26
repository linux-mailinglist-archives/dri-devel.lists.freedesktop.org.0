Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 521BA7AE807
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 10:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D72B10E37E;
	Tue, 26 Sep 2023 08:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1A510E379;
 Tue, 26 Sep 2023 08:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695716967; x=1727252967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tlnJg68d57KB4zu4gV1ip66JVreXrBD3ESQ0aVe2n5Y=;
 b=KvlDL4eM/ov5SIgzezNhEyvmT/1dEd6h9NZW6VubU099kGQysIKPvRg1
 h8w3kmlpQQgk5jDGbo+HdGkVBaohjYxee49Kms27IHxAVJNOimUNrNtQ5
 SboI2zqCh/v3v4EMAfjj5oDs7f4HThcCOJyjzr56BPzvJLxOtxUMh47s/
 zPdEgJH9GXfK0iTZBuEbfUsTzWzI0yK67IgtFEJfy2uYpk7ud4m1uZIU2
 MKNstTBzgCAuXAMVVVwrl9ScJvhz6snbt/Vp0XJlb+c8P0CN1nSas6pAT
 Ku2cG5BAB2tTu4oqDFXgqggSUwJK4O3JrGqEeEVgND0vWrq6wNdBQ7yFa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412431832"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="412431832"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 01:29:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="752079068"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="752079068"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmsmga007.fm.intel.com with ESMTP; 26 Sep 2023 01:29:23 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/8] drm/i915/display: Store compressed bpp in U6.4 format
Date: Tue, 26 Sep 2023 13:53:25 +0530
Message-Id: <20230926082331.739705-3-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230926082331.739705-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20230926082331.739705-1-mitulkumar.ajitkumar.golani@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: suraj.kandpal@intel.com, suijingfeng@loongson.cn, jani.nikula@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, swati2.sharma@intel.com,
 mripard@kernel.org, ankit.k.nautiyal@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

DSC parameter bits_per_pixel is stored in U6.4 format.
The 4 bits represent the fractional part of the bpp.
Currently we use compressed_bpp member of dsc structure to store
only the integral part of the bits_per_pixel.
To store the full bits_per_pixel along with the fractional part,
compressed_bpp is changed to store bpp in U6.4 formats. Intergral
part is retrieved by simply right shifting the member compressed_bpp by 4.

v2:
-Use to_bpp_int, to_bpp_frac_dec, to_bpp_x16 helpers while dealing
 with compressed bpp. (Suraj)
-Fix comment styling. (Suraj)

v3:
-Add separate file for 6.4 fixed point helper(Jani, Nikula)
-Add comment for magic values(Suraj)

v4:
Fix checkpatch warnings caused by renaming(Suraj)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c        | 11 +++---
 drivers/gpu/drm/i915/display/intel_audio.c    |  3 +-
 drivers/gpu/drm/i915/display/intel_bios.c     |  6 ++--
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  6 ++--
 drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
 .../drm/i915/display/intel_display_types.h    |  3 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 33 ++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 26 ++++++++------
 .../i915/display/intel_fractional_helper.h    | 36 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.c     |  5 +--
 10 files changed, 93 insertions(+), 38 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_fractional_helper.h

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index c4585e445198..77b73bd61076 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -43,6 +43,7 @@
 #include "intel_de.h"
 #include "intel_dsi.h"
 #include "intel_dsi_vbt.h"
+#include "intel_fractional_helper.h"
 #include "intel_panel.h"
 #include "intel_vdsc.h"
 #include "intel_vdsc_regs.h"
@@ -330,7 +331,7 @@ static int afe_clk(struct intel_encoder *encoder,
 	int bpp;
 
 	if (crtc_state->dsc.compression_enable)
-		bpp = crtc_state->dsc.compressed_bpp;
+		bpp = intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16);
 	else
 		bpp = mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
 
@@ -860,7 +861,7 @@ gen11_dsi_set_transcoder_timings(struct intel_encoder *encoder,
 	 * compressed and non-compressed bpp.
 	 */
 	if (crtc_state->dsc.compression_enable) {
-		mul = crtc_state->dsc.compressed_bpp;
+		mul = intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16);
 		div = mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
 	}
 
@@ -884,7 +885,7 @@ gen11_dsi_set_transcoder_timings(struct intel_encoder *encoder,
 		int bpp, line_time_us, byte_clk_period_ns;
 
 		if (crtc_state->dsc.compression_enable)
-			bpp = crtc_state->dsc.compressed_bpp;
+			bpp = intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16);
 		else
 			bpp = mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
 
@@ -1451,8 +1452,8 @@ static void gen11_dsi_get_timings(struct intel_encoder *encoder,
 	struct drm_display_mode *adjusted_mode =
 					&pipe_config->hw.adjusted_mode;
 
-	if (pipe_config->dsc.compressed_bpp) {
-		int div = pipe_config->dsc.compressed_bpp;
+	if (pipe_config->dsc.compressed_bpp_x16) {
+		int div = intel_fractional_bpp_from_x16(pipe_config->dsc.compressed_bpp_x16);
 		int mul = mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
 
 		adjusted_mode->crtc_htotal =
diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 19605264a35c..4f1db1581316 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -35,6 +35,7 @@
 #include "intel_crtc.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
+#include "intel_fractional_helper.h"
 #include "intel_lpe_audio.h"
 
 /**
@@ -528,7 +529,7 @@ static unsigned int calc_hblank_early_prog(struct intel_encoder *encoder,
 	h_active = crtc_state->hw.adjusted_mode.crtc_hdisplay;
 	h_total = crtc_state->hw.adjusted_mode.crtc_htotal;
 	pixel_clk = crtc_state->hw.adjusted_mode.crtc_clock;
-	vdsc_bpp = crtc_state->dsc.compressed_bpp;
+	vdsc_bpp = intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16);
 	cdclk = i915->display.cdclk.hw.cdclk;
 	/* fec= 0.972261, using rounding multiplier of 1000000 */
 	fec_coeff = 972261;
diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 4e8f1e91bb08..616492a1a7ef 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -33,6 +33,7 @@
 #include "i915_reg.h"
 #include "intel_display.h"
 #include "intel_display_types.h"
+#include "intel_fractional_helper.h"
 #include "intel_gmbus.h"
 
 #define _INTEL_BIOS_PRIVATE
@@ -3392,8 +3393,9 @@ static void fill_dsc(struct intel_crtc_state *crtc_state,
 
 	crtc_state->pipe_bpp = bpc * 3;
 
-	crtc_state->dsc.compressed_bpp = min(crtc_state->pipe_bpp,
-					     VBT_DSC_MAX_BPP(dsc->max_bpp));
+	crtc_state->dsc.compressed_bpp_x16 =
+		intel_fractional_bpp_to_x16(min(crtc_state->pipe_bpp,
+						VBT_DSC_MAX_BPP(dsc->max_bpp)));
 
 	/*
 	 * FIXME: This is ugly, and slice count should take DSC engine
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index b55a3f75f392..31d008ddd014 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -34,6 +34,7 @@
 #include "intel_de.h"
 #include "intel_dp.h"
 #include "intel_display_types.h"
+#include "intel_fractional_helper.h"
 #include "intel_mchbar_regs.h"
 #include "intel_pci_config.h"
 #include "intel_pcode.h"
@@ -2598,8 +2599,9 @@ static int intel_vdsc_min_cdclk(const struct intel_crtc_state *crtc_state)
 		 * => CDCLK >= compressed_bpp * Pixel clock  / 2 * Bigjoiner Interface bits
 		 */
 		int bigjoiner_interface_bits = DISPLAY_VER(i915) > 13 ? 36 : 24;
-		int min_cdclk_bj = (crtc_state->dsc.compressed_bpp * pixel_clock) /
-				   (2 * bigjoiner_interface_bits);
+		int min_cdclk_bj =
+			(intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16) *
+			 pixel_clock) / (2 * bigjoiner_interface_bits);
 
 		min_cdclk = max(min_cdclk, min_cdclk_bj);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index edbcf5968804..a9943505a80b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5415,7 +5415,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 
 	PIPE_CONF_CHECK_I(dsc.compression_enable);
 	PIPE_CONF_CHECK_I(dsc.dsc_split);
-	PIPE_CONF_CHECK_I(dsc.compressed_bpp);
+	PIPE_CONF_CHECK_I(dsc.compressed_bpp_x16);
 
 	PIPE_CONF_CHECK_BOOL(splitter.enable);
 	PIPE_CONF_CHECK_I(splitter.link_count);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 2328f5e66cd8..c691ec2670c3 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1354,7 +1354,8 @@ struct intel_crtc_state {
 	struct {
 		bool compression_enable;
 		bool dsc_split;
-		u16 compressed_bpp;
+		/* Compressed Bpp in U6.4 format (first 4 bits for fractional part) */
+		u16 compressed_bpp_x16;
 		u8 slice_count;
 		struct drm_dsc_config config;
 	} dsc;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f16d9fa88fe1..2a7ff3318498 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -64,6 +64,7 @@
 #include "intel_dp_mst.h"
 #include "intel_dpio_phy.h"
 #include "intel_dpll.h"
+#include "intel_fractional_helper.h"
 #include "intel_fifo_underrun.h"
 #include "intel_hdcp.h"
 #include "intel_hdmi.h"
@@ -1863,7 +1864,8 @@ icl_dsc_compute_link_config(struct intel_dp *intel_dp,
 					      valid_dsc_bpp[i],
 					      timeslots);
 		if (ret == 0) {
-			pipe_config->dsc.compressed_bpp = valid_dsc_bpp[i];
+			pipe_config->dsc.compressed_bpp_x16 =
+				intel_fractional_bpp_to_x16(valid_dsc_bpp[i]);
 			return 0;
 		}
 	}
@@ -1901,7 +1903,8 @@ xelpd_dsc_compute_link_config(struct intel_dp *intel_dp,
 					      compressed_bpp,
 					      timeslots);
 		if (ret == 0) {
-			pipe_config->dsc.compressed_bpp = compressed_bpp;
+			pipe_config->dsc.compressed_bpp_x16 =
+				intel_fractional_bpp_to_x16(compressed_bpp);
 			return 0;
 		}
 	}
@@ -2085,7 +2088,8 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
 	/* Compressed BPP should be less than the Input DSC bpp */
 	dsc_max_bpp = min(dsc_max_bpp, pipe_bpp - 1);
 
-	pipe_config->dsc.compressed_bpp = max(dsc_min_bpp, dsc_max_bpp);
+	pipe_config->dsc.compressed_bpp_x16 =
+		intel_fractional_bpp_to_x16(max(dsc_min_bpp, dsc_max_bpp));
 
 	pipe_config->pipe_bpp = pipe_bpp;
 
@@ -2171,18 +2175,19 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	ret = intel_dp_dsc_compute_params(&dig_port->base, pipe_config);
 	if (ret < 0) {
 		drm_dbg_kms(&dev_priv->drm,
-			    "Cannot compute valid DSC parameters for Input Bpp = %d "
-			    "Compressed BPP = %d\n",
+			    "Cannot compute valid DSC parameters for Input Bpp = %d Compressed BPP = %d.%d\n",
 			    pipe_config->pipe_bpp,
-			    pipe_config->dsc.compressed_bpp);
+			    intel_fractional_bpp_from_x16(pipe_config->dsc.compressed_bpp_x16),
+			    intel_fractional_bpp_decimal(pipe_config->dsc.compressed_bpp_x16));
 		return ret;
 	}
 
 	pipe_config->dsc.compression_enable = true;
-	drm_dbg_kms(&dev_priv->drm, "DP DSC computed with Input Bpp = %d "
-		    "Compressed Bpp = %d Slice Count = %d\n",
+	drm_dbg_kms(&dev_priv->drm,
+		    "DP DSC computed with Input Bpp = %d Compressed Bpp = %d.%d Slice Count = %d\n",
 		    pipe_config->pipe_bpp,
-		    pipe_config->dsc.compressed_bpp,
+		    intel_fractional_bpp_from_x16(pipe_config->dsc.compressed_bpp_x16),
+		    intel_fractional_bpp_decimal(pipe_config->dsc.compressed_bpp_x16),
 		    pipe_config->dsc.slice_count);
 
 	return 0;
@@ -2261,15 +2266,17 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 
 	if (pipe_config->dsc.compression_enable) {
 		drm_dbg_kms(&i915->drm,
-			    "DP lane count %d clock %d Input bpp %d Compressed bpp %d\n",
+			    "DP lane count %d clock %d Input bpp %d Compressed bpp %d.%d\n",
 			    pipe_config->lane_count, pipe_config->port_clock,
 			    pipe_config->pipe_bpp,
-			    pipe_config->dsc.compressed_bpp);
+			    intel_fractional_bpp_from_x16(pipe_config->dsc.compressed_bpp_x16),
+			    intel_fractional_bpp_decimal(pipe_config->dsc.compressed_bpp_x16));
 
 		drm_dbg_kms(&i915->drm,
 			    "DP link rate required %i available %i\n",
 			    intel_dp_link_required(adjusted_mode->crtc_clock,
-						   pipe_config->dsc.compressed_bpp),
+						   intel_fractional_bpp_from_x16
+						   (pipe_config->dsc.compressed_bpp_x16)),
 			    intel_dp_max_data_rate(pipe_config->port_clock,
 						   pipe_config->lane_count));
 	} else {
@@ -2705,7 +2712,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 		drm_dp_enhanced_frame_cap(intel_dp->dpcd);
 
 	if (pipe_config->dsc.compression_enable)
-		link_bpp = pipe_config->dsc.compressed_bpp;
+		link_bpp = pipe_config->dsc.compressed_bpp_x16;
 	else
 		link_bpp = intel_dp_output_bpp(pipe_config->output_format,
 					       pipe_config->pipe_bpp);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index ff3accebf0a8..64e1a8cba3d8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -41,6 +41,7 @@
 #include "intel_dp_hdcp.h"
 #include "intel_dp_mst.h"
 #include "intel_dpio_phy.h"
+#include "intel_fractional_helper.h"
 #include "intel_hdcp.h"
 #include "intel_hotplug.h"
 #include "skl_scaler.h"
@@ -140,7 +141,7 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 		if (!dsc)
 			crtc_state->pipe_bpp = bpp;
 		else
-			crtc_state->dsc.compressed_bpp = bpp;
+			crtc_state->dsc.compressed_bpp_x16 = intel_fractional_bpp_to_x16(bpp);
 		drm_dbg_kms(&i915->drm, "Got %d slots for pipe bpp %d dsc %d\n", slots, bpp, dsc);
 	}
 
@@ -238,13 +239,14 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 	if (slots < 0)
 		return slots;
 
-	last_compressed_bpp = crtc_state->dsc.compressed_bpp;
+	last_compressed_bpp = intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16);
 
-	crtc_state->dsc.compressed_bpp = intel_dp_dsc_nearest_valid_bpp(i915,
-									last_compressed_bpp,
-									crtc_state->pipe_bpp);
+	crtc_state->dsc.compressed_bpp_x16 =
+		intel_fractional_bpp_to_x16(intel_dp_dsc_nearest_valid_bpp(i915,
+									   last_compressed_bpp,
+									   crtc_state->pipe_bpp));
 
-	if (crtc_state->dsc.compressed_bpp != last_compressed_bpp)
+	if (crtc_state->dsc.compressed_bpp_x16 != intel_fractional_bpp_to_x16(last_compressed_bpp))
 		need_timeslot_recalc = true;
 
 	/*
@@ -252,15 +254,17 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 	 * the actual compressed bpp we use.
 	 */
 	if (need_timeslot_recalc) {
-		slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state,
-							     crtc_state->dsc.compressed_bpp,
-							     crtc_state->dsc.compressed_bpp,
-							     limits, conn_state, 2 * 3, true);
+		slots =
+		intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state,
+						     intel_fractional_bpp_from_x16
+						     (crtc_state->dsc.compressed_bpp_x16),
+		intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16),
+		limits, conn_state, 2 * 3, true);
 		if (slots < 0)
 			return slots;
 	}
 
-	intel_link_compute_m_n(crtc_state->dsc.compressed_bpp,
+	intel_link_compute_m_n(intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16),
 			       crtc_state->lane_count,
 			       adjusted_mode->crtc_clock,
 			       crtc_state->port_clock,
diff --git a/drivers/gpu/drm/i915/display/intel_fractional_helper.h b/drivers/gpu/drm/i915/display/intel_fractional_helper.h
new file mode 100644
index 000000000000..0212a9041c8f
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_fractional_helper.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#ifndef __INTEL_FRACTIONAL_HELPERS_H__
+#define __INTEL_FRACTIONAL_HELPERS_H__
+
+ /*
+  * Convert a U6.4 fixed-point bits-per-pixel (bpp) value to an integer bpp value.
+  */
+static inline int intel_fractional_bpp_from_x16(int bpp_x16)
+{
+	return bpp_x16 >> 4;
+}
+
+/*
+ * Extract the fractional part of a U6.4 fixed-point bpp value based on the
+ * last 4 bits representing fractional bits, obtained by multiplying by 10000
+ * and then dividing by 16, as the bpp value is initially left-shifted by 4
+ * to allocate 4 bits for the fractional part.
+ */
+static inline int intel_fractional_bpp_decimal(int bpp_x16)
+{
+	return (bpp_x16 & 0xf) * 625;
+}
+
+/*
+ * Convert bits-per-pixel (bpp) to a U6.4 fixed-point representation.
+ */
+static inline int intel_fractional_bpp_to_x16(int bpp)
+{
+	return bpp << 4;
+}
+
+#endif /*  __INTEL_FRACTIONAL_HELPERS_H__ */
+
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 6757dbae9ee5..142c886f4776 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -15,6 +15,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_dsi.h"
+#include "intel_fractional_helper.h"
 #include "intel_qp_tables.h"
 #include "intel_vdsc.h"
 #include "intel_vdsc_regs.h"
@@ -248,7 +249,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	struct drm_dsc_config *vdsc_cfg = &pipe_config->dsc.config;
-	u16 compressed_bpp = pipe_config->dsc.compressed_bpp;
+	u16 compressed_bpp = intel_fractional_bpp_from_x16(pipe_config->dsc.compressed_bpp_x16);
 	int err;
 	int ret;
 
@@ -874,7 +875,7 @@ static void intel_dsc_get_pps_config(struct intel_crtc_state *crtc_state)
 	if (vdsc_cfg->native_420)
 		vdsc_cfg->bits_per_pixel >>= 1;
 
-	crtc_state->dsc.compressed_bpp = vdsc_cfg->bits_per_pixel >> 4;
+	crtc_state->dsc.compressed_bpp_x16 = vdsc_cfg->bits_per_pixel;
 
 	/* PPS 2 */
 	pps_temp = intel_dsc_pps_read_and_verify(crtc_state, 2);
-- 
2.25.1

