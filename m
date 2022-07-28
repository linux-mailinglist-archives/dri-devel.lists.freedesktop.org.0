Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C7A583FD2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 15:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DAC11206E;
	Thu, 28 Jul 2022 13:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666F08B6F4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 13:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659014260; x=1690550260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jCUmj6Wkx1pTnQ7uOveWLkZJR9m3O7c/cS1zjOrQPq8=;
 b=Nuy2JUaxFyjld/IYyCh6/4eZvca5oL4L2dFYKKJGjdZnQKEqdNleT4Y/
 Fuw3QDs0Y/6LT2pxE0vUxQ4QDLDAIH9z4ZZj3lwiu96IIo58gjScEExeM
 0EIaMPp6LksNYZOMf/ZN2UJMdWc94Fpt5Tg9+GQ/g27RSSgB/B/KAYNHC
 8JvzyqFsvJuMJSG2QGZJpFNkf7bAkun5Wq+OrCs2aPsNKrdqUqLMYo7BG
 b4JOaqmONm2puefaKUhh8PNHLm6djnzZbRYRUjmU+XIOPMMfMM1578tVk
 8Dw15eBZWLsne4etq7TaoS4ObYq0eysT6qspR56uKyYedrmGJq06lYIjc w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="288520403"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="288520403"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 06:17:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="659722680"
Received: from jlawryno-desktop.igk.intel.com ([172.22.229.64])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 06:17:38 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v1 6/7] drm/vpu: Add command buffer submission logic
Date: Thu, 28 Jul 2022 15:17:08 +0200
Message-Id: <20220728131709.1087188-7-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com>
References: <20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: andrzej.kacprowski@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Each of the user contexts has two command queues, one for compute engine
and one for the copy engine. Command queues are allocated and registered
in the device when the first job (command buffer) is submitted from
the user space to the VPU device. The userspace provides a list of
GEM buffer object handles to submit to the VPU, the driver resolves
buffer handles, pins physical memory if needed, increments ref count
for each buffer and stores pointers to buffer objects in
the vpu_job objects that track jobs submitted to the device.
The VPU signals job completion with an asynchronous message that
contains the job id passed to firmware when the job was submitted.

Currently, the driver supports simple scheduling logic
where jobs submitted from user space are immediately pushed
to the VPU device command queues. In the future, it will be
extended to use hardware base scheduling and/or drm_sched.

Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/gpu/drm/vpu/Makefile  |   1 +
 drivers/gpu/drm/vpu/vpu_drv.c |  26 +-
 drivers/gpu/drm/vpu/vpu_drv.h |   6 +-
 drivers/gpu/drm/vpu/vpu_gem.c |  13 +
 drivers/gpu/drm/vpu/vpu_job.c | 611 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vpu/vpu_job.h |  73 ++++
 include/uapi/drm/vpu_drm.h    |  96 ++++++
 7 files changed, 822 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/vpu/vpu_job.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_job.h

diff --git a/drivers/gpu/drm/vpu/Makefile b/drivers/gpu/drm/vpu/Makefile
index 995a3a9c6777..70493dacecda 100644
--- a/drivers/gpu/drm/vpu/Makefile
+++ b/drivers/gpu/drm/vpu/Makefile
@@ -7,6 +7,7 @@ intel_vpu-y := \
 	vpu_gem.o \
 	vpu_hw_mtl.o \
 	vpu_ipc.o \
+	vpu_job.o \
 	vpu_jsm_msg.o \
 	vpu_mmu.o \
 	vpu_mmu_context.o
diff --git a/drivers/gpu/drm/vpu/vpu_drv.c b/drivers/gpu/drm/vpu/vpu_drv.c
index d0cdbb791e1f..74db0cb18491 100644
--- a/drivers/gpu/drm/vpu/vpu_drv.c
+++ b/drivers/gpu/drm/vpu/vpu_drv.c
@@ -19,6 +19,7 @@
 #include "vpu_gem.h"
 #include "vpu_hw.h"
 #include "vpu_ipc.h"
+#include "vpu_job.h"
 #include "vpu_jsm_msg.h"
 #include "vpu_mmu.h"
 #include "vpu_mmu_context.h"
@@ -78,8 +79,11 @@ static void file_priv_release(struct kref *ref)
 
 	vpu_dbg(FILE, "file_priv release: ctx %u\n", file_priv->ctx.id);
 
-	if (file_priv->ctx.id)
+	if (file_priv->ctx.id) {
+		vpu_cmdq_release_all(file_priv);
+		vpu_bo_remove_all_bos_from_context(&file_priv->ctx);
 		vpu_mmu_user_context_fini(file_priv);
+	}
 
 	kfree(file_priv);
 }
@@ -222,6 +226,8 @@ static const struct drm_ioctl_desc vpu_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(VPU_BO_CREATE, vpu_bo_create_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(VPU_BO_INFO, vpu_bo_info_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(VPU_BO_USERPTR, vpu_bo_userptr_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VPU_SUBMIT, vpu_submit_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VPU_BO_WAIT, vpu_bo_wait_ioctl, DRM_RENDER_ALLOW),
 };
 
 DEFINE_DRM_GEM_FOPS(vpu_fops);
@@ -429,6 +435,7 @@ static int vpu_dev_init(struct vpu_device *vdev)
 	vdev->context_xa_limit.min = VPU_GLOBAL_CONTEXT_MMU_SSID + 1;
 	vdev->context_xa_limit.max = VPU_CONTEXT_LIMIT;
 
+	xa_init_flags(&vdev->submitted_jobs_xa, XA_FLAGS_ALLOC1);
 	atomic64_set(&vdev->unique_id_counter, 0);
 
 	ret = vpu_pci_init(vdev);
@@ -479,20 +486,30 @@ static int vpu_dev_init(struct vpu_device *vdev)
 		goto err_fw_fini;
 	}
 
+	ret = vpu_job_done_thread_init(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to initialize job done thread: %d\n", ret);
+		goto err_ipc_fini;
+	}
+
 	ret = vpu_fw_load(vdev);
 	if (ret) {
 		vpu_err(vdev, "Failed to load firmware: %d\n", ret);
-		goto err_fw_fini;
+		goto err_job_done_thread_fini;
 	}
 
 	ret = vpu_boot(vdev);
 	if (ret) {
 		vpu_err(vdev, "Failed to boot: %d\n", ret);
-		goto err_fw_fini;
+		goto err_job_done_thread_fini;
 	}
 
 	return 0;
 
+err_job_done_thread_fini:
+	vpu_job_done_thread_fini(vdev);
+err_ipc_fini:
+	vpu_ipc_fini(vdev);
 err_fw_fini:
 	vpu_fw_fini(vdev);
 err_mmu_fini:
@@ -512,6 +529,7 @@ static void vpu_dev_fini(struct vpu_device *vdev)
 {
 	vpu_shutdown(vdev);
 
+	vpu_job_done_thread_fini(vdev);
 	vpu_ipc_fini(vdev);
 	vpu_fw_fini(vdev);
 	vpu_mmu_fini(vdev);
@@ -521,6 +539,8 @@ static void vpu_dev_fini(struct vpu_device *vdev)
 
 	WARN_ON(!xa_empty(&vdev->context_xa));
 	xa_destroy(&vdev->context_xa);
+	WARN_ON(!xa_empty(&vdev->submitted_jobs_xa));
+	xa_destroy(&vdev->submitted_jobs_xa);
 }
 
 static struct pci_device_id vpu_pci_ids[] = {
diff --git a/drivers/gpu/drm/vpu/vpu_drv.h b/drivers/gpu/drm/vpu/vpu_drv.h
index 94c8712396a6..f4898399e64b 100644
--- a/drivers/gpu/drm/vpu/vpu_drv.h
+++ b/drivers/gpu/drm/vpu/vpu_drv.h
@@ -94,6 +94,9 @@ struct vpu_device {
 	struct xarray context_xa;
 	struct xa_limit context_xa_limit;
 
+	struct xarray submitted_jobs_xa;
+	struct task_struct *job_done_thread;
+
 	atomic64_t unique_id_counter;
 
 	struct {
@@ -107,7 +110,8 @@ struct vpu_device {
 struct vpu_file_priv {
 	struct kref ref;
 	struct vpu_device *vdev;
-	struct mutex lock;
+	struct mutex lock; /* Protects cmdq and context init */
+	struct vpu_cmdq *cmdq[VPU_NUM_ENGINES];
 	struct vpu_mmu_context ctx;
 	u32 priority;
 };
diff --git a/drivers/gpu/drm/vpu/vpu_gem.c b/drivers/gpu/drm/vpu/vpu_gem.c
index 12f82ab941bd..ca1760fd897b 100644
--- a/drivers/gpu/drm/vpu/vpu_gem.c
+++ b/drivers/gpu/drm/vpu/vpu_gem.c
@@ -786,6 +786,19 @@ int vpu_bo_info_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	return ret;
 }
 
+int vpu_bo_wait_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_vpu_bo_wait *args = data;
+	unsigned long timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
+	long ret;
+
+	ret = drm_gem_dma_resv_wait(file, args->handle, true, timeout);
+	if (ret == -ETIME)
+		ret = -ETIMEDOUT;
+
+	return ret;
+}
+
 static void vpu_bo_print_info(struct vpu_bo *bo, struct drm_printer *p)
 {
 	unsigned long dma_refcount = 0;
diff --git a/drivers/gpu/drm/vpu/vpu_job.c b/drivers/gpu/drm/vpu/vpu_job.c
new file mode 100644
index 000000000000..16ca280d12b2
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_job.c
@@ -0,0 +1,611 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#include <drm/drm_file.h>
+
+#include <linux/bitfield.h>
+#include <linux/highmem.h>
+#include <linux/kthread.h>
+#include <linux/pci.h>
+#include <linux/module.h>
+#include <uapi/drm/vpu_drm.h>
+
+#include "vpu_drv.h"
+#include "vpu_hw.h"
+#include "vpu_ipc.h"
+#include "vpu_job.h"
+#include "vpu_jsm_msg.h"
+
+#define CMD_BUF_IDX	    0
+#define JOB_ID_JOB_MASK	    GENMASK(7, 0)
+#define JOB_ID_CONTEXT_MASK GENMASK(31, 8)
+
+static unsigned int vpu_tdr_timeout_ms;
+module_param_named(tdr_timeout_ms, vpu_tdr_timeout_ms, uint, 0644);
+MODULE_PARM_DESC(tdr_timeout_ms, "Timeout for device hang detection, in milliseconds, 0 - default");
+
+static void vpu_cmdq_ring_db(struct vpu_device *vdev, struct vpu_cmdq *cmdq)
+{
+	vpu_hw_reg_db_set(vdev, cmdq->db_id);
+}
+
+static struct vpu_cmdq *vpu_cmdq_alloc(struct vpu_file_priv *file_priv, u16 engine)
+{
+	struct vpu_device *vdev = file_priv->vdev;
+	struct vpu_job_queue_header *jobq_header;
+	struct vpu_cmdq *cmdq;
+
+	cmdq = kzalloc(sizeof(*cmdq), GFP_KERNEL);
+	if (!cmdq)
+		return NULL;
+
+	cmdq->mem = vpu_bo_alloc_internal(vdev, 0, SZ_4K, true);
+	if (!cmdq->mem)
+		goto cmdq_free;
+
+	cmdq->db_id = file_priv->ctx.id + engine * vpu_get_context_count(vdev);
+	cmdq->entry_count = (u32)((cmdq->mem->base.size - sizeof(struct vpu_job_queue_header)) /
+				  sizeof(struct vpu_job_queue_entry));
+
+	cmdq->jobq = (struct vpu_job_queue *)cmdq->mem->kvaddr;
+	jobq_header = &cmdq->jobq->header;
+	jobq_header->engine_idx = engine;
+	jobq_header->head = 0;
+	jobq_header->tail = 0;
+
+	return cmdq;
+
+cmdq_free:
+	kfree(cmdq);
+	return NULL;
+}
+
+static void vpu_cmdq_free(struct vpu_file_priv *file_priv, struct vpu_cmdq *cmdq)
+{
+	if (!cmdq)
+		return;
+
+	vpu_bo_free_internal(cmdq->mem);
+	kfree(cmdq);
+}
+
+static struct vpu_cmdq *vpu_cmdq_acquire(struct vpu_file_priv *file_priv, u16 engine)
+{
+	struct vpu_device *vdev = file_priv->vdev;
+	struct vpu_cmdq *cmdq = file_priv->cmdq[engine];
+	int ret;
+
+	lockdep_assert_held(&file_priv->lock);
+
+	if (!cmdq) {
+		cmdq = vpu_cmdq_alloc(file_priv, engine);
+		if (!cmdq)
+			return NULL;
+		file_priv->cmdq[engine] = cmdq;
+	}
+
+	if (cmdq->db_registered)
+		return cmdq;
+
+	ret = vpu_jsm_register_db(vdev, file_priv->ctx.id, cmdq->db_id,
+				  cmdq->mem->vpu_addr, cmdq->mem->base.size);
+	if (ret)
+		return NULL;
+
+	cmdq->db_registered = true;
+
+	return cmdq;
+}
+
+static void vpu_cmdq_release_locked(struct vpu_file_priv *file_priv, u16 engine)
+{
+	struct vpu_cmdq *cmdq = file_priv->cmdq[engine];
+
+	lockdep_assert_held(&file_priv->lock);
+
+	if (cmdq) {
+		file_priv->cmdq[engine] = NULL;
+		if (cmdq->db_registered)
+			vpu_jsm_unregister_db(file_priv->vdev, cmdq->db_id);
+
+		vpu_cmdq_free(file_priv, cmdq);
+	}
+}
+
+void vpu_cmdq_release_all(struct vpu_file_priv *file_priv)
+{
+	int i;
+
+	mutex_lock(&file_priv->lock);
+
+	for (i = 0; i < VPU_NUM_ENGINES; i++)
+		vpu_cmdq_release_locked(file_priv, i);
+
+	mutex_unlock(&file_priv->lock);
+}
+
+/*
+ * Mark the doorbell as unregistered and reset job queue pointers.
+ * This function needs to be called when the VPU hardware is restarted
+ * and FW looses job queue state. The next time job queue is used it
+ * will be registered again.
+ */
+static void vpu_cmdq_reset_locked(struct vpu_file_priv *file_priv, u16 engine)
+{
+	struct vpu_cmdq *cmdq = file_priv->cmdq[engine];
+
+	lockdep_assert_held(&file_priv->lock);
+
+	if (cmdq) {
+		cmdq->db_registered = false;
+		cmdq->jobq->header.head = 0;
+		cmdq->jobq->header.tail = 0;
+	}
+}
+
+static void vpu_cmdq_reset_all(struct vpu_file_priv *file_priv)
+{
+	int i;
+
+	mutex_lock(&file_priv->lock);
+
+	for (i = 0; i < VPU_NUM_ENGINES; i++)
+		vpu_cmdq_reset_locked(file_priv, i);
+
+	mutex_unlock(&file_priv->lock);
+}
+
+void vpu_cmdq_reset_all_contexts(struct vpu_device *vdev)
+{
+	struct vpu_file_priv *file_priv;
+	unsigned long id;
+
+	xa_for_each(&vdev->context_xa, id, file_priv) {
+		if (!file_priv)
+			continue;
+
+		vpu_cmdq_reset_all(file_priv);
+	}
+}
+
+static int vpu_cmdq_push_job(struct vpu_cmdq *cmdq, struct vpu_job *job)
+{
+	struct vpu_device *vdev = job->vdev;
+	struct vpu_job_queue_header *header = &cmdq->jobq->header;
+	struct vpu_job_queue_entry *entry = &cmdq->jobq->job[header->tail];
+	u32 next_entry = (header->tail + 1) % cmdq->entry_count;
+
+	/* Check if there is space left in job queue */
+	if (next_entry == header->head) {
+		vpu_dbg(JOB, "Job queue full: ctx %d engine %d db %d head %d tail %d\n",
+			job->file_priv->ctx.id, job->engine_idx, cmdq->db_id,
+			header->head, header->tail);
+		return -EBUSY;
+	}
+
+	entry->batch_buf_addr = job->cmd_buf_vpu_addr;
+	entry->job_id = job->job_id;
+	entry->flags = 0;
+
+	mb(); /* Make sure the entry is written before updating the queue head*/
+	header->tail = next_entry;
+	mb(); /* Make sure tail is update before ringing db */
+
+	return 0;
+}
+
+struct vpu_fence {
+	struct dma_fence base;
+	spinlock_t lock; /* protects base */
+	struct vpu_device *vdev;
+};
+
+static inline struct vpu_fence *to_vpu_fence(struct dma_fence *fence)
+{
+	return container_of(fence, struct vpu_fence, base);
+}
+
+static const char *vpu_fence_get_driver_name(struct dma_fence *fence)
+{
+	return DRIVER_NAME;
+}
+
+static const char *vpu_fence_get_timeline_name(struct dma_fence *fence)
+{
+	struct vpu_fence *vpu_fence = to_vpu_fence(fence);
+
+	return dev_name(vpu_fence->vdev->drm.dev);
+}
+
+static const struct dma_fence_ops vpu_fence_ops = {
+	.get_driver_name = vpu_fence_get_driver_name,
+	.get_timeline_name = vpu_fence_get_timeline_name,
+};
+
+static struct dma_fence *vpu_fence_create(struct vpu_device *vdev)
+{
+	struct vpu_fence *fence;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence)
+		return NULL;
+
+	fence->vdev = vdev;
+	spin_lock_init(&fence->lock);
+	dma_fence_init(&fence->base, &vpu_fence_ops, &fence->lock, dma_fence_context_alloc(1), 1);
+
+	return &fence->base;
+}
+
+static void job_get(struct vpu_job *job, struct vpu_job **link)
+{
+	struct vpu_device *vdev = job->vdev;
+
+	vpu_dbg(KREF, "Job get: id %u refcount %u\n", job->job_id, kref_read(&job->ref));
+
+	kref_get(&job->ref);
+	*link = job;
+}
+
+static void job_release(struct kref *ref)
+{
+	struct vpu_job *job = container_of(ref, struct vpu_job, ref);
+	struct vpu_device *vdev = job->vdev;
+	u32 i;
+
+	for (i = 0; i < job->bo_count; i++)
+		if (job->bos[i])
+			drm_gem_object_put(&job->bos[i]->base);
+
+	dma_fence_put(job->done_fence);
+	vpu_file_priv_put(&job->file_priv);
+
+	vpu_dbg(KREF, "Job released: id %u\n", job->job_id);
+	kfree(job);
+}
+
+static void job_put(struct vpu_job *job)
+{
+	struct vpu_device *vdev = job->vdev;
+
+	vpu_dbg(KREF, "Job put: id %u refcount %u\n", job->job_id, kref_read(&job->ref));
+	kref_put(&job->ref, job_release);
+}
+
+static struct vpu_job *
+vpu_create_job(struct vpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
+{
+	struct vpu_device *vdev = file_priv->vdev;
+	struct vpu_job *job;
+	size_t buf_size;
+
+	buf_size = sizeof(*job) + bo_count * sizeof(struct vpu_bo *);
+	job = kzalloc(buf_size, GFP_KERNEL);
+	if (!job)
+		return NULL;
+
+	kref_init(&job->ref);
+
+	job->vdev = vdev;
+	job->engine_idx = engine_idx;
+	job->bo_count = bo_count;
+	job->done_fence = vpu_fence_create(vdev);
+	if (!job->done_fence) {
+		vpu_warn_ratelimited(vdev, "Failed to create a fence\n");
+		goto err_free_job;
+	}
+
+	vpu_file_priv_get(file_priv, &job->file_priv);
+
+	vpu_dbg(JOB, "Job created: ctx %2d engine %d", job->file_priv->ctx.id, job->engine_idx);
+
+	return job;
+
+err_free_job:
+	kfree(job);
+	return NULL;
+}
+
+static void vpu_job_update_status(struct page *p, struct vpu_job *job, u32 job_status)
+{
+	void *dst = kmap_local_page(p);
+	drm_vpu_job_status_t *status = dst + (job->submit_status_offset % PAGE_SIZE);
+
+	*status = job_status;
+
+	flush_dcache_page(p);
+	kunmap_local(dst);
+}
+
+static int vpu_job_done(struct vpu_device *vdev, u32 job_id, u32 job_status)
+{
+	struct vpu_job *job;
+	struct page *p;
+
+	job = xa_erase(&vdev->submitted_jobs_xa, job_id);
+	if (!job)
+		return -ENOENT;
+
+	p = vpu_bo_get_page(job->bos[CMD_BUF_IDX], job->submit_status_offset);
+	if (!p) {
+		vpu_warn(vdev, "Failed to get cmd bo status page\n");
+		goto job_put;
+	}
+	vpu_job_update_status(p, job, job_status);
+	dma_fence_signal(job->done_fence);
+
+job_put:
+	vpu_dbg(JOB, "Job complete:  id %3u ctx %2d engine %d status 0x%x\n",
+		job->job_id, job->file_priv->ctx.id, job->engine_idx, job_status);
+
+	job_put(job);
+	return 0;
+}
+
+static void vpu_job_done_message(struct vpu_device *vdev, void *msg)
+{
+	struct vpu_ipc_msg_payload_job_done *payload;
+	struct vpu_jsm_msg *job_ret_msg = msg;
+	int ret;
+
+	payload = (struct vpu_ipc_msg_payload_job_done *)&job_ret_msg->payload;
+
+	ret = vpu_job_done(vdev, payload->job_id, payload->job_status);
+	if (ret)
+		vpu_err(vdev, "Failed to finish job %d: %d\n", payload->job_id, ret);
+}
+
+void vpu_jobs_abort_all(struct vpu_device *vdev)
+{
+	struct vpu_job *job;
+	unsigned long id;
+
+	xa_for_each(&vdev->submitted_jobs_xa, id, job)
+		vpu_job_done(vdev, id, VPU_JSM_STATUS_ABORTED);
+}
+
+static int vpu_direct_job_submission(struct vpu_job *job)
+{
+	struct vpu_file_priv *file_priv = job->file_priv;
+	struct vpu_device *vdev = job->vdev;
+	struct xa_limit job_id_range;
+	struct vpu_cmdq *cmdq;
+	int ret;
+
+	mutex_lock(&file_priv->lock);
+
+	cmdq = vpu_cmdq_acquire(job->file_priv, job->engine_idx);
+	if (!cmdq) {
+		vpu_warn(vdev, "Failed get job queue, ctx %d engine %d\n",
+			 file_priv->ctx.id, job->engine_idx);
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+
+	job_id_range.min = FIELD_PREP(JOB_ID_CONTEXT_MASK, (file_priv->ctx.id - 1));
+	job_id_range.max = job_id_range.min | JOB_ID_JOB_MASK;
+
+	job_get(job, &job);
+	ret = xa_alloc(&vdev->submitted_jobs_xa, &job->job_id, job, job_id_range, GFP_KERNEL);
+	if (ret) {
+		vpu_warn_ratelimited(vdev, "Failed to allocate job id: %d\n", ret);
+		goto err_job_put;
+	}
+
+	ret = vpu_cmdq_push_job(cmdq, job);
+	if (ret)
+		goto err_xa_erase;
+
+	vpu_dbg(JOB, "Job submitted: id %3u ctx %2d engine %d next %d\n",
+		job->job_id, file_priv->ctx.id, job->engine_idx, cmdq->jobq->header.tail);
+
+	if (vpu_test_mode == VPU_TEST_MODE_NULL_HW) {
+		vpu_job_done(vdev, job->job_id, VPU_JSM_STATUS_SUCCESS);
+		cmdq->jobq->header.head = cmdq->jobq->header.tail;
+	} else {
+		vpu_cmdq_ring_db(vdev, cmdq);
+	}
+
+	mutex_unlock(&file_priv->lock);
+	return 0;
+
+err_xa_erase:
+	xa_erase(&vdev->submitted_jobs_xa, job->job_id);
+err_job_put:
+	job_put(job);
+err_unlock:
+	mutex_unlock(&file_priv->lock);
+	return ret;
+}
+
+static int
+vpu_job_prepare_bos_for_submit(struct drm_file *file, struct vpu_job *job, u32 *buf_handles,
+			       u32 buf_count, u32 status_offset, u32 commands_offset)
+{
+	struct vpu_file_priv *file_priv = file->driver_priv;
+	struct vpu_device *vdev = file_priv->vdev;
+	struct ww_acquire_ctx acquire_ctx;
+	struct vpu_bo *bo;
+	int ret;
+	u32 i;
+
+	for (i = 0; i < buf_count; i++) {
+		struct drm_gem_object *obj = drm_gem_object_lookup(file, buf_handles[i]);
+
+		if (!obj)
+			return -ENOENT;
+
+		job->bos[i] = to_vpu_bo(obj);
+
+		ret = vpu_bo_pin(job->bos[i]);
+		if (ret)
+			return ret;
+	}
+
+	bo = job->bos[CMD_BUF_IDX];
+	if (!dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_READ)) {
+		vpu_warn(vdev, "Buffer is already in use\n");
+		return -EBUSY;
+	}
+
+	if (commands_offset >= bo->base.size) {
+		vpu_warn(vdev, "Invalid command buffer offset %u\n", commands_offset);
+		return -EINVAL;
+	}
+
+	job->cmd_buf_vpu_addr = bo->vpu_addr + commands_offset;
+
+	if (status_offset > (bo->base.size - sizeof(drm_vpu_job_status_t))) {
+		vpu_warn(vdev, "Invalid status offset %u\n", status_offset);
+		return -EINVAL;
+	}
+	job->submit_status_offset = status_offset;
+
+	ret = drm_gem_lock_reservations((struct drm_gem_object **)job->bos, buf_count,
+					&acquire_ctx);
+	if (ret) {
+		vpu_warn(vdev, "Failed to lock reservations: %d\n", ret);
+		return ret;
+	}
+	for (i = 0; i < buf_count; i++) {
+		ret = dma_resv_reserve_fences(job->bos[i]->base.resv, 1);
+		if (ret) {
+			vpu_warn(vdev, "Failed to reserve fences: %d\n", ret);
+			goto unlock_reservations;
+		}
+	}
+
+	for (i = 0; i < buf_count; i++)
+		dma_resv_add_fence(job->bos[i]->base.resv, job->done_fence, DMA_RESV_USAGE_WRITE);
+
+unlock_reservations:
+	drm_gem_unlock_reservations((struct drm_gem_object **)job->bos, buf_count, &acquire_ctx);
+
+	return ret;
+}
+
+int vpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	int ret = 0;
+	struct vpu_file_priv *file_priv = file->driver_priv;
+	struct vpu_device *vdev = file_priv->vdev;
+	struct drm_vpu_submit *params = data;
+	struct vpu_job *job;
+	u32 *buf_handles;
+
+	if (params->engine > DRM_VPU_ENGINE_COPY)
+		return -EINVAL;
+
+	if (params->buffer_count == 0)
+		return -EINVAL;
+
+	if (params->commands_offset == params->status_offset)
+		return -EINVAL;
+
+	if (!IS_ALIGNED(params->commands_offset, 8))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(params->status_offset, 8))
+		return -EINVAL;
+
+	if (!file_priv->ctx.id)
+		return -EINVAL;
+
+	buf_handles = kcalloc(params->buffer_count, sizeof(u32), GFP_KERNEL);
+	if (!buf_handles)
+		return -ENOMEM;
+
+	ret = copy_from_user(buf_handles,
+			     (void __user *)params->buffers_ptr,
+			     params->buffer_count * sizeof(u32));
+	if (ret)
+		goto free_handles;
+
+	vpu_dbg(JOB, "Submit ioctl: ctx %u buf_count %u\n",
+		file_priv->ctx.id, params->buffer_count);
+	job = vpu_create_job(file_priv, params->engine, params->buffer_count);
+	if (!job) {
+		vpu_err(vdev, "Failed to create job\n");
+		ret = -ENOMEM;
+		goto free_handles;
+	}
+
+	ret = vpu_job_prepare_bos_for_submit(file, job, buf_handles, params->buffer_count,
+					     params->status_offset, params->commands_offset);
+	if (ret) {
+		vpu_err(vdev, "Failed to prepare job, ret %d\n", ret);
+		goto job_put;
+	}
+
+	ret = vpu_direct_job_submission(job);
+	if (ret) {
+		dma_fence_signal(job->done_fence);
+		vpu_err(vdev, "Failed to submit job to the HW, ret %d\n", ret);
+	}
+
+job_put:
+	job_put(job);
+free_handles:
+	kfree(buf_handles);
+
+	return ret;
+}
+
+static int vpu_job_done_thread(void *arg)
+{
+	struct vpu_device *vdev = (struct vpu_device *)arg;
+	struct vpu_ipc_consumer cons;
+	struct vpu_jsm_msg jsm_msg;
+	bool jobs_submitted;
+	unsigned int timeout;
+	int ret;
+
+	vpu_dbg(JOB, "Started %s\n", __func__);
+
+	vpu_ipc_consumer_add(vdev, &cons, VPU_IPC_CHAN_JOB_RET);
+
+	while (!kthread_should_stop()) {
+		timeout = vpu_tdr_timeout_ms ? vpu_tdr_timeout_ms : vdev->timeout.tdr;
+		jobs_submitted = !xa_empty(&vdev->submitted_jobs_xa);
+		ret = vpu_ipc_receive(vdev, &cons, NULL, &jsm_msg, timeout);
+		if (!ret) {
+			vpu_job_done_message(vdev, &jsm_msg);
+		} else if (ret == -ETIMEDOUT) {
+			if (jobs_submitted && !xa_empty(&vdev->submitted_jobs_xa))
+				vpu_err(vdev, "TDR detected, timeout %d ms", timeout);
+		}
+	}
+
+	vpu_ipc_consumer_del(vdev, &cons);
+
+	vpu_jobs_abort_all(vdev);
+
+	vpu_dbg(JOB, "Stopped %s\n", __func__);
+	return 0;
+}
+
+int vpu_job_done_thread_init(struct vpu_device *vdev)
+{
+	struct task_struct *thread;
+
+	thread = kthread_run(&vpu_job_done_thread, (void *)vdev, "vpu_job_done_thread");
+	if (IS_ERR(thread)) {
+		vpu_err(vdev, "Failed to start job completion thread\n");
+		return -EIO;
+	}
+
+	get_task_struct(thread);
+	wake_up_process(thread);
+
+	vdev->job_done_thread = thread;
+
+	return 0;
+}
+
+void vpu_job_done_thread_fini(struct vpu_device *vdev)
+{
+	kthread_stop(vdev->job_done_thread);
+	put_task_struct(vdev->job_done_thread);
+}
diff --git a/drivers/gpu/drm/vpu/vpu_job.h b/drivers/gpu/drm/vpu/vpu_job.h
new file mode 100644
index 000000000000..11e1f345c2a3
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_job.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#ifndef __VPU_JOB_H__
+#define __VPU_JOB_H__
+
+#include <linux/kref.h>
+#include <linux/idr.h>
+
+#include "vpu_gem.h"
+
+struct vpu_device;
+struct vpu_file_priv;
+
+/**
+ * struct vpu_cmdq - Object representing device queue used to send jobs.
+ * @jobq:	   Pointer to job queue memory shared with the device
+ * @mem:           Memory allocated for the job queue, shared with device
+ * @entry_count    Number of job entries in the queue
+ * @db_id:	   Doorbell assigned to this job queue
+ * @db_registered: True if doorbell is registered in device
+ */
+struct vpu_cmdq {
+	struct vpu_job_queue *jobq;
+	struct vpu_bo *mem;
+	u32 entry_count;
+	u32 db_id;
+	bool db_registered;
+};
+
+/**
+ * struct vpu_job - KMD object that represents batchbuffer / DMA buffer.
+ * Each batch / DMA buffer is a job to be submitted and executed by the VPU FW.
+ * This is a unit of execution, and be tracked by the job_id for
+ * any status reporting from VPU FW through IPC JOB RET/DONE message.
+ * @file_priv:		  The client that submitted this job
+ * @job_id:		  Job ID for KMD tracking and job status reporting from VPU FW
+ * @status:		  Status of the Job from IPC JOB RET/DONE message
+ * @batch_buffer:	  CPU vaddr points to the batch buffer memory allocated for the job
+ * @submit_status_offset: Offset within batch buffer where job completion handler
+			  will update the job status
+ */
+struct vpu_job {
+	struct kref ref;
+
+	struct vpu_device *vdev;
+
+	struct vpu_file_priv *file_priv;
+
+	u64 submit_status_offset;
+
+	struct dma_fence *done_fence;
+
+	u64 cmd_buf_vpu_addr;
+	u32 job_id;
+	u32 engine_idx;
+	size_t bo_count;
+	struct vpu_bo *bos[];
+};
+
+int vpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+
+void vpu_cmdq_release_all(struct vpu_file_priv *file_priv);
+void vpu_cmdq_reset_all_contexts(struct vpu_device *vdev);
+
+int vpu_job_done_thread_init(struct vpu_device *vdev);
+void vpu_job_done_thread_fini(struct vpu_device *vdev);
+
+void vpu_jobs_abort_all(struct vpu_device *vdev);
+
+#endif /* __VPU_JOB_H__ */
diff --git a/include/uapi/drm/vpu_drm.h b/include/uapi/drm/vpu_drm.h
index b0492225433d..68b1f2d94046 100644
--- a/include/uapi/drm/vpu_drm.h
+++ b/include/uapi/drm/vpu_drm.h
@@ -20,6 +20,8 @@ extern "C" {
 #define DRM_VPU_BO_CREATE		 0x02
 #define DRM_VPU_BO_INFO			 0x03
 #define DRM_VPU_BO_USERPTR		 0x04
+#define DRM_VPU_SUBMIT			 0x05
+#define DRM_VPU_BO_WAIT			 0x06
 
 #define DRM_IOCTL_VPU_GET_PARAM                                                                    \
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VPU_GET_PARAM, struct drm_vpu_param)
@@ -36,6 +38,12 @@ extern "C" {
 #define DRM_IOCTL_VPU_BO_USERPTR                                                                   \
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VPU_BO_USERPTR, struct drm_vpu_bo_userptr)
 
+#define DRM_IOCTL_VPU_SUBMIT                                                                       \
+	DRM_IOW(DRM_COMMAND_BASE + DRM_VPU_SUBMIT, struct drm_vpu_submit)
+
+#define DRM_IOCTL_VPU_BO_WAIT                                                                      \
+	DRM_IOW(DRM_COMMAND_BASE + DRM_VPU_BO_WAIT, struct drm_vpu_bo_wait)
+
 /**
  * DOC: contexts
  *
@@ -227,6 +235,94 @@ struct drm_vpu_bo_userptr {
 	__u64 vpu_addr;
 };
 
+/* drm_vpu_submit job status type */
+typedef __u64 drm_vpu_job_status_t;
+
+/* drm_vpu_submit job status codes */
+#define DRM_VPU_JOB_STATUS_SUCCESS 0
+
+/* drm_vpu_submit engines */
+#define DRM_VPU_ENGINE_COMPUTE 0
+#define DRM_VPU_ENGINE_COPY    1
+
+/**
+ * struct drm_vpu_submit - Submit commands to the VPU
+ *
+ * Execute a single command buffer on a given VPU engine.
+ * Handles to all referenced buffer objects have to be provided in @buffers_ptr.
+ *
+ * User space may wait on job completion using %DRM_VPU_BO_WAIT ioctl.
+ */
+struct drm_vpu_submit {
+	/**
+	 * @buffers_ptr:
+	 *
+	 * A pointer to an u32 array of GEM handles of the BOs required for this job.
+	 * The number of elements in the array must be equal to the value given by @buffer_count.
+	 *
+	 * The first BO is the command buffer. The rest of array has to contail all
+	 * BOs referenced from the command buffer.
+	 */
+	__u64 buffers_ptr;
+
+	/** @buffer_count: Number of elements in the @buffers_ptr */
+	__u32 buffer_count;
+
+	/**
+	 * @engine: Select the engine this job should be executed on
+	 *
+	 * %DRM_VPU_ENGINE_COMPUTE:
+	 *
+	 * Performs Deep Learning Neural Compute Inference Operations
+	 *
+	 * %DRM_VPU_ENGINE_COPY:
+	 *
+	 * Performs memory copy operations to/from system memory allocated for VPU
+	 */
+	__u32 engine;
+
+	/** @flags: Reserved for future use - must be zero */
+	__u32 flags;
+
+	/**
+	 * @commands_offset:
+	 *
+	 * Offset inside the first buffer in @buffers_ptr containing commands
+	 * to be executed. The offset has to be 8-byte aligned.
+	 */
+	__u32 commands_offset;
+
+	/**
+	 * @status_offset:
+	 *
+	 * Offset inside the first buffer in @buffers_ptr containing an u64 with
+	 * job status code which is updated after the job is completed.
+	 * &DRM_VPU_JOB_STATUS_SUCCESS or device specific error otherwise.
+	 * The offset has to be 8-byte aligned.
+	 */
+	__u32 status_offset;
+
+	/** @pad: Padding - must be zero */
+	__u32 pad;
+};
+
+/**
+ * struct drm_vpu_bo_wait - Wait for BO to become inactive
+ *
+ * Blocks until a given buffer object becomes inactive.
+ * With @timeout_ms set to 0 returns immediately.
+ */
+struct drm_vpu_bo_wait {
+	/** @handle: Handle to the buffer object to be waited on */
+	__u32 handle;
+
+	/** @flags: Reserved for future use - must be zero */
+	__u32 flags;
+
+	/** @timeout_ns: Absolute timeout in nanoseconds (may be zero) */
+	__s64 timeout_ns;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

