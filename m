Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 156B84786ED
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 10:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA74810FA39;
	Fri, 17 Dec 2021 09:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CBB10FA39;
 Fri, 17 Dec 2021 09:19:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="300493335"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="300493335"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 01:19:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="683321531"
Received: from olindum-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.180])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 01:19:43 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/7] drm/i915: Require the vm mutex for i915_vma_bind()
Date: Fri, 17 Dec 2021 10:19:25 +0100
Message-Id: <20211217091929.105781-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211217091929.105781-1-thomas.hellstrom@linux.intel.com>
References: <20211217091929.105781-1-thomas.hellstrom@linux.intel.com>
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
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Protect updates of struct i915_vma flags and async binding / unbinding
with the vm::mutex. This means that i915_vma_bind() needs to assert
vm::mutex held. In order to make that possible drop the caching of
kmap_atomic() maps around i915_vma_bind().

An alternative would be to use kmap_local() but since we block cpu
unplugging during sleeps inside kmap_local() sections this may have
unwanted side-effects. Particularly since we might wait for gpu while
holding the vm mutex.

This change may theoretically increase execbuf cpu-usage on snb, but
at least on non-highmem systems that increase should be very small.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 50 ++++++++++++++++++-
 drivers/gpu/drm/i915/i915_vma.c               |  1 +
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 2213f7b613da..6013f7e18f60 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1109,6 +1109,47 @@ static inline struct i915_ggtt *cache_to_ggtt(struct reloc_cache *cache)
 	return &i915->ggtt;
 }
 
+static void reloc_cache_unmap(struct reloc_cache *cache)
+{
+	void *vaddr;
+
+	if (!cache->vaddr)
+		return;
+
+	vaddr = unmask_page(cache->vaddr);
+	if (cache->vaddr & KMAP)
+		kunmap_atomic(vaddr);
+	else
+		io_mapping_unmap_atomic((void __iomem *)vaddr);
+}
+
+static void reloc_cache_remap(struct reloc_cache *cache,
+			      struct drm_i915_gem_object *obj)
+{
+	void *vaddr;
+
+	if (!cache->vaddr)
+		return;
+
+	if (cache->vaddr & KMAP) {
+		struct page *page = i915_gem_object_get_page(obj, cache->page);
+
+		vaddr = kmap_atomic(page);
+		cache->vaddr = unmask_flags(cache->vaddr) |
+			(unsigned long)vaddr;
+	} else {
+		struct i915_ggtt *ggtt = cache_to_ggtt(cache);
+		unsigned long offset;
+
+		offset = cache->node.start;
+		if (!drm_mm_node_allocated(&cache->node))
+			offset += cache->page << PAGE_SHIFT;
+
+		cache->vaddr = (unsigned long)
+			io_mapping_map_atomic_wc(&ggtt->iomap, offset);
+	}
+}
+
 static void reloc_cache_reset(struct reloc_cache *cache, struct i915_execbuffer *eb)
 {
 	void *vaddr;
@@ -1373,10 +1414,17 @@ eb_relocate_entry(struct i915_execbuffer *eb,
 		 * batchbuffers.
 		 */
 		if (reloc->write_domain == I915_GEM_DOMAIN_INSTRUCTION &&
-		    GRAPHICS_VER(eb->i915) == 6) {
+		    GRAPHICS_VER(eb->i915) == 6 &&
+		    !i915_vma_is_bound(target->vma, I915_VMA_GLOBAL_BIND)) {
+			struct i915_vma *vma = target->vma;
+
+			reloc_cache_unmap(&eb->reloc_cache);
+			mutex_lock(&vma->vm->mutex);
 			err = i915_vma_bind(target->vma,
 					    target->vma->obj->cache_level,
 					    PIN_GLOBAL, NULL);
+			mutex_unlock(&vma->vm->mutex);
+			reloc_cache_remap(&eb->reloc_cache, ev->vma->obj);
 			if (err)
 				return err;
 		}
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 927f0d4f8e11..d792a3d0da7a 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -398,6 +398,7 @@ int i915_vma_bind(struct i915_vma *vma,
 	u32 bind_flags;
 	u32 vma_flags;
 
+	lockdep_assert_held(&vma->vm->mutex);
 	GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
 	GEM_BUG_ON(vma->size > vma->node.size);
 
-- 
2.31.1

