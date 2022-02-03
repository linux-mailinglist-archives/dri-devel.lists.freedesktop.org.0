Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2654A8585
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 14:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BEF10F926;
	Thu,  3 Feb 2022 13:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754C610F921;
 Thu,  3 Feb 2022 13:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643896074; x=1675432074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D+hVW2qP5UQUtFoWbeVSsqf7fp9aHC9Y16jrb6ggt6Y=;
 b=btMxjo/PRDsL86W4pNZokb9TGPl1QtmGjPk0EO8wFCx2CLnujAlOL4D5
 Q/T0YnKRRul1iCGlKbJolsPV2iS90K31Nz8SKJL3VeZICsRq8Mn3SEieM
 SsZ+SDJFNAmUfwCYvl/6VtPJpsjXzzGltWJZZMubMFRzSfT3cOyTHBjkg
 inNWIk3JsT1AjrfBm0fp/YoDVpCDoxPtjEWUKyspGJPj2Y8o5R6uFxP/d
 19zYUxz0qChQnoeQTkxS+Dtd517GLugfI2wbqKUEtoFivVIBCCY0bEhMn
 CRYkaEzwLDDvP5hUJCEveYjh7f5IgSgYHFUcDGmZodIhDSzh8LAPsAwiW A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="308872279"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="308872279"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 05:47:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="583793078"
Received: from unknown (HELO vandita-Z390-AORUS-ULTRA.iind.intel.com)
 ([10.190.238.8])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 05:47:33 -0800
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 3/5] drm/hdmi21: Add helpers to verify non-dsc DFM requirements
Date: Thu,  3 Feb 2022 11:20:10 +0530
Message-Id: <20220203055012.14568-4-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220203055012.14568-1-vandita.kulkarni@intel.com>
References: <20220203055012.14568-1-vandita.kulkarni@intel.com>
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
Cc: jani.nikula@intel.com, Vandita Kulkarni <vandita.kulkarni@intel.com>,
 intel-gfx@lists.freedesktop.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helpers to compute DFM variables and to verify if the
DFM requirements are met or not in non dsc cases.

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/drm_frl_dfm_helper.c | 161 +++++++++++++++++++++++++++
 include/drm/drm_frl_dfm_helper.h     |   2 +
 2 files changed, 163 insertions(+)

diff --git a/drivers/gpu/drm/drm_frl_dfm_helper.c b/drivers/gpu/drm/drm_frl_dfm_helper.c
index 8498083adf72..087905ed630a 100644
--- a/drivers/gpu/drm/drm_frl_dfm_helper.c
+++ b/drivers/gpu/drm/drm_frl_dfm_helper.c
@@ -394,3 +394,164 @@ drm_compute_payload_utilization(u32 frl_char_payload_actual, u32 frl_char_per_li
 	utilization = (frl_char_payload_actual * EFFICIENCY_MULTIPLIER) / frl_char_per_line_period;
 	return utilization;
 }
+
+/* Collect link characteristics */
+static void
+drm_frl_dfm_compute_link_characteristics(struct drm_hdmi_frl_dfm *frl_dfm)
+{
+	u32 frl_bit_rate_min_kbps;
+
+	frl_dfm->params.pixel_clock_max_khz =
+		drm_get_max_legal_pixel_rate(frl_dfm->config.pixel_clock_nominal_khz);
+	frl_dfm->params.line_time_ns =
+			drm_get_min_video_line_period(frl_dfm->config.hblank,
+						      frl_dfm->config.hactive,
+						      frl_dfm->params.pixel_clock_max_khz);
+	frl_bit_rate_min_kbps = drm_get_min_frl_bit_rate(frl_dfm->config.bit_rate_kbps);
+	frl_dfm->params.char_rate_min_kbps = drm_get_min_frl_char_rate(frl_bit_rate_min_kbps);
+	frl_dfm->params.cfrl_line =
+		drm_get_total_frl_char_per_line_period(frl_dfm->params.line_time_ns,
+						       frl_dfm->params.char_rate_min_kbps,
+						       frl_dfm->config.lanes);
+}
+
+/* Determine FRL link overhead */
+static void drm_frl_dfm_compute_max_frl_link_overhead(struct drm_hdmi_frl_dfm *frl_dfm)
+{
+	u32 overhead_min;
+
+	overhead_min = drm_get_total_minimum_overhead(frl_dfm->config.lanes);
+	frl_dfm->params.overhead_max = drm_get_max_overhead(overhead_min);
+}
+
+/* Audio support Verification computations */
+static void
+drm_frl_dfm_compute_audio_hblank_min(struct drm_hdmi_frl_dfm *frl_dfm)
+{
+	u32 num_audio_pkt, audio_pkt_rate;
+
+	/*
+	 * TBD: get the actual audio pkt type as described in
+	 * table 6.44 of HDMI2.1 spec to find the num_audio_pkt,
+	 * for now assume audio sample packet and audio packet
+	 * layout as 1, resulting in number of audio packets
+	 * required to carry each audio sample or audio frame
+	 * as 1
+	 */
+	num_audio_pkt = 1;
+	audio_pkt_rate = drm_get_audio_pkt_rate(frl_dfm->config.audio_hz, num_audio_pkt);
+	frl_dfm->params.num_audio_pkts_line =
+		 drm_get_audio_pkts_hblank(audio_pkt_rate, frl_dfm->params.line_time_ns);
+	frl_dfm->params.hblank_audio_min =
+		    drm_get_audio_hblank_min(frl_dfm->params.num_audio_pkts_line);
+}
+
+/*
+ * Determine the number of tribytes required for active video , blanking period
+ * with the pixel configuration
+ */
+static void
+drm_frl_dfm_compute_tbactive_tbblank(struct drm_hdmi_frl_dfm *frl_dfm)
+{
+	u32 bpp, bytes_per_line;
+
+	bpp = drm_get_frl_bits_per_pixel(frl_dfm->config.color_format, frl_dfm->config.bpc);
+	bytes_per_line = drm_get_video_bytes_per_line(bpp, frl_dfm->config.hactive);
+
+	frl_dfm->params.tb_active = drm_get_active_video_tribytes_reqd(bytes_per_line);
+	frl_dfm->params.tb_blank =
+		drm_get_blanking_tribytes_avail(frl_dfm->config.color_format,
+						frl_dfm->config.hblank,
+						frl_dfm->config.bpc);
+}
+
+/* Verify the configuration meets the capacity requirements for the FRL configuration*/
+static bool
+drm_frl_dfm_verify_frl_capacity_requirement(struct drm_hdmi_frl_dfm *frl_dfm)
+{
+	u32 tactive_ref_ns, tblank_ref_ns, tactive_min_ns, tblank_min_ns;
+	u32 tborrowed_ns;
+
+	frl_dfm->params.ftb_avg_k =
+			drm_get_avg_tribyte_rate(frl_dfm->params.pixel_clock_max_khz,
+						 frl_dfm->params.tb_active, frl_dfm->params.tb_blank,
+						 frl_dfm->config.hactive, frl_dfm->config.hblank);
+	tactive_ref_ns = drm_get_tactive_ref(frl_dfm->params.line_time_ns,
+					     frl_dfm->config.hblank,
+					     frl_dfm->config.hactive);
+	tblank_ref_ns = drm_get_tblank_ref(frl_dfm->params.line_time_ns,
+					   frl_dfm->config.hblank,
+					   frl_dfm->config.hactive);
+	tactive_min_ns = drm_get_tactive_min(frl_dfm->config.lanes,
+					     frl_dfm->params.tb_active,
+					     frl_dfm->params.overhead_max,
+					     frl_dfm->params.char_rate_min_kbps);
+	tblank_min_ns = drm_get_tblank_min(frl_dfm->config.lanes,
+					     frl_dfm->params.tb_blank,
+					     frl_dfm->params.overhead_max,
+					     frl_dfm->params.char_rate_min_kbps);
+
+	if ((tactive_ref_ns >= tactive_min_ns) &&
+	    (tblank_ref_ns >= tblank_min_ns)) {
+		tborrowed_ns = 0;
+		frl_dfm->params.tb_borrowed = 0;
+		return true;
+	}
+
+	if ((tactive_ref_ns < tactive_min_ns) &&
+	    (tblank_ref_ns >= tblank_min_ns)) {
+		tborrowed_ns = tactive_min_ns - tactive_ref_ns;
+		frl_dfm->params.tb_borrowed = drm_get_tribytes_borrowed(tborrowed_ns,
+								 frl_dfm->params.ftb_avg_k);
+		if (frl_dfm->params.tb_borrowed <= TB_BORROWED_MAX)
+			return true;
+	}
+
+	return false;
+}
+
+/* Verify utilization does not exceed capacity */
+static bool
+drm_frl_dfm_verify_utilization_possible(struct drm_hdmi_frl_dfm *frl_dfm)
+{
+	u32 cfrl_free, cfrl_savings, frl_char_payload_actual;
+	u32 utilization, margin;
+
+	cfrl_free = drm_get_num_char_rc_compressible(frl_dfm->config.color_format,
+						     frl_dfm->config.bpc,
+						     frl_dfm->params.num_audio_pkts_line,
+						     frl_dfm->config.hblank);
+	cfrl_savings = drm_get_num_char_compression_savings(cfrl_free);
+	frl_char_payload_actual = drm_get_frl_char_payload_actual(frl_dfm->params.tb_active,
+								  frl_dfm->params.tb_blank,
+								  cfrl_savings);
+	utilization = drm_compute_payload_utilization(frl_char_payload_actual,
+							frl_dfm->params.cfrl_line);
+
+	margin = 1000 - (utilization + frl_dfm->params.overhead_max);
+
+	if (margin > 0)
+		return true;
+
+	return false;
+}
+
+/* Check if DFM requirement is met */
+bool
+drm_frl_dfm_nondsc_requirement_met(struct drm_hdmi_frl_dfm *frl_dfm)
+{
+	bool frl_capacity_req_met;
+
+	drm_frl_dfm_compute_max_frl_link_overhead(frl_dfm);
+	drm_frl_dfm_compute_link_characteristics(frl_dfm);
+	drm_frl_dfm_compute_audio_hblank_min(frl_dfm);
+	drm_frl_dfm_compute_tbactive_tbblank(frl_dfm);
+
+	frl_capacity_req_met = drm_frl_dfm_verify_frl_capacity_requirement(frl_dfm);
+
+	if (frl_capacity_req_met)
+		return drm_frl_dfm_verify_utilization_possible(frl_dfm);
+
+	return false;
+}
+EXPORT_SYMBOL(drm_frl_dfm_nondsc_requirement_met);
diff --git a/include/drm/drm_frl_dfm_helper.h b/include/drm/drm_frl_dfm_helper.h
index 16b8fcc7cbcc..f36b6898e9dd 100644
--- a/include/drm/drm_frl_dfm_helper.h
+++ b/include/drm/drm_frl_dfm_helper.h
@@ -123,4 +123,6 @@ struct drm_hdmi_frl_dfm {
 	struct drm_frl_dfm_params params;
 };
 
+bool drm_frl_dfm_nondsc_requirement_met(struct drm_hdmi_frl_dfm *frl_dfm);
+
 #endif
-- 
2.32.0

