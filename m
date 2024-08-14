Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C60951C2B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 15:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D002610E493;
	Wed, 14 Aug 2024 13:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqNduPhc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF7710E493;
 Wed, 14 Aug 2024 13:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723643363; x=1755179363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J3/NYcyQ3JJjSC43GYwuTYf9llBevuT7wY09LyINcLY=;
 b=cqNduPhckYwtJ+rWXK2jPYEKnCtNISTReAINMRdQGYyLwRiNhKaUGbI9
 sCOkpEn0xWF/2Nku0kIaUGdVY1h1OyiR/uswEpwqztjreMh+CvDiEaE//
 I4seV+yJDHY9q85XyEvRFk3Ni3OisusMvZUar1+hpOzp4MZnIlrIMcMql
 +WMDRpNNg/QXL2JyMNE/FCjiT2Cm2yBip6SP/rjgkx/JtPArBK71Ezs9u
 WpzCyzV5VnG7E5po/bdQQRfUvD4nrr55ajmnt+csbY4u6FnyYpK17PPZq
 uQjIB7uu5dym6zQ/cjuLmYhgeiScEwRSly38BloKhicUj71z9ukr0PXl9 w==;
X-CSE-ConnectionGUID: 6yZJ8do7T0eIFYAVHkrOlw==
X-CSE-MsgGUID: VLRCHxfFRVaFlI7AR+2maQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22017060"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="22017060"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:49:22 -0700
X-CSE-ConnectionGUID: /1j7XLzxSR29ZiWRp0xoRQ==
X-CSE-MsgGUID: 8IoQ11PPSbai7P/O4eWaVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="63900913"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.62])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:49:19 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sima <daniel.vetter@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v2 2/2] drm/i915/gem: Calculate object page offset for partial
 memory mapping
Date: Wed, 14 Aug 2024 15:48:37 +0200
Message-ID: <20240814134837.116498-6-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240814134837.116498-1-andi.shyti@linux.intel.com>
References: <20240814134837.116498-1-andi.shyti@linux.intel.com>
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

Based on a patch by Chris Wilson.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c |  4 +++-
 drivers/gpu/drm/i915/i915_mm.c           | 12 +++++++++++-
 drivers/gpu/drm/i915/i915_mm.h           |  3 ++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 99fde0a05632..21274aa9bddd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -252,6 +252,7 @@ static vm_fault_t vm_fault_cpu(struct vm_fault *vmf)
 	struct vm_area_struct *area = vmf->vma;
 	struct i915_mmap_offset *mmo = area->vm_private_data;
 	struct drm_i915_gem_object *obj = mmo->obj;
+	unsigned long obj_offset;
 	resource_size_t iomap;
 	int err;
 
@@ -273,10 +274,11 @@ static vm_fault_t vm_fault_cpu(struct vm_fault *vmf)
 		iomap -= obj->mm.region->region.start;
 	}
 
+	obj_offset = area->vm_pgoff - drm_vma_node_start(&mmo->vma_node);
 	/* PTEs are revoked in obj->ops->put_pages() */
 	err = remap_io_sg(area,
 			  area->vm_start, area->vm_end - area->vm_start,
-			  obj->mm.pages->sgl, iomap);
+			  obj->mm.pages->sgl, obj_offset, iomap);
 
 	if (area->vm_flags & VM_WRITE) {
 		GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
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
2.45.2

