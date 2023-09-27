Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C452B7B05A9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 15:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089D710E527;
	Wed, 27 Sep 2023 13:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F36E10E529;
 Wed, 27 Sep 2023 13:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695821943; x=1727357943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ycOkpB+R9jja9jSuqGVzv/LnNbj4VCoYI3aCTs5avhQ=;
 b=L4QAhmpBx67kIotoxSB3GrVW6vTAnx2KquSaF4ybkfg2WLNNRJoQbExi
 Kj0oHxvgTPv/egS/eFprVMn2vsPiIWbVSHx+miwSyApz5XZCb6h3s7raA
 StmJVVCxJMeZ/969RtwoxGvprhZe3TPEqoOHrvrnMYI9i0oFtwel1cqzI
 H+0TvPYJdOxWgKBcpTDBzJ9af/0PQSzzJnJD+JyBuEA/EqkK7wWxxNVoZ
 0b+2pLIus2pIhIbzm5k8ZOZ8ab8Uja09X4J4DQnDh5fQ6s5Hm3q8Wisxi
 xWqD6wS/66enM8tF34zCx5oQwautvIleqSIZYnV595FIomUCz57hF9hSo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="412738627"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="412738627"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:39:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752597218"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="752597218"
Received: from mscanex-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.204.17])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:39:01 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] drm/i915: Implement fdinfo memory stats printing
Date: Wed, 27 Sep 2023 14:38:43 +0100
Message-Id: <20230927133843.247957-8-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927133843.247957-1-tvrtko.ursulin@linux.intel.com>
References: <20230927133843.247957-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Use the newly added drm_print_memory_stats helper to show memory
utilisation of our objects in drm/driver specific fdinfo output.

To collect the stats we walk the per memory regions object lists
and accumulate object size into the respective drm_memory_stats
categories.

v2:
 * Only account against the active region.
 * Use DMA_RESV_USAGE_BOOKKEEP when testing for active. (Tejas)

v3:
 * Update commit text. (Aravind)
 * Update to use memory regions uabi names.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/i915/i915_drm_client.c | 64 ++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index a61356012df8..7efffdaa508d 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -45,6 +45,68 @@ void __i915_drm_client_free(struct kref *kref)
 }
 
 #ifdef CONFIG_PROC_FS
+static void
+obj_meminfo(struct drm_i915_gem_object *obj,
+	    struct drm_memory_stats stats[INTEL_REGION_UNKNOWN])
+{
+	const enum intel_region_id id = obj->mm.region ?
+					obj->mm.region->id : INTEL_REGION_SMEM;
+	const u64 sz = obj->base.size;
+
+	if (obj->base.handle_count > 1)
+		stats[id].shared += sz;
+	else
+		stats[id].private += sz;
+
+	if (i915_gem_object_has_pages(obj)) {
+		stats[id].resident += sz;
+
+		if (!dma_resv_test_signaled(obj->base.resv,
+					    DMA_RESV_USAGE_BOOKKEEP))
+			stats[id].active += sz;
+		else if (i915_gem_object_is_shrinkable(obj) &&
+			 obj->mm.madv == I915_MADV_DONTNEED)
+			stats[id].purgeable += sz;
+	}
+}
+
+static void show_meminfo(struct drm_printer *p, struct drm_file *file)
+{
+	struct drm_memory_stats stats[INTEL_REGION_UNKNOWN] = {};
+	struct drm_i915_file_private *fpriv = file->driver_priv;
+	struct i915_drm_client *client = fpriv->client;
+	struct drm_i915_private *i915 = fpriv->i915;
+	struct drm_i915_gem_object *obj;
+	struct intel_memory_region *mr;
+	struct list_head *pos;
+	unsigned int id;
+
+	/* Public objects. */
+	spin_lock(&file->table_lock);
+	idr_for_each_entry(&file->object_idr, obj, id)
+		obj_meminfo(obj, stats);
+	spin_unlock(&file->table_lock);
+
+	/* Internal objects. */
+	rcu_read_lock();
+	list_for_each_rcu(pos, &client->objects_list) {
+		obj = i915_gem_object_get_rcu(list_entry(pos, typeof(*obj),
+							 client_link));
+		if (!obj)
+			continue;
+		obj_meminfo(obj, stats);
+		i915_gem_object_put(obj);
+	}
+	rcu_read_unlock();
+
+	for_each_memory_region(mr, i915, id)
+		drm_print_memory_stats(p,
+				       &stats[id],
+				       DRM_GEM_OBJECT_RESIDENT |
+				       DRM_GEM_OBJECT_PURGEABLE,
+				       mr->uabi_name);
+}
+
 static const char * const uabi_class_names[] = {
 	[I915_ENGINE_CLASS_RENDER] = "render",
 	[I915_ENGINE_CLASS_COPY] = "copy",
@@ -106,6 +168,8 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 	 * ******************************************************************
 	 */
 
+	show_meminfo(p, file);
+
 	if (GRAPHICS_VER(i915) < 8)
 		return;
 
-- 
2.39.2

