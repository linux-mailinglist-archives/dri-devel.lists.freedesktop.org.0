Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C94F422FFA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 20:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A6C6EC2D;
	Tue,  5 Oct 2021 18:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAC96EC23;
 Tue,  5 Oct 2021 18:25:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="249086489"
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; d="scan'208";a="249086489"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 11:25:17 -0700
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; d="scan'208";a="438805361"
Received: from ashleylh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.209.141])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 11:25:16 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v6 5/8] drm/i915: add some kernel-doc for shrink_pin and
 friends
Date: Tue,  5 Oct 2021 19:24:02 +0100
Message-Id: <20211005182405.915100-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211005182405.915100-1-matthew.auld@intel.com>
References: <20211005182405.915100-1-matthew.auld@intel.com>
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

Attempt to document shrink_pin and the other relevant interfaces that
interact with it, before we start messing with it.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_object_types.h  | 24 +++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  | 31 +++++++++++++++++++
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 7dd5f804aab3..f4233c4e8d2e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -461,6 +461,28 @@ struct drm_i915_gem_object {
 		 * instead go through the pin/unpin interfaces.
 		 */
 		atomic_t pages_pin_count;
+
+		/**
+		 * @shrink_pin: Prevents the pages from being made visible to
+		 * the shrinker, while the shrink_pin is non-zero. Most users
+		 * should pretty much never have to care about this, outside of
+		 * some special use cases.
+		 *
+		 * By default most objects will start out as visible to the
+		 * shrinker(if I915_GEM_OBJECT_IS_SHRINKABLE) as soon as the
+		 * backing pages are attached to the object, like in
+		 * __i915_gem_object_set_pages(). They will then be removed the
+		 * shrinker list once the pages are released.
+		 *
+		 * The @shrink_pin is incremented by calling
+		 * i915_gem_object_make_unshrinkable(), which will also remove
+		 * the object from the shrinker list, if the pin count was zero.
+		 *
+		 * Callers will then typically call
+		 * i915_gem_object_make_shrinkable() or
+		 * i915_gem_object_make_purgeable() to decrement the pin count,
+		 * and make the pages visible again.
+		 */
 		atomic_t shrink_pin;
 
 		/**
@@ -522,7 +544,7 @@ struct drm_i915_gem_object {
 		struct i915_gem_object_page_iter get_dma_page;
 
 		/**
-		 * Element within i915->mm.unbound_list or i915->mm.bound_list,
+		 * Element within i915->mm.shrink_list or i915->mm.purge_list,
 		 * locked by i915->mm.obj_lock.
 		 */
 		struct list_head link;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index ae2a8d54b7a4..66121fedc655 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -463,6 +463,16 @@ void i915_gem_shrinker_taints_mutex(struct drm_i915_private *i915,
 
 #define obj_to_i915(obj__) to_i915((obj__)->base.dev)
 
+/**
+ * i915_gem_object_make_unshrinkable - Hide the object from the shrinker. By
+ * default all object types that support shrinking(see IS_SHRINKABLE), will also
+ * make the object visible to the shrinker after allocating the system memory
+ * pages.
+ * @obj: The GEM object.
+ *
+ * This is typically used for special kernel internal objects that can't be
+ * easily processed by the shrinker, like if they are perma-pinned.
+ */
 void i915_gem_object_make_unshrinkable(struct drm_i915_gem_object *obj)
 {
 	struct drm_i915_private *i915 = obj_to_i915(obj);
@@ -513,12 +523,33 @@ static void __i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj,
 	spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
 }
 
+/**
+ * i915_gem_object_make_shrinkable - Move the object to the tail of the
+ * shrinkable list. Objects on this list might be swapped out. Used with
+ * WILLNEED objects.
+ * @obj: The GEM object.
+ *
+ * MUST only be called on objects which have backing pages.
+ *
+ * MUST be balanced with previous call to i915_gem_object_make_unshrinkable().
+ */
 void i915_gem_object_make_shrinkable(struct drm_i915_gem_object *obj)
 {
 	__i915_gem_object_make_shrinkable(obj,
 					  &obj_to_i915(obj)->mm.shrink_list);
 }
 
+/**
+ * i915_gem_object_make_purgeable - Move the object to the tail of the purgeable
+ * list. Used with DONTNEED objects. Unlike with shrinkable objects, the
+ * shrinker will attempt to discard the backing pages, instead of trying to swap
+ * them out.
+ * @obj: The GEM object.
+ *
+ * MUST only be called on objects which have backing pages.
+ *
+ * MUST be balanced with previous call to i915_gem_object_make_unshrinkable().
+ */
 void i915_gem_object_make_purgeable(struct drm_i915_gem_object *obj)
 {
 	__i915_gem_object_make_shrinkable(obj,
-- 
2.26.3

