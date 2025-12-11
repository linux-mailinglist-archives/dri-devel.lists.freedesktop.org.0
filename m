Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8224CB5CFA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AAA10E7F9;
	Thu, 11 Dec 2025 12:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VUlzm1I7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF7110E7E7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:23 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-477770019e4so237105e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455862; x=1766060662; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTSC+Vtw1VpyYro/I3MkkSq7dUYkK2G2AnrdgEbY1hs=;
 b=VUlzm1I7EVCN8dhcCcrn34B7p3yu3oNh2xRScIm/PFVlnrdS5KmZSV2nB3wn22K6jH
 ldNz089N82uuipfOGrajXAkTOZD0vOiRn58oC0caE5n8OAMdbjYCZ2ZIJ727AE9iaHzM
 gllXziqEmN3CngLINRTXwwdfdc1Yh9grQ9Z7BtPVeTsddhmo1NCp2tUSzQa+EeGCcMHO
 DrrbETg0N8GUCN3HccShHpthCfCZOP/AwVomfBzvfrLpDowxNB2O2DeF/d7GCgJCNY6g
 Bfg4CKUN94Vrs4O5r7oSzaCWXUEQNhQe6QMstiuO3PH8AnwJZ7otjcXy16YKsHMyMrYc
 ms4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455862; x=1766060662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QTSC+Vtw1VpyYro/I3MkkSq7dUYkK2G2AnrdgEbY1hs=;
 b=RrP9ceRfGZJxy6DM2MwdIxihT4o1rMKtS71H3vgWfOkzPEWRHyZ4kqV1vYUgjag70H
 RSAqXVBfSgDkrpC/5q3DTAbLUZm6BRPm/kN+/4x9aznyEqQVGtK8Y6KpzJqIYPq+Ej4+
 V97pBih2IodKk6YxUpW056u84G4LkH7/g6w3Fzcboll50jXNnCIgLttOXF1ARKhlIayR
 Sdf0tQ3HFUDEs11N3r98vUtiPmihXTAbtdIO7MTfm/qlzS1ZM4KVrMzvUN4EV4++IByj
 8ND1Bk+dSsrKPAnTHKzshDsw5lXHXcOU0kEobY0qho3XLlRc5SqOcbq3WOpm3b7QDb2L
 u2GA==
X-Gm-Message-State: AOJu0YzikOrtDLdB90mFJvG0WmSuRdObbCNcAMNFU6Yic31uS2L6aAsc
 I4tvaTGlAbEXYd4147f2ISnqPUFkqCX7kU2VbRvz0+YMtsG9Heb4bipn
X-Gm-Gg: AY/fxX6MxuvHAbJnDx0keIRPuqxsjHXTyaFpxbjI21uzYwaZlm4F+3MB6QKszLVV0qJ
 3KeI8GkNRNcXlqUsEvlCA69S6qhLIAB52Z4EPjfLNiJ6a1Okhow3kOeEZgMYUDhIBXUtVq4Z2JK
 n0yYU1kAWTERh6r44uZ+G1JAGFAsbhiUSSQ0ljdCFdNuE0UEGKxdMj40PR9m9HVPeE7ekLxDIS+
 dwTIt2BqSEZVKvmqJRaNmGLdQr5AKs2onyZ51f2DYl/2ua9TKQexcXECSNo0WGKTJY8jIcOTHZ9
 6fL/kCAQOt0famHUxkjG2vr0FxOXG9iowS+f1h3jHcMGZsiQhazP4FeQxXaP5MmgwOVqgQsZTj7
 kNh+pqLAVZObQgBlrOIr8A8e4CyoLns/Qj/DoI+Df2b6ygzw1ywrHqxM7gJ+CjQ458+wQIfrR94
 aSatIGA3iY+Gy6HNJpMTjt5n9smM6Afm6kvzs=
X-Google-Smtp-Source: AGHT+IHC/AJtDJLcDl2RuMuOpHobx8AeZ1UeJxTD7ZjepUYFdoN5sqM/gM8VuZkeHj7aBdx0nUryLQ==
X-Received: by 2002:a05:600c:8a0c:10b0:477:98f7:2aec with SMTP id
 5b1f17b1804b1-47a856439e0mr39023285e9.3.1765455861604; 
 Thu, 11 Dec 2025 04:24:21 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:21 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 14/19] drm/amdgpu: independence for the amdkfd_fence! v4
Date: Thu, 11 Dec 2025 13:16:45 +0100
Message-ID: <20251211122407.1709-15-christian.koenig@amd.com>
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

This allows amdkfd_fences to outlive the amdgpu module.

v2: implement Felix suggestion to lock the fence while signaling it.
v3: fix typos
v4: fix return code in signal_eviction_fence

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  7 +++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  | 44 +++++++++----------
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  4 +-
 4 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 8bdfcde2029b..2f2b277cfaed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -196,6 +196,7 @@ int kfd_debugfs_kfd_mem_limits(struct seq_file *m, void *data);
 #endif
 #if IS_ENABLED(CONFIG_HSA_AMD)
 bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm);
+bool amdkfd_fence_signal(struct dma_fence *f);
 struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f);
 void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo);
 int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
@@ -210,6 +211,12 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
 	return false;
 }
 
+static inline
+bool amdkfd_fence_signal(struct dma_fence *f)
+{
+	return false;
+}
+
 static inline
 struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 09c919f72b6c..9cd413e325f0 100644
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
@@ -174,9 +154,27 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
 	return false;
 }
 
+bool amdkfd_fence_signal(struct dma_fence *f)
+{
+	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
+	unsigned long flags;
+	bool was_signaled;
+
+	dma_fence_lock_irqsave(f, flags);
+	if (fence->mm) {
+		mmdrop(fence->mm);
+		fence->mm = NULL;
+	}
+	was_signaled = dma_fence_is_signaled_locked(f);
+	if (!was_signaled)
+		dma_fence_signal_locked(f);
+	dma_fence_unlock_irqrestore(f, flags);
+
+	return was_signaled;
+}
+
 static const struct dma_fence_ops amdkfd_fence_ops = {
 	.get_driver_name = amdkfd_fence_get_driver_name,
 	.get_timeline_name = amdkfd_fence_get_timeline_name,
 	.enable_signaling = amdkfd_fence_enable_signaling,
-	.release = amdkfd_fence_release,
 };
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index bb252ec43733..2cf39e3d3fae 100644
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
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 97c2270f278f..0e94f3a976b1 100644
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

