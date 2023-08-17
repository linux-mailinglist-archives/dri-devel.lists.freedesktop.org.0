Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40B977F8FB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 16:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4D010E3BA;
	Thu, 17 Aug 2023 14:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DC210E3BA;
 Thu, 17 Aug 2023 14:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692282641; x=1723818641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/GqqNzzBwoni2CL3VSSmYbeD4xFYoLs2WyDv9pB7lpI=;
 b=e8LjsDNFNCFw8E3ENIWWunnb7cjltmePKgogIWaeyZHzY/3z3U3UzbC6
 MOjj1Y1jDb/2itSAsZ9yaGpkALImtaLi0qfIbu8ON5DNlMe7HTwRSnPTp
 z8MJeG+ISP7Z1GG+FnylLXD4OT5oBgwuJKsGR/Lm4qBR2Gc+4W6Q+rg0T
 DWzwk6ruur/2gEzle6y7kw7cXqA0gqyo8P0v86jv26qNUmfShpH3kz8tX
 yz1unGB3Yf39+ezOrl4rQG03V4mwpEa9TJ6mOmo0tEYqwr8vmfIf4FVkz
 6qbl1V4PVpEqRYhgk6FR8LAf3zDH3XAZCmH++lcU8HvmFSTwypMpQXwkc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="376581616"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="376581616"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 07:28:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="858244043"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="858244043"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 07:28:22 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/18] drm/i915/dp: Move compressed bpp check with 420 format
 inside the helper
Date: Thu, 17 Aug 2023 19:54:43 +0530
Message-Id: <20230817142459.89764-3-ankit.k.nautiyal@intel.com>
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

Move the check for limiting compressed bits_per_pixel for 420,422
formats in the helper to compute bits_per_pixel.

v2: Fix typo in commit message. (Ankit)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 29aab055ef11..ebf216596fdd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -773,6 +773,15 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
 	if (output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
 		bits_per_pixel *= 2;
 
+	/*
+	 * According to DSC 1.2a Section 4.1.1 Table 4.1 the maximum
+	 * supported PPS value can be 63.9375 and with the further
+	 * mention that for 420, 422 formats, bpp should be programmed double
+	 * the target bpp restricting our target bpp to be 31.9375 at max.
+	 */
+	if (output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
+		bits_per_pixel = min_t(u32, bits_per_pixel, 31);
+
 	drm_dbg_kms(&i915->drm, "Max link bpp is %u for %u timeslots "
 				"total bw %u pixel clock %u\n",
 				bits_per_pixel, timeslots,
@@ -1738,15 +1747,6 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 							    pipe_config->output_format,
 							    pipe_bpp,
 							    timeslots);
-			/*
-			 * According to DSC 1.2a Section 4.1.1 Table 4.1 the maximum
-			 * supported PPS value can be 63.9375 and with the further
-			 * mention that bpp should be programmed double the target bpp
-			 * restricting our target bpp to be 31.9375 at max
-			 */
-			if (pipe_config->output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
-				dsc_max_output_bpp = min_t(u16, dsc_max_output_bpp, 31 << 4);
-
 			if (!dsc_max_output_bpp) {
 				drm_dbg_kms(&dev_priv->drm,
 					    "Compressed BPP not supported\n");
-- 
2.40.1

