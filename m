Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA7B95BD42
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 19:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA8C10EB9B;
	Thu, 22 Aug 2024 17:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMpzOLgT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF9010EB99;
 Thu, 22 Aug 2024 17:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724347789; x=1755883789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R+6ZlsH+1XWqkejIIzB9mWSBuTWypOFHaaSBbN0dS/g=;
 b=MMpzOLgTGPMsUsBmj/7TSmZ8hjASqLzB+KhrM4e/CVucmLGzh1D064a/
 0jEEapufq3liSNEIao/cd4bJih/q/gGK1wMhGg+Fn8wDybT1hSXLGx8JH
 NYOXcIhEjrbcWyE/aLnigIGVAM4lgcMtADaEHIGpbVOK38T5w7j5UkeLk
 hZ3tUNFLQTuQcHBtnDaWnMwWrs3QCk88YXptriwteJ7QOxB+wSKHbNucg
 oN7tFiOft/eVaKPhqU+fFeSMnVj2d9trnJlfOenIuGTZ+Woiv7gjDOIrS
 y18/y2lk1W+7UfCzNXlMYjvF/koTn/QH4dRVt0cuyAmGDIOf8MepXFNHg g==;
X-CSE-ConnectionGUID: sh7K98lzQjODKLJIOzo/xw==
X-CSE-MsgGUID: jReg11D1TdqgSyMLZY7syQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22935404"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22935404"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:29:48 -0700
X-CSE-ConnectionGUID: k+kJu7VhSg+fjwIpUAUP3w==
X-CSE-MsgGUID: wnAjjQm1RIOTScRRt3FYNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="84706486"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.104])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:29:46 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v2 12/15] drm/i915: Protect access to the UABI engines list
 with a mutex
Date: Thu, 22 Aug 2024 19:28:29 +0200
Message-ID: <20240822172832.494994-13-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822172832.494994-1-andi.shyti@linux.intel.com>
References: <20240822172832.494994-1-andi.shyti@linux.intel.com>
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

Until now, the UABI engines list has been accessed in read-only
mode, as it was created once during boot and destroyed upon
module unload.

In upcoming commits, we will be modifying this list by changing
the CCS mode, allowing compute engines to be dynamically added
and removed at runtime based on user whims.

To ensure thread safety and prevent race conditions, we need to
protect the engine list with a mutex, thereby serializing access
to it.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 3 +++
 drivers/gpu/drm/i915/gt/intel_engine_user.c | 7 +++++++
 drivers/gpu/drm/i915/gt/sysfs_engines.c     | 5 +++++
 drivers/gpu/drm/i915/i915_cmd_parser.c      | 2 ++
 drivers/gpu/drm/i915/i915_debugfs.c         | 4 ++++
 drivers/gpu/drm/i915/i915_drv.h             | 4 ++++
 drivers/gpu/drm/i915/i915_gem.c             | 4 ++++
 drivers/gpu/drm/i915/i915_perf.c            | 2 ++
 drivers/gpu/drm/i915/i915_pmu.c             | 4 ++++
 drivers/gpu/drm/i915/i915_query.c           | 2 ++
 10 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index c0543c35cd6a..0ccbe447f51d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1124,6 +1124,7 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
 	if (!e)
 		return ERR_PTR(-ENOMEM);
 
+	mutex_lock(&ctx->i915->uabi_engines_mutex);
 	for_each_uabi_engine(engine, ctx->i915) {
 		struct intel_context *ce;
 		struct intel_sseu sseu = {};
@@ -1155,9 +1156,11 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
 
 	}
 
+	mutex_unlock(&ctx->i915->uabi_engines_mutex);
 	return e;
 
 free_engines:
+	mutex_unlock(&ctx->i915->uabi_engines_mutex);
 	free_engines(e);
 	return err;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 8e5284af8335..209d5badbd3d 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -210,6 +210,13 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 	LIST_HEAD(engines);
 
 	sort_engines(i915, &engines);
+	mutex_init(&i915->uabi_engines_mutex);
+
+	/*
+	 * We are still booting i915 and we are sure we are running
+	 * single-threaded. We don't need at this point to protect the
+	 * uabi_engines access list with the mutex.
+	 */
 
 	prev = NULL;
 	p = &i915->uabi_engines.rb_node;
diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
index f67f76df1cfe..c1cc0981c8fb 100644
--- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
+++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
@@ -508,6 +508,11 @@ void intel_engines_add_sysfs(struct drm_i915_private *i915)
 
 	i915->sysfs_engine = dir;
 
+	/*
+	 * We are still booting i915 and we are sure we are running
+	 * single-threaded. We don't need at this point to protect the
+	 * uabi_engines access list with the mutex.
+	 */
 	for_each_uabi_engine(engine, i915) {
 		struct kobject *kobj;
 
diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
index 2905df83e180..12987ece6f8e 100644
--- a/drivers/gpu/drm/i915/i915_cmd_parser.c
+++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
@@ -1592,12 +1592,14 @@ int i915_cmd_parser_get_version(struct drm_i915_private *dev_priv)
 	bool active = false;
 
 	/* If the command parser is not enabled, report 0 - unsupported */
+	mutex_lock(&dev_priv->uabi_engines_mutex);
 	for_each_uabi_engine(engine, dev_priv) {
 		if (intel_engine_using_cmd_parser(engine)) {
 			active = true;
 			break;
 		}
 	}
+	mutex_unlock(&dev_priv->uabi_engines_mutex);
 	if (!active)
 		return 0;
 
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index bc717cf544e4..8b5e365eb6bd 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -459,8 +459,10 @@ static int i915_engine_info(struct seq_file *m, void *unused)
 		   to_gt(i915)->clock_period_ns);
 
 	p = drm_seq_file_printer(m);
+	mutex_lock(&i915->uabi_engines_mutex);
 	for_each_uabi_engine(engine, i915)
 		intel_engine_dump(engine, &p, "%s\n", engine->name);
+	mutex_unlock(&i915->uabi_engines_mutex);
 
 	intel_gt_show_timelines(to_gt(i915), &p, i915_request_show_with_schedule);
 
@@ -474,6 +476,7 @@ static int i915_wa_registers(struct seq_file *m, void *unused)
 	struct drm_i915_private *i915 = node_to_i915(m->private);
 	struct intel_engine_cs *engine;
 
+	mutex_lock(&i915->uabi_engines_mutex);
 	for_each_uabi_engine(engine, i915) {
 		const struct i915_wa_list *wal = &engine->ctx_wa_list;
 		const struct i915_wa *wa;
@@ -493,6 +496,7 @@ static int i915_wa_registers(struct seq_file *m, void *unused)
 
 		seq_printf(m, "\n");
 	}
+	mutex_unlock(&i915->uabi_engines_mutex);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 3a8a757f5bd5..5210e130ca0c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -231,6 +231,10 @@ struct drm_i915_private {
 		struct rb_root uabi_engines;
 	};
 	unsigned int engine_uabi_class_count[I915_LAST_UABI_ENGINE_CLASS + 1];
+	/*
+	 * Protect access to the uabi_engines list.
+	 */
+	struct mutex uabi_engines_mutex;
 
 	/* protects the irq masks */
 	spinlock_t irq_lock;
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 1391c01d7663..36eab0d31756 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1263,7 +1263,11 @@ void i915_gem_driver_remove(struct drm_i915_private *dev_priv)
 	i915_gem_suspend_late(dev_priv);
 	for_each_gt(gt, dev_priv, i)
 		intel_gt_driver_remove(gt);
+
+	/* Let's make sure no one is using the uabi_engines list */
+	mutex_lock(&gt->i915->uabi_engines_mutex);
 	dev_priv->uabi_engines = RB_ROOT;
+	mutex_unlock(&gt->i915->uabi_engines_mutex);
 
 	/* Flush any outstanding unpin_work. */
 	i915_gem_drain_workqueue(dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 025a79fe5920..40850a4e8f2e 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -2732,6 +2732,7 @@ oa_configure_all_contexts(struct i915_perf_stream *stream,
 	 * If we don't modify the kernel_context, we do not get events while
 	 * idle.
 	 */
+	mutex_lock(&i915->uabi_engines_mutex);
 	for_each_uabi_engine(engine, i915) {
 		struct intel_context *ce = engine->kernel_context;
 
@@ -2744,6 +2745,7 @@ oa_configure_all_contexts(struct i915_perf_stream *stream,
 		if (err)
 			return err;
 	}
+	mutex_unlock(&i915->uabi_engines_mutex);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 21eb0c5b320d..bcef2d460680 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -1022,6 +1022,7 @@ create_event_attributes(struct i915_pmu *pmu)
 		}
 	}
 
+	mutex_lock(&i915->uabi_engines_mutex);
 	for_each_uabi_engine(engine, i915) {
 		for (i = 0; i < ARRAY_SIZE(engine_events); i++) {
 			if (!engine_event_status(engine,
@@ -1029,6 +1030,7 @@ create_event_attributes(struct i915_pmu *pmu)
 				count++;
 		}
 	}
+	mutex_unlock(&i915->uabi_engines_mutex);
 
 	/* Allocate attribute objects and table. */
 	i915_attr = kcalloc(count, sizeof(*i915_attr), GFP_KERNEL);
@@ -1086,6 +1088,7 @@ create_event_attributes(struct i915_pmu *pmu)
 	}
 
 	/* Initialize supported engine counters. */
+	mutex_lock(&i915->uabi_engines_mutex);
 	for_each_uabi_engine(engine, i915) {
 		for (i = 0; i < ARRAY_SIZE(engine_events); i++) {
 			char *str;
@@ -1115,6 +1118,7 @@ create_event_attributes(struct i915_pmu *pmu)
 			pmu_iter = add_pmu_attr(pmu_iter, str, "ns");
 		}
 	}
+	mutex_unlock(&i915->uabi_engines_mutex);
 
 	pmu->i915_attr = i915_attr;
 	pmu->pmu_attr = pmu_attr;
diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 14d9ec0ed777..730df29b4728 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -140,6 +140,7 @@ query_engine_info(struct drm_i915_private *i915,
 	if (query_item->flags)
 		return -EINVAL;
 
+	mutex_lock(&i915->uabi_engines_mutex);
 	for_each_uabi_engine(engine, i915)
 		num_uabi_engines++;
 
@@ -168,6 +169,7 @@ query_engine_info(struct drm_i915_private *i915,
 		query.num_engines++;
 		info_ptr++;
 	}
+	mutex_unlock(&i915->uabi_engines_mutex);
 
 	if (copy_to_user(query_ptr, &query, sizeof(query)))
 		return -EFAULT;
-- 
2.45.2

