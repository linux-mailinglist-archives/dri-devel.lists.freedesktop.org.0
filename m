Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174AC49F5C3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 09:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF1A10F566;
	Fri, 28 Jan 2022 08:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DC510F566;
 Fri, 28 Jan 2022 08:57:44 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Allow dead vm to unbind vma's without lock.
Date: Fri, 28 Jan 2022 09:57:39 +0100
Message-Id: <20220128085739.1464568-1-maarten.lankhorst@linux.intel.com>
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

i915_gem_vm_close may take the lock, and we currently have no better way
of handling this. At least for now, allow a path in which holding vm->mutex
is sufficient. This is the case, because the object destroy path will
forcefully take vm->mutex now.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index b959e904c4d3..14a301c4069f 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -40,6 +40,17 @@
 #include "i915_vma.h"
 #include "i915_vma_resource.h"
 
+static inline void assert_vma_held_evict(const struct i915_vma *vma)
+{
+	/*
+	 * We may be forced to unbind when the vm is dead, to clean it up.
+	 * This is the only exception to the requirement of the object lock
+	 * being held.
+	 */
+	if (atomic_read(&vma->vm->open))
+		assert_object_held_shared(vma->obj);
+}
+
 static struct kmem_cache *slab_vmas;
 
 static struct i915_vma *i915_vma_alloc(void)
@@ -1779,7 +1790,7 @@ struct dma_fence *__i915_vma_evict(struct i915_vma *vma, bool async)
 	struct dma_fence *unbind_fence;
 
 	GEM_BUG_ON(i915_vma_is_pinned(vma));
-	assert_object_held_shared(vma->obj);
+	assert_vma_held_evict(vma);
 
 	if (i915_vma_is_map_and_fenceable(vma)) {
 		/* Force a pagefault for domain tracking on next user access */
@@ -1846,7 +1857,7 @@ int __i915_vma_unbind(struct i915_vma *vma)
 	int ret;
 
 	lockdep_assert_held(&vma->vm->mutex);
-	assert_object_held_shared(vma->obj);
+	assert_vma_held_evict(vma);
 
 	if (!drm_mm_node_allocated(&vma->node))
 		return 0;
-- 
2.34.1

