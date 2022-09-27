Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 381105EC178
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 13:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AF010E8E9;
	Tue, 27 Sep 2022 11:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C723210E8E1;
 Tue, 27 Sep 2022 11:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664278367; x=1695814367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KhkmDiWfeAc4yWtVd7eRTTQjR85vBbBV68QxhbsWF/8=;
 b=Mm8uK2yTCLaUDHfn31JM+CVLmUELRP4xHdqgcVegkcX0S9aCq1rrv7jF
 h0PFGG7t1RmF4eXL9Eycn7Lx3pkHm6jarNPEpPAHAyVaZyHoVsJPajzGr
 3Vr5PqiPhcyK0QMn2Pb1lINgFAJSz7AH6m1W357KLQFkDgzdanF42FOcm
 0CT1VwdcRFDAs5wCT4WM7iUIN0pgDitkrMFNRJCxjJpEB/ASUUP9y7yku
 e5ryc9nyYsfUwluWyY8LhHzEVnQALlY5a75g+pbThhwyzijfo044Gg2od
 yYB528RlJqSemdmMvAm0/HA/ZYPO9U0M3lc5lXoDClVRJRr/FMFHlAqRi g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="301269848"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="301269848"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 04:32:47 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="683955601"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="683955601"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 04:32:44 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/1] drm/i915: Use GEN12 RPSTAT register
Date: Tue, 27 Sep 2022 17:05:29 +0530
Message-Id: <20220927113529.3646989-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927113529.3646989-1-badal.nilawar@intel.com>
References: <20220927113529.3646989-1-badal.nilawar@intel.com>
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
Cc: andi.shyti@intel.com, donhiatt@gmail.com, tvrtko.ursulin@intel.com,
 anshuman.gupta@intel.com, dri-devel@lists.freedesktop.org,
 ashutosh.dixit@intel.com, jon.ewins@intel.com, vinay.belgaumkar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Don Hiatt <don.hiatt@intel.com>

On GEN12 and above use GEN12_RPSTAT register to get Current
Actual Graphics Frequency of GT

v2:
  - Fixed review comments(Ashutosh)
  - Added function intel_rps_read_rpstat_fw to read RPSTAT without
    forcewake, required especially for GEN6_RPSTAT1 (Ashutosh, Tvrtko)

Cc: Don Hiatt <donhiatt@gmail.com>
Cc: Andi Shyti <andi.shyti@intel.com>
Signed-off-by: Don Hiatt <don.hiatt@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  4 +++
 drivers/gpu/drm/i915/gt/intel_rps.c           | 32 +++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_rps.h           |  2 ++
 drivers/gpu/drm/i915/i915_pmu.c               |  3 +-
 5 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 10f680dbd7b6..b9b47052b26d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -380,7 +380,7 @@ void intel_gt_pm_frequency_dump(struct intel_gt *gt, struct drm_printer *p)
 		rpinclimit = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
 		rpdeclimit = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
 
-		rpstat = intel_uncore_read(uncore, GEN6_RPSTAT1);
+		rpstat = intel_rps_read_rpstat(rps);
 		rpcurupei = intel_uncore_read(uncore, GEN6_RP_CUR_UP_EI) & GEN6_CURICONT_MASK;
 		rpcurup = intel_uncore_read(uncore, GEN6_RP_CUR_UP) & GEN6_CURBSYTAVG_MASK;
 		rpprevup = intel_uncore_read(uncore, GEN6_RP_PREV_UP) & GEN6_CURBSYTAVG_MASK;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 7f79bbf97828..1f1e90acc1ab 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1519,6 +1519,10 @@
 #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
 #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
 
+#define GEN12_RPSTAT1				_MMIO(0x1381b4)
+#define   GEN12_CAGF_SHIFT			11
+#define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
+
 #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
 #define   GEN11_CSME				(31)
 #define   GEN11_GUNIT				(28)
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 17b40b625e31..5a15a630b1c6 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2068,12 +2068,40 @@ void intel_rps_sanitize(struct intel_rps *rps)
 		rps_disable_interrupts(rps);
 }
 
+u32 intel_rps_read_rpstat_fw(struct intel_rps *rps)
+{
+	struct drm_i915_private *i915 = rps_to_i915(rps);
+	i915_reg_t rpstat;
+
+	if (GRAPHICS_VER(i915) >= 12)
+		rpstat = GEN12_RPSTAT1;
+	else
+		rpstat = GEN6_RPSTAT1;
+
+	return intel_uncore_read_fw(rps_to_gt(rps)->uncore, rpstat);
+}
+
+u32 intel_rps_read_rpstat(struct intel_rps *rps)
+{
+	struct drm_i915_private *i915 = rps_to_i915(rps);
+	i915_reg_t rpstat;
+
+	if (GRAPHICS_VER(i915) >= 12)
+		rpstat = GEN12_RPSTAT1;
+	else
+		rpstat = GEN6_RPSTAT1;
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
+		cagf = (rpstat & GEN12_CAGF_MASK) >> GEN12_CAGF_SHIFT;
+	else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
 		cagf = (rpstat >> 8) & 0xff;
 	else if (GRAPHICS_VER(i915) >= 9)
 		cagf = (rpstat & GEN9_CAGF_MASK) >> GEN9_CAGF_SHIFT;
@@ -2099,7 +2127,7 @@ static u32 read_cagf(struct intel_rps *rps)
 		freq = vlv_punit_read(i915, PUNIT_REG_GPU_FREQ_STS);
 		vlv_punit_put(i915);
 	} else if (GRAPHICS_VER(i915) >= 6) {
-		freq = intel_uncore_read(uncore, GEN6_RPSTAT1);
+		freq = intel_rps_read_rpstat(rps);
 	} else {
 		freq = intel_uncore_read(uncore, MEMSTAT_ILK);
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
index 4509dfdc52e0..76c8404d8416 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps.h
@@ -47,6 +47,8 @@ u32 intel_rps_get_rp1_frequency(struct intel_rps *rps);
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

