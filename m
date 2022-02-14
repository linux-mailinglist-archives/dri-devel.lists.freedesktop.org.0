Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FFB4B48D7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64B810E324;
	Mon, 14 Feb 2022 10:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764B010E2FC;
 Mon, 14 Feb 2022 10:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644832888; x=1676368888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Q+RsmOvFMxNabM4xxZdXiZf0B7k6v/G5kmHquv8vhY=;
 b=nxqHXExuuveHGH/bQbiSaGVUQE3Oe3wuLBtMZaS6qjPcby/vGMKm76kx
 S8qYHMl3cUi1Sy9+ogPrVHyqmFvN8fpJ6szrjygf7HpE0B4ZBYPlm/GF7
 RDHGBysWkR+YJsUMJHVrRie06O1VLYf5xTPes63oChKkJ2jTFmqyL90Lw
 PNkE/qrFBicLdcx/G8eNU6BZ7aN7LZJddP/Zt1bGxEg30h4z+LC1lTUq1
 WRDEaL9CAgXf945l42pznWdCDKXk6yc7hmUf+kv89ZJoHC0+RyPya78li
 N+EOUtkS3McKJgIk5FrPER0dm09I3CyUcXWS/aiyXWQZt7ljOGaz9fGpW A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="274628579"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="274628579"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:01:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="543383327"
Received: from unknown (HELO vandita-Z390-AORUS-ULTRA.iind.intel.com)
 ([10.190.238.8])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:01:25 -0800
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v2 4/5] drm/hdmi21: Add support for DFM calculation with DSC
Date: Mon, 14 Feb 2022 07:33:56 +0530
Message-Id: <20220214020357.10063-5-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214020357.10063-1-vandita.kulkarni@intel.com>
References: <20220214020357.10063-1-vandita.kulkarni@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Vandita Kulkarni <vandita.kulkarni@intel.com>, uma.shankar@intel.com,
 laurent.pinchart@ideasonboard.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Add helper functions for calculating FRL capacity and DFM
requirements with given compressed bpp.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/drm_frl_dfm_helper.c | 297 +++++++++++++++++++++++++++
 include/drm/drm_frl_dfm_helper.h     |   3 +
 2 files changed, 300 insertions(+)

diff --git a/drivers/gpu/drm/drm_frl_dfm_helper.c b/drivers/gpu/drm/drm_frl_dfm_helper.c
index b8f4f8ee50d3..9eb91dd4e21e 100644
--- a/drivers/gpu/drm/drm_frl_dfm_helper.c
+++ b/drivers/gpu/drm/drm_frl_dfm_helper.c
@@ -555,3 +555,300 @@ drm_frl_dfm_nondsc_requirement_met(struct drm_hdmi_frl_dfm *frl_dfm)
 	return false;
 }
 EXPORT_SYMBOL(drm_frl_dfm_nondsc_requirement_met);
+
+/* DSC DFM functions */
+/* Get FRL Available characters */
+static unsigned int
+drm_get_frl_available_chars(unsigned int overhead_max, unsigned int cfrl_line)
+{
+	unsigned int frl_char_avlb = ((EFFICIENCY_MULTIPLIER - overhead_max) * cfrl_line);
+
+	return frl_char_avlb / EFFICIENCY_MULTIPLIER;
+}
+
+/* Get required no. of tribytes during HCActive */
+static unsigned int
+drm_get_frl_hcactive_tb_target(unsigned int dsc_bpp_x16, unsigned int slice_width, unsigned int num_slices)
+{
+	unsigned int bytes_target;
+
+	bytes_target = num_slices * DIV_ROUND_UP(dsc_bpp_x16 * slice_width,
+						 8 * BPP_MULTIPLIER);
+
+	return DIV_ROUND_UP(bytes_target, 3);
+}
+
+/* Get required no. of tribytes (estimate1) during HCBlank */
+static unsigned int
+drm_get_frl_hcblank_tb_est1_target(unsigned int hcactive_target_tb,
+				   unsigned int hactive, unsigned int hblank)
+{
+	return DIV_ROUND_UP(hcactive_target_tb * hblank, hactive);
+}
+
+/* Get required no. of tribytes during HCBlank */
+static unsigned int
+drm_get_frl_hcblank_tb_target(unsigned int hcactive_target_tb, unsigned int hactive, unsigned int hblank,
+			      unsigned int hcblank_audio_min, unsigned int cfrl_available)
+{
+	unsigned int hcblank_target_tb1 = drm_get_frl_hcblank_tb_est1_target(hcactive_target_tb,
+								    hactive, hblank);
+	unsigned int hcblank_target_tb2 = max(hcblank_target_tb1, hcblank_audio_min);
+
+	return 4 * (min(hcblank_target_tb2,
+			(2 * cfrl_available - 3 * hcactive_target_tb) / 2) / 4);
+}
+
+/* Get the avg no of tribytes sent per sec (Kbps) */
+static unsigned int
+drm_frl_dsc_get_ftb_avg(unsigned int hcactive_target_tb, unsigned int hcblank_target_tb,
+			unsigned int hactive, unsigned int hblank,
+			unsigned int fpixelclock_max_khz)
+{
+	return (hcactive_target_tb + hcblank_target_tb) * (fpixelclock_max_khz / (hactive + hblank));
+}
+
+/* Time to send Active tribytes in nanoseconds */
+static unsigned int
+drm_frl_dsc_get_tactive_ref_ns(unsigned int line_time_ns, unsigned int hactive, unsigned int hblank)
+{
+	return (line_time_ns * hactive) / (hactive + hblank);
+}
+
+/* Time to send Blanking tribytes in nanoseconds  */
+static unsigned int
+drm_frl_dsc_get_tblank_ref_ns(unsigned int line_time_ns, unsigned int hactive, unsigned int hblank)
+{
+	return (line_time_ns * hblank) / (hactive + hblank);
+}
+
+/* Get time to send all tribytes in hcactive region in nsec*/
+static unsigned int
+drm_frl_dsc_tactive_target_ns(unsigned int frl_lanes, unsigned int hcactive_target_tb, unsigned int ftb_avg_k,
+			      unsigned int min_frl_char_rate_k, unsigned int overhead_max)
+{
+	unsigned int avg_tribyte_time_ns, tribyte_time_ns;
+	unsigned int num_chars_hcactive;
+	unsigned int frl_char_rate_k;
+
+	/* Avg time to transmit all active region tribytes */
+	avg_tribyte_time_ns = (hcactive_target_tb * FRL_TIMING_NS_MULTIPLIER) /
+			      (ftb_avg_k * 1000);
+
+	/*
+	 * 2 bytes in active region = 1 FRL characters
+	 * 1 Tribyte in active region = 3/2 FRL characters
+	 */
+
+	num_chars_hcactive = (hcactive_target_tb * 3) / 2;
+
+	/*
+	 * FRL rate = lanes * frl character rate
+	 * But actual bandwidth wil be less, due to FRL limitations so account
+	 * for the overhead involved.
+	 * FRL rate with overhead = FRL rate * (100 - overhead %) / 100
+	 */
+	frl_char_rate_k = frl_lanes * min_frl_char_rate_k;
+	frl_char_rate_k = (frl_char_rate_k * (EFFICIENCY_MULTIPLIER - overhead_max)) /
+			  EFFICIENCY_MULTIPLIER;
+
+	/* Time to transmit all characters with FRL limitations */
+	tribyte_time_ns = (num_chars_hcactive * FRL_TIMING_NS_MULTIPLIER) /
+			  frl_char_rate_k * 1000;
+
+	return max(avg_tribyte_time_ns, tribyte_time_ns);
+}
+
+/* Get no. of tri bytes borrowed with DSC enabled */
+static unsigned int
+drm_frl_get_dsc_tri_bytes_borrowed(unsigned int tactive_target_ns, unsigned int ftb_avg_k,
+				   unsigned int hcactive_target_tb)
+{
+	return (tactive_target_ns * FRL_TIMING_NS_MULTIPLIER * ftb_avg_k * 1000) -
+		hcactive_target_tb;
+}
+
+/* Get TBdelta */
+static unsigned int
+drm_frl_get_dsc_tri_bytes_delta(unsigned int tactive_target_ns, unsigned int tactive_ref_ns,
+				unsigned int hcactive_target_tb, unsigned int ftb_avg_k,
+				unsigned int hactive, unsigned int hblank, unsigned int line_time_ns)
+{
+	unsigned int tb_delta_limit;
+	unsigned int tblank_target_ns = line_time_ns - tactive_target_ns;
+	unsigned int tblank_ref_ns = line_time_ns - tactive_ref_ns;
+	unsigned int hcblank_target_tb1 = drm_get_frl_hcblank_tb_est1_target(hcactive_target_tb,
+								    hactive, hblank);
+
+	if (tblank_ref_ns < tblank_target_ns) {
+		tb_delta_limit = (((tactive_ref_ns * FRL_TIMING_NS_MULTIPLIER) - (hcactive_target_tb / (ftb_avg_k * 1000))) *
+				 (hcactive_target_tb + hcblank_target_tb1)) /
+				 (line_time_ns * FRL_TIMING_NS_MULTIPLIER);
+	} else {
+		unsigned int _tb_delta_ns;
+
+		if (tactive_target_ns > tactive_ref_ns)
+			_tb_delta_ns = tactive_target_ns - tactive_ref_ns;
+		else
+			_tb_delta_ns = tactive_ref_ns - tactive_target_ns;
+		tb_delta_limit = (_tb_delta_ns * (hcactive_target_tb + hcblank_target_tb1)) / line_time_ns;
+	}
+
+	return tb_delta_limit;
+}
+
+/* Compute hcactive and hcblank tribytes for given dsc bpp setting */
+static void
+drm_frl_dfm_dsc_compute_tribytes(struct drm_hdmi_frl_dfm *frl_dfm)
+{
+	unsigned int hcactive_target_tb;
+	unsigned int hcblank_target_tb;
+	unsigned int cfrl_available;
+	unsigned int num_slices;
+
+	/* Assert for slice width ?*/
+	if (!frl_dfm->config.slice_width)
+		return;
+
+	num_slices = DIV_ROUND_UP(frl_dfm->config.hactive, frl_dfm->config.slice_width);
+
+	hcactive_target_tb = drm_get_frl_hcactive_tb_target(frl_dfm->config.target_bpp_16,
+							    frl_dfm->config.slice_width,
+							    num_slices);
+
+	cfrl_available =
+		drm_get_frl_available_chars(frl_dfm->params.overhead_max,
+					    frl_dfm->params.cfrl_line);
+
+	hcblank_target_tb =
+		drm_get_frl_hcblank_tb_target(hcactive_target_tb,
+					      frl_dfm->config.hactive,
+					      frl_dfm->config.hblank,
+					      frl_dfm->params.hblank_audio_min,
+					      cfrl_available);
+
+	frl_dfm->params.hcactive_target = hcactive_target_tb;
+	frl_dfm->params.hcblank_target = hcblank_target_tb;
+}
+
+/* Check if audio supported with given dsc bpp and frl bandwidth */
+static bool
+drm_frl_dfm_dsc_audio_supported(struct drm_hdmi_frl_dfm *frl_dfm)
+{
+	return frl_dfm->params.hcblank_target < frl_dfm->params.hblank_audio_min;
+}
+
+/* Is DFM timing requirement is met with DSC */
+static
+bool drm_frl_dfm_dsc_is_timing_req_met(struct drm_hdmi_frl_dfm *frl_dfm)
+{
+	unsigned int ftb_avg_k;
+	unsigned int tactive_ref_ns, tblank_ref_ns, tactive_target_ns, tblank_target_ns;
+	unsigned int tb_borrowed, tb_delta, tb_worst;
+
+	ftb_avg_k = drm_frl_dsc_get_ftb_avg(frl_dfm->params.hcactive_target,
+					    frl_dfm->params.hcblank_target,
+					    frl_dfm->config.hactive,
+					    frl_dfm->config.hblank,
+					    frl_dfm->params.pixel_clock_max_khz);
+
+	tactive_ref_ns = drm_frl_dsc_get_tactive_ref_ns(frl_dfm->params.line_time_ns,
+							frl_dfm->config.hactive,
+							frl_dfm->config.hblank);
+
+	tblank_ref_ns = drm_frl_dsc_get_tblank_ref_ns(frl_dfm->params.line_time_ns,
+						      frl_dfm->config.hactive,
+						      frl_dfm->config.hblank);
+
+	tactive_target_ns = drm_frl_dsc_tactive_target_ns(frl_dfm->config.lanes,
+							  frl_dfm->params.hcactive_target,
+							  ftb_avg_k,
+							  frl_dfm->params.char_rate_min_kbps,
+							  frl_dfm->params.overhead_max);
+
+	tblank_target_ns = frl_dfm->params.line_time_ns - tactive_target_ns;
+
+	tb_borrowed = drm_frl_get_dsc_tri_bytes_borrowed(tactive_target_ns,
+							 ftb_avg_k,
+							 frl_dfm->params.hcactive_target);
+
+	tb_delta = drm_frl_get_dsc_tri_bytes_delta(tactive_target_ns,
+						   tactive_ref_ns,
+						   frl_dfm->params.hcactive_target,
+						   ftb_avg_k,
+						   frl_dfm->config.hactive,
+						   frl_dfm->config.hblank,
+						   frl_dfm->params.line_time_ns);
+
+	tb_worst = max(tb_borrowed, tb_delta);
+	if (tb_worst > TB_BORROWED_MAX)
+		return false;
+
+	frl_dfm->params.ftb_avg_k = ftb_avg_k;
+	frl_dfm->params.tb_borrowed = tb_borrowed;
+
+	return true;
+}
+
+/* Check Utilization constraint with DSC */
+static bool
+drm_frl_dsc_check_utilization(struct drm_hdmi_frl_dfm *frl_dfm)
+{
+	unsigned int hcactive_target_tb = frl_dfm->params.hcactive_target;
+	unsigned int hcblank_target_tb = frl_dfm->params.hcblank_target;
+	unsigned int frl_char_per_line = frl_dfm->params.cfrl_line;
+	unsigned int overhead_max = frl_dfm->params.overhead_max;
+	unsigned int actual_frl_char_payload;
+	unsigned int utilization;
+	unsigned int utilization_with_overhead;
+
+	/* Note:
+	 * 1 FRL characters per 2 bytes in active period
+	 * 1 FRL char per byte in Blanking period
+	 */
+	actual_frl_char_payload = DIV_ROUND_UP(3 * hcactive_target_tb, 2) +
+				  hcblank_target_tb;
+
+	utilization = (actual_frl_char_payload * EFFICIENCY_MULTIPLIER) /
+		      frl_char_per_line;
+
+	/*
+	 * Utilization with overhead = utlization% +overhead %
+	 * should be less than 100%
+	 */
+	utilization_with_overhead = utilization + overhead_max;
+	if (utilization_with_overhead  > EFFICIENCY_MULTIPLIER)
+		return false;
+
+	return false;
+}
+
+/*
+ * drm_frl_fm_dsc_requirement_met : Check if FRL DFM requirements are met with
+ * the given bpp.
+ * @frl_dfm: dfm structure
+ *
+ * Returns true if the frl dfm requirements are met, else returns false.
+ */
+bool drm_frl_dfm_dsc_requirement_met(struct drm_hdmi_frl_dfm *frl_dfm)
+{
+	if (!frl_dfm->config.slice_width || !frl_dfm->config.target_bpp_16)
+		return false;
+
+	drm_frl_dfm_compute_max_frl_link_overhead(frl_dfm);
+	drm_frl_dfm_compute_link_characteristics(frl_dfm);
+	drm_frl_dfm_compute_audio_hblank_min(frl_dfm);
+	drm_frl_dfm_dsc_compute_tribytes(frl_dfm);
+
+	if (!drm_frl_dfm_dsc_audio_supported(frl_dfm))
+		return false;
+
+	if (!drm_frl_dfm_dsc_is_timing_req_met(frl_dfm))
+		return false;
+
+	if (!drm_frl_dsc_check_utilization(frl_dfm))
+		return false;
+
+	return true;
+}
+EXPORT_SYMBOL(drm_frl_dfm_dsc_requirement_met);
diff --git a/include/drm/drm_frl_dfm_helper.h b/include/drm/drm_frl_dfm_helper.h
index 67f9caebd903..a6dc2479683b 100644
--- a/include/drm/drm_frl_dfm_helper.h
+++ b/include/drm/drm_frl_dfm_helper.h
@@ -123,4 +123,7 @@ struct drm_hdmi_frl_dfm {
 
 bool drm_frl_dfm_nondsc_requirement_met(struct drm_hdmi_frl_dfm *frl_dfm);
 
+bool
+drm_frl_dfm_dsc_requirement_met(struct drm_hdmi_frl_dfm *frl_dfm);
+
 #endif
-- 
2.32.0

