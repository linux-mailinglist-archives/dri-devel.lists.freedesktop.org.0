Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC63751F14
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 12:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F78910E696;
	Thu, 13 Jul 2023 10:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74CD10E68E;
 Thu, 13 Jul 2023 10:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689244698; x=1720780698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V2pol8a+DjM3zFPYNYUBy33YOS9251Cm2mGhTAr38Wo=;
 b=NbyIle0NlJiS8d+tp2v7UzJi1oO5HFqG0F1M+a+btIN7JuwXB8NzsZ1E
 /EjKLmzv8CryuJroP/M2z4eIzeNw5dtNdg4CfQWaxC1q/ODkmDOYxajOk
 o2DYwrxdnExd8tZsfbWaWD3Xm8R2C6EaiiF9M9tblR3OQJQohMogkRx1w
 xSfVn0kIuOU0mVIB92dIFAVtYusQ0zt7zrhf7983Wk4gc6mywaMy/tMYy
 sYrRrGoL+3AzatINakjdmKz6mhiaTy2NgdP7JLO/EFqOqRQOjQdIOEV4G
 s0cqUXwcSNPTPwS9OGDtLTt4b0qSQdU/uuRgKWWRXm446zPJkjCZ8hvYg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="428897700"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="428897700"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 03:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895965461"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="895965461"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 03:38:16 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 17/19] drm/i915/dp: Separate out function to get compressed
 bpp with joiner
Date: Thu, 13 Jul 2023 16:03:44 +0530
Message-Id: <20230713103346.1163315-18-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
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

Pull the code to get joiner constraints on maximum compressed bpp into
separate function.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 49 ++++++++++++++-----------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c39039e214ff..54fc60eb94a0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -740,6 +740,30 @@ u32 intel_dp_dsc_nearest_valid_bpp(struct drm_i915_private *i915, u32 bpp, u32 p
 	return bits_per_pixel;
 }
 
+static
+u32 get_max_compressed_bpp_with_joiner(struct drm_i915_private *i915,
+				       u32 mode_clock, u32 mode_hdisplay,
+				       bool bigjoiner)
+{
+	u32 max_bpp_small_joiner_ram;
+
+	/* Small Joiner Check: output bpp <= joiner RAM (bits) / Horiz. width */
+	max_bpp_small_joiner_ram = small_joiner_ram_size_bits(i915) / mode_hdisplay;
+
+	if (bigjoiner) {
+		int bigjoiner_interface_bits = DISPLAY_VER(i915) >= 14 ? 36 : 24;
+		u32 max_bpp_bigjoiner =
+			i915->display.cdclk.max_cdclk_freq * 2 * bigjoiner_interface_bits /
+			intel_dp_mode_to_fec_clock(mode_clock);
+
+		max_bpp_small_joiner_ram *= 2;
+
+		return min(max_bpp_small_joiner_ram, max_bpp_bigjoiner);
+	}
+
+	return max_bpp_small_joiner_ram;
+}
+
 u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
 					u32 link_clock, u32 lane_count,
 					u32 mode_clock, u32 mode_hdisplay,
@@ -748,7 +772,7 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
 					u32 pipe_bpp,
 					u32 timeslots)
 {
-	u32 bits_per_pixel, max_bpp_small_joiner_ram;
+	u32 bits_per_pixel, joiner_max_bpp;
 
 	/*
 	 * Available Link Bandwidth(Kbits/sec) = (NumberOfLanes)*
@@ -788,27 +812,10 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
 				(link_clock * lane_count * 8),
 				intel_dp_mode_to_fec_clock(mode_clock));
 
-	/* Small Joiner Check: output bpp <= joiner RAM (bits) / Horiz. width */
-	max_bpp_small_joiner_ram = small_joiner_ram_size_bits(i915) /
-		mode_hdisplay;
-
-	if (bigjoiner)
-		max_bpp_small_joiner_ram *= 2;
-
-	/*
-	 * Greatest allowed DSC BPP = MIN (output BPP from available Link BW
-	 * check, output bpp from small joiner RAM check)
-	 */
-	bits_per_pixel = min(bits_per_pixel, max_bpp_small_joiner_ram);
+	joiner_max_bpp = get_max_compressed_bpp_with_joiner(i915, mode_clock,
+							    mode_hdisplay, bigjoiner);
 
-	if (bigjoiner) {
-		int bigjoiner_interface_bits = DISPLAY_VER(i915) >= 14 ? 36 : 24;
-		u32 max_bpp_bigjoiner =
-			i915->display.cdclk.max_cdclk_freq * 2 * bigjoiner_interface_bits /
-			intel_dp_mode_to_fec_clock(mode_clock);
-
-		bits_per_pixel = min(bits_per_pixel, max_bpp_bigjoiner);
-	}
+	bits_per_pixel = min(bits_per_pixel, joiner_max_bpp);
 
 	bits_per_pixel = intel_dp_dsc_nearest_valid_bpp(i915, bits_per_pixel, pipe_bpp);
 
-- 
2.40.1

