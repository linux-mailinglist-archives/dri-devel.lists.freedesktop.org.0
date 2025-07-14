Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6119AB049FB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 00:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2C510E4F9;
	Mon, 14 Jul 2025 22:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GRhzS1tU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C047110E4F4;
 Mon, 14 Jul 2025 22:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6JzOAESgQxVuvW6NWch/TR0sP6In6rG8vUe/5qpMOpA=; b=GRhzS1tUzY03gYIUq9eH0pY0Bm
 TdW+wD/n+VainjTLvAnAd3e5ox0YDTYWPqlBBXP1FRqb7/tJzo8nw9PbzLD5dZVUSYsTH6Ck4kdPU
 kbKbfldTKeUhS5J7c30+sWZ/QjzsArCxjknpzAVcM+zOjP21fC3lhVV4wDmoO/mpKMLtLD+9PhgK9
 0ymMBfEs+5PtdJAEIs0HSNcHQFF1MC0tljOlw5ZD2H4PsVqkqOsWw0/3+IFjvBgW4yqTBaUhYiSSd
 4hrI31GThEFjmsvjb7eQ+1lOZzlRQGEf5qwP2LiU4b2MrXP08O+MfsogsakZxhfao/wdrJGE31WaM
 Lnvwdg3g==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ubRKp-00Gaod-D4; Tue, 15 Jul 2025 00:07:43 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 14 Jul 2025 19:07:02 -0300
Subject: [PATCH v6 1/8] drm/sched: Rename DRM_GPU_SCHED_STAT_NOMINAL to
 DRM_GPU_SCHED_STAT_RESET
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250714-sched-skip-reset-v6-1-5c5ba4f55039@igalia.com>
References: <20250714-sched-skip-reset-v6-0-5c5ba4f55039@igalia.com>
In-Reply-To: <20250714-sched-skip-reset-v6-0-5c5ba4f55039@igalia.com>
To: Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Min Ma <min.ma@amd.com>, 
 Lizhi Hou <lizhi.hou@amd.com>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Qiang Yu <yuq825@gmail.com>, Lyude Paul <lyude@redhat.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13978; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=A5tSfNw1qpsGAMZFKpl0UCGbeofpRa6FvyrfVXDUay4=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBodX+ZXn19cbNTOykyrpvOEWsaH9i71PMNTNVBU
 D7fDJu4bU+JATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaHV/mQAKCRA/8w6Kdoj6
 qgplB/4l8u2emzsP+ajR3rrQmag9E9ajCmhoFeLilyPz1mjusbKrl6YSptqvrkdgs45tb1crNAa
 bpr+w1mSrUKoyhcB8wLpDgAAVIuPpEPn7ZCHXmgFsGSJaVdQgJMiJMLV36XCqiPmJNy7PJg8ZbI
 fg5ce4yZUqx+Lo9gbQGyOoE14+kVZrexO5B1E2WCyNFx/ZA1NlZKwqc7eTm31yx1iJkqzvs5+AJ
 xSjfwFIDXTI+xqL1SEZAKfodZ0Bih1FtuISHamRUH9w0ikEyanCqI2b55xsJiiIsgPDouGiX/qN
 AniHr+R2oOU6X5XU+Ny2xhVCm9xd+pll7/hXsa1+Ykg3KFTN
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

Among the scheduler's statuses, the only one that indicates an error is
DRM_GPU_SCHED_STAT_ENODEV. Any status other than DRM_GPU_SCHED_STAT_ENODEV
signifies that the operation succeeded and the GPU is in a nominal state.

However, to provide more information about the GPU's status, it is needed
to convey more information than just "OK".

Therefore, rename DRM_GPU_SCHED_STAT_NOMINAL to
DRM_GPU_SCHED_STAT_RESET, which better communicates the meaning of this
status. The status DRM_GPU_SCHED_STAT_RESET indicates that the GPU has
hung, but it has been successfully reset and is now in a nominal state
again.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Philipp Stanner <phasta@kernel.org>
---
To: Min Ma <min.ma@amd.com>
To: Lizhi Hou <lizhi.hou@amd.com>
To: Oded Gabbay <ogabbay@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>
To: Matt Coster <matt.coster@imgtec.com>
To: Qiang Yu <yuq825@gmail.com>
To: Lyude Paul <lyude@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>
To: Christian König <christian.koenig@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c                 | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c          | 2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c          | 4 ++--
 drivers/gpu/drm/imagination/pvr_queue.c          | 4 ++--
 drivers/gpu/drm/lima/lima_sched.c                | 6 +++---
 drivers/gpu/drm/nouveau/nouveau_exec.c           | 2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c          | 2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c          | 6 +++---
 drivers/gpu/drm/panthor/panthor_mmu.c            | 2 +-
 drivers/gpu/drm/panthor/panthor_sched.c          | 2 +-
 drivers/gpu/drm/scheduler/sched_main.c           | 2 +-
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 2 +-
 drivers/gpu/drm/v3d/v3d_sched.c                  | 6 +++---
 drivers/gpu/drm/xe/xe_guc_submit.c               | 6 +++---
 include/drm/gpu_scheduler.h                      | 4 ++--
 15 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index f20999f2d66864fd4a6b7069e866727c37befb39..2cff5419bd2facb59ff5df6388aba0512fd45d5c 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -361,7 +361,7 @@ aie2_sched_job_timedout(struct drm_sched_job *sched_job)
 	aie2_hwctx_restart(xdna, hwctx);
 	mutex_unlock(&xdna->dev_lock);
 
-	return DRM_GPU_SCHED_STAT_NOMINAL;
+	return DRM_GPU_SCHED_STAT_RESET;
 }
 
 static const struct drm_sched_backend_ops sched_ops = {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 87f7040d8a2bb1af2aa46a051f10df3074974672..ec73cf3a9024121bcd3110dcfe6ffc0a37943862 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -175,7 +175,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 exit:
 	amdgpu_vm_put_task_info(ti);
 	drm_dev_exit(idx);
-	return DRM_GPU_SCHED_STAT_NOMINAL;
+	return DRM_GPU_SCHED_STAT_RESET;
 }
 
 int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 76a3a3e517d8d9f654fb6b9e98e72910795cfc7a..7146069a98492f5fab2a49d96e2054f649e1fe3d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -86,11 +86,11 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 	drm_sched_resubmit_jobs(&gpu->sched);
 
 	drm_sched_start(&gpu->sched, 0);
-	return DRM_GPU_SCHED_STAT_NOMINAL;
+	return DRM_GPU_SCHED_STAT_RESET;
 
 out_no_timeout:
 	list_add(&sched_job->list, &sched_job->sched->pending_list);
-	return DRM_GPU_SCHED_STAT_NOMINAL;
+	return DRM_GPU_SCHED_STAT_RESET;
 }
 
 static void etnaviv_sched_free_job(struct drm_sched_job *sched_job)
diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index 5a41ee79fed646a86344cd16e78efdb45ff02e43..fc415dd0d7a73631bd4144c9f35b9b294c625a12 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -803,7 +803,7 @@ static void pvr_queue_start(struct pvr_queue *queue)
  * the scheduler, and re-assign parent fences in the middle.
  *
  * Return:
- *  * DRM_GPU_SCHED_STAT_NOMINAL.
+ *  * DRM_GPU_SCHED_STAT_RESET.
  */
 static enum drm_gpu_sched_stat
 pvr_queue_timedout_job(struct drm_sched_job *s_job)
@@ -854,7 +854,7 @@ pvr_queue_timedout_job(struct drm_sched_job *s_job)
 
 	drm_sched_start(sched, 0);
 
-	return DRM_GPU_SCHED_STAT_NOMINAL;
+	return DRM_GPU_SCHED_STAT_RESET;
 }
 
 /**
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 954f4325b859b2977a2cc608a99a6ebb642f1000..739e8c6c6d909aa4263bad8a12ec07f0c6607bb2 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -412,7 +412,7 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 	 */
 	if (dma_fence_is_signaled(task->fence)) {
 		DRM_WARN("%s spurious timeout\n", lima_ip_name(ip));
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_RESET;
 	}
 
 	/*
@@ -429,7 +429,7 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 
 	if (dma_fence_is_signaled(task->fence)) {
 		DRM_WARN("%s unexpectedly high interrupt latency\n", lima_ip_name(ip));
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_RESET;
 	}
 
 	/*
@@ -467,7 +467,7 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 	drm_sched_resubmit_jobs(&pipe->base);
 	drm_sched_start(&pipe->base, 0);
 
-	return DRM_GPU_SCHED_STAT_NOMINAL;
+	return DRM_GPU_SCHED_STAT_RESET;
 }
 
 static void lima_sched_free_job(struct drm_sched_job *job)
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index 41b7c608c9054869ddadfe17c96100266e44c254..edbbda78bac90432c4877aa39a9587cf976705c7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -189,7 +189,7 @@ nouveau_exec_job_timeout(struct nouveau_job *job)
 	NV_PRINTK(warn, job->cli, "job timeout, channel %d killed!\n",
 		  chan->chid);
 
-	return DRM_GPU_SCHED_STAT_NOMINAL;
+	return DRM_GPU_SCHED_STAT_RESET;
 }
 
 static const struct nouveau_job_ops nouveau_exec_job_ops = {
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 7d9c3418e76b6eb90ccfeea345d60e3d67118733..0cc0bc9f9952b1cfbc4015cb2c292fbf383459c9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -370,7 +370,7 @@ nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
 {
 	struct drm_gpu_scheduler *sched = sched_job->sched;
 	struct nouveau_job *job = to_nouveau_job(sched_job);
-	enum drm_gpu_sched_stat stat = DRM_GPU_SCHED_STAT_NOMINAL;
+	enum drm_gpu_sched_stat stat = DRM_GPU_SCHED_STAT_RESET;
 
 	drm_sched_stop(sched, sched_job);
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 5657106c2f7d0a0ca6162850767f58f3200cce13..afcffe7f8fe9e11f84e4ab7e8f5a72f7bf583690 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -755,7 +755,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 	 * spurious. Bail out.
 	 */
 	if (dma_fence_is_signaled(job->done_fence))
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_RESET;
 
 	/*
 	 * Panfrost IRQ handler may take a long time to process an interrupt
@@ -770,7 +770,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 
 	if (dma_fence_is_signaled(job->done_fence)) {
 		dev_warn(pfdev->dev, "unexpectedly high interrupt latency\n");
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_RESET;
 	}
 
 	dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
@@ -786,7 +786,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 	atomic_set(&pfdev->reset.pending, 1);
 	panfrost_reset(pfdev, sched_job);
 
-	return DRM_GPU_SCHED_STAT_NOMINAL;
+	return DRM_GPU_SCHED_STAT_RESET;
 }
 
 static void panfrost_reset_work(struct work_struct *work)
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index ed3712f8d6a9136b99c49d687ab84918959edd95..4140f697ba5af5769492d3bbb378e18aec8ade98 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2259,7 +2259,7 @@ static enum drm_gpu_sched_stat
 panthor_vm_bind_timedout_job(struct drm_sched_job *sched_job)
 {
 	WARN(1, "VM_BIND ops are synchronous for now, there should be no timeout!");
-	return DRM_GPU_SCHED_STAT_NOMINAL;
+	return DRM_GPU_SCHED_STAT_RESET;
 }
 
 static const struct drm_sched_backend_ops panthor_vm_bind_ops = {
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a2248f692a030c1c84869b9a1948ad1cb0c0b490..8f17394cc82aad9eaf01e473cd9d3dea46fa3d61 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3241,7 +3241,7 @@ queue_timedout_job(struct drm_sched_job *sched_job)
 
 	queue_start(queue);
 
-	return DRM_GPU_SCHED_STAT_NOMINAL;
+	return DRM_GPU_SCHED_STAT_RESET;
 }
 
 static void queue_free_job(struct drm_sched_job *sched_job)
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index d94270cf8bf5c8d7b8ddb17db12118a4c55ca43c..4f2593f0c7d98a20a5d22f05e31c6929ec1cd8f9 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -527,7 +527,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 {
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_job *job;
-	enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
+	enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_RESET;
 
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index 0d1d57213e058b1c0db1fbf308723216ce80bef3..ad96e8db13c414cd773654397b34f83943c15d74 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -231,7 +231,7 @@ mock_sched_timedout_job(struct drm_sched_job *sched_job)
 	drm_sched_job_cleanup(sched_job);
 	/* Mock job itself is freed by the kunit framework. */
 
-	return DRM_GPU_SCHED_STAT_NOMINAL;
+	return DRM_GPU_SCHED_STAT_RESET;
 }
 
 static void mock_sched_free_job(struct drm_sched_job *sched_job)
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 35f131a46d0701cc8040d3b9654595a2bc260eab..e2b7f24d528e773968daea0f5b31c869584bb692 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -741,7 +741,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
 
 	mutex_unlock(&v3d->reset_lock);
 
-	return DRM_GPU_SCHED_STAT_NOMINAL;
+	return DRM_GPU_SCHED_STAT_RESET;
 }
 
 static void
@@ -773,7 +773,7 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
 		*timedout_ctra = ctra;
 
 		v3d_sched_skip_reset(sched_job);
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_RESET;
 	}
 
 	return v3d_gpu_reset_for_timeout(v3d, sched_job);
@@ -819,7 +819,7 @@ v3d_csd_job_timedout(struct drm_sched_job *sched_job)
 		job->timedout_batches = batches;
 
 		v3d_sched_skip_reset(sched_job);
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_RESET;
 	}
 
 	return v3d_gpu_reset_for_timeout(v3d, sched_job);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index df7a5a4eec74cc97c9934fb3ad383a2bae1d9a3d..ca2344b538c30b26542742ae9ea145836c940bbf 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1096,7 +1096,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		xe_sched_add_pending_job(sched, job);
 		xe_sched_submission_start(sched);
 
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_RESET;
 	}
 
 	/* Kill the run_job entry point */
@@ -1265,7 +1265,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	/* Start fence signaling */
 	xe_hw_fence_irq_start(q->fence_irq);
 
-	return DRM_GPU_SCHED_STAT_NOMINAL;
+	return DRM_GPU_SCHED_STAT_RESET;
 
 sched_enable:
 	enable_scheduling(q);
@@ -1278,7 +1278,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	xe_sched_add_pending_job(sched, job);
 	xe_sched_submission_start(sched);
 
-	return DRM_GPU_SCHED_STAT_NOMINAL;
+	return DRM_GPU_SCHED_STAT_RESET;
 }
 
 static void __guc_exec_queue_fini_async(struct work_struct *w)
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 190844370f48aee6ac9734ddfad65c8718f0a52a..ed300920996a8d830af5a4c011173ae4c25919dc 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -391,12 +391,12 @@ struct drm_sched_job {
  * enum drm_gpu_sched_stat - the scheduler's status
  *
  * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
- * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
+ * @DRM_GPU_SCHED_STAT_RESET: The GPU hung and successfully reset.
  * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
  */
 enum drm_gpu_sched_stat {
 	DRM_GPU_SCHED_STAT_NONE,
-	DRM_GPU_SCHED_STAT_NOMINAL,
+	DRM_GPU_SCHED_STAT_RESET,
 	DRM_GPU_SCHED_STAT_ENODEV,
 };
 

-- 
2.50.0

