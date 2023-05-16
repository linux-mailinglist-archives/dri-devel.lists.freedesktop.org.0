Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2576570491B
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 11:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF9310E32C;
	Tue, 16 May 2023 09:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4218510E244;
 Tue, 16 May 2023 09:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684229098; x=1715765098;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LyjoW1ovuHt7n8HvV1MDVJHeDhZp4458W4MzW4ViPYI=;
 b=n72PXsb16Q6jsX4g96bBtIT40kwVVP2WkVOElz1FTEe1GtoZGhp0MSO7
 PlnJniRmuw1m0rWo6/PLVEvNarQz0p+nBMd6Wky8dZtcU5weWRcJ1mdex
 +3dRH0D6c32FdK9m2ZmgFekzqWye/x/9Zv4OkiEqWAJ+U3KPGgoB6qZnW
 t/KCEVgGiY6y0PwwN+x5RtriJSKkQCw1SMQw+qMqzw+n+IyFiwSRYvtRY
 BZz+kwIi7VrdWdwZnrrR/sM1PpabpDGhjkIgSyH/QKrk6QUuFjEMOJ48g
 DHd28RCwMAI9FTuHHaZ+Gq+4ScGZDJ2LwJYx+WLCrVCbo+JT9F4bJAG0v w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="348929598"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="348929598"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 02:24:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="947774377"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="947774377"
Received: from sdrogers-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.200.127])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 02:24:55 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/pmu: Change bitmask of enabled events to u32
Date: Tue, 16 May 2023 10:24:45 +0100
Message-Id: <20230516092445.184823-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Having it as u64 was a confusing (but harmless) mistake.

Also add some asserts to make sure the internal field does not overflow
in the future.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
I am not entirely sure the __builtin_constant_p->BUILD_BUG_ON branch will
work with all compilers. Lets see...

Compile tested only.
---
 drivers/gpu/drm/i915/i915_pmu.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 7ece883a7d95..8736b3418f88 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -50,7 +50,7 @@ static u8 engine_event_instance(struct perf_event *event)
 	return (event->attr.config >> I915_PMU_SAMPLE_BITS) & 0xff;
 }
 
-static bool is_engine_config(u64 config)
+static bool is_engine_config(const u64 config)
 {
 	return config < __I915_PMU_OTHER(0);
 }
@@ -82,15 +82,28 @@ static unsigned int other_bit(const u64 config)
 
 static unsigned int config_bit(const u64 config)
 {
+	unsigned int bit;
+
 	if (is_engine_config(config))
-		return engine_config_sample(config);
+		bit = engine_config_sample(config);
 	else
-		return other_bit(config);
+		bit = other_bit(config);
+
+	if (__builtin_constant_p(config))
+		BUILD_BUG_ON(bit >
+			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
+							 enable)) - 1);
+	else
+		WARN_ON_ONCE(bit >
+			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
+							 enable)) - 1);
+
+	return bit;
 }
 
-static u64 config_mask(u64 config)
+static u32 config_mask(const u64 config)
 {
-	return BIT_ULL(config_bit(config));
+	return BIT(config_bit(config));
 }
 
 static bool is_engine_event(struct perf_event *event)
@@ -633,11 +646,10 @@ static void i915_pmu_enable(struct perf_event *event)
 {
 	struct drm_i915_private *i915 =
 		container_of(event->pmu, typeof(*i915), pmu.base);
+	const unsigned int bit = event_bit(event);
 	struct i915_pmu *pmu = &i915->pmu;
 	unsigned long flags;
-	unsigned int bit;
 
-	bit = event_bit(event);
 	if (bit == -1)
 		goto update;
 
@@ -651,7 +663,7 @@ static void i915_pmu_enable(struct perf_event *event)
 	GEM_BUG_ON(bit >= ARRAY_SIZE(pmu->enable_count));
 	GEM_BUG_ON(pmu->enable_count[bit] == ~0);
 
-	pmu->enable |= BIT_ULL(bit);
+	pmu->enable |= BIT(bit);
 	pmu->enable_count[bit]++;
 
 	/*
@@ -698,7 +710,7 @@ static void i915_pmu_disable(struct perf_event *event)
 {
 	struct drm_i915_private *i915 =
 		container_of(event->pmu, typeof(*i915), pmu.base);
-	unsigned int bit = event_bit(event);
+	const unsigned int bit = event_bit(event);
 	struct i915_pmu *pmu = &i915->pmu;
 	unsigned long flags;
 
@@ -734,7 +746,7 @@ static void i915_pmu_disable(struct perf_event *event)
 	 * bitmask when the last listener on an event goes away.
 	 */
 	if (--pmu->enable_count[bit] == 0) {
-		pmu->enable &= ~BIT_ULL(bit);
+		pmu->enable &= ~BIT(bit);
 		pmu->timer_enabled &= pmu_needs_timer(pmu, true);
 	}
 
-- 
2.39.2

