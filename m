Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB65CBB282
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 20:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA8710E340;
	Sat, 13 Dec 2025 19:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="PyZAH2ks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28CA10E340
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 19:09:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765652937; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=akx4heNj/tJ6xJD/D9eKx31D4o5LPWfhcwwKtU6zWa3WQ7vNl05xY9LfgykpwQjOktvslDNJUNs3ZMm4GUDTqmSX2c7C/Oy7q87mQZMy4ld/kBSjdJXlWreFgm5+jbyXaJBWuIrs7Y1OX3SOkVklQxf0wX+bItuEpPfv8HQHkrk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765652937;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=qvsf70Oo8X+gG3m4aGKePHSJuRxWkWqNmnZYvw6cWk8=; 
 b=VgCjSfPhBVXNwMspbmo3/5otHtcQY2fCdFFKepJI7tA0ZGd+u6P1cgZZRcjm7UT9uAy2AB66BvhtTJ8lWv06puyaG+ydh9EIfk75JNeCXUJORb41AzjJfDnGJhwUdqIisxUvRKFGTrqBemvvsJA8NXUrTx0gX0u1RgvKKpWYXnQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765652937; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=qvsf70Oo8X+gG3m4aGKePHSJuRxWkWqNmnZYvw6cWk8=;
 b=PyZAH2ksqk53XRwWFQk7PZcwrToQZ4Xst9lnbsyn2TaA7GaMqDrf0zJin3LAC08Z
 TfF52gMeD4VbXV9iw6/MMhla4LwVo1oU3IZMSvjFQx2CUy2fxcLlIhLcCEfsVvrFjpf
 LleHjsqjMbKa83i0248326ztE5cVSHfINYXb1XGI=
Received: by mx.zohomail.com with SMTPS id 176565293632532.665479372826894;
 Sat, 13 Dec 2025 11:08:56 -0800 (PST)
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
Subject: [PATCH v3 1/1] drm/panthor: Support partial unmaps of huge pages
Date: Sat, 13 Dec 2025 19:08:33 +0000
Message-ID: <20251213190835.2444075-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251213190835.2444075-1-adrian.larumbe@collabora.com>
References: <20251213190835.2444075-1-adrian.larumbe@collabora.com>
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

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 66 +++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 183da30fa500..f11340a7f59e 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2110,6 +2110,44 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
 	return 0;
 }
 
+static bool
+iova_mapped_as_huge_page(const struct panthor_vma *vma, u64 addr)
+{
+	const struct page *pg;
+	pgoff_t bo_offset;
+
+	bo_offset = addr - vma->base.va.addr + vma->base.gem.offset;
+	pg = to_panthor_bo(vma->base.gem.obj)->base.pages[bo_offset >> PAGE_SHIFT];
+
+	return (folio_size(page_folio(pg)) >= SZ_2M);
+}
+
+static void
+get_map_unmap_intervals(const struct drm_gpuva_op_remap *op,
+			const struct panthor_vma *unmap_vma,
+			u64 *unmap_start, u64 *unmap_range)
+{
+	u64 aligned_unmap_start, aligned_unmap_end, unmap_end;
+
+	drm_gpuva_op_remap_to_unmap_range(op, unmap_start, unmap_range);
+	unmap_end = *unmap_start + *unmap_range;
+
+	aligned_unmap_start = ALIGN_DOWN(*unmap_start, SZ_2M);
+	if (op->prev && aligned_unmap_start < *unmap_start &&
+	    op->prev->va.addr <= aligned_unmap_start &&
+	    iova_mapped_as_huge_page(unmap_vma, *unmap_start)) {
+		*unmap_range += *unmap_start - aligned_unmap_start;
+		*unmap_start = aligned_unmap_start;
+	}
+
+	aligned_unmap_end = ALIGN(unmap_end, SZ_2M);
+	if (op->next && aligned_unmap_end > unmap_end &&
+	    op->next->va.addr + op->next->va.range >= aligned_unmap_end &&
+	    iova_mapped_as_huge_page(unmap_vma, unmap_end - 1)) {
+		*unmap_range += aligned_unmap_end - unmap_end;
+	}
+}
+
 static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
 				       void *priv)
 {
@@ -2121,16 +2159,44 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
 	int ret;
 
 	drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
+
+	/*
+	 * ARM IOMMU page table management code disallows partial unmaps of huge pages,
+	 * so when a partial unmap is requested, we must first unmap the entire huge
+	 * page and then remap the difference between the huge page minus the requested
+	 * unmap region. Calculating the right offsets and ranges for the different unmap
+	 * and map operations is the responsibility of the following function.
+	 */
+	get_map_unmap_intervals(&op->remap, unmap_vma, &unmap_start, &unmap_range);
+
 	ret = panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
 	if (ret)
 		return ret;
 
 	if (op->remap.prev) {
+		ret = panthor_vm_map_pages(vm, unmap_start,
+					   flags_to_prot(unmap_vma->flags),
+					   to_drm_gem_shmem_obj(op->remap.prev->gem.obj)->sgt,
+					   op->remap.prev->gem.offset +
+					   (unmap_start - op->remap.prev->va.addr),
+					   op->remap.prev->va.addr + op->remap.prev->va.range -
+					   unmap_start);
+		if (ret)
+			return ret;
+
 		prev_vma = panthor_vm_op_ctx_get_vma(op_ctx);
 		panthor_vma_init(prev_vma, unmap_vma->flags);
 	}
 
 	if (op->remap.next) {
+		ret = panthor_vm_map_pages(vm, op->remap.next->va.addr,
+					   flags_to_prot(unmap_vma->flags),
+					   to_drm_gem_shmem_obj(op->remap.next->gem.obj)->sgt,
+					   op->remap.next->gem.offset,
+					   unmap_start + unmap_range - op->remap.next->va.addr);
+		if (ret)
+			return ret;
+
 		next_vma = panthor_vm_op_ctx_get_vma(op_ctx);
 		panthor_vma_init(next_vma, unmap_vma->flags);
 	}
-- 
2.51.2

