Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 501D077793D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 15:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D0710E53D;
	Thu, 10 Aug 2023 13:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A772710E52E;
 Thu, 10 Aug 2023 13:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691672897; x=1723208897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SYPaWvmyLxzrL6q5qca8YSRHPWeq5O6tHwrdgZQbu7g=;
 b=Pam8wXSqkJd5NPyOdWxTnjsdCx6YJI+rtyXG6ozztkbNYTvevlDFHPqD
 82khihxoeab4mY4w+l7ex38mADyjGSc7g7D1FHzWBSwB+AtOzdLkW4RnL
 citsCR+3TgZG1GAbTm53La2YqUYMOoKy+t5yhTXCOC9XdzA0NE7cSavWp
 BW1mdqxfzhdDREoFG2RxeVl6W5aeMfxwmragMWzh+42T3nGjf1PijPme/
 NLxZTOAUAEsOcEK+Jq7sOEHNSfDyxMtTHWcuuxiLOptNLLTU3ZwcYmEEa
 kGaUCK1d+5fr+XcCh1Bvjyumy/23JLItZ3VFqqGCWRuCE+7G2HKMvYwPi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356358640"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="356358640"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:07:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="709143539"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="709143539"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:07:16 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 16/20] drm/i915/dp: Separate out function to get compressed
 bpp with joiner
Date: Thu, 10 Aug 2023 18:33:15 +0530
Message-Id: <20230810130319.3708392-17-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
References: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
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
Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 54 ++++++++++++++-----------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 67e8a9abe6ce..6901ab809587 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -740,6 +740,32 @@ u32 intel_dp_dsc_nearest_valid_bpp(struct drm_i915_private *i915, u32 bpp, u32 p
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
+		/* With bigjoiner multiple dsc engines are used in parallel so PPC is 2 */
+		int ppc = 2;
+		u32 max_bpp_bigjoiner =
+			i915->display.cdclk.max_cdclk_freq * ppc * bigjoiner_interface_bits /
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
@@ -748,7 +774,7 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
 					u32 pipe_bpp,
 					u32 timeslots)
 {
-	u32 bits_per_pixel, max_bpp_small_joiner_ram;
+	u32 bits_per_pixel, joiner_max_bpp;
 
 	/*
 	 * Available Link Bandwidth(Kbits/sec) = (NumberOfLanes)*
@@ -788,29 +814,9 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
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
-
-	if (bigjoiner) {
-		int bigjoiner_interface_bits = DISPLAY_VER(i915) >= 14 ? 36 : 24;
-		/* With bigjoiner multiple dsc engines are used in parallel so PPC is 2 */
-		int ppc = 2;
-		u32 max_bpp_bigjoiner =
-			i915->display.cdclk.max_cdclk_freq * ppc * bigjoiner_interface_bits /
-			intel_dp_mode_to_fec_clock(mode_clock);
-
-		bits_per_pixel = min(bits_per_pixel, max_bpp_bigjoiner);
-	}
+	joiner_max_bpp = get_max_compressed_bpp_with_joiner(i915, mode_clock,
+							    mode_hdisplay, bigjoiner);
+	bits_per_pixel = min(bits_per_pixel, joiner_max_bpp);
 
 	bits_per_pixel = intel_dp_dsc_nearest_valid_bpp(i915, bits_per_pixel, pipe_bpp);
 
-- 
2.40.1

