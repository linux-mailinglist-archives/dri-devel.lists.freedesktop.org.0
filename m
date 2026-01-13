Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225FED19D2F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0283510E303;
	Tue, 13 Jan 2026 15:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h54IBPPv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6635C10E303
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:21:30 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso70492895e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768317689; x=1768922489; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erKK1znu6av2sHHLb+SDap4fmt5Y1VX2qPOQhGTx2Fo=;
 b=h54IBPPvwPsTSmv5fNKaGQZLGi4AfhIxXEx/i9uJ3p/UNDdole3/Gj94LcuYB9KnAg
 /rJ3UJEjFjegsUP6RoRgs2XkKaMDq+OZwjcVOstZ07VVIoaVCpEb08Qb9Vmk6WKYJDSc
 1mzcFbnq56DUWDf2zk2zL5n/x7zSd6riB6m7Gtuu7+xd4W63L6/kgsQ6Xoh/hLDOqo46
 4WqsYnxmGkR9xcxe/0eKMSkrLPbaP5KYm8fdmyxv+ucQH3yunAhV4cYbVh4vxBWlPFZW
 BhyIuNkpiL/BmlstbS84OJuezuhiD6HnsW44migGQwrNCqFUFRjm+dyznJDOvCyabomV
 zj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768317689; x=1768922489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=erKK1znu6av2sHHLb+SDap4fmt5Y1VX2qPOQhGTx2Fo=;
 b=s5VvpIuiPzsgIFxAidB1d97/Us60xzLJ/9Vsw2ru/9kdeEI/eZGYrh/CKELLhnLi/Q
 NBrFy7d1GuhTV3DHUT2znmN3LejC6PtTfUrOemzqWNYUhafR2xb5W+r8w5gKX54bMTie
 w62poKnSHIcOSF4JrKs7CswSPKF9KUenwMXVjMMoK7kWAL+oVeAOv1b/HxWzUimd09Hy
 nb5kGI370p1BmCclK7dwuuV9Fbsv67qYZdpf3ijJPXjNwT2DKlJJh7p8mD0VTls5SULA
 QLyDmFRGbK6QrPkTSj1Bk3FKr606K1HA2kRYP8AHUaCHkrKaR1oLsYgnaZlUsa89p/Ur
 4PYg==
X-Gm-Message-State: AOJu0Yx9p2xbc54/W31d0PjPPM/lmB9UAXXTAjZ24IrMII/VZqBDxPUr
 2gwdsliAm6v6gBbQ7ClS1yxx/PSGUMcd1x66rjDzOkJkxj09V3uL4zE9
X-Gm-Gg: AY/fxX6Z/XAO20/FxgXLX/JRougO5Nbm6Elx3f87ntUXpkqZVgoetnNVNLersReI3A/
 Q+1mxiKF55rPGSMUkZxv6n6aL3YWmz4pK1SZhS3lTopiiPXUNFr96uzyjoAVvkSxhSPivHjag/T
 6aNoP/x3oRV1XSTssSR2MtMWGNFFTCOt3YK8smFqPeSJALOSF6CfKbd+4zHrCNPqyBAdxqYDUAl
 OPfKGyuGmDg5GiVsisb7LY5S5wFb9eStdmPly4W9/ppoqwWfJVs2fsQVItE+31MDmaHywRhIt48
 tmB4P5QNmq4CvV05gB9fcS32BuMeJhCpu4oFws6OaNIAReBQLEKBZS/0QP6qfKgkbG7o+tDUBGj
 yPgM4hA6GBY0qusWChj4EJdt7VEujzlueP+nGFOmdRn3k8IbSSz/UVj9HVfLLZiKcfgphh8+8o4
 aR4olat843dbPz9HusMiZthsk=
X-Google-Smtp-Source: AGHT+IEQZRejatxAfuSj7ukpK1P1Uq6DjW5UQ1eY1ANVS3KXPWiBXqVrkjoCd0mhVDgjTsfeR9YDeA==
X-Received: by 2002:a05:600c:a16:b0:47b:de05:aa28 with SMTP id
 5b1f17b1804b1-47d84b0aadcmr210752755e9.2.1768317688749; 
 Tue, 13 Jan 2026 07:21:28 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:141c:9800:1651:dfa:9e48:25d5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ecf6a5466sm129518405e9.11.2026.01.13.07.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 07:21:28 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 01/10] dma-buf: protected fence ops by RCU v5
Date: Tue, 13 Jan 2026 16:16:08 +0100
Message-ID: <20260113152125.47380-2-christian.koenig@amd.com>
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

At first glance it is counter intuitive to protect a constant function
pointer table by RCU, but this allows modules providing the function
table to unload by waiting for an RCU grace period.

v2: make one the now duplicated lockdep warnings a comment instead.
v3: Add more documentation to ->wait and ->release callback.
v4: fix typo in documentation
v5: rebased on drm-tip

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++------------
 include/linux/dma-fence.h   | 29 ++++++++++++++--
 2 files changed, 73 insertions(+), 25 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 21c5c30b4f34..e3e74f98f58d 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -522,6 +522,7 @@ EXPORT_SYMBOL(dma_fence_signal);
 signed long
 dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 {
+	const struct dma_fence_ops *ops;
 	signed long ret;
 
 	if (WARN_ON(timeout < 0))
@@ -533,15 +534,21 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 
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
@@ -562,6 +569,7 @@ void dma_fence_release(struct kref *kref)
 {
 	struct dma_fence *fence =
 		container_of(kref, struct dma_fence, refcount);
+	const struct dma_fence_ops *ops;
 
 	rcu_read_lock();
 	trace_dma_fence_destroy(fence);
@@ -593,12 +601,12 @@ void dma_fence_release(struct kref *kref)
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
 
@@ -617,6 +625,7 @@ EXPORT_SYMBOL(dma_fence_free);
 
 static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 {
+	const struct dma_fence_ops *ops;
 	bool was_set;
 
 	lockdep_assert_held(fence->lock);
@@ -627,14 +636,18 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 	if (dma_fence_test_signaled_flag(fence))
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
@@ -1007,8 +1020,13 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
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
 
@@ -1049,7 +1067,12 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
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
@@ -1129,11 +1152,12 @@ EXPORT_SYMBOL(dma_fence_init64);
  */
 const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
 {
-	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
-			 "RCU protection is required for safe access to returned string");
+	const struct dma_fence_ops *ops;
 
+	/* RCU protection is required for safe access to returned string */
+	ops = rcu_dereference(fence->ops);
 	if (!dma_fence_test_signaled_flag(fence))
-		return fence->ops->get_driver_name(fence);
+		return ops->get_driver_name(fence);
 	else
 		return "detached-driver";
 }
@@ -1161,11 +1185,12 @@ EXPORT_SYMBOL(dma_fence_driver_name);
  */
 const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
 {
-	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
-			 "RCU protection is required for safe access to returned string");
+	const struct dma_fence_ops *ops;
 
+	/* RCU protection is required for safe access to returned string */
+	ops = rcu_dereference(fence->ops);
 	if (!dma_fence_test_signaled_flag(fence))
-		return fence->ops->get_timeline_name(fence);
+		return ops->get_timeline_name(fence);
 	else
 		return "signaled-timeline";
 }
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index d4c92fd35092..eea674acdfa6 100644
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
+	 * Implementing this callback prevents the fence from detaching after
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
+	 * Implementing this callback prevents the fence from detaching after
+	 * signaling and so it is mandatory for the module providing the
+	 * dma_fence_ops to stay loaded as long as the dma_fence exists.
+	 *
+	 * If the callback is implemented the memory backing the dma_fence
+	 * object must be freed RCU safe.
 	 */
 	void (*release)(struct dma_fence *fence);
 
@@ -439,13 +450,19 @@ dma_fence_test_signaled_flag(struct dma_fence *fence)
 static inline bool
 dma_fence_is_signaled_locked(struct dma_fence *fence)
 {
+	const struct dma_fence_ops *ops;
+
 	if (dma_fence_test_signaled_flag(fence))
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
@@ -469,13 +486,19 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 static inline bool
 dma_fence_is_signaled(struct dma_fence *fence)
 {
+	const struct dma_fence_ops *ops;
+
 	if (dma_fence_test_signaled_flag(fence))
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

