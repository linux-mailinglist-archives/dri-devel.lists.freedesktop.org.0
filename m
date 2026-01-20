Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6370D3C64B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9343E10E05E;
	Tue, 20 Jan 2026 10:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bXV9MDbp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4441E10E05E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:57:02 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-47ee301a06aso48868255e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 02:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768906621; x=1769511421; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uPcY52fE/iO1eWRTi79Yu0z45qjJ88kknPhn45Lj+ec=;
 b=bXV9MDbppUox2mSkbWCqEst4bFVZYJ4BgoaLcJAnLYFOTvWv8nLGond2Z7lVc4D3qT
 /7F3nbRtkCbiIwCxjwqAWB7b4EPZebtTWvUQ08QD/W9DFiYmHOrTgr5VM/oQLe3GCmWI
 VVLGzjDe4+vtm5R+sM7DIwLZOr6MdanVPg2b8Zkil4fpqNlg+K5EDqoSxbrS89DvaBm0
 4ENr6PSQMQ88y6GLBdg9OhZdxXK1VRI3v0FVupyJvgoYGOKRB/RAxk8P7thelMk1uBuY
 1J2UTwOJm1BQlayyCsjuL/LxDzwUdm3nO2eggAdoD8m8fMx4+VWj5nRpa2xnlDA7PXVg
 qSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768906621; x=1769511421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uPcY52fE/iO1eWRTi79Yu0z45qjJ88kknPhn45Lj+ec=;
 b=jGf/bUvzG6r7jjdLuTFjGxaGSsV75pkTlM+M4Iza98rqQ/G8PIV0XEXxHhfyfwCy1h
 yjNt56uNRQt9v3I4A3Sr6LuKtdlLgnN1UH7lIoBZq45fHpBX/2v7/9Yn1j+XC0BHV8KG
 Nfb0D02XuJw/aYStn1xBpoTErLGDfAIwlDd2y40MOcHJVjFQ7An5GvHDlOV6VPJJam5V
 oVew47S4J3xMWmKlU6b25j9yPCmVugb0t7HrkvKKM6UP7npy3blQ7S92RAYHprjbfqP5
 q6B/ZgghOD+xxGXaDe1LWNOum7Rd60RyGnqOEm4lhdaX1wacoBTWHmh/UQNGzI5uB7xl
 Bx8Q==
X-Gm-Message-State: AOJu0Yz4r6L47oQdzZk+Wb+51iomvJNufwsNEMcXl3A4F9DWDU0XkJo5
 g5Yp+0v5qvQ/PgLcixY5dn5IGM2v5Qy633100URzQzwLfj6WVLRRoZzs
X-Gm-Gg: AY/fxX4Zp6zhPdAXb1awGjyX1wT/6+CvSQstPw16pl2G6jtnBmCS9841t/K8YLEfEpp
 IyqsoY+QHFYH4VrtP2QHE0kTGvV4y1pB+DhiAKU2hLnX7VIrR9uXhTcvtigU+asVuVYTpwyDkyV
 Qt8MFeIIW4+FLtQE4ZH8lGCqOFARqmJJTci2trbtVUOnv6CoHJ0z1l9ZTA3NqfvVokPg4oFT2zU
 owkMzaq0lcg8RgoQB5cqop2OfMmW6aBXVD0XZW/l2IryLhScqbCDASGngRQ19h5iv5dUWM6TpzO
 mzXHTtfATsx+pcyOceFyiy09rhbpMW1dEWxrdwMVjQc6rzNKhiHY7srIyqKnIQTB31MDZuBH/Yl
 ACA6lpUP5V4sURt5QXLIZ0MVNmksTsbMc/RgO72OzvrKT4+FmKY6bb0ASjW3ZFSf8GjTPAbj7BR
 o2Tu+YB1Qn4GL+2WSiCTaVdlwo
X-Received: by 2002:a05:600c:1f0d:b0:47e:e970:cf28 with SMTP id
 5b1f17b1804b1-4801eb0e144mr169505745e9.30.1768906620345; 
 Tue, 20 Jan 2026 02:57:00 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1563:d000:1067:f6c4:3bf8:ea8a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fe67780sm99418105e9.16.2026.01.20.02.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 02:56:59 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/9] dma-buf: protected fence ops by RCU v5
Date: Tue, 20 Jan 2026 11:54:41 +0100
Message-ID: <20260120105655.7134-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120105655.7134-1-christian.koenig@amd.com>
References: <20260120105655.7134-1-christian.koenig@amd.com>
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
index c9a036b0d592..d52f30e1a289 100644
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
index 9c4d25289239..6bf4feb0e01f 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -67,7 +67,7 @@ struct seq_file;
  */
 struct dma_fence {
 	spinlock_t *lock;
-	const struct dma_fence_ops *ops;
+	const struct dma_fence_ops __rcu *ops;
 	/*
 	 * We clear the callback list on kref_put so that by the time we
 	 * release the fence it is unused. No one should be adding to the
@@ -220,6 +220,10 @@ struct dma_fence_ops {
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
@@ -231,6 +235,13 @@ struct dma_fence_ops {
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
 
@@ -454,13 +465,19 @@ dma_fence_test_signaled_flag(struct dma_fence *fence)
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
@@ -484,13 +501,19 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
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

