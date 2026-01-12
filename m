Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06CAD13335
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 15:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D1E10E3F7;
	Mon, 12 Jan 2026 14:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="dEm+SlTo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF53510E3F7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 14:38:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768228693; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=W6NuIwTwSEyo9nmfMfUzlSYM5Vp9cY/7rxevWRz0aWH5VLu4PcrXZM9kiOGHK3X6fu4ZEAS+KLNaCvDMAYx9CKJR4LhFeB9IyZ06ZasTRgIuACPPDvvV6lo3bp0rJaHscJ8ztXVvbTuvle0/SJ7ErUptuG4Kx+BcB5H+05rSlZ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768228693;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=5pykouvTORm5H03PFBYlMCOxWWDQ2y1wB5iw7ipL3eI=; 
 b=mPPzeCmMfRavEWB9FQQK19HQcV+gbufBxlrf2+jsC48LHIbLTcjT170WJxruljsnStWBdTWKlHFU8z7l06K3lab6Wb3gfzQMKp5R5DYs7/qfhz3jad6X+iL2PNPkvXZFdYaOZgk8AvCgbHq9kz7IX2Zdprh5z152DGiTyEzbsfc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768228693; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=5pykouvTORm5H03PFBYlMCOxWWDQ2y1wB5iw7ipL3eI=;
 b=dEm+SlTofFObr48oAJTrEcgIoJ7Ttsk74HGmKduy/tjsmYZq2n/stIrVFgHgX+2l
 N0fyYKsu2W+M1XJe3okhlP5+oPGyxE9CdN7PJaO52jEvEpZ+iiEOUHjlC7M/UxaTS91
 UaMnsr2tG+tC8SFXWDKZx/rTnEqXqbFxCBZLjZS0=
Received: by mx.zohomail.com with SMTPS id 1768228692962557.2774131950727;
 Mon, 12 Jan 2026 06:38:12 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 12 Jan 2026 15:37:50 +0100
Subject: [PATCH v8 2/4] drm/panthor: Extend IRQ helpers for mask
 modification/restoration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-panthor-tracepoints-v8-2-63efcb421d22@collabora.com>
References: <20260112-panthor-tracepoints-v8-0-63efcb421d22@collabora.com>
In-Reply-To: <20260112-panthor-tracepoints-v8-0-63efcb421d22@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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

The current IRQ helpers do not guarantee mutual exclusion that covers
the entire transaction from accessing the mask member and modifying the
mask register.

This makes it hard, if not impossible, to implement mask modification
helpers that may change one of these outside the normal
suspend/resume/isr code paths.

Add a spinlock to struct panthor_irq that protects both the mask member
and register. Acquire it in all code paths that access these, but drop
it before processing the threaded handler function. Then, add the
aforementioned new helpers: enable_events, and disable_events. They work
by ORing and NANDing the mask bits.

resume is changed to no longer have a mask passed, as pirq->mask is
supposed to be the user-requested mask now, rather than a mirror of the
INT_MASK register contents. Users of the resume helper are adjusted
accordingly, including a rather painful refactor in panthor_mmu.c.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.h |  72 +++++++--
 drivers/gpu/drm/panthor/panthor_fw.c     |   3 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    |   2 +-
 drivers/gpu/drm/panthor/panthor_mmu.c    | 247 ++++++++++++++++---------------
 drivers/gpu/drm/panthor/panthor_pwr.c    |   2 +-
 5 files changed, 187 insertions(+), 139 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 424f6cd1a814..0a29234ac58c 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -84,11 +84,14 @@ struct panthor_irq {
 	/** @irq: IRQ number. */
 	int irq;
 
-	/** @mask: Current mask being applied to xxx_INT_MASK. */
+	/** @mask: Values to write to xxx_INT_MASK if active. */
 	u32 mask;
 
 	/** @state: one of &enum panthor_irq_state reflecting the current state. */
 	atomic_t state;
+
+	/** @mask_lock: protects modifications to _INT_MASK and @mask */
+	spinlock_t mask_lock;
 };
 
 /**
@@ -422,6 +425,8 @@ static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)
 	struct panthor_device *ptdev = pirq->ptdev;						\
 	enum panthor_irq_state state;								\
 												\
+	guard(spinlock_irqsave)(&pirq->mask_lock);						\
+												\
 	state = atomic_read(&pirq->state);							\
 	if (state == PANTHOR_IRQ_STATE_SUSPENDED || state == PANTHOR_IRQ_STATE_SUSPENDING)	\
 		return IRQ_NONE;								\
@@ -438,11 +443,16 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
 	struct panthor_device *ptdev = pirq->ptdev;						\
 	enum panthor_irq_state state;								\
 	irqreturn_t ret = IRQ_NONE;								\
+	u32 mask;										\
 												\
-	atomic_cmpxchg(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE, PANTHOR_IRQ_STATE_PROCESSING);	\
+	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
+		mask = pirq->mask;								\
+		atomic_cmpxchg(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE,				\
+			       PANTHOR_IRQ_STATE_PROCESSING);					\
+	}											\
 												\
 	while (true) {										\
-		u32 status = gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & pirq->mask;	\
+		u32 status = (gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & mask);		\
 												\
 		if (!status)									\
 			break;									\
@@ -451,12 +461,16 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
 		ret = IRQ_HANDLED;								\
 	}											\
 												\
-	state = atomic_read(&pirq->state);							\
-	if (state != PANTHOR_IRQ_STATE_SUSPENDED && state != PANTHOR_IRQ_STATE_SUSPENDING) {	\
-		/* Only restore the bits that were used and are still enabled */		\
-		gpu_write(ptdev, __reg_prefix ## _INT_MASK,					\
-			  gpu_read(ptdev, __reg_prefix ## _INT_MASK) | (mask & pirq->mask));	\
-		atomic_set(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE);				\
+	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
+		state = atomic_read(&pirq->state);						\
+		if (state != PANTHOR_IRQ_STATE_SUSPENDED &&					\
+		    state != PANTHOR_IRQ_STATE_SUSPENDING) {					\
+			/* Only restore the bits that were used and are still enabled */	\
+			gpu_write(ptdev, __reg_prefix ## _INT_MASK,				\
+				  gpu_read(ptdev, __reg_prefix ## _INT_MASK) |			\
+				  (mask & pirq->mask));						\
+			atomic_set(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE);			\
+		}										\
 	}											\
 												\
 	return ret;										\
@@ -464,16 +478,18 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
 												\
 static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)			\
 {												\
-	pirq->mask = 0;										\
-	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);					\
-	atomic_set(&pirq->state, PANTHOR_IRQ_STATE_SUSPENDING);					\
+	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
+		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);				\
+		atomic_set(&pirq->state, PANTHOR_IRQ_STATE_SUSPENDING);				\
+	}											\
 	synchronize_irq(pirq->irq);								\
 	atomic_set(&pirq->state, PANTHOR_IRQ_STATE_SUSPENDED);					\
 }												\
 												\
-static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u32 mask)	\
+static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq)			\
 {												\
-	pirq->mask = mask;									\
+	guard(spinlock_irqsave)(&pirq->mask_lock);						\
+												\
 	atomic_set(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE);					\
 	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, pirq->mask);				\
 	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);				\
@@ -485,13 +501,39 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
 {												\
 	pirq->ptdev = ptdev;									\
 	pirq->irq = irq;									\
-	panthor_ ## __name ## _irq_resume(pirq, mask);						\
+	pirq->mask = mask;									\
+	spin_lock_init(&pirq->mask_lock);							\
+	panthor_ ## __name ## _irq_resume(pirq);						\
 												\
 	return devm_request_threaded_irq(ptdev->base.dev, irq,					\
 					 panthor_ ## __name ## _irq_raw_handler,		\
 					 panthor_ ## __name ## _irq_threaded_handler,		\
 					 IRQF_SHARED, KBUILD_MODNAME "-" # __name,		\
 					 pirq);							\
+}												\
+												\
+static inline void panthor_ ## __name ## _irq_enable_events(struct panthor_irq *pirq, u32 mask)	\
+{												\
+	enum panthor_irq_state state;								\
+												\
+	guard(spinlock_irqsave)(&pirq->mask_lock);						\
+												\
+	state = atomic_read(&pirq->state);							\
+	pirq->mask |= mask;									\
+	if (state != PANTHOR_IRQ_STATE_SUSPENDED || state != PANTHOR_IRQ_STATE_SUSPENDING)	\
+		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
+}												\
+												\
+static inline void panthor_ ## __name ## _irq_disable_events(struct panthor_irq *pirq, u32 mask)\
+{												\
+	enum panthor_irq_state state;								\
+												\
+	guard(spinlock_irqsave)(&pirq->mask_lock);						\
+												\
+	state = atomic_read(&pirq->state);							\
+	pirq->mask &= ~mask;									\
+	if (state != PANTHOR_IRQ_STATE_SUSPENDED || state != PANTHOR_IRQ_STATE_SUSPENDING)	\
+		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
 }
 
 extern struct workqueue_struct *panthor_cleanup_wq;
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index a64ec8756bed..0e46625f7621 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1080,7 +1080,8 @@ static int panthor_fw_start(struct panthor_device *ptdev)
 	bool timedout = false;
 
 	ptdev->fw->booted = false;
-	panthor_job_irq_resume(&ptdev->fw->irq, ~0);
+	panthor_job_irq_enable_events(&ptdev->fw->irq, ~0);
+	panthor_job_irq_resume(&ptdev->fw->irq);
 	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_AUTO);
 
 	if (!wait_event_timeout(ptdev->fw->req_waitqueue,
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 057e167468d0..9304469a711a 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -395,7 +395,7 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
  */
 void panthor_gpu_resume(struct panthor_device *ptdev)
 {
-	panthor_gpu_irq_resume(&ptdev->gpu->irq, GPU_INTERRUPTS_MASK);
+	panthor_gpu_irq_resume(&ptdev->gpu->irq);
 	panthor_hw_l2_power_on(ptdev);
 }
 
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 198d59f42578..71b8318eab31 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -655,125 +655,6 @@ static void panthor_vm_release_as_locked(struct panthor_vm *vm)
 	vm->as.id = -1;
 }
 
-/**
- * panthor_vm_active() - Flag a VM as active
- * @vm: VM to flag as active.
- *
- * Assigns an address space to a VM so it can be used by the GPU/MCU.
- *
- * Return: 0 on success, a negative error code otherwise.
- */
-int panthor_vm_active(struct panthor_vm *vm)
-{
-	struct panthor_device *ptdev = vm->ptdev;
-	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
-	struct io_pgtable_cfg *cfg = &io_pgtable_ops_to_pgtable(vm->pgtbl_ops)->cfg;
-	int ret = 0, as, cookie;
-	u64 transtab, transcfg;
-
-	if (!drm_dev_enter(&ptdev->base, &cookie))
-		return -ENODEV;
-
-	if (refcount_inc_not_zero(&vm->as.active_cnt))
-		goto out_dev_exit;
-
-	/* Make sure we don't race with lock/unlock_region() calls
-	 * happening around VM bind operations.
-	 */
-	mutex_lock(&vm->op_lock);
-	mutex_lock(&ptdev->mmu->as.slots_lock);
-
-	if (refcount_inc_not_zero(&vm->as.active_cnt))
-		goto out_unlock;
-
-	as = vm->as.id;
-	if (as >= 0) {
-		/* Unhandled pagefault on this AS, the MMU was disabled. We need to
-		 * re-enable the MMU after clearing+unmasking the AS interrupts.
-		 */
-		if (ptdev->mmu->as.faulty_mask & panthor_mmu_as_fault_mask(ptdev, as))
-			goto out_enable_as;
-
-		goto out_make_active;
-	}
-
-	/* Check for a free AS */
-	if (vm->for_mcu) {
-		drm_WARN_ON(&ptdev->base, ptdev->mmu->as.alloc_mask & BIT(0));
-		as = 0;
-	} else {
-		as = ffz(ptdev->mmu->as.alloc_mask | BIT(0));
-	}
-
-	if (!(BIT(as) & ptdev->gpu_info.as_present)) {
-		struct panthor_vm *lru_vm;
-
-		lru_vm = list_first_entry_or_null(&ptdev->mmu->as.lru_list,
-						  struct panthor_vm,
-						  as.lru_node);
-		if (drm_WARN_ON(&ptdev->base, !lru_vm)) {
-			ret = -EBUSY;
-			goto out_unlock;
-		}
-
-		drm_WARN_ON(&ptdev->base, refcount_read(&lru_vm->as.active_cnt));
-		as = lru_vm->as.id;
-
-		ret = panthor_mmu_as_disable(ptdev, as, true);
-		if (ret)
-			goto out_unlock;
-
-		panthor_vm_release_as_locked(lru_vm);
-	}
-
-	/* Assign the free or reclaimed AS to the FD */
-	vm->as.id = as;
-	set_bit(as, &ptdev->mmu->as.alloc_mask);
-	ptdev->mmu->as.slots[as].vm = vm;
-
-out_enable_as:
-	transtab = cfg->arm_lpae_s1_cfg.ttbr;
-	transcfg = AS_TRANSCFG_PTW_MEMATTR_WB |
-		   AS_TRANSCFG_PTW_RA |
-		   AS_TRANSCFG_ADRMODE_AARCH64_4K |
-		   AS_TRANSCFG_INA_BITS(55 - va_bits);
-	if (ptdev->coherent)
-		transcfg |= AS_TRANSCFG_PTW_SH_OS;
-
-	/* If the VM is re-activated, we clear the fault. */
-	vm->unhandled_fault = false;
-
-	/* Unhandled pagefault on this AS, clear the fault and re-enable interrupts
-	 * before enabling the AS.
-	 */
-	if (ptdev->mmu->as.faulty_mask & panthor_mmu_as_fault_mask(ptdev, as)) {
-		gpu_write(ptdev, MMU_INT_CLEAR, panthor_mmu_as_fault_mask(ptdev, as));
-		ptdev->mmu->as.faulty_mask &= ~panthor_mmu_as_fault_mask(ptdev, as);
-		ptdev->mmu->irq.mask |= panthor_mmu_as_fault_mask(ptdev, as);
-		gpu_write(ptdev, MMU_INT_MASK, ~ptdev->mmu->as.faulty_mask);
-	}
-
-	/* The VM update is guarded by ::op_lock, which we take at the beginning
-	 * of this function, so we don't expect any locked region here.
-	 */
-	drm_WARN_ON(&vm->ptdev->base, vm->locked_region.size > 0);
-	ret = panthor_mmu_as_enable(vm->ptdev, vm->as.id, transtab, transcfg, vm->memattr);
-
-out_make_active:
-	if (!ret) {
-		refcount_set(&vm->as.active_cnt, 1);
-		list_del_init(&vm->as.lru_node);
-	}
-
-out_unlock:
-	mutex_unlock(&ptdev->mmu->as.slots_lock);
-	mutex_unlock(&vm->op_lock);
-
-out_dev_exit:
-	drm_dev_exit(cookie);
-	return ret;
-}
-
 /**
  * panthor_vm_idle() - Flag a VM idle
  * @vm: VM to flag as idle.
@@ -1762,6 +1643,128 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 }
 PANTHOR_IRQ_HANDLER(mmu, MMU, panthor_mmu_irq_handler);
 
+/**
+ * panthor_vm_active() - Flag a VM as active
+ * @vm: VM to flag as active.
+ *
+ * Assigns an address space to a VM so it can be used by the GPU/MCU.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int panthor_vm_active(struct panthor_vm *vm)
+{
+	struct panthor_device *ptdev = vm->ptdev;
+	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
+	struct io_pgtable_cfg *cfg = &io_pgtable_ops_to_pgtable(vm->pgtbl_ops)->cfg;
+	int ret = 0, as, cookie;
+	u64 transtab, transcfg;
+	u32 fault_mask;
+
+	if (!drm_dev_enter(&ptdev->base, &cookie))
+		return -ENODEV;
+
+	if (refcount_inc_not_zero(&vm->as.active_cnt))
+		goto out_dev_exit;
+
+	/* Make sure we don't race with lock/unlock_region() calls
+	 * happening around VM bind operations.
+	 */
+	mutex_lock(&vm->op_lock);
+	mutex_lock(&ptdev->mmu->as.slots_lock);
+
+	if (refcount_inc_not_zero(&vm->as.active_cnt))
+		goto out_unlock;
+
+	as = vm->as.id;
+	if (as >= 0) {
+		/* Unhandled pagefault on this AS, the MMU was disabled. We need to
+		 * re-enable the MMU after clearing+unmasking the AS interrupts.
+		 */
+		if (ptdev->mmu->as.faulty_mask & panthor_mmu_as_fault_mask(ptdev, as))
+			goto out_enable_as;
+
+		goto out_make_active;
+	}
+
+	/* Check for a free AS */
+	if (vm->for_mcu) {
+		drm_WARN_ON(&ptdev->base, ptdev->mmu->as.alloc_mask & BIT(0));
+		as = 0;
+	} else {
+		as = ffz(ptdev->mmu->as.alloc_mask | BIT(0));
+	}
+
+	if (!(BIT(as) & ptdev->gpu_info.as_present)) {
+		struct panthor_vm *lru_vm;
+
+		lru_vm = list_first_entry_or_null(&ptdev->mmu->as.lru_list,
+						  struct panthor_vm,
+						  as.lru_node);
+		if (drm_WARN_ON(&ptdev->base, !lru_vm)) {
+			ret = -EBUSY;
+			goto out_unlock;
+		}
+
+		drm_WARN_ON(&ptdev->base, refcount_read(&lru_vm->as.active_cnt));
+		as = lru_vm->as.id;
+
+		ret = panthor_mmu_as_disable(ptdev, as, true);
+		if (ret)
+			goto out_unlock;
+
+		panthor_vm_release_as_locked(lru_vm);
+	}
+
+	/* Assign the free or reclaimed AS to the FD */
+	vm->as.id = as;
+	set_bit(as, &ptdev->mmu->as.alloc_mask);
+	ptdev->mmu->as.slots[as].vm = vm;
+
+out_enable_as:
+	transtab = cfg->arm_lpae_s1_cfg.ttbr;
+	transcfg = AS_TRANSCFG_PTW_MEMATTR_WB |
+		   AS_TRANSCFG_PTW_RA |
+		   AS_TRANSCFG_ADRMODE_AARCH64_4K |
+		   AS_TRANSCFG_INA_BITS(55 - va_bits);
+	if (ptdev->coherent)
+		transcfg |= AS_TRANSCFG_PTW_SH_OS;
+
+	/* If the VM is re-activated, we clear the fault. */
+	vm->unhandled_fault = false;
+
+	/* Unhandled pagefault on this AS, clear the fault and re-enable interrupts
+	 * before enabling the AS.
+	 */
+	fault_mask = panthor_mmu_as_fault_mask(ptdev, as);
+	if (ptdev->mmu->as.faulty_mask & fault_mask) {
+		gpu_write(ptdev, MMU_INT_CLEAR, fault_mask);
+		ptdev->mmu->as.faulty_mask &= ~fault_mask;
+		panthor_mmu_irq_enable_events(&ptdev->mmu->irq, fault_mask);
+		panthor_mmu_irq_disable_events(&ptdev->mmu->irq, ptdev->mmu->as.faulty_mask);
+	}
+
+	/* The VM update is guarded by ::op_lock, which we take at the beginning
+	 * of this function, so we don't expect any locked region here.
+	 */
+	drm_WARN_ON(&vm->ptdev->base, vm->locked_region.size > 0);
+	ret = panthor_mmu_as_enable(vm->ptdev, vm->as.id, transtab, transcfg, vm->memattr);
+
+out_make_active:
+	if (!ret) {
+		refcount_set(&vm->as.active_cnt, 1);
+		list_del_init(&vm->as.lru_node);
+	}
+
+out_unlock:
+	mutex_unlock(&ptdev->mmu->as.slots_lock);
+	mutex_unlock(&vm->op_lock);
+
+out_dev_exit:
+	drm_dev_exit(cookie);
+	return ret;
+}
+
+
 /**
  * panthor_mmu_suspend() - Suspend the MMU logic
  * @ptdev: Device.
@@ -1805,7 +1808,8 @@ void panthor_mmu_resume(struct panthor_device *ptdev)
 	ptdev->mmu->as.faulty_mask = 0;
 	mutex_unlock(&ptdev->mmu->as.slots_lock);
 
-	panthor_mmu_irq_resume(&ptdev->mmu->irq, panthor_mmu_fault_mask(ptdev, ~0));
+	panthor_mmu_irq_enable_events(&ptdev->mmu->irq, panthor_mmu_fault_mask(ptdev, ~0));
+	panthor_mmu_irq_resume(&ptdev->mmu->irq);
 }
 
 /**
@@ -1859,7 +1863,8 @@ void panthor_mmu_post_reset(struct panthor_device *ptdev)
 
 	mutex_unlock(&ptdev->mmu->as.slots_lock);
 
-	panthor_mmu_irq_resume(&ptdev->mmu->irq, panthor_mmu_fault_mask(ptdev, ~0));
+	panthor_mmu_irq_enable_events(&ptdev->mmu->irq, panthor_mmu_fault_mask(ptdev, ~0));
+	panthor_mmu_irq_resume(&ptdev->mmu->irq);
 
 	/* Restart the VM_BIND queues. */
 	mutex_lock(&ptdev->mmu->vm.lock);
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
index 57cfc7ce715b..ed3b2b4479ca 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.c
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -545,5 +545,5 @@ void panthor_pwr_resume(struct panthor_device *ptdev)
 	if (!ptdev->pwr)
 		return;
 
-	panthor_pwr_irq_resume(&ptdev->pwr->irq, PWR_INTERRUPTS_MASK);
+	panthor_pwr_irq_resume(&ptdev->pwr->irq);
 }

-- 
2.52.0

