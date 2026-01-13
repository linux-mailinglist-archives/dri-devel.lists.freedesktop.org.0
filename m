Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E513AD19D38
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D78C10E4F4;
	Tue, 13 Jan 2026 15:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mZI/A2VJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB0110E4F4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:21:33 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-47edd9024b1so4277835e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768317692; x=1768922492; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IOW1BIEN9P8SmmIZbP0fXBGfaIFSEZ6KBMmxu9nLRus=;
 b=mZI/A2VJ06SJ48sqKeE7SFepWv1w3j9mO9jT276KkVfueygIr+LP0JTMiBymS2pQNy
 j26JyYZkgZMKZua+dZDM/7JnPENJdzQu7X9KyN11oAt/n1LVcgogAvD8i/ZSWV59ppTF
 rMKISoEtN/aDqqLur2PdnLWOl2DO1v1wwCUWsTXcxMolONXL8wU+b4pC7z6vLvh2sRjr
 ycyVIUEHhylayXz2bjdTwgIRQBtrQVOACsDCXlsmG/Id51Q9Zvicdr7yx/RPLq3EEkh+
 MvoxCcJgW3OVp/xIwn8R87dCQPp63BbxEn93/nGD1qXQ86iK+cj10CWzSPbG/YD3P3dP
 xBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768317692; x=1768922492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IOW1BIEN9P8SmmIZbP0fXBGfaIFSEZ6KBMmxu9nLRus=;
 b=H6jbwmSkVjNQgWhacV2UhSGlsXQq0ZcbdPx9upwKumUVCcxM6tPnJLbl86EHk6roPW
 oZeHBLNtW38JbqWAQihKjqQTVJejIfWaoSLa1jQO8UO1geiO5dVmoXwhqPvaxN7Uzwy7
 B5f9blhxdxeAYTSUXwlwWdnsGcrtAvcUpsjy7Rrtvr35q3TrqovPMCXr77OLh0XyIDIi
 9Zx7NvhQHQhUrEVwryd1auZP0thqD1mxoVgaVd9sK5tRg9LCwCjg/XuxcaH8WuByJByB
 GFySGfdsUbMHfQpWueCfUmvrjfm/3J3EcqtGio6+//JsgIW2Y3yDzI+u/a8XHv+PzUmS
 xL3g==
X-Gm-Message-State: AOJu0Yw9g2RYq5GJUU9mfD1fQTBMXi7RK6anrcDey+znsUugPkNDGuke
 6JFQodzDQ8JKkrkNRjyQ53DTyX7yavWAGP94nJ/h50qkmNqyNPqGp3jG
X-Gm-Gg: AY/fxX5c4qU1tuxUqnDbGnGl9eGzyKTIk5ETGwAAmyblItnlMkF9ctoiixGNxK5raKM
 Qy1NsPkgtlwsq2saMbwzjV0EaHSDksO4M4FLD2hky6pZjQAnLUxPTuZNZaiuRuBZyogbxdWI1m5
 htsKaXnb2ugwtS5QM/cmbbV7d6vMO6+9YO4SjTzGPPTEdXuPD3IkhWO2SffYSKek3I/NEJcRlGl
 3M7xBCj2Gcssq2mFYipDxFOWN6dsV/hMOIbn2LGTk98ii3hIolpHUGXtAyaE4ybDu/y9/cAAI1M
 WjVSU5ogurZqQ2iIAhKFuEy6jZMGR5dZxWb1LVASh8sv8SxV0I8Q5JsId29fO3wFRirUP5kqkEp
 Y1XIdcDzWFYPMgkYlp9nsILdg1xzI/CyfwGyrZe0F9Cm5FKzEcNbPaQAnL6TYGl5Ht6ouycpTcn
 hNu0JKy8B7SjACJAvmCZnVX8g=
X-Google-Smtp-Source: AGHT+IHjgrvFStqa4c335bYdbw08AleEttFqH8TGzLUvHxkBDJ3e1i4C4c+LAbcBbtlFyl7KXH8pyw==
X-Received: by 2002:a05:600c:3e0d:b0:477:63a4:88fe with SMTP id
 5b1f17b1804b1-47d84b0a279mr231343275e9.2.1768317691578; 
 Tue, 13 Jan 2026 07:21:31 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:141c:9800:1651:dfa:9e48:25d5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ecf6a5466sm129518405e9.11.2026.01.13.07.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 07:21:31 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 04/10] dma-buf: abstract fence locking
Date: Tue, 13 Jan 2026 16:16:11 +0100
Message-ID: <20260113152125.47380-5-christian.koenig@amd.com>
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

Add dma_fence_lock_irqsafe() and dma_fence_unlock_irqrestore() wrappers
and mechanically apply them everywhere.

Just a pre-requisite cleanup for a follow up patch.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c              | 44 +++++++++++-------------
 drivers/dma-buf/st-dma-fence.c           |  6 ++--
 drivers/dma-buf/sw_sync.c                | 14 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   |  4 +--
 drivers/gpu/drm/nouveau/nouveau_drm.c    |  5 +--
 drivers/gpu/drm/scheduler/sched_fence.c  |  6 ++--
 drivers/gpu/drm/xe/xe_sched_job.c        |  4 +--
 include/linux/dma-fence.h                | 20 +++++++++++
 9 files changed, 63 insertions(+), 44 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 481f1cd9aae2..be072b7ba10b 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
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
index c596b6df2e2d..60922463b415 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -474,10 +474,10 @@ bool amdgpu_ring_soft_recovery(struct amdgpu_ring *ring, unsigned int vmid,
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
index c362d4dfb5bb..ea3c187c474d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2784,8 +2784,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 	dma_fence_put(vm->last_unlocked);
 	dma_fence_wait(vm->last_tlb_flush, false);
 	/* Make sure that all fence callbacks have completed */
-	spin_lock_irqsave(vm->last_tlb_flush->lock, flags);
-	spin_unlock_irqrestore(vm->last_tlb_flush->lock, flags);
+	dma_fence_lock_irqsave(vm->last_tlb_flush, flags);
+	dma_fence_unlock_irqrestore(vm->last_tlb_flush, flags);
 	dma_fence_put(vm->last_tlb_flush);
 
 	list_for_each_entry_safe(mapping, tmp, &vm->freed, list) {
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
index cb674a322113..9a43ed689e65 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -189,11 +189,11 @@ static bool xe_fence_set_error(struct dma_fence *fence, int error)
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
index 9bacf8855380..a208e8841315 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -378,6 +378,26 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
 	} while (1);
 }
 
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
 #ifdef CONFIG_LOCKDEP
 bool dma_fence_begin_signalling(void);
 void dma_fence_end_signalling(bool cookie);
-- 
2.43.0

