Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B519FA7A0C8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 12:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133C610E095;
	Thu,  3 Apr 2025 10:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cVlBjpfV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C342A10E095;
 Thu,  3 Apr 2025 10:15:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B78675C6677;
 Thu,  3 Apr 2025 10:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4932CC4CEE3;
 Thu,  3 Apr 2025 10:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743675344;
 bh=Y5lfKBIHipEzLx3pRzlfCRd1YVUuZIoPVyyxseg8ZRI=;
 h=From:To:Cc:Subject:Date:From;
 b=cVlBjpfVoI5iXt6biIGOugHzCgetf6T+X7OsygIQ3EeJaFKlp3/iRtaZBPnKqjMQa
 NcETm9+IbOnfpk11YK2QIQcAYDO5LPw/INgTCDj/+JKbglsTrfPCGLMCtd1Grbhlyp
 qaGhsFdGbjL4j/15R6gPTw4BYqZTDmgFxaUMUqSL1zUz0XHgXey6Hj6j1oqsuma2Xw
 481dS1xkvUZYeR5J+BvJo82JjXpa3lktdGLpEEfNPx1mXIboVHH4+ZfpU96uvEI5o7
 IDEY760y5oExSByhc4tianjkdziAGaJm/9ub1gGLx7gQMxiscYh/TeUuB73M4KeRmF
 qc/SAU8hNQJQQ==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Philipp Stanner <phasta@kernel.org>,
 stable@vger.kernel.org
Subject: [PATCH v2] drm/nouveau: Prevent signalled fences in pending list
Date: Thu,  3 Apr 2025 12:13:54 +0200
Message-ID: <20250403101353.42880-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
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

Nouveau currently relies on the assumption that dma_fences will only
ever get signalled through nouveau_fence_signal(), which takes care of
removing a signalled fence from the list nouveau_fence_chan.pending.

This self-imposed rule is violated in nouveau_fence_done(), where
dma_fence_is_signaled() can signal the fence without removing it from
the list. This enables accesses to already signalled fences through the
list, which is a bug.

Furthermore, it must always be possible to use standard dma_fence
methods an a dma_fence and observe valid behavior. The canonical way of
ensuring that signalling a fence has additional effects is to add those
effects to a callback and register it on that fence.

Move the code from nouveau_fence_signal() into a dma_fence callback.
Register that callback when creating the fence.

Cc: <stable@vger.kernel.org> # 4.10+
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v2:
  - Remove Fixes: tag. (Danilo)
  - Remove integer "drop" and call nvif_event_block() in the fence
    callback. (Danilo)
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 52 +++++++++++++------------
 drivers/gpu/drm/nouveau/nouveau_fence.h |  1 +
 2 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 7cc84472cece..cf510ef9641a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -50,24 +50,24 @@ nouveau_fctx(struct nouveau_fence *fence)
 	return container_of(fence->base.lock, struct nouveau_fence_chan, lock);
 }
 
-static int
-nouveau_fence_signal(struct nouveau_fence *fence)
+static void
+nouveau_fence_cleanup_cb(struct dma_fence *dfence, struct dma_fence_cb *cb)
 {
-	int drop = 0;
+	struct nouveau_fence_chan *fctx;
+	struct nouveau_fence *fence;
+
+	fence = container_of(dfence, struct nouveau_fence, base);
+	fctx = nouveau_fctx(fence);
 
-	dma_fence_signal_locked(&fence->base);
 	list_del(&fence->head);
 	rcu_assign_pointer(fence->channel, NULL);
 
 	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags)) {
-		struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
-
 		if (!--fctx->notify_ref)
-			drop = 1;
+			nvif_event_block(&fctx->event);
 	}
 
 	dma_fence_put(&fence->base);
-	return drop;
 }
 
 static struct nouveau_fence *
@@ -93,8 +93,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 		if (error)
 			dma_fence_set_error(&fence->base, error);
 
-		if (nouveau_fence_signal(fence))
-			nvif_event_block(&fctx->event);
+		dma_fence_signal_locked(&fence->base);
 	}
 	fctx->killed = 1;
 	spin_unlock_irqrestore(&fctx->lock, flags);
@@ -127,11 +126,10 @@ nouveau_fence_context_free(struct nouveau_fence_chan *fctx)
 	kref_put(&fctx->fence_ref, nouveau_fence_context_put);
 }
 
-static int
+static void
 nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fctx)
 {
 	struct nouveau_fence *fence;
-	int drop = 0;
 	u32 seq = fctx->read(chan);
 
 	while (!list_empty(&fctx->pending)) {
@@ -140,10 +138,8 @@ nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fc
 		if ((int)(seq - fence->base.seqno) < 0)
 			break;
 
-		drop |= nouveau_fence_signal(fence);
+		dma_fence_signal_locked(&fence->base);
 	}
-
-	return drop;
 }
 
 static void
@@ -152,7 +148,6 @@ nouveau_fence_uevent_work(struct work_struct *work)
 	struct nouveau_fence_chan *fctx = container_of(work, struct nouveau_fence_chan,
 						       uevent_work);
 	unsigned long flags;
-	int drop = 0;
 
 	spin_lock_irqsave(&fctx->lock, flags);
 	if (!list_empty(&fctx->pending)) {
@@ -161,11 +156,8 @@ nouveau_fence_uevent_work(struct work_struct *work)
 
 		fence = list_entry(fctx->pending.next, typeof(*fence), head);
 		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
-		if (nouveau_fence_update(chan, fctx))
-			drop = 1;
+		nouveau_fence_update(chan, fctx);
 	}
-	if (drop)
-		nvif_event_block(&fctx->event);
 
 	spin_unlock_irqrestore(&fctx->lock, flags);
 }
@@ -235,6 +227,19 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 			       &fctx->lock, fctx->context, ++fctx->sequence);
 	kref_get(&fctx->fence_ref);
 
+	fence->cb.func = nouveau_fence_cleanup_cb;
+	/* Adding a callback runs into __dma_fence_enable_signaling(), which will
+	 * ultimately run into nouveau_fence_no_signaling(), where a WARN_ON
+	 * would fire because the refcount can be dropped there.
+	 *
+	 * Increment the refcount here temporarily to work around that.
+	 */
+	dma_fence_get(&fence->base);
+	ret = dma_fence_add_callback(&fence->base, &fence->cb, nouveau_fence_cleanup_cb);
+	dma_fence_put(&fence->base);
+	if (ret)
+		return ret;
+
 	ret = fctx->emit(fence);
 	if (!ret) {
 		dma_fence_get(&fence->base);
@@ -246,8 +251,7 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 			return -ENODEV;
 		}
 
-		if (nouveau_fence_update(chan, fctx))
-			nvif_event_block(&fctx->event);
+		nouveau_fence_update(chan, fctx);
 
 		list_add_tail(&fence->head, &fctx->pending);
 		spin_unlock_irq(&fctx->lock);
@@ -270,8 +274,8 @@ nouveau_fence_done(struct nouveau_fence *fence)
 
 		spin_lock_irqsave(&fctx->lock, flags);
 		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
-		if (chan && nouveau_fence_update(chan, fctx))
-			nvif_event_block(&fctx->event);
+		if (chan)
+			nouveau_fence_update(chan, fctx);
 		spin_unlock_irqrestore(&fctx->lock, flags);
 	}
 	return dma_fence_is_signaled(&fence->base);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 8bc065acfe35..e6b2df7fdc42 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -10,6 +10,7 @@ struct nouveau_bo;
 
 struct nouveau_fence {
 	struct dma_fence base;
+	struct dma_fence_cb cb;
 
 	struct list_head head;
 
-- 
2.48.1

