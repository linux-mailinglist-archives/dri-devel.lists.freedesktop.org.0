Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 732E4751EF1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 12:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB13B10E69E;
	Thu, 13 Jul 2023 10:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C55E10E673;
 Thu, 13 Jul 2023 10:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689244663; x=1720780663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hHyRzVf8s0BAw3MEe4d3E+IpaKFQGvcOeDiaqthYbRk=;
 b=PraBaeA6G7ieTM7v9yYnM/R4YapDI7YgRsnl56IRyiNLbllOmpBzaz5S
 5tLCX7ecSSDkmXD5ZbM9sn1Qqh8Jtk//y51TEvdyHmydNuNanfUZtxI19
 /PtUDWkg61cAE+8OldbOJSWUrGKr5tFydDn+X6IVwNh+girRCkwBKHzu+
 MovyqqpUlJquyF61cPNXP5s1inYo7/MNjlBc0fxR9MxdMQwEI9D6phMVQ
 kyiYwS12oO2Qow/1t8t8MZt2ZD97P7Yt8GPfV+NuQ5Z+FxaruswB8lfN2
 dxOqiL8lD6BcTZp9BBsD9bEJHRKdnM3sJhu0EBr+7E11u3Uc50EQ+dCLt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="428897528"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="428897528"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 03:37:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895965310"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="895965310"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 03:37:38 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/19] drm/i915/dp: Move compressed bpp check with 420 format
 inside the helper
Date: Thu, 13 Jul 2023 16:03:29 +0530
Message-Id: <20230713103346.1163315-3-ankit.k.nautiyal@intel.com>
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

Move the check for limiting compressed bite_per_pixel for 420,422
formats in the helper to compute bits_per_pixel.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
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

