Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BA4A72BBB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 09:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324B110E880;
	Thu, 27 Mar 2025 08:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jL5ZmlWf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B58410E880;
 Thu, 27 Mar 2025 08:44:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B60365C687A;
 Thu, 27 Mar 2025 08:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34FACC4CEDD;
 Thu, 27 Mar 2025 08:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743065089;
 bh=30nxOy0/5vmflmamL0miLsXkRxuXtHblR/KuRi7mRLg=;
 h=From:To:Cc:Subject:Date:From;
 b=jL5ZmlWfSXM0Rwdhwb1TSadMqwmUtMzsS01aABGf31W9r2q5+y1V2Nt/EUYYapJ9c
 dVvuc63LIALfAyYWQzFS14Ro4JeSZO3JnsRs4RdadWDzONNjtpSBxCIUn3jxoq1mtz
 mZW11MhIy2OmitUrpiO2GCNTW8x+8PhEal1r4m1oUJKpHYESLxbvjaoFxnijOajoYP
 1yGs+02MwgiOnGBYUmolfNqljyPcGZubefyklVV8jXbNXep4ukgH7aoIBtsAsrA1iv
 9VTWoVPLfqyxV4egpeefQ9b5AE98bUXtyaiOTHTm7vEXG7ak4az7g1T6HXb+gAJBa5
 6cW20OyfN4MMw==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Philipp Stanner <phasta@kernel.org>,
 stable@vger.kernel.org
Subject: [PATCH] drm/nouveau: Prevent signalled fences in pending list
Date: Thu, 27 Mar 2025 09:42:57 +0100
Message-ID: <20250327084256.11201-2-phasta@kernel.org>
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
effects to a callback and register it on the fence.

Move the code from nouveau_fence_signal() into a dma_fence callback.
Register that callback when creating the fence.

Cc: <stable@vger.kernel.org> # 4.10+
Fixes: f54d1867005c ("dma-buf: Rename struct fence to dma_fence")
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
I'm not entirely sure what Fixes-Tag is appropriate. The last time the
line causing the signalled fence in the list was touched is the commit
listed above.
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 41 ++++++++++++++++---------
 drivers/gpu/drm/nouveau/nouveau_fence.h |  1 +
 2 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 7cc84472cece..b2c2241a8803 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -50,24 +50,22 @@ nouveau_fctx(struct nouveau_fence *fence)
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
 
-	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags)) {
-		struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
-
-		if (!--fctx->notify_ref)
-			drop = 1;
-	}
+	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags))
+		--fctx->notify_ref;
 
 	dma_fence_put(&fence->base);
-	return drop;
 }
 
 static struct nouveau_fence *
@@ -93,7 +91,8 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 		if (error)
 			dma_fence_set_error(&fence->base, error);
 
-		if (nouveau_fence_signal(fence))
+		dma_fence_signal_locked(&fence->base);
+		if (fctx->notify_ref == 0)
 			nvif_event_block(&fctx->event);
 	}
 	fctx->killed = 1;
@@ -131,7 +130,6 @@ static int
 nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fctx)
 {
 	struct nouveau_fence *fence;
-	int drop = 0;
 	u32 seq = fctx->read(chan);
 
 	while (!list_empty(&fctx->pending)) {
@@ -140,10 +138,10 @@ nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fc
 		if ((int)(seq - fence->base.seqno) < 0)
 			break;
 
-		drop |= nouveau_fence_signal(fence);
+		dma_fence_signal_locked(&fence->base);
 	}
 
-	return drop;
+	return fctx->notify_ref == 0 ? 1 : 0;
 }
 
 static void
@@ -235,6 +233,19 @@ nouveau_fence_emit(struct nouveau_fence *fence)
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

