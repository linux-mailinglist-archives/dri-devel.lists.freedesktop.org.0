Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF32879D698
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 18:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A5110E443;
	Tue, 12 Sep 2023 16:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5FB10E43E;
 Tue, 12 Sep 2023 16:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694536984; x=1726072984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PrXAJo3YSbvMO4FqTrh60rB/77n1TWsToQ4W2yhdt6w=;
 b=DRb9/jAU99KZk4j8zfGbfk+PomvfpmQX5XyVAPBBpuc7McbhIQy/Ne8L
 LBaENVPQKZVu7bz6wRKCq/eRDdvwIBw84Zfh+1UHieaAGoeTKsNlFM0eW
 1Y3qDsQ56L3myl7UgF/NMGtlVluHVW+soulsHrfHMR1mai7sP4Og8NilI
 vyfSG7LaT0+mS3s2aA3gzwfos2KW2yYEpNMEqkrC8nGb5FEv4FJjrtNzZ
 qUNsFDqxH13tBPWOWoiL9EDlsg1LSesYQewkKjfmtqRFhW3eOqYsjV1MV
 sMT+hCJiVL+8FX/iqNvPJuO/dvHHK0CuwbLoDYH72AMXDWMHa1iAT3nmm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="442446827"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="442446827"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 09:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="743775682"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743775682"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orsmga002.jf.intel.com with ESMTP; 12 Sep 2023 09:43:00 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/8] drm/i915/display: Store compressed bpp in U6.4 format
Date: Tue, 12 Sep 2023 22:07:29 +0530
Message-Id: <20230912163735.1075868-3-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230912163735.1075868-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20230912163735.1075868-1-mitulkumar.ajitkumar.golani@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 ankit.k.nautiyal@intel.com, swati2.sharma@intel.com
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

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c        | 11 +++---
 drivers/gpu/drm/i915/display/intel_audio.c    |  3 +-
 drivers/gpu/drm/i915/display/intel_bios.c     |  6 ++--
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  5 +--
 drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
 .../drm/i915/display/intel_display_types.h    |  3 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 29 ++++++++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 22 ++++++------
 .../i915/display/intel_fractional_helper.h    | 36 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.c     |  5 +--
 10 files changed, 85 insertions(+), 37 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_fractional_helper.h

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index ad6488e9c2b2..0f7594b6aa1f 100644
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
index f735b035436c..df3e80a0cd01 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -33,6 +33,7 @@
 #include "i915_reg.h"
 #include "intel_display.h"
 #include "intel_display_types.h"
+#include "intel_fractional_helper.h"
 #include "intel_gmbus.h"
 
 #define _INTEL_BIOS_PRIVATE
@@ -3384,8 +3385,9 @@ static void fill_dsc(struct intel_crtc_state *crtc_state,
 
 	crtc_state->pipe_bpp = bpc * 3;
 
-	crtc_state->dsc.compressed_bpp = min(crtc_state->pipe_bpp,
-					     VBT_DSC_MAX_BPP(dsc->max_bpp));
+	crtc_state->dsc.compressed_bpp_x16 =
+		intel_fractional_bpp_to_x16(min(crtc_state->pipe_bpp,
+				     VBT_DSC_MAX_BPP(dsc->max_bpp)));
 
 	/*
 	 * FIXME: This is ugly, and slice count should take DSC engine
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index ad5251ba6fe1..55d46947d7ae 100644
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
@@ -2567,8 +2568,8 @@ static int intel_vdsc_min_cdclk(const struct intel_crtc_state *crtc_state)
 		 * => CDCLK >= compressed_bpp * Pixel clock  / 2 * Bigjoiner Interface bits
 		 */
 		int bigjoiner_interface_bits = DISPLAY_VER(i915) > 13 ? 36 : 24;
-		int min_cdclk_bj = (crtc_state->dsc.compressed_bpp * pixel_clock) /
-				   (2 * bigjoiner_interface_bits);
+		int min_cdclk_bj = (intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16) *
+					pixel_clock) / (2 * bigjoiner_interface_bits);
 
 		min_cdclk = max(min_cdclk, min_cdclk_bj);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 83e1bc858b9f..afcbdd4f105a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5365,7 +5365,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 
 	PIPE_CONF_CHECK_I(dsc.compression_enable);
 	PIPE_CONF_CHECK_I(dsc.dsc_split);
-	PIPE_CONF_CHECK_I(dsc.compressed_bpp);
+	PIPE_CONF_CHECK_I(dsc.compressed_bpp_x16);
 
 	PIPE_CONF_CHECK_BOOL(splitter.enable);
 	PIPE_CONF_CHECK_I(splitter.link_count);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c21064794f32..69bcabec4a29 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1353,7 +1353,8 @@ struct intel_crtc_state {
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
index aa5f602b56fb..1891e3ead174 100644
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
@@ -1863,7 +1864,7 @@ icl_dsc_compute_link_config(struct intel_dp *intel_dp,
 					      valid_dsc_bpp[i],
 					      timeslots);
 		if (ret == 0) {
-			pipe_config->dsc.compressed_bpp = valid_dsc_bpp[i];
+			pipe_config->dsc.compressed_bpp_x16 = intel_fractional_bpp_to_x16(valid_dsc_bpp[i]);
 			return 0;
 		}
 	}
@@ -1901,7 +1902,7 @@ xelpd_dsc_compute_link_config(struct intel_dp *intel_dp,
 					      compressed_bpp,
 					      timeslots);
 		if (ret == 0) {
-			pipe_config->dsc.compressed_bpp = compressed_bpp;
+			pipe_config->dsc.compressed_bpp_x16 = intel_fractional_bpp_to_x16(compressed_bpp);
 			return 0;
 		}
 	}
@@ -2085,7 +2086,7 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
 	/* Compressed BPP should be less than the Input DSC bpp */
 	dsc_max_bpp = min(dsc_max_bpp, pipe_bpp - 1);
 
-	pipe_config->dsc.compressed_bpp = max(dsc_min_bpp, dsc_max_bpp);
+	pipe_config->dsc.compressed_bpp_x16 = intel_fractional_bpp_to_x16(max(dsc_min_bpp, dsc_max_bpp));
 
 	pipe_config->pipe_bpp = pipe_bpp;
 
@@ -2171,18 +2172,19 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
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
@@ -2261,15 +2263,16 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 
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
+					intel_fractional_bpp_from_x16(pipe_config->dsc.compressed_bpp_x16)),
 			    intel_dp_max_data_rate(pipe_config->port_clock,
 						   pipe_config->lane_count));
 	} else {
@@ -2702,7 +2705,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 		intel_dp_limited_color_range(pipe_config, conn_state);
 
 	if (pipe_config->dsc.compression_enable)
-		link_bpp = pipe_config->dsc.compressed_bpp;
+		link_bpp = pipe_config->dsc.compressed_bpp_x16;
 	else
 		link_bpp = intel_dp_output_bpp(pipe_config->output_format,
 					       pipe_config->pipe_bpp);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 1c7f0b6afe47..350c561775d4 100644
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
+								last_compressed_bpp,
+								crtc_state->pipe_bpp));
 
-	if (crtc_state->dsc.compressed_bpp != last_compressed_bpp)
+	if (crtc_state->dsc.compressed_bpp_x16 != intel_fractional_bpp_to_x16(last_compressed_bpp))
 		need_timeslot_recalc = true;
 
 	/*
@@ -253,14 +255,14 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 	 */
 	if (need_timeslot_recalc) {
 		slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state,
-							     crtc_state->dsc.compressed_bpp,
-							     crtc_state->dsc.compressed_bpp,
-							     limits, conn_state, 2 * 3, true);
+					intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16),
+					intel_fractional_bpp_from_x16(crtc_state->dsc.compressed_bpp_x16),
+					limits, conn_state, 2 * 3, true);
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
index 5c00f7ccad7f..1bd9391a6f5a 100644
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

