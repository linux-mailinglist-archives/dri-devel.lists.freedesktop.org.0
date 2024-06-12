Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8F590543E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 15:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E408010E856;
	Wed, 12 Jun 2024 13:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FB710E853
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 13:53:20 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-35f223e7691so624956f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 06:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718200399; x=1718805199;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z3SUqOYa9L5Td617VrRZlR1zHKvLxtuonrEuB0ZESxs=;
 b=KOM+wQUtgJipZBNil52jOtppa0arbl7/jQwAdtbRCSeD2ao2CqegEKHvJuxHhDfDIV
 ddDLGl67bmAm0etKkmd//NQOCaRwTCfvfBiHIiMI/Jd+eZyG5CQ3ECzKOu1KTYItKOya
 4rlyyTfQ9Afxk/PXdXTyVyHqRK2uidi4juTtkkTzODueEzp0oyPiJMRh0tgvD5XZzuhA
 v+YJ6C9xxW9M2/mW0RXn2PGoZlZnDSLdkNXL9vmtC7krCXCYd1mHYpCvp8TOn2Ysf5r+
 DlrPE+uKq11hwBeZS0joNBdcp1DM63tt1tQfkgLoRqxCF83B3wQNMGFlj5gWHpZk5V/u
 1l9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV64YpnFY0+fT3pktUqC/s6ghSdb+RD8HwMX3d41QTe/woMtnfwNFLAnA1uBlrtwEE8Dfsbf/BWrfXfitSYvHxwB5UwYZ17P8CSP/zk++5j
X-Gm-Message-State: AOJu0YzyqKobBdeongKZhXXCZJwvnQPB5pPsfshV+4DN+qpNBX3GtH/n
 3cITIe4P0rUL1sg4YGbsmq1zHJgHV+MlXPW1dw9vsohc0ct/Y9+S
X-Google-Smtp-Source: AGHT+IEaEIZiNbWUSGRo6/5WvYUh8F1yw9hf9gFdoRB5Z+vVTd7sY+NaHJwCiLUjHBFJSjoTsrfV0Q==
X-Received: by 2002:a5d:64c9:0:b0:35f:3061:26e with SMTP id
 ffacd0b85a97d-35f3061059cmr4929775f8f.2.1718200398674; 
 Wed, 12 Jun 2024 06:53:18 -0700 (PDT)
Received: from ramallet.home (cst-prg-45-36.cust.vodafone.cz. [46.135.45.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422871ec9e6sm28201695e9.38.2024.06.12.06.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 06:53:18 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 12 Jun 2024 15:53:01 +0200
Subject: [PATCH 8/9] accel/rocket: Add job submission IOCTL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-6-10-rocket-v1-8-060e48eea250@tomeuvizoso.net>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
In-Reply-To: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.13.0
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

Using the DRM GPU scheduler infrastructure, with a scheduler for each
core.

Userspace can decide for a series of tasks to be executed sequentially
in the same core, so SRAM locality can be taken advantage of.

The job submission code was intially based on Panfrost.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/rocket/Makefile        |   3 +-
 drivers/accel/rocket/rocket_core.c   |   6 +
 drivers/accel/rocket/rocket_core.h   |  16 +
 drivers/accel/rocket/rocket_device.c |   2 +
 drivers/accel/rocket/rocket_device.h |   2 +
 drivers/accel/rocket/rocket_drv.c    |  15 +
 drivers/accel/rocket/rocket_drv.h    |   3 +
 drivers/accel/rocket/rocket_job.c    | 708 +++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_job.h    |  49 +++
 include/uapi/drm/rocket_accel.h      |  55 +++
 10 files changed, 858 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
index 875cac2243d9..4d59036af8d9 100644
--- a/drivers/accel/rocket/Makefile
+++ b/drivers/accel/rocket/Makefile
@@ -6,4 +6,5 @@ rocket-y := \
 	rocket_core.o \
 	rocket_device.o \
 	rocket_drv.o \
-	rocket_gem.o
+	rocket_gem.o \
+	rocket_job.o
diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index d6680b00fb2f..2b2d8be38f0a 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -11,6 +11,7 @@
 
 #include "rocket_core.h"
 #include "rocket_device.h"
+#include "rocket_job.h"
 #include "rocket_registers.h"
 
 static int rocket_clk_init(struct rocket_core *core)
@@ -122,6 +123,10 @@ int rocket_core_init(struct rocket_core *core)
 		goto out_pm_domain;
 	}
 
+	err = rocket_job_init(core);
+	if (err)
+		goto out_pm_domain;
+
 	version = rocket_read(core, REG_PC_VERSION) + (rocket_read(core, REG_PC_VERSION_NUM) & 0xffff);
 	dev_info(rdev->dev, "Rockchip NPU core %d version: %d\n", core->index, version);
 
@@ -134,6 +139,7 @@ int rocket_core_init(struct rocket_core *core)
 
 void rocket_core_fini(struct rocket_core *core)
 {
+	rocket_job_fini(core);
 	rocket_pmdomain_fini(core);
 }
 
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index e5d4c848c9f4..e6401960a9b2 100644
--- a/drivers/accel/rocket/rocket_core.h
+++ b/drivers/accel/rocket/rocket_core.h
@@ -8,6 +8,8 @@
 #include <asm/io.h>
 #include <asm-generic/io.h>
 
+#include <drm/gpu_scheduler.h>
+
 #define rocket_read(core, reg) readl((core)->iomem + (reg))
 #define rocket_write(core, reg, value) writel(value, (core)->iomem + (reg))
 
@@ -23,6 +25,20 @@ struct rocket_core {
 	struct clk *h_clk;
 	struct device *pm_domain;
 	struct device_link *pm_domain_link;
+
+	struct rocket_job *in_flight_job;
+
+	spinlock_t job_lock;
+
+	struct {
+		struct workqueue_struct *wq;
+		struct work_struct work;
+		atomic_t pending;
+	} reset;
+
+       struct drm_gpu_scheduler sched;
+       u64 fence_context;
+       u64 emit_seqno;
 };
 
 int rocket_core_init(struct rocket_core *core);
diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
index 3bd23f22d06a..19b33f67e2e4 100644
--- a/drivers/accel/rocket/rocket_device.c
+++ b/drivers/accel/rocket/rocket_device.c
@@ -11,6 +11,8 @@ int rocket_device_init(struct rocket_device *rdev)
 {
 	int core, err;
 
+	mutex_init(&rdev->sched_lock);
+
 	rdev->clk_npu = devm_clk_get_enabled(rdev->dev, "clk_npu");
 	rdev->pclk = devm_clk_get_enabled(rdev->dev, "pclk");
 
diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
index 6765d944a2c8..e2572558b820 100644
--- a/drivers/accel/rocket/rocket_device.h
+++ b/drivers/accel/rocket/rocket_device.h
@@ -27,6 +27,8 @@ struct rocket_device {
 
 	struct rocket_core cores[MAX_NUM_CORES];
 
+	struct mutex sched_lock;
+
 	struct clk *clk_npu;
 	struct clk *pclk;
 };
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 42196417030e..adcb9a685dd8 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -16,6 +16,7 @@
 #include "rocket_drv.h"
 #include "rocket_device.h"
 #include "rocket_gem.h"
+#include "rocket_job.h"
 
 static const char * const rk3588_pm_domains[] = { "npu0", "npu1", "npu2" };
 static const char * const rk3588_resets_a[] = { "srst_a0", "srst_a1", "srst_a2" };
@@ -38,6 +39,7 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct rocket_device *rdev = dev->dev_private;
 	struct rocket_file_priv *rocket_priv;
+	int ret;
 
 	rocket_priv = kzalloc(sizeof(*rocket_priv), GFP_KERNEL);
 	if (!rocket_priv)
@@ -46,7 +48,15 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
 	rocket_priv->rdev = rdev;
 	file->driver_priv = rocket_priv;
 
+	ret = rocket_job_open(rocket_priv);
+	if (ret)
+		goto err_free;
+
 	return 0;
+
+err_free:
+	kfree(rocket_priv);
+	return ret;
 }
 
 static void
@@ -54,6 +64,7 @@ rocket_postclose(struct drm_device *dev, struct drm_file *file)
 {
 	struct rocket_file_priv *rocket_priv = file->driver_priv;
 
+	rocket_job_close(rocket_priv);
 	kfree(rocket_priv);
 }
 
@@ -62,6 +73,7 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
 
 	ROCKET_IOCTL(CREATE_BO, create_bo),
+	ROCKET_IOCTL(SUBMIT, submit),
 };
 
 static const struct file_operations rocket_drm_driver_fops = {
@@ -194,6 +206,9 @@ static int rocket_device_runtime_suspend(struct device *dev)
 	struct rocket_device *rdev = dev_get_drvdata(dev);
 	int core;
 
+	if (!rocket_job_is_idle(rdev))
+		return -EBUSY;
+
 	for (core = 0; core < rdev->comp->num_cores; core++) {
 		clk_disable_unprepare(rdev->cores[core].a_clk);
 		clk_disable_unprepare(rdev->cores[core].h_clk);
diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
index e1d9407c46d7..b91e7cc472ea 100644
--- a/drivers/accel/rocket/rocket_drv.h
+++ b/drivers/accel/rocket/rocket_drv.h
@@ -5,9 +5,12 @@
 #define __ROCKET_DRV_H__
 
 #include <linux/io.h>
+#include <drm/gpu_scheduler.h>
 
 struct rocket_file_priv {
        struct rocket_device *rdev;
+
+       struct drm_sched_entity sched_entity;
 };
 
 #endif
diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
new file mode 100644
index 000000000000..eadb1655ebf7
--- /dev/null
+++ b/drivers/accel/rocket/rocket_job.c
@@ -0,0 +1,708 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
+/* Copyright 2019 Collabora ltd. */
+/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/rocket_accel.h>
+#include <linux/gfp_types.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "rocket_core.h"
+#include "rocket_device.h"
+#include "rocket_drv.h"
+#include "rocket_job.h"
+#include "rocket_registers.h"
+
+#define JOB_TIMEOUT_MS 500
+
+#define job_write(dev, reg, data) writel(data, dev->iomem + (reg))
+#define job_read(dev, reg) readl(dev->iomem + (reg))
+
+static struct rocket_job *
+to_rocket_job(struct drm_sched_job *sched_job)
+{
+	return container_of(sched_job, struct rocket_job, base);
+}
+
+struct rocket_fence {
+	struct dma_fence base;
+	struct drm_device *dev;
+	/* rocket seqno for signaled() test */
+	u64 seqno;
+	int queue;
+};
+
+static inline struct rocket_fence *
+to_rocket_fence(struct dma_fence *fence)
+{
+	return (struct rocket_fence *)fence;
+}
+
+static const char *rocket_fence_get_driver_name(struct dma_fence *fence)
+{
+	return "rocket";
+}
+
+static const char *rocket_fence_get_timeline_name(struct dma_fence *fence)
+{
+	return "rockchip-npu";
+}
+
+static const struct dma_fence_ops rocket_fence_ops = {
+	.get_driver_name = rocket_fence_get_driver_name,
+	.get_timeline_name = rocket_fence_get_timeline_name,
+};
+
+static struct dma_fence *rocket_fence_create(struct rocket_core *core)
+{
+	struct rocket_device *rdev = core->dev;
+	struct rocket_fence *fence;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence)
+		return ERR_PTR(-ENOMEM);
+
+	fence->dev = rdev->ddev;
+	fence->seqno = ++core->emit_seqno;
+	dma_fence_init(&fence->base, &rocket_fence_ops, &core->job_lock,
+		       core->fence_context, fence->seqno);
+
+	return &fence->base;
+}
+
+static int
+rocket_copy_tasks(struct drm_device *dev,
+		  struct drm_file *file_priv,
+		  struct drm_rocket_job *job,
+		  struct rocket_job *rjob)
+{
+	struct drm_rocket_task *tasks;
+	int ret = 0;
+	int i;
+
+	rjob->task_count = job->task_count;
+
+	if (!rjob->task_count)
+		return 0;
+
+	tasks = kvmalloc_array(rjob->task_count, sizeof(*tasks), GFP_KERNEL);
+	if (!tasks) {
+		ret = -ENOMEM;
+		DRM_DEBUG("Failed to allocate incoming tasks\n");
+		goto fail;
+	}
+
+	if (copy_from_user(tasks,
+			   (void __user *)(uintptr_t)job->tasks,
+			   rjob->task_count * sizeof(*tasks))) {
+		ret = -EFAULT;
+		DRM_DEBUG("Failed to copy incoming tasks\n");
+		goto fail;
+	}
+
+	rjob->tasks = kvmalloc_array(job->task_count, sizeof(*rjob->tasks), GFP_KERNEL);
+	if (!rjob->tasks) {
+		DRM_DEBUG("Failed to allocate task array\n");
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+	for (i = 0; i < rjob->task_count; i++) {
+		if (tasks[i].regcmd_count == 0) {
+			ret = -EINVAL;
+			goto fail;
+		}
+		rjob->tasks[i].regcmd = tasks[i].regcmd;
+		rjob->tasks[i].regcmd_count = tasks[i].regcmd_count;
+	}
+
+fail:
+	kvfree(tasks);
+	return ret;
+}
+
+static void rocket_job_hw_submit(struct rocket_core *core, struct rocket_job *job)
+{
+	struct rocket_device *rdev = core->dev;
+	struct rocket_task *task;
+	bool task_pp_en = 1;
+	bool task_count = 1;
+
+	/* GO ! */
+
+	/* Don't queue the job if a reset is in progress */
+	if (!atomic_read(&core->reset.pending)) {
+
+		task = &job->tasks[job->next_task_idx];
+		job->next_task_idx++;   /* TODO: Do this only after a succesful run? */
+
+		rocket_write(core, REG_PC_BASE_ADDRESS, 0x1);
+
+		rocket_write(core, REG_CNA_S_POINTER, 0xe + 0x10000000 * core->index);
+		rocket_write(core, REG_CORE_S_POINTER, 0xe + 0x10000000 * core->index);
+
+		rocket_write(core, REG_PC_BASE_ADDRESS, task->regcmd);
+		rocket_write(core, REG_PC_REGISTER_AMOUNTS, (task->regcmd_count + 1) / 2 - 1);
+
+		rocket_write(core, REG_PC_INTERRUPT_MASK, PC_INTERRUPT_MASK_DPU_0 | PC_INTERRUPT_MASK_DPU_1);
+		rocket_write(core, REG_PC_INTERRUPT_CLEAR, PC_INTERRUPT_CLEAR_DPU_0 | PC_INTERRUPT_CLEAR_DPU_1);
+
+		rocket_write(core, REG_PC_TASK_CON, ((0x6 | task_pp_en) << 12) | task_count);
+
+		rocket_write(core, REG_PC_TASK_DMA_BASE_ADDR, 0x0);
+
+		rocket_write(core, REG_PC_OPERATION_ENABLE, 0x1);
+
+		dev_dbg(rdev->dev,
+			"Submitted regcmd at 0x%llx to core %d",
+			task->regcmd, core->index);
+	}
+}
+
+static int rocket_acquire_object_fences(struct drm_gem_object **bos,
+					int bo_count,
+					struct drm_sched_job *job,
+					bool is_write)
+{
+	int i, ret;
+
+	for (i = 0; i < bo_count; i++) {
+		ret = dma_resv_reserve_fences(bos[i]->resv, 1);
+		if (ret)
+			return ret;
+
+		ret = drm_sched_job_add_implicit_dependencies(job, bos[i],
+							      is_write);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void rocket_attach_object_fences(struct drm_gem_object **bos,
+					  int bo_count,
+					  struct dma_fence *fence)
+{
+	int i;
+
+	for (i = 0; i < bo_count; i++)
+		dma_resv_add_fence(bos[i]->resv, fence, DMA_RESV_USAGE_WRITE);
+}
+
+static int rocket_job_push(struct rocket_job *job)
+{
+	struct rocket_device *rdev = job->rdev;
+	struct drm_gem_object **bos;
+	struct ww_acquire_ctx acquire_ctx;
+	int ret = 0;
+
+	bos = kvmalloc_array(job->in_bo_count + job->out_bo_count, sizeof(void *), GFP_KERNEL);
+	memcpy(bos, job->in_bos, job->in_bo_count * sizeof(void *));
+	memcpy(&bos[job->in_bo_count], job->out_bos, job->out_bo_count * sizeof(void *));
+
+	ret = drm_gem_lock_reservations(bos, job->in_bo_count + job->out_bo_count, &acquire_ctx);
+	if (ret)
+		goto err;
+
+	mutex_lock(&rdev->sched_lock);
+	drm_sched_job_arm(&job->base);
+
+	job->inference_done_fence = dma_fence_get(&job->base.s_fence->finished);
+
+	ret = rocket_acquire_object_fences(job->in_bos, job->in_bo_count, &job->base, false);
+	if (ret) {
+		mutex_unlock(&rdev->sched_lock);
+		goto err_unlock;
+	}
+
+	ret = rocket_acquire_object_fences(job->out_bos, job->out_bo_count, &job->base, true);
+	if (ret) {
+		mutex_unlock(&rdev->sched_lock);
+		goto err_unlock;
+	}
+
+	kref_get(&job->refcount); /* put by scheduler job completion */
+
+	drm_sched_entity_push_job(&job->base);
+
+	mutex_unlock(&rdev->sched_lock);
+
+	rocket_attach_object_fences(job->out_bos, job->out_bo_count, job->inference_done_fence);
+
+err_unlock:
+	drm_gem_unlock_reservations(bos, job->in_bo_count + job->out_bo_count, &acquire_ctx);
+err:
+	kfree(bos);
+
+	return ret;
+}
+
+static void rocket_job_cleanup(struct kref *ref)
+{
+	struct rocket_job *job = container_of(ref, struct rocket_job,
+						refcount);
+	unsigned int i;
+
+	dma_fence_put(job->done_fence);
+	dma_fence_put(job->inference_done_fence);
+
+	if (job->in_bos) {
+		for (i = 0; i < job->in_bo_count; i++)
+			drm_gem_object_put(job->in_bos[i]);
+
+		kvfree(job->in_bos);
+	}
+
+	if (job->out_bos) {
+		for (i = 0; i < job->out_bo_count; i++)
+			drm_gem_object_put(job->out_bos[i]);
+
+		kvfree(job->out_bos);
+	}
+
+	kfree(job->tasks);
+
+	kfree(job);
+}
+
+static void rocket_job_put(struct rocket_job *job)
+{
+	kref_put(&job->refcount, rocket_job_cleanup);
+}
+
+static void rocket_job_free(struct drm_sched_job *sched_job)
+{
+	struct rocket_job *job = to_rocket_job(sched_job);
+
+	drm_sched_job_cleanup(sched_job);
+
+	rocket_job_put(job);
+}
+
+static struct rocket_core *sched_to_core(struct rocket_device *rdev, struct drm_gpu_scheduler *sched)
+{
+	unsigned int core;
+
+	for (core = 0; core < rdev->comp->num_cores; core++) {
+		if (&rdev->cores[core].sched == sched)
+			return &rdev->cores[core];
+	}
+
+	return NULL;
+}
+
+static struct dma_fence *rocket_job_run(struct drm_sched_job *sched_job)
+{
+	struct rocket_job *job = to_rocket_job(sched_job);
+	struct rocket_device *rdev = job->rdev;
+	struct rocket_core *core = sched_to_core(rdev, sched_job->sched);
+	struct dma_fence *fence = NULL;
+	int ret;
+
+	if (unlikely(job->base.s_fence->finished.error))
+		return NULL;
+
+	/* Nothing to execute: can happen if the job has finished while
+	 * we were resetting the GPU.
+	 */
+	if (job->next_task_idx == job->task_count)
+		return NULL;
+
+	fence = rocket_fence_create(core);
+	if (IS_ERR(fence))
+		return fence;
+
+	if (job->done_fence)
+		dma_fence_put(job->done_fence);
+	job->done_fence = dma_fence_get(fence);
+
+	ret = pm_runtime_get_sync(rdev->dev);
+	if (ret < 0)
+		return fence;
+
+	spin_lock(&core->job_lock);
+
+	core->in_flight_job = job;
+	rocket_job_hw_submit(core, job);
+
+	spin_unlock(&core->job_lock);
+
+	return fence;
+}
+
+static void rocket_job_handle_done(struct rocket_core *core,
+				   struct rocket_job *job)
+{
+	if (job->next_task_idx < job->task_count) {
+		rocket_job_hw_submit(core, job);
+		return;
+	}
+
+	core->in_flight_job = NULL;
+	dma_fence_signal_locked(job->done_fence);
+	pm_runtime_put_autosuspend(core->dev->dev);
+}
+
+static void rocket_job_handle_irq(struct rocket_core *core)
+{
+	uint32_t status, raw_status;
+
+	pm_runtime_mark_last_busy(core->dev->dev);
+
+	status = rocket_read(core, REG_PC_INTERRUPT_STATUS);
+	raw_status = rocket_read(core, REG_PC_INTERRUPT_RAW_STATUS);
+
+	rocket_write(core, REG_PC_OPERATION_ENABLE, 0x0);
+	rocket_write(core, REG_PC_INTERRUPT_CLEAR, 0x1ffff);
+
+	spin_lock(&core->job_lock);
+
+	if (core->in_flight_job)
+		rocket_job_handle_done(core, core->in_flight_job);
+
+	spin_unlock(&core->job_lock);
+}
+
+static void
+rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
+{
+	struct rocket_device *rdev = core->dev;
+	bool cookie;
+
+	if (!atomic_read(&core->reset.pending))
+		return;
+
+	/* Stop the scheduler.
+	 *
+	 * FIXME: We temporarily get out of the dma_fence_signalling section
+	 * because the cleanup path generate lockdep splats when taking locks
+	 * to release job resources. We should rework the code to follow this
+	 * pattern:
+	 *
+	 *	try_lock
+	 *	if (locked)
+	 *		release
+	 *	else
+	 *		schedule_work_to_release_later
+	 */
+	drm_sched_stop(&core->sched, bad);
+
+	cookie = dma_fence_begin_signalling();
+
+	if (bad)
+		drm_sched_increase_karma(bad);
+
+	/* Mask job interrupts and synchronize to make sure we won't be
+	 * interrupted during our reset.
+	 */
+	rocket_write(core, REG_PC_INTERRUPT_MASK, 0x0);
+	synchronize_irq(core->irq);
+
+	/* Handle the remaining interrupts before we reset. */
+	rocket_job_handle_irq(core);
+
+	/* Remaining interrupts have been handled, but we might still have
+	 * stuck jobs. Let's make sure the PM counters stay balanced by
+	 * manually calling pm_runtime_put_noidle() and
+	 * rocket_devfreq_record_idle() for each stuck job.
+	 * Let's also make sure the cycle counting register's refcnt is
+	 * kept balanced to prevent it from running forever
+	 */
+	spin_lock(&core->job_lock);
+	if (core->in_flight_job)
+		pm_runtime_put_noidle(rdev->dev);
+
+	core->in_flight_job = NULL;
+	spin_unlock(&core->job_lock);
+
+	/* Proceed with reset now. */
+	pm_runtime_force_suspend(rdev->dev);
+	pm_runtime_force_resume(rdev->dev);
+
+	/* GPU has been reset, we can clear the reset pending bit. */
+	atomic_set(&core->reset.pending, 0);
+
+	/* Now resubmit jobs that were previously queued but didn't have a
+	 * chance to finish.
+	 * FIXME: We temporarily get out of the DMA fence signalling section
+	 * while resubmitting jobs because the job submission logic will
+	 * allocate memory with the GFP_KERNEL flag which can trigger memory
+	 * reclaim and exposes a lock ordering issue.
+	 */
+	dma_fence_end_signalling(cookie);
+	drm_sched_resubmit_jobs(&core->sched);
+	cookie = dma_fence_begin_signalling();
+
+	/* Restart the scheduler */
+	drm_sched_start(&core->sched, true);
+
+	dma_fence_end_signalling(cookie);
+}
+
+static enum drm_gpu_sched_stat rocket_job_timedout(struct drm_sched_job *sched_job)
+{
+	struct rocket_job *job = to_rocket_job(sched_job);
+	struct rocket_device *rdev = job->rdev;
+	struct rocket_core *core = sched_to_core(rdev, sched_job->sched);
+
+	/*
+	 * If the GPU managed to complete this jobs fence, the timeout is
+	 * spurious. Bail out.
+	 */
+	if (dma_fence_is_signaled(job->done_fence))
+		return DRM_GPU_SCHED_STAT_NOMINAL;
+
+	/*
+	 * rocket IRQ handler may take a long time to process an interrupt
+	 * if there is another IRQ handler hogging the processing.
+	 * For example, the HDMI encoder driver might be stuck in the IRQ
+	 * handler for a significant time in a case of bad cable connection.
+	 * In order to catch such cases and not report spurious rocket
+	 * job timeouts, synchronize the IRQ handler and re-check the fence
+	 * status.
+	 */
+	synchronize_irq(core->irq);
+
+	if (dma_fence_is_signaled(job->done_fence)) {
+		dev_warn(rdev->dev, "unexpectedly high interrupt latency\n");
+		return DRM_GPU_SCHED_STAT_NOMINAL;
+	}
+
+	dev_err(rdev->dev, "gpu sched timeout");
+
+	atomic_set(&core->reset.pending, 1);
+	rocket_reset(core, sched_job);
+
+	return DRM_GPU_SCHED_STAT_NOMINAL;
+}
+
+static void rocket_reset_work(struct work_struct *work)
+{
+	struct rocket_core *core;
+
+	core = container_of(work, struct rocket_core, reset.work);
+	rocket_reset(core, NULL);
+}
+
+static const struct drm_sched_backend_ops rocket_sched_ops = {
+	.run_job = rocket_job_run,
+	.timedout_job = rocket_job_timedout,
+	.free_job = rocket_job_free
+};
+
+static irqreturn_t rocket_job_irq_handler_thread(int irq, void *data)
+{
+	struct rocket_core *core = data;
+
+	rocket_job_handle_irq(core);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t rocket_job_irq_handler(int irq, void *data)
+{
+	struct rocket_core *core = data;
+	uint32_t raw_status = rocket_read(core, REG_PC_INTERRUPT_RAW_STATUS);
+
+	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
+	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
+
+	if (!(raw_status & PC_INTERRUPT_RAW_STATUS_DPU_0 ||
+	      raw_status & PC_INTERRUPT_RAW_STATUS_DPU_1))
+		return IRQ_NONE;
+
+	rocket_write(core, REG_PC_INTERRUPT_MASK, 0x0);
+
+	return IRQ_WAKE_THREAD;
+}
+
+int rocket_job_init(struct rocket_core *core)
+{
+	struct rocket_device *rdev = core->dev;
+	int ret;
+
+	INIT_WORK(&core->reset.work, rocket_reset_work);
+	spin_lock_init(&core->job_lock);
+
+	core->irq = platform_get_irq_byname(to_platform_device(rdev->dev),
+					    rdev->comp->irq_names[core->index]);
+	if (core->irq < 0)
+		return core->irq;
+
+	ret = devm_request_threaded_irq(rdev->dev, core->irq,
+					rocket_job_irq_handler,
+					rocket_job_irq_handler_thread,
+					IRQF_SHARED, KBUILD_MODNAME "-job",
+					core);
+	if (ret) {
+		dev_err(rdev->dev, "failed to request job irq");
+		return ret;
+	}
+
+	core->reset.wq = alloc_ordered_workqueue("rocket-reset-%d", 0, core->index);
+	if (!core->reset.wq)
+		return -ENOMEM;
+
+	core->fence_context = dma_fence_context_alloc(1);
+
+	ret = drm_sched_init(&core->sched,
+				&rocket_sched_ops, NULL,
+				DRM_SCHED_PRIORITY_COUNT,
+				1, 0,
+				msecs_to_jiffies(JOB_TIMEOUT_MS),
+				core->reset.wq,
+				NULL, "rocket", rdev->dev);
+	if (ret) {
+		dev_err(rdev->dev, "Failed to create scheduler: %d.", ret);
+		goto err_sched;
+	}
+
+	return 0;
+
+err_sched:
+	drm_sched_fini(&core->sched);
+
+	destroy_workqueue(core->reset.wq);
+	return ret;
+}
+
+void rocket_job_fini(struct rocket_core *core)
+{
+	drm_sched_fini(&core->sched);
+
+	cancel_work_sync(&core->reset.work);
+	destroy_workqueue(core->reset.wq);
+}
+
+int rocket_job_open(struct rocket_file_priv *rocket_priv)
+{
+	struct rocket_device *rdev = rocket_priv->rdev;
+	struct drm_gpu_scheduler **scheds = kmalloc_array(rdev->comp->num_cores, sizeof(scheds), GFP_KERNEL);
+	unsigned int core;
+	int ret;
+
+	for (core = 0; core < rdev->comp->num_cores; core++)
+		scheds[core] = &rdev->cores[core].sched;
+
+	ret = drm_sched_entity_init(&rocket_priv->sched_entity,
+				    DRM_SCHED_PRIORITY_NORMAL,
+				    scheds,
+				    3, NULL);
+	if (WARN_ON(ret))
+		return ret;
+
+	return 0;
+}
+
+void rocket_job_close(struct rocket_file_priv *rocket_priv)
+{
+	struct drm_sched_entity *entity = &rocket_priv->sched_entity;
+
+	kfree(entity->sched_list);
+	drm_sched_entity_destroy(entity);
+}
+
+int rocket_job_is_idle(struct rocket_device *rdev)
+{
+	unsigned int core;
+
+	for (core = 0; core < rdev->comp->num_cores; core++) {
+		/* If there are any jobs in any HW queue, we're not idle */
+		if (atomic_read(&rdev->cores[core].sched.credit_count))
+			return false;
+	}
+
+	return true;
+}
+
+static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file, struct drm_rocket_job *job)
+{
+	struct rocket_device *rdev = dev->dev_private;
+	struct rocket_file_priv *file_priv = file->driver_priv;
+	struct rocket_job *rjob = NULL;
+	int ret = 0;
+
+	if (job->task_count == 0)
+		return -EINVAL;
+
+	rjob = kzalloc(sizeof(*rjob), GFP_KERNEL);
+	if (!rjob)
+		return -ENOMEM;
+
+	kref_init(&rjob->refcount);
+
+	rjob->rdev = rdev;
+
+	ret = drm_sched_job_init(&rjob->base,
+				 &file_priv->sched_entity,
+				 1, NULL);
+	if (ret)
+		goto out_put_job;
+
+	ret = rocket_copy_tasks(dev, file, job, rjob);
+	if (ret)
+		goto out_cleanup_job;
+
+	ret = drm_gem_objects_lookup(file,
+				     (void __user *)(uintptr_t)job->in_bo_handles,
+				     job->in_bo_handle_count, &rjob->in_bos);
+	if (ret)
+		goto out_cleanup_job;
+
+	rjob->in_bo_count = job->in_bo_handle_count;
+
+	ret = drm_gem_objects_lookup(file,
+				     (void __user *)(uintptr_t)job->out_bo_handles,
+				     job->out_bo_handle_count, &rjob->out_bos);
+	if (ret)
+		goto out_cleanup_job;
+
+	rjob->out_bo_count = job->out_bo_handle_count;
+
+	ret = rocket_job_push(rjob);
+	if (ret)
+		goto out_cleanup_job;
+
+out_cleanup_job:
+	if (ret)
+		drm_sched_job_cleanup(&rjob->base);
+out_put_job:
+	rocket_job_put(rjob);
+
+	return ret;
+}
+
+int rocket_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_rocket_submit *args = data;
+	struct drm_rocket_job *jobs;
+	int ret = 0;
+	unsigned int i = 0;
+
+	jobs = kvmalloc_array(args->job_count, sizeof(*jobs), GFP_KERNEL);
+	if (!jobs) {
+		DRM_DEBUG("Failed to allocate incoming job array\n");
+		return -ENOMEM;
+	}
+
+	if (copy_from_user(jobs,
+			   (void __user *)(uintptr_t)args->jobs,
+			   args->job_count * sizeof(*jobs))) {
+		ret = -EFAULT;
+		DRM_DEBUG("Failed to copy incoming job array\n");
+		goto exit;
+	}
+
+	for (i = 0; i < args->job_count; i++)
+		rocket_ioctl_submit_job(dev, file, &jobs[i]);
+
+exit:
+	kfree(jobs);
+
+	return ret;
+}
diff --git a/drivers/accel/rocket/rocket_job.h b/drivers/accel/rocket/rocket_job.h
new file mode 100644
index 000000000000..0c3c90e47d39
--- /dev/null
+++ b/drivers/accel/rocket/rocket_job.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_JOB_H__
+#define __ROCKET_JOB_H__
+
+#include <drm/gpu_scheduler.h>
+#include <drm/drm_drv.h>
+
+#include "rocket_drv.h"
+#include "rocket_core.h"
+
+struct rocket_task {
+	u64 regcmd;
+	u32 regcmd_count;
+};
+
+struct rocket_job {
+	struct drm_sched_job base;
+
+	struct kref refcount;
+
+	struct rocket_device *rdev;
+
+	struct drm_gem_object **in_bos;
+	u32 in_bo_count;
+	struct drm_gem_object **out_bos;
+	u32 out_bo_count;
+
+	struct rocket_task *tasks;
+	u32 task_count;
+	u32 next_task_idx;
+
+	/** Fence to be signaled by drm-sched once its done with the job */
+	struct dma_fence *inference_done_fence;
+
+	/* Fence to be signaled by IRQ handler when the job is complete. */
+	struct dma_fence *done_fence;
+};
+
+int rocket_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file);
+
+int rocket_job_init(struct rocket_core *core);
+void rocket_job_fini(struct rocket_core *core);
+int rocket_job_open(struct rocket_file_priv *rocket_priv);
+void rocket_job_close(struct rocket_file_priv *rocket_priv);
+int rocket_job_is_idle(struct rocket_device *rdev);
+
+#endif
\ No newline at end of file
diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
index 8338726a83c3..888c9413e4cd 100644
--- a/include/uapi/drm/rocket_accel.h
+++ b/include/uapi/drm/rocket_accel.h
@@ -12,8 +12,10 @@ extern "C" {
 #endif
 
 #define DRM_ROCKET_CREATE_BO			0x00
+#define DRM_ROCKET_SUBMIT			0x01
 
 #define DRM_IOCTL_ROCKET_CREATE_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_ROCKET_CREATE_BO, struct drm_rocket_create_bo)
+#define DRM_IOCTL_ROCKET_SUBMIT			DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKET_SUBMIT, struct drm_rocket_submit)
 
 /**
  * struct drm_rocket_create_bo - ioctl argument for creating Rocket BOs.
@@ -36,6 +38,59 @@ struct drm_rocket_create_bo {
 	__u64 offset;
 };
 
+/**
+ * struct drm_rocket_task - A task to be run on the NPU
+ *
+ * A task is the smallest unit of work that can be run on the NPU.
+ */
+struct drm_rocket_task {
+       /** DMA address to NPU mapping of register command buffer */
+       __u64 regcmd;
+
+       /** Number of commands in the register command buffer */
+       __u32 regcmd_count;
+};
+
+/**
+ * struct drm_rocket_job - A job to be run on the NPU
+ *
+ * The kernel will schedule the execution of this job taking into account its
+ * dependencies with other jobs. All tasks in the same job will be executed
+ * sequentially on the same core, to benefit from memory residency in SRAM.
+ */
+struct drm_rocket_job {
+       /** Pointer to an array of struct drm_rocket_task. */
+       __u64 tasks;
+
+       /** Number of tasks passed in. */
+       __u32 task_count;
+
+       /** Pointer to a u32 array of the BOs that are read by the job. */
+       __u64 in_bo_handles;
+
+       /** Number of input BO handles passed in (size is that times 4). */
+       __u32 in_bo_handle_count;
+
+       /** Pointer to a u32 array of the BOs that are written to by the job. */
+       __u64 out_bo_handles;
+
+       /** Number of output BO handles passed in (size is that times 4). */
+       __u32 out_bo_handle_count;
+};
+
+/**
+ * struct drm_rocket_submit - ioctl argument for submitting commands to the NPU.
+ *
+ * The kernel will schedule the execution of these jobs in dependency order.
+ */
+struct drm_rocket_submit {
+       /** Pointer to an array of struct drm_rocket_job. */
+       __u64 jobs;
+
+       /** Number of jobs passed in. */
+       __u32 job_count;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.45.2

