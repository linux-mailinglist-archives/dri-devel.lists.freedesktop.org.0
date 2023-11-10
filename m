Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0837E7B4C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 11:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4C210E966;
	Fri, 10 Nov 2023 10:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7A410E96B;
 Fri, 10 Nov 2023 10:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699611390; x=1731147390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h0DQe/y+9A84wd2JelD0AQtf/U8M8ivA/ChSiFNeXrs=;
 b=hBbbYhxKQU5NUoo+rCNbJ9D5M4w+brEPTR648V/HwOG5z/+qfS19EzfV
 MwbC9c7qhQ7m3xa3/mOrqK1WF3goHySRbCwMwcb+8Zna6ygDdisV9POD+
 LDsNNydBtVkIyhbWkRxq6Yk1LCzcrZhBYBWBp8+nh3qpt32Dj+hp2jFrE
 V9dsd1kvNQH4bfNVDHomp2fafaX96qn1GJw578BgC4qsCevGa0EGzbxm9
 J5cADDgCq4Gd/jZcgNtnynTcLLEAU9QkMAlGoYEwWZXqVn4zEbSUEXBVH
 4CaOPKZBXKiVESnWzlM++tjuGjOcFoqJdKas4Fn22IePCPNqItBJIxj5N A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11712822"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="11712822"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:16:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="4816416"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:16:28 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 06/11] drm/i915/dp: Iterate over output bpp with fractional
 step size
Date: Fri, 10 Nov 2023 15:40:15 +0530
Message-Id: <20231110101020.4067342-7-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
References: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, suraj.kandpal@intel.com,
 suijingfeng@loongson.cn, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds support to iterate over compressed output bpp as per the
fractional step, supported by DP sink.

v2:
-Avoid ending up with compressed bpp, same as pipe bpp. (Stan)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 41 +++++++++++++++----------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 246f50d1f030..e53c87825194 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1737,15 +1737,15 @@ static bool intel_dp_dsc_supports_format(const struct intel_connector *connector
 	return drm_dp_dsc_sink_supports_format(connector->dp.dsc_dpcd, sink_dsc_format);
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
@@ -1753,7 +1753,7 @@ static bool is_bw_sufficient_for_dsc_config(u16 compressed_bpp, u32 link_clock,
 static int dsc_compute_link_config(struct intel_dp *intel_dp,
 				   struct intel_crtc_state *pipe_config,
 				   struct link_config_limits *limits,
-				   u16 compressed_bpp,
+				   u16 compressed_bppx16,
 				   int timeslots)
 {
 	const struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
@@ -1768,8 +1768,8 @@ static int dsc_compute_link_config(struct intel_dp *intel_dp,
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
@@ -1882,7 +1882,7 @@ icl_dsc_compute_link_config(struct intel_dp *intel_dp,
 		ret = dsc_compute_link_config(intel_dp,
 					      pipe_config,
 					      limits,
-					      valid_dsc_bpp[i],
+					      valid_dsc_bpp[i] << 4,
 					      timeslots);
 		if (ret == 0) {
 			pipe_config->dsc.compressed_bpp_x16 =
@@ -1902,6 +1902,7 @@ icl_dsc_compute_link_config(struct intel_dp *intel_dp,
  */
 static int
 xelpd_dsc_compute_link_config(struct intel_dp *intel_dp,
+			      const struct intel_connector *connector,
 			      struct intel_crtc_state *pipe_config,
 			      struct link_config_limits *limits,
 			      int dsc_max_bpp,
@@ -1909,23 +1910,31 @@ xelpd_dsc_compute_link_config(struct intel_dp *intel_dp,
 			      int pipe_bpp,
 			      int timeslots)
 {
-	u16 compressed_bpp;
+	u8 bppx16_incr = drm_dp_dsc_sink_bpp_incr(connector->dp.dsc_dpcd);
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
-				to_bpp_x16(compressed_bpp);
+			pipe_config->dsc.compressed_bpp_x16 = compressed_bppx16;
 			return 0;
 		}
 	}
@@ -1963,7 +1972,7 @@ static int dsc_compute_compressed_bpp(struct intel_dp *intel_dp,
 	dsc_max_bpp = min(dsc_max_bpp, to_bpp_int(limits->link.max_bpp_x16));
 
 	if (DISPLAY_VER(i915) >= 13)
-		return xelpd_dsc_compute_link_config(intel_dp, pipe_config, limits,
+		return xelpd_dsc_compute_link_config(intel_dp, connector, pipe_config, limits,
 						     dsc_max_bpp, dsc_min_bpp, pipe_bpp, timeslots);
 	return icl_dsc_compute_link_config(intel_dp, pipe_config, limits,
 					   dsc_max_bpp, dsc_min_bpp, pipe_bpp, timeslots);
-- 
2.40.1

