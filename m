Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6787471003E
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 23:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808ED10E699;
	Wed, 24 May 2023 21:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEEB10E619;
 Wed, 24 May 2023 21:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684965395; x=1716501395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wq08tgAEt5cN82Szhoa/cg2K5vQa/EFjXnznBgmQeVs=;
 b=QhRcPOk+N2GGFYbHsOWCGFP3rbEtkryohC7E60BQOU6r9f+41MWkYRQm
 TmNNGa/tWMmojh+cimZ89a9HvVzP6ndNnMT7NZVDfZ29s2I/hwTit5VZM
 7ePKLHMw1ye5KKqPDPL/dpNwOdAaPXlrrqdDb1w8n0Qd0u0fbPBiCzxyB
 eQAq+r8Bf7M2rjYPTxnas7jMWcbk6Wl5abtZA6cQU1n9gXnrStZu89Ewl
 I6AovV48CpBGIweuUFwZTc/Qn80vl3f7sTcUTBQ2ZygEeMy2XB2IVkVdB
 wqNVfdDw+wxz//bX9JP3mABbDOaQYWmST0VBsT6rQxc2Hr1WOVrHYAss4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343165157"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="343165157"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 14:56:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="848929680"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="848929680"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 14:56:33 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/pmu: Make PMU sample array two-dimensional
Date: Wed, 24 May 2023 14:56:29 -0700
Message-Id: <20230524215629.97920-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230524215629.97920-1-ashutosh.dixit@intel.com>
References: <20230524215629.97920-1-ashutosh.dixit@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, andrzej.hajda@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional changes but we can remove some unsightly index computation
and read/write functions if we convert the PMU sample array from a
one-dimensional to a two-dimensional array.

v2: Retain read/store helpers (Tvrtko)

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 16 +++-------------
 drivers/gpu/drm/i915/i915_pmu.h |  2 +-
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 09313cf9316b4..f96fe92dca4e4 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -191,31 +191,21 @@ static inline s64 ktime_since_raw(const ktime_t kt)
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
 static u64 read_sample(struct i915_pmu *pmu, unsigned int gt_id, int sample)
 {
-	return pmu->sample[__sample_idx(pmu, gt_id, sample)].cur;
+	return pmu->sample[gt_id][sample].cur;
 }
 
 static void
 store_sample(struct i915_pmu *pmu, unsigned int gt_id, int sample, u64 val)
 {
-	pmu->sample[__sample_idx(pmu, gt_id, sample)].cur = val;
+	pmu->sample[gt_id][sample].cur = val;
 }
 
 static void
 add_sample_mult(struct i915_pmu *pmu, unsigned int gt_id, int sample, u32 val, u32 mul)
 {
-	pmu->sample[__sample_idx(pmu, gt_id, sample)].cur += mul_u32_u32(val, mul);
+	pmu->sample[gt_id][sample].cur += mul_u32_u32(val, mul);
 }
 
 static u64 get_rc6(struct intel_gt *gt)
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

