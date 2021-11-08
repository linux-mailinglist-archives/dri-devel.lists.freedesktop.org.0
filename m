Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE04449DB6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 22:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9015E6E442;
	Mon,  8 Nov 2021 21:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6046E303;
 Mon,  8 Nov 2021 21:11:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="255999727"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="255999727"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 13:11:02 -0800
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="451627240"
Received: from orsosgc001.jf.intel.com ([10.165.21.154])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 13:11:02 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/pmu: Fix synchronization of PMU callback with reset
Date: Mon,  8 Nov 2021 13:10:57 -0800
Message-Id: <20211108211057.68783-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the PMU callback runs in irq context, it synchronizes with gt
reset using the reset count. We could run into a case where the PMU
callback could read the reset count before it is updated. This has a
potential of corrupting the busyness stats.

In addition to the reset count, check if the reset bit is set before
capturing busyness.

In addition save the previous stats only if you intend to update them.

v2:
- The 2 reset counts captured in the PMU callback can end up being the
  same if they were captured right after the count is incremented in the
  reset flow. This can lead to a bad busyness state. Ensure that reset
  is not in progress when the initial reset count is captured.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 5cc49c0b3889..0dfc6032cd6b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1183,15 +1183,20 @@ static ktime_t guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
 	u64 total, gt_stamp_saved;
 	unsigned long flags;
 	u32 reset_count;
+	bool in_reset;
 
 	spin_lock_irqsave(&guc->timestamp.lock, flags);
 
 	/*
-	 * If a reset happened, we risk reading partially updated
-	 * engine busyness from GuC, so we just use the driver stored
-	 * copy of busyness. Synchronize with gt reset using reset_count.
+	 * If a reset happened, we risk reading partially updated engine
+	 * busyness from GuC, so we just use the driver stored copy of busyness.
+	 * Synchronize with gt reset using reset_count and the
+	 * I915_RESET_BACKOFF flag. Note that reset flow updates the reset_count
+	 * after I915_RESET_BACKOFF flag, so ensure that the reset_count is
+	 * usable by checking the flag afterwards.
 	 */
 	reset_count = i915_reset_count(gpu_error);
+	in_reset = test_bit(I915_RESET_BACKOFF, &gt->reset.flags);
 
 	*now = ktime_get();
 
@@ -1201,9 +1206,9 @@ static ktime_t guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
 	 * start_gt_clk is derived from GuC state. To get a consistent
 	 * view of activity, we query the GuC state only if gt is awake.
 	 */
-	stats_saved = *stats;
-	gt_stamp_saved = guc->timestamp.gt_stamp;
-	if (intel_gt_pm_get_if_awake(gt)) {
+	if (intel_gt_pm_get_if_awake(gt) && !in_reset) {
+		stats_saved = *stats;
+		gt_stamp_saved = guc->timestamp.gt_stamp;
 		guc_update_engine_gt_clks(engine);
 		guc_update_pm_timestamp(guc, engine, now);
 		intel_gt_pm_put_async(gt);
-- 
2.20.1

