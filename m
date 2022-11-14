Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EB4627DCA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 13:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B63410E0D6;
	Mon, 14 Nov 2022 12:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA33F10E095;
 Mon, 14 Nov 2022 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668429008; x=1699965008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aGxoinjSqn6ogHRFB3q8TdcdjJiUKFdqBHukfuTDo+s=;
 b=BJRpJgAScvpdjTtzMuik47x+eD4ObR+A8lKvieHs5M6iehD3syiDYPYf
 SCajDpSuFUiTA/JR9n4ThRPaZ66ZrXFZkDJX7m/9scECq2aB5xU4eQ2Md
 wN1KoZ2kCjQKdFiNsPDo76idahSjbb7PDa6yUCcMddqsi7orUn2Rurj/Q
 9DhY3J7tq9yhmapQp09w5rc1WptUgNSkanT1GPs25E3zQUNTCR73thtNm
 ZgImHmfMDHBfhKVxPY7RIs4l9c6driRpnHkCn8y/E4+sj7YQfABWccBpn
 6xJWTqUlhYRe6vcgpKm4h1iuE48bmlm1f9X56QmYSqt/28SVeqOe+nCGT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="311960567"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="311960567"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 04:30:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="727509045"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="727509045"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 04:30:05 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915: Use GEN12_RPSTAT register for GT freq
Date: Mon, 14 Nov 2022 18:03:45 +0530
Message-Id: <20221114123348.3474216-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114123348.3474216-1-badal.nilawar@intel.com>
References: <20221114123348.3474216-1-badal.nilawar@intel.com>
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
Cc: ashutosh.dixit@intel.com, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Don Hiatt <don.hiatt@intel.com>

On GEN12+ use GEN12_RPSTAT register to get actual resolved GT
freq. GEN12_RPSTAT does not require a forcewake and will return 0 freq if
GT is in RC6.

v2:
  - Fixed review comments(Ashutosh)
  - Added function intel_rps_read_rpstat_fw to read RPSTAT without
    forcewake, required especially for GEN6_RPSTAT1 (Ashutosh, Tvrtko)
v3:
  - Updated commit title and message for more clarity (Ashutosh)
  - Replaced intel_rps_read_rpstat with direct read to GEN12_RPSTAT1 in
    read_cagf (Ashutosh)
v4: Remove GEN12_CAGF_SHIFT and use REG_FIELD_GET (Rodrigo)

Cc: Don Hiatt <donhiatt@gmail.com>
Cc: Andi Shyti <andi.shyti@intel.com>
Signed-off-by: Don Hiatt <don.hiatt@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  1 +
 drivers/gpu/drm/i915/gt/intel_rps.c     | 32 +++++++++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_rps.h     |  2 ++
 drivers/gpu/drm/i915/i915_pmu.c         |  3 +--
 4 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 4041a385baa8..d24fd292af71 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1546,6 +1546,7 @@
 
 #define GEN12_RPSTAT1				_MMIO(0x1381b4)
 #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
+#define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
 
 #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
 #define   GEN11_CSME				(31)
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 8a505e10f4c0..9909d1f0db63 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2074,12 +2074,34 @@ void intel_rps_sanitize(struct intel_rps *rps)
 		rps_disable_interrupts(rps);
 }
 
+u32 intel_rps_read_rpstat_fw(struct intel_rps *rps)
+{
+	struct drm_i915_private *i915 = rps_to_i915(rps);
+	i915_reg_t rpstat;
+
+	rpstat = (GRAPHICS_VER(i915) >= 12) ? GEN12_RPSTAT1 : GEN6_RPSTAT1;
+
+	return intel_uncore_read_fw(rps_to_gt(rps)->uncore, rpstat);
+}
+
+u32 intel_rps_read_rpstat(struct intel_rps *rps)
+{
+	struct drm_i915_private *i915 = rps_to_i915(rps);
+	i915_reg_t rpstat;
+
+	rpstat = (GRAPHICS_VER(i915) >= 12) ? GEN12_RPSTAT1 : GEN6_RPSTAT1;
+
+	return intel_uncore_read(rps_to_gt(rps)->uncore, rpstat);
+}
+
 u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
 {
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 	u32 cagf;
 
-	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
+	if (GRAPHICS_VER(i915) >= 12)
+		cagf = REG_FIELD_GET(GEN12_CAGF_MASK, rpstat);
+	else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
 		cagf = REG_FIELD_GET(RPE_MASK, rpstat);
 	else if (GRAPHICS_VER(i915) >= 9)
 		cagf = REG_FIELD_GET(GEN9_CAGF_MASK, rpstat);
@@ -2099,7 +2121,9 @@ static u32 read_cagf(struct intel_rps *rps)
 	struct intel_uncore *uncore = rps_to_uncore(rps);
 	u32 freq;
 
-	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
+	if (GRAPHICS_VER(i915) >= 12) {
+		freq = intel_uncore_read(uncore, GEN12_RPSTAT1);
+	} else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
 		vlv_punit_get(i915);
 		freq = vlv_punit_read(i915, PUNIT_REG_GPU_FREQ_STS);
 		vlv_punit_put(i915);
@@ -2265,7 +2289,7 @@ static void rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
 	rpinclimit = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
 	rpdeclimit = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
 
-	rpstat = intel_uncore_read(uncore, GEN6_RPSTAT1);
+	rpstat = intel_rps_read_rpstat(rps);
 	rpcurupei = intel_uncore_read(uncore, GEN6_RP_CUR_UP_EI) & GEN6_CURICONT_MASK;
 	rpcurup = intel_uncore_read(uncore, GEN6_RP_CUR_UP) & GEN6_CURBSYTAVG_MASK;
 	rpprevup = intel_uncore_read(uncore, GEN6_RP_PREV_UP) & GEN6_CURBSYTAVG_MASK;
@@ -2400,7 +2424,7 @@ static void slpc_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
 	drm_printf(p, "PM MASK=0x%08x\n", pm_mask);
 	drm_printf(p, "pm_intrmsk_mbz: 0x%08x\n",
 		   rps->pm_intrmsk_mbz);
-	drm_printf(p, "RPSTAT1: 0x%08x\n", intel_uncore_read(uncore, GEN6_RPSTAT1));
+	drm_printf(p, "RPSTAT1: 0x%08x\n", intel_rps_read_rpstat(rps));
 	drm_printf(p, "RPNSWREQ: %dMHz\n", intel_rps_get_requested_frequency(rps));
 	drm_printf(p, "Lowest (RPN) frequency: %dMHz\n",
 		   intel_gpu_freq(rps, caps.min_freq));
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
index 110300dfd438..9e1cad9ba0e9 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps.h
@@ -48,6 +48,8 @@ u32 intel_rps_get_rp1_frequency(struct intel_rps *rps);
 u32 intel_rps_get_rpn_frequency(struct intel_rps *rps);
 u32 intel_rps_read_punit_req(struct intel_rps *rps);
 u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
+u32 intel_rps_read_rpstat(struct intel_rps *rps);
+u32 intel_rps_read_rpstat_fw(struct intel_rps *rps);
 void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *caps);
 void intel_rps_raise_unslice(struct intel_rps *rps);
 void intel_rps_lower_unslice(struct intel_rps *rps);
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 958b37123bf1..67140a87182f 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -371,7 +371,6 @@ static void
 frequency_sample(struct intel_gt *gt, unsigned int period_ns)
 {
 	struct drm_i915_private *i915 = gt->i915;
-	struct intel_uncore *uncore = gt->uncore;
 	struct i915_pmu *pmu = &i915->pmu;
 	struct intel_rps *rps = &gt->rps;
 
@@ -394,7 +393,7 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
 		 * case we assume the system is running at the intended
 		 * frequency. Fortunately, the read should rarely fail!
 		 */
-		val = intel_uncore_read_fw(uncore, GEN6_RPSTAT1);
+		val = intel_rps_read_rpstat_fw(rps);
 		if (val)
 			val = intel_rps_get_cagf(rps, val);
 		else
-- 
2.25.1

