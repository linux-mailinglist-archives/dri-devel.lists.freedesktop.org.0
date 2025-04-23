Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF0FA98A92
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 15:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4B410E687;
	Wed, 23 Apr 2025 13:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i9PWrqbA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AD210E671;
 Wed, 23 Apr 2025 13:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745413878; x=1776949878;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=lTFpU4UtULz2jLZg0ZWn/w87m9DLzdqvCmOsgO/0Z0s=;
 b=i9PWrqbACJBwngLfJ06RbEAVhmNJNtq3nbAS8uC5NxQt7z1tMagk0Zej
 e3ee3++u7pDjw/r6NpRpolOeRv+AJa9NO/7H0zvtxzuCzmbdPMl7XRzmH
 1iscD9bpP5yMFliQbNCF1RnEbDXAntZTfm5c/F5vL/M9BOHtxNFqSUfXi
 hv3Lo22/XzE2CpvmmyneLIQWJclYq1wQSygYZXeBIQLT2dYFKZXUqhbXM
 Vi5kHpbkPL+QoMQejx5nniiexWnTSn5kLhqgOjDW7PNirv4qwCdYrbiAP
 xBobLDe36n/e56CGfpt/Oz8oonkKLIclxlmw2SZMqfSxKhRuQYKfhX1F0 Q==;
X-CSE-ConnectionGUID: FwMU87H1S5i2El0YDwuHKg==
X-CSE-MsgGUID: 3mUCHX2wTRGxlOuF2gDGnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47185227"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47185227"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 06:08:22 -0700
X-CSE-ConnectionGUID: +VdPQOSRRd+r8Ha8lXt7Vw==
X-CSE-MsgGUID: +6Ve/oytSIi0FBJd59K0MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="133196414"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa009.fm.intel.com with ESMTP; 23 Apr 2025 06:08:02 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 23 Apr 2025 18:23:33 +0530
Subject: [PATCH v5 1/2] drm/display/dp: Export fn to calculate link symbol
 cycles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-hblank-v5-1-6bee618bc979@intel.com>
References: <20250423-hblank-v5-0-6bee618bc979@intel.com>
In-Reply-To: <20250423-hblank-v5-0-6bee618bc979@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: imre.deak@intel.com, vinod.govindapillai@intel.com, 
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
v4: Expose only drm_dp_link_symbol_cycles() (Imre)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 51 +++++++++++++++++++++------------
 include/drm/display/drm_dp_helper.h     |  2 ++
 2 files changed, 35 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 57828f2b7b5a0582ca4a6f2a9be2d5909fe8ad24..d33a46016504ce52857b7c4e63d866af9c1eff34 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4393,8 +4393,9 @@ EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
 #endif
 
 /* See DP Standard v2.1 2.6.4.4.1.1, 2.8.4.4, 2.8.7 */
-static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
-				     int symbol_size, bool is_mst)
+static int drm_dp_link_data_symbol_cycles(int lane_count, int pixels,
+					  int bpp_x16, int symbol_size,
+					  bool is_mst)
 {
 	int cycles = DIV_ROUND_UP(pixels * bpp_x16, 16 * symbol_size * lane_count);
 	int align = is_mst ? 4 / lane_count : 1;
@@ -4402,22 +4403,41 @@ static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
 	return ALIGN(cycles, align);
 }
 
-static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
-					 int bpp_x16, int symbol_size, bool is_mst)
+/**
+ * drm_dp_link_symbol_cycles - calculate the link symbol count with/without dsc
+ * @lane_count: DP link lane count
+ * @pixels: number of pixels in a scanline
+ * @dsc_slice_count: number of slices
+ * @bpp_x16: bits per pixel in .4 binary fixed format
+ * @symbol_size: DP symbol size
+ * @is_mst: %true for MST and %false for SST
+ *
+ * Calculate the link symbol cycles for both DSC(@dsc_slice_count !=0) and
+ * non-DSC case(@dsc_slice_count == 0)and return the count.
+ */
+int drm_dp_link_symbol_cycles(int lane_count, int pixels, int dsc_slice_count,
+			      int bpp_x16, int symbol_size, bool is_mst)
 {
-	int slice_pixels = DIV_ROUND_UP(pixels, slice_count);
-	int slice_data_cycles = drm_dp_link_symbol_cycles(lane_count, slice_pixels,
-							  bpp_x16, symbol_size, is_mst);
-	int slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
+	int slice_count = dsc_slice_count ? : 1;
+	int slice_data_cycles = drm_dp_link_data_symbol_cycles(lane_count,
+							       pixels,
+							       bpp_x16,
+							       symbol_size,
+							       is_mst);
+	int slice_eoc_cycles = 0;
+
+	if (dsc_slice_count)
+		slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
 
 	return slice_count * (slice_data_cycles + slice_eoc_cycles);
 }
+EXPORT_SYMBOL(drm_dp_link_symbol_cycles);
 
 /**
  * drm_dp_bw_overhead - Calculate the BW overhead of a DP link stream
  * @lane_count: DP link lane count
  * @hactive: pixel count of the active period in one scanline of the stream
- * @dsc_slice_count: DSC slice count if @flags/DRM_DP_LINK_BW_OVERHEAD_DSC is set
+ * @dsc_slice_count: number of slices
  * @bpp_x16: bits per pixel in .4 binary fixed point
  * @flags: DRM_DP_OVERHEAD_x flags
  *
@@ -4486,15 +4506,10 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
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
+						  dsc_slice_count,
+						  bpp_x16, symbol_size,
+						  is_mst);
 
 	return DIV_ROUND_UP_ULL(mul_u32_u32(symbol_cycles * symbol_size * lane_count,
 					    overhead * 16),
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index d9614e2c89397536f44bb7258e894628ae1dccc9..7b19192c70313d66dce1b7ba40dd59c14f80a182 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -971,5 +971,7 @@ int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
 int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes);
 
 ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc, struct dp_sdp *sdp);
+int drm_dp_link_symbol_cycles(int lane_count, int pixels, int dsc_slice_count,
+			      int bpp_x16, int symbol_size, bool is_mst);
 
 #endif /* _DRM_DP_HELPER_H_ */

-- 
2.25.1

