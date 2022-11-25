Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D98363874C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 11:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBAB10E61F;
	Fri, 25 Nov 2022 10:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B173810E60A;
 Fri, 25 Nov 2022 10:21:41 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d1so6041538wrs.12;
 Fri, 25 Nov 2022 02:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Y9Lgo8n5sdKm8tWhlkpLlkTZnjMu0xGNkJqCOeSsc58=;
 b=ISXOjzd3FKQ2PWEb2IJBc/2zp1K923cZNhHoR/1SD/z/3+PCX1w7uTRohN0BNBXsHP
 w7ABuAHY4C1LTmGuLQ5W8CBMeU8506Xw/OU76nyn3OG5LJPqEyEbWmk1Lr8njrQyMsCK
 C/0AaOAFAW523mFR/d2F/hQPsV8ZxxjiTYZ+zzJsJtJa/jj0YIgL+Qyje3c5A408fC7S
 E+v9FjOK4F48yk6P9fcSO+WaSbMbW+NgevjEBqP30thO0FMrX0KyHCPBDdyJ2ei0wNaw
 p/BGJSlVs8NU5GkLxlNJFdJFBuDtMdXaHP0YFP+EDrWFm+VFMeNdq7ygrzGJk/4efT1E
 WP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y9Lgo8n5sdKm8tWhlkpLlkTZnjMu0xGNkJqCOeSsc58=;
 b=ieQecuXUZMBaRfI3E0STtT56fhLfvTLatze6UB6xS2TzmZ0FfrfDEIJF3kEb7T1Lp3
 FYodu1Sap7xEwUHgxAVaPyVUNzsfo/lTQu2/L7jD2Q6yy66A8WwgFUB0w+hXhVSWSREa
 lb8PZ7S1Q1Fc6QOCL9tjcYfaG9+9wi+VF3ypZ4hcrk8LT8r4+9hLMWpQkAR++IN5qH1G
 okzDpmCmnKbF8apDASPIFsE+Y07M0FO0wIUd7XBRX7yYH+JlP8yE2WBW/fCkfKi6dB5u
 CdZOWApRhZ2BtAAk+ti62WAzp8fuHJRCgI8ozBUrvKnj6zCFUg1UqLpsEvnJFxrZ2stG
 3EMQ==
X-Gm-Message-State: ANoB5pmyANOQxAXMP6RHuBnKQ5IAOJKaUfYRdzM3AaH0zkgPO6V2QjxP
 yB1WHEUy6wS2wbsVCRX/WsqYiJjWrvk=
X-Google-Smtp-Source: AA0mqf4e4M8SzO4WD5xmTrfJ5Pu3IX9cRC6GcbAwnhWuya7MV+uZp2L6Y8rUwHJKin/0GOh71WYuHQ==
X-Received: by 2002:adf:fb12:0:b0:236:60e8:3cca with SMTP id
 c18-20020adffb12000000b0023660e83ccamr16436896wrr.471.1669371700201; 
 Fri, 25 Nov 2022 02:21:40 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056000038200b00241cfe6e286sm3351193wrf.98.2022.11.25.02.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 02:21:39 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/9] drm/ttm: remove ttm_bo_(un)lock_delayed_workqueue
Date: Fri, 25 Nov 2022 11:21:30 +0100
Message-Id: <20221125102137.1801-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125102137.1801-1-christian.koenig@amd.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
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

Those functions never worked correctly since it is still perfectly
possible that a buffer object is released and the background worker
restarted even after calling them.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  6 +-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  4 +---
 drivers/gpu/drm/radeon/radeon_device.c      |  5 -----
 drivers/gpu/drm/radeon/radeon_pm.c          |  4 +---
 drivers/gpu/drm/ttm/ttm_bo.c                | 14 --------------
 include/drm/ttm/ttm_bo_api.h                | 16 ----------------
 6 files changed, 3 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 0f16d3c09309..f60753f97ac5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1717,7 +1717,7 @@ static void amdgpu_ib_preempt_mark_partial_job(struct amdgpu_ring *ring)
 
 static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 {
-	int r, resched, length;
+	int r, length;
 	struct amdgpu_ring *ring;
 	struct dma_fence **fences = NULL;
 	struct amdgpu_device *adev = (struct amdgpu_device *)data;
@@ -1747,8 +1747,6 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 	/* stop the scheduler */
 	kthread_park(ring->sched.thread);
 
-	resched = ttm_bo_lock_delayed_workqueue(&adev->mman.bdev);
-
 	/* preempt the IB */
 	r = amdgpu_ring_preempt_ib(ring);
 	if (r) {
@@ -1785,8 +1783,6 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 
 	up_read(&adev->reset_domain->sem);
 
-	ttm_bo_unlock_delayed_workqueue(&adev->mman.bdev, resched);
-
 pro_end:
 	kfree(fences);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index b2b1c66bfe39..2b1db37e25c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3983,10 +3983,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 	}
 	amdgpu_fence_driver_hw_fini(adev);
 
-	if (adev->mman.initialized) {
+	if (adev->mman.initialized)
 		flush_delayed_work(&adev->mman.bdev.wq);
-		ttm_bo_lock_delayed_workqueue(&adev->mman.bdev);
-	}
 
 	if (adev->pm_sysfs_en)
 		amdgpu_pm_sysfs_fini(adev);
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 6344454a7721..9a556f505685 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1772,7 +1772,6 @@ int radeon_gpu_reset(struct radeon_device *rdev)
 	bool saved = false;
 
 	int i, r;
-	int resched;
 
 	down_write(&rdev->exclusive_lock);
 
@@ -1784,8 +1783,6 @@ int radeon_gpu_reset(struct radeon_device *rdev)
 	atomic_inc(&rdev->gpu_reset_counter);
 
 	radeon_save_bios_scratch_regs(rdev);
-	/* block TTM */
-	resched = ttm_bo_lock_delayed_workqueue(&rdev->mman.bdev);
 	radeon_suspend(rdev);
 	radeon_hpd_fini(rdev);
 
@@ -1844,8 +1841,6 @@ int radeon_gpu_reset(struct radeon_device *rdev)
 	/* reset hpd state */
 	radeon_hpd_init(rdev);
 
-	ttm_bo_unlock_delayed_workqueue(&rdev->mman.bdev, resched);
-
 	rdev->in_reset = true;
 	rdev->needs_reset = false;
 
diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index 04c693ca419a..cbc554928bcc 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -1853,11 +1853,10 @@ static bool radeon_pm_debug_check_in_vbl(struct radeon_device *rdev, bool finish
 static void radeon_dynpm_idle_work_handler(struct work_struct *work)
 {
 	struct radeon_device *rdev;
-	int resched;
+
 	rdev = container_of(work, struct radeon_device,
 				pm.dynpm_idle_work.work);
 
-	resched = ttm_bo_lock_delayed_workqueue(&rdev->mman.bdev);
 	mutex_lock(&rdev->pm.mutex);
 	if (rdev->pm.dynpm_state == DYNPM_STATE_ACTIVE) {
 		int not_processed = 0;
@@ -1908,7 +1907,6 @@ static void radeon_dynpm_idle_work_handler(struct work_struct *work)
 				      msecs_to_jiffies(RADEON_IDLE_LOOP_MS));
 	}
 	mutex_unlock(&rdev->pm.mutex);
-	ttm_bo_unlock_delayed_workqueue(&rdev->mman.bdev, resched);
 }
 
 /*
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index c3f4b33136e5..b77262a623e0 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -418,20 +418,6 @@ void ttm_bo_put(struct ttm_buffer_object *bo)
 }
 EXPORT_SYMBOL(ttm_bo_put);
 
-int ttm_bo_lock_delayed_workqueue(struct ttm_device *bdev)
-{
-	return cancel_delayed_work_sync(&bdev->wq);
-}
-EXPORT_SYMBOL(ttm_bo_lock_delayed_workqueue);
-
-void ttm_bo_unlock_delayed_workqueue(struct ttm_device *bdev, int resched)
-{
-	if (resched)
-		schedule_delayed_work(&bdev->wq,
-				      ((HZ / 100) < 1) ? 1 : HZ / 100);
-}
-EXPORT_SYMBOL(ttm_bo_unlock_delayed_workqueue);
-
 static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
 				     struct ttm_resource **mem,
 				     struct ttm_operation_ctx *ctx,
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 44a538ee5e2a..7758347c461c 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -290,22 +290,6 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo);
 void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
 			  struct ttm_lru_bulk_move *bulk);
 
-/**
- * ttm_bo_lock_delayed_workqueue
- *
- * Prevent the delayed workqueue from running.
- * Returns
- * True if the workqueue was queued at the time
- */
-int ttm_bo_lock_delayed_workqueue(struct ttm_device *bdev);
-
-/**
- * ttm_bo_unlock_delayed_workqueue
- *
- * Allows the delayed workqueue to run.
- */
-void ttm_bo_unlock_delayed_workqueue(struct ttm_device *bdev, int resched);
-
 /**
  * ttm_bo_eviction_valuable
  *
-- 
2.34.1

