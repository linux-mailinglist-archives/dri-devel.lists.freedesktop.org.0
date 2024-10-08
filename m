Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA059956B1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 20:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F2110E23C;
	Tue,  8 Oct 2024 18:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="joKeo7mX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DC510E232
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 18:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728412541; x=1759948541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/JJZCwajkVb0QLSNq1aYtA8Fx0IU33m7ID0rexUyFaY=;
 b=joKeo7mXVXJDqhOIHOFTsllLkQ762cVCNJxIpAKoTZuxiUunuKmcdD1g
 drnH24uNxX3s01niojed0jhNAuCZyKh821CV0w2ibGtxcY3KK4Aw0PNPN
 6ltHaIzxnXlRD9ow2tz19w6+bczgXTMTb03lWFW5242P59DzhOkIO1/iB
 pcymGoovdyuGl7iyA4ibCUJlh8DOwf+fukb0F5VdwQx23yR9Y+GBUqT7l
 SPWSQdIxLyHHXgsDEXHFj6Ix9n/WvezsJOJyTUAl7lv1s4j2zFhOT2PBx
 +nFe15UQi6trrinLaRefKUXFe+TR1Yv2k6dyrDKwhW+1Hbgikmie0Mz5Q g==;
X-CSE-ConnectionGUID: Myubki5mScSt3NICjYiYDw==
X-CSE-MsgGUID: RDKMwr1PQ+GJxT0Yk0QgYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38295357"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="38295357"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:35:40 -0700
X-CSE-ConnectionGUID: m3qTCs16TxumPMmgGt5IFQ==
X-CSE-MsgGUID: wQYexEUqQ5+vLU9t7EOaLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="80530917"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.125.110.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:35:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Ian Rogers <irogers@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/5] perf: Add pmu get/put
Date: Tue,  8 Oct 2024 13:34:59 -0500
Message-ID: <20241008183501.1354695-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241008183501.1354695-1-lucas.demarchi@intel.com>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
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
makes it difficult for drivers like i915 that can be unbound from the
HW.

	BUG: KASAN: use-after-free in exclusive_event_destroy+0xd8/0xf0
	Read of size 4 at addr ffff88816e2bb63c by task perf/7748

i915 tries to cope with it by installing a event->destroy, but that is
not sufficient: if pmu is released by the driver, it will still crash
since event->pmu is still used.

Moreover, even with that use-after-free fixed by adjusting the order in
_free_event() or delaying the free by the driver, kernel still oops when
closing the event fd related to a unregistered pmu: the percpu variables
allocated on perf_pmu_register() would already be released. One such
crash is:

	BUG: KASAN: user-memory-access in _raw_spin_lock_irqsave+0x88/0x100
	Write of size 4 at addr 00000000ffffffff by task perf/727

	CPU: 0 UID: 0 PID: 727 Comm: perf Not tainted 6.12.0-rc1-DEMARCHI-dxnf+ #9
	Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS unknown 2/2/2022
	Call Trace:
	 <TASK>
	 dump_stack_lvl+0x5f/0x90
	 print_report+0x4d3/0x50a
	 ? __pfx__raw_spin_lock_irqsave+0x10/0x10
	 ? kasan_addr_to_slab+0xd/0xb0
	 kasan_report+0xe2/0x170
	 ? _raw_spin_lock_irqsave+0x88/0x100
	 ? _raw_spin_lock_irqsave+0x88/0x100
	 kasan_check_range+0x125/0x230
	 __kasan_check_write+0x14/0x30
	 _raw_spin_lock_irqsave+0x88/0x100
	 ? __pfx__raw_spin_lock_irqsave+0x10/0x10
	 _atomic_dec_and_raw_lock_irqsave+0x89/0x110
	 ? __kasan_check_write+0x14/0x30
	 put_pmu_ctx+0x98/0x330

The fix here is to provide a set of get/put hooks that drivers can
implement to piggy back the perf's pmu lifecycle to the driver's
instance lifecycle.  With this, perf_pmu_unregister() can be called by
the driver, which is then responsible for freeing the resources.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/linux/perf_event.h | 12 ++++++++++++
 kernel/events/core.c       | 37 ++++++++++++++++++++++++++++++++-----
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index fb908843f209..d6983dbf5a45 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -561,6 +561,17 @@ struct pmu {
 	 * Check period value for PERF_EVENT_IOC_PERIOD ioctl.
 	 */
 	int (*check_period)		(struct perf_event *event, u64 value); /* optional */
+
+	/*
+	 * Optional: get a reference. Typically needed by PMUs that are bound to a device
+	 * that can be hotplugged, either physically or through sysfs' bind/unbind. When provided,
+	 * pmu::put() is mandatory and it's driver responsibility to call perf_pmu_free() when
+	 * resources can be released.
+	 */
+	struct pmu *(*get)		(struct pmu *pmu);
+
+	/* Optional: put a reference. See pmu::get() */
+	 void (*put)			(struct pmu *pmu);
 };
 
 enum perf_addr_filter_action_t {
@@ -1104,6 +1115,7 @@ extern void perf_event_itrace_started(struct perf_event *event);
 
 extern int perf_pmu_register(struct pmu *pmu, const char *name, int type);
 extern void perf_pmu_unregister(struct pmu *pmu);
+extern void perf_pmu_free(struct pmu *pmu);
 
 extern void __perf_event_task_sched_in(struct task_struct *prev,
 				       struct task_struct *task);
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 6395dbf67671..bf5b8fc8979e 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5319,8 +5319,24 @@ static void perf_pending_task_sync(struct perf_event *event)
 	rcuwait_wait_event(&event->pending_work_wait, !event->pending_work, TASK_UNINTERRUPTIBLE);
 }
 
+static void pmu_module_put(struct pmu **ppmu)
+{
+	struct pmu *pmu = *ppmu;
+	struct module *module = pmu->module;
+
+	if (pmu->put)
+		pmu->put(pmu);
+
+	module_put(module);
+
+	/* Can't touch pmu anymore/ */
+	*ppmu = NULL;
+}
+
 static void _free_event(struct perf_event *event)
 {
+	struct module *module;
+
 	irq_work_sync(&event->pending_irq);
 	irq_work_sync(&event->pending_disable_irq);
 	perf_pending_task_sync(event);
@@ -5374,7 +5390,8 @@ static void _free_event(struct perf_event *event)
 		put_ctx(event->ctx);
 
 	exclusive_event_destroy(event);
-	module_put(event->pmu->module);
+
+	pmu_module_put(&event->pmu);
 
 	call_rcu(&event->rcu_head, free_event_rcu);
 }
@@ -11512,10 +11529,12 @@ static int perf_event_idx_default(struct perf_event *event)
 	return 0;
 }
 
-static void free_pmu_context(struct pmu *pmu)
+void perf_pmu_free(struct pmu *pmu)
 {
 	free_percpu(pmu->cpu_pmu_context);
+	free_percpu(pmu->pmu_disable_count);
 }
+EXPORT_SYMBOL_GPL(perf_pmu_free);
 
 /*
  * Let userspace know that this PMU supports address range filtering:
@@ -11749,6 +11768,11 @@ int perf_pmu_register(struct pmu *pmu, const char *name, int type)
 		goto free_pdc;
 	}
 
+	if (WARN_ONCE((!!pmu->get) ^ (!!pmu->put), "Can not register a pmu with only get or put defined.\n")) {
+		ret = -EINVAL;
+		goto free_pdc;
+	}
+
 	pmu->name = name;
 
 	if (type >= 0)
@@ -11855,8 +11879,8 @@ void perf_pmu_unregister(struct pmu *pmu)
 
 	mutex_unlock(&pmus_lock);
 
-	free_percpu(pmu->pmu_disable_count);
-	free_pmu_context(pmu);
+	if (!pmu->put)
+		perf_pmu_free(pmu);
 }
 EXPORT_SYMBOL_GPL(perf_pmu_unregister);
 
@@ -11890,6 +11914,9 @@ static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
 		BUG_ON(!ctx);
 	}
 
+	if (pmu->get)
+		pmu->get(pmu);
+
 	event->pmu = pmu;
 	ret = pmu->event_init(event);
 
@@ -11926,7 +11953,7 @@ static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
 	}
 
 	if (ret)
-		module_put(pmu->module);
+		pmu_module_put(&pmu);
 
 	return ret;
 }
-- 
2.46.2

