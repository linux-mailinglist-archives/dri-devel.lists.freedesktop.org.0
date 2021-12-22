Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED0947D46F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 16:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541D910E1A9;
	Wed, 22 Dec 2021 15:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96EF10E1A9;
 Wed, 22 Dec 2021 15:56:27 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Use trylock instead of blocking lock for
 __i915_gem_free_objects.
Date: Wed, 22 Dec 2021 16:56:22 +0100
Message-Id: <20211222155622.2960379-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert free_work into delayed_work, similar to ttm to allow converting the
blocking lock in __i915_gem_free_objects to a trylock.

Unlike ttm, the object should already be idle, as it's kept alive
by a reference through struct i915_vma->active, which is dropped
after all vma's are idle.

Because of this, we can use a no wait by default, or when the lock
is contested, we use ttm's 10 ms.

The trylock should only fail when the object is sharing it's resv with
other objects, and typically objects are not kept locked for a long
time, so we can safely retry on failure.

Fixes: be7612fd6665 ("drm/i915: Require object lock when freeing pages during destruction")
Testcase: igt/gem_exec_alignment/pi*
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 14 ++++++++++----
 drivers/gpu/drm/i915/i915_drv.h            |  4 ++--
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 39cd563544a5..d87b508b59b1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -331,7 +331,13 @@ static void __i915_gem_free_objects(struct drm_i915_private *i915,
 			continue;
 		}
 
-		i915_gem_object_lock(obj, NULL);
+		if (!i915_gem_object_trylock(obj, NULL)) {
+			/* busy, toss it back to the pile */
+			if (llist_add(&obj->freed, &i915->mm.free_list))
+				queue_delayed_work(i915->wq, &i915->mm.free_work, msecs_to_jiffies(10));
+			continue;
+		}
+
 		__i915_gem_object_pages_fini(obj);
 		i915_gem_object_unlock(obj);
 		__i915_gem_free_object(obj);
@@ -353,7 +359,7 @@ void i915_gem_flush_free_objects(struct drm_i915_private *i915)
 static void __i915_gem_free_work(struct work_struct *work)
 {
 	struct drm_i915_private *i915 =
-		container_of(work, struct drm_i915_private, mm.free_work);
+		container_of(work, struct drm_i915_private, mm.free_work.work);
 
 	i915_gem_flush_free_objects(i915);
 }
@@ -385,7 +391,7 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
 	 */
 
 	if (llist_add(&obj->freed, &i915->mm.free_list))
-		queue_work(i915->wq, &i915->mm.free_work);
+		queue_delayed_work(i915->wq, &i915->mm.free_work, 0);
 }
 
 void __i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
@@ -710,7 +716,7 @@ bool i915_gem_object_placement_possible(struct drm_i915_gem_object *obj,
 
 void i915_gem_init__objects(struct drm_i915_private *i915)
 {
-	INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
+	INIT_DELAYED_WORK(&i915->mm.free_work, __i915_gem_free_work);
 }
 
 void i915_objects_module_exit(void)
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index c8fddb7e61c9..beeb42a14aae 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -465,7 +465,7 @@ struct i915_gem_mm {
 	 * List of objects which are pending destruction.
 	 */
 	struct llist_head free_list;
-	struct work_struct free_work;
+	struct delayed_work free_work;
 	/**
 	 * Count of objects pending destructions. Used to skip needlessly
 	 * waiting on an RCU barrier if no objects are waiting to be freed.
@@ -1625,7 +1625,7 @@ static inline void i915_gem_drain_freed_objects(struct drm_i915_private *i915)
 	 * armed the work again.
 	 */
 	while (atomic_read(&i915->mm.free_count)) {
-		flush_work(&i915->mm.free_work);
+		flush_delayed_work(&i915->mm.free_work);
 		flush_delayed_work(&i915->bdev.wq);
 		rcu_barrier();
 	}
-- 
2.34.1

