Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DC3C25E58
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 16:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF40110EBD5;
	Fri, 31 Oct 2025 15:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WGEsVEqy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D8410E2E5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761925711;
 bh=wtzzfHVQ4fKa9zSeKxQKsi753CH3o2CMIkOUPW7jXSY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WGEsVEqyb67VIG/G9AT+K/8Xr1LuuiAYWvPCDhKtmkTF6EV5eI0QiyqlfyzS0aVUP
 TE1N2rfUCqQQ/9MNA1vSrs8Ch22mpLKUDgV+zdExPQFAdUBuZfPhGgPnaqxnx4MFvp
 2lSlHneHo00LAhOU08UPj1o6s8792xqKibpv84l98BHpfZWP9zf7ct/WnHJh6zzGPk
 Y9JiK89SklWN5kg7+nkLy0r1RND9IDWOGenVL/gb/isp+BCAYLYauyKVB6MYz26QgM
 0Ut/wuBq6l/4buV8O1LkU6gxhby1VPaxeIp/LoEz4Zs0Wc2rJaXJBRE9UptS2nntgT
 YT5ChXOpo+33A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 57B8F17E1408;
 Fri, 31 Oct 2025 16:48:31 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Lars-Ivar Hesselberg Simonsen <lars-ivar.simonsen@arm.com>,
 kernel@collabora.com
Subject: [PATCH v1 3/4] drm/panthor: Make panthor_vm_[un]map_pages() more
 robust
Date: Fri, 31 Oct 2025 16:48:17 +0100
Message-ID: <20251031154818.821054-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031154818.821054-1-boris.brezillon@collabora.com>
References: <20251031154818.821054-1-boris.brezillon@collabora.com>
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

There's no reason for panthor_vm_[un]map_pages() to fail unless the
drm_gpuvm state and the page table are out of sync, so let's reflect that
by making panthor_vm_unmap_pages() a void function and adding
WARN_ON()s in various places. We also try to recover from those
unexpected mismatch by checking for already unmapped ranges and skipping
them. But there's only so much we can do to try and cope with such
SW bugs, so when we see a mismatch, we flag the VM unusable and disable
the AS to avoid further GPU accesses to the memory.

It could be that the as_disable() call fails because the MMU unit is
stuck, in which case the whole GPU is frozen, and only a GPU reset can
unblock things. Ater the reset, the VM will be seen as unusable and
any attempt to re-use it will fail, so we should be covered for any
use-after-unmap issues.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 82 ++++++++++++++++++---------
 1 file changed, 55 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index ea886c8ac97f..a4f3ed04b5cc 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -846,12 +846,32 @@ static size_t get_pgsize(u64 addr, size_t size, size_t *count)
 	return SZ_2M;
 }
 
-static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
+static void panthor_vm_declare_unusable(struct panthor_vm *vm)
+{
+	struct panthor_device *ptdev = vm->ptdev;
+	int cookie;
+
+	if (vm->unusable)
+		return;
+
+	vm->unusable = true;
+	mutex_unlock(&ptdev->mmu->as.slots_lock);
+	if (vm->as.id >= 0 && drm_dev_enter(&ptdev->base, &cookie)) {
+		panthor_mmu_as_disable(ptdev, vm->as.id);
+		drm_dev_exit(cookie);
+	}
+	mutex_unlock(&ptdev->mmu->as.slots_lock);
+}
+
+static void panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
 {
 	struct panthor_device *ptdev = vm->ptdev;
 	struct io_pgtable_ops *ops = vm->pgtbl_ops;
 	u64 offset = 0;
 
+	if (!size)
+		return;
+
 	drm_WARN_ON(&ptdev->base,
 		    (iova < vm->locked_region.start) ||
 		    (iova + size > vm->locked_region.start + vm->locked_region.size));
@@ -862,18 +882,32 @@ static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
 		size_t pgsize = get_pgsize(iova + offset, size - offset, &pgcount);
 
 		unmapped_sz = ops->unmap_pages(ops, iova + offset, pgsize, pgcount, NULL);
+		if (drm_WARN_ON_ONCE(&ptdev->base, unmapped_sz != pgsize * pgcount)) {
+			/* Gracefully handle sparsely unmapped regions to avoid leaving
+			 * page table pages behind when the drm_gpuvm and VM page table
+			 * are out-of-sync. This is not supposed to happen, hence the
+			 * above WARN_ON().
+			 */
+			while (!ops->iova_to_phys(ops, iova + unmapped_sz) &&
+			       unmapped_sz < pgsize * pgcount)
+				unmapped_sz += SZ_4K;
 
-		if (drm_WARN_ON(&ptdev->base, unmapped_sz != pgsize * pgcount)) {
-			drm_err(&ptdev->base, "failed to unmap range %llx-%llx (requested range %llx-%llx)\n",
-				iova + offset + unmapped_sz,
-				iova + offset + pgsize * pgcount,
-				iova, iova + size);
-			return  -EINVAL;
+			/* We're passed the point where we can try to fix things,
+			 * so flag the VM unusable to make sure it's not going
+			 * to be used anymore.
+			 */
+			panthor_vm_declare_unusable(vm);
+
+			/* If we don't make progress, we're screwed. That also means
+			 * something else prevents us from unmapping the region, but
+			 * there's not much we can do here: time for debugging.
+			 */
+			if (drm_WARN_ON_ONCE(&ptdev->base, !unmapped_sz))
+				return;
 		}
+
 		offset += unmapped_sz;
 	}
-
-	return 0;
 }
 
 static int
@@ -921,16 +955,17 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
 			paddr += mapped;
 			len -= mapped;
 
-			if (drm_WARN_ON(&ptdev->base, !ret && !mapped))
+			/* If nothing was mapped, consider it an ENOMEM. */
+			if (!ret && !mapped)
 				ret = -ENOMEM;
 
-			if (ret) {
-				/* If something failed, unmap what we've already mapped before
-				 * returning. The unmap call is not supposed to fail.
+			/* If something fails, we stop there, and flag the VM unusable. */
+			if (drm_WARN_ON_ONCE(&ptdev->base, ret)) {
+				/* Unmap what we've already mapped to avoid leaving page
+				 * table pages behind.
 				 */
-				drm_WARN_ON(&ptdev->base,
-					    panthor_vm_unmap_pages(vm, start_iova,
-								   iova - start_iova));
+				panthor_vm_unmap_pages(vm, start_iova, iova - start_iova);
+				panthor_vm_declare_unusable(vm);
 				return ret;
 			}
 		}
@@ -2092,12 +2127,9 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
 	struct panthor_vm_op_ctx *op_ctx = vm->op_ctx;
 	struct panthor_vma *prev_vma = NULL, *next_vma = NULL;
 	u64 unmap_start, unmap_range;
-	int ret;
 
 	drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
-	ret = panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
-	if (ret)
-		return ret;
+	panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
 
 	if (op->remap.prev) {
 		prev_vma = panthor_vm_op_ctx_get_vma(op_ctx);
@@ -2137,13 +2169,9 @@ static int panthor_gpuva_sm_step_unmap(struct drm_gpuva_op *op,
 {
 	struct panthor_vma *unmap_vma = container_of(op->unmap.va, struct panthor_vma, base);
 	struct panthor_vm *vm = priv;
-	int ret;
-
-	ret = panthor_vm_unmap_pages(vm, unmap_vma->base.va.addr,
-				     unmap_vma->base.va.range);
-	if (drm_WARN_ON(&vm->ptdev->base, ret))
-		return ret;
 
+	panthor_vm_unmap_pages(vm, unmap_vma->base.va.addr,
+			       unmap_vma->base.va.range);
 	drm_gpuva_unmap(&op->unmap);
 	panthor_vma_unlink(vm, unmap_vma);
 	return 0;
@@ -2223,7 +2251,7 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
 
 out:
 	if (ret && flag_vm_unusable_on_failure)
-		vm->unusable = true;
+		panthor_vm_declare_unusable(vm);
 
 	vm->op_ctx = NULL;
 	mutex_unlock(&vm->op_lock);
-- 
2.51.0

