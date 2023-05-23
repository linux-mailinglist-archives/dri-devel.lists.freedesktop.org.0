Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4864270E058
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 17:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A1A10E455;
	Tue, 23 May 2023 15:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D92010E453;
 Tue, 23 May 2023 15:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684855390; x=1716391390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HmodVAAgrQtbykEXLUbHpJhcUQViqaWmC1/TjHIr2Rk=;
 b=igBRVTkzAOpXJbq8bXfqMLJk/5sjCWX3xndGwRh6AJVUnDQmtNEQHhp1
 mMhZDZa+w0HDk7N03dAUeE7AHikavvRJIcv9JI0Q90LfBWR1CodYXVLt5
 4Zr1HwBsqdfvd+l0rIGIsjedEs0aJOlsxgF/roRYZk6EzLeYEz0R+PJKj
 H7VwGrjGrxDlgr5ipPBS+nmwCwXwYz5MA0vQ4Lwfi8CSAJXa/AVr+zcIC
 KhLX1uWiN4uemAeSlXv2NSdaRHoHEF6gjiQjWjOxX+nvRGaQjHqrdT1Td
 mcqLlfwTCT9BlkApWTQyUygqvCh6E9mv9a9/qn9UgKnNYs1dTgF1pka4h w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="332888186"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="332888186"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 08:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="878259419"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="878259419"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 08:19:21 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/pmu: Make PMU sample array two-dimensional
Date: Tue, 23 May 2023 08:19:18 -0700
Message-Id: <20230523151918.4170499-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230523151918.4170499-1-ashutosh.dixit@intel.com>
References: <20230523151918.4170499-1-ashutosh.dixit@intel.com>
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
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional changes but we can remove some unsightly index computation
and read/write functions if we convert the PMU sample array from a
one-dimensional to a two-dimensional array.

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 60 ++++++++++-----------------------
 drivers/gpu/drm/i915/i915_pmu.h |  2 +-
 2 files changed, 19 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index b47d890d4ada1..137e0df9573ee 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -195,33 +195,6 @@ static inline s64 ktime_since_raw(const ktime_t kt)
 	return ktime_to_ns(ktime_sub(ktime_get_raw(), kt));
 }
 
-static unsigned int
-__sample_idx(struct i915_pmu *pmu, unsigned int gt_id, int sample)
-{
-	unsigned int idx = gt_id * __I915_NUM_PMU_SAMPLERS + sample;
-
-	GEM_BUG_ON(idx >= ARRAY_SIZE(pmu->sample));
-
-	return idx;
-}
-
-static u64 read_sample(struct i915_pmu *pmu, unsigned int gt_id, int sample)
-{
-	return pmu->sample[__sample_idx(pmu, gt_id, sample)].cur;
-}
-
-static void
-store_sample(struct i915_pmu *pmu, unsigned int gt_id, int sample, u64 val)
-{
-	pmu->sample[__sample_idx(pmu, gt_id, sample)].cur = val;
-}
-
-static void
-add_sample_mult(struct i915_pmu *pmu, unsigned int gt_id, int sample, u32 val, u32 mul)
-{
-	pmu->sample[__sample_idx(pmu, gt_id, sample)].cur += mul_u32_u32(val, mul);
-}
-
 static u64 get_rc6(struct intel_gt *gt)
 {
 	struct drm_i915_private *i915 = gt->i915;
@@ -240,7 +213,7 @@ static u64 get_rc6(struct intel_gt *gt)
 	spin_lock_irqsave(&pmu->lock, flags);
 
 	if (awake) {
-		store_sample(pmu, gt_id, __I915_SAMPLE_RC6, val);
+		pmu->sample[gt_id][__I915_SAMPLE_RC6].cur = val;
 	} else {
 		/*
 		 * We think we are runtime suspended.
@@ -250,13 +223,13 @@ static u64 get_rc6(struct intel_gt *gt)
 		 * counter value.
 		 */
 		val = ktime_since_raw(pmu->sleep_last[gt_id]);
-		val += read_sample(pmu, gt_id, __I915_SAMPLE_RC6);
+		val += pmu->sample[gt_id][__I915_SAMPLE_RC6].cur;
 	}
 
-	if (val < read_sample(pmu, gt_id, __I915_SAMPLE_RC6_LAST_REPORTED))
-		val = read_sample(pmu, gt_id, __I915_SAMPLE_RC6_LAST_REPORTED);
+	if (val < pmu->sample[gt_id][__I915_SAMPLE_RC6_LAST_REPORTED].cur)
+		val = pmu->sample[gt_id][__I915_SAMPLE_RC6_LAST_REPORTED].cur;
 	else
-		store_sample(pmu, gt_id, __I915_SAMPLE_RC6_LAST_REPORTED, val);
+		pmu->sample[gt_id][__I915_SAMPLE_RC6_LAST_REPORTED].cur = val;
 
 	spin_unlock_irqrestore(&pmu->lock, flags);
 
@@ -275,9 +248,8 @@ static void init_rc6(struct i915_pmu *pmu)
 		with_intel_runtime_pm(gt->uncore->rpm, wakeref) {
 			u64 val = __get_rc6(gt);
 
-			store_sample(pmu, i, __I915_SAMPLE_RC6, val);
-			store_sample(pmu, i, __I915_SAMPLE_RC6_LAST_REPORTED,
-				     val);
+			pmu->sample[i][__I915_SAMPLE_RC6].cur = val;
+			pmu->sample[i][__I915_SAMPLE_RC6_LAST_REPORTED].cur = val;
 			pmu->sleep_last[i] = ktime_get_raw();
 		}
 	}
@@ -287,7 +259,7 @@ static void park_rc6(struct intel_gt *gt)
 {
 	struct i915_pmu *pmu = &gt->i915->pmu;
 
-	store_sample(pmu, gt->info.id, __I915_SAMPLE_RC6, __get_rc6(gt));
+	pmu->sample[gt->info.id][__I915_SAMPLE_RC6].cur = __get_rc6(gt);
 	pmu->sleep_last[gt->info.id] = ktime_get_raw();
 }
 
@@ -428,6 +400,12 @@ engines_sample(struct intel_gt *gt, unsigned int period_ns)
 	}
 }
 
+static void
+add_sample_mult(struct i915_pmu_sample *sample, u32 val, u32 mul)
+{
+	sample->cur += mul_u32_u32(val, mul);
+}
+
 static bool
 frequency_sampling_enabled(struct i915_pmu *pmu, unsigned int gt)
 {
@@ -467,12 +445,12 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
 		if (!val)
 			val = intel_gpu_freq(rps, rps->cur_freq);
 
-		add_sample_mult(pmu, gt_id, __I915_SAMPLE_FREQ_ACT,
+		add_sample_mult(&pmu->sample[gt_id][__I915_SAMPLE_FREQ_ACT],
 				val, period_ns / 1000);
 	}
 
 	if (pmu->enable & config_mask(__I915_PMU_REQUESTED_FREQUENCY(gt_id))) {
-		add_sample_mult(pmu, gt_id, __I915_SAMPLE_FREQ_REQ,
+		add_sample_mult(&pmu->sample[gt_id][__I915_SAMPLE_FREQ_REQ],
 				intel_rps_get_requested_frequency(rps),
 				period_ns / 1000);
 	}
@@ -673,14 +651,12 @@ static u64 __i915_pmu_event_read(struct perf_event *event)
 		switch (config) {
 		case I915_PMU_ACTUAL_FREQUENCY:
 			val =
-			   div_u64(read_sample(pmu, gt_id,
-					       __I915_SAMPLE_FREQ_ACT),
+			   div_u64(pmu->sample[gt_id][__I915_SAMPLE_FREQ_ACT].cur,
 				   USEC_PER_SEC /* to MHz */);
 			break;
 		case I915_PMU_REQUESTED_FREQUENCY:
 			val =
-			   div_u64(read_sample(pmu, gt_id,
-					       __I915_SAMPLE_FREQ_REQ),
+			   div_u64(pmu->sample[gt_id][__I915_SAMPLE_FREQ_REQ].cur,
 				   USEC_PER_SEC /* to MHz */);
 			break;
 		case I915_PMU_INTERRUPTS:
diff --git a/drivers/gpu/drm/i915/i915_pmu.h b/drivers/gpu/drm/i915/i915_pmu.h
index 33d80fbaab8bc..d20592e7db999 100644
--- a/drivers/gpu/drm/i915/i915_pmu.h
+++ b/drivers/gpu/drm/i915/i915_pmu.h
@@ -127,7 +127,7 @@ struct i915_pmu {
 	 * Only global counters are held here, while the per-engine ones are in
 	 * struct intel_engine_cs.
 	 */
-	struct i915_pmu_sample sample[I915_PMU_MAX_GTS * __I915_NUM_PMU_SAMPLERS];
+	struct i915_pmu_sample sample[I915_PMU_MAX_GTS][__I915_NUM_PMU_SAMPLERS];
 	/**
 	 * @sleep_last: Last time GT parked for RC6 estimation.
 	 */
-- 
2.38.0

