Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A17FA6E4DCF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 17:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE2410E452;
	Mon, 17 Apr 2023 15:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D3310E418;
 Mon, 17 Apr 2023 15:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681747002; x=1713283002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p5vaX8w0+kDbnKWICo5v+DxZRla8dbBN2J5LMKRINFQ=;
 b=Oz7tACLRuRUJ7hTRmyvGKP9Q8UIyBb6Urja4V+NRXxeIcZwwoE5Up09u
 flPxjWa8AOlD4PN7zA/g4rb1NsUJ1lmORXABUHj9Oi8xwdtsT8l7kSCau
 iNDCW1Q7tIAxC0gygr3IsrjJ4OsPePqo0IJUiAlaktRYv/hUQXF/E7YYe
 qJqH2YAVhWA0wkA4rQp4f5mJ3dXYnUS3C2ilVh9JP+T2ahcOopi1oV0fG
 NlCEVIiomN43kwfPb5ltpIH36BAOO3XArVsw8sJNgk1CMY/prS6QQwyar
 DsBnMmi5x69N2Fwjtlzxu6+xnYBXUDkfkibEXOav+knxTe3F6TpT/FYFJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="372804669"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="372804669"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 08:56:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="690718352"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="690718352"
Received: from gtohallo-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.232.210])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 08:56:37 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 6/6] drm/i915: Implement fdinfo memory stats printing
Date: Mon, 17 Apr 2023 16:56:13 +0100
Message-Id: <20230417155613.4143258-7-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Show how more driver specific set of memory stats could be shown,
more specifically where object can reside in multiple regions, showing all
the supported stats, and where there is more to show than just user visible
objects.

WIP...

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c     |   5 ++
 drivers/gpu/drm/i915/i915_drm_client.c | 102 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h |   8 ++
 drivers/gpu/drm/i915/i915_drv.h        |   2 +
 4 files changed, 117 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 6493548c69bf..4c70206cbc27 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1806,6 +1806,11 @@ static const struct drm_driver i915_drm_driver = {
 	.dumb_create = i915_gem_dumb_create,
 	.dumb_map_offset = i915_gem_dumb_mmap_offset,
 
+#ifdef CONFIG_PROC_FS
+	.query_fdinfo_memory_regions = i915_query_fdinfo_memory_regions,
+	.query_fdinfo_memory_stats = i915_query_fdinfo_memory_stats,
+#endif
+
 	.ioctls = i915_ioctls,
 	.num_ioctls = ARRAY_SIZE(i915_ioctls),
 	.fops = &i915_driver_fops,
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index c654984189f7..65857c68bdb3 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -12,6 +12,7 @@
 #include <drm/drm_print.h>
 
 #include "gem/i915_gem_context.h"
+#include "intel_memory_region.h"
 #include "i915_drm_client.h"
 #include "i915_file_private.h"
 #include "i915_gem.h"
@@ -112,4 +113,105 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 	for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
 		show_client_class(p, i915, file_priv->client, i);
 }
+
+char **
+i915_query_fdinfo_memory_regions(struct drm_device *dev, unsigned int *num)
+{
+	struct drm_i915_private *i915 = to_i915(dev);
+	struct intel_memory_region *mr;
+	enum intel_region_id id;
+
+	/* FIXME move to init */
+	for_each_memory_region(mr, i915, id) {
+		if (!i915->mm.region_names[id])
+			i915->mm.region_names[id] = mr->name;
+	}
+
+	*num = id;
+
+	return i915->mm.region_names;
+}
+
+static void
+add_obj(struct drm_i915_gem_object *obj, struct drm_fdinfo_memory_stat *stats)
+{
+        struct intel_memory_region *mr;
+	u64 sz = obj->base.size;
+        enum intel_region_id id;
+	unsigned int i;
+
+	if (!obj)
+		return;
+
+	/* Attribute size and shared to all possible memory regions. */
+	for (i = 0; i < obj->mm.n_placements; i++) {
+		mr = obj->mm.placements[i];
+		id = mr->id;
+
+		stats[id].size += sz;
+		if (obj->base.handle_count > 1)
+			stats[id].shared += sz;
+	}
+
+	/* Attribute other categories to only the current region. */
+	mr = obj->mm.region;
+	if (mr)
+		id = mr->id;
+	else
+		id = INTEL_REGION_SMEM;
+
+	if (!i915_gem_object_has_pages(obj))
+		return;
+
+	stats[id].resident += sz;
+
+	if (!dma_resv_test_signaled(obj->base.resv, dma_resv_usage_rw(true)))
+		stats[id].active += sz;
+	else if (i915_gem_object_is_shrinkable(obj) &&
+		obj->mm.madv == I915_MADV_DONTNEED)
+		stats[id].purgeable += sz;
+}
+
+void
+i915_query_fdinfo_memory_stats(struct drm_file *file,
+			       struct drm_fdinfo_memory_stat *stats)
+{
+	struct drm_i915_file_private *file_priv = file->driver_priv;
+	struct i915_drm_client *client = file_priv->client;
+	struct drm_gem_object *drm_obj;
+	struct i915_gem_context *ctx;
+	int id;
+
+	/*
+	 * FIXME - we can do this better and in fewer passes if we are to start
+	 * exporting proper memory stats.
+	 */
+
+	/* User created objects */
+	spin_lock(&file->table_lock);
+	idr_for_each_entry(&file->object_idr, drm_obj, id)
+		add_obj(to_intel_bo(drm_obj), stats);
+	spin_unlock(&file->table_lock);
+
+	/* Contexts, rings, timelines, page tables, ... */
+	rcu_read_lock();
+	list_for_each_entry_rcu(ctx, &client->ctx_list, client_link) {
+		struct i915_gem_engines_iter it;
+		struct intel_context *ce;
+
+		for_each_gem_engine(ce, rcu_dereference(ctx->engines), it) {
+			/* FIXME races?! */
+			if (ce->state)
+				add_obj(ce->state->obj, stats);
+			if (ce->timeline && ce->timeline->hwsp_ggtt)
+				add_obj(ce->timeline->hwsp_ggtt->obj, stats);
+			if (ce->ring && ce->ring->vma)
+				add_obj(ce->ring->vma->obj, stats);
+		}
+
+		/* TODO  vtx->vm page table backing objects */
+	}
+	rcu_read_unlock();
+}
+
 #endif
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 4c18b99e10a4..622936c51903 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -14,7 +14,10 @@
 
 #define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
 
+struct drm_device;
 struct drm_file;
+struct drm_fdinfo_memory_stat;
+struct drm_gem_object;
 struct drm_printer;
 
 struct i915_drm_client {
@@ -49,6 +52,11 @@ struct i915_drm_client *i915_drm_client_alloc(void);
 
 #ifdef CONFIG_PROC_FS
 void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
+
+char **i915_query_fdinfo_memory_regions(struct drm_device *dev,
+					unsigned int *num);
+void i915_query_fdinfo_memory_stats(struct drm_file *file,
+				    struct drm_fdinfo_memory_stat *stats);
 #endif
 
 #endif /* !__I915_DRM_CLIENT_H__ */
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index eb739fb9cdbb..b84d2f0ed2cb 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -161,6 +161,8 @@ struct i915_gem_mm {
 
 	struct intel_memory_region *regions[INTEL_REGION_UNKNOWN];
 
+	char *region_names[INTEL_REGION_UNKNOWN];
+
 	struct notifier_block oom_notifier;
 	struct notifier_block vmap_notifier;
 	struct shrinker shrinker;
-- 
2.37.2

