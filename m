Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296A5C254F0
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71EE10EB75;
	Fri, 31 Oct 2025 13:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bkqpbxJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C201210EB5B
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:44:58 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-475dbb524e4so13733655e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 06:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761918297; x=1762523097; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PW5bU9n85CAHP2WgtiUvq6QGAjtpa+cdo52VFX9G3vU=;
 b=bkqpbxJ2fh2Qd1Gaqv9XQs4KBAKiMMh9JyQ/Iu/3ynuIWPWqEP5cXKpfKaw2D0/MGw
 TahzQt8Xt6ZFk3xPCM3YPiS5OgLd4ZI4cWpKwYhEcbFN8LwIafoHNwfg0F1ZKIeD/y3Q
 j9mRb7hX5iJfztdXO3miB7LyiXKcYKx8DcMjE2qcq7e/ifhoRVRvmXJQQcwc+6hmESI8
 CEW2eGioP9S/kvQFFJrHGuKpTCqOcJN7aAC1FyjbRRSvCbnSbf2SfXae84xlwTulOHCr
 SRBqbkdeyxgBvNDFbddohOI1zCBZoICqxcoZaNKy3VChqX/6Z0NJ2EJAzVKRdKuPIihn
 AZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761918297; x=1762523097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PW5bU9n85CAHP2WgtiUvq6QGAjtpa+cdo52VFX9G3vU=;
 b=KfSAvG3fPSiEMmrx45yKC34McfEvZJNXasRD9G+Eenxoh8LTUzs0Q+bXavdgX/c34F
 xOHbQjuKxYbFkYEIEJAiYTgwn15F4bu897TIdv8ZQ/9S705o5hJeib0Vk06dcjKWPIIv
 Gb9K3LgSnTiFoqP+SCQE5+9nxIFF4wTnqAWL4m5cYYRgOB9HqvXoSSvsk8bwRK9NoDXA
 i+ShwJgHZXhvQwmlY4JqFWz5nfCPqiNrCMLX5FkAWtqAFWN/dloej/qfE423jOf3Zn0n
 1Q6xY+GqMUgVIOi2zBim2HqX/cD5XqwOXY+TpNQyJexcYhO7Zw3+vmkisUgsKKikAXyj
 xuUw==
X-Gm-Message-State: AOJu0YzSTlcMb37ceSqUNvzBo3H9cge9dkjJL7XosmqKPHExHOKhnduA
 4SDvXzYwdiyMkRA/HdlHpHmRcABowl4n2h5Sz8nOps7p4M8pGR2qqLLn
X-Gm-Gg: ASbGncu5MD0aVl0MNctpZEd3cvgOOV7YMmTTK1iSHb9GFTwwy6Hq5JzLPDNQaGXCb9f
 K5JnN5sX2i5wCSSR9fO+SX2LdmgGRu/BKkNPMe51Fpzdq0taORJ5Ct0EKjdwR927hab9qXBeq7m
 T9oUeOQIvkMEDnQ2Vct13gb5xvRfG9JpYwJjJnzVWTVyDxuv5suZPClWV3YP0xvxNG6/WVjD4/e
 QAdRjpOmdVoiU7v07oIeRM6AHP8yigks73MJG98HTWNwBYF0/xgNxZ9HIqntCnLVRer2gP+/HBJ
 xss1rvDWxfyoGv/yS4RfUZ2xItwxOhxTTYkykcpwd8NtwXiFYSdz7bqTiku0pgE8jdHsUxj/Gbe
 WpmfZiFSzjqsDIAVhDPBD8zubUTFEZ19wE6TMeVv/UUDli5tcvgfVnmCXLofa+9OW0KEeuQTx8L
 3hNQGFRdMoOiAmDQBmpBQ+lKd3
X-Google-Smtp-Source: AGHT+IGgltE7xW1V9S+ypSZHtTotEm4tyzrraeLtZ9Pj9jbxO7h2BObJj4YLVT6nZ89IXGgwaiMdlg==
X-Received: by 2002:a05:600c:528d:b0:477:ad4:4920 with SMTP id
 5b1f17b1804b1-47730802698mr27513885e9.10.1761918297081; 
 Fri, 31 Oct 2025 06:44:57 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1599:7d00:73cb:d446:bf90:f1c0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732fe119bsm34502635e9.10.2025.10.31.06.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 06:44:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, felix.kuehling@amd.com,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 05/20] dma-buf: inline spinlock for fence protection
Date: Fri, 31 Oct 2025 14:16:39 +0100
Message-ID: <20251031134442.113648-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031134442.113648-1-christian.koenig@amd.com>
References: <20251031134442.113648-1-christian.koenig@amd.com>
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

Allow implementations to not give a spinlock to protect the fence
internal state, instead a spinlock embedded into the fence structure
itself is used in this case.

Apart from simplifying the handling for containers and the stub fence
this has the advantage of allowing implementations to issue fences
without caring about theit spinlock lifetime.

That in turn is necessary for independent fences who outlive the module
who originally issued them.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c              | 54 ++++++++++++------------
 drivers/dma-buf/sw_sync.c                | 14 +++---
 drivers/dma-buf/sync_debug.h             |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h   | 12 +++---
 drivers/gpu/drm/drm_crtc.c               |  2 +-
 drivers/gpu/drm/drm_writeback.c          |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c    |  5 ++-
 drivers/gpu/drm/nouveau/nouveau_fence.c  |  3 +-
 drivers/gpu/drm/qxl/qxl_release.c        |  3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c    |  3 +-
 drivers/gpu/drm/xe/xe_hw_fence.c         |  3 +-
 drivers/gpu/drm/xe/xe_sched_job.c        |  4 +-
 include/linux/dma-fence.h                | 42 +++++++++++++++++-
 15 files changed, 99 insertions(+), 58 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index cd222984e2e1..f9d7439275d1 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -343,7 +343,6 @@ void __dma_fence_might_wait(void)
 }
 #endif
 
-
 /**
  * dma_fence_signal_timestamp_locked - signal completion of a fence
  * @fence: the fence to signal
@@ -368,7 +367,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 	struct dma_fence_cb *cur, *tmp;
 	struct list_head cb_list;
 
-	lockdep_assert_held(fence->lock);
+	lockdep_assert_held(dma_fence_spinlock(fence));
 
 	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
 				      &fence->flags)))
@@ -421,9 +420,9 @@ int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
 	if (WARN_ON(!fence))
 		return -EINVAL;
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock(fence, flags);
 	ret = dma_fence_signal_timestamp_locked(fence, timestamp);
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock(fence, flags);
 
 	return ret;
 }
@@ -475,9 +474,9 @@ int dma_fence_signal(struct dma_fence *fence)
 
 	tmp = dma_fence_begin_signalling();
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock(fence, flags);
 	ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock(fence, flags);
 
 	dma_fence_end_signalling(tmp);
 
@@ -579,10 +578,10 @@ void dma_fence_release(struct kref *kref)
 		 * don't leave chains dangling. We set the error flag first
 		 * so that the callbacks know this signal is due to an error.
 		 */
-		spin_lock_irqsave(fence->lock, flags);
+		dma_fence_lock(fence, flags);
 		fence->error = -EDEADLK;
 		dma_fence_signal_locked(fence);
-		spin_unlock_irqrestore(fence->lock, flags);
+		dma_fence_unlock(fence, flags);
 	}
 
 	ops = rcu_dereference(fence->ops);
@@ -612,7 +611,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 	const struct dma_fence_ops *ops;
 	bool was_set;
 
-	lockdep_assert_held(fence->lock);
+	lockdep_assert_held(dma_fence_spinlock(fence));
 
 	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 				   &fence->flags);
@@ -648,9 +647,9 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock(fence, flags);
 	__dma_fence_enable_signaling(fence);
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock(fence, flags);
 }
 EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
 
@@ -690,8 +689,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 		return -ENOENT;
 	}
 
-	spin_lock_irqsave(fence->lock, flags);
-
+	dma_fence_lock(fence, flags);
 	if (__dma_fence_enable_signaling(fence)) {
 		cb->func = func;
 		list_add_tail(&cb->node, &fence->cb_list);
@@ -699,8 +697,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 		INIT_LIST_HEAD(&cb->node);
 		ret = -ENOENT;
 	}
-
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock(fence, flags);
 
 	return ret;
 }
@@ -723,9 +720,9 @@ int dma_fence_get_status(struct dma_fence *fence)
 	unsigned long flags;
 	int status;
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock(fence, flags);
 	status = dma_fence_get_status_locked(fence);
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock(fence, flags);
 
 	return status;
 }
@@ -755,13 +752,11 @@ dma_fence_remove_callback(struct dma_fence *fence, struct dma_fence_cb *cb)
 	unsigned long flags;
 	bool ret;
 
-	spin_lock_irqsave(fence->lock, flags);
-
+	dma_fence_lock(fence, flags);
 	ret = !list_empty(&cb->node);
 	if (ret)
 		list_del_init(&cb->node);
-
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock(fence, flags);
 
 	return ret;
 }
@@ -800,8 +795,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	unsigned long flags;
 	signed long ret = timeout ? timeout : 1;
 
-	spin_lock_irqsave(fence->lock, flags);
-
+	dma_fence_lock(fence, flags);
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		goto out;
 
@@ -824,11 +818,11 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 			__set_current_state(TASK_INTERRUPTIBLE);
 		else
 			__set_current_state(TASK_UNINTERRUPTIBLE);
-		spin_unlock_irqrestore(fence->lock, flags);
+		dma_fence_unlock(fence, flags);
 
 		ret = schedule_timeout(ret);
 
-		spin_lock_irqsave(fence->lock, flags);
+		dma_fence_lock(fence, flags);
 		if (ret > 0 && intr && signal_pending(current))
 			ret = -ERESTARTSYS;
 	}
@@ -838,7 +832,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	__set_current_state(TASK_RUNNING);
 
 out:
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock(fence, flags);
 	return ret;
 }
 EXPORT_SYMBOL(dma_fence_default_wait);
@@ -1046,7 +1040,6 @@ static void
 __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 	         spinlock_t *lock, u64 context, u64 seqno, unsigned long flags)
 {
-	BUG_ON(!lock);
 	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
 
 	kref_init(&fence->refcount);
@@ -1057,10 +1050,15 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 	 */
 	RCU_INIT_POINTER(fence->ops, ops);
 	INIT_LIST_HEAD(&fence->cb_list);
-	fence->lock = lock;
 	fence->context = context;
 	fence->seqno = seqno;
 	fence->flags = flags;
+	if (lock) {
+		fence->extern_lock = lock;
+	} else {
+		spin_lock_init(&fence->inline_lock);
+		fence->flags |= BIT(DMA_FENCE_FLAG_INLINE_LOCK_BIT);
+	}
 	fence->error = 0;
 
 	trace_dma_fence_init(fence);
diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 3c20f1d31cf5..8f48529214a4 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -155,12 +155,12 @@ static void timeline_fence_release(struct dma_fence *fence)
 	struct sync_timeline *parent = dma_fence_parent(fence);
 	unsigned long flags;
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock(fence, flags);
 	if (!list_empty(&pt->link)) {
 		list_del(&pt->link);
 		rb_erase(&pt->node, &parent->pt_tree);
 	}
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock(fence, flags);
 
 	sync_timeline_put(parent);
 	dma_fence_free(fence);
@@ -178,7 +178,7 @@ static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadlin
 	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
 	unsigned long flags;
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock(fence, flags);
 	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
 		if (ktime_before(deadline, pt->deadline))
 			pt->deadline = deadline;
@@ -186,7 +186,7 @@ static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadlin
 		pt->deadline = deadline;
 		__set_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags);
 	}
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock(fence, flags);
 }
 
 static const struct dma_fence_ops timeline_fence_ops = {
@@ -427,13 +427,13 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		goto put_fence;
 	}
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock(fence, flags);
 	if (!test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
 		ret = -ENOENT;
 		goto unlock;
 	}
 	data.deadline_ns = ktime_to_ns(pt->deadline);
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock(fence, flags);
 
 	dma_fence_put(fence);
 
@@ -446,7 +446,7 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 	return 0;
 
 unlock:
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock(fence, flags);
 put_fence:
 	dma_fence_put(fence);
 
diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
index 02af347293d0..c49324505b20 100644
--- a/drivers/dma-buf/sync_debug.h
+++ b/drivers/dma-buf/sync_debug.h
@@ -47,7 +47,7 @@ struct sync_timeline {
 
 static inline struct sync_timeline *dma_fence_parent(struct dma_fence *fence)
 {
-	return container_of(fence->lock, struct sync_timeline, lock);
+	return container_of(fence->extern_lock, struct sync_timeline, lock);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index 5ec5c3ff22bb..fcc7a3fb93b3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -468,10 +468,10 @@ bool amdgpu_ring_soft_recovery(struct amdgpu_ring *ring, unsigned int vmid,
 	if (amdgpu_sriov_vf(ring->adev) || !ring->funcs->soft_recovery || !fence)
 		return false;
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock(fence, flags);
 	if (!dma_fence_is_signaled_locked(fence))
 		dma_fence_set_error(fence, -ENODATA);
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock(fence, flags);
 
 	while (!dma_fence_is_signaled(fence) &&
 	       ktime_to_ns(ktime_sub(deadline, ktime_get())) > 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index c1a801203949..61adba6ed071 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2767,8 +2767,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 	dma_fence_put(vm->last_unlocked);
 	dma_fence_wait(vm->last_tlb_flush, false);
 	/* Make sure that all fence callbacks have completed */
-	spin_lock_irqsave(vm->last_tlb_flush->lock, flags);
-	spin_unlock_irqrestore(vm->last_tlb_flush->lock, flags);
+	dma_fence_lock(vm->last_tlb_flush, flags);
+	dma_fence_unlock(vm->last_tlb_flush, flags);
 	dma_fence_put(vm->last_tlb_flush);
 
 	list_for_each_entry_safe(mapping, tmp, &vm->freed, list) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index cf0ec94e8a07..d41511f59d15 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -631,20 +631,20 @@ bool amdgpu_vm_is_bo_always_valid(struct amdgpu_vm *vm, struct amdgpu_bo *bo);
  */
 static inline uint64_t amdgpu_vm_tlb_seq(struct amdgpu_vm *vm)
 {
+	struct dma_fence *fence;
 	unsigned long flags;
-	spinlock_t *lock;
 
 	/*
 	 * Workaround to stop racing between the fence signaling and handling
-	 * the cb. The lock is static after initially setting it up, just make
-	 * sure that the dma_fence structure isn't freed up.
+	 * the cb.
 	 */
 	rcu_read_lock();
-	lock = vm->last_tlb_flush->lock;
+	fence = dma_fence_get_rcu(vm->last_tlb_flush);
 	rcu_read_unlock();
 
-	spin_lock_irqsave(lock, flags);
-	spin_unlock_irqrestore(lock, flags);
+	dma_fence_lock(fence, flags);
+	dma_fence_unlock(fence, flags);
+	dma_fence_put(fence);
 
 	return atomic64_read(&vm->tlb_seq);
 }
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index a7797d260f1e..17472915842f 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -159,7 +159,7 @@ static const struct dma_fence_ops drm_crtc_fence_ops;
 static struct drm_crtc *fence_to_crtc(struct dma_fence *fence)
 {
 	BUG_ON(fence->ops != &drm_crtc_fence_ops);
-	return container_of(fence->lock, struct drm_crtc, fence_lock);
+	return container_of(fence->extern_lock, struct drm_crtc, fence_lock);
 }
 
 static const char *drm_crtc_fence_get_driver_name(struct dma_fence *fence)
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 95b8a2e4bda6..624a4e8b6c99 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -81,7 +81,7 @@
  *	From userspace, this property will always read as zero.
  */
 
-#define fence_to_wb_connector(x) container_of(x->lock, \
+#define fence_to_wb_connector(x) container_of(x->extern_lock, \
 					      struct drm_writeback_connector, \
 					      fence_lock)
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1527b801f013..2956ed2ec073 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -156,12 +156,13 @@ nouveau_name(struct drm_device *dev)
 static inline bool
 nouveau_cli_work_ready(struct dma_fence *fence)
 {
+	unsigned long flags;
 	bool ret = true;
 
-	spin_lock_irq(fence->lock);
+	dma_fence_lock(fence, flags);
 	if (!dma_fence_is_signaled_locked(fence))
 		ret = false;
-	spin_unlock_irq(fence->lock);
+	dma_fence_unlock(fence, flags);
 
 	if (ret == true)
 		dma_fence_put(fence);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 869d4335c0f4..a7512c22c85f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -41,7 +41,8 @@ static const struct dma_fence_ops nouveau_fence_ops_legacy;
 static inline struct nouveau_fence_chan *
 nouveau_fctx(struct nouveau_fence *fence)
 {
-	return container_of(fence->base.lock, struct nouveau_fence_chan, lock);
+	return container_of(fence->base.extern_lock, struct nouveau_fence_chan,
+			    lock);
 }
 
 static bool
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 7b3c9a6016db..de05e392df88 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -62,7 +62,8 @@ static long qxl_fence_wait(struct dma_fence *fence, bool intr,
 	struct qxl_device *qdev;
 	unsigned long cur, end = jiffies + timeout;
 
-	qdev = container_of(fence->lock, struct qxl_device, release_lock);
+	qdev = container_of(fence->extern_lock, struct qxl_device,
+			    release_lock);
 
 	if (!wait_event_timeout(qdev->release_event,
 				(dma_fence_is_signaled(fence) ||
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 00be92da5509..621aa0aa8406 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -47,7 +47,8 @@ struct vmw_event_fence_action {
 static struct vmw_fence_manager *
 fman_from_fence(struct vmw_fence_obj *fence)
 {
-	return container_of(fence->base.lock, struct vmw_fence_manager, lock);
+	return container_of(fence->base.extern_lock, struct vmw_fence_manager,
+			    lock);
 }
 
 static void vmw_fence_obj_destroy(struct dma_fence *f)
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index b2a0c46dfcd4..3456bec93c70 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -144,7 +144,8 @@ static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence);
 
 static struct xe_hw_fence_irq *xe_hw_fence_irq(struct xe_hw_fence *fence)
 {
-	return container_of(fence->dma.lock, struct xe_hw_fence_irq, lock);
+	return container_of(fence->dma.extern_lock, struct xe_hw_fence_irq,
+			    lock);
 }
 
 static const char *xe_hw_fence_get_driver_name(struct dma_fence *dma_fence)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index f1ba9c19e218..415bee1fc0a5 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -189,11 +189,11 @@ static bool xe_fence_set_error(struct dma_fence *fence, int error)
 	unsigned long irq_flags;
 	bool signaled;
 
-	spin_lock_irqsave(fence->lock, irq_flags);
+	dma_fence_lock(fence, irq_flags);
 	signaled = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
 	if (!signaled)
 		dma_fence_set_error(fence, error);
-	spin_unlock_irqrestore(fence->lock, irq_flags);
+	dma_fence_unlock(fence, irq_flags);
 
 	return signaled;
 }
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index e1ba1d53de88..fb416f500664 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -34,7 +34,8 @@ struct seq_file;
  * @ops: dma_fence_ops associated with this fence
  * @rcu: used for releasing fence with kfree_rcu
  * @cb_list: list of all callbacks to call
- * @lock: spin_lock_irqsave used for locking
+ * @extern_lock: external spin_lock_irqsave used for locking
+ * @inline_lock: alternative internal spin_lock_irqsave used for locking
  * @context: execution context this fence belongs to, returned by
  *           dma_fence_context_alloc()
  * @seqno: the sequence number of this fence inside the execution context,
@@ -48,6 +49,7 @@ struct seq_file;
  * atomic ops (bit_*), so taking the spinlock will not be needed most
  * of the time.
  *
+ * DMA_FENCE_FLAG_INLINE_LOCK_BIT - use inline spinlock instead of external one
  * DMA_FENCE_FLAG_SIGNALED_BIT - fence is already signaled
  * DMA_FENCE_FLAG_TIMESTAMP_BIT - timestamp recorded for fence signaling
  * DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT - enable_signaling might have been called
@@ -65,7 +67,10 @@ struct seq_file;
  * been completed, or never called at all.
  */
 struct dma_fence {
-	spinlock_t *lock;
+	union {
+		spinlock_t *extern_lock;
+		spinlock_t inline_lock;
+	};
 	const struct dma_fence_ops __rcu *ops;
 	/*
 	 * We clear the callback list on kref_put so that by the time we
@@ -98,6 +103,7 @@ struct dma_fence {
 };
 
 enum dma_fence_flag_bits {
+	DMA_FENCE_FLAG_INLINE_LOCK_BIT,
 	DMA_FENCE_FLAG_SEQNO64_BIT,
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
@@ -351,6 +357,38 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
 	} while (1);
 }
 
+/**
+ * dma_fence_spinlock - return pointer to the spinlock protecting the fence
+ * @fence: the fence to get the lock from
+ *
+ * Return either the pointer to the embedded or the external spin lock.
+ */
+static inline spinlock_t *dma_fence_spinlock(struct dma_fence *fence)
+{
+	return test_bit(DMA_FENCE_FLAG_INLINE_LOCK_BIT, &fence->flags) ?
+		&fence->inline_lock : fence->extern_lock;
+}
+
+/**
+ * dma_fence_lock - irqsave lock the fence
+ * @fence: the fence to lock
+ * @flags: where to store the CPU flags.
+ *
+ * Lock the fence, preventing it from changing to the signaled state.
+ */
+#define dma_fence_lock(fence, flags)	\
+	spin_lock_irqsave(dma_fence_spinlock(fence), flags)
+
+/**
+ * dma_fence_unlock - unlock the fence and irqrestore
+ * @fence: the fence to unlock
+ * @flags the CPU flags to restore
+ *
+ * Unlock the fence, allowing it to change it's state to signaled again.
+ */
+#define dma_fence_unlock(fence, flags)	\
+	spin_unlock_irqrestore(dma_fence_spinlock(fence), flags)
+
 #ifdef CONFIG_LOCKDEP
 bool dma_fence_begin_signalling(void);
 void dma_fence_end_signalling(bool cookie);
-- 
2.43.0

