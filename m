Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0223174B16B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 15:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C9E10E58F;
	Fri,  7 Jul 2023 13:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D8110E586;
 Fri,  7 Jul 2023 13:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688734961; x=1720270961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LXqBg1SA6fpRsD9mc3mJcWVGZWOaC7GwStwiDwO7XpY=;
 b=kCHAE+O6XrLMI/6jqMNiFVXvx7tNM4irNbgEf7TTFwESCYXVg4R+E0sl
 1/ocA0ukzA0eze96vUxa58sAk5jx7yL3Kzn8MV7fIIa/hqYBKNQzOtiwC
 WcEHx54M3ePxaZZ5KeyS0njFpTsBr5m4F2hwm6wpP+hnZTq5Xx5X0wNM1
 FHMpsI1OzFPNtaRWGAKEgu5cEvXpxkacsVmrDgHiHe1A+iqYc7TuIjWuY
 LlXjjHvGalIO19zwy9tiyLipW8I6o2wBus4QVP5iB4GgE+TMplmq4wowv
 Uk8j9LzoKkiMvzXOzuMK8ywe1qzAaqJmB5S2+MsWiWPArYP8w+JxBXhmD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="427570738"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="427570738"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 06:02:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="1050535695"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="1050535695"
Received: from gjmurphy-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.202.50])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 06:02:30 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915: Implement fdinfo memory stats printing
Date: Fri,  7 Jul 2023 14:02:20 +0100
Message-Id: <20230707130220.3966836-6-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
References: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Use the newly added drm_print_memory_stats helper to show memory
utilisation of our objects in drm/driver specific fdinfo output.

To collect the stats we walk the per memory regions object lists
and accumulate object size into the respective drm_memory_stats
categories.

Objects with multiple possible placements are reported in multiple
regions for total and shared sizes, while other categories are
counted only for the currently active region.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/i915/i915_drm_client.c | 85 ++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index ffccb6239789..5c77d6987d90 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -45,6 +45,89 @@ void __i915_drm_client_free(struct kref *kref)
 }
 
 #ifdef CONFIG_PROC_FS
+static void
+obj_meminfo(struct drm_i915_gem_object *obj,
+	    struct drm_memory_stats stats[INTEL_REGION_UNKNOWN])
+{
+	struct intel_memory_region *mr;
+	u64 sz = obj->base.size;
+	enum intel_region_id id;
+	unsigned int i;
+
+	/* Attribute size and shared to all possible memory regions. */
+	for (i = 0; i < obj->mm.n_placements; i++) {
+		mr = obj->mm.placements[i];
+		id = mr->id;
+
+		if (obj->base.handle_count > 1)
+			stats[id].shared += sz;
+		else
+			stats[id].private += sz;
+	}
+
+	/* Attribute other categories to only the current region. */
+	mr = obj->mm.region;
+	if (mr)
+		id = mr->id;
+	else
+		id = INTEL_REGION_SMEM;
+
+	if (!obj->mm.n_placements) {
+		if (obj->base.handle_count > 1)
+			stats[id].shared += sz;
+		else
+			stats[id].private += sz;
+	}
+
+	if (i915_gem_object_has_pages(obj)) {
+		stats[id].resident += sz;
+
+		if (!dma_resv_test_signaled(obj->base.resv,
+					    dma_resv_usage_rw(true)))
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
+	idr_for_each_entry (&file->object_idr, obj, id)
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
+				       mr->name);
+}
+
 static const char * const uabi_class_names[] = {
 	[I915_ENGINE_CLASS_RENDER] = "render",
 	[I915_ENGINE_CLASS_COPY] = "copy",
@@ -106,6 +189,8 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 	 * ******************************************************************
 	 */
 
+	show_meminfo(p, file);
+
 	if (GRAPHICS_VER(i915) < 8)
 		return;
 
-- 
2.39.2

