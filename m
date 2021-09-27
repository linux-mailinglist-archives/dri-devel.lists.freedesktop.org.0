Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F16419760
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 17:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EED89FC8;
	Mon, 27 Sep 2021 15:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F6C89FC8;
 Mon, 27 Sep 2021 15:10:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="222602170"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="222602170"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 08:10:28 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="520068943"
Received: from ekolpasx-mobl.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.80])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 08:10:26 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/i915/ttm: Rework object initialization slightly
Date: Mon, 27 Sep 2021 17:10:17 +0200
Message-Id: <20210927151017.287414-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We may end up in i915_ttm_bo_destroy() in an error path before the
object is fully initialized. In that case it's not correct to call
__i915_gem_free_object(), because that function
a) Assumes the gem object refcount is 0, which it isn't.
b) frees the placements which are owned by the caller until the
init_object() region ops returns successfully. Fix this by providing
a lightweight cleanup function i915_gem_object_fini() which is also
called by __i915_gem_free_object().

While doing this, also make sure we call dma_resv_fini() as part of
ordinary object destruction and not from the RCU callback that frees
the object. This will help track down bugs where the object is incorrectly
locked from an RCU lookup.

Finally, make sure the object isn't put on the region list until it's
either locked or fully initialized in order to block list processing of
partially initialized objects.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 18 ++++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_object.h |  3 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 32 +++++++++++++---------
 3 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 6fb9afb65034..244e555f9bba 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -89,6 +89,20 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
 	mutex_init(&obj->mm.get_dma_page.lock);
 }
 
+/**
+ * i915_gem_object_fini - Clean up a GEM object initialization
+ * @obj: The gem object cleanup
+ *
+ * This function cleans up gem object fields that are set up by
+ * drm_gem_private_object_init() and i915_gem_object_init().
+ */
+void i915_gem_object_fini(struct drm_i915_gem_object *obj)
+{
+	mutex_destroy(&obj->mm.get_page.lock);
+	mutex_destroy(&obj->mm.get_dma_page.lock);
+	dma_resv_fini(&obj->base._resv);
+}
+
 /**
  * Mark up the object's coherency levels for a given cache_level
  * @obj: #drm_i915_gem_object
@@ -174,7 +188,6 @@ void __i915_gem_free_object_rcu(struct rcu_head *head)
 		container_of(head, typeof(*obj), rcu);
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 
-	dma_resv_fini(&obj->base._resv);
 	i915_gem_object_free(obj);
 
 	GEM_BUG_ON(!atomic_read(&i915->mm.free_count));
@@ -223,7 +236,6 @@ void __i915_gem_free_object(struct drm_i915_gem_object *obj)
 						       obj_link))) {
 			GEM_BUG_ON(vma->obj != obj);
 			spin_unlock(&obj->vma.lock);
-
 			__i915_vma_put(vma);
 
 			spin_lock(&obj->vma.lock);
@@ -253,6 +265,8 @@ void __i915_gem_free_object(struct drm_i915_gem_object *obj)
 
 	if (obj->shares_resv_from)
 		i915_vm_resv_put(obj->shares_resv_from);
+
+	i915_gem_object_fini(obj);
 }
 
 static void __i915_gem_free_objects(struct drm_i915_private *i915,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 3043fcbd31bd..4f1af3b487d9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -58,6 +58,9 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
 			  const struct drm_i915_gem_object_ops *ops,
 			  struct lock_class_key *key,
 			  unsigned alloc_flags);
+
+void i915_gem_object_fini(struct drm_i915_gem_object *obj);
+
 struct drm_i915_gem_object *
 i915_gem_object_create_shmem(struct drm_i915_private *i915,
 			     resource_size_t size);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index b94497989995..fbe143f34e85 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -813,12 +813,9 @@ static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
  */
 static void i915_ttm_delayed_free(struct drm_i915_gem_object *obj)
 {
-	if (obj->ttm.created) {
-		ttm_bo_put(i915_gem_to_ttm(obj));
-	} else {
-		__i915_gem_free_object(obj);
-		call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
-	}
+	GEM_BUG_ON(!obj->ttm.created);
+
+	ttm_bo_put(i915_gem_to_ttm(obj));
 }
 
 static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
@@ -898,16 +895,19 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
 {
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 
-	i915_ttm_backup_free(obj);
-
-	/* This releases all gem object bindings to the backend. */
-	__i915_gem_free_object(obj);
-
 	i915_gem_object_release_memory_region(obj);
 	mutex_destroy(&obj->ttm.get_io_page.lock);
 
-	if (obj->ttm.created)
+	if (obj->ttm.created) {
+		i915_ttm_backup_free(obj);
+
+		/* This releases all gem object bindings to the backend. */
+		__i915_gem_free_object(obj);
+
 		call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
+	} else {
+		i915_gem_object_fini(obj);
+	}
 }
 
 /**
@@ -936,7 +936,11 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 
 	drm_gem_private_object_init(&i915->drm, &obj->base, size);
 	i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, flags);
-	i915_gem_object_init_memory_region(obj, mem);
+
+	/* Don't put on a region list until we're either locked or fully initialized. */
+	obj->mm.region = intel_memory_region_get(mem);
+	INIT_LIST_HEAD(&obj->mm.region_link);
+
 	i915_gem_object_make_unshrinkable(obj);
 	INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
 	mutex_init(&obj->ttm.get_io_page.lock);
@@ -963,6 +967,8 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 		return i915_ttm_err_to_gem(ret);
 
 	obj->ttm.created = true;
+	i915_gem_object_release_memory_region(obj);
+	i915_gem_object_init_memory_region(obj, mem);
 	i915_ttm_adjust_domains_after_move(obj);
 	i915_ttm_adjust_gem_after_move(obj);
 	i915_gem_object_unlock(obj);
-- 
2.31.1

