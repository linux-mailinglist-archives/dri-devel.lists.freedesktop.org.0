Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD17C580C0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A0310E837;
	Thu, 13 Nov 2025 14:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QWqlgn1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB63C10E832
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:53:37 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b735ce67d1dso51342966b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763045616; x=1763650416; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3XINXhEu5oC16+jt5gkZHRBRUxNkWVviR3UNrdpgsXM=;
 b=QWqlgn1NED6pjLa+G+1TK7swAOkMT7PbzyhOzVahM9OJaY7d34G1CK7iA+air7r6RY
 VdTscQUJX8DBW8Ssv5xXkVLCUucj77jtPiRZasWz4MKTMI5YXoVPIqSjifAQAjtTv4AY
 G4iQsG1YlvhjtgF43rqHXSPw3bIVjd+0MCIYfu9GSr2wSK7yDAGMY2svuh1L6H57ftiX
 TZ88eiFyyGAyCF+Bm2jL5RhuSG3kc37/162csU9qm6ThGOsKFv90TRng9A2gKxMH+F+o
 2ehvtoQyaUcpkObrYYSAIw4IVYdd97S0REC1hOq97A48BHGOEf9BWQN9oAig4p2TNfRg
 gYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045616; x=1763650416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3XINXhEu5oC16+jt5gkZHRBRUxNkWVviR3UNrdpgsXM=;
 b=kZr3zO95+xt+owrPb/z6+LlUkU50/TIryes/ycKH13dbeIrKxk+PWNxxXcnE8/n1/O
 dh5S9gxz5vqJ/Am2uRdI4rpXpmIe0B+QRAnZ2hDHB5l6sajY48m9IJ3xiY920GVV8rx+
 7AEsp3RYzgDKG2sq5TcMLX8aJka8CG/Tjp8CFniY0bzhXmxUyyXHScA1pNJXAWgRA9xJ
 2DZT3Nk+c+D4tUD/MQEZfwPl2h7mRKf71uQbs00prT8fdcRtdfHZC/wmrHXR8lmt6RQq
 4Z1SgLmFYk8nnrGF6neWaCFFz7AMsVBmCp+1a23IEhwspfaTTR1mdmTu2eW4Si/MP4tu
 XSwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgwEwJeLb1icny3kAYz8D5YKBf3VVe6mBArQEzHj9peuZ5mViMFWUv/GWfnSfZcAMqvDShleXuCvs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziGUaUkmUV7YxAXWzZ9cQqy3yqLzhqYTFn3+bMfpfGSPzgXVTz
 jbbpJl88TMgTiBHMlNjMChVDYBOcv2HyxJ5SBX7C5fI4Sm6VuV8judeT
X-Gm-Gg: ASbGncsnfpdbrS3La+KKzoCnIuuHMc+Q3IKvPx7W/hZkfeTAfw0XSfboujP9HFoXr+/
 tWP2vmN3cCt+cCRudVQNI1fK94Ix8+O0QzLyaF66BUoQR57CSTNhB2+ahFRqJ5WLwDmvZfzJdOj
 K4poJMkg+ZQn3ZTGc0NV6Mo9gRiaroBbHEkRRx409HM5zEwQz9ZtbFuBDgFdTvIXSUa7I0xZa3N
 5Mym3YD9YPIV0iW7X0Ap8HnjUTi3O8GmsTMYJYLjAgHlelrS9h5xg9o/pSPcFit52J/wzYvXxi0
 C0zMk6SuKxN5AvMg+4ISpJfZKCDKn8KBhOkxHYDIjYVnWondfkVIbned61x/4c1QNFnpWQssNYZ
 e7bQXFWeHzgTp2dXY0GXOThrX5FKzoQhVSOA4iAxTaKLd1AoQkLTWlh4k10H0URUP0pBxU5tbWZ
 Lz/q12tbDJmpU=
X-Google-Smtp-Source: AGHT+IGWGSV+gzTHfP+YQJBRlv66JbDSiRxo+k0qq2iOkMIosGKQhV3+GrJiZNAuovnFS4whV8ja1A==
X-Received: by 2002:a17:906:4794:b0:b73:42df:27a with SMTP id
 a640c23a62f3a-b7342df0b7emr480776366b.1.1763045616155; 
 Thu, 13 Nov 2025 06:53:36 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15aa:c600:cef:d94:436c:abc5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm173747166b.1.2025.11.13.06.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:53:35 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Subject: [PATCH 02/18] dma-buf: protected fence ops by RCU v3
Date: Thu, 13 Nov 2025 15:51:39 +0100
Message-ID: <20251113145332.16805-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113145332.16805-1-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
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

At first glance it is counter intuitive to protect a constant function
pointer table by RCU, but this allows modules providing the function
table to unload by waiting for an RCU grace period.

v2: make one the now duplicated lockdep warnings a comment instead.
v3: Add more documentation to ->wait and ->release callback.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++------------
 include/linux/dma-fence.h   | 29 ++++++++++++++--
 2 files changed, 73 insertions(+), 25 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index b4f5c8635276..ec21be9b089a 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -498,6 +498,7 @@ EXPORT_SYMBOL(dma_fence_signal);
 signed long
 dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 {
+	const struct dma_fence_ops *ops;
 	signed long ret;
 
 	if (WARN_ON(timeout < 0))
@@ -509,15 +510,21 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 
 	dma_fence_enable_sw_signaling(fence);
 
-	if (trace_dma_fence_wait_start_enabled()) {
-		rcu_read_lock();
-		trace_dma_fence_wait_start(fence);
+	rcu_read_lock();
+	ops = rcu_dereference(fence->ops);
+	trace_dma_fence_wait_start(fence);
+	if (ops->wait) {
+		/*
+		 * Implementing the wait ops is deprecated and not supported for
+		 * issuer independent fences, so it is ok to use the ops outside
+		 * the RCU protected section.
+		 */
+		rcu_read_unlock();
+		ret = ops->wait(fence, intr, timeout);
+	} else {
 		rcu_read_unlock();
-	}
-	if (fence->ops->wait)
-		ret = fence->ops->wait(fence, intr, timeout);
-	else
 		ret = dma_fence_default_wait(fence, intr, timeout);
+	}
 	if (trace_dma_fence_wait_end_enabled()) {
 		rcu_read_lock();
 		trace_dma_fence_wait_end(fence);
@@ -538,6 +545,7 @@ void dma_fence_release(struct kref *kref)
 {
 	struct dma_fence *fence =
 		container_of(kref, struct dma_fence, refcount);
+	const struct dma_fence_ops *ops;
 
 	rcu_read_lock();
 	trace_dma_fence_destroy(fence);
@@ -569,12 +577,12 @@ void dma_fence_release(struct kref *kref)
 		spin_unlock_irqrestore(fence->lock, flags);
 	}
 
-	rcu_read_unlock();
-
-	if (fence->ops->release)
-		fence->ops->release(fence);
+	ops = rcu_dereference(fence->ops);
+	if (ops->release)
+		ops->release(fence);
 	else
 		dma_fence_free(fence);
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL(dma_fence_release);
 
@@ -593,6 +601,7 @@ EXPORT_SYMBOL(dma_fence_free);
 
 static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 {
+	const struct dma_fence_ops *ops;
 	bool was_set;
 
 	lockdep_assert_held(fence->lock);
@@ -603,14 +612,18 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return false;
 
-	if (!was_set && fence->ops->enable_signaling) {
+	rcu_read_lock();
+	ops = rcu_dereference(fence->ops);
+	if (!was_set && ops->enable_signaling) {
 		trace_dma_fence_enable_signal(fence);
 
-		if (!fence->ops->enable_signaling(fence)) {
+		if (!ops->enable_signaling(fence)) {
+			rcu_read_unlock();
 			dma_fence_signal_locked(fence);
 			return false;
 		}
 	}
+	rcu_read_unlock();
 
 	return true;
 }
@@ -983,8 +996,13 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
  */
 void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 {
-	if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
-		fence->ops->set_deadline(fence, deadline);
+	const struct dma_fence_ops *ops;
+
+	rcu_read_lock();
+	ops = rcu_dereference(fence->ops);
+	if (ops->set_deadline && !dma_fence_is_signaled(fence))
+		ops->set_deadline(fence, deadline);
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL(dma_fence_set_deadline);
 
@@ -1025,7 +1043,12 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
 
 	kref_init(&fence->refcount);
-	fence->ops = ops;
+	/*
+	 * At first glance it is counter intuitive to protect a constant
+	 * function pointer table by RCU, but this allows modules providing the
+	 * function table to unload by waiting for an RCU grace period.
+	 */
+	RCU_INIT_POINTER(fence->ops, ops);
 	INIT_LIST_HEAD(&fence->cb_list);
 	fence->lock = lock;
 	fence->context = context;
@@ -1105,11 +1128,12 @@ EXPORT_SYMBOL(dma_fence_init64);
  */
 const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
 {
-	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
-			 "RCU protection is required for safe access to returned string");
+	const struct dma_fence_ops *ops;
 
+	/* RCU protection is required for safe access to returned string */
+	ops = rcu_dereference(fence->ops);
 	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		return fence->ops->get_driver_name(fence);
+		return ops->get_driver_name(fence);
 	else
 		return "detached-driver";
 }
@@ -1137,11 +1161,12 @@ EXPORT_SYMBOL(dma_fence_driver_name);
  */
 const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
 {
-	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
-			 "RCU protection is required for safe access to returned string");
+	const struct dma_fence_ops *ops;
 
+	/* RCU protection is required for safe access to returned string */
+	ops = rcu_dereference(fence->ops);
 	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		return fence->ops->get_timeline_name(fence);
+		return ops->get_timeline_name(fence);
 	else
 		return "signaled-timeline";
 }
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 64639e104110..77f07735f556 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -66,7 +66,7 @@ struct seq_file;
  */
 struct dma_fence {
 	spinlock_t *lock;
-	const struct dma_fence_ops *ops;
+	const struct dma_fence_ops __rcu *ops;
 	/*
 	 * We clear the callback list on kref_put so that by the time we
 	 * release the fence it is unused. No one should be adding to the
@@ -218,6 +218,10 @@ struct dma_fence_ops {
 	 * timed out. Can also return other error values on custom implementations,
 	 * which should be treated as if the fence is signaled. For example a hardware
 	 * lockup could be reported like that.
+	 *
+	 * Implementing this callback prevents the BO from detaching after
+	 * signaling and so it is mandatory for the module providing the
+	 * dma_fence_ops to stay loaded as long as the dma_fence exists.
 	 */
 	signed long (*wait)(struct dma_fence *fence,
 			    bool intr, signed long timeout);
@@ -229,6 +233,13 @@ struct dma_fence_ops {
 	 * Can be called from irq context.  This callback is optional. If it is
 	 * NULL, then dma_fence_free() is instead called as the default
 	 * implementation.
+	 *
+	 * Implementing this callback prevents the BO from detaching after
+	 * signaling and so it is mandatory for the module providing the
+	 * dma_fence_ops to stay loaded as long as the dma_fence exists.
+	 *
+	 * If the callback is implemented the memory backing the dma_fence
+	 * object must be freed RCU safe.
 	 */
 	void (*release)(struct dma_fence *fence);
 
@@ -418,13 +429,19 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
 static inline bool
 dma_fence_is_signaled_locked(struct dma_fence *fence)
 {
+	const struct dma_fence_ops *ops;
+
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return true;
 
-	if (fence->ops->signaled && fence->ops->signaled(fence)) {
+	rcu_read_lock();
+	ops = rcu_dereference(fence->ops);
+	if (ops->signaled && ops->signaled(fence)) {
+		rcu_read_unlock();
 		dma_fence_signal_locked(fence);
 		return true;
 	}
+	rcu_read_unlock();
 
 	return false;
 }
@@ -448,13 +465,19 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 static inline bool
 dma_fence_is_signaled(struct dma_fence *fence)
 {
+	const struct dma_fence_ops *ops;
+
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return true;
 
-	if (fence->ops->signaled && fence->ops->signaled(fence)) {
+	rcu_read_lock();
+	ops = rcu_dereference(fence->ops);
+	if (ops->signaled && ops->signaled(fence)) {
+		rcu_read_unlock();
 		dma_fence_signal(fence);
 		return true;
 	}
+	rcu_read_unlock();
 
 	return false;
 }
-- 
2.43.0

