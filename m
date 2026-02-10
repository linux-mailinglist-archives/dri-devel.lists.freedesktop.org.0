Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBn2DPYGi2kdPQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:22:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B764511996B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510E210E544;
	Tue, 10 Feb 2026 10:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NG2Ucf+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4B010E546
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 10:22:39 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso45438825e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 02:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770718958; x=1771323758; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x+M8yi1+p9L7JGG3hAf1qHeVaH46vA+T1ZXueRpunJQ=;
 b=NG2Ucf+B9I/A1vrsLxfdbih3WjRp50/NK2Z3KbBiR0pEo3IKNcJ0xqppz7Okvtrkx7
 MFK7rYvuNDzBeaD+n3V85t0pBG0pr+l9bZusRkFD7l7I72Qp8b7MqU/d3G0a8BxNdhwz
 nSyrqiNbTLl67R5lblETW+PuYNe2FxPqFkYjYSkQXKoPsKmgIAKeMt0m8Apk7PaQm5UA
 PQhf/Jgv7U3j6kZvrYvGYDx5RQl4L3vMu9DkAPHqK6jRx51suApri5Z59sgPySYakI9q
 QCAM63W1AP/HmRSHy15FLP8UROLfFco8ZnPr5Yd+pbB98+1cJ+h6mWJgNhUBHIfb+kWU
 SD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770718958; x=1771323758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x+M8yi1+p9L7JGG3hAf1qHeVaH46vA+T1ZXueRpunJQ=;
 b=IJExRajWLQBv0phZFxiFQC1AeKiyJJl3iEUxlCat+7yzGmARTMVwj+8L+oqlfQfpMM
 uqYpeywerJfe/DmUK/MLv3XzjktJcMOu2cf/nvGxFViE1JbW7PTR0FcyiiJ8kUFB6M2V
 KiaPYk5z41S5D5CpE4gMLUmQKkyxZLiLcc0qZ1BfiW+xmx+cos4iVpBgxUmwPyEuXE3a
 r/r+lVqPGoVrqEmu9m4Ixp2IX63rwFICZk5zZ3DBfhuSwiwEYAm8j2RShBIt9CilcPNH
 /CpGTsMtZYMP4eI8ZjxcThJj2br+GA/xIRV4p2UZ3kL24jBFYS0Y7AGRZzYMuUNt7P0p
 sZtg==
X-Gm-Message-State: AOJu0YwAHttPMI6WBYMSdvJwl3YS7Pp5SJw4uCvqVWr0JxGLZROgBpIC
 cOhUtV2G9dRMqE2R+VlBpvqKin7qgERH5U2MZ7J3r6ohLP7dpmkQWKHk
X-Gm-Gg: AZuq6aJZPhSMvSZyhW3+rtDIxTiKvJRV7CBuulWD5t/EoqNLusrB6OD1ba3p/1jYIbb
 8y69CnoIJtF+lJtzxHsCZInAn7okL81eX6cFuplekAbLQXABv4lrAmA3/VS5gcKURYv7QO54fxo
 Fjij4QES4oKutc/XaH4ktKEg5fhX6J+OHPefRUNmZP4aES05qcI3s3Wv7G6BLRyVPIk6C3GiYBg
 RmKcqDnGEYYS+vdL7IXjvD+le3Sn8gL0BMqzAZ89vFWY50O3UIePBT4mRdqkeA7s2Tg2jJrTjl4
 2Xz2vkvAFV77MA4LTWOg/TaDZGu3XdesjtKZi3rc4TAim35VSwHWbuBanKfd7u6irWfFRTGGekz
 Hl/DmFiE4wxjgy+PKFoaBbXuyYx8dz1O8qpC8yUdgvuymJGgjzTaayXnsr+ivh7jA8I/fAOYzRk
 n9DJmz4/3PnZhaIX6HCcqv6rpZnpfwdlKiKNNI
X-Received: by 2002:a05:600c:a416:b0:477:58af:a91d with SMTP id
 5b1f17b1804b1-483255d164emr177258685e9.5.1770718958149; 
 Tue, 10 Feb 2026 02:22:38 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:6000:83ca:11f0:7e35:a75d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d8ebfsm81549605e9.2.2026.02.10.02.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 02:22:37 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org,
	matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 3/8] dma-buf: abstract fence locking v2
Date: Tue, 10 Feb 2026 11:01:58 +0100
Message-ID: <20260210102232.1642-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210102232.1642-1-christian.koenig@amd.com>
References: <20260210102232.1642-1-christian.koenig@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:email]
X-Rspamd-Queue-Id: B764511996B
X-Rspamd-Action: no action

Add dma_fence_lock_irqsafe() and dma_fence_unlock_irqrestore() wrappers
and mechanically apply them everywhere.

Just a pre-requisite cleanup for a follow up patch.

v2: add some missing i915 bits, add abstraction for lockdep assertion as
    well

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com> (v1)
---
 drivers/dma-buf/dma-fence.c                 | 48 ++++++++++-----------
 drivers/dma-buf/st-dma-fence.c              |  6 ++-
 drivers/dma-buf/sw_sync.c                   | 14 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c    |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  4 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c |  2 +-
 drivers/gpu/drm/i915/i915_active.c          | 19 ++++----
 drivers/gpu/drm/nouveau/nouveau_drm.c       |  5 ++-
 drivers/gpu/drm/scheduler/sched_fence.c     |  6 +--
 drivers/gpu/drm/xe/xe_sched_job.c           |  4 +-
 include/linux/dma-fence.h                   | 38 ++++++++++++++++
 11 files changed, 95 insertions(+), 55 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index ba02321bef0b..56aa59867eaa 100644
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
@@ -603,10 +603,10 @@ void dma_fence_release(struct kref *kref)
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
@@ -636,7 +636,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 	const struct dma_fence_ops *ops;
 	bool was_set;
 
-	lockdep_assert_held(fence->lock);
+	dma_fence_assert_held(fence);
 
 	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 				   &fence->flags);
@@ -672,9 +672,9 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock_irqsave(fence, flags);
 	__dma_fence_enable_signaling(fence);
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock_irqrestore(fence, flags);
 }
 EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
 
@@ -714,8 +714,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 		return -ENOENT;
 	}
 
-	spin_lock_irqsave(fence->lock, flags);
-
+	dma_fence_lock_irqsave(fence, flags);
 	if (__dma_fence_enable_signaling(fence)) {
 		cb->func = func;
 		list_add_tail(&cb->node, &fence->cb_list);
@@ -723,8 +722,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
 		INIT_LIST_HEAD(&cb->node);
 		ret = -ENOENT;
 	}
-
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock_irqrestore(fence, flags);
 
 	return ret;
 }
@@ -747,9 +745,9 @@ int dma_fence_get_status(struct dma_fence *fence)
 	unsigned long flags;
 	int status;
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock_irqsave(fence, flags);
 	status = dma_fence_get_status_locked(fence);
-	spin_unlock_irqrestore(fence->lock, flags);
+	dma_fence_unlock_irqrestore(fence, flags);
 
 	return status;
 }
@@ -779,13 +777,11 @@ dma_fence_remove_callback(struct dma_fence *fence, struct dma_fence_cb *cb)
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
@@ -824,7 +820,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	unsigned long flags;
 	signed long ret = timeout ? timeout : 1;
 
-	spin_lock_irqsave(fence->lock, flags);
+	dma_fence_lock_irqsave(fence, flags);
 
 	if (dma_fence_test_signaled_flag(fence))
 		goto out;
@@ -848,11 +844,11 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
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
@@ -862,7 +858,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
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
index 1527b801f013..ec4dfa3ea725 100644
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
index e1afbb5909f9..88c842fc35d5 100644
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

