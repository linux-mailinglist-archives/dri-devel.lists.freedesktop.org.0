Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC66C580E4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963F810E84A;
	Thu, 13 Nov 2025 14:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IwABilhS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A0810E834
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:53:46 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b735ce67d1dso51366166b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763045625; x=1763650425; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d60aBazDWbkC6SN5VickRHXPpToN2SMExeMru/kntlk=;
 b=IwABilhSJ192LD0bOgI1jvZj+lULIW3K9aP4urcV11jkAOiOiHd2OhlWijf6hoyXX4
 t+klceLexacyDWly/kjuk3zx2sb+K2Odm+7OpzLSPCXQlhhLHFBhB0YEf8xUKg/0SkFj
 Gf70Kjo5EBXlN7AeaMx3/lrk92sN5iZSJ9ESc7TFM8Hjn2gOoUMZbPhhQfrUAI/BNUOL
 5eU7ESivfyKinMkPnC3YiL32Vf3DS3Q0sB/8d+YM348WuXQBEIEs83wVYQNVgAOmtHtm
 AM92Ug3U1+SvlD0uG9xUSoyP3yJ44pTalXv/fxS4m79zy6qn6wppUmy6KjD35fVopRKX
 WNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045625; x=1763650425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=d60aBazDWbkC6SN5VickRHXPpToN2SMExeMru/kntlk=;
 b=iC3MhvGbZxcSguWicWpr1uTrx5hAyR+9TpA3LVsTJ4dtJY600J5JO5yzIoRO7P36N8
 raHlJOYXNb9xFFi9/GnotHS2te0W1MGrfVwktpqq0JmKXfai+liwwU66U/AMC2i7myjr
 Ayotp/wUQKkBNsgw2cUqv4x7urgmP+ApLkNheV3YAafjlWITYOvNvwtkNLDtREwso35A
 njrgdqJhShn87usc4mfCGjfjc6ot1xlOv6H/oKMHkPDXn+eLTOSTn4UHcyh1MfAGrH1B
 OWjanPBWcAncFtCkxpvAAxQR3NtfL5AwVBaXcmOv/8eVCZB+jUhLZzaXnZHlC9W9ywW/
 AzfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDM7ewJbLc/u7Pc9kGFw1iMMtH9WBzMzdVFQTeA1WiPllLmlWsyzMP4dAbrWeGT3WbfHwG2XU0vVE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywek03CE6j6OZKzqX5FN/clcTH41MgqQsvxn77yO1nhPcMZtRth
 k+ZPTXNxVwtT3iCXoFq9eO2njxwDL/FboAU3AtMsZRHr8BpY+jjy0jN0
X-Gm-Gg: ASbGncsArs2D9hDkRUDTEjgBelxsiUCqtcPCRG1siIelcAFkk7fCYjJeGJWl5uUlO7a
 a1l1X1y2/Dy4lm8EB1FFnOhOqAB3fkqI3ixHJTd97y8/C+ArZXaAVjVwFlBcxrhqBszWwzE0odl
 /N6TBqcsWF24RkgMpKGooBtXptkBxSbxJS1tyqrvwXfqR4SnAm5G9Q6g/vSE8RMJVBDT9u0kBWs
 wpC31gLY91/3OmcqSngqj+OPVvSnEK5GVgFa0ZcBYNV9OwtU2AnUHobpQhKNJcMcYYAQzdKZvjm
 ZW0bjj5qHXtrvkEOHL85pbBlw7HVkF+KeNQ/hUiqWBkGmwDw4mTVCrjvvyLmhsXJMn0b0K/LrWP
 yPVogjJaPu8quhjke8Nfm06M596axBlQgHwmwR1D4BMM/zOTYiWWTMBHAsRvq0nMrxdSGGMIrJv
 4GWvIO2EeGvdU=
X-Google-Smtp-Source: AGHT+IHKkfTihWpoKaVm2soOqZKTAx9lNE4iTxUg90zWzqQDFyB568FD//vjR038ewdtgv1io8IVrg==
X-Received: by 2002:a17:906:6a10:b0:b72:c1bc:d63 with SMTP id
 a640c23a62f3a-b7331b2f9b0mr739948966b.60.1763045625058; 
 Thu, 13 Nov 2025 06:53:45 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15aa:c600:cef:d94:436c:abc5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm173747166b.1.2025.11.13.06.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:53:44 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Subject: [PATCH 13/18] drm/amdgpu: independence for the amdkfd_fence! v2
Date: Thu, 13 Nov 2025 15:51:50 +0100
Message-ID: <20251113145332.16805-14-christian.koenig@amd.com>
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

This should allow amdkfd_fences to outlive the amdgpu module.

v2: implement Felix suggestion to lock the fence while signaling it.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  6 +++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  | 39 ++++++++-----------
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  7 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  4 +-
 4 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 8bdfcde2029b..6254cef04213 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -196,6 +196,7 @@ int kfd_debugfs_kfd_mem_limits(struct seq_file *m, void *data);
 #endif
 #if IS_ENABLED(CONFIG_HSA_AMD)
 bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm);
+void amdkfd_fence_signal(struct dma_fence *f);
 struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f);
 void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo);
 int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
@@ -210,6 +211,11 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
 	return false;
 }
 
+static inline
+void amdkfd_fence_signal(struct dma_fence *f)
+{
+}
+
 static inline
 struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 09c919f72b6c..f76c3c52a2a1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
@@ -127,29 +127,9 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
 		if (!svm_range_schedule_evict_svm_bo(fence))
 			return true;
 	}
-	return false;
-}
-
-/**
- * amdkfd_fence_release - callback that fence can be freed
- *
- * @f: dma_fence
- *
- * This function is called when the reference count becomes zero.
- * Drops the mm_struct reference and RCU schedules freeing up the fence.
- */
-static void amdkfd_fence_release(struct dma_fence *f)
-{
-	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
-
-	/* Unconditionally signal the fence. The process is getting
-	 * terminated.
-	 */
-	if (WARN_ON(!fence))
-		return; /* Not an amdgpu_amdkfd_fence */
-
 	mmdrop(fence->mm);
-	kfree_rcu(f, rcu);
+	fence->mm = NULL;
+	return false;
 }
 
 /**
@@ -174,9 +154,22 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
 	return false;
 }
 
+void amdkfd_fence_signal(struct dma_fence *f)
+{
+	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
+	long flags;
+
+	dma_fence_lock_irqsafe(f, flags)
+	if (fence->mm) {
+		mmdrop(fence->mm);
+		fence->mm = NULL;
+	}
+	dma_fence_signal_locked(f);
+	dma_fence_unlock_irqrestore(f, flags)
+}
+
 static const struct dma_fence_ops amdkfd_fence_ops = {
 	.get_driver_name = amdkfd_fence_get_driver_name,
 	.get_timeline_name = amdkfd_fence_get_timeline_name,
 	.enable_signaling = amdkfd_fence_enable_signaling,
-	.release = amdkfd_fence_release,
 };
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index a085faac9fe1..8fac70b839ed 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1173,7 +1173,7 @@ static void kfd_process_wq_release(struct work_struct *work)
 	synchronize_rcu();
 	ef = rcu_access_pointer(p->ef);
 	if (ef)
-		dma_fence_signal(ef);
+		amdkfd_fence_signal(ef);
 
 	kfd_process_remove_sysfs(p);
 	kfd_debugfs_remove_process(p);
@@ -1990,7 +1990,6 @@ kfd_process_gpuid_from_node(struct kfd_process *p, struct kfd_node *node,
 static int signal_eviction_fence(struct kfd_process *p)
 {
 	struct dma_fence *ef;
-	int ret;
 
 	rcu_read_lock();
 	ef = dma_fence_get_rcu_safe(&p->ef);
@@ -1998,10 +1997,10 @@ static int signal_eviction_fence(struct kfd_process *p)
 	if (!ef)
 		return -EINVAL;
 
-	ret = dma_fence_signal(ef);
+	amdkfd_fence_signal(ef);
 	dma_fence_put(ef);
 
-	return ret;
+	return 0;
 }
 
 static void evict_process_worker(struct work_struct *work)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index c30dfb8ec236..566950702b7d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -428,7 +428,7 @@ static void svm_range_bo_release(struct kref *kref)
 
 	if (!dma_fence_is_signaled(&svm_bo->eviction_fence->base))
 		/* We're not in the eviction worker. Signal the fence. */
-		dma_fence_signal(&svm_bo->eviction_fence->base);
+		amdkfd_fence_signal(&svm_bo->eviction_fence->base);
 	dma_fence_put(&svm_bo->eviction_fence->base);
 	amdgpu_bo_unref(&svm_bo->bo);
 	kfree(svm_bo);
@@ -3628,7 +3628,7 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
 	mmap_read_unlock(mm);
 	mmput(mm);
 
-	dma_fence_signal(&svm_bo->eviction_fence->base);
+	amdkfd_fence_signal(&svm_bo->eviction_fence->base);
 
 	/* This is the last reference to svm_bo, after svm_range_vram_node_free
 	 * has been called in svm_migrate_vram_to_ram
-- 
2.43.0

