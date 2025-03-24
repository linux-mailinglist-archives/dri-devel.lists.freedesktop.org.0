Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8ADA6DB96
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 14:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD4810E414;
	Mon, 24 Mar 2025 13:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LR6DTRO9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A9610E414;
 Mon, 24 Mar 2025 13:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742823101; x=1774359101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7cKHASeBoHHNkyDBIKSIt+yIk6xplt4fCE4ZNa/kqiU=;
 b=LR6DTRO9mS7ZZTCdpxQ6h6j8P9NHSFVW08ANztCyNXs1QowfsejvDpEk
 SwUjCaHjdTyjRaVZy5d0H+lhghj8C/nYXS0j9zR1E8ZW73YC0zaDKmkkD
 NiQHc+P6MoPIutffWHwg0UidHfsKz3OVd1QO28vv9cA4IoiWze1DRiWEh
 VXmComsaBM79XD5Fn/E816WGea124WWEs8UYwWMwkMQ21PSZ9qNrD2RGc
 ii8sYha6D1im4+VHKpnh9hz+7RO+jHK1JQRGrtAr+Q6bWO1Jr/agoH831
 skBhmH/r3xNUmRBEc1bgvhZHvjNSEAq2tZxncNaCttvJJe6ppeU48OZp3 A==;
X-CSE-ConnectionGUID: ysiYXK95TSWMD5pAQ+G6BA==
X-CSE-MsgGUID: GJG8V2U1SNa3nrAQ6+HG6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55024735"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="55024735"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:31:41 -0700
X-CSE-ConnectionGUID: I/FWvvwJQseDDTqyUnDjiw==
X-CSE-MsgGUID: BJaLx1rJSB2NxANFYfuENg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="155060153"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.252])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:31:37 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Arshad Mehmood <arshad.mehmood@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v4 12/15] drm/i915: Protect access to the UABI engines list
 with a mutex
Date: Mon, 24 Mar 2025 14:29:48 +0100
Message-ID: <20250324132952.1075209-13-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
References: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
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
 drivers/gpu/drm/i915/gem/i915_gem_context.c |  3 +++
 drivers/gpu/drm/i915/gt/intel_engine_user.c |  7 +++++++
 drivers/gpu/drm/i915/gt/sysfs_engines.c     |  5 +++++
 drivers/gpu/drm/i915/i915_cmd_parser.c      |  2 ++
 drivers/gpu/drm/i915/i915_debugfs.c         |  4 ++++
 drivers/gpu/drm/i915/i915_drv.h             |  4 ++++
 drivers/gpu/drm/i915/i915_gem.c             |  4 ++++
 drivers/gpu/drm/i915/i915_perf.c            |  8 +++++---
 drivers/gpu/drm/i915/i915_pmu.c             | 11 +++++++++--
 drivers/gpu/drm/i915/i915_query.c           | 21 ++++++++++++++++-----
 10 files changed, 59 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index ab1af978911b..4263d3eb2557 100644
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
index f70f0a2983f1..d3d3c67edf34 100644
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
index 0d9e263913ff..f2957435b529 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -451,8 +451,10 @@ static int i915_engine_info(struct seq_file *m, void *unused)
 		   to_gt(i915)->clock_period_ns);
 
 	p = drm_seq_file_printer(m);
+	mutex_lock(&i915->uabi_engines_mutex);
 	for_each_uabi_engine(engine, i915)
 		intel_engine_dump(engine, &p, "%s\n", engine->name);
+	mutex_unlock(&i915->uabi_engines_mutex);
 
 	intel_gt_show_timelines(to_gt(i915), &p, i915_request_show_with_schedule);
 
@@ -466,6 +468,7 @@ static int i915_wa_registers(struct seq_file *m, void *unused)
 	struct drm_i915_private *i915 = node_to_i915(m->private);
 	struct intel_engine_cs *engine;
 
+	mutex_lock(&i915->uabi_engines_mutex);
 	for_each_uabi_engine(engine, i915) {
 		const struct i915_wa_list *wal = &engine->ctx_wa_list;
 		const struct i915_wa *wa;
@@ -485,6 +488,7 @@ static int i915_wa_registers(struct seq_file *m, void *unused)
 
 		seq_printf(m, "\n");
 	}
+	mutex_unlock(&i915->uabi_engines_mutex);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 97806e44429c..fcfab2ad2908 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -223,6 +223,10 @@ struct drm_i915_private {
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
index 8c8d43451f35..56b796c0e06b 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1261,7 +1261,11 @@ void i915_gem_driver_remove(struct drm_i915_private *dev_priv)
 	i915_gem_suspend_late(dev_priv);
 	for_each_gt(gt, dev_priv, i)
 		intel_gt_driver_remove(gt);
+
+	/* Let's make sure no one is using the uabi_engines list */
+	mutex_lock(&dev_priv->uabi_engines_mutex);
 	dev_priv->uabi_engines = RB_ROOT;
+	mutex_unlock(&dev_priv->uabi_engines_mutex);
 
 	/* Flush any outstanding unpin_work. */
 	i915_gem_drain_workqueue(dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index bec164e884ae..7c8dc42a3623 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -2691,7 +2691,7 @@ oa_configure_all_contexts(struct i915_perf_stream *stream,
 	struct intel_engine_cs *engine;
 	struct intel_gt *gt = stream->engine->gt;
 	struct i915_gem_context *ctx, *cn;
-	int err;
+	int err = 0;
 
 	lockdep_assert_held(&gt->perf.lock);
 
@@ -2735,6 +2735,7 @@ oa_configure_all_contexts(struct i915_perf_stream *stream,
 	 * If we don't modify the kernel_context, we do not get events while
 	 * idle.
 	 */
+	mutex_lock(&i915->uabi_engines_mutex);
 	for_each_uabi_engine(engine, i915) {
 		struct intel_context *ce = engine->kernel_context;
 
@@ -2745,10 +2746,11 @@ oa_configure_all_contexts(struct i915_perf_stream *stream,
 
 		err = gen8_modify_self(ce, regs, num_regs, active);
 		if (err)
-			return err;
+			break;
 	}
+	mutex_unlock(&i915->uabi_engines_mutex);
 
-	return 0;
+	return err;
 }
 
 static int
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 69a109d02116..047588aba524 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -1017,6 +1017,7 @@ create_event_attributes(struct i915_pmu *pmu)
 		}
 	}
 
+	mutex_lock(&i915->uabi_engines_mutex);
 	for_each_uabi_engine(engine, i915) {
 		for (i = 0; i < ARRAY_SIZE(engine_events); i++) {
 			if (!engine_event_status(engine,
@@ -1024,6 +1025,7 @@ create_event_attributes(struct i915_pmu *pmu)
 				count++;
 		}
 	}
+	mutex_unlock(&i915->uabi_engines_mutex);
 
 	/* Allocate attribute objects and table. */
 	i915_attr = kcalloc(count, sizeof(*i915_attr), GFP_KERNEL);
@@ -1081,6 +1083,7 @@ create_event_attributes(struct i915_pmu *pmu)
 	}
 
 	/* Initialize supported engine counters. */
+	mutex_lock(&i915->uabi_engines_mutex);
 	for_each_uabi_engine(engine, i915) {
 		for (i = 0; i < ARRAY_SIZE(engine_events); i++) {
 			char *str;
@@ -1092,7 +1095,7 @@ create_event_attributes(struct i915_pmu *pmu)
 			str = kasprintf(GFP_KERNEL, "%s-%s",
 					engine->name, engine_events[i].name);
 			if (!str)
-				goto err;
+				goto err_unlock;
 
 			*attr_iter++ = &i915_iter->attr.attr;
 			i915_iter =
@@ -1104,18 +1107,22 @@ create_event_attributes(struct i915_pmu *pmu)
 			str = kasprintf(GFP_KERNEL, "%s-%s.unit",
 					engine->name, engine_events[i].name);
 			if (!str)
-				goto err;
+				goto err_unlock;
 
 			*attr_iter++ = &pmu_iter->attr.attr;
 			pmu_iter = add_pmu_attr(pmu_iter, str, "ns");
 		}
 	}
+	mutex_unlock(&i915->uabi_engines_mutex);
 
 	pmu->i915_attr = i915_attr;
 	pmu->pmu_attr = pmu_attr;
 
 	return attr;
 
+err_unlock:
+	mutex_unlock(&i915->uabi_engines_mutex);
+
 err:;
 	for (attr_iter = attr; *attr_iter; attr_iter++)
 		kfree((*attr_iter)->name);
diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 14d9ec0ed777..7c6669cc4c96 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -140,6 +140,7 @@ query_engine_info(struct drm_i915_private *i915,
 	if (query_item->flags)
 		return -EINVAL;
 
+	mutex_lock(&i915->uabi_engines_mutex);
 	for_each_uabi_engine(engine, i915)
 		num_uabi_engines++;
 
@@ -147,11 +148,13 @@ query_engine_info(struct drm_i915_private *i915,
 
 	ret = copy_query_item(&query, sizeof(query), len, query_item);
 	if (ret != 0)
-		return ret;
+		goto err;
 
 	if (query.num_engines || query.rsvd[0] || query.rsvd[1] ||
-	    query.rsvd[2])
-		return -EINVAL;
+	    query.rsvd[2]) {
+		ret = -EINVAL;
+		goto err;
+	}
 
 	info_ptr = &query_ptr->engines[0];
 
@@ -162,17 +165,25 @@ query_engine_info(struct drm_i915_private *i915,
 		info.capabilities = engine->uabi_capabilities;
 		info.logical_instance = ilog2(engine->logical_mask);
 
-		if (copy_to_user(info_ptr, &info, sizeof(info)))
-			return -EFAULT;
+		if (copy_to_user(info_ptr, &info, sizeof(info))) {
+			ret = -EFAULT;
+			goto err;
+		}
 
 		query.num_engines++;
 		info_ptr++;
 	}
+	mutex_unlock(&i915->uabi_engines_mutex);
 
 	if (copy_to_user(query_ptr, &query, sizeof(query)))
 		return -EFAULT;
 
 	return len;
+
+err:
+	mutex_unlock(&i915->uabi_engines_mutex);
+
+	return ret;
 }
 
 static int can_copy_perf_config_registers_or_number(u32 user_n_regs,
-- 
2.47.2

