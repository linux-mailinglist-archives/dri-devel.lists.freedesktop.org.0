Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A119435F4D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 12:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26BD6EC44;
	Thu, 21 Oct 2021 10:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8404A6EC3C;
 Thu, 21 Oct 2021 10:36:12 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 18/28] drm/i915: Take trylock during eviction, v2.
Date: Thu, 21 Oct 2021 12:35:55 +0200
Message-Id: <20211021103605.735002-18-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
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

Now that freeing objects takes the object lock when destroying the
backing pages, we can confidently take the object lock even for dead
objects.

Use this fact to take the object lock in the shrinker, without requiring
a reference to the object, so all calls to unbind take the object lock.

This is the last step to requiring the object lock for vma_unbind.

Changes since v1:
- No longer require the refcount, as every freed object now holds the lock
  when unbinding VMA's.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c |  6 ++++
 drivers/gpu/drm/i915/i915_gem_evict.c        | 34 +++++++++++++++++---
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index d3f29a66cb36..34c12e5983eb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -403,12 +403,18 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
 	list_for_each_entry_safe(vma, next,
 				 &i915->ggtt.vm.bound_list, vm_link) {
 		unsigned long count = vma->node.size >> PAGE_SHIFT;
+		struct drm_i915_gem_object *obj = vma->obj;
 
 		if (!vma->iomap || i915_vma_is_active(vma))
 			continue;
 
+		if (!i915_gem_object_trylock(obj))
+			continue;
+
 		if (__i915_vma_unbind(vma) == 0)
 			freed_pages += count;
+
+		i915_gem_object_unlock(obj);
 	}
 	mutex_unlock(&i915->ggtt.vm.mutex);
 
diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
index 2b73ddb11c66..286efa462eca 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@ -58,6 +58,9 @@ mark_free(struct drm_mm_scan *scan,
 	if (i915_vma_is_pinned(vma))
 		return false;
 
+	if (!i915_gem_object_trylock(vma->obj))
+		return false;
+
 	list_add(&vma->evict_link, unwind);
 	return drm_mm_scan_add_block(scan, &vma->node);
 }
@@ -178,6 +181,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
 	list_for_each_entry_safe(vma, next, &eviction_list, evict_link) {
 		ret = drm_mm_scan_remove_block(&scan, &vma->node);
 		BUG_ON(ret);
+		i915_gem_object_unlock(vma->obj);
 	}
 
 	/*
@@ -222,10 +226,12 @@ i915_gem_evict_something(struct i915_address_space *vm,
 	 * of any of our objects, thus corrupting the list).
 	 */
 	list_for_each_entry_safe(vma, next, &eviction_list, evict_link) {
-		if (drm_mm_scan_remove_block(&scan, &vma->node))
+		if (drm_mm_scan_remove_block(&scan, &vma->node)) {
 			__i915_vma_pin(vma);
-		else
+		} else {
 			list_del(&vma->evict_link);
+			i915_gem_object_unlock(vma->obj);
+		}
 	}
 
 	/* Unbinding will emit any required flushes */
@@ -234,16 +240,22 @@ i915_gem_evict_something(struct i915_address_space *vm,
 		__i915_vma_unpin(vma);
 		if (ret == 0)
 			ret = __i915_vma_unbind(vma);
+
+		i915_gem_object_unlock(vma->obj);
 	}
 
 	while (ret == 0 && (node = drm_mm_scan_color_evict(&scan))) {
 		vma = container_of(node, struct i915_vma, node);
 
+
 		/* If we find any non-objects (!vma), we cannot evict them */
-		if (vma->node.color != I915_COLOR_UNEVICTABLE)
+		if (vma->node.color != I915_COLOR_UNEVICTABLE &&
+		    i915_gem_object_trylock(vma->obj)) {
 			ret = __i915_vma_unbind(vma);
-		else
-			ret = -ENOSPC; /* XXX search failed, try again? */
+			i915_gem_object_unlock(vma->obj);
+		} else {
+			ret = -ENOSPC;
+		}
 	}
 
 	return ret;
@@ -333,6 +345,11 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
 			break;
 		}
 
+		if (!i915_gem_object_trylock(vma->obj)) {
+			ret = -ENOSPC;
+			break;
+		}
+
 		/*
 		 * Never show fear in the face of dragons!
 		 *
@@ -350,6 +367,8 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
 		__i915_vma_unpin(vma);
 		if (ret == 0)
 			ret = __i915_vma_unbind(vma);
+
+		i915_gem_object_unlock(vma->obj);
 	}
 
 	return ret;
@@ -393,6 +412,9 @@ int i915_gem_evict_vm(struct i915_address_space *vm)
 			if (i915_vma_is_pinned(vma))
 				continue;
 
+			if (!i915_gem_object_trylock(vma->obj))
+				continue;
+
 			__i915_vma_pin(vma);
 			list_add(&vma->evict_link, &eviction_list);
 		}
@@ -406,6 +428,8 @@ int i915_gem_evict_vm(struct i915_address_space *vm)
 				ret = __i915_vma_unbind(vma);
 			if (ret != -EINTR) /* "Get me out of here!" */
 				ret = 0;
+
+			i915_gem_object_unlock(vma->obj);
 		}
 	} while (ret == 0);
 
-- 
2.33.0

