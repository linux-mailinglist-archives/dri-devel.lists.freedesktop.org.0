Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E60F87AE80C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 10:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698C310E382;
	Tue, 26 Sep 2023 08:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A573C10E382;
 Tue, 26 Sep 2023 08:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695716978; x=1727252978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qL0ID9/W3gPk8XfbcaxhW+fLc4LwK5E/ZhegRunYlFE=;
 b=PX83Cju1dgjbwqdeYk1fLo0LTjLjCb92ngKifuaSWPGd3u2ttTwneCoi
 J5/3btgwDxPkdSOHIMLEqM0BDNRA4CAN+101edwoM97Nk0tqwAV1q4L+T
 lRM/wddQBKsnrnt53whLmF2doySHkqEgpTq/pQAnQ84c+0+CjufE51FR9
 H5/8BeKTM3mpcwC+dCuJusZ+vmuxcdMQPuLZ38d6vm5ZMkm+1cN7cTXFM
 dX+nHD4TFyQXHfPpLgejHJCvMsaQfPkcKQXcL+ZJ2T6h/vFemnQnAOlZu
 P3Mtl9BFzsBXJImkV7WSb/946j6sMnNdUpiLqHNB2qbRwHWO38OmWDpr6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412431876"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="412431876"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 01:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="752079105"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="752079105"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmsmga007.fm.intel.com with ESMTP; 26 Sep 2023 01:29:35 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/8] drm/i915/dp: Iterate over output bpp with fractional step
 size
Date: Tue, 26 Sep 2023 13:53:29 +0530
Message-Id: <20230926082331.739705-7-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230926082331.739705-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20230926082331.739705-1-mitulkumar.ajitkumar.golani@intel.com>
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
Cc: suraj.kandpal@intel.com, suijingfeng@loongson.cn, jani.nikula@intel.com,
 swati2.sharma@intel.com, mripard@kernel.org, ankit.k.nautiyal@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

This patch adds support to iterate over compressed output bpp as per the
fractional step, supported by DP sink.

v2:
-Avoid ending up with compressed bpp, same as pipe bpp. (Stan)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 38 +++++++++++++++----------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index fc72590f93c6..6f4a25d024e9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1716,15 +1716,15 @@ static bool intel_dp_dsc_supports_format(struct intel_dp *intel_dp,
 	return drm_dp_dsc_sink_supports_format(intel_dp->dsc_dpcd, sink_dsc_format);
 }
 
-static bool is_bw_sufficient_for_dsc_config(u16 compressed_bpp, u32 link_clock,
+static bool is_bw_sufficient_for_dsc_config(u16 compressed_bppx16, u32 link_clock,
 					    u32 lane_count, u32 mode_clock,
 					    enum intel_output_format output_format,
 					    int timeslots)
 {
 	u32 available_bw, required_bw;
 
-	available_bw = (link_clock * lane_count * timeslots)  / 8;
-	required_bw = compressed_bpp * (intel_dp_mode_to_fec_clock(mode_clock));
+	available_bw = (link_clock * lane_count * timeslots * 16)  / 8;
+	required_bw = compressed_bppx16 * (intel_dp_mode_to_fec_clock(mode_clock));
 
 	return available_bw > required_bw;
 }
@@ -1732,7 +1732,7 @@ static bool is_bw_sufficient_for_dsc_config(u16 compressed_bpp, u32 link_clock,
 static int dsc_compute_link_config(struct intel_dp *intel_dp,
 				   struct intel_crtc_state *pipe_config,
 				   struct link_config_limits *limits,
-				   u16 compressed_bpp,
+				   u16 compressed_bppx16,
 				   int timeslots)
 {
 	const struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
@@ -1747,8 +1747,8 @@ static int dsc_compute_link_config(struct intel_dp *intel_dp,
 		for (lane_count = limits->min_lane_count;
 		     lane_count <= limits->max_lane_count;
 		     lane_count <<= 1) {
-			if (!is_bw_sufficient_for_dsc_config(compressed_bpp, link_rate, lane_count,
-							     adjusted_mode->clock,
+			if (!is_bw_sufficient_for_dsc_config(compressed_bppx16, link_rate,
+							     lane_count, adjusted_mode->clock,
 							     pipe_config->output_format,
 							     timeslots))
 				continue;
@@ -1861,7 +1861,7 @@ icl_dsc_compute_link_config(struct intel_dp *intel_dp,
 		ret = dsc_compute_link_config(intel_dp,
 					      pipe_config,
 					      limits,
-					      valid_dsc_bpp[i],
+					      valid_dsc_bpp[i] << 4,
 					      timeslots);
 		if (ret == 0) {
 			pipe_config->dsc.compressed_bpp_x16 =
@@ -1888,23 +1888,31 @@ xelpd_dsc_compute_link_config(struct intel_dp *intel_dp,
 			      int pipe_bpp,
 			      int timeslots)
 {
-	u16 compressed_bpp;
+	u8 bppx16_incr = drm_dp_dsc_sink_bpp_incr(intel_dp->dsc_dpcd);
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+	u16 compressed_bppx16;
+	u8 bppx16_step;
 	int ret;
 
+	if (DISPLAY_VER(i915) < 14 || bppx16_incr <= 1)
+		bppx16_step = 16;
+	else
+		bppx16_step = 16 / bppx16_incr;
+
 	/* Compressed BPP should be less than the Input DSC bpp */
-	dsc_max_bpp = min(dsc_max_bpp, pipe_bpp - 1);
+	dsc_max_bpp = min(dsc_max_bpp << 4, (pipe_bpp << 4) - bppx16_step);
+	dsc_min_bpp = dsc_min_bpp << 4;
 
-	for (compressed_bpp = dsc_max_bpp;
-	     compressed_bpp >= dsc_min_bpp;
-	     compressed_bpp--) {
+	for (compressed_bppx16 = dsc_max_bpp;
+	     compressed_bppx16 >= dsc_min_bpp;
+	     compressed_bppx16 -= bppx16_step) {
 		ret = dsc_compute_link_config(intel_dp,
 					      pipe_config,
 					      limits,
-					      compressed_bpp,
+					      compressed_bppx16,
 					      timeslots);
 		if (ret == 0) {
-			pipe_config->dsc.compressed_bpp_x16 =
-				intel_fractional_bpp_to_x16(compressed_bpp);
+			pipe_config->dsc.compressed_bpp_x16 = compressed_bppx16;
 			return 0;
 		}
 	}
-- 
2.25.1

