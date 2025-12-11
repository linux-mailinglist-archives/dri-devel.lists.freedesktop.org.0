Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869EBCB5CCB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84DC10E7EB;
	Thu, 11 Dec 2025 12:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KIcycspm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B5C10E7E7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:12 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so439065e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455851; x=1766060651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erKK1znu6av2sHHLb+SDap4fmt5Y1VX2qPOQhGTx2Fo=;
 b=KIcycspm+8/FLlq4AJapbWtvWD44Wo8j0CFN61gVoPhqnqU+lqtOrh58PhbfZL6nrn
 2QF1iQBEJvpygsd5Yj3A4ZkT7pDvJfu0JcJtsXJU+nRdJ4N5DgQ0OHI61EkRwCsHzUI3
 1WuVcKGHJBLBeJu34fao2AsnSrdpsIv5amo9X+kAEvWwlvfCPESzRNgoe48Mjvxxt2zM
 270+mOmgWks+A/CU0P6X1GMM+2B/C488Cb3kl4UKV8P3FtpbQOrRliMzH0IcrDqbxYta
 ISRRc7dZvwRbO7Y/VxAwikzK9J+x9qx6Lh937i9WTlXHpq+28Yz7ngd4f1mhAG9RX4yB
 3g8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455851; x=1766060651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=erKK1znu6av2sHHLb+SDap4fmt5Y1VX2qPOQhGTx2Fo=;
 b=V/766DZzy7ckNzwcC1nBK8s5XjVG5I2JldizUceYm15BgOXNWC/kQxLkEJHsY0K/m/
 uhpMbjgBVgfld8N/cj0P8OoJhRGV9wFLSgSNbAEJ1uwhrnSKrFJDTEso8mWVKGCfH24X
 eyo6Kg5GyxUUekcOuuKUEBwKs+vtqwMWiZguZawiNeqrtUQSipn1tqhERXW8Esf45wZX
 W7sicQeEfjJJw0I+GGsRUvRG+brrZEwEOiZMpkkIH0nLkxf1BEK8f3t0IkgdaHIIRcKx
 rPPEsE5fYhP6PHIx7E7VI3o4nOHnbI+1Tm4cFlukvOEw9VoKwXBkjf98FK9cLS4OfS/e
 74gQ==
X-Gm-Message-State: AOJu0Yw1cD3Hs6K+qZa9ksqoaZCqm77w3KjF4WPnI58b4spNC6PAz0oE
 4eNzDrjHilxW+fao7OGURHHwwTfmL5NOON99fOydLr7liYBtGKe2yVMU
X-Gm-Gg: AY/fxX6IUUNGGpcIRSbOf4jYITCVOY0p4uIyCpqSQcLwh5clL2aN43FXBzBrZw1rzqc
 sothVeZBfbRBzjkEABOVnPBDrmtRU1ygEMJWGKW8Q0PMWB+5KNqomcy9xa6PCNqMOgy9UVc3dL1
 95htpmUECb4JWsXS2UtcGrFWlUDr7da3e+6VRMiurswhTvTJZY+XfN8LAGEt40KGggU53znGLGO
 sI7Jj06QNjVwX+MFikIzLApMaE2rXQgV4U/HTsRzTlah3hcO8r069Efr5e10KAkuCutduilcA/k
 3A5Vfug8eaS2G+mhwehjovpdPwE+nQ5BmQkK57pb52ODQtI2oo72Hea5mx7cEU1dZEhGG17d0BT
 eT4WijG2MoBahFMo6WCakTSI0HVQd8IWcnYUdpjLJzDyhupZqgCzPjuo4+oPr8sYHQmXdJjll7k
 aBgum/tpfth4byepWR1DQagN7W
X-Google-Smtp-Source: AGHT+IH8nlJ0Hv8KS+pLb87wP/E4ltTDQRttQBR3zHFVWyW77mJahQTur8xugcibWrzDHfd2c/wdlw==
X-Received: by 2002:a05:600c:1e88:b0:477:5897:a0c4 with SMTP id
 5b1f17b1804b1-47a837f0640mr56251515e9.4.1765455850761; 
 Thu, 11 Dec 2025 04:24:10 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:10 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 01/19] dma-buf: protected fence ops by RCU v5
Date: Thu, 11 Dec 2025 13:16:32 +0100
Message-ID: <20251211122407.1709-2-christian.koenig@amd.com>
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

