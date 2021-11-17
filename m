Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D604550C4
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 23:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC196E3C6;
	Wed, 17 Nov 2021 22:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFA46E32A;
 Wed, 17 Nov 2021 22:50:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="221285265"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="221285265"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 14:50:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="536467640"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga001.jf.intel.com with ESMTP; 17 Nov 2021 14:50:25 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/gt: Compare average group occupancy for RPS
 evaluation
Date: Wed, 17 Nov 2021 14:49:54 -0800
Message-Id: <20211117224955.28999-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211117224955.28999-1-vinay.belgaumkar@intel.com>
References: <20211117224955.28999-1-vinay.belgaumkar@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Currently, we inspect each engine individually and measure the occupancy
of that engine over the last evaluation interval. If that exceeds our
busyness thresholds, we decide to increase the GPU frequency. However,
under a load balancer, we should consider the occupancy of entire engine
groups, as work may be spread out across the group. In doing so, we
prefer wide over fast, power consumption is approximately proportional to
the square of the frequency. However, since the load balancer is greedy,
the first idle engine gets all the work, and preferrentially reuses the
last active engine, under light loads all work is assigned to one
engine, and so that engine appears very busy. But if the work happened
to overlap slightly, the workload would spread across multiple engines,
reducing each individual engine's runtime, and so reducing the rps
contribution, keeping the frequency low. Instead, when considering the
contribution, consider the contribution over the entire engine group
(capacity).

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 48 ++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 07ff7ba7b2b7..3675ac93ded0 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -7,6 +7,7 @@
 
 #include "i915_drv.h"
 #include "intel_breadcrumbs.h"
+#include "intel_engine_pm.h"
 #include "intel_gt.h"
 #include "intel_gt_clock_utils.h"
 #include "intel_gt_irq.h"
@@ -65,26 +66,45 @@ static void set(struct intel_uncore *uncore, i915_reg_t reg, u32 val)
 static void rps_timer(struct timer_list *t)
 {
 	struct intel_rps *rps = from_timer(rps, t, timer);
-	struct intel_engine_cs *engine;
-	ktime_t dt, last, timestamp;
-	enum intel_engine_id id;
+	struct intel_gt *gt = rps_to_gt(rps);
+	ktime_t dt, last, timestamp = 0;
 	s64 max_busy[3] = {};
+	int i, j;
 
-	timestamp = 0;
-	for_each_engine(engine, rps_to_gt(rps), id) {
-		s64 busy;
-		int i;
+	/* Compare average occupancy over each engine group */
+	for (i = 0; i < ARRAY_SIZE(gt->engine_class); i++) {
+		s64 busy = 0;
+		int count = 0;
+
+		for (j = 0; j < ARRAY_SIZE(gt->engine_class[i]); j++) {
+			struct intel_engine_cs *engine;
 
-		dt = intel_engine_get_busy_time(engine, &timestamp);
-		last = engine->stats.rps;
-		engine->stats.rps = dt;
+			engine = gt->engine_class[i][j];
+			if (!engine)
+				continue;
 
-		busy = ktime_to_ns(ktime_sub(dt, last));
-		for (i = 0; i < ARRAY_SIZE(max_busy); i++) {
-			if (busy > max_busy[i])
-				swap(busy, max_busy[i]);
+			dt = intel_engine_get_busy_time(engine, &timestamp);
+			last = engine->stats.rps;
+			engine->stats.rps = dt;
+
+			if (!intel_engine_pm_is_awake(engine))
+				continue;
+
+			busy += ktime_to_ns(ktime_sub(dt, last));
+			count++;
+		}
+
+		if (count > 1)
+			busy = div_u64(busy, count);
+		if (busy <= max_busy[ARRAY_SIZE(max_busy) - 1])
+			continue;
+
+		for (j = 0; j < ARRAY_SIZE(max_busy); j++) {
+			if (busy > max_busy[j])
+				swap(busy, max_busy[j]);
 		}
 	}
+
 	last = rps->pm_timestamp;
 	rps->pm_timestamp = timestamp;
 
-- 
2.34.0

