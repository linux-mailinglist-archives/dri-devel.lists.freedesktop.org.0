Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FD13A9E3B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 16:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1186E5C5;
	Wed, 16 Jun 2021 14:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1262889E8C;
 Wed, 16 Jun 2021 14:53:42 +0000 (UTC)
IronPort-SDR: BbfDv8sZ+JczXMENunNk8bV1yxPpExdVPN7GlXIStykWYeEVxNn2ALNNpWywPI6GAdeiPa1QV1
 pxJIxq6p7XxA==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="270039073"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="270039073"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 07:53:37 -0700
IronPort-SDR: PcdnD8nYP2x7yIsDqnIBdTY4cepb3070vaDYDU0cySxK+5NfzotQWoww4wJD0NFYFzmwJZzkQv
 gBXrywdSXoUQ==
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="442903095"
Received: from mrapopor-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.236.122])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 07:53:36 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 5/7] drm/i915/ttm: remove node usage in our naming
Date: Wed, 16 Jun 2021 15:52:57 +0100
Message-Id: <20210616145259.357146-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210616145259.357146-1-matthew.auld@intel.com>
References: <20210616145259.357146-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that ttm_resource_manager just returns a generic ttm_resource we
don't need to reference the mm_node stuff anymore which mostly only
makes sense for drm_mm_node. In the next few patches we want switch over
to the ttm_buddy_man which is just another type of ttm_resource so
reflect that in the naming.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  5 ++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  2 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       | 30 +++++++++----------
 drivers/gpu/drm/i915/intel_region_ttm.h       | 14 ++++-----
 drivers/gpu/drm/i915/selftests/mock_region.c  | 16 +++++-----
 5 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 2a23b77424b3..3a2d9ecf8e03 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -265,9 +265,10 @@ struct drm_i915_gem_object {
 		struct intel_memory_region *region;
 
 		/**
-		 * Memory manager node allocated for this object.
+		 * Memory manager resource allocated for this object. Only
+		 * needed for the mock region.
 		 */
-		void *st_mm_node;
+		struct ttm_resource *res;
 
 		/**
 		 * Element within memory_region->objects or region->purgeable
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 94fbf6899cb0..16efc0a98760 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -325,7 +325,7 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
 	if (man->use_tt)
 		return i915_ttm_tt_get_st(bo->ttm);
 
-	return intel_region_ttm_node_to_st(obj->mm.region, res);
+	return intel_region_ttm_resource_to_st(obj->mm.region, res);
 }
 
 static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 5a664f6cc93f..f9d616544728 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -68,7 +68,7 @@ int intel_region_to_ttm_type(const struct intel_memory_region *mem)
 }
 
 static struct ttm_resource *
-intel_region_ttm_node_reserve(struct intel_memory_region *mem,
+intel_region_ttm_resource_reserve(struct intel_memory_region *mem,
 			      resource_size_t offset,
 			      resource_size_t size)
 {
@@ -100,12 +100,12 @@ intel_region_ttm_node_reserve(struct intel_memory_region *mem,
 }
 
 /**
- * intel_region_ttm_node_free - Free a node allocated from a resource manager
- * @mem: The region the node was allocated from.
- * @node: The opaque node representing an allocation.
+ * intel_region_ttm_resource_free - Free a resource allocated from a resource manager
+ * @mem: The region the resource was allocated from.
+ * @res: The opaque resource representing an allocation.
  */
-void intel_region_ttm_node_free(struct intel_memory_region *mem,
-				struct ttm_resource *res)
+void intel_region_ttm_resource_free(struct intel_memory_region *mem,
+				    struct ttm_resource *res)
 {
 	struct ttm_resource_manager *man = mem->region_private;
 
@@ -113,8 +113,8 @@ void intel_region_ttm_node_free(struct intel_memory_region *mem,
 }
 
 static const struct intel_memory_region_private_ops priv_ops = {
-	.reserve = intel_region_ttm_node_reserve,
-	.free = intel_region_ttm_node_free,
+	.reserve = intel_region_ttm_resource_reserve,
+	.free = intel_region_ttm_resource_free,
 };
 
 int intel_region_ttm_init(struct intel_memory_region *mem)
@@ -157,10 +157,10 @@ void intel_region_ttm_fini(struct intel_memory_region *mem)
 }
 
 /**
- * intel_region_ttm_node_to_st - Convert an opaque TTM resource manager node
+ * intel_region_ttm_resource_to_st - Convert an opaque TTM resource manager resource
  * to an sg_table.
  * @mem: The memory region.
- * @node: The resource manager node obtained from the TTM resource manager.
+ * @res: The resource manager resource obtained from the TTM resource manager.
  *
  * The gem backends typically use sg-tables for operations on the underlying
  * io_memory. So provide a way for the backends to translate the
@@ -168,8 +168,8 @@ void intel_region_ttm_fini(struct intel_memory_region *mem)
  *
  * Return: A malloced sg_table on success, an error pointer on failure.
  */
-struct sg_table *intel_region_ttm_node_to_st(struct intel_memory_region *mem,
-					     struct ttm_resource *res)
+struct sg_table *intel_region_ttm_resource_to_st(struct intel_memory_region *mem,
+						 struct ttm_resource *res)
 {
 	struct ttm_range_mgr_node *range_node =
 		container_of(res, typeof(*range_node), base);
@@ -196,9 +196,9 @@ struct sg_table *intel_region_ttm_node_to_st(struct intel_memory_region *mem,
  * Return: A valid pointer on success, an error pointer on failure.
  */
 struct ttm_resource *
-intel_region_ttm_node_alloc(struct intel_memory_region *mem,
-			    resource_size_t size,
-			    unsigned int flags)
+intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
+				resource_size_t size,
+				unsigned int flags)
 {
 	struct ttm_resource_manager *man = mem->region_private;
 	struct ttm_place place = {};
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.h b/drivers/gpu/drm/i915/intel_region_ttm.h
index 5eedcc397bd5..026c283b215a 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.h
+++ b/drivers/gpu/drm/i915/intel_region_ttm.h
@@ -24,18 +24,18 @@ void intel_region_ttm_fini(struct intel_memory_region *mem);
 
 int intel_region_to_ttm_type(const struct intel_memory_region *mem);
 
-struct sg_table *intel_region_ttm_node_to_st(struct intel_memory_region *mem,
-					     struct ttm_resource *res);
+struct sg_table *intel_region_ttm_resource_to_st(struct intel_memory_region *mem,
+						 struct ttm_resource *res);
 
-void intel_region_ttm_node_free(struct intel_memory_region *mem,
-				struct ttm_resource *node);
+void intel_region_ttm_resource_free(struct intel_memory_region *mem,
+				    struct ttm_resource *res);
 
 struct ttm_device_funcs *i915_ttm_driver(void);
 
 #ifdef CONFIG_DRM_I915_SELFTEST
 struct ttm_resource *
-intel_region_ttm_node_alloc(struct intel_memory_region *mem,
-			    resource_size_t size,
-			    unsigned int flags);
+intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
+				resource_size_t size,
+				unsigned int flags);
 #endif
 #endif /* _INTEL_REGION_TTM_H_ */
diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
index eafc5a04975c..6120d43fe504 100644
--- a/drivers/gpu/drm/i915/selftests/mock_region.c
+++ b/drivers/gpu/drm/i915/selftests/mock_region.c
@@ -16,7 +16,7 @@
 static void mock_region_put_pages(struct drm_i915_gem_object *obj,
 				  struct sg_table *pages)
 {
-	intel_region_ttm_node_free(obj->mm.region, obj->mm.st_mm_node);
+	intel_region_ttm_resource_free(obj->mm.region, obj->mm.res);
 	sg_free_table(pages);
 	kfree(pages);
 }
@@ -30,15 +30,15 @@ static int mock_region_get_pages(struct drm_i915_gem_object *obj)
 	if (obj->flags & I915_BO_ALLOC_CONTIGUOUS)
 		flags |= I915_ALLOC_CONTIGUOUS;
 
-	obj->mm.st_mm_node = intel_region_ttm_node_alloc(obj->mm.region,
-							 obj->base.size,
-							 flags);
-	if (IS_ERR(obj->mm.st_mm_node))
-		return PTR_ERR(obj->mm.st_mm_node);
+	obj->mm.res = intel_region_ttm_resource_alloc(obj->mm.region,
+						      obj->base.size,
+						      flags);
+	if (IS_ERR(obj->mm.res))
+		return PTR_ERR(obj->mm.res);
 
-	pages = intel_region_ttm_node_to_st(obj->mm.region, obj->mm.st_mm_node);
+	pages = intel_region_ttm_resource_to_st(obj->mm.region, obj->mm.res);
 	if (IS_ERR(pages)) {
-		intel_region_ttm_node_free(obj->mm.region, obj->mm.st_mm_node);
+		intel_region_ttm_resource_free(obj->mm.region, obj->mm.res);
 		return PTR_ERR(pages);
 	}
 
-- 
2.26.3

