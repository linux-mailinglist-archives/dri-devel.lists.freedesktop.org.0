Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8301674B0D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 05:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05C610EA3B;
	Fri, 20 Jan 2023 04:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1602A10EA2D;
 Fri, 20 Jan 2023 04:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674189751; x=1705725751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hpLzW7jkfRv/8eL+JoEEmoFd4gCL8dxiq9VYaMXQeQQ=;
 b=Z33Bx7MuvhoTqeYF45pMOCVQS9OqaCPJx9nU+f2M8S4CSrhJWyRsCB07
 8mO9wgKyWQPsAZi46iSNqovGZQHmXTyVOJjdBmxgAja2IRHMmVGeLc8Ms
 m5YYAFq//VenrwIoT6mZZQ3PRk2eUTc7zX1eTeOWLk8xSNgxwipheKLPR
 lVAMLRIBN0Y6lT9iCwNEWUgTMtpUNzMX163VUA9aAeCd1QDUH1X+d6nLW
 dpNAM5bI2VMQSacLW6ECorHg9s1Lc4i6zjSw6E1f/+FMJ1HSF9ZPb/RwH
 tnWaXfVl3ezmbKCQlP7G/pOA4YaBSf048pWTS0ylzgoExogCbKBSXGFte A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323195599"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="323195599"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:42:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692735079"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="692735079"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:42:28 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 14/16] drm/i915/dp: Iterate over output bpp with fractional
 step size
Date: Fri, 20 Jan 2023 10:08:42 +0530
Message-Id: <20230120043844.3761895-15-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
References: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
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
Cc: manasi.d.navare@intel.com, vandita.kulkarni@intel.com,
 anusha.srivatsa@intel.com, swati2.sharma@intel.com,
 stanislav.lisovskiy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds support to iterate over compressed output bpp as per the
fractional step, supported by DP sink.

v2:
-Avoid ending up with compressed bpp, same as pipe bpp. (Stan)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 47 +++++++++++++++----------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 3d08acb4505a..8dede5969af5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1476,10 +1476,11 @@ static int intel_dp_dsc_compute_params(struct intel_encoder *encoder,
 	return drm_dsc_compute_rc_parameters(vdsc_cfg);
 }
 
-static bool is_dsc_bw_sufficient(int link_rate, int lane_count, int compressed_bpp,
+static bool is_dsc_bw_sufficient(int link_rate, int lane_count, int compressed_bppx16,
 				 const struct drm_display_mode *adjusted_mode)
 {
-	int mode_rate = intel_dp_link_required(adjusted_mode->crtc_clock, compressed_bpp);
+	int mode_rate = DIV_ROUND_UP(intel_dp_link_required(adjusted_mode->crtc_clock,
+							    compressed_bppx16), 16);
 	int link_avail = intel_dp_max_data_rate(link_rate, lane_count);
 
 	return mode_rate <= link_avail;
@@ -1489,7 +1490,7 @@ static int dsc_compute_link_config(struct intel_dp *intel_dp,
 				   struct intel_crtc_state *pipe_config,
 				   struct link_config_limits *limits,
 				   int pipe_bpp,
-				   u16 compressed_bpp)
+				   u16 compressed_bppx16)
 {
 	const struct drm_display_mode *adjusted_mode =
 		&pipe_config->hw.adjusted_mode;
@@ -1513,11 +1514,11 @@ static int dsc_compute_link_config(struct intel_dp *intel_dp,
 								      adjusted_mode->crtc_hdisplay,
 								      pipe_config->bigjoiner_pipes,
 								      pipe_bpp, 64);
-			if (compressed_bpp > dsc_max_bpp)
+			if (compressed_bppx16 > dsc_max_bpp << 16)
 				continue;
 
 			if (!is_dsc_bw_sufficient(link_rate, lane_count,
-						  compressed_bpp, adjusted_mode))
+						  compressed_bppx16, adjusted_mode))
 				continue;
 
 			pipe_config->lane_count = lane_count;
@@ -1580,33 +1581,41 @@ static int dsc_compute_compressed_bpp(struct intel_dp *intel_dp,
 				      int pipe_bpp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
-	u16 compressed_bpp;
-	int dsc_min_bpp, dsc_src_max_bpp, dsc_sink_max_bpp, dsc_max_bpp;
+	u16 compressed_bppx16;
+	int dsc_min_bppx16, dsc_src_max_bppx16, dsc_sink_max_bppx16, dsc_max_bppx16;
+	u8 bppx16_incr = drm_dp_dsc_sink_bpp_incr(intel_dp->dsc_dpcd);
+	u8 bppx16_step;
 	int ret;
 
-	dsc_min_bpp = max(dsc_min_compressed_bppx16(pipe_config) >> 4, 8);
+	if (DISPLAY_VER(dev_priv) < 14 || bppx16_incr <= 1)
+		bppx16_step = 16;
+	else
+		bppx16_step = 16 / bppx16_incr;
+
+	dsc_min_bppx16 = max((int)dsc_min_compressed_bppx16(pipe_config), 8 << 4);
 	if (DISPLAY_VER(dev_priv) <= 12)
-		dsc_src_max_bpp = 23;
+		dsc_src_max_bppx16 = 23 << 4;
 	else
-		dsc_src_max_bpp = 27;
-	dsc_sink_max_bpp = dsc_max_sink_compressed_bppx16(intel_dp->dsc_dpcd,
-							  pipe_config, pipe_bpp / 3) >> 4;
+		dsc_src_max_bppx16 = 27 << 4;
+	dsc_sink_max_bppx16 = dsc_max_sink_compressed_bppx16(intel_dp->dsc_dpcd,
+							     pipe_config, pipe_bpp / 3);
 
-	dsc_max_bpp = dsc_sink_max_bpp ? min(dsc_sink_max_bpp, dsc_src_max_bpp) : dsc_src_max_bpp;
+	dsc_max_bppx16 = dsc_sink_max_bppx16 ?
+		min(dsc_sink_max_bppx16, dsc_src_max_bppx16) : dsc_src_max_bppx16;
 
 	/* Compressed BPP should be less than the Input DSC bpp */
-	dsc_max_bpp = min(dsc_max_bpp, pipe_bpp - 1);
+	dsc_max_bppx16 = min(dsc_max_bppx16, (pipe_bpp << 4) - bppx16_step);
 
-	for (compressed_bpp = dsc_max_bpp;
-	     compressed_bpp >= dsc_min_bpp;
-	     compressed_bpp--) {
+	for (compressed_bppx16 = dsc_max_bppx16;
+	     compressed_bppx16 >= dsc_min_bppx16;
+	     compressed_bppx16 -= bppx16_step) {
 		ret = dsc_compute_link_config(intel_dp,
 					      pipe_config,
 					      limits,
 					      pipe_bpp,
-					      compressed_bpp);
+					      compressed_bppx16);
 		if (ret == 0) {
-			pipe_config->dsc.compressed_bpp = compressed_bpp << 4;
+			pipe_config->dsc.compressed_bpp = compressed_bppx16;
 			return 0;
 		}
 	}
-- 
2.25.1

