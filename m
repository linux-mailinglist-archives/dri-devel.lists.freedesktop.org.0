Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB7C743C3E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 14:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AD310E47B;
	Fri, 30 Jun 2023 12:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DBE10E46F;
 Fri, 30 Jun 2023 12:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688129483; x=1719665483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kqvpa54qZ06434/0kBMPSDcVLalMJzQZEmIXD1ve7po=;
 b=PIkvWD/dn91Ux10tDcX7S//a9Equ0n3YlnjZ3W76Fml3o7BbO0sQnlvd
 jOuOg6szAI5W2YbycmDeBB7uCoqOni8x7hWaSxViAs1cF3Q5iCNKyRfF4
 XqVpxr0at7oX5x6IlqV8+21mVVe5fglkvEX0zpGmXqh/EIDJHVakWm2IZ
 x4XPRoyNFa0jF2ghDTM590YqU+n97jhEIZ4JYe8HEqeKFKPX2wYncIFmB
 NQbCnv8FDe5gwpk8F/1QW9ty8V3NN1AtW+NP+aoKaIMkkU4SMujbVXQa9
 qmPrWkiMndKFn8UhEZwt7zmZPpLqyaW6+FKz11W8jn1c9xRMhUyyL/ezG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="361232249"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="361232249"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="1048219132"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="1048219132"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:51:21 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 17/19] drm/i915/dp: Separate out function to get compressed
 bpp with joiner
Date: Fri, 30 Jun 2023 18:16:49 +0530
Message-Id: <20230630124652.4140932-18-ankit.k.nautiyal@intel.com>
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

Pull the code to get joiner constraints on maximum compressed bpp into
separate function.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 49 ++++++++++++++-----------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f6f9b061fc0b..01fdab148d74 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -731,6 +731,30 @@ u32 intel_dp_dsc_nearest_valid_bpp(struct drm_i915_private *i915, u32 bpp, u32 p
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
@@ -739,7 +763,7 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
 					u32 pipe_bpp,
 					u32 timeslots)
 {
-	u32 bits_per_pixel, max_bpp_small_joiner_ram;
+	u32 bits_per_pixel, joiner_max_bpp;
 
 	/*
 	 * Available Link Bandwidth(Kbits/sec) = (NumberOfLanes)*
@@ -779,27 +803,10 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
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

