Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4391AA91A00
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 13:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B7710EABA;
	Thu, 17 Apr 2025 11:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4pN/Mpy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2F710EAAD;
 Thu, 17 Apr 2025 11:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744888018; x=1776424018;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=CRaTeuY04YlOMNat40AlxcWZ3Q8HABb51XRJB3JwcrI=;
 b=m4pN/MpyyKVNV4DKWxBSFhKSoT3vguDDYaXw2zM+VuCUlreW9AwCgOvv
 reIvD0S7qo5urLlF5/6H4efbI79Q3ZS27mhkqnpnxpQD+ZyvMT5IK9av9
 P6hHVcE7wmyRCendsOzf8pJxfWaaiv6WSatr3+cyvlJGNprILiqkZROir
 v5FpUnhRle5NlXuVN15Gl8dVDroZZT0UNl9AwAw4f0bqHKJoGzk8416OM
 eIf9UMv6LtzIX12rizVucrBUMI1Tv5gheQ5/+M4v0M/SfTHrCIccdXgBe
 Q8RVrA9m04a2ymjCVSTBGRRiCngRnpN+j5Y2ilcXlmtgsnX+wd50fLJFt w==;
X-CSE-ConnectionGUID: V5/3GubURO66oNDfUjiO3g==
X-CSE-MsgGUID: pLFXyPHsR6u76HlGMMCRqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46481064"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46481064"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 04:06:58 -0700
X-CSE-ConnectionGUID: ljARwiheTk6MrnRRulutNQ==
X-CSE-MsgGUID: sTW6e4vaSlCrYPiNhsaKoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="131754028"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa008.jf.intel.com with ESMTP; 17 Apr 2025 04:06:57 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 17 Apr 2025 16:22:28 +0530
Subject: [PATCH v3 1/3] drm/display/dp: Export fn to calculate link symbol
 cycles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-hblank-v3-1-d3387df7efce@intel.com>
References: <20250417-hblank-v3-0-d3387df7efce@intel.com>
In-Reply-To: <20250417-hblank-v3-0-d3387df7efce@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unify the function to calculate the link symbol cycles for both dsc and
non-dsc case and export the function so that it can be used in the
respective platform display drivers for other calculations.

v2: unify the fn for both dsc and non-dsc case (Imre)
v3: rename drm_dp_link_symbol_cycles to drm_dp_link_data_symbol_cycles
    retain slice_eoc_cycles as is (Imre)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 53 +++++++++++++++++----------------
 include/drm/display/drm_dp_helper.h     |  2 ++
 2 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 57828f2b7b5a0582ca4a6f2a9be2d5909fe8ad24..5ce8ccc3310fb71b39ea5f74c4022474c180f727 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4392,26 +4392,33 @@ EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
 
 #endif
 
-/* See DP Standard v2.1 2.6.4.4.1.1, 2.8.4.4, 2.8.7 */
-static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
-				     int symbol_size, bool is_mst)
-{
-	int cycles = DIV_ROUND_UP(pixels * bpp_x16, 16 * symbol_size * lane_count);
-	int align = is_mst ? 4 / lane_count : 1;
-
-	return ALIGN(cycles, align);
-}
-
-static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
-					 int bpp_x16, int symbol_size, bool is_mst)
-{
-	int slice_pixels = DIV_ROUND_UP(pixels, slice_count);
-	int slice_data_cycles = drm_dp_link_symbol_cycles(lane_count, slice_pixels,
-							  bpp_x16, symbol_size, is_mst);
+/**
+ * drm_dp_link_data_symbol_cycles - calculate the link symbol count
+ * @lane_coount: DP link lane count
+ * @pixels: horizontal active pixels
+ * @bpp_x16: bits per pixel in .4 binary fixed format
+ * @symbol_size: DP symbol size
+ * @is_mst: is mst or sst
+ * @slice_count: number of slices
+ *
+ * Calculate the link symbol cycles for both dsc and non dsc case and
+ * return the count.
+ */
+int drm_dp_link_data_symbol_cycles(int lane_count, int pixels, int bpp_x16,
+				   int symbol_size, bool is_mst, int slice_count)
+{
+	int slice_pixels = slice_count ? DIV_ROUND_UP(pixels, slice_count) :
+					 pixels;
+	int cycles = DIV_ROUND_UP(slice_pixels * bpp_x16,
+				  (6 * symbol_size * lane_count));
+	int slice_data_cycles = ALIGN(cycles, is_mst ? (4 / lane_count) : 1);
 	int slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
 
-	return slice_count * (slice_data_cycles + slice_eoc_cycles);
+	return slice_count ? (slice_count *
+			      (slice_data_cycles + slice_eoc_cycles)) :
+			      slice_data_cycles;
 }
+EXPORT_SYMBOL(drm_dp_link_data_symbol_cycles);
 
 /**
  * drm_dp_bw_overhead - Calculate the BW overhead of a DP link stream
@@ -4486,15 +4493,9 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
 	WARN_ON((flags & DRM_DP_BW_OVERHEAD_UHBR) &&
 		(flags & DRM_DP_BW_OVERHEAD_FEC));
 
-	if (flags & DRM_DP_BW_OVERHEAD_DSC)
-		symbol_cycles = drm_dp_link_dsc_symbol_cycles(lane_count, hactive,
-							      dsc_slice_count,
-							      bpp_x16, symbol_size,
-							      is_mst);
-	else
-		symbol_cycles = drm_dp_link_symbol_cycles(lane_count, hactive,
-							  bpp_x16, symbol_size,
-							  is_mst);
+	symbol_cycles = drm_dp_link_data_symbol_cycles(lane_count, hactive,
+						       bpp_x16, symbol_size,
+						       is_mst, dsc_slice_count);
 
 	return DIV_ROUND_UP_ULL(mul_u32_u32(symbol_cycles * symbol_size * lane_count,
 					    overhead * 16),
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index d9614e2c89397536f44bb7258e894628ae1dccc9..98bbbe98e5bc0ce0f9cdf513b2c5ea90bb5caffb 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -971,5 +971,7 @@ int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
 int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes);
 
 ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc, struct dp_sdp *sdp);
+int drm_dp_link_data_symbol_cycles(int lane_count, int pixels, int bpp_x16,
+				   int symbol_size, bool is_mst, int slice_count);
 
 #endif /* _DRM_DP_HELPER_H_ */

-- 
2.25.1

