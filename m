Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C985E5F3641
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 21:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4F910E4B7;
	Mon,  3 Oct 2022 19:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5D010E4B6;
 Mon,  3 Oct 2022 19:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664825083; x=1696361083;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Or7ZX6z70KVcv7Yq2HAczp74W1Gi9S74jEoIPvGX6Ec=;
 b=NOqdABOgP/E8Q0hEtYPNjWs8V/t9saj/oRXP8+kt8XkPi0LpSJ6+rVNw
 XlCJVsr/ybl2sB8E7lXavllraI4Okz3pfgv2kAcart+UvxCXaLcD3hk7i
 iTfLHSp5EBYX27J1wU84dPLjV8EA3bYluOMWh5EiPsfO8hxV2N04Twnl4
 NK8tJklIpewHmdov/arSRiJpzzTrUfXJYdd5K8Qj1rlYzj9D8GvHTc3kY
 OkHB4Sbx71YI7zgmn6rMwU/AgbKy1imV7huE8KZluAeK1wI7t6Z9KhSur
 34D+sTO0BgILqhTzj54HPcetWzMSns8HuKui9VAhnTIUC2pHWu44DfDCN Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="304282101"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="304282101"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 12:24:25 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="625918218"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="625918218"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 12:24:25 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/pmu: Match frequencies reported by PMU and sysfs
Date: Mon,  3 Oct 2022 12:24:19 -0700
Message-Id: <20221003192419.3541088-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PMU and sysfs use different wakeref's to "interpret" zero freq. Sysfs uses
runtime PM wakeref (see intel_rps_read_punit_req and
intel_rps_read_actual_frequency). PMU uses the GT parked/unparked
wakeref. In general the GT wakeref is held for less time that the runtime
PM wakeref which causes PMU to report a lower average freq than the average
freq obtained from sampling sysfs.

To resolve this, use the same freq functions (and wakeref's) in PMU as
those used in sysfs.

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/7025
Reported-by: Ashwin Kumar Kulkarni <ashwin.kumar.kulkarni@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 958b37123bf1..eda03f264792 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -371,37 +371,16 @@ static void
 frequency_sample(struct intel_gt *gt, unsigned int period_ns)
 {
 	struct drm_i915_private *i915 = gt->i915;
-	struct intel_uncore *uncore = gt->uncore;
 	struct i915_pmu *pmu = &i915->pmu;
 	struct intel_rps *rps = &gt->rps;
 
 	if (!frequency_sampling_enabled(pmu))
 		return;
 
-	/* Report 0/0 (actual/requested) frequency while parked. */
-	if (!intel_gt_pm_get_if_awake(gt))
-		return;
-
 	if (pmu->enable & config_mask(I915_PMU_ACTUAL_FREQUENCY)) {
-		u32 val;
-
-		/*
-		 * We take a quick peek here without using forcewake
-		 * so that we don't perturb the system under observation
-		 * (forcewake => !rc6 => increased power use). We expect
-		 * that if the read fails because it is outside of the
-		 * mmio power well, then it will return 0 -- in which
-		 * case we assume the system is running at the intended
-		 * frequency. Fortunately, the read should rarely fail!
-		 */
-		val = intel_uncore_read_fw(uncore, GEN6_RPSTAT1);
-		if (val)
-			val = intel_rps_get_cagf(rps, val);
-		else
-			val = rps->cur_freq;
-
 		add_sample_mult(&pmu->sample[__I915_SAMPLE_FREQ_ACT],
-				intel_gpu_freq(rps, val), period_ns / 1000);
+				intel_rps_read_actual_frequency(rps),
+				period_ns / 1000);
 	}
 
 	if (pmu->enable & config_mask(I915_PMU_REQUESTED_FREQUENCY)) {
@@ -409,8 +388,6 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
 				intel_rps_get_requested_frequency(rps),
 				period_ns / 1000);
 	}
-
-	intel_gt_pm_put_async(gt);
 }
 
 static enum hrtimer_restart i915_sample(struct hrtimer *hrtimer)
-- 
2.34.1

