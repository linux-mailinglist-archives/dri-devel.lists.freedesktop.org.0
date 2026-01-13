Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266B9D19D3B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5354410E4F9;
	Tue, 13 Jan 2026 15:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WBrMKhI3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55C110E4F4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:21:33 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so52506645e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768317692; x=1768922492; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sQEpvLcq7UG5WdVTM4LJcvCqP/XBqy+UAaRuq6J5Juc=;
 b=WBrMKhI3rjCzlmJL5KfRkSPpWDlJYhQ3yab63PxSyFm97NsOxakjcP5AYIeGnG62UG
 mOYkcxdqft1wvodRyYb9TPHAdtPWhKas8tfQOaJKKYJmNBoHj8mlMNEuH+D0iy3MXa7t
 IwdZKNRjDYUwZixpQb7cv1QL+lDRaSWUK3N7G0q3O5qLKkUdLXWQPJ9Ghm0kcP//ZK8O
 uaPShpkP0GE35OF9cybC8UcPo10yUoH5Hk6n1xVk9eWASV+f4+LsoaO7N86H4IDaGw9w
 XiPQqek8e8ZjVyzo1pYmeRYDIe3aQJ9S3XYKeHLj7kuWCGdNJeoOrP0kuG2ZwABEvTk8
 PESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768317692; x=1768922492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sQEpvLcq7UG5WdVTM4LJcvCqP/XBqy+UAaRuq6J5Juc=;
 b=ldiRYIdSa7P8Goqzj1ocGS93AJUW57GA+ffhZ1iGRV6YQf0qaYdWn9Emyd1U+zE6NG
 RUmLQJNybHRmq+7Pze0qa9Q9t6DvEBIdF3WYkSAjDqZ0HBHouDy1zOOMnjYSWEFLtLRS
 HS4Q2eZienEZhTofL8fwcFDb7GL0hiBKoB3tM+FKAmXRpiFmV0ssoEtNBt1xmnnG4xxA
 x3G6gQMde41pfOaPAwyeKmvoKrDhaoD4hCUHpr/JLipjpVIIImYWKReJFM3+Q9CSYdcr
 6n+wVKwmyHyD1wMJ+iV3KAE7l1AmSDvvTd9APRQPYbYwfVdpC5qAFjR+3rJ8xtqv0Jme
 3xoQ==
X-Gm-Message-State: AOJu0Yy8/T7sKHSoi1P8LO7R2xdw6TP84X8qQsEJ3X8iL8uEu16WRktz
 i+4PNqot7AljXpc64DY//oSHtDm4ddPkkcjiWhjV5X5W5Hcj/0+aUSRl
X-Gm-Gg: AY/fxX7dKfchFFFpZ1G5Fhnml3/QQvhFHC+g9IgeQn5GTgwvYjkR07eUfmQ8m0l1Kvs
 Rw7sRruzYf8OMgVeMXkUwcOvYZi2SezlRr7o68jDOZxx0pZpljm4Pcf7eyle/b/0IP82r6n5vfY
 ukOfG83qWZSXlCU295Np97Uw0HKHcvrt4DfhDhffEp2KW75LaWgNyN0odoEYM0Nc9u5Acw95ltW
 ibpMx4sdT2uWKJ90t4FYa+Kb/XES/EGjM7N6bqlAm5Ytv3xmDERwfxyQH4KT4ROBPqhAHU1Etyt
 uExtLlFtWdngV623qDv0rjhvM+8kjbYXVgHwDGPzj2OscC+EsfNtO4EXSBPzPi/QUHw74yIyEoT
 1BjWI/ZComjS/BDA2sCaxYcSWaKpllDSZnEq3VpWMWeCRKs6PONRduMYZ6ETGiQCU0YSbXFWFq/
 QiJb3+ruKn9LeG6W1OnuVrAdg=
X-Google-Smtp-Source: AGHT+IEkGnCR1qUY6xEM9IVtVQmEpysciYZURUx6GlpzUldtA2KyDgfNLcWJHlR41Q6CqtNyBpOfYQ==
X-Received: by 2002:a05:600c:1991:b0:477:b48d:ba7a with SMTP id
 5b1f17b1804b1-47d84b4119amr232714595e9.32.1768317692239; 
 Tue, 13 Jan 2026 07:21:32 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:141c:9800:1651:dfa:9e48:25d5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ecf6a5466sm129518405e9.11.2026.01.13.07.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 07:21:31 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 05/10] dma-buf: inline spinlock for fence protection v4
Date: Tue, 13 Jan 2026 16:16:12 +0100
Message-ID: <20260113152125.47380-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113152125.47380-1-christian.koenig@amd.com>
References: <20260113152125.47380-1-christian.koenig@amd.com>
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

Implement per-fence spinlocks, allowing implementations to not give an
external spinlock to protect the fence internal statei. Instead a spinlock
embedded into the fence structure itself is used in this case.

Shared spinlocks have the problem that implementations need to guarantee
that the lock live at least as long all fences referencing them.

Using a per-fence spinlock allows completely decoupling spinlock producer
and consumer life times, simplifying the handling in most use cases.

v2: improve naming, coverage and function documentation
v3: fix one additional locking in the selftests
v4: separate out some changes to make the patch smaller,
    fix one amdgpu crash found by CI systems

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c             | 25 +++++++++++++++++-------
 drivers/dma-buf/sync_debug.h            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  2 +-
 drivers/gpu/drm/drm_crtc.c              |  2 +-
 drivers/gpu/drm/drm_writeback.c         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c |  3 ++-
 drivers/gpu/drm/qxl/qxl_release.c       |  3 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c   |  3 ++-
 drivers/gpu/drm/xe/xe_hw_fence.c        |  3 ++-
 include/linux/dma-fence.h               | 26 +++++++++++++++++++++----
 10 files changed, 52 insertions(+), 19 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index be072b7ba10b..b3c1fb990621 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -343,7 +343,6 @@ void __dma_fence_might_wait(void)
 }
 #endif
 
-
 /**
  * dma_fence_signal_timestamp_locked - signal completion of a fence
  * @fence: the fence to signal
@@ -365,7 +364,7 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 	struct dma_fence_cb *cur, *tmp;
 	struct list_head cb_list;
 
-	lockdep_assert_held(fence->lock);
+	lockdep_assert_held(dma_fence_spinlock(fence));
 
 	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
 				      &fence->flags)))
@@ -636,7 +635,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 	const struct dma_fence_ops *ops;
 	bool was_set;
 
-	lockdep_assert_held(fence->lock);
+	lockdep_assert_held(dma_fence_spinlock(fence));
 
 	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 				   &fence->flags);
@@ -1067,7 +1066,6 @@ static void
 __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 	         spinlock_t *lock, u64 context, u64 seqno, unsigned long flags)
 {
-	BUG_ON(!lock);
 	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
 
 	kref_init(&fence->refcount);
@@ -1078,10 +1076,15 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
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
@@ -1091,7 +1094,7 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
  * dma_fence_init - Initialize a custom fence.
  * @fence: the fence to initialize
  * @ops: the dma_fence_ops for operations on this fence
- * @lock: the irqsafe spinlock to use for locking this fence
+ * @lock: optional irqsafe spinlock to use for locking this fence
  * @context: the execution context this fence is run on
  * @seqno: a linear increasing sequence number for this context
  *
@@ -1101,6 +1104,10 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
  *
  * context and seqno are used for easy comparison between fences, allowing
  * to check which fence is later by simply using dma_fence_later().
+ *
+ * It is strongly discouraged to provide an external lock. This is only allowed
+ * for legacy use cases when multiple fences need to be prevented from
+ * signaling out of order.
  */
 void
 dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
@@ -1114,7 +1121,7 @@ EXPORT_SYMBOL(dma_fence_init);
  * dma_fence_init64 - Initialize a custom fence with 64-bit seqno support.
  * @fence: the fence to initialize
  * @ops: the dma_fence_ops for operations on this fence
- * @lock: the irqsafe spinlock to use for locking this fence
+ * @lock: optional irqsafe spinlock to use for locking this fence
  * @context: the execution context this fence is run on
  * @seqno: a linear increasing sequence number for this context
  *
@@ -1124,6 +1131,10 @@ EXPORT_SYMBOL(dma_fence_init);
  *
  * Context and seqno are used for easy comparison between fences, allowing
  * to check which fence is later by simply using dma_fence_later().
+ *
+ * It is strongly discouraged to provide an external lock. This is only allowed
+ * for legacy use cases when multiple fences need to be prevented from
+ * signaling out of order.
  */
 void
 dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
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
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 15d757c016cb..c74fa1821721 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -636,7 +636,7 @@ static inline uint64_t amdgpu_vm_tlb_seq(struct amdgpu_vm *vm)
 	 * sure that the dma_fence structure isn't freed up.
 	 */
 	rcu_read_lock();
-	lock = vm->last_tlb_flush->lock;
+	lock = dma_fence_spinlock(vm->last_tlb_flush);
 	rcu_read_unlock();
 
 	spin_lock_irqsave(lock, flags);
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
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 4a193b7d6d9e..c282c94138b2 100644
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
index b38ae0b25f3c..e2b95a97e90a 100644
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
index f6057456e460..3d89c660ea73 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -142,7 +142,8 @@ static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence);
 
 static struct xe_hw_fence_irq *xe_hw_fence_irq(struct xe_hw_fence *fence)
 {
-	return container_of(fence->dma.lock, struct xe_hw_fence_irq, lock);
+	return container_of(fence->dma.extern_lock, struct xe_hw_fence_irq,
+			    lock);
 }
 
 static const char *xe_hw_fence_get_driver_name(struct dma_fence *dma_fence)
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index a208e8841315..5f437af07b2e 100644
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
@@ -378,6 +384,18 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
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
 /**
  * dma_fence_lock_irqsave - irqsave lock the fence
  * @fence: the fence to lock
@@ -386,7 +404,7 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
  * Lock the fence, preventing it from changing to the signaled state.
  */
 #define dma_fence_lock_irqsave(fence, flags)	\
-	spin_lock_irqsave(fence->lock, flags)
+	spin_lock_irqsave(dma_fence_spinlock(fence), flags)
 
 /**
  * dma_fence_unlock_irqrestore - unlock the fence and irqrestore
@@ -396,7 +414,7 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
  * Unlock the fence, allowing it to change it's state to signaled again.
  */
 #define dma_fence_unlock_irqrestore(fence, flags)	\
-	spin_unlock_irqrestore(fence->lock, flags)
+	spin_unlock_irqrestore(dma_fence_spinlock(fence), flags)
 
 #ifdef CONFIG_LOCKDEP
 bool dma_fence_begin_signalling(void);
-- 
2.43.0

