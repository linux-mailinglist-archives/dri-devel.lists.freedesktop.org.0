Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C1B737878
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 02:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D9C10E38F;
	Wed, 21 Jun 2023 00:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADFA10E394;
 Wed, 21 Jun 2023 00:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0e/opeWgqF70uqTQU9A9bAOiZ20K1sbyHX7KO5D5TY8=; b=XTK919HN6/AH2/VHbMb/7HlmAu
 GoW2i5lwonJBrmjCq6YTpHnq/0ev1q446f0JNUkFqCXc5l1PMJdMZHUvMZOmqGbp1VGr045PfbuUg
 KbaWXF+sLvepux8ODfT8yIXd3LQ4Az1Xlc3pazNjwgcDAeo/EF1xhmz1zwsG4AmXYPnQONQp5EOzF
 n3qQNaepeR9ljB8izJuBxlFDTWaq00sHSAGsxhc4I5sdXJBYQaaQSrqFDHeRXNTIN8AIQoPC/0/AG
 D3XI3yirz89u8Wi7wzho6GlJ4Mdli88A1bYeW6JmFqCAcS2WAzah8CNbgth3YWHWUrMnveiJEp4pB
 bXxnoC8Q==;
Received: from [179.113.218.86] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qBmBD-0011pg-Eo; Wed, 21 Jun 2023 02:58:39 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 3/4] drm/amdgpu: Implement DRM_IOCTL_GET_RESET
Date: Tue, 20 Jun 2023 21:57:18 -0300
Message-ID: <20230621005719.836857-4-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621005719.836857-1-andrealmeid@igalia.com>
References: <20230621005719.836857-1-andrealmeid@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement get_reset ioctl for amdgpu

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  4 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 35 +++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  5 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 12 +++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h |  2 ++
 6 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 2eb2c66843a8..0ba26b4b039c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1262,8 +1262,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	uint64_t seq;
 	int r;
 
-	for (i = 0; i < p->gang_size; ++i)
+	for (i = 0; i < p->gang_size; ++i) {
+		p->jobs[i]->ctx = p->ctx;
 		drm_sched_job_arm(&p->jobs[i]->base);
+	}
 
 	for (i = 0; i < p->gang_size; ++i) {
 		struct dma_fence *fence;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index d2139ac12159..d3e292382d4a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -322,6 +322,9 @@ static int amdgpu_ctx_init(struct amdgpu_ctx_mgr *mgr, int32_t priority,
 	ctx->init_priority = priority;
 	ctx->override_priority = AMDGPU_CTX_PRIORITY_UNSET;
 
+	ctx->global_reset_counter = atomic_read(&mgr->adev->gpu_reset_counter);
+	ctx->local_reset_counter = 0;
+
 	r = amdgpu_ctx_get_stable_pstate(ctx, &current_stable_pstate);
 	if (r)
 		return r;
@@ -963,3 +966,35 @@ void amdgpu_ctx_mgr_usage(struct amdgpu_ctx_mgr *mgr,
 	}
 	mutex_unlock(&mgr->lock);
 }
+
+int amdgpu_get_reset(struct drm_file *filp, struct drm_device *dev,
+		     struct drm_get_reset *reset)
+{
+	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct amdgpu_ctx *ctx;
+	struct amdgpu_ctx_mgr *mgr;
+	unsigned int id = reset->ctx_id;
+	struct amdgpu_fpriv *fpriv = filp->driver_priv;
+
+	mgr = &fpriv->ctx_mgr;
+	mutex_lock(&mgr->lock);
+	ctx = idr_find(&mgr->ctx_handles, id);
+	if (!ctx) {
+		mutex_unlock(&mgr->lock);
+		return -EINVAL;
+	}
+
+	reset->dev_reset_count =
+		atomic_read(&adev->gpu_reset_counter) - ctx->global_reset_counter;
+
+	reset->ctx_reset_count = ctx->local_reset_counter;
+
+	if (amdgpu_in_reset(adev))
+		reset->flags |= DRM_RESET_IN_PROGRESS;
+
+	if (ctx->vram_lost_counter != atomic_read(&adev->vram_lost_counter))
+		reset->flags |= DRM_RESET_VRAM_LOST;
+
+	mutex_unlock(&mgr->lock);
+	return 0;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
index 0fa0e56daf67..0c9815695884 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
@@ -57,6 +57,9 @@ struct amdgpu_ctx {
 	unsigned long			ras_counter_ce;
 	unsigned long			ras_counter_ue;
 	uint32_t			stable_pstate;
+
+	uint64_t			global_reset_counter;
+	uint64_t			local_reset_counter;
 };
 
 struct amdgpu_ctx_mgr {
@@ -97,4 +100,6 @@ void amdgpu_ctx_mgr_fini(struct amdgpu_ctx_mgr *mgr);
 void amdgpu_ctx_mgr_usage(struct amdgpu_ctx_mgr *mgr,
 			  ktime_t usage[AMDGPU_HW_IP_NUM]);
 
+int amdgpu_get_reset(struct drm_file *file_priv, struct drm_device *dev,
+		     struct drm_get_reset *reset);
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index c9a41c997c6c..431791b2c3cb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2805,6 +2805,7 @@ static const struct drm_driver amdgpu_kms_driver = {
 #ifdef CONFIG_PROC_FS
 	.show_fdinfo = amdgpu_show_fdinfo,
 #endif
+	.get_reset = amdgpu_get_reset,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index c3d9d75143f4..1553a2633d46 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -35,11 +35,20 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 {
 	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
+	struct drm_sched_entity *entity = job->base.entity;
 	struct amdgpu_task_info ti;
 	struct amdgpu_device *adev = ring->adev;
 	int idx;
 	int r;
 
+	memset(&ti, 0, sizeof(struct amdgpu_task_info));
+	amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
+
+	if (job->ctx) {
+		DRM_INFO("Increasing ctx reset count for %s (%d)\n", ti.process_name, ti.pid);
+		job->ctx->local_reset_counter++;
+	}
+
 	if (!drm_dev_enter(adev_to_drm(adev), &idx)) {
 		DRM_INFO("%s - device unplugged skipping recovery on scheduler:%s",
 			 __func__, s_job->sched->name);
@@ -48,7 +57,6 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 		return DRM_GPU_SCHED_STAT_ENODEV;
 	}
 
-	memset(&ti, 0, sizeof(struct amdgpu_task_info));
 	adev->job_hang = true;
 
 	if (amdgpu_gpu_recovery &&
@@ -58,7 +66,6 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 		goto exit;
 	}
 
-	amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
 	DRM_ERROR("ring %s timeout, signaled seq=%u, emitted seq=%u\n",
 		  job->base.sched->name, atomic_read(&ring->fence_drv.last_seq),
 		  ring->fence_drv.sync_seq);
@@ -105,6 +112,7 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	 */
 	(*job)->base.sched = &adev->rings[0]->sched;
 	(*job)->vm = vm;
+	(*job)->ctx = NULL;
 
 	amdgpu_sync_create(&(*job)->explicit_sync);
 	(*job)->vram_lost_counter = atomic_read(&adev->vram_lost_counter);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
index 52f2e313ea17..0d463babaa60 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
@@ -63,6 +63,8 @@ struct amdgpu_job {
 	uint32_t		oa_base, oa_size;
 	uint32_t		vram_lost_counter;
 
+	struct amdgpu_ctx	*ctx;
+
 	/* user fence handling */
 	uint64_t		uf_addr;
 	uint64_t		uf_sequence;
-- 
2.41.0

