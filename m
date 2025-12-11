Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DCFCB5CEB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6BB10E7F2;
	Thu, 11 Dec 2025 12:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S+FbQ4+z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D5810E7F0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:21 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso142425e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455860; x=1766060660; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qX70Q0zfB3jKNj6LjxUD9riq7dAsRvS5ADCd21ud4vM=;
 b=S+FbQ4+zuamd/FgE67OOOAGEQuKA9LLLQSZTEzV+tkGG3FrajRw5QNw6tnhV5LiOKO
 skMaee65UyDYwgyPiXzzhIoZp58ky5vz6pKB2OYHGrCM9zLeTb65zRQ2eWkDgUtTfCBO
 FVDPFXLMzvkSlYrtRgRALmEnoq1TnnhPTsCbUsd+OTNekVQVJsOtJCN4mt0e/d31d+DJ
 4aVRdRR96KXeTJicnh1veovBxhUt+EKrC1wGuImDtWA+TIgKPJvoc+N9l9IBoZwbPDwh
 y9Uj0ojLtgaYZbCm5yY6G7FbK3RIoBxKkq2Or+iOKwCO5u/vBXHeoARJbMiDW2NvcwTC
 f4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455860; x=1766060660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qX70Q0zfB3jKNj6LjxUD9riq7dAsRvS5ADCd21ud4vM=;
 b=IGgEGetD5EXR9HgDtU0fE9ucL4sOmAfRVGN/IZ6C94kf0+A5/Jp3ZU32p1eLMgS+0o
 Wxv6EFAhqaPRbCGVP/j/iz0pEnqdqI+wIRLwJJ7KkPG5Is3Mq+xXTSyb0Y4SK5GdLasn
 8Qoz3gVXhSvmmPKuRGPM0xTLCjcn4T0tTL1tsx0xJT0riAa7MGS1YhUmO1D70VAn1/j7
 hNwLuET+E/WpQX2a9c/UMeJ4a8PwQfocsuMle1Gmnhqsc9aX0kHbDCj8XkolML5mrIQP
 UO4iU8hZQUpeW/4x2ew9+qD2Knv70yso8tOFguGsIEjr0Jem7IX7MABV5INfabH6Eqyb
 T9pw==
X-Gm-Message-State: AOJu0Yx1W8eZviVCcJigtbWm5aS7DbQKh044w9ht07QDGAJ4EMWRs095
 QrA0fqFDCjOjnUByNE3bvCT/RVqU2I1BS28ihPAujnhUP+06xIPjyD1R
X-Gm-Gg: AY/fxX7QRPw8FrgGzP7YvgkzIp46nZEhmY0gCKUtUpIx644XKfg1tAbXYOgWOHojWq1
 4b0BHwyJtB/rlYTvxdQJib0h1qyi2+BB0y4I5/wHx/FpF+mlboD0PNnZKMVL+iROz9OqXn3zGAx
 sQJl+w+Z9lL1Ihwu4uKLZTr69qxVn6eujMdQVxW2KbQGnWoT+zqOdRwqto/9VdQkBZGo8NCT4rX
 u/NHQlsedOJIAYHrGTqurFfWyrIhwUPnC7OI62oZ0AVYDBW3Zy0YcD0XSWfJfvJYGXjBBarAhR4
 HXqzjmiMom/cEDgvf08gbcb6ooJelXBO1Slmb1zUhqQ54dCI0VUk7+4V2zXW8Nrhw3RBdaBI5sY
 iXVNrbWlf20+UXDi76ad0+RN9499Yu0Xk3uwyFqXLEGDE88JcCEJODbJAJM5nQtqnTllBgbiQMI
 7SwYSn31j/udHDRuIadStwBax9
X-Google-Smtp-Source: AGHT+IGJ+bTeSnsSzPmD9Clj/y778RW0ms/meqAZ09tQT2iYOxFdHyJ06AXIpDpi6o507traLW9rxg==
X-Received: by 2002:a05:600c:a42:b0:46e:32dd:1b1a with SMTP id
 5b1f17b1804b1-47a8379484amr55500685e9.7.1765455859489; 
 Thu, 11 Dec 2025 04:24:19 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:19 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 11/19] drm/amdgpu: independence for the amdgpu_fence! v2
Date: Thu, 11 Dec 2025 13:16:42 +0100
Message-ID: <20251211122407.1709-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211122407.1709-1-christian.koenig@amd.com>
References: <20251211122407.1709-1-christian.koenig@amd.com>
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

This allows amdgpu_fences to outlive the amdgpu module.

v2: use dma_fence_get_rcu_safe to be NULL safe here.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 63 +++++++----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h  |  1 -
 2 files changed, 20 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index c7843e336310..c636347801c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -112,8 +112,7 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct amdgpu_fence *af,
 	af->ring = ring;
 
 	seq = ++ring->fence_drv.sync_seq;
-	dma_fence_init(fence, &amdgpu_fence_ops,
-		       &ring->fence_drv.lock,
+	dma_fence_init(fence, &amdgpu_fence_ops, NULL,
 		       adev->fence_context + ring->idx, seq);
 
 	amdgpu_ring_emit_fence(ring, ring->fence_drv.gpu_addr,
@@ -467,7 +466,6 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring)
 	timer_setup(&ring->fence_drv.fallback_timer, amdgpu_fence_fallback, 0);
 
 	ring->fence_drv.num_fences_mask = ring->num_hw_submission * 2 - 1;
-	spin_lock_init(&ring->fence_drv.lock);
 	ring->fence_drv.fences = kcalloc(ring->num_hw_submission * 2, sizeof(void *),
 					 GFP_KERNEL);
 
@@ -654,16 +652,20 @@ void amdgpu_fence_driver_set_error(struct amdgpu_ring *ring, int error)
 	struct amdgpu_fence_driver *drv = &ring->fence_drv;
 	unsigned long flags;
 
-	spin_lock_irqsave(&drv->lock, flags);
+	rcu_read_lock();
 	for (unsigned int i = 0; i <= drv->num_fences_mask; ++i) {
 		struct dma_fence *fence;
 
-		fence = rcu_dereference_protected(drv->fences[i],
-						  lockdep_is_held(&drv->lock));
-		if (fence && !dma_fence_is_signaled_locked(fence))
+		fence = dma_fence_get_rcu(drv->fences[i]);
+		if (!fence)
+			continue;
+
+		dma_fence_lock_irqsave(fence, flags);
+		if (!dma_fence_is_signaled_locked(fence))
 			dma_fence_set_error(fence, error);
+		dma_fence_unlock_irqrestore(fence, flags);
 	}
-	spin_unlock_irqrestore(&drv->lock, flags);
+	rcu_read_unlock();
 }
 
 /**
@@ -714,16 +716,19 @@ void amdgpu_fence_driver_guilty_force_completion(struct amdgpu_fence *af)
 	seq = ring->fence_drv.sync_seq & ring->fence_drv.num_fences_mask;
 
 	/* mark all fences from the guilty context with an error */
-	spin_lock_irqsave(&ring->fence_drv.lock, flags);
+	rcu_read_lock();
 	do {
 		last_seq++;
 		last_seq &= ring->fence_drv.num_fences_mask;
 
 		ptr = &ring->fence_drv.fences[last_seq];
-		rcu_read_lock();
-		unprocessed = rcu_dereference(*ptr);
+		unprocessed = dma_fence_get_rcu_safe(ptr);
+
+		if (!unprocessed)
+			continue;
 
-		if (unprocessed && !dma_fence_is_signaled_locked(unprocessed)) {
+		dma_fence_lock_irqsave(unprocessed, flags);
+		if (dma_fence_is_signaled_locked(unprocessed)) {
 			fence = container_of(unprocessed, struct amdgpu_fence, base);
 
 			if (fence == af)
@@ -731,9 +736,10 @@ void amdgpu_fence_driver_guilty_force_completion(struct amdgpu_fence *af)
 			else if (fence->context == af->context)
 				dma_fence_set_error(&fence->base, -ECANCELED);
 		}
-		rcu_read_unlock();
+		dma_fence_unlock_irqrestore(unprocessed, flags);
+		dma_fence_put(unprocessed);
 	} while (last_seq != seq);
-	spin_unlock_irqrestore(&ring->fence_drv.lock, flags);
+	rcu_read_unlock();
 	/* signal the guilty fence */
 	amdgpu_fence_write(ring, (u32)af->base.seqno);
 	amdgpu_fence_process(ring);
@@ -823,39 +829,10 @@ static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
 	return true;
 }
 
-/**
- * amdgpu_fence_free - free up the fence memory
- *
- * @rcu: RCU callback head
- *
- * Free up the fence memory after the RCU grace period.
- */
-static void amdgpu_fence_free(struct rcu_head *rcu)
-{
-	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
-
-	/* free fence_slab if it's separated fence*/
-	kfree(to_amdgpu_fence(f));
-}
-
-/**
- * amdgpu_fence_release - callback that fence can be freed
- *
- * @f: fence
- *
- * This function is called when the reference count becomes zero.
- * It just RCU schedules freeing up the fence.
- */
-static void amdgpu_fence_release(struct dma_fence *f)
-{
-	call_rcu(&f->rcu, amdgpu_fence_free);
-}
-
 static const struct dma_fence_ops amdgpu_fence_ops = {
 	.get_driver_name = amdgpu_fence_get_driver_name,
 	.get_timeline_name = amdgpu_fence_get_timeline_name,
 	.enable_signaling = amdgpu_fence_enable_signaling,
-	.release = amdgpu_fence_release,
 };
 
 /*
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 7a27c6c4bb44..9cbf63454004 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -125,7 +125,6 @@ struct amdgpu_fence_driver {
 	unsigned			irq_type;
 	struct timer_list		fallback_timer;
 	unsigned			num_fences_mask;
-	spinlock_t			lock;
 	struct dma_fence		**fences;
 };
 
-- 
2.43.0

