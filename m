Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1013E45487E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEBD6E4B6;
	Wed, 17 Nov 2021 14:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C6C6E4B6;
 Wed, 17 Nov 2021 14:20:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="232675092"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="232675092"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 06:20:39 -0800
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="593363785"
Received: from ianock-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.140])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 06:20:38 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/6] drm/i915: Create a full object for mock_ring, v2.
Date: Wed, 17 Nov 2021 14:20:21 +0000
Message-Id: <20211117142024.1043017-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211117142024.1043017-1-matthew.auld@intel.com>
References: <20211117142024.1043017-1-matthew.auld@intel.com>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

This allows us to finally get rid of all the assumptions that vma->obj
is NULL.

Changes since v1:
- Ensure the mock_ring vma is pinned to prevent a fault.
- Pin it high to avoid failure in evict_for_vma selftest.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gt/mock_engine.c | 38 ++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index 8b89215afe46..bb99fc03f503 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -35,9 +35,31 @@ static void mock_timeline_unpin(struct intel_timeline *tl)
 	atomic_dec(&tl->pin_count);
 }
 
+static struct i915_vma *create_ring_vma(struct i915_ggtt *ggtt, int size)
+{
+	struct i915_address_space *vm = &ggtt->vm;
+	struct drm_i915_private *i915 = vm->i915;
+	struct drm_i915_gem_object *obj;
+	struct i915_vma *vma;
+
+	obj = i915_gem_object_create_internal(i915, size);
+	if (IS_ERR(obj))
+		return ERR_CAST(obj);
+
+	vma = i915_vma_instance(obj, vm, NULL);
+	if (IS_ERR(vma))
+		goto err;
+
+	return vma;
+
+err:
+	i915_gem_object_put(obj);
+	return vma;
+}
+
 static struct intel_ring *mock_ring(struct intel_engine_cs *engine)
 {
-	const unsigned long sz = PAGE_SIZE / 2;
+	const unsigned long sz = PAGE_SIZE;
 	struct intel_ring *ring;
 
 	ring = kzalloc(sizeof(*ring) + sz, GFP_KERNEL);
@@ -50,15 +72,11 @@ static struct intel_ring *mock_ring(struct intel_engine_cs *engine)
 	ring->vaddr = (void *)(ring + 1);
 	atomic_set(&ring->pin_count, 1);
 
-	ring->vma = i915_vma_alloc();
-	if (!ring->vma) {
+	ring->vma = create_ring_vma(engine->gt->ggtt, PAGE_SIZE);
+	if (IS_ERR(ring->vma)) {
 		kfree(ring);
 		return NULL;
 	}
-	i915_active_init(&ring->vma->active, NULL, NULL, 0);
-	__set_bit(I915_VMA_GGTT_BIT, __i915_vma_flags(ring->vma));
-	__set_bit(DRM_MM_NODE_ALLOCATED_BIT, &ring->vma->node.flags);
-	ring->vma->node.size = sz;
 
 	intel_ring_update_space(ring);
 
@@ -67,8 +85,7 @@ static struct intel_ring *mock_ring(struct intel_engine_cs *engine)
 
 static void mock_ring_free(struct intel_ring *ring)
 {
-	i915_active_fini(&ring->vma->active);
-	i915_vma_free(ring->vma);
+	i915_vma_put(ring->vma);
 
 	kfree(ring);
 }
@@ -125,6 +142,7 @@ static void mock_context_unpin(struct intel_context *ce)
 
 static void mock_context_post_unpin(struct intel_context *ce)
 {
+	i915_vma_unpin(ce->ring->vma);
 }
 
 static void mock_context_destroy(struct kref *ref)
@@ -169,7 +187,7 @@ static int mock_context_alloc(struct intel_context *ce)
 static int mock_context_pre_pin(struct intel_context *ce,
 				struct i915_gem_ww_ctx *ww, void **unused)
 {
-	return 0;
+	return i915_vma_pin_ww(ce->ring->vma, ww, 0, 0, PIN_GLOBAL | PIN_HIGH);
 }
 
 static int mock_context_pin(struct intel_context *ce, void *unused)
-- 
2.31.1

