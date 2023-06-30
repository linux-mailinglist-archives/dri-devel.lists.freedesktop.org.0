Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A25743C3B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 14:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E76510E479;
	Fri, 30 Jun 2023 12:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A5910E471;
 Fri, 30 Jun 2023 12:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688129475; x=1719665475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o6tmZDgaNxYQ73MNK/RGT3BKdhsa6iUHGTKYGqN9Ra4=;
 b=CDiTav9nqum+zeaIkVp6kgsbDCI65rCn0IY/15C70D98qEG6s1UbLmkV
 po/W5BdZV9zdWIkv2zkKp35YYPB6WXMFKumPniYno8O3G3U/YybsEUX00
 ZPriqssucxqpxeBRBDXRJMrWs+3jNDZFyxYsrM06dToRECGE4PFebYlPK
 rXgAwbwpSXRxZmjBr175itfnfYWMT6qHvEPL7bNuwd4GLeAohjOYS1UXy
 g26Rl5CEzYltiTsG/yNXm6O5jgwtVnco4CpJuSOihFkwSX5UFYShfVIG8
 BmK2de9Qh+vDzRSNXQyt7cXp1Nwl8kiF/O2IhOLx6B6xO0t2sNW5z3JJh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="361232222"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="361232222"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:51:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="1048219097"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="1048219097"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:51:12 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/19] drm/i915/dp: Avoid left shift of DSC output bpp by 4
Date: Fri, 30 Jun 2023 18:16:45 +0530
Message-Id: <20230630124652.4140932-14-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230630124652.4140932-1-ankit.k.nautiyal@intel.com>
References: <20230630124652.4140932-1-ankit.k.nautiyal@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To make way for fractional bpp support, avoid left shifting the
output_bpp by 4 in helper intel_dp_dsc_get_output_bpp.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 10 +++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 +-
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9e815408c0d9..16dc32846f5a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -803,11 +803,7 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
 
 	bits_per_pixel = intel_dp_dsc_nearest_valid_bpp(i915, bits_per_pixel, pipe_bpp);
 
-	/*
-	 * Compressed BPP in U6.4 format so multiply by 16, for Gen 11,
-	 * fractional part is 0
-	 */
-	return bits_per_pixel << 4;
+	return bits_per_pixel;
 }
 
 u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
@@ -1197,7 +1193,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 								    mode->hdisplay,
 								    bigjoiner,
 								    output_format,
-								    pipe_bpp, 64) >> 4;
+								    pipe_bpp, 64);
 			dsc_slice_count =
 				intel_dp_dsc_get_slice_count(intel_dp,
 							     target_clock,
@@ -1802,7 +1798,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 							     pipe_config->pipe_bpp);
 
 			pipe_config->dsc.compressed_bpp = min_t(u16,
-								dsc_max_compressed_bpp >> 4,
+								dsc_max_compressed_bpp,
 								output_bpp);
 		}
 		pipe_config->dsc.slice_count = dsc_dp_slice_count;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index dff4717edbd0..4895d6242915 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -982,7 +982,7 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
 								    mode->hdisplay,
 								    bigjoiner,
 								    INTEL_OUTPUT_FORMAT_RGB,
-								    pipe_bpp, 64) >> 4;
+								    pipe_bpp, 64);
 			dsc_slice_count =
 				intel_dp_dsc_get_slice_count(intel_dp,
 							     target_clock,
-- 
2.40.1

