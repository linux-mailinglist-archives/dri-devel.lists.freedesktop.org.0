Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DBE939527
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 23:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF4810E336;
	Mon, 22 Jul 2024 21:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLjjtSt6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CAF10E310;
 Mon, 22 Jul 2024 21:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721682421; x=1753218421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jzjRmAv0FQC+DoGcPDLeFGLEdXtORRGXZvIMK7w3hGY=;
 b=iLjjtSt6gdW4pvvvqV9LwxRlrJu8GgdaZgP8d9j1DVY2PtKmDWtzzeco
 7eKUE9Nd6Oh+26VNxLhqqqRrgWA1hdm+as9x/qIi/Mpuyp5PfDv0g0WMo
 KJ6phPLtjg6ZetqJWmiBjawZkRr1ePMEGv34A3W5wC0xhFHiDt/sR1BYc
 MPfRUP+xQQ5Hshmp7GHMc820bvsJL3Pg/zaCrbaX/lJihaoaA4kFlRXBK
 nHsQMR6PBtXbhqaQ5mu79nlyxrLROGNqVjFu1uTje52hOLQqCg8+eJJ8E
 78GgDX6BvmiAmL2xzBF0oG9qW74/b3yTPC8FPcadbgMt1yxoEq3GA6SnH w==;
X-CSE-ConnectionGUID: HvyoQgELQSORbAtTGNFhcw==
X-CSE-MsgGUID: mnazB1eKS+OxFNWpojThdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30428291"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="30428291"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 14:07:00 -0700
X-CSE-ConnectionGUID: +sqI0r3xT7aWlDU75JtWiQ==
X-CSE-MsgGUID: 3F7AwXZ2T6eMmuT0vcHHCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="51653273"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 14:07:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	linux-perf-users@vger.kernel.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/7] perf/core: Add pmu get/put
Date: Mon, 22 Jul 2024 14:06:42 -0700
Message-ID: <20240722210648.80892-2-lucas.demarchi@intel.com>
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

If a pmu is unregistered while there's an active event, perf will still
access the pmu via event->pmu, even after the event is destroyed. This
makes it difficult for drivers like i915 that take a reference on the
device when the event is created and put it when it's destroyed.
Currently the following use-after-free happens just after destroying the
event:

	BUG: KASAN: use-after-free in exclusive_event_destroy+0xd8/0xf0
	Read of size 4 at addr ffff88816e2bb63c by task perf/7748

Whenever and event is created, get a pmu reference to use in event->pmu
and just before calling module_put(), drop the reference..

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/linux/perf_event.h |  3 +++
 kernel/events/core.c       | 32 ++++++++++++++++++++++++++++----
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index a5304ae8c654..7048a505e93c 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -540,6 +540,9 @@ struct pmu {
 	 * Check period value for PERF_EVENT_IOC_PERIOD ioctl.
 	 */
 	int (*check_period)		(struct perf_event *event, u64 value); /* optional */
+
+	struct pmu *(*get)		(struct pmu *pmu); /* optional: get a reference */
+	void (*put)			(struct pmu *pmu); /* optional: put a reference */
 };
 
 enum perf_addr_filter_action_t {
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 1b6f5dc7ed32..cc7541b644b0 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5208,6 +5208,8 @@ static void perf_addr_filters_splice(struct perf_event *event,
 
 static void _free_event(struct perf_event *event)
 {
+	struct module *module;
+
 	irq_work_sync(&event->pending_irq);
 
 	unaccount_event(event);
@@ -5259,7 +5261,13 @@ static void _free_event(struct perf_event *event)
 		put_ctx(event->ctx);
 
 	exclusive_event_destroy(event);
-	module_put(event->pmu->module);
+
+	module = event->pmu->module;
+	event->pmu->put(event->pmu);
+	/* can't touch pmu anymore */
+	event->pmu = NULL;
+
+	module_put(module);
 
 	call_rcu(&event->rcu_head, free_event_rcu);
 }
@@ -11331,6 +11339,11 @@ static int perf_pmu_nop_int(struct pmu *pmu)
 	return 0;
 }
 
+static struct pmu *perf_pmu_nop_pmu(struct pmu *pmu)
+{
+	return pmu;
+}
+
 static int perf_event_nop_int(struct perf_event *event, u64 value)
 {
 	return 0;
@@ -11617,6 +11630,12 @@ int perf_pmu_register(struct pmu *pmu, const char *name, int type)
 	if (!pmu->event_idx)
 		pmu->event_idx = perf_event_idx_default;
 
+	if (!pmu->get)
+		pmu->get = perf_pmu_nop_pmu;
+
+	if (!pmu->put)
+		pmu->put = perf_pmu_nop_void;
+
 	list_add_rcu(&pmu->entry, &pmus);
 	atomic_set(&pmu->exclusive_cnt, 0);
 	ret = 0;
@@ -11695,7 +11714,8 @@ static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
 		BUG_ON(!ctx);
 	}
 
-	event->pmu = pmu;
+	event->pmu = pmu->get(pmu);
+
 	ret = pmu->event_init(event);
 
 	if (ctx)
@@ -11714,8 +11734,12 @@ static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
 			event->destroy(event);
 	}
 
-	if (ret)
-		module_put(pmu->module);
+	if (ret) {
+		struct module *module = pmu->module;
+
+		pmu->put(pmu);
+		module_put(module);
+	}
 
 	return ret;
 }
-- 
2.43.0

