Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QeuMLIU1l2k/vwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:08:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD345160844
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB69710E70A;
	Thu, 19 Feb 2026 16:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hv4Uqhxz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B58B10E708
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 16:08:29 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4375d4fb4d4so760356f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 08:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771517308; x=1772122108; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aO2b05vFaVfkZYQ4r2IaNcgiajpoFgzmsWtgJ+F8IQk=;
 b=Hv4UqhxzGlaT0QyfJ8OCZYmARL4DAnQgJ8MABI/7uzuc3T0BEGiI7r8F0FPZT96OWI
 +b0G77DDzEOfBfjvHajI2Sy2zpP9MrOXGPtTOOxI24mhZDR0wQN6vWsXtCFu4GGZoEf6
 h/D+F+aZGFLXzG0n3h1P7LmjoepLXj3L+tlEX0xKykA0GQ8LQGAcZRrn4v1UjufScQE/
 +OcZu0fuojISjjDmwS+RZyi+zguwj0WNelaVJ/MLWBq9yjbB6Xug85VGBxpCZwUTRv+A
 7FOpqp+LZvxZq2Xc4Gh/EhbKRIGS8KYeK748N1sA0rRvAwAkFu0k9v2Oz+mEo1+iWQIc
 ARdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771517308; x=1772122108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aO2b05vFaVfkZYQ4r2IaNcgiajpoFgzmsWtgJ+F8IQk=;
 b=VmhplOh+Ghg4BZ0eEI+qQTGw139IOOAnhIB47Jc6YDWV+G0PSwdVg56DRlepWFiqhK
 S3E04E5Fr0o6G/RtiA8GS9kMICbhlF0MW/A+DgzPjpPSjBnyLxozQ2p5Am7WGJO1lNWU
 Q9waVQ0EPETw1/eWRp0ttRkDIeEQ/XgUkTwIzFnLRC3NqgfGllYVl+sX/LW+OPIUoL8o
 q8SmZMfIbYR3tuw2T5FrvHINHOyUFXnJNpMolR3vMjddzctiG5nkiGrGVFvKtInanOog
 R4Ron6AddFa3XDGALdpRxHur3OKLODlj7V/ngIIwiZlbOqz+LR4KXj3fV4IVYeND/DxB
 F+JA==
X-Gm-Message-State: AOJu0YwZtA+ePzr37s1qJgoCETF/jNf6aIJvcZpI2tDjzYxpd9cuzrGk
 GLXAYriaiQUa7ZFumKUGMI4mnds+gr19Zeumb+tfyI2k7h65BFU9ucyX
X-Gm-Gg: AZuq6aL5EaDo/LvLp+D1IJDDInbgzESXm/P+KSIKUtLPPurhYaoq9FFAF9ND5B5xeV3
 CNYBvCahU8EXmvXuEgUlONsKG9ohXLsRnhNrzQmo7tYsK8l8m1d10uhGljm7vDmr4alLh7MO840
 h2KB32nRjADTuHZnDkMqF4C+7JsY7PcpkZasO94OpDrP0WaVxYUk1fyM3FqMpl4ZSRy/X0WHMvp
 sdyMy+ZuvWCSgFLGVz2tNmdIJjkazj4GHxtjmjqvRhs5mCrYNiwWsSzHb/fjMsZ/tU5emkgEbPP
 pkZ8QECAf0QRNkyPVn+p2v4LPau7ZlqodwC97ESHQr2TK+ljvB9SKSb/n/dlN37DqRC9uIJW4uw
 OX6VjyKCNBb7q7dY5Nm0hnIfdfKeRP0lyF+OvQqa1jgusOs3UVEutyGfKjToBqP8hId2wQPdKdO
 7HyfxQDyU+hRvCdvxrEa+e17WAJreeKzEZKp4y
X-Received: by 2002:a05:6000:601:b0:430:f463:b6bb with SMTP id
 ffacd0b85a97d-43958e010demr10283492f8f.16.1771517307389; 
 Thu, 19 Feb 2026 08:08:27 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1503:b900:9c42:5977:662a:d02d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac82f7sm54580031f8f.28.2026.02.19.08.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 08:08:27 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org,
	matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/8] dma-buf: protected fence ops by RCU v7
Date: Thu, 19 Feb 2026 17:07:04 +0100
Message-ID: <20260219160822.1529-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219160822.1529-1-christian.koenig@amd.com>
References: <20260219160822.1529-1-christian.koenig@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,amd.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AD345160844
X-Rspamd-Action: no action

The fence ops of a dma_fence currently need to life as long as the
dma_fence is alive. This means that the module which originally issued
a dma_fence can't unload unless all fences are freed up.

As first step to solve this issue protect the fence ops by RCU.

While it is counter intuitive to protect a constant function pointer table
by RCU it allows modules to wait for an RCU grace period before they
unload, to make sure that nobody is executing their functions any more.

This patch has not much functional change, but only adds the RCU
handling for the static checker to test.

v2: make one the now duplicated lockdep warnings a comment instead.
v3: Add more documentation to ->wait and ->release callback.
v4: fix typo in documentation
v5: rebased on drm-tip
v6: improve code comments
v7: improve commit message and code comments

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/dma-buf/dma-fence.c | 71 +++++++++++++++++++++++++------------
 include/linux/dma-fence.h   | 29 +++++++++++++--
 2 files changed, 75 insertions(+), 25 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index e05beae6e407..d3c4e23bf297 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -522,6 +522,7 @@ EXPORT_SYMBOL(dma_fence_signal);
 signed long
 dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 {
+	const struct dma_fence_ops *ops;
 	signed long ret;
 
 	if (WARN_ON(timeout < 0))
@@ -533,15 +534,22 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 
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
+		 * issuers of fences who need their lifetime to be independent
+		 * of their module after they signal, so it is ok to use the
+		 * ops outside the RCU protected section.
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
@@ -562,6 +570,7 @@ void dma_fence_release(struct kref *kref)
 {
 	struct dma_fence *fence =
 		container_of(kref, struct dma_fence, refcount);
+	const struct dma_fence_ops *ops;
 
 	rcu_read_lock();
 	trace_dma_fence_destroy(fence);
@@ -593,12 +602,12 @@ void dma_fence_release(struct kref *kref)
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
 
@@ -617,6 +626,7 @@ EXPORT_SYMBOL(dma_fence_free);
 
 static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 {
+	const struct dma_fence_ops *ops;
 	bool was_set;
 
 	lockdep_assert_held(fence->lock);
@@ -627,14 +637,18 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
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
@@ -1007,8 +1021,13 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
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
 
@@ -1049,7 +1068,13 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
 
 	kref_init(&fence->refcount);
-	fence->ops = ops;
+	/*
+	 * While it is counter intuitive to protect a constant function pointer
+	 * table by RCU it allows modules to wait for an RCU grace period
+	 * before they unload, to make sure that nobody is executing their
+	 * functions any more.
+	 */
+	RCU_INIT_POINTER(fence->ops, ops);
 	INIT_LIST_HEAD(&fence->cb_list);
 	fence->lock = lock;
 	fence->context = context;
@@ -1129,11 +1154,12 @@ EXPORT_SYMBOL(dma_fence_init64);
  */
 const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
 {
-	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
-			 "RCU protection is required for safe access to returned string");
+	const struct dma_fence_ops *ops;
 
+	/* RCU protection is required for safe access to returned string */
+	ops = rcu_dereference(fence->ops);
 	if (!dma_fence_test_signaled_flag(fence))
-		return (const char __rcu *)fence->ops->get_driver_name(fence);
+		return (const char __rcu *)ops->get_driver_name(fence);
 	else
 		return (const char __rcu *)"detached-driver";
 }
@@ -1161,11 +1187,12 @@ EXPORT_SYMBOL(dma_fence_driver_name);
  */
 const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
 {
-	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
-			 "RCU protection is required for safe access to returned string");
+	const struct dma_fence_ops *ops;
 
+	/* RCU protection is required for safe access to returned string */
+	ops = rcu_dereference(fence->ops);
 	if (!dma_fence_test_signaled_flag(fence))
-		return (const char __rcu *)fence->ops->get_driver_name(fence);
+		return (const char __rcu *)ops->get_driver_name(fence);
 	else
 		return (const char __rcu *)"signaled-timeline";
 }
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 9c4d25289239..9d8a4ebe8bf7 100644
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
+	 * signaling and so it is necessary for the module providing the
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
+	 * signaling and so it is necessary for the module providing the
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

