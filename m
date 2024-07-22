Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA3993952A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 23:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91ECF10E340;
	Mon, 22 Jul 2024 21:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UaR8S93Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9113110E31A;
 Mon, 22 Jul 2024 21:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721682423; x=1753218423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vh8XVtwwL74Cr5WG/3P9Ea2rW9L1UOvjDhRm/Vay+hg=;
 b=UaR8S93YSChAbUwLncz/pC/c346r+2SRP5UXe6krtIpfjhYmoTD4cXzN
 pMSu/nPupzTU62wvSC5zyhOsJ7pruDUssxvkSIHZUd+iUrjrA8PST4mE6
 hKjhYOc08QPsvTWnqG1efkPjzNk1RYdny2PQ4GDzwXzMaC5e2KxoQvMmm
 E3ytN1Mio6OUeXRgFnCaS/QQvH/dltaWxiwlmO/8QL7M29B9mN/LcSUBA
 L+Qp4b7sX/2xIX+AlW03YVR5jFpcR2mKFevRkifiKlr4Ye742opWyuccJ
 aBu4Q7wsiSR0wLpz80XvRgaXhvkNf0VnLZG9QiSdf9MJSoCtY3XqBs4iI Q==;
X-CSE-ConnectionGUID: QuOq4rzzRD2kgRjWeHBaSw==
X-CSE-MsgGUID: +EJGCpilRR+WUrhi2r58qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30428321"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="30428321"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 14:07:03 -0700
X-CSE-ConnectionGUID: /I89/5+VSpmbbL3HpvLYMQ==
X-CSE-MsgGUID: CZmWqJlhTa+pzStj3jB2Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="51653307"
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
Subject: [PATCH 6/7] drm/i915/pmu: Lazy unregister
Date: Mon, 22 Jul 2024 14:06:47 -0700
Message-ID: <20240722210648.80892-7-lucas.demarchi@intel.com>
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

Instead of calling perf_pmu_unregister() when unbinding, defer that to
the destruction of i915 object. Since perf itself holds a reference in
the event, this only happens when all events are gone, which guarantees
i915 is not unregistering the pmu with live events.

Previously, running the following sequence would crash the system after
~2 tries:

	1) bind device to i915
	2) wait events to show up on sysfs
	3) start perf  stat -I 1000 -e i915/rcs0-busy/
	4) unbind driver
	5) kill perf

Most of the time this crashes in perf_pmu_disable() while accessing the
percpu pmu_disable_count. This happens because perf_pmu_unregister()
destroys it with free_percpu(pmu->pmu_disable_count).

With a lazy unbind, the pmu is only unregistered after (5) as opposed to
after (4). The downside is that if a new bind operation is attempted for
the same device/driver without killing the perf process, i915 will fail
to register the pmu (but still load successfully). This seems better
than completely crashing the system.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 8708f905f4f4..df53a8fe53ec 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -1158,18 +1158,21 @@ static void free_pmu(struct drm_device *dev, void *res)
 	struct i915_pmu *pmu = res;
 	struct drm_i915_private *i915 = pmu_to_i915(pmu);
 
+	perf_pmu_unregister(&pmu->base);
 	free_event_attributes(pmu);
 	kfree(pmu->base.attr_groups);
 	if (IS_DGFX(i915))
 		kfree(pmu->name);
+
+	/*
+	 * Make sure all currently running (but shortcut on pmu->closed) are
+	 * gone before proceeding with free'ing the pmu object embedded in i915.
+	 */
+	synchronize_rcu();
 }
 
 static int i915_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
 {
-	struct i915_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
-
-	GEM_BUG_ON(!pmu->base.event_init);
-
 	/* Select the first online CPU as a designated reader. */
 	if (cpumask_empty(&i915_pmu_cpumask))
 		cpumask_set_cpu(cpu, &i915_pmu_cpumask);
@@ -1182,8 +1185,6 @@ static int i915_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
 	struct i915_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
 	unsigned int target = i915_pmu_target_cpu;
 
-	GEM_BUG_ON(!pmu->base.event_init);
-
 	/*
 	 * Unregistering an instance generates a CPU offline event which we must
 	 * ignore to avoid incorrectly modifying the shared i915_pmu_cpumask.
@@ -1337,21 +1338,14 @@ void i915_pmu_unregister(struct drm_i915_private *i915)
 {
 	struct i915_pmu *pmu = &i915->pmu;
 
-	if (!pmu->base.event_init)
-		return;
-
 	/*
-	 * "Disconnect" the PMU callbacks - since all are atomic synchronize_rcu
-	 * ensures all currently executing ones will have exited before we
-	 * proceed with unregistration.
+	 * "Disconnect" the PMU callbacks - unregistering the pmu will be done
+	 * later when all currently open events are gone
 	 */
 	pmu->closed = true;
-	synchronize_rcu();
 
 	hrtimer_cancel(&pmu->timer);
-
 	i915_pmu_unregister_cpuhp_state(pmu);
-	perf_pmu_unregister(&pmu->base);
 
 	pmu->base.event_init = NULL;
 }
-- 
2.43.0

