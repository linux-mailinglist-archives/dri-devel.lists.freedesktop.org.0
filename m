Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D067A7662D6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 06:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117D610E63E;
	Fri, 28 Jul 2023 04:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C49B10E634;
 Fri, 28 Jul 2023 04:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690517726; x=1722053726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QRbXmXodZNazygaY7EVvIGg1tj+oPj22zMovQLwtQvs=;
 b=UIJRElE1nNlGSslsRAZ+lmf4fCGC9zegJcCcV0ghQgZccspY1awdeulK
 em77qAGB3dbYFqe5CjLRWnQWG2PzDtwajS5tR8PQhP8Da/ZSL1G7LtRNw
 Sefd0JNWH2LCytXxbLnqEs+XwaZOa3nL1CFgjv7TnR6kBAenFNikXezD/
 peauyRSDKMTm3RK7TVna4hUIeDkj+NZ/Z/Fu/j+a6gN3kCLawHsM6u7dl
 2C9lJdOJuKk7s1i53d7FON2tu6uhxUfucK9hwqSolV+wGufFsw9GIiA/V
 6Nl7RNM3fwGdcBLd3Z1ZyfhoaoXo05qVRgtSpjVULkamImHz4EIei60Lj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348104149"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="348104149"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797276275"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="797276275"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:15:24 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/20] drm/i915/dp: Move compressed bpp check with 420 format
 inside the helper
Date: Fri, 28 Jul 2023 09:41:32 +0530
Message-Id: <20230728041150.2524032-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
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

Move the check for limiting compressed bite_per_pixel for 420,422
formats in the helper to compute bits_per_pixel.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e0d9618fccab..d1db457fb17c 100644
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

