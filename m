Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38575AB832F
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 11:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B33910E7FC;
	Thu, 15 May 2025 09:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YS8K1J9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F245610E1AF;
 Thu, 15 May 2025 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jsDMQb2uBHDc3uiI5lejjVgyjrp0PDqjmbb7PkBzULA=; b=YS8K1J9h/NHmkmWhTIfNwQIkd9
 c9hjce46iA7QLKY/iQBd2BFUwPdLZVAuALtYOj+W30YHjgKBn1qJ0J5OB3tjloYNOalal05BV1QDj
 IWThxDRp3L89CkBAiXKiCj1d9X6NUdERZ7L40XygYNqtfWj6IFmyi2BGPWGGx6ezJ2v0Ia1QtJplb
 Z3RoAxp+nxdyD9r3Rv45BT9VQDN5vY7CC/tF7k50NmYx/uKUvBzS/2SQnabJsPhCZrHKY7mX0JiOI
 2Nt2h+DRg4tJdNxdqJn/II922h9OmKKWFRHTidxpoCcW8ToRe7M7XyZ8/1VGztLNnX8vFLzxcySNz
 Fny5V2mw==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFV8P-008ZQj-Ll; Thu, 15 May 2025 11:50:08 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v4 2/9] dma-fence: Use a flag for 64-bit seqnos
Date: Thu, 15 May 2025 10:49:57 +0100
Message-ID: <20250515095004.28318-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
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

With the goal of reducing the need for drivers to touch (and dereference)
fence->ops, we move the 64-bit seqnos flag from struct dma_fence_ops to
the fence->flags.

Drivers which were setting this flag are changed to use new
dma_fence_init64() instead of dma_fence_init().

v2:
 * Streamlined init and added kerneldoc.
 * Rebase for amdgpu userq which landed since.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Christian König <christian.koenig@amd.com> # v1
---
 drivers/dma-buf/dma-fence-chain.c             |  5 +-
 drivers/dma-buf/dma-fence.c                   | 69 ++++++++++++++-----
 .../drm/amd/amdgpu/amdgpu_eviction_fence.c    |  7 +-
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   |  5 +-
 .../gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c  |  5 +-
 include/linux/dma-fence.h                     | 14 ++--
 6 files changed, 64 insertions(+), 41 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 90424f23fd73..a8a90acf4f34 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -218,7 +218,6 @@ static void dma_fence_chain_set_deadline(struct dma_fence *fence,
 }
 
 const struct dma_fence_ops dma_fence_chain_ops = {
-	.use_64bit_seqno = true,
 	.get_driver_name = dma_fence_chain_get_driver_name,
 	.get_timeline_name = dma_fence_chain_get_timeline_name,
 	.enable_signaling = dma_fence_chain_enable_signaling,
@@ -262,8 +261,8 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 			seqno = max(prev->seqno, seqno);
 	}
 
-	dma_fence_init(&chain->base, &dma_fence_chain_ops,
-		       &chain->lock, context, seqno);
+	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
+			 context, seqno);
 
 	/*
 	 * Chaining dma_fence_chain container together is only allowed through
diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index f0cdd3e99d36..705b59787731 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -989,24 +989,9 @@ void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
 }
 EXPORT_SYMBOL(dma_fence_describe);
 
-/**
- * dma_fence_init - Initialize a custom fence.
- * @fence: the fence to initialize
- * @ops: the dma_fence_ops for operations on this fence
- * @lock: the irqsafe spinlock to use for locking this fence
- * @context: the execution context this fence is run on
- * @seqno: a linear increasing sequence number for this context
- *
- * Initializes an allocated fence, the caller doesn't have to keep its
- * refcount after committing with this fence, but it will need to hold a
- * refcount again if &dma_fence_ops.enable_signaling gets called.
- *
- * context and seqno are used for easy comparison between fences, allowing
- * to check which fence is later by simply using dma_fence_later().
- */
-void
-dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
-	       spinlock_t *lock, u64 context, u64 seqno)
+static void
+__dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
+	         spinlock_t *lock, u64 context, u64 seqno, unsigned long flags)
 {
 	BUG_ON(!lock);
 	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
@@ -1017,9 +1002,55 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 	fence->lock = lock;
 	fence->context = context;
 	fence->seqno = seqno;
-	fence->flags = 0UL;
+	fence->flags = flags;
 	fence->error = 0;
 
 	trace_dma_fence_init(fence);
 }
+
+/**
+ * dma_fence_init - Initialize a custom fence.
+ * @fence: the fence to initialize
+ * @ops: the dma_fence_ops for operations on this fence
+ * @lock: the irqsafe spinlock to use for locking this fence
+ * @context: the execution context this fence is run on
+ * @seqno: a linear increasing sequence number for this context
+ *
+ * Initializes an allocated fence, the caller doesn't have to keep its
+ * refcount after committing with this fence, but it will need to hold a
+ * refcount again if &dma_fence_ops.enable_signaling gets called.
+ *
+ * context and seqno are used for easy comparison between fences, allowing
+ * to check which fence is later by simply using dma_fence_later().
+ */
+void
+dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
+	       spinlock_t *lock, u64 context, u64 seqno)
+{
+	__dma_fence_init(fence, ops, lock, context, seqno, 0UL);
+}
 EXPORT_SYMBOL(dma_fence_init);
+
+/**
+ * dma_fence_init64 - Initialize a custom fence with 64-bit seqno support.
+ * @fence: the fence to initialize
+ * @ops: the dma_fence_ops for operations on this fence
+ * @lock: the irqsafe spinlock to use for locking this fence
+ * @context: the execution context this fence is run on
+ * @seqno: a linear increasing sequence number for this context
+ *
+ * Initializes an allocated fence, the caller doesn't have to keep its
+ * refcount after committing with this fence, but it will need to hold a
+ * refcount again if &dma_fence_ops.enable_signaling gets called.
+ *
+ * Context and seqno are used for easy comparison between fences, allowing
+ * to check which fence is later by simply using dma_fence_later().
+ */
+void
+dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
+		 spinlock_t *lock, u64 context, u64 seqno)
+{
+	__dma_fence_init(fence, ops, lock, context, seqno,
+			 BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
+}
+EXPORT_SYMBOL(dma_fence_init64);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
index 1a7469543db5..79713421bffe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
@@ -134,7 +134,6 @@ static bool amdgpu_eviction_fence_enable_signaling(struct dma_fence *f)
 }
 
 static const struct dma_fence_ops amdgpu_eviction_fence_ops = {
-	.use_64bit_seqno = true,
 	.get_driver_name = amdgpu_eviction_fence_get_driver_name,
 	.get_timeline_name = amdgpu_eviction_fence_get_timeline_name,
 	.enable_signaling = amdgpu_eviction_fence_enable_signaling,
@@ -160,9 +159,9 @@ amdgpu_eviction_fence_create(struct amdgpu_eviction_fence_mgr *evf_mgr)
 	ev_fence->evf_mgr = evf_mgr;
 	get_task_comm(ev_fence->timeline_name, current);
 	spin_lock_init(&ev_fence->lock);
-	dma_fence_init(&ev_fence->base, &amdgpu_eviction_fence_ops,
-		       &ev_fence->lock, evf_mgr->ev_fence_ctx,
-		       atomic_inc_return(&evf_mgr->ev_fence_seq));
+	dma_fence_init64(&ev_fence->base, &amdgpu_eviction_fence_ops,
+			 &ev_fence->lock, evf_mgr->ev_fence_ctx,
+			 atomic_inc_return(&evf_mgr->ev_fence_seq));
 	return ev_fence;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 029cb24c28b3..5e92d00a591f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -239,8 +239,8 @@ static int amdgpu_userq_fence_create(struct amdgpu_usermode_queue *userq,
 	fence = &userq_fence->base;
 	userq_fence->fence_drv = fence_drv;
 
-	dma_fence_init(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
-		       fence_drv->context, seq);
+	dma_fence_init64(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
+			 fence_drv->context, seq);
 
 	amdgpu_userq_fence_driver_get(fence_drv);
 	dma_fence_get(fence);
@@ -334,7 +334,6 @@ static void amdgpu_userq_fence_release(struct dma_fence *f)
 }
 
 static const struct dma_fence_ops amdgpu_userq_fence_ops = {
-	.use_64bit_seqno = true,
 	.get_driver_name = amdgpu_userq_fence_get_driver_name,
 	.get_timeline_name = amdgpu_userq_fence_get_timeline_name,
 	.signaled = amdgpu_userq_fence_signaled,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
index 51cddfa3f1e8..5d26797356a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
@@ -71,7 +71,6 @@ static void amdgpu_tlb_fence_work(struct work_struct *work)
 }
 
 static const struct dma_fence_ops amdgpu_tlb_fence_ops = {
-	.use_64bit_seqno = true,
 	.get_driver_name = amdgpu_tlb_fence_get_driver_name,
 	.get_timeline_name = amdgpu_tlb_fence_get_timeline_name
 };
@@ -101,8 +100,8 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev, struct amdgpu_vm *vm
 	INIT_WORK(&f->work, amdgpu_tlb_fence_work);
 	spin_lock_init(&f->lock);
 
-	dma_fence_init(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
-		       vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
+	dma_fence_init64(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
+			 vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
 
 	/* TODO: We probably need a separate wq here */
 	dma_fence_get(&f->base);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 48b5202c531d..a34a0dcdc446 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -97,6 +97,7 @@ struct dma_fence {
 };
 
 enum dma_fence_flag_bits {
+	DMA_FENCE_FLAG_SEQNO64_BIT,
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
 	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
@@ -124,14 +125,6 @@ struct dma_fence_cb {
  *
  */
 struct dma_fence_ops {
-	/**
-	 * @use_64bit_seqno:
-	 *
-	 * True if this dma_fence implementation uses 64bit seqno, false
-	 * otherwise.
-	 */
-	bool use_64bit_seqno;
-
 	/**
 	 * @get_driver_name:
 	 *
@@ -262,6 +255,9 @@ struct dma_fence_ops {
 void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 		    spinlock_t *lock, u64 context, u64 seqno);
 
+void dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
+		      spinlock_t *lock, u64 context, u64 seqno);
+
 void dma_fence_release(struct kref *kref);
 void dma_fence_free(struct dma_fence *fence);
 void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
@@ -454,7 +450,7 @@ static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
 	 * 32bit sequence numbers. Use a 64bit compare when the driver says to
 	 * do so.
 	 */
-	if (fence->ops->use_64bit_seqno)
+	if (test_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags))
 		return f1 > f2;
 
 	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
-- 
2.48.0

