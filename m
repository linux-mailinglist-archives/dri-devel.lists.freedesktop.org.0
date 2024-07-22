Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7248393951F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 23:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E559C10E327;
	Mon, 22 Jul 2024 21:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnubm4qa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39B310E321;
 Mon, 22 Jul 2024 21:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721682423; x=1753218423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s/KEULd10DAnPOptOFmXVIG1knuSR32VEkwPLEise+Y=;
 b=mnubm4qaev7rrk5ZAEY2jufgxGeWEqpBtk5bOHr8DMua1VcJAmM4hEQu
 ZyujjVesA9dq0DN96BqHaLUBn98uX++x3+Is3v9AsrAj+ZceVaoNt/f9h
 yuNWv5lNxvxAESjLjFFrbHvbGSvPeB8H8IGhxKWtO0dK1O6PnljwImKGf
 2jzmGqgOMufAYON5t5wo5EUQhXZKuDODmLy6T/mUstEi+yeOqGLv9HHdE
 tuak7rG6rwMwdelAlv/RjgJr9Txe8+bPELSqPbjwtKyYnDGn2lMtx+Iwl
 Sk7YFcA1IcfspRwV4LA2GFluPjkztqCHbPVPpK3eD656K1S+Y8q+8+BV3 Q==;
X-CSE-ConnectionGUID: yFwvr8Z8QfSeBiOcTOUCFA==
X-CSE-MsgGUID: PRkanw/PTtuuEqmIBy6/rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30428316"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="30428316"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 14:07:02 -0700
X-CSE-ConnectionGUID: oco+0Mr7Qq21jwMdRCTvSg==
X-CSE-MsgGUID: YFa/qX3XQcKBR01IvlORGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="51653301"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 14:07:02 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	linux-perf-users@vger.kernel.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 5/7] drm/i915/pmu: Let resource survive unbind
Date: Mon, 22 Jul 2024 14:06:46 -0700
Message-ID: <20240722210648.80892-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722210648.80892-1-lucas.demarchi@intel.com>
References: <20240722210648.80892-1-lucas.demarchi@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no need to free the resources during unbind. Since perf events
may still access them due to open events, it's safer to free them when
dropping the last i915 reference.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index b5d14dd318e4..8708f905f4f4 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/pm_runtime.h>
+#include <drm/drm_managed.h>
 
 #include "gt/intel_engine.h"
 #include "gt/intel_engine_pm.h"
@@ -1152,6 +1153,17 @@ static void free_event_attributes(struct i915_pmu *pmu)
 	pmu->pmu_attr = NULL;
 }
 
+static void free_pmu(struct drm_device *dev, void *res)
+{
+	struct i915_pmu *pmu = res;
+	struct drm_i915_private *i915 = pmu_to_i915(pmu);
+
+	free_event_attributes(pmu);
+	kfree(pmu->base.attr_groups);
+	if (IS_DGFX(i915))
+		kfree(pmu->name);
+}
+
 static int i915_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
 {
 	struct i915_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
@@ -1302,6 +1314,9 @@ void i915_pmu_register(struct drm_i915_private *i915)
 	if (ret)
 		goto err_unreg;
 
+	if (drmm_add_action_or_reset(&i915->drm, free_pmu, pmu))
+		goto err_unreg;
+
 	return;
 
 err_unreg:
@@ -1336,11 +1351,7 @@ void i915_pmu_unregister(struct drm_i915_private *i915)
 	hrtimer_cancel(&pmu->timer);
 
 	i915_pmu_unregister_cpuhp_state(pmu);
-
 	perf_pmu_unregister(&pmu->base);
+
 	pmu->base.event_init = NULL;
-	kfree(pmu->base.attr_groups);
-	if (IS_DGFX(i915))
-		kfree(pmu->name);
-	free_event_attributes(pmu);
 }
-- 
2.43.0

