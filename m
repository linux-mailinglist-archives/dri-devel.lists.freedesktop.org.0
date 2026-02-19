Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBSECYY1l2k/vwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:08:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF6316084A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B790810E710;
	Thu, 19 Feb 2026 16:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L7+9k8XW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9602910E709
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 16:08:30 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4359a302794so924016f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 08:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771517309; x=1772122109; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ALu6XB56et7Cci1N13iLoWGGPKsgjwiMxkfvdPaA0Ok=;
 b=L7+9k8XW3frQCk5EaV1rmhAiCNesN7ZxB1yM8l4EUGzOU1rlA7IWOgXN0jn3o8c+Mo
 vee7OcwZb+vbCsQSLyhexF9+HEJ72AfP7QxsNoZNdCqh/VTuET9rWzYf5VgIKrAcpELN
 Nya6EW/Re50Z59hQ3gCS+lMaDz4h8abwzlVNvvdgitWzNV2pTMqrX9N1Zz8C3D71I7FM
 4IKUofXGgWSpp2U+1VM0/QIzaz4oOKaOdBvn6RobrWwwcfX6W/RrD4vqptoNhjqTWSKx
 iXPLhlK3C38jA9mxiokMpQDDc1zUst6IAf70rpCK46dVTzMVie4v97A9/tFxD0wZMH/H
 Ft6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771517309; x=1772122109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ALu6XB56et7Cci1N13iLoWGGPKsgjwiMxkfvdPaA0Ok=;
 b=QQzwkeBr+hmwxybTrG5qfhNpdcCw+4IkLvEWJv8G55r3gkn8ADVq85E8KduU16G9Tw
 I6HT0oh9+h5nSvwVEkOJqsOpCuiG07Y2HlJ6ouVeIPI2Kii5INSQv02HE4Zzx1VXSyZP
 V3u9WkcK3p3oOW8KOLUfVztgNEBhz/KmgD5otZ1YwShA7LrcTmU4fQn6Gb6/oZPAGGxx
 dejsKbGvev3DAmLbzavQhvKsppNVkV9g3GAfpid54I6rNQrhoKE0Ipq0Q2KqvRks5Ww5
 KYWtu2XwpPgPEpICSpwH2bMbWG27IgOyD3rfofyKvkRQSnIl5GLR9Mw5yK08MuBQRkAM
 ojrg==
X-Gm-Message-State: AOJu0YwsEntGpSHI9+6IYfBKZN1b3QkFzke2o7sOP/goobPe8c9jwgio
 bxTqKAOySwDcm3zp+e/2WyJsqgg7FR6TVwgeIkxwr9xhcn3xQMWCpNSP
X-Gm-Gg: AZuq6aJzT983jnE9kwRY7gM5SvmwlVKYWJnsrIKImws+fpdB4+22TzDm99f1rvYDmj4
 D5OpdrO69sjaCMoarJ2nURkihSNLx7vsrM4xUWYVi9e68naKi6OvETjC38XIfQ1xHJSCWFXeJIY
 OiPnpK5UIPs5yn+ovUtSwXM8cPVOVzTV0Rk76CzRk6Wr///1aWVgyT/d8snUJGi1VWUYkBtoYuw
 bRtLd7bpLLYZ7Ud/RYYqeb4g3KwZpbBX/O4EV5IL2q9QDP0ESrS9JOzbbX2MGOhEsv7NXNUtIh4
 svksafXs8EjunO0qbUrkurtqkkGwvw/Tv+U27oCukbJL/lLkIIPYl5kmC2nLKSnPkCw2GNneOn6
 6j5F1MZ+nC/lY3O6OOaleV9WBdROxQjVwBwi6/xUXWBWGcAe26HPOn0rZRyrEp0Qu7P/2RWf9GM
 2N63jWczPRRT8OQEKSHF0btCe7NLwbj6cVaXQ3
X-Received: by 2002:a5d:5d83:0:b0:436:3707:2bf0 with SMTP id
 ffacd0b85a97d-4379db98594mr32024264f8f.35.1771517308866; 
 Thu, 19 Feb 2026 08:08:28 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1503:b900:9c42:5977:662a:d02d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac82f7sm54580031f8f.28.2026.02.19.08.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 08:08:28 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org,
	matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 3/8] dma-buf: abstract fence locking v2
Date: Thu, 19 Feb 2026 17:07:06 +0100
Message-ID: <20260219160822.1529-4-christian.koenig@amd.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BEF6316084A
X-Rspamd-Action: no action

Add dma_fence_lock_irqsafe() and dma_fence_unlock_irqrestore() wrappers
and mechanically apply them everywhere.

Just a pre-requisite cleanup for a follow up patch.

v2: add some missing i915 bits, add abstraction for lockdep assertion as
    well
v3: one more suggestion by Tvrtko

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/dma-fence.c                 | 48 ++++++++++-----------
 drivers/dma-buf/st-dma-fence.c              |  6 ++-
 drivers/dma-buf/sw_sync.c                   | 14 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c    |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  2 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c |  2 +-
 drivers/gpu/drm/i915/i915_active.c          | 19 ++++----
 drivers/gpu/drm/nouveau/nouveau_drm.c       |  5 ++-
 drivers/gpu/drm/scheduler/sched_fence.c     |  6 +--
 drivers/gpu/drm/xe/xe_sched_job.c           |  4 +-
 include/linux/dma-fence.h                   | 38 ++++++++++++++++
 12 files changed, 96 insertions(+), 56 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index ae77f900c267..bd4ec7e26dae 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -365,7 +365,7 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 	struct dma_fence_cb *cur, *tmp;
 	struct list_head cb_list;
 
-	lockdep_assert_held(fence->lock);
+	dma_fence_assert_held(fence);
 
 	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
 				      &fence->flags)))
@@ -412,9 +412,9 @@ void dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
 	if (WARN_ON(!fence))
 		return;
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock_irqsave(fence, flags);
 	dma_fence_signal_timestamp_locked(fence, timestamp);
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock_irqrestore(fence, flags);
 }
 EXPORT_SYMBOL(dma_fence_signal_timestamp);
 
@@ -473,9 +473,9 @@ bool dma_fence_check_and_signal(struct dma_fence *fence)
 	unsigned long flags;
 	bool ret;
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock_irqsave(fence, flags);
 	ret = dma_fence_check_and_signal_locked(fence);
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock_irqrestore(fence, flags);
 
 	return ret;
 }
@@ -501,9 +501,9 @@ void dma_fence_signal(struct dma_fence *fence)
 
 	tmp = dma_fence_begin_signalling();
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock_irqsave(fence, flags);
 	dma_fence_signal_timestamp_locked(fence, ktime_get());
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock_irqrestore(fence, flags);
 
 	dma_fence_end_signalling(tmp);
 }
@@ -604,10 +604,10 @@ void dma_fence_release(struct kref *kref)
 		 * don't leave chains dangling. We set the error flag first
 		 * so that the callbacks know this signal is due to an error.
 		 */
-		spin_lock_irqsave(fence->lock, flags);
+		dma_fence_lock_irqsave(fence, flags);
 		fence->error = -EDEADLK;
 		dma_fence_signal_locked(fence);
-		spin_unlock_irqrestore(fence->lock, flags);
+		dma_fence_unlock_irqrestore(fence, flags);
 	}
 
 	ops = rcu_dereference(fence->ops);
@@ -637,7 +637,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 	const struct dma_fence_ops *ops;
 	bool was_set;
 
-	lockdep_assert_held(fence->lock);
+	dma_fence_assert_held(fence);
 
 	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 				   &fence->flags);
@@ -673,9 +673,9 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock_irqsave(fence, flags);
 	__dma_fence_enable_signaling(fence);
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock_irqrestore(fence, flags);
 }
 EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
 
@@ -715,8 +715,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 		return -ENOENT;
 	}
 
-	spin_lock_irqsave(fence->lock, flags);
-
+	dma_fence_lock_irqsave(fence, flags);
 	if (__dma_fence_enable_signaling(fence)) {
 		cb->func = func;
 		list_add_tail(&cb->node, &fence->cb_list);
@@ -724,8 +723,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 		INIT_LIST_HEAD(&cb->node);
 		ret = -ENOENT;
 	}
-
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock_irqrestore(fence, flags);
 
 	return ret;
 }
@@ -748,9 +746,9 @@ int dma_fence_get_status(struct dma_fence *fence)
 	unsigned long flags;
 	int status;
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock_irqsave(fence, flags);
 	status = dma_fence_get_status_locked(fence);
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock_irqrestore(fence, flags);
 
 	return status;
 }
@@ -780,13 +778,11 @@ dma_fence_remove_callback(struct dma_fence *fence, struct dma_fence_cb *cb)
 	unsigned long flags;
 	bool ret;
 
-	spin_lock_irqsave(fence->lock, flags);
-
+	dma_fence_lock_irqsave(fence, flags);
 	ret = !list_empty(&cb->node);
 	if (ret)
 		list_del_init(&cb->node);
-
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock_irqrestore(fence, flags);
 
 	return ret;
 }
@@ -825,7 +821,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	unsigned long flags;
 	signed long ret = timeout ? timeout : 1;
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock_irqsave(fence, flags);
 
 	if (dma_fence_test_signaled_flag(fence))
 		goto out;
@@ -849,11 +845,11 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 			__set_current_state(TASK_INTERRUPTIBLE);
 		else
 			__set_current_state(TASK_UNINTERRUPTIBLE);
-		spin_unlock_irqrestore(fence->lock, flags);
+		dma_fence_unlock_irqrestore(fence, flags);
 
 		ret = schedule_timeout(ret);
 
-		spin_lock_irqsave(fence->lock, flags);
+		dma_fence_lock_irqsave(fence, flags);
 		if (ret > 0 && intr && signal_pending(current))
 			ret = -ERESTARTSYS;
 	}
@@ -863,7 +859,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	__set_current_state(TASK_RUNNING);
 
 out:
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock_irqrestore(fence, flags);
 	return ret;
 }
 EXPORT_SYMBOL(dma_fence_default_wait);
diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index 73ed6fd48a13..5d0d9abc6e21 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -410,8 +410,10 @@ struct race_thread {
 
 static void __wait_for_callbacks(struct dma_fence *f)
 {
-	spin_lock_irq(f->lock);
-	spin_unlock_irq(f->lock);
+	unsigned long flags;
+
+	dma_fence_lock_irqsave(f, flags);
+	dma_fence_unlock_irqrestore(f, flags);
 }
 
 static int thread_signal_callback(void *arg)
diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 6f09d13be6b6..4c81a37dd682 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -156,12 +156,12 @@ static void timeline_fence_release(struct dma_fence *fence)
 	struct sync_timeline *parent = dma_fence_parent(fence);
 	unsigned long flags;
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock_irqsave(fence, flags);
 	if (!list_empty(&pt->link)) {
 		list_del(&pt->link);
 		rb_erase(&pt->node, &parent->pt_tree);
 	}
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock_irqrestore(fence, flags);
 
 	sync_timeline_put(parent);
 	dma_fence_free(fence);
@@ -179,7 +179,7 @@ static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadlin
 	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
 	unsigned long flags;
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock_irqsave(fence, flags);
 	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
 		if (ktime_before(deadline, pt->deadline))
 			pt->deadline = deadline;
@@ -187,7 +187,7 @@ static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadlin
 		pt->deadline = deadline;
 		__set_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags);
 	}
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock_irqrestore(fence, flags);
 }
 
 static const struct dma_fence_ops timeline_fence_ops = {
@@ -431,13 +431,13 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		goto put_fence;
 	}
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock_irqsave(fence, flags);
 	if (!test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
 		ret = -ENOENT;
 		goto unlock;
 	}
 	data.deadline_ns = ktime_to_ns(pt->deadline);
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock_irqrestore(fence, flags);
 
 	dma_fence_put(fence);
 
@@ -450,7 +450,7 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 	return 0;
 
 unlock:
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock_irqrestore(fence, flags);
 put_fence:
 	dma_fence_put(fence);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index b82357c65723..1404e1fe62a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -479,10 +479,10 @@ bool amdgpu_ring_soft_recovery(struct amdgpu_ring *ring, unsigned int vmid,
 	if (amdgpu_sriov_vf(ring->adev) || !ring->funcs->soft_recovery || !fence)
 		return false;
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock_irqsave(fence, flags);
 	if (!dma_fence_is_signaled_locked(fence))
 		dma_fence_set_error(fence, -ENODATA);
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock_irqrestore(fence, flags);
 
 	while (!dma_fence_is_signaled(fence) &&
 	       ktime_to_ns(ktime_sub(deadline, ktime_get())) > 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 6a2ea200d90c..4761e7486811 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2802,8 +2802,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 	dma_fence_put(vm->last_unlocked);
 	dma_fence_wait(vm->last_tlb_flush, false);
 	/* Make sure that all fence callbacks have completed */
-	spin_lock_irqsave(vm->last_tlb_flush->lock, flags);
-	spin_unlock_irqrestore(vm->last_tlb_flush->lock, flags);
+	dma_fence_lock_irqsave(vm->last_tlb_flush, flags);
+	dma_fence_unlock_irqrestore(vm->last_tlb_flush, flags);
 	dma_fence_put(vm->last_tlb_flush);
 
 	list_for_each_entry_safe(mapping, tmp, &vm->freed, list) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 139642eacdd0..d5c41e24fb51 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -638,7 +638,7 @@ static inline uint64_t amdgpu_vm_tlb_seq(struct amdgpu_vm *vm)
 	 * sure that the dma_fence structure isn't freed up.
 	 */
 	rcu_read_lock();
-	lock = vm->last_tlb_flush->lock;
+	lock = dma_fence_spinlock(vm->last_tlb_flush);
 	rcu_read_unlock();
 
 	spin_lock_irqsave(lock, flags);
diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
index bf6117d5fc57..78ea2d9ccedf 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -148,7 +148,7 @@ __dma_fence_signal__notify(struct dma_fence *fence,
 {
 	struct dma_fence_cb *cur, *tmp;
 
-	lockdep_assert_held(fence->lock);
+	dma_fence_assert_held(fence);
 
 	list_for_each_entry_safe(cur, tmp, list, node) {
 		INIT_LIST_HEAD(&cur->node);
diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index 6b0c1162505a..9d41e052ab65 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -1045,9 +1045,10 @@ __i915_active_fence_set(struct i915_active_fence *active,
 	 * nesting rules for the fence->lock; the inner lock is always the
 	 * older lock.
 	 */
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock_irqsave(fence, flags);
 	if (prev)
-		spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
+		spin_lock_nested(dma_fence_spinlock(prev),
+				 SINGLE_DEPTH_NESTING);
 
 	/*
 	 * A does the cmpxchg first, and so it sees C or NULL, as before, or
@@ -1061,17 +1062,18 @@ __i915_active_fence_set(struct i915_active_fence *active,
 	 */
 	while (cmpxchg(__active_fence_slot(active), prev, fence) != prev) {
 		if (prev) {
-			spin_unlock(prev->lock);
+			spin_unlock(dma_fence_spinlock(prev));
 			dma_fence_put(prev);
 		}
-		spin_unlock_irqrestore(fence->lock, flags);
+		dma_fence_unlock_irqrestore(fence, flags);
 
 		prev = i915_active_fence_get(active);
 		GEM_BUG_ON(prev == fence);
 
-		spin_lock_irqsave(fence->lock, flags);
+		dma_fence_lock_irqsave(fence, flags);
 		if (prev)
-			spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
+			spin_lock_nested(dma_fence_spinlock(prev),
+					 SINGLE_DEPTH_NESTING);
 	}
 
 	/*
@@ -1088,10 +1090,11 @@ __i915_active_fence_set(struct i915_active_fence *active,
 	 */
 	if (prev) {
 		__list_del_entry(&active->cb.node);
-		spin_unlock(prev->lock); /* serialise with prev->cb_list */
+		/* serialise with prev->cb_list */
+		spin_unlock(dma_fence_spinlock(prev));
 	}
 	list_add_tail(&active->cb.node, &fence->cb_list);
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock_irqrestore(fence, flags);
 
 	return prev;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index f2e04a048ac2..e6805b8b9ffa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -156,12 +156,13 @@ nouveau_name(struct drm_device *dev)
 static inline bool
 nouveau_cli_work_ready(struct dma_fence *fence)
 {
+	unsigned long flags;
 	bool ret = true;
 
-	spin_lock_irq(fence->lock);
+	dma_fence_lock_irqsave(fence, flags);
 	if (!dma_fence_is_signaled_locked(fence))
 		ret = false;
-	spin_unlock_irq(fence->lock);
+	dma_fence_unlock_irqrestore(fence, flags);
 
 	if (ret == true)
 		dma_fence_put(fence);
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 9391d6f0dc01..724d77694246 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -156,19 +156,19 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
 	struct dma_fence *parent;
 	unsigned long flags;
 
-	spin_lock_irqsave(&fence->lock, flags);
+	dma_fence_lock_irqsave(f, flags);
 
 	/* If we already have an earlier deadline, keep it: */
 	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
 	    ktime_before(fence->deadline, deadline)) {
-		spin_unlock_irqrestore(&fence->lock, flags);
+		dma_fence_unlock_irqrestore(f, flags);
 		return;
 	}
 
 	fence->deadline = deadline;
 	set_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
 
-	spin_unlock_irqrestore(&fence->lock, flags);
+	dma_fence_unlock_irqrestore(f, flags);
 
 	/*
 	 * smp_load_aquire() to ensure that if we are racing another
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 3927666fe556..ae5b38b2a884 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -190,11 +190,11 @@ static bool xe_fence_set_error(struct dma_fence *fence, int error)
 	unsigned long irq_flags;
 	bool signaled;
 
-	spin_lock_irqsave(fence->lock, irq_flags);
+	dma_fence_lock_irqsave(fence, irq_flags);
 	signaled = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
 	if (!signaled)
 		dma_fence_set_error(fence, error);
-	spin_unlock_irqrestore(fence->lock, irq_flags);
+	dma_fence_unlock_irqrestore(fence, irq_flags);
 
 	return signaled;
 }
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 80db7ede91de..086324af96c9 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -377,6 +377,44 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
 	} while (1);
 }
 
+/**
+ * dma_fence_spinlock - return pointer to the spinlock protecting the fence
+ * @fence: the fence to get the lock from
+ *
+ * Return the pointer to the extern lock.
+ */
+static inline spinlock_t *dma_fence_spinlock(struct dma_fence *fence)
+{
+	return fence->lock;
+}
+
+/**
+ * dma_fence_lock_irqsave - irqsave lock the fence
+ * @fence: the fence to lock
+ * @flags: where to store the CPU flags.
+ *
+ * Lock the fence, preventing it from changing to the signaled state.
+ */
+#define dma_fence_lock_irqsave(fence, flags)	\
+	spin_lock_irqsave(fence->lock, flags)
+
+/**
+ * dma_fence_unlock_irqrestore - unlock the fence and irqrestore
+ * @fence: the fence to unlock
+ * @flags the CPU flags to restore
+ *
+ * Unlock the fence, allowing it to change it's state to signaled again.
+ */
+#define dma_fence_unlock_irqrestore(fence, flags)	\
+	spin_unlock_irqrestore(fence->lock, flags)
+
+/**
+ * dma_fence_assert_held - lockdep assertion that fence is locked
+ * @fence: the fence which should be locked
+ */
+#define dma_fence_assert_held(fence)	\
+	lockdep_assert_held(dma_fence_spinlock(fence));
+
 #ifdef CONFIG_LOCKDEP
 bool dma_fence_begin_signalling(void);
 void dma_fence_end_signalling(bool cookie);
-- 
2.43.0

