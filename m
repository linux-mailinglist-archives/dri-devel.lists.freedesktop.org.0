Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE9870E059
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 17:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDD010E45A;
	Tue, 23 May 2023 15:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29E810E0D4;
 Tue, 23 May 2023 15:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684855389; x=1716391389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vR91haARPtHdrVKaUb5m9zVibPBQBlrfYUFAJruwJEY=;
 b=Kb11D2SPNlCIcHTMSwQ3Mu9etneT2KyxuaQDxE7ZzPOk7O028vPACM1M
 1Jgtedce3J/nIUwQNhI772h3mLxmaDyttVznCq1X7qRN1xpS/Nlsscaak
 t5eE2CqhKVR8QauNi9NdsdsMxV+3udy/Yqh3bsBEpc6LxpgKhSi1QKof7
 1oUCfbvIboeD3HEPEzUUIBsgM09ZI84/uag1Dnd35wLQ2kF9VNkbXFm7a
 MsgqYnGaqCgp8UXvQqqm0cCDj/X6k1oWD6V8XqGKvC4fhppwxqj5a6jS+
 dWxGJ37dock6KfY38EhQRC26WXmb0XYfutHNeWD7Kf/3rQNZrXwbdCGYf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="332888184"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="332888184"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 08:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="878259416"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="878259416"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 08:19:21 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/pmu: Turn off the timer to sample frequencies
 when GT is parked
Date: Tue, 23 May 2023 08:19:17 -0700
Message-Id: <20230523151918.4170499-2-ashutosh.dixit@intel.com>
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index a814583e19fd7..b47d890d4ada1 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -144,6 +144,10 @@ static bool pmu_needs_timer(struct i915_pmu *pmu, bool gpu_active)
 	struct drm_i915_private *i915 = container_of(pmu, typeof(*i915), pmu);
 	u32 enable;
 
+	/* When GPU is idle, at present no counters need to run */
+	if (!gpu_active)
+		return false;
+
 	/*
 	 * Only some counters need the sampling timer.
 	 *
@@ -157,17 +161,11 @@ static bool pmu_needs_timer(struct i915_pmu *pmu, bool gpu_active)
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
-- 
2.38.0

