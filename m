Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D385A9AE47
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 15:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AEC10E7FB;
	Thu, 24 Apr 2025 13:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M8OaBxMw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A7210E7F1;
 Thu, 24 Apr 2025 13:03:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2A64F4A7F8;
 Thu, 24 Apr 2025 13:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1130C4CEE3;
 Thu, 24 Apr 2025 13:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745499789;
 bh=7HKtlHM65HuEx4XWBvP6kV1rjNjQ+ivJbYPYEkVX5fQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M8OaBxMwa5+pwS9Z9fqr7blGKVdU4MvbySsUzbZ3oIq/VUy6/gNEfW9mqIGPqcPpv
 szTiQwGU4sNbanmGK4oVx9F71hyBgmy3VCX0gDfteossxz4wikzfyeXyofvuz8zI1Q
 t4yJ0otnFaGQ3CY3mibzOvwABhU2P3jWvjbkLHnpIHhBEPujr5daB1tPwgVuzGDGY9
 WUOIq+UPUkStsajJL2qrPONxq3E/UdkBflUy9OWGE1FUKI6aY4U9Y6gzSqeTVYvTOI
 phFs8CiNMFxFrlVL2hSTTlbD5ag+ecB72/aC6Fw4a8Jcs0IxSrcwsVXHQK5ERIIxij
 Lh98iaybaaHlQ==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 2/4] drm/nouveau: Simplify calls to nvif_event_block()
Date: Thu, 24 Apr 2025 15:02:52 +0200
Message-ID: <20250424130254.42046-4-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250424130254.42046-2-phasta@kernel.org>
References: <20250424130254.42046-2-phasta@kernel.org>
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

nouveau_fence_signal() returns a de-facto boolean to indicate when
nvif_event_block() shall be called.

The code can be made more compact and readable by calling
nvif_event_block() in nouveau_fence_update() directly.

Make those calls in nouveau_fence.c more canonical.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 31 +++++++++++--------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 761c174cb286..2b79bcb7da16 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -50,10 +50,10 @@ nouveau_fctx(struct nouveau_fence *fence)
 	return container_of(fence->base.lock, struct nouveau_fence_chan, lock);
 }
 
-static int
+static bool
 nouveau_fence_signal(struct nouveau_fence *fence)
 {
-	int drop = 0;
+	bool drop = false;
 
 	dma_fence_signal_locked(&fence->base);
 	list_del(&fence->head);
@@ -63,7 +63,7 @@ nouveau_fence_signal(struct nouveau_fence *fence)
 		struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
 
 		if (!--fctx->notify_ref)
-			drop = 1;
+			drop = true;
 	}
 
 	dma_fence_put(&fence->base);
@@ -125,21 +125,23 @@ nouveau_fence_context_free(struct nouveau_fence_chan *fctx)
 	kref_put(&fctx->fence_ref, nouveau_fence_context_put);
 }
 
-static int
+static void
 nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fctx)
 {
 	struct nouveau_fence *fence, *tmp;
-	int drop = 0;
+	bool drop = false;
 	u32 seq = fctx->read(chan);
 
 	list_for_each_entry_safe(fence, tmp, &fctx->pending, head) {
 		if ((int)(seq - fence->base.seqno) < 0)
 			break;
 
-		drop |= nouveau_fence_signal(fence);
+		if (nouveau_fence_signal(fence))
+			drop = true;
 	}
 
-	return drop;
+	if (drop)
+		nvif_event_block(&fctx->event);
 }
 
 static void
@@ -150,18 +152,13 @@ nouveau_fence_uevent_work(struct work_struct *work)
 	struct nouveau_channel *chan;
 	struct nouveau_fence *fence;
 	unsigned long flags;
-	int drop = 0;
 
 	spin_lock_irqsave(&fctx->lock, flags);
 	fence = list_first_entry_or_null(&fctx->pending, typeof(*fence), head);
 	if (fence) {
 		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
-		if (nouveau_fence_update(chan, fctx))
-			drop = 1;
+		nouveau_fence_update(chan, fctx);
 	}
-	if (drop)
-		nvif_event_block(&fctx->event);
-
 	spin_unlock_irqrestore(&fctx->lock, flags);
 }
 
@@ -241,9 +238,7 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 			return -ENODEV;
 		}
 
-		if (nouveau_fence_update(chan, fctx))
-			nvif_event_block(&fctx->event);
-
+		nouveau_fence_update(chan, fctx);
 		list_add_tail(&fence->head, &fctx->pending);
 		spin_unlock_irq(&fctx->lock);
 	}
@@ -265,8 +260,8 @@ nouveau_fence_done(struct nouveau_fence *fence)
 
 		spin_lock_irqsave(&fctx->lock, flags);
 		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
-		if (chan && nouveau_fence_update(chan, fctx))
-			nvif_event_block(&fctx->event);
+		if (chan)
+			nouveau_fence_update(chan, fctx);
 		spin_unlock_irqrestore(&fctx->lock, flags);
 	}
 	return dma_fence_is_signaled(&fence->base);
-- 
2.48.1

