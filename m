Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB5A71003D
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 23:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D18110E622;
	Wed, 24 May 2023 21:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC00910E61C;
 Wed, 24 May 2023 21:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684965394; x=1716501394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=loDVDF1iuGWBfbaOW+7IiaOxFWHBhLzWQYXflLTz0zs=;
 b=VfJ6sSn6mZ8SyreCXuJpTDEN82MqkpK1z46HYqeaSzvS7Qla7CX8/dmW
 z35TIWzPvd37vb7O4bYCEZOyZxVkHVBCHrgnGk3T8awcmkYat1pp/L4Ns
 pd2kNenfm7tynA4jEcTKuFlaE4K/23S9ymjVVJRBZ3JGZDxawpDl8HPOD
 Vfq/FujJpbTrxke6gXkulktUJWQkRlROM3We8j5S4hiQLfijlFnUPgUdX
 0K+whRu6THZxKpZKXMZIn9eFZSL5LJc0IvXspsU/SjuP4pnJb9guQF27x
 MVHe44Wi4EHL8ufZwq5C4YydbKu7vpG7NDGka0t9FaYYuIfmVPu21/3yn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343165156"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="343165156"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 14:56:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="848929676"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="848929676"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 14:56:33 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/pmu: Turn off the timer to sample frequencies
 when GT is parked
Date: Wed, 24 May 2023 14:56:28 -0700
Message-Id: <20230524215629.97920-2-ashutosh.dixit@intel.com>
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

pmu_needs_timer() keeps the timer running even when GT is parked,
ostensibly to sample requested/actual frequencies. However
frequency_sample() has the following:

	/* Report 0/0 (actual/requested) frequency while parked. */
	if (!intel_gt_pm_get_if_awake(gt))
		return;

The above code prevents frequencies to be sampled while the GT is
parked. So we might as well turn off the sampling timer itself in this
case and save CPU cycles/power.

v2: Instead of turning freq bits off, return false, since no counters will
    run after this change when GT is parked (Tvrtko)
v3: Remove gpu_active argument of pmu_needs_timer (Andrzej)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index a814583e19fd7..09313cf9316b4 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -139,7 +139,7 @@ static u32 frequency_enabled_mask(void)
 	return mask;
 }
 
-static bool pmu_needs_timer(struct i915_pmu *pmu, bool gpu_active)
+static bool pmu_needs_timer(struct i915_pmu *pmu)
 {
 	struct drm_i915_private *i915 = container_of(pmu, typeof(*i915), pmu);
 	u32 enable;
@@ -157,17 +157,11 @@ static bool pmu_needs_timer(struct i915_pmu *pmu, bool gpu_active)
 	 */
 	enable &= frequency_enabled_mask() | ENGINE_SAMPLE_MASK;
 
-	/*
-	 * When the GPU is idle per-engine counters do not need to be
-	 * running so clear those bits out.
-	 */
-	if (!gpu_active)
-		enable &= ~ENGINE_SAMPLE_MASK;
 	/*
 	 * Also there is software busyness tracking available we do not
 	 * need the timer for I915_SAMPLE_BUSY counter.
 	 */
-	else if (i915->caps.scheduler & I915_SCHEDULER_CAP_ENGINE_BUSY_STATS)
+	if (i915->caps.scheduler & I915_SCHEDULER_CAP_ENGINE_BUSY_STATS)
 		enable &= ~BIT(I915_SAMPLE_BUSY);
 
 	/*
@@ -295,7 +289,7 @@ static void park_rc6(struct intel_gt *gt)
 
 static void __i915_pmu_maybe_start_timer(struct i915_pmu *pmu)
 {
-	if (!pmu->timer_enabled && pmu_needs_timer(pmu, true)) {
+	if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
 		pmu->timer_enabled = true;
 		pmu->timer_last = ktime_get();
 		hrtimer_start_range_ns(&pmu->timer,
@@ -321,7 +315,7 @@ void i915_pmu_gt_parked(struct intel_gt *gt)
 	 */
 	pmu->unparked &= ~BIT(gt->info.id);
 	if (pmu->unparked == 0)
-		pmu->timer_enabled = pmu_needs_timer(pmu, false);
+		pmu->timer_enabled = false;
 
 	spin_unlock_irq(&pmu->lock);
 }
@@ -827,7 +821,7 @@ static void i915_pmu_disable(struct perf_event *event)
 	 */
 	if (--pmu->enable_count[bit] == 0) {
 		pmu->enable &= ~BIT(bit);
-		pmu->timer_enabled &= pmu_needs_timer(pmu, true);
+		pmu->timer_enabled &= pmu_needs_timer(pmu);
 	}
 
 	spin_unlock_irqrestore(&pmu->lock, flags);
-- 
2.38.0

