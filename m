Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8675B4B83BE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 10:14:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4513B10E198;
	Wed, 16 Feb 2022 09:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7919A89F6E;
 Wed, 16 Feb 2022 09:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645002838; x=1676538838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tLScShVn9DPIJdAOUCydYOZ9seOHxi3nOgkC8uYBgD8=;
 b=mU8R9Fe1pox5aSJLjN0cm5y5SW7TYZPPVGeJqZWhklUJRvnp6QvXMlv8
 vKZww+LxUUZ3rVf2ZjcS8PqfHc0MaG2BTF5acHD2bhhU0RkftIVGTWtDy
 UOLSPkt0FjepQmhA9Iq2fbTXCtfHEFqWtxBuu/oBwu15tE5ZQbHLkx8a1
 L16Ms36RcNT3TmRZlnQMmMJC2HjYYD5wvmVD01i3xwDTWiO/0PmzelKE7
 0aw/os1HmH+AyHWHchKsn3uQnMD5k1pFbrN4Atx5SasxdIZJbpkAMqJ95
 XCQu8CaDuTUEJLZUF2hi7DqmUgwT3uIvJRTCS+ztOtZOLJvp6kTZk113s g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="249391102"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="249391102"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 01:13:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="498563561"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 01:13:50 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v3 4/5] drm/hdmi21: Add support for DFM calculation with DSC
Date: Wed, 16 Feb 2022 14:30:11 +0530
Message-Id: <20220216090011.2456024-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214020357.10063-5-vandita.kulkarni@intel.com>
References: <20220214020357.10063-5-vandita.kulkarni@intel.com>
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
Cc: jani.nikula@intel.com, vandita.kulkarni@intel.com,
 intel-gfx@lists.freedesktop.org, uma.shankar@intel.com,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helper functions for calculating FRL capacity and DFM
requirements with given compressed bpp.

v2: Fixed:
-Build warnings/errors: Removed unused variables.
-Checkpatch warnings.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/drm_frl_dfm_helper.c | 303 +++++++++++++++++++++++++++
 include/drm/drm_frl_dfm_helper.h     |   3 +
 2 files changed, 306 insertions(+)

diff --git a/drivers/gpu/drm/drm_frl_dfm_helper.c b/drivers/gpu/drm/drm_frl_dfm_helper.c
index b8f4f8ee50d3..95de7a6978a2 100644
--- a/drivers/gpu/drm/drm_frl_dfm_helper.c
+++ b/drivers/gpu/drm/drm_frl_dfm_helper.c
@@ -555,3 +555,306 @@ drm_frl_dfm_nondsc_requirement_met(struct drm_hdmi_frl_dfm *frl_dfm)
 	return false;
 }
 EXPORT_SYMBOL(drm_frl_dfm_nondsc_requirement_met);
+
+/* DSC DFM functions */
+/* Get FRL Available characters */
+static u32
+drm_get_frl_available_chars(u32 overhead_max, u32 cfrl_line)
+{
+	u32 frl_char_avlb = ((EFFICIENCY_MULTIPLIER - overhead_max) * cfrl_line);
+
+	return frl_char_avlb / EFFICIENCY_MULTIPLIER;
+}
+
+/* Get required no. of tribytes during HCActive */
+static u32
+drm_get_frl_hcactive_tb_target(u32 dsc_bpp_x16, u32 slice_width, u32 num_slices)
+{
+	u32 bytes_target;
+
+	bytes_target = num_slices * DIV_ROUND_UP(dsc_bpp_x16 * slice_width,
+						 8 * BPP_MULTIPLIER);
+
+	return DIV_ROUND_UP(bytes_target, 3);
+}
+
+/* Get required no. of tribytes (estimate1) during HCBlank */
+static u32
+drm_get_frl_hcblank_tb_est1_target(u32 hcactive_target_tb,
+				   u32 hactive, u32 hblank)
+{
+	return DIV_ROUND_UP(hcactive_target_tb * hblank, hactive);
+}
+
+/* Get required no. of tribytes during HCBlank */
+static u32
+drm_get_frl_hcblank_tb_target(u32 hcactive_target_tb, u32 hactive, u32 hblank,
+			      u32 hcblank_audio_min, u32 cfrl_available)
+{
+	u32 hcblank_target_tb1 = drm_get_frl_hcblank_tb_est1_target(hcactive_target_tb,
+								    hactive, hblank);
+	u32 hcblank_target_tb2 = max(hcblank_target_tb1, hcblank_audio_min);
+
+	return 4 * (min(hcblank_target_tb2,
+			(2 * cfrl_available - 3 * hcactive_target_tb) / 2) / 4);
+}
+
+/* Get the avg no of tribytes sent per sec (Kbps) */
+static u32
+drm_frl_dsc_get_ftb_avg(u32 hcactive_target_tb, u32 hcblank_target_tb,
+			u32 hactive, u32 hblank,
+			u32 fpixelclock_max_khz)
+{
+	return (hcactive_target_tb + hcblank_target_tb) *
+	       (fpixelclock_max_khz / (hactive + hblank));
+}
+
+/* Time to send Active tribytes in nanoseconds */
+static u32
+drm_frl_dsc_get_tactive_ref_ns(u32 line_time_ns, u32 hactive, u32 hblank)
+{
+	return (line_time_ns * hactive) / (hactive + hblank);
+}
+
+/* Time to send Blanking tribytes in nanoseconds  */
+static u32
+drm_frl_dsc_get_tblank_ref_ns(u32 line_time_ns, u32 hactive, u32 hblank)
+{
+	return (line_time_ns * hblank) / (hactive + hblank);
+}
+
+/* Get time to send all tribytes in hcactive region in nsec*/
+static u32
+drm_frl_dsc_tactive_target_ns(u32 frl_lanes, u32 hcactive_target_tb, u32 ftb_avg_k,
+			      u32 min_frl_char_rate_k, u32 overhead_max)
+{
+	u32 avg_tribyte_time_ns, tribyte_time_ns;
+	u32 num_chars_hcactive;
+	u32 frl_char_rate_k;
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
+static u32
+drm_frl_get_dsc_tri_bytes_borrowed(u32 tactive_target_ns, u32 ftb_avg_k,
+				   u32 hcactive_target_tb)
+{
+	return (tactive_target_ns * FRL_TIMING_NS_MULTIPLIER * ftb_avg_k * 1000) -
+		hcactive_target_tb;
+}
+
+/* Get TBdelta : borrowing in tribytes relative to avg tribyte rate */
+static u32
+drm_frl_get_dsc_tri_bytes_delta(u32 tactive_target_ns, u32 tblank_target_ns,
+				u32 tactive_ref_ns, u32 tblank_ref_ns,
+				u32 hcactive_target_tb, u32 ftb_avg_k,
+				u32 hactive, u32 hblank, u32 line_time_ns)
+{
+	u32 tb_delta_limit;
+	u32 hcblank_target_tb1 = drm_get_frl_hcblank_tb_est1_target(hcactive_target_tb,
+								    hactive, hblank);
+	u32 tribytes_per_ns = (hcactive_target_tb + hcblank_target_tb1) / line_time_ns;
+	u32 tribytes_per_sec = tribytes_per_ns * FRL_TIMING_NS_MULTIPLIER;
+
+	if (tblank_ref_ns < tblank_target_ns) {
+		u32 tactive_ref_sec = tactive_ref_ns * FRL_TIMING_NS_MULTIPLIER;
+		u32 tactive_avg_sec = hcactive_target_tb / (ftb_avg_k * 1000);
+
+		tb_delta_limit = (tactive_ref_sec - tactive_avg_sec) *
+				 tribytes_per_sec;
+	} else {
+		u32 t_delta_ns;
+
+		if (tactive_target_ns > tactive_ref_ns)
+			t_delta_ns = tactive_target_ns - tactive_ref_ns;
+		else
+			t_delta_ns = tactive_ref_ns - tactive_target_ns;
+		tb_delta_limit = t_delta_ns * tribytes_per_ns;
+	}
+
+	return tb_delta_limit;
+}
+
+/* Compute hcactive and hcblank tribytes for given dsc bpp setting */
+static void
+drm_frl_dfm_dsc_compute_tribytes(struct drm_hdmi_frl_dfm *frl_dfm)
+{
+	u32 hcactive_target_tb;
+	u32 hcblank_target_tb;
+	u32 cfrl_available;
+	u32 num_slices;
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
+	u32 ftb_avg_k;
+	u32 tactive_ref_ns, tblank_ref_ns, tactive_target_ns, tblank_target_ns;
+	u32 tb_borrowed, tb_delta, tb_worst;
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
+						   tblank_target_ns,
+						   tactive_ref_ns,
+						   tblank_ref_ns,
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
+	u32 hcactive_target_tb = frl_dfm->params.hcactive_target;
+	u32 hcblank_target_tb = frl_dfm->params.hcblank_target;
+	u32 frl_char_per_line = frl_dfm->params.cfrl_line;
+	u32 overhead_max = frl_dfm->params.overhead_max;
+	u32 actual_frl_char_payload;
+	u32 utilization;
+	u32 utilization_with_overhead;
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
2.25.1

