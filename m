Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7C8A89618
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 10:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEA510E682;
	Tue, 15 Apr 2025 08:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E8xZXcf+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A293010E67D;
 Tue, 15 Apr 2025 08:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744704594; x=1776240594;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=AicOpDsGRI8+XjZ8dOSit0pPLE12p298XZp/7ABBh34=;
 b=E8xZXcf+sR1cKpT2H7CzxagKu7aPnnTZJ8OERD6TMm7rODYugJQvw0o4
 qUJQFiruU78HuXokc/NuAxYh78bej+xqyniDuStz4cEVdZShwAc9yubFc
 Rlgb58SuuODbt2W7aGFWtbJGe47VSOStfj2ghJaBclYAak+pY9paybhCp
 zi3MVeRN3LWyN59o0fRenGUwLQF4Dw9bguVNxWqqQa3mhYTAISIUbzacM
 0AA+9IJHWj5p9YzY+/csgZklJHwHSBTohdpKj5m5bP18cfsIZNdblPqKR
 Q/VCaSGseSd+HTToF+g05s+e4c/BXH3kjcq7YQXUvLrtati2wIJO6Yiq5 g==;
X-CSE-ConnectionGUID: nbFTsRSKRuilyBbgBu25Xw==
X-CSE-MsgGUID: jBQAUygOR/iYWGsGQ+xf2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57191746"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="57191746"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 01:09:54 -0700
X-CSE-ConnectionGUID: xcxgKC5gRXKb4Q0XKJn3Fw==
X-CSE-MsgGUID: 8o0V5FM+Sgi9c1tf6XNaOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130594851"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa010.fm.intel.com with ESMTP; 15 Apr 2025 01:09:52 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 15 Apr 2025 13:25:07 +0530
Subject: [PATCH v2 1/3] drm/display/dp: Export fn to calculate link symbol
 cycles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-hblank-v2-1-1a23e9d97360@intel.com>
References: <20250415-hblank-v2-0-1a23e9d97360@intel.com>
In-Reply-To: <20250415-hblank-v2-0-1a23e9d97360@intel.com>
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

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 47 ++++++++++++++++-----------------
 include/drm/display/drm_dp_helper.h     |  3 +++
 2 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 57828f2b7b5a0582ca4a6f2a9be2d5909fe8ad24..1a5ff9ba6505f312ee41eb3bcc8b53d318411c03 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4393,25 +4393,30 @@ EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
 #endif
 
 /* See DP Standard v2.1 2.6.4.4.1.1, 2.8.4.4, 2.8.7 */
-static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
-				     int symbol_size, bool is_mst)
+/**
+ * drm_dp_link_symbol_cycles - calculate the link symbol count
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
+int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
+			      int symbol_size, bool is_mst, int slice_count)
 {
-	int cycles = DIV_ROUND_UP(pixels * bpp_x16, 16 * symbol_size * lane_count);
+	int pix = slice_count ? DIV_ROUND_UP(pixels, slice_count) : pixels;
+	int cycles = DIV_ROUND_UP(pix * bpp_x16, 16 * symbol_size * lane_count);
 	int align = is_mst ? 4 / lane_count : 1;
+	int slice_data_cycles = ALIGN(cycles, align);
 
-	return ALIGN(cycles, align);
-}
-
-static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
-					 int bpp_x16, int symbol_size, bool is_mst)
-{
-	int slice_pixels = DIV_ROUND_UP(pixels, slice_count);
-	int slice_data_cycles = drm_dp_link_symbol_cycles(lane_count, slice_pixels,
-							  bpp_x16, symbol_size, is_mst);
-	int slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
-
-	return slice_count * (slice_data_cycles + slice_eoc_cycles);
+	return slice_count ? (slice_count * (slice_data_cycles + align)) :
+			     slice_data_cycles;
 }
+EXPORT_SYMBOL(drm_dp_link_symbol_cycles);
 
 /**
  * drm_dp_bw_overhead - Calculate the BW overhead of a DP link stream
@@ -4486,15 +4491,9 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
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
+	symbol_cycles = drm_dp_link_symbol_cycles(lane_count, hactive,
+						  bpp_x16, symbol_size,
+						  is_mst, dsc_slice_count);
 
 	return DIV_ROUND_UP_ULL(mul_u32_u32(symbol_cycles * symbol_size * lane_count,
 					    overhead * 16),
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index d9614e2c89397536f44bb7258e894628ae1dccc9..22ae37e7870f1008acfc980a9b46d8dea1fbbe10 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -972,4 +972,7 @@ int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes);
 
 ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc, struct dp_sdp *sdp);
 
+int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
+			      int symbol_size, bool is_mst, int slice_count);
+
 #endif /* _DRM_DP_HELPER_H_ */

-- 
2.25.1

