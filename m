Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A868B743C24
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 14:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C1210E17D;
	Fri, 30 Jun 2023 12:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690CE10E17C;
 Fri, 30 Jun 2023 12:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688129452; x=1719665452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sOdjvJrb/RpJbDC60vXx9AusJeLQM4mzwS1LZBlrjCc=;
 b=RLkvnc6VlEjJTYm0ZATru0o2U6xIUWBbvid2aXimIPZSwM6RydNOZ09/
 8AATUFs5JEaXE4adpJ9gACxnXFZaPwEEVgwxo+YYVBY4pfRc829chmc8u
 np+kEi8OvEXanG37omlu5+oUmxl8mNL9VYSpdLrEAnbnwyE19vmeimGn0
 zyF8HZ185TrM77x00+zNfLZ1j9eeJrv+rIMKeaga25EU7lqCkqf/EcnQC
 LL5GXg24MPUKJqYCYfhVZBGp1BaDs5RxUldwnZe2BTzWxd1DQ5UcDzDwO
 ruj8Ac3FWM9gj2h+G7tQTyVLNTm1jOXxNstpZM2Z2GX/Bx7ZjMg/wmSBG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="361232129"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="361232129"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:50:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="1048219014"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="1048219014"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:50:47 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/19] drm/i915/dp: Move compressed bpp check with 420 format
 inside the helper
Date: Fri, 30 Jun 2023 18:16:34 +0530
Message-Id: <20230630124652.4140932-3-ankit.k.nautiyal@intel.com>
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

Move the check for limiting compressed bite_per_pixel for 420,422
formats in the helper to compute bits_per_pixel.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f6061aa1cd42..e67071a6b5a2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -764,6 +764,15 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
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
@@ -1729,15 +1738,6 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
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

