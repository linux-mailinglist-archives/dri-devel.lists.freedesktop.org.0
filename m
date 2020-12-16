Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5912DBABE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 06:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C539889E1B;
	Wed, 16 Dec 2020 05:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACE389DCF;
 Wed, 16 Dec 2020 05:37:53 +0000 (UTC)
IronPort-SDR: bCConyHCKA4wqQRTRNyjcdmO2cYwBWPVukKLlAsG2LtaEqqqNBoRiNUb/CjMDkC5jMizzhMHHI
 lA7q/iv7g4DA==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="172437327"
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="172437327"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 21:37:53 -0800
IronPort-SDR: DOGoeYaD+17ZmscWDYpvPtuXjp41gz315ppkiebrSPtd2TUVAvhsM9oLVMwtyhqq52HNRjGbJl
 iEfCSELzmE2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="556647121"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga006.fm.intel.com with ESMTP; 15 Dec 2020 21:37:50 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 08/15] drm/i915: Capture max frl rate for PCON in dfp cap
 structure
Date: Wed, 16 Dec 2020 11:01:14 +0530
Message-Id: <20201216053121.18819-9-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216053121.18819-1-ankit.k.nautiyal@intel.com>
References: <20201216053121.18819-1-ankit.k.nautiyal@intel.com>
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

HDMI2.1 PCON advertises Max FRL bandwidth supported by the PCON.

This patch captures this in dfp cap structure in intel_dp and uses
this to prune connector modes that cannot be supported by the PCON
and FRL bandwidth.

v2: Addressed review comments from Uma Shankar:
-tweaked the comparison of target bw and pcon frl bw to avoid roundup errors.
-minor modification of field names and comments.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 30 +++++++++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 5bc5bfbc4551..c88d2b918d9f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1451,6 +1451,7 @@ struct intel_dp {
 	struct {
 		int min_tmds_clock, max_tmds_clock;
 		int max_dotclock;
+		int pcon_max_frl_bw;
 		u8 max_bpc;
 		bool ycbcr_444_to_420;
 	} dfp;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index cb5e42c3ecd5..660b4bd2280a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -716,6 +716,25 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 	const struct drm_display_info *info = &connector->base.display_info;
 	int tmds_clock;
 
+	/* If PCON supports FRL MODE, check FRL bandwidth constraints */
+	if (intel_dp->dfp.pcon_max_frl_bw) {
+		int target_bw;
+		int max_frl_bw;
+		int bpp = intel_dp_mode_min_output_bpp(&connector->base, mode);
+
+		target_bw = bpp * target_clock;
+
+		max_frl_bw = intel_dp->dfp.pcon_max_frl_bw;
+
+		/* converting bw from Gbps to Kbps*/
+		max_frl_bw = max_frl_bw * 1000000;
+
+		if (target_bw > max_frl_bw)
+			return MODE_CLOCK_HIGH;
+
+		return MODE_OK;
+	}
+
 	if (intel_dp->dfp.max_dotclock &&
 	    target_clock > intel_dp->dfp.max_dotclock)
 		return MODE_CLOCK_HIGH;
@@ -6484,13 +6503,18 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,
 						 intel_dp->downstream_ports,
 						 edid);
 
+	intel_dp->dfp.pcon_max_frl_bw =
+		drm_dp_get_pcon_max_frl_bw(intel_dp->dpcd,
+					   intel_dp->downstream_ports);
+
 	drm_dbg_kms(&i915->drm,
-		    "[CONNECTOR:%d:%s] DFP max bpc %d, max dotclock %d, TMDS clock %d-%d\n",
+		    "[CONNECTOR:%d:%s] DFP max bpc %d, max dotclock %d, TMDS clock %d-%d, PCON Max FRL BW %dGbps\n",
 		    connector->base.base.id, connector->base.name,
 		    intel_dp->dfp.max_bpc,
 		    intel_dp->dfp.max_dotclock,
 		    intel_dp->dfp.min_tmds_clock,
-		    intel_dp->dfp.max_tmds_clock);
+		    intel_dp->dfp.max_tmds_clock,
+		    intel_dp->dfp.pcon_max_frl_bw);
 }
 
 static void
@@ -6582,6 +6606,8 @@ intel_dp_unset_edid(struct intel_dp *intel_dp)
 	intel_dp->dfp.min_tmds_clock = 0;
 	intel_dp->dfp.max_tmds_clock = 0;
 
+	intel_dp->dfp.pcon_max_frl_bw = 0;
+
 	intel_dp->dfp.ycbcr_444_to_420 = false;
 	connector->base.ycbcr_420_allowed = false;
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
