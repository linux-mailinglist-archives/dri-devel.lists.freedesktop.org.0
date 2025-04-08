Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F09A7F38C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 06:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7074A10E5B3;
	Tue,  8 Apr 2025 04:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jQPtadRq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768F310E113;
 Tue,  8 Apr 2025 04:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744086314; x=1775622314;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=8xcY4DcOAX0cRvuH0p3So19RFo6PrVunQAd0MX2GbW8=;
 b=jQPtadRqNEzOox5eFO28cElbsirF8My3qJAfDTjrGJiDV+8c9MB1Arye
 fsDO0aNFLZROjof+tbwJXIA8BPm1jo72lKzfDeVn6X9Og1sb6EO36Lves
 HiFk2I2P4RI0QbTy9rmX2RNqVviIY4x1BMHRKvfEsLdtEqfsvuKz7teoy
 cXRa+NYWni/Y/eX58VyRX34JYVBDSYXNgg+tKfceZKP5dJu8Nw+hugNrv
 eac2OFR2u9vAPKbUrN9cw5XBPOa9I3RaMV2GiEnEjOqH9AuMhwhaKL63b
 0tY1BxUrkIHWlap5UzZp5o/WATAQG2fOyBkmyTtrcF79Ju91fxZlFro2K g==;
X-CSE-ConnectionGUID: DKFdwK7DS56lbe1f26/bQQ==
X-CSE-MsgGUID: nvPNPlqUTQCOpbHehujLfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="63043685"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="63043685"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 21:25:14 -0700
X-CSE-ConnectionGUID: EwDGCHzQRO2TlIm7CMaiLA==
X-CSE-MsgGUID: FlF5lkO0QCe1B1hOVhLfiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="128479399"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa008.fm.intel.com with ESMTP; 07 Apr 2025 21:25:12 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 08 Apr 2025 09:40:34 +0530
Subject: [PATCH 1/3] drm/drm_dp_helper: export link symbol cycles calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-hblank-v1-1-4ba17aebee65@intel.com>
References: <20250408-hblank-v1-0-4ba17aebee65@intel.com>
In-Reply-To: <20250408-hblank-v1-0-4ba17aebee65@intel.com>
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

Link symbol cycles are required for the calculation of the minimum
HBlank calculation.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 10 ++++++----
 include/drm/display/drm_dp_helper.h     |  5 +++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 57828f2b7b5a0582ca4a6f2a9be2d5909fe8ad24..488aaef61e3aa8b25975dfc98cbccdf5b7f083f8 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4393,17 +4393,18 @@ EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
 #endif
 
 /* See DP Standard v2.1 2.6.4.4.1.1, 2.8.4.4, 2.8.7 */
-static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
-				     int symbol_size, bool is_mst)
+int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
+			      int symbol_size, bool is_mst)
 {
 	int cycles = DIV_ROUND_UP(pixels * bpp_x16, 16 * symbol_size * lane_count);
 	int align = is_mst ? 4 / lane_count : 1;
 
 	return ALIGN(cycles, align);
 }
+EXPORT_SYMBOL(drm_dp_link_symbol_cycles);
 
-static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
-					 int bpp_x16, int symbol_size, bool is_mst)
+int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
+				  int bpp_x16, int symbol_size, bool is_mst)
 {
 	int slice_pixels = DIV_ROUND_UP(pixels, slice_count);
 	int slice_data_cycles = drm_dp_link_symbol_cycles(lane_count, slice_pixels,
@@ -4412,6 +4413,7 @@ static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_c
 
 	return slice_count * (slice_data_cycles + slice_eoc_cycles);
 }
+EXPORT_SYMBOL(drm_dp_link_dsc_symbol_cycles);
 
 /**
  * drm_dp_bw_overhead - Calculate the BW overhead of a DP link stream
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index d9614e2c89397536f44bb7258e894628ae1dccc9..f6bfa3b74810438b837540dccb08a987bcdb5d03 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -972,4 +972,9 @@ int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes);
 
 ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc, struct dp_sdp *sdp);
 
+int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
+			      int symbol_size, bool is_mst);
+int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
+				  int bpp_x16, int symbol_size, bool is_mst);
+
 #endif /* _DRM_DP_HELPER_H_ */

-- 
2.25.1

