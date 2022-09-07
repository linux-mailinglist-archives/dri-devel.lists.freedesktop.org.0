Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3185B0E2F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 22:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4618F10E880;
	Wed,  7 Sep 2022 20:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F4E10E880;
 Wed,  7 Sep 2022 20:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662582698; x=1694118698;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Uo0JAEmRHJCQJl6TvmtGXqo5IaXJsdZU/qaBnonXjeQ=;
 b=B0PoPWKVdwFvFHhqztpdp5hp0nZgkc0c4Q2VO/+qWBdG0BpLbvW4NFQX
 Y+/YInOKRU0Tho1oSWP01azOYT8UZDKZCLzorBUk2OPAOEmWYwqV7oNRD
 om60SXlTZu3S67XyG4SnbY3suSgqpLVKrb7GW5OYmbipBJsLvf2W2CXSX
 Gq2MAmJs1scYdjDiEbNyPLvV8clC5p8TQrMR5uzZ8NcqnulBBzJalxHXM
 lBo2evgn0Bt7sGAY0rxFJVugbi+V6Su8/xhts3QOPdmV81BqShlxviS4b
 9AzC+WXif7ceh1AupDtOiauYmPnO6+CfH742DhKLtvlX+EznwtKLpAv91 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="277380178"
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; d="scan'208";a="277380178"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 13:31:37 -0700
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; d="scan'208";a="565666814"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 13:31:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Invert if/else ladder for frequency read
Date: Wed,  7 Sep 2022 13:30:41 -0700
Message-Id: <20220907203041.1651514-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Continue converting the driver to the convention of last version first,
extending it to the future platforms. Now, any GRAPHICS_VER >= 11 will
be handled by the first branch.

With the new ranges it's easier to see what platform a branch started to
be taken. Besides the >= 11 change, the branch taken for GRAPHICS_VER == 10
is also different, but currently there is no such platform in i915.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 .../gpu/drm/i915/gt/intel_gt_clock_utils.c    | 77 +++++++++----------
 1 file changed, 37 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c b/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
index d5d1b04dbcad..93608c9349fd 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
@@ -78,77 +78,74 @@ static u32 read_clock_frequency(struct intel_uncore *uncore)
 	u32 f19_2_mhz = 19200000;
 	u32 f24_mhz = 24000000;
 
-	if (GRAPHICS_VER(uncore->i915) <= 4) {
-		/*
-		 * PRMs say:
-		 *
-		 *     "The value in this register increments once every 16
-		 *      hclks." (through the “Clocking Configuration”
-		 *      (“CLKCFG”) MCHBAR register)
-		 */
-		return RUNTIME_INFO(uncore->i915)->rawclk_freq * 1000 / 16;
-	} else if (GRAPHICS_VER(uncore->i915) <= 8) {
-		/*
-		 * PRMs say:
-		 *
-		 *     "The PCU TSC counts 10ns increments; this timestamp
-		 *      reflects bits 38:3 of the TSC (i.e. 80ns granularity,
-		 *      rolling over every 1.5 hours).
-		 */
-		return f12_5_mhz;
-	} else if (GRAPHICS_VER(uncore->i915) <= 9) {
+	if (GRAPHICS_VER(uncore->i915) >= 11) {
 		u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
 		u32 freq = 0;
 
+		/*
+		 * First figure out the reference frequency. There are 2 ways
+		 * we can compute the frequency, either through the
+		 * TIMESTAMP_OVERRIDE register or through RPM_CONFIG. CTC_MODE
+		 * tells us which one we should use.
+		 */
 		if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
 			freq = read_reference_ts_freq(uncore);
 		} else {
-			freq = IS_GEN9_LP(uncore->i915) ? f19_2_mhz : f24_mhz;
+			u32 c0 = intel_uncore_read(uncore, RPM_CONFIG0);
+
+			if (GRAPHICS_VER(uncore->i915) >= 11)
+				freq = gen11_get_crystal_clock_freq(uncore, c0);
+			else
+				freq = gen9_get_crystal_clock_freq(uncore, c0);
 
 			/*
 			 * Now figure out how the command stream's timestamp
 			 * register increments from this frequency (it might
 			 * increment only every few clock cycle).
 			 */
-			freq >>= 3 - ((ctc_reg & CTC_SHIFT_PARAMETER_MASK) >>
-				      CTC_SHIFT_PARAMETER_SHIFT);
+			freq >>= 3 - ((c0 & GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
+				      GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
 		}
 
 		return freq;
-	} else if (GRAPHICS_VER(uncore->i915) <= 12) {
+	} else if (GRAPHICS_VER(uncore->i915) >= 9) {
 		u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
 		u32 freq = 0;
 
-		/*
-		 * First figure out the reference frequency. There are 2 ways
-		 * we can compute the frequency, either through the
-		 * TIMESTAMP_OVERRIDE register or through RPM_CONFIG. CTC_MODE
-		 * tells us which one we should use.
-		 */
 		if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
 			freq = read_reference_ts_freq(uncore);
 		} else {
-			u32 c0 = intel_uncore_read(uncore, RPM_CONFIG0);
-
-			if (GRAPHICS_VER(uncore->i915) >= 11)
-				freq = gen11_get_crystal_clock_freq(uncore, c0);
-			else
-				freq = gen9_get_crystal_clock_freq(uncore, c0);
+			freq = IS_GEN9_LP(uncore->i915) ? f19_2_mhz : f24_mhz;
 
 			/*
 			 * Now figure out how the command stream's timestamp
 			 * register increments from this frequency (it might
 			 * increment only every few clock cycle).
 			 */
-			freq >>= 3 - ((c0 & GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
-				      GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
+			freq >>= 3 - ((ctc_reg & CTC_SHIFT_PARAMETER_MASK) >>
+				      CTC_SHIFT_PARAMETER_SHIFT);
 		}
 
 		return freq;
+	} else if (GRAPHICS_VER(uncore->i915) >= 5) {
+		/*
+		 * PRMs say:
+		 *
+		 *     "The PCU TSC counts 10ns increments; this timestamp
+		 *      reflects bits 38:3 of the TSC (i.e. 80ns granularity,
+		 *      rolling over every 1.5 hours).
+		 */
+		return f12_5_mhz;
+	} else {
+		/*
+		 * PRMs say:
+		 *
+		 *     "The value in this register increments once every 16
+		 *      hclks." (through the “Clocking Configuration”
+		 *      (“CLKCFG”) MCHBAR register)
+		 */
+		return RUNTIME_INFO(uncore->i915)->rawclk_freq * 1000 / 16;
 	}
-
-	MISSING_CASE("Unknown gen, unable to read command streamer timestamp frequency\n");
-	return 0;
 }
 
 void intel_gt_init_clock_frequency(struct intel_gt *gt)
-- 
2.37.2

