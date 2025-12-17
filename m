Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6838ECC99B5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 22:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2B310E4FB;
	Wed, 17 Dec 2025 21:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="O0aO3iPA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71F010E4FB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 21:33:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766007189; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KWnnQ1aHzMxSfBqjvYDM6KXkx9Js3IyozgBNMprS8JFvrzrB8ulY9mK9uGX4IhZYPu8mwMOQwMXRLQMy+7nySw7HOb2aeOxyOm/WVo/b0uzGbCpCzUU7yKxuJDwIAxwxFVewbWFP3W6R3QEATw1xLz+uiflmh258vueLNOXv7lk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766007189;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=rWXtSpW5sb1IRDS5USfWQ3puaBkjepgvsKOdXgO6kZ8=; 
 b=HhjWIFRBOOs7VDHGA5OS8Zkrm5X4EsQr10BFdtYbmxCM+Y+jgdZverzC/SyoYhqwC6DbVP8/OvF6lpmpI83fX2Xf9gYGKSS1BBjLTUCkAX0w7tr/F7h9cZfZtjZdjP/eFB6I/1CO0HqN7HEiBd6+x+w0LespIQnqlUTLrEOBAPg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766007189; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=rWXtSpW5sb1IRDS5USfWQ3puaBkjepgvsKOdXgO6kZ8=;
 b=O0aO3iPAk7Y2PNoVhdyJq6TCwKAbdXwQMiSs054i8dovWk8FWzbmNGwgZfP/6Y/I
 gN2ZGp597EqNIomgoktpb3cOlY/CAXanru2XRaDQXpj1LbDhNSsp7YqDDsVS3BK9jps
 ayOFzG+dsgdS5k8zDKAoxEiJ4xVXS5LkPEWaZxbo=
Received: by mx.zohomail.com with SMTPS id 1766007188233947.7996497084682;
 Wed, 17 Dec 2025 13:33:08 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v5 1/1] drm/panthor: Support partial unmaps of huge pages
Date: Wed, 17 Dec 2025 21:32:33 +0000
Message-ID: <20251217213252.677020-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251217213252.677020-1-adrian.larumbe@collabora.com>
References: <20251217213252.677020-1-adrian.larumbe@collabora.com>
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

Commit 33729a5fc0ca ("iommu/io-pgtable-arm: Remove split on unmap
behavior") did away with the treatment of partial unmaps of huge IOPTEs.

In the case of Panthor, that means an attempt to run a VM_BIND unmap
operation on a memory region whose start address and size aren't 2MiB
aligned, in the event it intersects with a huge page, would lead to ARM
IOMMU management code to fail and a warning being raised.

Presently, and for lack of a better alternative, it's best to have
Panthor handle partial unmaps at the driver level, by unmapping entire
huge pages and remapping the difference between them and the requested
unmap region.

This could change in the future when the VM_BIND uAPI is expanded to
enforce huge page alignment and map/unmap operational constraints that
render this code unnecessary.

When a partial unmap for a huge PTE is attempted, we also need to expand
the locked region to encompass whole huge pages.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 100 +++++++++++++++++++++++---
 1 file changed, 92 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index a3e5e77fc9ed..2148e3a0bd31 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -547,12 +547,12 @@ static int as_send_cmd_and_wait(struct panthor_device *ptdev, u32 as_nr, u32 cmd
 	return status;
 }
 
-static u64 pack_region_range(struct panthor_device *ptdev, u64 region_start, u64 size)
+static u64 pack_region_range(struct panthor_device *ptdev, u64 *region_start, u64 *size)
 {
 	u8 region_width;
-	u64 region_end = region_start + size;
+	u64 region_end = *region_start + *size;
 
-	if (drm_WARN_ON_ONCE(&ptdev->base, !size))
+	if (drm_WARN_ON_ONCE(&ptdev->base, !*size))
 		return 0;
 
 	/*
@@ -563,16 +563,17 @@ static u64 pack_region_range(struct panthor_device *ptdev, u64 region_start, u64
 	 * change, the desired region starts with this bit (and subsequent bits)
 	 * zeroed and ends with the bit (and subsequent bits) set to one.
 	 */
-	region_width = max(fls64(region_start ^ (region_end - 1)),
+	region_width = max(fls64(*region_start ^ (region_end - 1)),
 			   const_ilog2(AS_LOCK_REGION_MIN_SIZE)) - 1;
 
 	/*
 	 * Mask off the low bits of region_start (which would be ignored by
 	 * the hardware anyway)
 	 */
-	region_start &= GENMASK_ULL(63, region_width);
+	*region_start &= GENMASK_ULL(63, region_width);
+	*size = 1ull << (region_width + 1);
 
-	return region_width | region_start;
+	return region_width | *region_start;
 }
 
 static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
@@ -1691,12 +1692,19 @@ static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
 	struct panthor_device *ptdev = vm->ptdev;
 	int ret = 0;
 
+	/* sm_step_remap() can call panthor_vm_lock_region() to account for
+	 * the wider unmap needed when doing a partial huge page unamp. We
+	 * need to ignore the lock if it's already part of the locked region.
+	 */
+	if (start >= vm->locked_region.start &&
+	    start + size <= vm->locked_region.start + vm->locked_region.size)
+		return 0;
+
 	mutex_lock(&ptdev->mmu->as.slots_lock);
-	drm_WARN_ON(&ptdev->base, vm->locked_region.start || vm->locked_region.size);
 	if (vm->as.id >= 0 && size) {
 		/* Lock the region that needs to be updated */
 		gpu_write64(ptdev, AS_LOCKADDR(vm->as.id),
-			    pack_region_range(ptdev, start, size));
+			    pack_region_range(ptdev, &start, &size));
 
 		/* If the lock succeeded, update the locked_region info. */
 		ret = as_send_cmd_and_wait(ptdev, vm->as.id, AS_COMMAND_LOCK);
@@ -2169,6 +2177,48 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
 	return 0;
 }
 
+static bool
+iova_mapped_as_huge_page(struct drm_gpuva_op_map *op, u64 addr)
+{
+	const struct page *pg;
+	pgoff_t bo_offset;
+
+	bo_offset = addr - op->va.addr + op->gem.offset;
+	pg = to_panthor_bo(op->gem.obj)->base.pages[bo_offset >> PAGE_SHIFT];
+
+	return folio_size(page_folio(pg)) >= SZ_2M;
+}
+
+static void
+unmap_hugepage_align(const struct drm_gpuva_op_remap *op,
+		     u64 *unmap_start, u64 *unmap_range)
+{
+	u64 aligned_unmap_start, aligned_unmap_end, unmap_end;
+
+	unmap_end = *unmap_start + *unmap_range;
+	aligned_unmap_start = ALIGN_DOWN(*unmap_start, SZ_2M);
+	aligned_unmap_end = ALIGN(unmap_end, SZ_2M);
+
+	/* If we're dealing with a huge page, make sure the unmap region is
+	 * aligned on the start of the page.
+	 */
+	if (op->prev && aligned_unmap_start < *unmap_start &&
+	    op->prev->va.addr <= aligned_unmap_start &&
+	    iova_mapped_as_huge_page(op->prev, *unmap_start)) {
+		*unmap_range += *unmap_start - aligned_unmap_start;
+		*unmap_start = aligned_unmap_start;
+	}
+
+	/* If we're dealing with a huge page, make sure the unmap region is
+	 * aligned on the end of the page.
+	 */
+	if (op->next && aligned_unmap_end > unmap_end &&
+	    op->next->va.addr + op->next->va.range >= aligned_unmap_end &&
+	    iova_mapped_as_huge_page(op->next, unmap_end - 1)) {
+		*unmap_range += aligned_unmap_end - unmap_end;
+	}
+}
+
 static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
 				       void *priv)
 {
@@ -2177,16 +2227,50 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
 	struct panthor_vm_op_ctx *op_ctx = vm->op_ctx;
 	struct panthor_vma *prev_vma = NULL, *next_vma = NULL;
 	u64 unmap_start, unmap_range;
+	int ret;
 
 	drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
+
+	/*
+	 * ARM IOMMU page table management code disallows partial unmaps of huge pages,
+	 * so when a partial unmap is requested, we must first unmap the entire huge
+	 * page and then remap the difference between the huge page minus the requested
+	 * unmap region. Calculating the right start address and range for the expanded
+	 * unmap operation is the responsibility of the following function.
+	 */
+	unmap_hugepage_align(&op->remap, &unmap_start, &unmap_range);
+
+	/* If the range changed, we might have to lock a wider region to guarantee
+	 * atomicity. panthor_vm_lock_region() bails out early if the new region
+	 * is already part of the locked region, so no need to do this check here.
+	 */
+	panthor_vm_lock_region(vm, unmap_start, unmap_range);
 	panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
 
 	if (op->remap.prev) {
+		struct panthor_gem_object *bo = to_panthor_bo(op->remap.prev->gem.obj);
+		u64 offset = op->remap.prev->gem.offset + unmap_start - op->remap.prev->va.addr;
+		u64 size = op->remap.prev->va.addr + op->remap.prev->va.range - unmap_start;
+
+		ret = panthor_vm_map_pages(vm, unmap_start, flags_to_prot(unmap_vma->flags),
+					   bo->base.sgt, offset, size);
+		if (ret)
+			return ret;
+
 		prev_vma = panthor_vm_op_ctx_get_vma(op_ctx);
 		panthor_vma_init(prev_vma, unmap_vma->flags);
 	}
 
 	if (op->remap.next) {
+		struct panthor_gem_object *bo = to_panthor_bo(op->remap.next->gem.obj);
+		u64 addr = op->remap.next->va.addr;
+		u64 size = unmap_start + unmap_range - op->remap.next->va.addr;
+
+		ret = panthor_vm_map_pages(vm, addr, flags_to_prot(unmap_vma->flags),
+					   bo->base.sgt, op->remap.next->gem.offset, size);
+		if (ret)
+			return ret;
+
 		next_vma = panthor_vm_op_ctx_get_vma(op_ctx);
 		panthor_vma_init(next_vma, unmap_vma->flags);
 	}
-- 
2.51.2

