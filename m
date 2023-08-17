Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED4277F905
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 16:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB7B10E4C6;
	Thu, 17 Aug 2023 14:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8C210E4B5;
 Thu, 17 Aug 2023 14:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692282648; x=1723818648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xwug3uJXHwNA10/dji6yCKfPKjCcDr3UpRj/8Y2cdyQ=;
 b=hlM8swXZcO4Z6uwhey8uHDoh28v45A0DgtId+8MOUWT2Ns/E0Aq+l45r
 sX0E840MZs3nLZW3LuHY7CoWBdqS0kEUxT554nD0Vc04La440ivDQboNW
 gaA8xH9iKs8K6cdyFpboPr9WX9bAATAobgD03cJznkYVYHqMrhkb+rBsj
 CIbtsKWC7DD1xIPzyDRD0vwc8mna+y/yq3M1iS7D+LNfkf1Ma/gSChXB6
 ZJTC5XXJfleRZpy+j1TnWEepnq+57k3qYHdRCz3xqUiJAH54b6/RSvTZt
 yyHbjx24m3vW+dupJ/WgtWnrA1rJhHIrqLIwlqWRr4Fl4Ao1x8Wq/UUnR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="376581756"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="376581756"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 07:28:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="858244138"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="858244138"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 07:28:53 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 15/18] drm/i915/dp: Separate out function to get compressed
 bpp with joiner
Date: Thu, 17 Aug 2023 19:54:56 +0530
Message-Id: <20230817142459.89764-16-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230817142459.89764-1-ankit.k.nautiyal@intel.com>
References: <20230817142459.89764-1-ankit.k.nautiyal@intel.com>
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
index 109d7756ede4..3ccdf765c1f0 100644
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

