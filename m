Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EAA5935FD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 21:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D997D260C;
	Mon, 15 Aug 2022 19:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B49D2544
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:59:53 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id j8so15037552ejx.9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 11:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=4Anpw29AJGKoUDi9kQhyNxetXmSQysTXEjYIswTAMko=;
 b=jGSkpMZX66oaCistjsGZdY/aRx1xBSzl833DxeD6Prs98en6yB4Psm0FG3s/grPKmA
 VscHb2pVgTP+VrpBP7RZuQWZpvCWXh6zj/1exPHS26YrX+vvxIavu0llImAKG9wOSolz
 j8gMTli5nENfMdl9ZZzZoll2OjGDWM5u1KO9StG7oveguTU/ElTgRm0Bfds6lZrBAFGR
 p28aIjZpqpzMbAYT7UvpVtQDg4mQo+EVVNRp67T8bKo1Em5Klf54gfDCopL7LTyj/E6I
 ebvaPPuyUDaAgme2L7GT5o5hhoq/dL0tuHy5qCUl61R4NNchweyUbnLxRJUbrNWx9MyN
 tXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4Anpw29AJGKoUDi9kQhyNxetXmSQysTXEjYIswTAMko=;
 b=HsqMN29fIAiTRFmrTCafqIDqKEcFTytExe0OrK0QfoMA3b3IGyX48XTG3+h1FB1Rzm
 hTWOdhXOIvkPe7TmpgoOU9YfLRkqGSU9/slSKUk843CTYZTJawEWYaNWoxYUOjHAYec3
 roCsWnCIT6k6HX5giXmjfLrl/3fkah4wXt6BOuNDAIoScicYLmP+PL63Vt2eLEYHiPzn
 8nniJARK84gPzeBSh9yelek8jLaNB4d+Gts+AVbtGyi1pqwUTENCz8MVALvrbr3gikZT
 WgzOxQRmklWqkWqtM0eLVe/Tu9Unt5p7rHXQsrqkGLBhvi7JGarl5lmEzS11IQe4SHtx
 KcLg==
X-Gm-Message-State: ACgBeo1bJK+y/KjCOT9TYvxSnHR3zurfXCRC/rV+Oui9FzdfIF0PFOXN
 u/pu7lARdSSckWhsHJo+Za+MPAvgA2E=
X-Google-Smtp-Source: AA6agR40Hl4fr3TjCk8fbBaVuCADogKvDHa5i8gmKeqAlSf7LprN5Rx9nbxfleigCziHKJywnOjbFw==
X-Received: by 2002:a17:907:1690:b0:731:56b6:fded with SMTP id
 hc16-20020a170907169000b0073156b6fdedmr11509376ejc.119.1660589991648; 
 Mon, 15 Aug 2022 11:59:51 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a170906304a00b00731745a7e62sm3553805ejd.28.2022.08.15.11.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 11:59:51 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/10] drm/amdgpu: add gang submit backend v2
Date: Mon, 15 Aug 2022 20:59:39 +0200
Message-Id: <20220815185940.4744-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815185940.4744-1-christian.koenig@amd.com>
References: <20220815185940.4744-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allows submitting jobs as gang which needs to run on multiple
engines at the same time.

Basic idea is that we have a global gang submit fence representing when the
gang leader is finally pushed to run on the hardware last.

Jobs submitted as gang are never re-submitted in case of a GPU reset since this
won't work and will just deadlock the hardware immediately again.

v2: fix logic inversion, improve documentation, fix rcu

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 35 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 28 +++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h    |  3 ++
 4 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 5a639c857bd0..3ac1e4d05fcb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -885,6 +885,7 @@ struct amdgpu_device {
 	u64				fence_context;
 	unsigned			num_rings;
 	struct amdgpu_ring		*rings[AMDGPU_MAX_RINGS];
+	struct dma_fence __rcu		*gang_submit;
 	bool				ib_pool_ready;
 	struct amdgpu_sa_manager	ib_pools[AMDGPU_IB_POOL_MAX];
 	struct amdgpu_sched		gpu_sched[AMDGPU_HW_IP_NUM][AMDGPU_RING_PRIO_MAX];
@@ -1294,6 +1295,8 @@ u32 amdgpu_device_pcie_port_rreg(struct amdgpu_device *adev,
 				u32 reg);
 void amdgpu_device_pcie_port_wreg(struct amdgpu_device *adev,
 				u32 reg, u32 v);
+struct dma_fence *amdgpu_device_switch_gang(struct amdgpu_device *adev,
+					    struct dma_fence *gang);
 
 /* atpx handler */
 #if defined(CONFIG_VGA_SWITCHEROO)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c84fdef0ac45..23f2938a1fea 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3499,6 +3499,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	adev->gmc.gart_size = 512 * 1024 * 1024;
 	adev->accel_working = false;
 	adev->num_rings = 0;
+	RCU_INIT_POINTER(adev->gang_submit, dma_fence_get_stub());
 	adev->mman.buffer_funcs = NULL;
 	adev->mman.buffer_funcs_ring = NULL;
 	adev->vm_manager.vm_pte_funcs = NULL;
@@ -3979,6 +3980,7 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 	release_firmware(adev->firmware.gpu_info_fw);
 	adev->firmware.gpu_info_fw = NULL;
 	adev->accel_working = false;
+	dma_fence_put(rcu_dereference_protected(adev->gang_submit, true));
 
 	amdgpu_reset_fini(adev);
 
@@ -5914,3 +5916,36 @@ void amdgpu_device_pcie_port_wreg(struct amdgpu_device *adev,
 	(void)RREG32(data);
 	spin_unlock_irqrestore(&adev->pcie_idx_lock, flags);
 }
+
+/**
+ * amdgpu_device_switch_gang - switch to a new gang
+ * @adev: amdgpu_device pointer
+ * @gang: the gang to switch to
+ *
+ * Try to switch to a new gang.
+ * Returns: NULL if we switched to the new gang or a reference to the current
+ * gang leader.
+ */
+struct dma_fence *amdgpu_device_switch_gang(struct amdgpu_device *adev,
+					    struct dma_fence *gang)
+{
+	struct dma_fence *old = NULL;
+
+	do {
+		dma_fence_put(old);
+		rcu_read_lock();
+		old = dma_fence_get_rcu_safe(&adev->gang_submit);
+		rcu_read_unlock();
+
+		if (old == gang)
+			break;
+
+		if (!dma_fence_is_signaled(old))
+			return old;
+
+	} while (cmpxchg((struct dma_fence __force **)&adev->gang_submit,
+			 old, gang) != old);
+
+	dma_fence_put(old);
+	return NULL;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 2348beea6a2e..e4b791cdda2c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -173,11 +173,29 @@ static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
 	dma_fence_put(&job->hw_fence);
 }
 
+void amdgpu_job_set_gang_leader(struct amdgpu_job *job,
+				struct amdgpu_job *leader)
+{
+	struct dma_fence *fence = &leader->base.s_fence->scheduled;
+
+	WARN_ON(job->gang_submit);
+
+	/*
+	 * Don't add a reference when we are the gang leader to avoid circle
+	 * dependency.
+	 */
+	if (job != leader)
+		dma_fence_get(fence);
+	job->gang_submit = fence;
+}
+
 void amdgpu_job_free(struct amdgpu_job *job)
 {
 	amdgpu_job_free_resources(job);
 	amdgpu_sync_free(&job->sync);
 	amdgpu_sync_free(&job->sched_sync);
+	if (job->gang_submit != &job->base.s_fence->scheduled)
+		dma_fence_put(job->gang_submit);
 
 	dma_fence_put(&job->hw_fence);
 }
@@ -244,12 +262,16 @@ static struct dma_fence *amdgpu_job_dependency(struct drm_sched_job *sched_job,
 		fence = amdgpu_sync_get_fence(&job->sync);
 	}
 
+	if (!fence && job->gang_submit)
+		fence = amdgpu_device_switch_gang(ring->adev, job->gang_submit);
+
 	return fence;
 }
 
 static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
 {
 	struct amdgpu_ring *ring = to_amdgpu_ring(sched_job->sched);
+	struct amdgpu_device *adev = ring->adev;
 	struct dma_fence *fence = NULL, *finished;
 	struct amdgpu_job *job;
 	int r = 0;
@@ -261,8 +283,10 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
 
 	trace_amdgpu_sched_run_job(job);
 
-	if (job->vram_lost_counter != atomic_read(&ring->adev->vram_lost_counter))
-		dma_fence_set_error(finished, -ECANCELED);/* skip IB as well if VRAM lost */
+	/* Skip job if VRAM is lost and never resubmit gangs */
+	if (job->vram_lost_counter != atomic_read(&adev->vram_lost_counter) ||
+	    (job->job_run_counter && job->gang_submit))
+		dma_fence_set_error(finished, -ECANCELED);
 
 	if (finished->error < 0) {
 		DRM_INFO("Skip scheduling IBs!\n");
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
index 2a1961bf1194..4763081eb6bc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
@@ -50,6 +50,7 @@ struct amdgpu_job {
 	struct amdgpu_sync	sync;
 	struct amdgpu_sync	sched_sync;
 	struct dma_fence	hw_fence;
+	struct dma_fence	*gang_submit;
 	uint32_t		preamble_status;
 	uint32_t                preemption_status;
 	bool                    vm_needs_flush;
@@ -79,6 +80,8 @@ int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev, unsigned size,
 void amdgpu_job_set_resources(struct amdgpu_job *job, struct amdgpu_bo *gds,
 			      struct amdgpu_bo *gws, struct amdgpu_bo *oa);
 void amdgpu_job_free_resources(struct amdgpu_job *job);
+void amdgpu_job_set_gang_leader(struct amdgpu_job *job,
+				struct amdgpu_job *leader);
 void amdgpu_job_free(struct amdgpu_job *job);
 int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
 		      void *owner, struct dma_fence **f);
-- 
2.25.1

