Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E746375DA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 11:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48FE10E6BC;
	Thu, 24 Nov 2022 10:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F0B10E6BC;
 Thu, 24 Nov 2022 10:02:56 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id f7so1855664edc.6;
 Thu, 24 Nov 2022 02:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DT10+AQ/j/4DvlFjT8UnEtNOMNUpt6M8DZNmbpzF/A0=;
 b=WFqwyYUyhxbL3lFsqrxUHpNo0eaH//hHIoFKnMaV21L6U0PXIJt+CEFFcy+++Q8sO6
 Qkt3N3T8dwdRaXsPlvpFup7L8T6f8TKKp2VrtLB58o2O593lciFnPWlN3ZSVJuPDojWu
 GZxa6KHL8tjCjp6FFBNOOuica+AZhSh8XUVqQTkry4TMKtffZNkC4Y+KsI7XL5vGvRHC
 3XqvPLIlTUXHC173R4qpF5aAEz+HjI1opmS7kruy4Di9ICFgJPq9QlkG6xUdsdc87BOa
 8E5PTNFPrkRQGsmXUsUer+yfiWEWkGZ7obeB8IQv47fhM97ARidTogfrF6fzxBcIwMnW
 IJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DT10+AQ/j/4DvlFjT8UnEtNOMNUpt6M8DZNmbpzF/A0=;
 b=HDE2LVSGNKRMqs/ooIhBoelgpDEt4XMG59hIwcY10FBF++1KlU7BOELBkb5NrKimfm
 v4qjSczx3f+FbSFykHF777EMqemy11qIEKBsgwKC/AGLZeBFCn9Yy9F1/uPp7kxRKCGm
 U/TAamn4sdVhLlHnD2Q9jJEm9/wQY/O/gTcPdGGN3PHijfsCkc9zQFDTOheiOQYvtFHj
 Q0rzLtNsNHZvSlfwcV2xDPFsAlpcrZNUnA7xQTUwQvfXxRYfxqCIoFKCGvh1xemi1otp
 ej93ZvbcyBW++fMO3qWwSntRiTX8eQFLaxe9jzUxI/HboMxOvHcAIqzm4SJFKB8R2TDU
 fe+g==
X-Gm-Message-State: ANoB5pmTKecZ2j/hLDDTvEsvNrpy8CaKtNR90YcRdedDsdTXlbX/4XR7
 t2rv3sfxBQILaCG+soNfPkY=
X-Google-Smtp-Source: AA0mqf52Ks63ZCGsp25loumAzgQn8HAaA/1r3X1TbLtPsSVW2css9G+RrWeM1RF8Ju/r0U+pZOaXjg==
X-Received: by 2002:aa7:dd0f:0:b0:46a:40f5:aca with SMTP id
 i15-20020aa7dd0f000000b0046a40f50acamr5011361edv.427.1669284175074; 
 Thu, 24 Nov 2022 02:02:55 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 ey3-20020a0564022a0300b00461816beef9sm328907edb.14.2022.11.24.02.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 02:02:54 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Alexander.Deucher@amd.com, Marek.Olsak@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/ttm: remove ttm_bo_(un)lock_delayed_workqueue
Date: Thu, 24 Nov 2022 11:02:50 +0100
Message-Id: <20221124100252.2744-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Amaranath.Somalapuram@amd.com, Arunpravin.PaneerSelvam@amd.com
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
index de61a85c4b02..8c57a5b7ecba 100644
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
index cc65df9f2419..ff2ae0be2c28 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3965,10 +3965,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
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
index a556b6be1137..ea10306809cf 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1768,7 +1768,6 @@ int radeon_gpu_reset(struct radeon_device *rdev)
 	bool saved = false;
 
 	int i, r;
-	int resched;
 
 	down_write(&rdev->exclusive_lock);
 
@@ -1780,8 +1779,6 @@ int radeon_gpu_reset(struct radeon_device *rdev)
 	atomic_inc(&rdev->gpu_reset_counter);
 
 	radeon_save_bios_scratch_regs(rdev);
-	/* block TTM */
-	resched = ttm_bo_lock_delayed_workqueue(&rdev->mman.bdev);
 	radeon_suspend(rdev);
 	radeon_hpd_fini(rdev);
 
@@ -1840,8 +1837,6 @@ int radeon_gpu_reset(struct radeon_device *rdev)
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

