Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7235B7C89
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 23:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2281610E052;
	Tue, 13 Sep 2022 21:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E5A10E4BB;
 Tue, 13 Sep 2022 21:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663103425; x=1694639425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V5JySg4WAWwsX1d7PgQ2qLO49zwDB7nqWFztjdXhDEc=;
 b=ho899gZVvHoLmfekRuvzpdlUOfohpyUMcnmeXF3aDweqww4mXzZZQ6Qo
 jv1EHYC/nBANB/WOd+tPY7Fx+bz3UHeioTQgczbrg1IM12WJp0O6iaeOC
 MM63OMhfUsyxtBnSu40ieRY5saQduvCcEUD3BUcaVqU/rtdqIe8TRU0bN
 OQPNRuum22kSwXV5hW6Wp9rsqL/4Tqna2Bu+h0x/ozKSSWCwtjgMcRZVJ
 ZN6GvWtwob4D5sGsyXrYz6B9A6FdPREpceFQcO9PxTduNNuHDcaKXCL2q
 /8iIUzyosiXlWP4dMsrE/JLll90+SF1u8pSrxz++aA5967p4uNsT9XHCI g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="384556958"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="384556958"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 14:10:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="685023937"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 14:10:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v2 1/3] drm/i915: Invert if/else ladder for frequency read
Date: Tue, 13 Sep 2022 14:09:56 -0700
Message-Id: <20220908-if-ladder-v2-1-7a7b15545c93@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908-if-ladder-v2-0-7a7b15545c93@intel.com>
References: <20220908-if-ladder-v2-0-7a7b15545c93@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-bbe61
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Continue converting the driver to the convention of last version first,
extending it to the future platforms. Now, any GRAPHICS_VER >= 11 will
be handled by the first branch.

With the new ranges it's easier to see what platform a branch started to
be taken. Besides the >= 11 change, the branch taken for GRAPHICS_VER == 10
is also different, but currently there is no such platform in i915.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

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
b4 0.10.0-dev-bbe61
