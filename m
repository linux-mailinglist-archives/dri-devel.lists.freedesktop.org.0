Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDCB3B977B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C6B6EC14;
	Thu,  1 Jul 2021 20:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E26D6EC1B;
 Thu,  1 Jul 2021 20:25:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208436170"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208436170"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:21 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564559"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 51/53] drm/i915/display/dsc: Set BPP in the kernel
Date: Thu,  1 Jul 2021 13:24:25 -0700
Message-Id: <20210701202427.1547543-52-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
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
Cc: Patnana Venkata Sai <venkata.sai.patnana@intel.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, dri-devel@lists.freedesktop.org,
 Navare Manasi D <manasi.d.navare@intel.com>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Anusha Srivatsa <anusha.srivatsa@intel.com>

Set compress BPP in kernel while connector DP or eDP

Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: Navare Manasi D <manasi.d.navare@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 5b52beaddada..57aadee69d8b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1241,9 +1241,15 @@ static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	pipe_config->lane_count = limits->max_lane_count;
 
 	if (intel_dp_is_edp(intel_dp)) {
-		pipe_config->dsc.compressed_bpp =
-			min_t(u16, drm_edp_dsc_sink_output_bpp(intel_dp->dsc_dpcd) >> 4,
-			      pipe_config->pipe_bpp);
+		if (intel_dp->force_dsc_bpp) {
+			drm_dbg_kms(&dev_priv->drm,
+				"DSC BPC forced to %d", intel_dp->force_dsc_bpp);
+			pipe_config->dsc.compressed_bpp = intel_dp->force_dsc_bpp;
+		} else {
+			pipe_config->dsc.compressed_bpp =
+				min_t(u16, drm_edp_dsc_sink_output_bpp(intel_dp->dsc_dpcd) >> 4,
+				pipe_config->pipe_bpp);
+		}
 		pipe_config->dsc.slice_count =
 			drm_dp_dsc_sink_max_slice_count(intel_dp->dsc_dpcd,
 							true);
@@ -1269,9 +1275,15 @@ static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				    "Compressed BPP/Slice Count not supported\n");
 			return -EINVAL;
 		}
-		pipe_config->dsc.compressed_bpp = min_t(u16,
+		if (intel_dp->force_dsc_bpp) {
+			drm_dbg_kms(&dev_priv->drm,
+				    "DSC BPC forced to %d\n", intel_dp->force_dsc_bpp);
+			pipe_config->dsc.compressed_bpp = intel_dp->force_dsc_bpp;
+		} else {
+			pipe_config->dsc.compressed_bpp = min_t(u16,
 							       dsc_max_output_bpp >> 4,
 							       pipe_config->pipe_bpp);
+		}
 		pipe_config->dsc.slice_count = dsc_dp_slice_count;
 	}
 	/*
@@ -1374,7 +1386,8 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 	 * Pipe joiner needs compression upto display12 due to BW limitation. DG2
 	 * onwards pipe joiner can be enabled without compression.
 	 */
-	drm_dbg_kms(&i915->drm, "Force DSC en = %d\n", intel_dp->force_dsc_en);
+	drm_dbg_kms(&i915->drm, "Force DSC en = %d\n Force DSC BPP = %d\n",
+		    intel_dp->force_dsc_en, intel_dp->force_dsc_bpp);
 	if (ret || intel_dp->force_dsc_en || (DISPLAY_VER(i915) < 13 &&
 					      pipe_config->bigjoiner)) {
 		ret = intel_dp_dsc_compute_config(intel_dp, pipe_config,
-- 
2.25.4

