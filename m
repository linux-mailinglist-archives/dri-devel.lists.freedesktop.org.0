Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A1020EF72
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C61189CCE;
	Tue, 30 Jun 2020 07:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FCD89B5F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 05:45:32 +0000 (UTC)
From: "Ahmed S. Darwish" <a.darwish@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1593495930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e0jTHQoxks+qBbNy0dT5aGqcUc2Cr1SJenmjgFYt3N0=;
 b=YlxVqzCRdCLagIuiSN5nItBjqQPZ2DP/4ckSar2DXzbSswXn/ue/b3BeDrtKXJn8SCKPbe
 pWdtbU2WttkDk3HhnnV7n84yjDP+j8FIgu1dbFfwLX+YEKhVzZpSb/yDCAuvs5EguUB6vl
 zsrWIv1wTdjqfz+W2JbO6PYEexxRFv3MowEDdeaDFaLdHdmki4loeuCpJoNR5d8c3AaSxU
 IQK4+XvZ/zn4f/qaSnG+mfMoCO/xZn7nEO5YVmw2o5IkPJVGZ0A6et+OToHo9wigvwfqZh
 QFAiLaPIp0D5qoRFG4xxm8VCo5XK4PlDSNio7/iWULQIdcSt05eQtuf/G3rn1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1593495930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e0jTHQoxks+qBbNy0dT5aGqcUc2Cr1SJenmjgFYt3N0=;
 b=a11DQheLWNJeNZ9gNWThCp1M/5fUStr7/eAN6H/sAjWwH6voOIB1uCPnzRXmjXUo+A8OgP
 dfrY76usUX8tVyBg==
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>
Subject: [PATCH v3 08/20] dma-buf: Use sequence counter with associated
 wound/wait mutex
Date: Tue, 30 Jun 2020 07:44:40 +0200
Message-Id: <20200630054452.3675847-9-a.darwish@linutronix.de>
In-Reply-To: <20200630054452.3675847-1-a.darwish@linutronix.de>
References: <20200519214547.352050-1-a.darwish@linutronix.de>
 <20200630054452.3675847-1-a.darwish@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:54 +0000
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, David Airlie <airlied@linux.ie>,
 "Sebastian A. Siewior" <bigeasy@linutronix.de>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 dri-devel@lists.freedesktop.org, "Ahmed S. Darwish" <a.darwish@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A sequence counter write side critical section must be protected by some
form of locking to serialize writers. If the serialization primitive is
not disabling preemption implicitly, preemption has to be explicitly
disabled before entering the sequence counter write side critical
section.

The dma-buf reservation subsystem uses plain sequence counters to manage
updates to reservations. Writer serialization is accomplished through a
wound/wait mutex.

Acquiring a wound/wait mutex does not disable preemption, so this needs
to be done manually before and after the write side critical section.

Use the newly-added seqcount_ww_mutex_t instead:

  - It associates the ww_mutex with the sequence count, which enables
    lockdep to validate that the write side critical section is properly
    serialized.

  - It removes the need to explicitly add preempt_disable/enable()
    around the write side critical section because the write_begin/end()
    functions for this new data type automatically do this.

If lockdep is disabled this ww_mutex lock association is compiled out
and has neither storage size nor runtime overhead.

Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c                       | 8 +-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 --
 include/linux/dma-resv.h                         | 2 +-
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 15efa0c2dacb..a7631352a486 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -129,7 +129,7 @@ subsys_initcall(dma_resv_lockdep);
 void dma_resv_init(struct dma_resv *obj)
 {
 	ww_mutex_init(&obj->lock, &reservation_ww_class);
-	seqcount_init(&obj->seq);
+	seqcount_ww_mutex_init(&obj->seq, &obj->lock);
 
 	RCU_INIT_POINTER(obj->fence, NULL);
 	RCU_INIT_POINTER(obj->fence_excl, NULL);
@@ -260,7 +260,6 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 	fobj = dma_resv_get_list(obj);
 	count = fobj->shared_count;
 
-	preempt_disable();
 	write_seqcount_begin(&obj->seq);
 
 	for (i = 0; i < count; ++i) {
@@ -282,7 +281,6 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 	smp_store_mb(fobj->shared_count, count);
 
 	write_seqcount_end(&obj->seq);
-	preempt_enable();
 	dma_fence_put(old);
 }
 EXPORT_SYMBOL(dma_resv_add_shared_fence);
@@ -309,14 +307,12 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 	if (fence)
 		dma_fence_get(fence);
 
-	preempt_disable();
 	write_seqcount_begin(&obj->seq);
 	/* write_seqcount_begin provides the necessary memory barrier */
 	RCU_INIT_POINTER(obj->fence_excl, fence);
 	if (old)
 		old->shared_count = 0;
 	write_seqcount_end(&obj->seq);
-	preempt_enable();
 
 	/* inplace update, no shared fences */
 	while (i--)
@@ -394,13 +390,11 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 	src_list = dma_resv_get_list(dst);
 	old = dma_resv_get_excl(dst);
 
-	preempt_disable();
 	write_seqcount_begin(&dst->seq);
 	/* write_seqcount_begin provides the necessary memory barrier */
 	RCU_INIT_POINTER(dst->fence_excl, new);
 	RCU_INIT_POINTER(dst->fence, dst_list);
 	write_seqcount_end(&dst->seq);
-	preempt_enable();
 
 	dma_resv_list_free(src_list);
 	dma_fence_put(old);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index b91b5171270f..ff4b583cb96a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -258,11 +258,9 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 	new->shared_count = k;
 
 	/* Install the new fence list, seqcount provides the barriers */
-	preempt_disable();
 	write_seqcount_begin(&resv->seq);
 	RCU_INIT_POINTER(resv->fence, new);
 	write_seqcount_end(&resv->seq);
-	preempt_enable();
 
 	/* Drop the references to the removed fences or move them to ef_list */
 	for (i = j, k = 0; i < old->shared_count; ++i) {
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index a6538ae7d93f..d44a77e8a7e3 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -69,7 +69,7 @@ struct dma_resv_list {
  */
 struct dma_resv {
 	struct ww_mutex lock;
-	seqcount_t seq;
+	seqcount_ww_mutex_t seq;
 
 	struct dma_fence __rcu *fence_excl;
 	struct dma_resv_list __rcu *fence;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
