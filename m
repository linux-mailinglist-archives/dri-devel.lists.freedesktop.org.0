Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742D888A29B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 14:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7587510E77C;
	Mon, 25 Mar 2024 13:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8i0EW+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0757C10E77C;
 Mon, 25 Mar 2024 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711374057; x=1742910057;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9IINeDyu00ntiv2KUCpN/k7Vb/0zYjiTVFldqn0QjUE=;
 b=M8i0EW+F9UExPimUSTFFpKlASOGDtku05vPzSLiMuIt5F2jfq3kkg6ub
 +c/FtgwSDQ5Ela5Ryt9xwIrsjlpfdJhD8aqEckgvlwYctNKNIpP39XJtb
 FhbuFvSEMsKBz86GrJIf+yQLXGmsGR1+fsS8NTjuw1yaca30hH94xGZpB
 Z8HkWxLqY0MgV3X0fe7Lh5XBPA4+hI1xjDrxe5b+n3NeBsRn/8ZC3W4Fj
 HQEzJQsknEW0dxXE2wP+mnCTsuzhqDXErCRdHuF7DYgMpeeOqVsKsIdC1
 g0cc3H7E4dK8p5ConNWRLMZ89EpRlr5I6tnoVcGLZYxL1/KCjO+fvcv+4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="17007296"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="17007296"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 06:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="16017280"
Received: from unknown (HELO intel.com) ([10.247.118.201])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 06:40:52 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: [PATCH] drm/i915/gem: Calculate object page offset for partial memory
 mapping
Date: Mon, 25 Mar 2024 14:40:33 +0100
Message-ID: <20240325134033.287913-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

To enable partial memory mapping of GPU virtual memory, it's
necessary to introduce an offset to the object's memory
(obj->mm.pages) scatterlist. This adjustment compensates for
instances when userspace mappings do not start from the beginning
of the object.

Based on a patch by Chris Wilson
<chris.p.wilson@linux.intel.com>.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c |  8 +++++---
 drivers/gpu/drm/i915/i915_mm.c           | 12 +++++++++++-
 drivers/gpu/drm/i915/i915_mm.h           |  3 ++-
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index a2195e28b625..57a2dda2c3cc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -276,7 +276,7 @@ static vm_fault_t vm_fault_cpu(struct vm_fault *vmf)
 	/* PTEs are revoked in obj->ops->put_pages() */
 	err = remap_io_sg(area,
 			  area->vm_start, area->vm_end - area->vm_start,
-			  obj->mm.pages->sgl, iomap);
+			  obj->mm.pages->sgl, 0, iomap);
 
 	if (area->vm_flags & VM_WRITE) {
 		GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
@@ -302,14 +302,16 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	bool write = area->vm_flags & VM_WRITE;
 	struct i915_gem_ww_ctx ww;
+	unsigned long obj_offset;
 	intel_wakeref_t wakeref;
 	struct i915_vma *vma;
 	pgoff_t page_offset;
 	int srcu;
 	int ret;
 
-	/* We don't use vmf->pgoff since that has the fake offset */
+	obj_offset = area->vm_pgoff - drm_vma_node_start(&mmo->vma_node);
 	page_offset = (vmf->address - area->vm_start) >> PAGE_SHIFT;
+	page_offset += obj_offset;
 
 	trace_i915_gem_object_fault(obj, page_offset, true, write);
 
@@ -404,7 +406,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 
 	/* Finally, remap it using the new GTT offset */
 	ret = remap_io_mapping(area,
-			       area->vm_start + (vma->gtt_view.partial.offset << PAGE_SHIFT),
+			       area->vm_start + ((vma->gtt_view.partial.offset - obj_offset) << PAGE_SHIFT),
 			       (ggtt->gmadr.start + i915_ggtt_offset(vma)) >> PAGE_SHIFT,
 			       min_t(u64, vma->size, area->vm_end - area->vm_start),
 			       &ggtt->iomap);
diff --git a/drivers/gpu/drm/i915/i915_mm.c b/drivers/gpu/drm/i915/i915_mm.c
index 7998bc74ab49..f5c97a620962 100644
--- a/drivers/gpu/drm/i915/i915_mm.c
+++ b/drivers/gpu/drm/i915/i915_mm.c
@@ -122,13 +122,15 @@ int remap_io_mapping(struct vm_area_struct *vma,
  * @addr: target user address to start at
  * @size: size of map area
  * @sgl: Start sg entry
+ * @offset: offset from the start of the page
  * @iobase: Use stored dma address offset by this address or pfn if -1
  *
  *  Note: this is only safe if the mm semaphore is held when called.
  */
 int remap_io_sg(struct vm_area_struct *vma,
 		unsigned long addr, unsigned long size,
-		struct scatterlist *sgl, resource_size_t iobase)
+		struct scatterlist *sgl, unsigned long offset,
+		resource_size_t iobase)
 {
 	struct remap_pfn r = {
 		.mm = vma->vm_mm,
@@ -141,6 +143,14 @@ int remap_io_sg(struct vm_area_struct *vma,
 	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
 	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
 
+	while (offset >= sg_dma_len(r.sgt.sgp) >> PAGE_SHIFT) {
+		offset -= sg_dma_len(r.sgt.sgp) >> PAGE_SHIFT;
+		r.sgt = __sgt_iter(__sg_next(r.sgt.sgp), use_dma(iobase));
+		if (!r.sgt.sgp)
+			return -EINVAL;
+	}
+	r.sgt.curr = offset << PAGE_SHIFT;
+
 	if (!use_dma(iobase))
 		flush_cache_range(vma, addr, size);
 
diff --git a/drivers/gpu/drm/i915/i915_mm.h b/drivers/gpu/drm/i915/i915_mm.h
index 04c8974d822b..69f9351b1a1c 100644
--- a/drivers/gpu/drm/i915/i915_mm.h
+++ b/drivers/gpu/drm/i915/i915_mm.h
@@ -30,6 +30,7 @@ int remap_io_mapping(struct vm_area_struct *vma,
 
 int remap_io_sg(struct vm_area_struct *vma,
 		unsigned long addr, unsigned long size,
-		struct scatterlist *sgl, resource_size_t iobase);
+		struct scatterlist *sgl, unsigned long offset,
+		resource_size_t iobase);
 
 #endif /* __I915_MM_H__ */
-- 
2.43.0

