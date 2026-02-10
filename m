Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL1tDvcGi2kdPQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:22:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAAB119972
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4C310E547;
	Tue, 10 Feb 2026 10:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fu/I+3Oi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B135E10E544
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 10:22:40 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-48068ed1eccso53940505e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 02:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770718959; x=1771323759; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eJDanrM9AOf2aQdkqNaFKW9UJtE1I+GGkxX+3Wmc3kg=;
 b=Fu/I+3OiZHDfcuyuE7nuMXCiWD6JUzW+Xxk8vNft5SnjxWrHn0JNyyHkXth2oEnWy/
 184ySUDhAZKJZiJiN9XRyd1SO0ns0AHT35KsvcEKW94kW0UqmgImyJG+cV0mJ8QWs39I
 XjTT/8a8Zm+Kke2lU83umPXV0PEKP161/ZTd+acbM8o/Uem/mPUF1Bc5HeyeUt8vC48q
 4um58jewUvEDxQ1zLMIwDSKYF4B9Qj68XGbPzmzOV2QBTwQkaTweTGyUwQUq4GGN1Y1I
 JAXZbwTBpknrQrEY1Fr3SDkVKargCqOzB07FRwiQrf6g+nImcTlJOAk49G65YNb7YBJy
 AwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770718959; x=1771323759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eJDanrM9AOf2aQdkqNaFKW9UJtE1I+GGkxX+3Wmc3kg=;
 b=DcjICZZx4dT45yqPbFFMOUhaGzAbDRa2CkuaDg5d1oiEhdKoAOVm9cx0+rttyEO8PZ
 bZA+T92t+IxxQu1KX+zqRkIguiiMQTtqHFP/vfUImtCB9y80h8VkYe/qOrzMBDeVeu+2
 ScyL63lDLTXJvu9J91xhmeYtKV8bguNQxUPkC8Ni3+XMVvUi9RCVBptra2lPx5zfmcv0
 nCujOSsNmHjRJ3lpb2QOLatTiTqw6ljW5cWuVNrpjrRnpXsy/L5EWIhRWWRzwOLBownN
 i/jYo/FFISBzU5YTBzLQLFh3hr3WzVWahtFLbK6KZ5UcYegBJu3hGKkjZ0w/N4oFtXhT
 tMgA==
X-Gm-Message-State: AOJu0YyixHKD4ouG8rAtuTIWwY3nw8d0ykAs/TwoD7Hn5vmkg+zY43mv
 8SCYzCSMT+wxow6+Imo/B+j1WXiBQMe+EYGlLxO3f6eXSf9MvdLOuDtT
X-Gm-Gg: AZuq6aI4DduAZhvlCA/W3J+R6GbuJoPQjGbsVEMhhRTMTXOnuGAHqIDDZhv//5og9Tm
 6HjpmGYPYwlqFsbBe+n3CaDOqoav99Yysy8WV3WjDPYbD0YBUHO4lYAGdRv45Z2AxZ6FdFj5pmn
 4W5CkSvoehEjFGFWQvzZAqT557iDqgKTO6uKtM7R3HTx7mIN3QbhyIh8IO5Oad9zKq/rIw4aKvs
 szeWLgyAqu1z0baagigbsP4xWjJGrdKX1IiksV+w+YcoMQN0QXCj0npkIpOtcQfHnZlO2OYIoN2
 c7UHpbJl37Ec+CKbCaGsikKYJ+G9XIvUTF42xCJbZ210DEJf8maugmhonga90cu0BQsZU4n8bJS
 tMkpSilSo9Lwm/5TRgqswt5UbbnhLpIFt9miTaHYsquorsa0LHgRBcRI4X29dar0Wr6/tiBsOM/
 lX6AiiT9h+cN+I7KoU8y+aB2RtTIfpM2XSkgSS
X-Received: by 2002:a05:600c:190f:b0:47e:e414:b915 with SMTP id
 5b1f17b1804b1-483507cff7bmr23145625e9.2.1770718958876; 
 Tue, 10 Feb 2026 02:22:38 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:6000:83ca:11f0:7e35:a75d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d8ebfsm81549605e9.2.2026.02.10.02.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 02:22:38 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org,
	matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 4/8] dma-buf: inline spinlock for fence protection v4
Date: Tue, 10 Feb 2026 11:01:59 +0100
Message-ID: <20260210102232.1642-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210102232.1642-1-christian.koenig@amd.com>
References: <20260210102232.1642-1-christian.koenig@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:email]
X-Rspamd-Queue-Id: DEAAB119972
X-Rspamd-Action: no action

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
 drivers/dma-buf/dma-fence.c             | 21 ++++++++++++++++-----
 drivers/dma-buf/sync_debug.h            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  2 +-
 drivers/gpu/drm/drm_crtc.c              |  2 +-
 drivers/gpu/drm/drm_writeback.c         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c |  3 ++-
 drivers/gpu/drm/qxl/qxl_release.c       |  3 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c   |  3 ++-
 drivers/gpu/drm/xe/xe_hw_fence.c        |  3 ++-
 include/linux/dma-fence.h               | 19 +++++++++++++------
 10 files changed, 41 insertions(+), 19 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 56aa59867eaa..1833889e7466 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -343,7 +343,6 @@ void __dma_fence_might_wait(void)
 }
 #endif
 
-
 /**
  * dma_fence_signal_timestamp_locked - signal completion of a fence
  * @fence: the fence to signal
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
 	fence->flags = flags | BIT(DMA_FENCE_FLAG_INITIALIZED_BIT);
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
index 139642eacdd0..d5c41e24fb51 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -638,7 +638,7 @@ static inline uint64_t amdgpu_vm_tlb_seq(struct amdgpu_vm *vm)
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
index 06b0b2aa7953..37d4ae0faf0d 100644
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
index 85795082fef9..d251eec57df9 100644
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
index ae8ed15b64c5..14720623ad00 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -124,7 +124,8 @@ static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence);
 
 static struct xe_hw_fence_irq *xe_hw_fence_irq(struct xe_hw_fence *fence)
 {
-	return container_of(fence->dma.lock, struct xe_hw_fence_irq, lock);
+	return container_of(fence->dma.extern_lock, struct xe_hw_fence_irq,
+			    lock);
 }
 
 static const char *xe_hw_fence_get_driver_name(struct dma_fence *dma_fence)
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 88c842fc35d5..6eabbb1c471c 100644
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
@@ -49,6 +50,7 @@ struct seq_file;
  * of the time.
  *
  * DMA_FENCE_FLAG_INITIALIZED_BIT - fence was initialized
+ * DMA_FENCE_FLAG_INLINE_LOCK_BIT - use inline spinlock instead of external one
  * DMA_FENCE_FLAG_SIGNALED_BIT - fence is already signaled
  * DMA_FENCE_FLAG_TIMESTAMP_BIT - timestamp recorded for fence signaling
  * DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT - enable_signaling might have been called
@@ -66,7 +68,10 @@ struct seq_file;
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
@@ -100,6 +105,7 @@ struct dma_fence {
 
 enum dma_fence_flag_bits {
 	DMA_FENCE_FLAG_INITIALIZED_BIT,
+	DMA_FENCE_FLAG_INLINE_LOCK_BIT,
 	DMA_FENCE_FLAG_SEQNO64_BIT,
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
@@ -381,11 +387,12 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
  * dma_fence_spinlock - return pointer to the spinlock protecting the fence
  * @fence: the fence to get the lock from
  *
- * Return the pointer to the extern lock.
+ * Return either the pointer to the embedded or the external spin lock.
  */
 static inline spinlock_t *dma_fence_spinlock(struct dma_fence *fence)
 {
-	return fence->lock;
+	return test_bit(DMA_FENCE_FLAG_INLINE_LOCK_BIT, &fence->flags) ?
+		&fence->inline_lock : fence->extern_lock;
 }
 
 /**
@@ -396,7 +403,7 @@ static inline spinlock_t *dma_fence_spinlock(struct dma_fence *fence)
  * Lock the fence, preventing it from changing to the signaled state.
  */
 #define dma_fence_lock_irqsave(fence, flags)	\
-	spin_lock_irqsave(fence->lock, flags)
+	spin_lock_irqsave(dma_fence_spinlock(fence), flags)
 
 /**
  * dma_fence_unlock_irqrestore - unlock the fence and irqrestore
@@ -406,7 +413,7 @@ static inline spinlock_t *dma_fence_spinlock(struct dma_fence *fence)
  * Unlock the fence, allowing it to change it's state to signaled again.
  */
 #define dma_fence_unlock_irqrestore(fence, flags)	\
-	spin_unlock_irqrestore(fence->lock, flags)
+	spin_unlock_irqrestore(dma_fence_spinlock(fence), flags)
 
 /**
  * dma_fence_assert_held - lockdep assertion that fence is locked
-- 
2.43.0

