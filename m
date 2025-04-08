Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1397A7F38E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 06:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E75510E5B7;
	Tue,  8 Apr 2025 04:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U0tZR9sV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8175710E5B4;
 Tue,  8 Apr 2025 04:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744086316; x=1775622316;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=hYBtwQ9foEjwQ00a6TAO++yMh5CmivKZ9V7KJMdfqXY=;
 b=U0tZR9sV6OECcotshbCSlH/gnILA1M4O5TkagBuXjoNtoulUwQmQW4dX
 gvSw0XI8VK8Vd+PUagndynBVGdtyIpqmPZOlqUP/hJGkQcH/rqGwntWe0
 M8x+e8KMOKJANTOnc4wKhVL2bxxDw7f8b4IMLVXihBjKs2RP0yZePn6ZW
 7WTBcaZW7Rw4Oo1+MV92bz9YZPifGUn5keMYuekNdGW3BZhH9x8fLewCf
 NefS+QXXbab0sCcy7jLTV6aNC+J9Y+COnCCcThaWTKRaJfb50w7Xf06JE
 oQeMwCAPUOPEbXLKuU5sU4Bbsq1iwqKEttWu/TrfrXKIBfgaLjawNKVX+ w==;
X-CSE-ConnectionGUID: 0D2P4mwOQ6qqoYmbGXyiuA==
X-CSE-MsgGUID: yMWFeh60QLalpk0+/dBxRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="63043686"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="63043686"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 21:25:16 -0700
X-CSE-ConnectionGUID: sh13U6kiSr2vwCpkHgIVMA==
X-CSE-MsgGUID: 6DNFgcFuSkKuFW4J44S4NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="128479407"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa008.fm.intel.com with ESMTP; 07 Apr 2025 21:25:15 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 08 Apr 2025 09:40:35 +0530
Subject: [PATCH 2/3] drm/i915/display: export function to count dsc slices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-hblank-v1-2-4ba17aebee65@intel.com>
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

Export the function to calculate dsc slice count. This will be used in
minimum hblank calculation.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 4 ++--
 drivers/gpu/drm/i915/display/intel_dp_mst.h | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index d2988b9a6e7bd55d2ea4d34230c4d017e1f4cc93..af98a0d0e8376a79ce1ab6ff3c4f6af30f4d3e73 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -198,8 +198,8 @@ static int intel_dp_mst_calc_pbn(int pixel_clock, int bpp_x16, int bw_overhead)
 	return DIV_ROUND_UP(effective_data_rate * 64, 54 * 1000);
 }
 
-static int intel_dp_mst_dsc_get_slice_count(const struct intel_connector *connector,
-					    const struct intel_crtc_state *crtc_state)
+int intel_dp_mst_dsc_get_slice_count(const struct intel_connector *connector,
+				     const struct intel_crtc_state *crtc_state)
 {
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.h b/drivers/gpu/drm/i915/display/intel_dp_mst.h
index c1bbfeb02ca9e7afb96156f58143275225245956..b3d5b347c4b5258cefb0e559a5cb8d0d769111cc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.h
@@ -12,6 +12,7 @@ struct drm_connector_state;
 struct intel_atomic_state;
 struct intel_crtc;
 struct intel_crtc_state;
+struct intel_connector;
 struct intel_digital_port;
 struct intel_dp;
 struct intel_link_bw_limits;
@@ -35,5 +36,7 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
 				   struct intel_crtc_state *crtc_state,
 				   struct drm_connector_state *conn_state,
 				   int min_bpp_x16, int max_bpp_x16, int bpp_step_x16, bool dsc);
+int intel_dp_mst_dsc_get_slice_count(const struct intel_connector *connector,
+				     const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_DP_MST_H__ */

-- 
2.25.1

