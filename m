Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F71C89187
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501A010E58B;
	Wed, 26 Nov 2025 09:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="M3L7saUx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE9D10E592
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764150641;
 bh=RpWRzjgC6Jxel9HhveO515TU0ftwjZoND6Z87YiZ6uc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M3L7saUxyzDpaoIKsU3qolyUBHJw7E24/SlVgEpRLkirQyl3TPypNe9izIvIYGsYd
 ZrPmZ+i+f6J+L6V8cEi/gF6JSSHnc7EYlEbU1c0PPRAQrZeOK2Jdm5sF+YDuGb3NEK
 S1z5B1z6Y3sliJ8O6KBGjbd4o7Cq4HXXlrAseJGHPo0pvAvqovgr4LWiOBxE8Za0b+
 EjnL9zcHHu2M3tW1bX/SKhETpXlguLj96g8/Y0qcuKQ08R2Y6BZPG3+3ZNM2FcuYS9
 XsQbIVPREPPejWL52w4S8x9gpN9i0nTDiOklvVqcskCuZURh5GkZi/MU7Gvhl6Bbtl
 jC5ZeY36i0f5g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CB34E17E13F2;
 Wed, 26 Nov 2025 10:50:40 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>, kernel@collabora.com
Subject: [PATCH v3 5/6] drm/panthor: Make panthor_vm_[un]map_pages() more
 robust
Date: Wed, 26 Nov 2025 10:50:28 +0100
Message-ID: <20251126095029.3579267-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251126095029.3579267-1-boris.brezillon@collabora.com>
References: <20251126095029.3579267-1-boris.brezillon@collabora.com>
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

v2:
- Fix double unlock

v3:
- Collect R-b

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 82 ++++++++++++++++++---------
 1 file changed, 55 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index d0dce6510cff..d93d4bd877b3 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -842,12 +842,32 @@ static size_t get_pgsize(u64 addr, size_t size, size_t *count)
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
+	mutex_lock(&ptdev->mmu->as.slots_lock);
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
@@ -858,18 +878,32 @@ static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
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
@@ -917,16 +951,17 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
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
@@ -2110,12 +2145,9 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
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
@@ -2155,13 +2187,9 @@ static int panthor_gpuva_sm_step_unmap(struct drm_gpuva_op *op,
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
@@ -2241,7 +2269,7 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
 
 out:
 	if (ret && flag_vm_unusable_on_failure)
-		vm->unusable = true;
+		panthor_vm_declare_unusable(vm);
 
 	vm->op_ctx = NULL;
 	mutex_unlock(&vm->op_lock);
-- 
2.51.1

