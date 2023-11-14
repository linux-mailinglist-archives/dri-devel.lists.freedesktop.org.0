Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D27ED7EA77D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 01:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B214C10E3FB;
	Tue, 14 Nov 2023 00:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C3310E09A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 00:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699921655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bSnG95vKpcaichR5iM5qBDm3SC9J0YpXE2a4LUsZego=;
 b=DMF+8aDDAzyuIWi55tql+daVJ5mWlFTf0Eihm6kGBPwRXL1rAbhIaqimiSiXc9DdmxDRM3
 91CGt4YJZNsK2/381IXJki4DdPJMuLiFsdnJP9oz7xDHGjjkYZNdb2C1MeXyfcj73uvleM
 dgxa9Gje2DnJel2EK2Stq1EGHO+lvD0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-aDMQHMIDNY68R6mNCpruaA-1; Mon, 13 Nov 2023 19:27:33 -0500
X-MC-Unique: aDMQHMIDNY68R6mNCpruaA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9e6249e4fbbso234610166b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 16:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699921652; x=1700526452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bSnG95vKpcaichR5iM5qBDm3SC9J0YpXE2a4LUsZego=;
 b=Xa+6LmMRimbZx9rHA2BqqjBLZkJV2XdMfWZaQdaxBguUmyr8sL8pvGkDTdZXZoaLin
 bXKP55ZY75OhKICsQ3Pz2Mrl/hDGT++8cvPjk056M0ckCuHs19y8c3ODICSWZElCWBBj
 ftj8Cvx5Dcc+rz/A20iC1PW+qJ7ZcpjXXhSOhTSDuQ+7kCUbE3Cpz7kI8WlkFsGr2/Up
 wHej3SFqeWFLhibDhtHNvTpV9dwW0gvltPHHT/R9Efh0z8oX8TAkCno5TX+QR6dxMpAN
 pWRm/uCGkzEVO29a4TghPyj3WEVmm+9SqqP6txMp2wuwrJ2zsBPlBgKqUATGUtMjbBBl
 FTow==
X-Gm-Message-State: AOJu0Yw1buUk8+2yLYSTAefGbcsshY3PS07MTYOc7NTwhArMitv8PQtA
 oFykyOucfddbFza7Zsok+akdhrLKp4u+bKtGAsesuqAtu/sbDIysA2HyQFDFkqz/tiXNcPn4wOs
 ud5qSlIlDcBuKq+G+eSoSe3wsxE+K
X-Received: by 2002:a17:907:2d9e:b0:9e7:a94f:b005 with SMTP id
 gt30-20020a1709072d9e00b009e7a94fb005mr6718820ejc.66.1699921652479; 
 Mon, 13 Nov 2023 16:27:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElVVrhLjgqlWIZLiNZsxjDax8hxGA0xPh/z90JuYPxUa6SldwFtcGM550j0YBeppLak+aQQw==
X-Received: by 2002:a17:907:2d9e:b0:9e7:a94f:b005 with SMTP id
 gt30-20020a1709072d9e00b009e7a94fb005mr6718800ejc.66.1699921652015; 
 Mon, 13 Nov 2023 16:27:32 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a1709063b8700b009b9a1714524sm4836150ejf.12.2023.11.13.16.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 16:27:31 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH drm-misc-next 1/2] drm/nouveau: implement 1:1 scheduler -
 entity relationship
Date: Tue, 14 Nov 2023 01:27:24 +0100
Message-ID: <20231114002728.3491-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: dri-devel@lists.freedesktop.org, kherbst@redhat.com,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recent patches to the DRM scheduler [1][2] allow for a variable number
of run-queues and add support for (shared) workqueues rather than
dedicated kthreads per scheduler. This allows us to create a 1:1
relationship between a GPU scheduler and a scheduler entity, in order to
properly support firmware schedulers being able to handle an arbitrary
amount of dynamically allocated command ring buffers. This perfectly
matches Nouveau's needs, hence make use of it.

Topology wise we create one scheduler instance per client (handling
VM_BIND jobs) and one scheduler instance per channel (handling EXEC
jobs).

All channel scheduler instances share a workqueue, but every client
scheduler instance has a dedicated workqueue. The latter is required to
ensure that for VM_BIND job's free_job() work and run_job() work can
always run concurrently and hence, free_job() work can never stall
run_job() work. For EXEC jobs we don't have this requirement, since EXEC
job's free_job() does not require to take any locks which indirectly or
directly are held for allocations elsewhere.

[1] https://lore.kernel.org/all/8f53f7ef-7621-4f0b-bdef-d8d20bc497ff@redhat.com/T/
[2] https://lore.kernel.org/all/20231031032439.1558703-1-matthew.brost@intel.com/T/

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c |  18 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.h |   2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  31 ++--
 drivers/gpu/drm/nouveau/nouveau_drv.h   |   9 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c  |   7 +-
 drivers/gpu/drm/nouveau/nouveau_exec.h  |   2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c | 209 +++++++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_sched.h |  35 ++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  69 +++-----
 drivers/gpu/drm/nouveau/nouveau_uvmm.h  |   4 +-
 10 files changed, 188 insertions(+), 198 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 30afbec9e3b1..f8e59cfb1d34 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -126,21 +126,14 @@ nouveau_abi16_chan_fini(struct nouveau_abi16 *abi16,
 {
 	struct nouveau_abi16_ntfy *ntfy, *temp;
 
-	/* When a client exits without waiting for it's queued up jobs to
-	 * finish it might happen that we fault the channel. This is due to
-	 * drm_file_free() calling drm_gem_release() before the postclose()
-	 * callback. Hence, we can't tear down this scheduler entity before
-	 * uvmm mappings are unmapped. Currently, we can't detect this case.
-	 *
-	 * However, this should be rare and harmless, since the channel isn't
-	 * needed anymore.
-	 */
-	nouveau_sched_entity_fini(&chan->sched_entity);
+	/* Cancel all jobs from the entity's queue. */
+	drm_sched_entity_fini(&chan->sched.entity);
 
-	/* wait for all activity to stop before cleaning up */
 	if (chan->chan)
 		nouveau_channel_idle(chan->chan);
 
+	nouveau_sched_fini(&chan->sched);
+
 	/* cleanup notifier state */
 	list_for_each_entry_safe(ntfy, temp, &chan->notifiers, head) {
 		nouveau_abi16_ntfy_fini(chan, ntfy);
@@ -323,8 +316,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	if (ret)
 		goto done;
 
-	ret = nouveau_sched_entity_init(&chan->sched_entity, &drm->sched,
-					drm->sched_wq);
+	ret = nouveau_sched_init(&chan->sched, drm, drm->sched_wq);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index 9f538486c10e..1f5e243c0c75 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -26,7 +26,7 @@ struct nouveau_abi16_chan {
 	struct nouveau_bo *ntfy;
 	struct nouveau_vma *ntfy_vma;
 	struct nvkm_mm  heap;
-	struct nouveau_sched_entity sched_entity;
+	struct nouveau_sched sched;
 };
 
 struct nouveau_abi16 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index f603eaef1560..7e5f19153829 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -201,9 +201,9 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	WARN_ON(!list_empty(&cli->worker));
 
 	usif_client_fini(cli);
+	nouveau_sched_fini(&cli->sched);
 	if (uvmm)
 		nouveau_uvmm_fini(uvmm);
-	nouveau_sched_entity_fini(&cli->sched_entity);
 	nouveau_vmm_fini(&cli->svm);
 	nouveau_vmm_fini(&cli->vmm);
 	nvif_mmu_dtor(&cli->mmu);
@@ -310,8 +310,17 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 
 	cli->mem = &mems[ret];
 
-	ret = nouveau_sched_entity_init(&cli->sched_entity, &drm->sched,
-					drm->sched_wq);
+	/* Don't pass in the (shared) sched_wq in order to let
+	 * nouveau_sched_init() create a dedicated one for VM_BIND jobs.
+	 *
+	 * This is required to ensure that for VM_BIND jobs free_job() work and
+	 * run_job() work can always run concurrently and hence, free_job() work
+	 * can never stall run_job() work. For EXEC jobs we don't have this
+	 * requirement, since EXEC job's free_job() does not require to take any
+	 * locks which indirectly or directly are held for allocations
+	 * elsewhere.
+	 */
+	ret = nouveau_sched_init(&cli->sched, drm, NULL);
 	if (ret)
 		goto done;
 
@@ -582,13 +591,16 @@ nouveau_drm_device_init(struct drm_device *dev)
 	nvif_parent_ctor(&nouveau_parent, &drm->parent);
 	drm->master.base.object.parent = &drm->parent;
 
-	ret = nouveau_sched_init(drm);
-	if (ret)
+	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
+					WQ_MAX_ACTIVE);
+	if (!drm->sched_wq) {
+		ret = -ENOMEM;
 		goto fail_alloc;
+	}
 
 	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
 	if (ret)
-		goto fail_sched;
+		goto fail_wq;
 
 	ret = nouveau_cli_init(drm, "DRM", &drm->client);
 	if (ret)
@@ -658,8 +670,8 @@ nouveau_drm_device_init(struct drm_device *dev)
 	nouveau_cli_fini(&drm->client);
 fail_master:
 	nouveau_cli_fini(&drm->master);
-fail_sched:
-	nouveau_sched_fini(drm);
+fail_wq:
+	destroy_workqueue(drm->sched_wq);
 fail_alloc:
 	nvif_parent_dtor(&drm->parent);
 	kfree(drm);
@@ -711,10 +723,9 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	}
 	mutex_unlock(&drm->clients_lock);
 
-	nouveau_sched_fini(drm);
-
 	nouveau_cli_fini(&drm->client);
 	nouveau_cli_fini(&drm->master);
+	destroy_workqueue(drm->sched_wq);
 	nvif_parent_dtor(&drm->parent);
 	mutex_destroy(&drm->clients_lock);
 	kfree(drm);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index e514110bf391..49e983373c92 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -98,7 +98,7 @@ struct nouveau_cli {
 		bool disabled;
 	} uvmm;
 
-	struct nouveau_sched_entity sched_entity;
+	struct nouveau_sched sched;
 
 	const struct nvif_mclass *mem;
 
@@ -258,6 +258,9 @@ struct nouveau_drm {
 		u64 context_base;
 	} *runl;
 
+	/* Workqueue used for channel schedulers. */
+	struct workqueue_struct *sched_wq;
+
 	/* context for accelerated drm-internal operations */
 	struct nouveau_channel *cechan;
 	struct nouveau_channel *channel;
@@ -298,10 +301,6 @@ struct nouveau_drm {
 		struct mutex lock;
 		bool component_registered;
 	} audio;
-
-	struct drm_gpu_scheduler sched;
-	struct workqueue_struct *sched_wq;
-
 };
 
 static inline struct nouveau_drm *
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index bf6c12f4342a..388831c53551 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -192,6 +192,7 @@ nouveau_exec_job_free(struct nouveau_job *job)
 {
 	struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
 
+	nouveau_job_done(job);
 	nouveau_job_free(job);
 
 	kfree(exec_job->fence);
@@ -211,8 +212,6 @@ nouveau_exec_job_timeout(struct nouveau_job *job)
 	NV_PRINTK(warn, job->cli, "job timeout, channel %d killed!\n",
 		  chan->chid);
 
-	nouveau_sched_entity_fini(job->entity);
-
 	return DRM_GPU_SCHED_STAT_ENODEV;
 }
 
@@ -261,7 +260,7 @@ nouveau_exec_job_init(struct nouveau_exec_job **pjob,
 
 	job->chan = __args->chan;
 
-	args.sched_entity = __args->sched_entity;
+	args.sched = __args->sched;
 	args.file_priv = __args->file_priv;
 
 	args.in_sync.count = __args->in_sync.count;
@@ -414,7 +413,7 @@ nouveau_exec_ioctl_exec(struct drm_device *dev,
 	if (ret)
 		goto out;
 
-	args.sched_entity = &chan16->sched_entity;
+	args.sched = &chan16->sched;
 	args.file_priv = file_priv;
 	args.chan = chan;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.h b/drivers/gpu/drm/nouveau/nouveau_exec.h
index 778cacd90f65..9139bc6f33d4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.h
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.h
@@ -10,7 +10,7 @@
 
 struct nouveau_exec_job_args {
 	struct drm_file *file_priv;
-	struct nouveau_sched_entity *sched_entity;
+	struct nouveau_sched *sched;
 
 	struct drm_exec exec;
 	struct nouveau_channel *chan;
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 1b2cc3f2e1c7..faabd662b165 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -12,30 +12,29 @@
 #include "nouveau_abi16.h"
 #include "nouveau_sched.h"
 
-/* FIXME
- *
- * We want to make sure that jobs currently executing can't be deferred by
- * other jobs competing for the hardware. Otherwise we might end up with job
- * timeouts just because of too many clients submitting too many jobs. We don't
- * want jobs to time out because of system load, but because of the job being
- * too bulky.
- *
- * For now allow for up to 16 concurrent jobs in flight until we know how many
- * rings the hardware can process in parallel.
- */
-#define NOUVEAU_SCHED_HW_SUBMISSIONS		16
+#define NOUVEAU_SCHED_HW_SUBMISSIONS		1
 #define NOUVEAU_SCHED_JOB_TIMEOUT_MS		10000
 
+/* Starts at 0, since the DRM scheduler interprets those parameters as (initial)
+ * index to the run-queue array.
+ */
+enum nouveau_sched_priority {
+	NOUVEAU_SCHED_PRIORITY_SINGLE = DRM_SCHED_PRIORITY_MIN,
+	NOUVEAU_SCHED_PRIORITY_COUNT,
+};
+
 int
 nouveau_job_init(struct nouveau_job *job,
 		 struct nouveau_job_args *args)
 {
-	struct nouveau_sched_entity *entity = args->sched_entity;
+	struct nouveau_sched *sched = args->sched;
 	int ret;
 
+	INIT_LIST_HEAD(&job->entry);
+
 	job->file_priv = args->file_priv;
 	job->cli = nouveau_cli(args->file_priv);
-	job->entity = entity;
+	job->sched = sched;
 
 	job->sync = args->sync;
 	job->resv_usage = args->resv_usage;
@@ -89,7 +88,7 @@ nouveau_job_init(struct nouveau_job *job,
 
 	}
 
-	ret = drm_sched_job_init(&job->base, &entity->base, 1, NULL);
+	ret = drm_sched_job_init(&job->base, &sched->entity, 1, NULL);
 	if (ret)
 		goto err_free_chains;
 
@@ -108,6 +107,27 @@ nouveau_job_init(struct nouveau_job *job,
 return ret;
 }
 
+void
+nouveau_job_fini(struct nouveau_job *job)
+{
+	dma_fence_put(job->done_fence);
+	drm_sched_job_cleanup(&job->base);
+
+	job->ops->free(job);
+}
+
+void
+nouveau_job_done(struct nouveau_job *job)
+{
+	struct nouveau_sched *sched = job->sched;
+
+	spin_lock(&sched->job.list.lock);
+	list_del(&job->entry);
+	spin_unlock(&sched->job.list.lock);
+
+	wake_up(&sched->job.wq);
+}
+
 void
 nouveau_job_free(struct nouveau_job *job)
 {
@@ -117,13 +137,6 @@ nouveau_job_free(struct nouveau_job *job)
 	kfree(job->out_sync.chains);
 }
 
-void nouveau_job_fini(struct nouveau_job *job)
-{
-	dma_fence_put(job->done_fence);
-	drm_sched_job_cleanup(&job->base);
-	job->ops->free(job);
-}
-
 static int
 sync_find_fence(struct nouveau_job *job,
 		struct drm_nouveau_sync *sync,
@@ -261,7 +274,7 @@ nouveau_job_fence_attach(struct nouveau_job *job)
 int
 nouveau_job_submit(struct nouveau_job *job)
 {
-	struct nouveau_sched_entity *entity = to_nouveau_sched_entity(job->base.entity);
+	struct nouveau_sched *sched = job->sched;
 	struct dma_fence *done_fence = NULL;
 	int ret;
 
@@ -276,7 +289,7 @@ nouveau_job_submit(struct nouveau_job *job)
 	/* Make sure the job appears on the sched_entity's queue in the same
 	 * order as it was submitted.
 	 */
-	mutex_lock(&entity->mutex);
+	mutex_lock(&sched->mutex);
 
 	/* Guarantee we won't fail after the submit() callback returned
 	 * successfully.
@@ -287,33 +300,16 @@ nouveau_job_submit(struct nouveau_job *job)
 			goto err_cleanup;
 	}
 
+	/* Submit was successful; add the job to the schedulers job list. */
+	spin_lock(&sched->job.list.lock);
+	list_add(&job->entry, &sched->job.list.head);
+	spin_unlock(&sched->job.list.lock);
+
 	drm_sched_job_arm(&job->base);
 	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
 	if (job->sync)
 		done_fence = dma_fence_get(job->done_fence);
 
-	/* If a sched job depends on a dma-fence from a job from the same GPU
-	 * scheduler instance, but a different scheduler entity, the GPU
-	 * scheduler does only wait for the particular job to be scheduled,
-	 * rather than for the job to fully complete. This is due to the GPU
-	 * scheduler assuming that there is a scheduler instance per ring.
-	 * However, the current implementation, in order to avoid arbitrary
-	 * amounts of kthreads, has a single scheduler instance while scheduler
-	 * entities represent rings.
-	 *
-	 * As a workaround, set the DRM_SCHED_FENCE_DONT_PIPELINE for all
-	 * out-fences in order to force the scheduler to wait for full job
-	 * completion for dependent jobs from different entities and same
-	 * scheduler instance.
-	 *
-	 * There is some work in progress [1] to address the issues of firmware
-	 * schedulers; once it is in-tree the scheduler topology in Nouveau
-	 * should be re-worked accordingly.
-	 *
-	 * [1] https://lore.kernel.org/dri-devel/20230801205103.627779-1-matthew.brost@intel.com/
-	 */
-	set_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &job->done_fence->flags);
-
 	if (job->ops->armed_submit)
 		job->ops->armed_submit(job);
 
@@ -326,7 +322,7 @@ nouveau_job_submit(struct nouveau_job *job)
 
 	drm_sched_entity_push_job(&job->base);
 
-	mutex_unlock(&entity->mutex);
+	mutex_unlock(&sched->mutex);
 
 	if (done_fence) {
 		dma_fence_wait(done_fence, true);
@@ -336,20 +332,13 @@ nouveau_job_submit(struct nouveau_job *job)
 	return 0;
 
 err_cleanup:
-	mutex_unlock(&entity->mutex);
+	mutex_unlock(&sched->mutex);
 	nouveau_job_fence_attach_cleanup(job);
 err:
 	job->state = NOUVEAU_JOB_SUBMIT_FAILED;
 	return ret;
 }
 
-bool
-nouveau_sched_entity_qwork(struct nouveau_sched_entity *entity,
-			   struct work_struct *work)
-{
-	return queue_work(entity->sched_wq, work);
-}
-
 static struct dma_fence *
 nouveau_job_run(struct nouveau_job *job)
 {
@@ -375,14 +364,20 @@ nouveau_sched_run_job(struct drm_sched_job *sched_job)
 static enum drm_gpu_sched_stat
 nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
 {
+	struct drm_gpu_scheduler *sched = sched_job->sched;
 	struct nouveau_job *job = to_nouveau_job(sched_job);
+	enum drm_gpu_sched_stat stat = DRM_GPU_SCHED_STAT_NOMINAL;
 
-	NV_PRINTK(warn, job->cli, "Job timed out.\n");
+	drm_sched_stop(sched, sched_job);
 
 	if (job->ops->timeout)
-		return job->ops->timeout(job);
+		stat = job->ops->timeout(job);
+	else
+		NV_PRINTK(warn, job->cli, "Generic job timeout.\n");
+
+	drm_sched_start(sched, true);
 
-	return DRM_GPU_SCHED_STAT_ENODEV;
+	return stat;
 }
 
 static void
@@ -393,50 +388,82 @@ nouveau_sched_free_job(struct drm_sched_job *sched_job)
 	nouveau_job_fini(job);
 }
 
-int nouveau_sched_entity_init(struct nouveau_sched_entity *entity,
-			      struct drm_gpu_scheduler *sched,
-			      struct workqueue_struct *sched_wq)
-{
-	mutex_init(&entity->mutex);
-	spin_lock_init(&entity->job.list.lock);
-	INIT_LIST_HEAD(&entity->job.list.head);
-	init_waitqueue_head(&entity->job.wq);
-
-	entity->sched_wq = sched_wq;
-	return drm_sched_entity_init(&entity->base,
-				     DRM_SCHED_PRIORITY_NORMAL,
-				     &sched, 1, NULL);
-}
-
-void
-nouveau_sched_entity_fini(struct nouveau_sched_entity *entity)
-{
-	drm_sched_entity_destroy(&entity->base);
-}
-
 static const struct drm_sched_backend_ops nouveau_sched_ops = {
 	.run_job = nouveau_sched_run_job,
 	.timedout_job = nouveau_sched_timedout_job,
 	.free_job = nouveau_sched_free_job,
 };
 
-int nouveau_sched_init(struct nouveau_drm *drm)
+int
+nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
+		   struct workqueue_struct *wq)
 {
-	struct drm_gpu_scheduler *sched = &drm->sched;
+	struct drm_gpu_scheduler *drm_sched = &sched->base;
+	struct drm_sched_entity *entity = &sched->entity;
 	long job_hang_limit = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
+	int ret;
+
+	if (!wq) {
+		wq = alloc_workqueue("nouveau_sched_wq_%d", 0, WQ_MAX_ACTIVE,
+				     current->pid);
+		if (!wq)
+			return -ENOMEM;
+
+		sched->wq = wq;
+	}
+
+	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
+			     NOUVEAU_SCHED_PRIORITY_COUNT,
+			     NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
+			     NULL, NULL, "nouveau_sched", drm->dev->dev);
+	if (ret)
+		goto fail_wq;
+
+	/* Using DRM_SCHED_PRIORITY_MIN, since that's what we're required to use
+	 * when we want to have a single run-queue only.
+	 *
+	 * It's not documented, but one will find out when trying to use any
+	 * other priority running into faults, because the scheduler uses the
+	 * priority as array index.
+	 *
+	 * Can't use NOUVEAU_SCHED_PRIORITY_SINGLE either, because it's not
+	 * matching the enum type used in drm_sched_entity_init().
+	 */
+	ret = drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_MIN,
+				    &drm_sched, 1, NULL);
+	if (ret)
+		goto fail_sched;
 
-	drm->sched_wq = create_singlethread_workqueue("nouveau_sched_wq");
-	if (!drm->sched_wq)
-		return -ENOMEM;
+	mutex_init(&sched->mutex);
+	spin_lock_init(&sched->job.list.lock);
+	INIT_LIST_HEAD(&sched->job.list.head);
+	init_waitqueue_head(&sched->job.wq);
 
-	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
-			      DRM_SCHED_PRIORITY_COUNT,
-			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
-			      NULL, NULL, "nouveau_sched", drm->dev->dev);
+	return 0;
+
+fail_sched:
+	drm_sched_fini(drm_sched);
+fail_wq:
+	if (sched->wq)
+		destroy_workqueue(sched->wq);
+	return ret;
 }
 
-void nouveau_sched_fini(struct nouveau_drm *drm)
+void
+nouveau_sched_fini(struct nouveau_sched *sched)
 {
-	destroy_workqueue(drm->sched_wq);
-	drm_sched_fini(&drm->sched);
+	struct drm_gpu_scheduler *drm_sched = &sched->base;
+	struct drm_sched_entity *entity = &sched->entity;
+
+	rmb(); /* for list_empty to work without lock */
+	wait_event(sched->job.wq, list_empty(&sched->job.list.head));
+
+	drm_sched_entity_fini(entity);
+	drm_sched_fini(drm_sched);
+
+	/* Destroy workqueue after scheduler tear down, otherwise it might still
+	 * be in use.
+	 */
+	if (sched->wq)
+		destroy_workqueue(sched->wq);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
index 27ac19792597..026f33d9b70c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.h
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -26,7 +26,7 @@ enum nouveau_job_state {
 
 struct nouveau_job_args {
 	struct drm_file *file_priv;
-	struct nouveau_sched_entity *sched_entity;
+	struct nouveau_sched *sched;
 
 	enum dma_resv_usage resv_usage;
 	bool sync;
@@ -49,7 +49,8 @@ struct nouveau_job {
 
 	enum nouveau_job_state state;
 
-	struct nouveau_sched_entity *entity;
+	struct nouveau_sched *sched;
+	struct list_head entry;
 
 	struct drm_file *file_priv;
 	struct nouveau_cli *cli;
@@ -90,20 +91,17 @@ int nouveau_job_ucopy_syncs(struct nouveau_job_args *args,
 
 int nouveau_job_init(struct nouveau_job *job,
 		     struct nouveau_job_args *args);
-void nouveau_job_free(struct nouveau_job *job);
-
-int nouveau_job_submit(struct nouveau_job *job);
 void nouveau_job_fini(struct nouveau_job *job);
+int nouveau_job_submit(struct nouveau_job *job);
+void nouveau_job_done(struct nouveau_job *job);
+void nouveau_job_free(struct nouveau_job *job);
 
-#define to_nouveau_sched_entity(entity)		\
-		container_of((entity), struct nouveau_sched_entity, base)
-
-struct nouveau_sched_entity {
-	struct drm_sched_entity base;
+struct nouveau_sched {
+	struct drm_gpu_scheduler base;
+	struct drm_sched_entity entity;
+	struct workqueue_struct *wq;
 	struct mutex mutex;
 
-	struct workqueue_struct *sched_wq;
-
 	struct {
 		struct {
 			struct list_head head;
@@ -113,15 +111,8 @@ struct nouveau_sched_entity {
 	} job;
 };
 
-int nouveau_sched_entity_init(struct nouveau_sched_entity *entity,
-			      struct drm_gpu_scheduler *sched,
-			      struct workqueue_struct *sched_wq);
-void nouveau_sched_entity_fini(struct nouveau_sched_entity *entity);
-
-bool nouveau_sched_entity_qwork(struct nouveau_sched_entity *entity,
-				struct work_struct *work);
-
-int nouveau_sched_init(struct nouveau_drm *drm);
-void nouveau_sched_fini(struct nouveau_drm *drm);
+int nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
+		       struct workqueue_struct *wq);
+void nouveau_sched_fini(struct nouveau_sched *sched);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index eda7bb8624f1..c95186b34ea0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -960,6 +960,12 @@ nouveau_uvmm_bind_job_free(struct kref *kref)
 {
 	struct nouveau_uvmm_bind_job *job =
 		container_of(kref, struct nouveau_uvmm_bind_job, kref);
+	struct bind_job_op *op, *next;
+
+	list_for_each_op_safe(op, next, &job->ops) {
+		list_del(&op->entry);
+		kfree(op);
+	}
 
 	nouveau_job_free(&job->base);
 	kfree(job);
@@ -1001,14 +1007,16 @@ bind_validate_op(struct nouveau_job *job,
 static void
 bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 {
-	struct nouveau_uvmm_bind_job *bind_job;
-	struct nouveau_sched_entity *entity = job->entity;
+	struct nouveau_sched *sched = job->sched;
+	struct nouveau_job *__job;
 	struct bind_job_op *op;
 	u64 end = addr + range;
 
 again:
-	spin_lock(&entity->job.list.lock);
-	list_for_each_entry(bind_job, &entity->job.list.head, entry) {
+	spin_lock(&sched->job.list.lock);
+	list_for_each_entry(__job, &sched->job.list.head, entry) {
+		struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(__job);
+
 		list_for_each_op(op, &bind_job->ops) {
 			if (op->op == OP_UNMAP) {
 				u64 op_addr = op->va.addr;
@@ -1016,7 +1024,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 
 				if (!(end <= op_addr || addr >= op_end)) {
 					nouveau_uvmm_bind_job_get(bind_job);
-					spin_unlock(&entity->job.list.lock);
+					spin_unlock(&sched->job.list.lock);
 					wait_for_completion(&bind_job->complete);
 					nouveau_uvmm_bind_job_put(bind_job);
 					goto again;
@@ -1024,7 +1032,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 			}
 		}
 	}
-	spin_unlock(&entity->job.list.lock);
+	spin_unlock(&sched->job.list.lock);
 }
 
 static int
@@ -1139,7 +1147,6 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 {
 	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
 	struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(job);
-	struct nouveau_sched_entity *entity = job->entity;
 	struct drm_exec *exec = &job->exec;
 	struct bind_job_op *op;
 	int ret;
@@ -1375,10 +1382,6 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 	}
 	nouveau_uvmm_unlock(uvmm);
 
-	spin_lock(&entity->job.list.lock);
-	list_add(&bind_job->entry, &entity->job.list.head);
-	spin_unlock(&entity->job.list.lock);
-
 	return 0;
 
 unwind_continue:
@@ -1465,14 +1468,11 @@ nouveau_uvmm_bind_job_run(struct nouveau_job *job)
 }
 
 static void
-nouveau_uvmm_bind_job_free_work_fn(struct work_struct *work)
+nouveau_uvmm_bind_job_cleanup(struct nouveau_job *job)
 {
-	struct nouveau_uvmm_bind_job *bind_job =
-		container_of(work, struct nouveau_uvmm_bind_job, work);
-	struct nouveau_job *job = &bind_job->base;
+	struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(job);
 	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
-	struct nouveau_sched_entity *entity = job->entity;
-	struct bind_job_op *op, *next;
+	struct bind_job_op *op;
 
 	list_for_each_op(op, &bind_job->ops) {
 		struct drm_gem_object *obj = op->gem.obj;
@@ -1524,38 +1524,17 @@ nouveau_uvmm_bind_job_free_work_fn(struct work_struct *work)
 			drm_gem_object_put(obj);
 	}
 
-	spin_lock(&entity->job.list.lock);
-	list_del(&bind_job->entry);
-	spin_unlock(&entity->job.list.lock);
-
+	nouveau_job_done(job);
 	complete_all(&bind_job->complete);
-	wake_up(&entity->job.wq);
-
-	/* Remove and free ops after removing the bind job from the job list to
-	 * avoid races against bind_validate_map_sparse().
-	 */
-	list_for_each_op_safe(op, next, &bind_job->ops) {
-		list_del(&op->entry);
-		kfree(op);
-	}
 
 	nouveau_uvmm_bind_job_put(bind_job);
 }
 
-static void
-nouveau_uvmm_bind_job_free_qwork(struct nouveau_job *job)
-{
-	struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(job);
-	struct nouveau_sched_entity *entity = job->entity;
-
-	nouveau_sched_entity_qwork(entity, &bind_job->work);
-}
-
 static struct nouveau_job_ops nouveau_bind_job_ops = {
 	.submit = nouveau_uvmm_bind_job_submit,
 	.armed_submit = nouveau_uvmm_bind_job_armed_submit,
 	.run = nouveau_uvmm_bind_job_run,
-	.free = nouveau_uvmm_bind_job_free_qwork,
+	.free = nouveau_uvmm_bind_job_cleanup,
 };
 
 static int
@@ -1616,7 +1595,6 @@ nouveau_uvmm_bind_job_init(struct nouveau_uvmm_bind_job **pjob,
 		return ret;
 
 	INIT_LIST_HEAD(&job->ops);
-	INIT_LIST_HEAD(&job->entry);
 
 	for (i = 0; i < __args->op.count; i++) {
 		ret = bind_job_op_from_uop(&op, &__args->op.s[i]);
@@ -1627,9 +1605,8 @@ nouveau_uvmm_bind_job_init(struct nouveau_uvmm_bind_job **pjob,
 	}
 
 	init_completion(&job->complete);
-	INIT_WORK(&job->work, nouveau_uvmm_bind_job_free_work_fn);
 
-	args.sched_entity = __args->sched_entity;
+	args.sched = __args->sched;
 	args.file_priv = __args->file_priv;
 
 	args.in_sync.count = __args->in_sync.count;
@@ -1757,7 +1734,7 @@ nouveau_uvmm_ioctl_vm_bind(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	args.sched_entity = &cli->sched_entity;
+	args.sched = &cli->sched;
 	args.file_priv = file_priv;
 
 	ret = nouveau_uvmm_vm_bind(&args);
@@ -1900,12 +1877,8 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 	MA_STATE(mas, &uvmm->region_mt, 0, 0);
 	struct nouveau_uvma_region *reg;
 	struct nouveau_cli *cli = uvmm->vmm.cli;
-	struct nouveau_sched_entity *entity = &cli->sched_entity;
 	struct drm_gpuva *va, *next;
 
-	rmb(); /* for list_empty to work without lock */
-	wait_event(entity->job.wq, list_empty(&entity->job.list.head));
-
 	nouveau_uvmm_lock(uvmm);
 	drm_gpuvm_for_each_va_safe(va, next, &uvmm->base) {
 		struct nouveau_uvma *uvma = uvma_from_va(va);
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index f0a6d98ace4f..9d3c348581eb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -44,8 +44,6 @@ struct nouveau_uvmm_bind_job {
 	struct nouveau_job base;
 
 	struct kref kref;
-	struct list_head entry;
-	struct work_struct work;
 	struct completion complete;
 
 	/* struct bind_job_op */
@@ -54,7 +52,7 @@ struct nouveau_uvmm_bind_job {
 
 struct nouveau_uvmm_bind_job_args {
 	struct drm_file *file_priv;
-	struct nouveau_sched_entity *sched_entity;
+	struct nouveau_sched *sched;
 
 	unsigned int flags;
 

base-commit: 50c1a36f594bb3dd33f3f9386c5d960cd12327d8
-- 
2.41.0

