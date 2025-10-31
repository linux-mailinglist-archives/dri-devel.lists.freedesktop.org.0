Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493FEC25E52
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 16:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812B710EB7D;
	Fri, 31 Oct 2025 15:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DtcHp7zr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9273810E2E5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761925711;
 bh=3HrWaSq010UjRAMVv2axc51zLFtlbfHeQqB7xP6Eadg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DtcHp7zr+3uH9NoRCSLMIYumWmaNUnClC9UG+D121btWw0NQ/M/RhZdSFGoGlxGEo
 jMc0UZwOoYWlS5FcTCzpGGRWcUWMhkruYWig/13c3OiZT7RTU5RBUp6FObX7tDICqK
 vLEv8Vu/p6bZzeyzE9eQRKZR22gB03BII43YiskpxsDpbCOuGjzyVMSFktiX2XkLQG
 X8Nwp6R1Pcyxl0mbCcK9IjOOSjw6k5QMD3iJvx+w6FL4AhO5f7Pu0oYtfz+gb2jDDU
 F+p8bF8rahuFe2yZ70mR/S0ub0pyVAxG7YEyyzqnULgj01RXlESTuUTrBAQVMv2lZB
 CZxgnnUw7Aevg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DCCAF17E1406;
 Fri, 31 Oct 2025 16:48:30 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Lars-Ivar Hesselberg Simonsen <lars-ivar.simonsen@arm.com>,
 kernel@collabora.com
Subject: [PATCH v1 2/4] drm/panthor: Add support for atomic page table updates
Date: Fri, 31 Oct 2025 16:48:16 +0100
Message-ID: <20251031154818.821054-3-boris.brezillon@collabora.com>
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

Move the lock/flush_mem operations around the gpuvm_sm_[un]map() calls
so we can implement true atomic page updates, where any access in the
locked range done by the GPU has to wait for the page table updates
to land before proceeding.

This is needed for vkQueueBindSparse(), so we can replace the dummy
page mapped over the entire object by actual BO backed pages in an atomic
way. But it's also useful to avoid "AS_ACTIVE bit stuck" failures in
the sm_[un]map() path, leading to gpuvm state inconsistencies.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 182 +++++++++++++-------------
 1 file changed, 90 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 58fead90533a..ea886c8ac97f 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -389,6 +389,15 @@ struct panthor_vm {
 	 * flagged as faulty as a result.
 	 */
 	bool unhandled_fault;
+
+	/** @locked_region: Information about the currently locked region currently. */
+	struct {
+		/** @locked_region.start: Start of the locked region. */
+		u64 start;
+
+		/** @locked_region.size: Size of the locked region. */
+		u64 size;
+	} locked_region;
 };
 
 /**
@@ -570,79 +579,9 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
-static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
-				      u64 iova, u64 size, u32 op)
-{
-	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
-	u32 lsc_flush_op;
-	int ret;
-
-	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
-
-	switch (op) {
-	case AS_COMMAND_FLUSH_MEM:
-		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
-		break;
-	case AS_COMMAND_FLUSH_PT:
-		lsc_flush_op = 0;
-		break;
-	default:
-		drm_WARN(&ptdev->base, 1, "Unexpected AS_COMMAND: %d", op);
-		return -EINVAL;
-	}
-
-	if (as_nr < 0)
-		return 0;
-
-	/*
-	 * If the AS number is greater than zero, then we can be sure
-	 * the device is up and running, so we don't need to explicitly
-	 * power it up
-	 */
-
-	lock_region(ptdev, as_nr, iova, size);
-
-	ret = wait_ready(ptdev, as_nr);
-	if (ret)
-		return ret;
-
-	ret = panthor_gpu_flush_caches(ptdev, l2_flush_op, lsc_flush_op, 0);
-	if (ret)
-		return ret;
-
-	/*
-	 * Explicitly unlock the region as the AS is not unlocked automatically
-	 * at the end of the GPU_CONTROL cache flush command, unlike
-	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
-	 */
-	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
-
-	/* Wait for the unlock command to complete */
-	return wait_ready(ptdev, as_nr);
-}
-
-static int mmu_hw_do_operation(struct panthor_vm *vm,
-			       u64 iova, u64 size, u32 op)
-{
-	struct panthor_device *ptdev = vm->ptdev;
-	int ret;
-
-	mutex_lock(&ptdev->mmu->as.slots_lock);
-	ret = mmu_hw_do_operation_locked(ptdev, vm->as.id, iova, size, op);
-	mutex_unlock(&ptdev->mmu->as.slots_lock);
-
-	return ret;
-}
-
 static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 				 u64 transtab, u64 transcfg, u64 memattr)
 {
-	int ret;
-
-	ret = mmu_hw_do_operation_locked(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
-	if (ret)
-		return ret;
-
 	gpu_write64(ptdev, AS_TRANSTAB(as_nr), transtab);
 	gpu_write64(ptdev, AS_MEMATTR(as_nr), memattr);
 	gpu_write64(ptdev, AS_TRANSCFG(as_nr), transcfg);
@@ -654,7 +593,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 {
 	int ret;
 
-	ret = mmu_hw_do_operation_locked(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
+	/* Flush and invalidate all caches. */
+	write_cmd(ptdev, as_nr, AS_COMMAND_FLUSH_MEM);
+	ret = wait_ready(ptdev, as_nr);
 	if (ret)
 		return ret;
 
@@ -736,6 +677,10 @@ int panthor_vm_active(struct panthor_vm *vm)
 	if (refcount_inc_not_zero(&vm->as.active_cnt))
 		goto out_dev_exit;
 
+	/* Make sure we don't race with lock/unlock_region() calls
+	 * happening around VM bind operations.
+	 */
+	mutex_lock(&vm->op_lock);
 	mutex_lock(&ptdev->mmu->as.slots_lock);
 
 	if (refcount_inc_not_zero(&vm->as.active_cnt))
@@ -803,6 +748,10 @@ int panthor_vm_active(struct panthor_vm *vm)
 		gpu_write(ptdev, MMU_INT_MASK, ~ptdev->mmu->as.faulty_mask);
 	}
 
+	/* The VM update is guarded by ::op_lock, which we take at the beginning
+	 * of this function, so we don't expect any locked region here.
+	 */
+	drm_WARN_ON(&vm->ptdev->base, vm->locked_region.size > 0);
 	ret = panthor_mmu_as_enable(vm->ptdev, vm->as.id, transtab, transcfg, vm->memattr);
 
 out_make_active:
@@ -813,6 +762,7 @@ int panthor_vm_active(struct panthor_vm *vm)
 
 out_unlock:
 	mutex_unlock(&ptdev->mmu->as.slots_lock);
+	mutex_unlock(&vm->op_lock);
 
 out_dev_exit:
 	drm_dev_exit(cookie);
@@ -896,30 +846,15 @@ static size_t get_pgsize(u64 addr, size_t size, size_t *count)
 	return SZ_2M;
 }
 
-static int panthor_vm_flush_range(struct panthor_vm *vm, u64 iova, u64 size)
-{
-	struct panthor_device *ptdev = vm->ptdev;
-	int ret = 0, cookie;
-
-	if (vm->as.id < 0)
-		return 0;
-
-	/* If the device is unplugged, we just silently skip the flush. */
-	if (!drm_dev_enter(&ptdev->base, &cookie))
-		return 0;
-
-	ret = mmu_hw_do_operation(vm, iova, size, AS_COMMAND_FLUSH_PT);
-
-	drm_dev_exit(cookie);
-	return ret;
-}
-
 static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
 {
 	struct panthor_device *ptdev = vm->ptdev;
 	struct io_pgtable_ops *ops = vm->pgtbl_ops;
 	u64 offset = 0;
 
+	drm_WARN_ON(&ptdev->base,
+		    (iova < vm->locked_region.start) ||
+		    (iova + size > vm->locked_region.start + vm->locked_region.size));
 	drm_dbg(&ptdev->base, "unmap: as=%d, iova=%llx, len=%llx", vm->as.id, iova, size);
 
 	while (offset < size) {
@@ -933,13 +868,12 @@ static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
 				iova + offset + unmapped_sz,
 				iova + offset + pgsize * pgcount,
 				iova, iova + size);
-			panthor_vm_flush_range(vm, iova, offset + unmapped_sz);
 			return  -EINVAL;
 		}
 		offset += unmapped_sz;
 	}
 
-	return panthor_vm_flush_range(vm, iova, size);
+	return 0;
 }
 
 static int
@@ -956,6 +890,10 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
 	if (!size)
 		return 0;
 
+	drm_WARN_ON(&ptdev->base,
+		    (iova < vm->locked_region.start) ||
+		    (iova + size > vm->locked_region.start + vm->locked_region.size));
+
 	for_each_sgtable_dma_sg(sgt, sgl, count) {
 		dma_addr_t paddr = sg_dma_address(sgl);
 		size_t len = sg_dma_len(sgl);
@@ -1003,7 +941,7 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
 		offset = 0;
 	}
 
-	return panthor_vm_flush_range(vm, start_iova, iova - start_iova);
+	return 0;
 }
 
 static int flags_to_prot(u32 flags)
@@ -1672,6 +1610,56 @@ static const char *access_type_name(struct panthor_device *ptdev,
 	}
 }
 
+static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
+{
+	struct panthor_device *ptdev = vm->ptdev;
+	int ret = 0;
+
+	mutex_lock(&ptdev->mmu->as.slots_lock);
+	drm_WARN_ON(&ptdev->base, vm->locked_region.start || vm->locked_region.size);
+	vm->locked_region.start = start;
+	vm->locked_region.size = size;
+	if (vm->as.id >= 0) {
+		lock_region(ptdev, vm->as.id, start, size);
+
+		/* If the lock failed, reset the locked region. */
+		ret = wait_ready(ptdev, vm->as.id);
+		if (ret) {
+			vm->locked_region.start = 0;
+			vm->locked_region.size = 0;
+		}
+	}
+	mutex_unlock(&ptdev->mmu->as.slots_lock);
+
+	return ret;
+}
+
+static void panthor_vm_unlock_region(struct panthor_vm *vm)
+{
+	struct panthor_device *ptdev = vm->ptdev;
+
+	mutex_lock(&ptdev->mmu->as.slots_lock);
+	if (vm->as.id >= 0) {
+		int ret;
+
+		/* FLUSH_MEM will flush all cache entries covering
+		 * the locked region and unlock it.
+		 */
+		ret = write_cmd(ptdev, vm->as.id, AS_COMMAND_FLUSH_MEM);
+		if (!ret)
+			ret = wait_ready(ptdev, vm->as.id);
+
+		/* If we fail to unlock the region, schedule a GPU reset
+		 * to unblock the situation.
+		 */
+		if (drm_WARN_ON(&ptdev->base, ret))
+			panthor_device_schedule_reset(ptdev);
+	}
+	vm->locked_region.start = 0;
+	vm->locked_region.size = 0;
+	mutex_unlock(&ptdev->mmu->as.slots_lock);
+}
+
 static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	bool has_unhandled_faults = false;
@@ -1876,6 +1864,7 @@ static void panthor_vm_free(struct drm_gpuvm *gpuvm)
 	drm_sched_entity_destroy(&vm->entity);
 	drm_sched_fini(&vm->sched);
 
+	mutex_lock(&vm->op_lock);
 	mutex_lock(&ptdev->mmu->as.slots_lock);
 	if (vm->as.id >= 0) {
 		int cookie;
@@ -1890,6 +1879,7 @@ static void panthor_vm_free(struct drm_gpuvm *gpuvm)
 		list_del(&vm->as.lru_node);
 	}
 	mutex_unlock(&ptdev->mmu->as.slots_lock);
+	mutex_unlock(&vm->op_lock);
 
 	free_io_pgtable_ops(vm->pgtbl_ops);
 
@@ -2197,6 +2187,11 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
 
 	mutex_lock(&vm->op_lock);
 	vm->op_ctx = op;
+
+	ret = panthor_vm_lock_region(vm, op->va.addr, op->va.range);
+	if (ret)
+		goto out;
+
 	switch (op_type) {
 	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
 		const struct drm_gpuvm_map_req map_req = {
@@ -2224,6 +2219,9 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
 		break;
 	}
 
+	panthor_vm_unlock_region(vm);
+
+out:
 	if (ret && flag_vm_unusable_on_failure)
 		vm->unusable = true;
 
-- 
2.51.0

