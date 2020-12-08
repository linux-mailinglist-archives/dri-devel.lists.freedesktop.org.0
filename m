Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD572D252D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 08:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2506E96C;
	Tue,  8 Dec 2020 07:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5225E6E96B;
 Tue,  8 Dec 2020 07:58:39 +0000 (UTC)
IronPort-SDR: J/mPnobKKLpatZZx9Lko9b4zmOBg02iKn3FSRd8bWU1B5+P/Jiq6ocz8BkAsREtBa45Aak4B7n
 E8ECZyL0VJtA==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173995373"
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="173995373"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 23:58:38 -0800
IronPort-SDR: +lLjiekef1ig4qc7D4W/sHc7pCVkEWNBQHY1wqWJQIvuM101+FeanH9cjiPNlxfxz3usjqRr5p
 OYZKAz/xwK4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="317686574"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga008.fm.intel.com with ESMTP; 07 Dec 2020 23:58:32 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 12/16] drm/i915: Read DSC capabilities of the HDMI2.1 PCON
 encoder
Date: Tue,  8 Dec 2020 13:21:41 +0530
Message-Id: <20201208075145.17389-13-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201208075145.17389-1-ankit.k.nautiyal@intel.com>
References: <20201208075145.17389-1-ankit.k.nautiyal@intel.com>
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
Cc: swati2.sharma@intel.com, airlied@linux.ie, vandita.kulkarni@intel.com,
 uma.shankar@intel.com, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds support to read and store the DSC capabilities of the
HDMI2.1 PCon encoder. It also adds a new field to store these caps,
The caps are read during dfp update and can later be used to get the
PPS parameters for PCON-HDMI2.1 sink pair. Which inturn will be used
to take a call to override the existing PPS-metadata, by either
writing the entire new PPS metadata, or by writing only the
PPS override parameters.

v2: Restructured the code to read all capability DPCDs at once and store
in an array in intel_dp structure.

v3: rebase

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c624c2f9b624..b41de41759a0 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1362,6 +1362,7 @@ struct intel_dp {
 	u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE];
 	u8 lttpr_phy_caps[DP_MAX_LTTPR_COUNT][DP_LTTPR_PHY_CAP_SIZE];
 	u8 fec_capable;
+	u8 pcon_dsc_dpcd[DP_PCON_DSC_ENCODER_CAP_SIZE];
 	/* source rates */
 	int num_source_rates;
 	const int *source_rates;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0616779d858e..4dd272a34ee8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3984,6 +3984,24 @@ cpt_set_link_train(struct intel_dp *intel_dp,
 	intel_de_posting_read(dev_priv, intel_dp->output_reg);
 }
 
+static void intel_dp_get_pcon_dsc_cap(struct intel_dp *intel_dp)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+
+	/* Clear the cached register set to avoid using stale values */
+
+	memset(intel_dp->pcon_dsc_dpcd, 0, sizeof(intel_dp->pcon_dsc_dpcd));
+
+	if (drm_dp_dpcd_read(&intel_dp->aux, DP_PCON_DSC_ENCODER,
+				     intel_dp->pcon_dsc_dpcd,
+				     sizeof(intel_dp->pcon_dsc_dpcd)) < 0)
+		drm_err(&i915->drm, "Failed to read DPCD register 0x%x\n",
+			DP_PCON_DSC_ENCODER);
+
+	drm_dbg_kms(&i915->drm, "PCON ENCODER DSC DPCD: %*ph\n",
+		   (int)sizeof(intel_dp->pcon_dsc_dpcd), intel_dp->pcon_dsc_dpcd);
+}
+
 static int intel_dp_pcon_get_frl_mask(u8 frl_bw_mask)
 {
 	int bw_gbps[] = {9, 18, 24, 32, 40, 48};
@@ -6757,6 +6775,8 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,
 		    intel_dp->dfp.max_tmds_clock,
 		    intel_dp->dfp.pcon_max_frl_bw,
 		    intel_dp->dfp.sink_max_frl_bw);
+
+	intel_dp_get_pcon_dsc_cap(intel_dp);
 }
 
 static void
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
