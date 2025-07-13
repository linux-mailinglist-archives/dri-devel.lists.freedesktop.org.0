Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55EEB03002
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 10:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728D510E33A;
	Sun, 13 Jul 2025 08:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943B010E15B
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 08:39:09 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ae3a604b43bso571364266b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 01:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752395948; x=1753000748;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kBGRDznpb0wOo/xgDmz5fOUJlykTB24qcjb4PdjhH38=;
 b=xGeDbbWjFrX3ptQ40GUMWYwcnLKZU7IHAzBfy5m/+gazF2tM4CVUit3Q5qv6x1p00t
 EeH1iA2wbXV4CjzaGT1ddHHIs3kqrs9IFUDsEocgvsmh7dkt1UcVpeSBGnhKV/YP8Jq2
 RLaGrd27SQjdfhoQBMfSjVLdc9fWYLtRC53VQCDl/B5gFPfi4qc4xs1C1hhn65Zja8Ow
 0p50zfvzQmPGq08V4iRMZ8X2GvwwIUWV7TZNfcQ+MtDOqxRr3/ftmldsgBko1s59ncw+
 yEDeEHJBCIXLnU0VWqMmyKm5stMTTQyVpiNY/93DU9orA2MfiZVV9V+SN/nnXTP/BAUc
 07Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOnn6gevfrhWPUvtcH4yAxsDacm1TJOHNDIRsljvPSJZ36GTkAYZaKyHt7ltaOKEBK+r3DNzz3RCc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeZJmuc9tsj1cRy92sIbtQnFx/6sPmO4xvpo/A/vKnkkrjxryx
 DmSCpOMUxrxNiKwnYJW8PKKqKg7ANoX/ATNjcUOJ50kk2e6zikOKU82O
X-Gm-Gg: ASbGncuxFLfIR5uUspWHanus2r4pmDOCS4Dy2eVXpoJ+z7zP1o8fGjwFzko6iUaZc9v
 mxL7U/CzZ0XZRigiBzj6gXKsKfmqvOsV3N3KzHp5Lz3XADdY8YROYGZG7LwWNMp+ngaapktcYLV
 /LOW97UpMM64dyfS2lddKGIOgBi6e0kaX+Vxe/u2P1ESJqXZg+vckb4veMHJ/S6YmROxpVtlmjx
 xTj2x3XwMSubF70Fq36Zyya2ytdR4xSYcRTzUA1y1hIR9TeyeEC6oCmsHcffb7+ufY6ngJnlZFk
 ad73kWf2prf+2/kHQ6d2C/Jt/BY6eYGCEk3WygMMsoSxTgBEiIc5Zgpl4MoF/oyL+LzhwDAumV2
 elcah3rYXalqs81ch2a5IxSvEUd/fmUW/wRYAyj7hV/V2fXKG56hwoM4TSshnMcDQNws=
X-Google-Smtp-Source: AGHT+IEZxBws0sLHG92GF8BoRY+YUlBsVH3Kd7eT65zsSo8XbIiqrEUCe5gmsiw9sATgN7iDn9wDbA==
X-Received: by 2002:a17:907:b816:b0:ae3:c767:da11 with SMTP id
 a640c23a62f3a-ae6fc0f31eamr763525766b.50.1752395947642; 
 Sun, 13 Jul 2025 01:39:07 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 01:39:07 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 13 Jul 2025 10:38:54 +0200
Subject: [PATCH v8 04/10] accel/rocket: Add job submission IOCTL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-6-10-rocket-v8-4-64fa3115e910@tomeuvizoso.net>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
In-Reply-To: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
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

The job submission code was initially based on Panfrost.

v2:
- Remove hardcoded number of cores
- Misc. style fixes (Jeffrey Hugo)
- Repack IOCTL struct (Jeffrey Hugo)

v3:
- Adapt to a split of the register block in the DT bindings (Nicolas
  Frattaroli)
- Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
- Use drm_* logging functions (Thomas Zimmermann)
- Rename reg i/o macros (Thomas Zimmermann)
- Add padding to ioctls and check for zero (Jeff Hugo)
- Improve error handling (Nicolas Frattaroli)

v6:
- Use mutexes guard (Markus Elfring)
- Use u64_to_user_ptr (Jeff Hugo)
- Drop rocket_fence (Rob Herring)

v7:
- Assign its own IOMMU domain to each client, for isolation (Daniel
  Stone and Robin Murphy)

v8:
- Use reset lines to reset the cores (Robin Murphy)
- Use the macros to compute the values for the bitfields (Robin Murphy)
- More descriptive name for the IRQ (Robin Murphy)
- Simplify job interrupt handing (Robin Murphy)
- Correctly acquire a reference to the IOMMU (Robin Murphy)
- Specify the size of the embedded structs in the IOCTLs for future
  extensibility (Rob Herring)
- Expose only 32 bits for the address of the regcmd BO (Robin Murphy)

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/rocket/Makefile        |   3 +-
 drivers/accel/rocket/rocket_core.c   |  10 +
 drivers/accel/rocket/rocket_core.h   |  15 +
 drivers/accel/rocket/rocket_device.c |   4 +
 drivers/accel/rocket/rocket_device.h |   2 +
 drivers/accel/rocket/rocket_drv.c    |  14 +
 drivers/accel/rocket/rocket_drv.h    |   3 +
 drivers/accel/rocket/rocket_job.c    | 636 +++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_job.h    |  52 +++
 include/uapi/drm/rocket_accel.h      |  64 ++++
 10 files changed, 802 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
index 4deef267f9e1238c4d8bd108dcc8afd9dc8b2b8f..3713dfe223d6ec6293ced3ef9291af2f3d144131 100644
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
index 9be964b5fbaef31f9b283b8da6fe15e6c540e916..72fb5e5798fac8d01f351f16a1da0539f042d02e 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -12,6 +12,7 @@
 #include <linux/reset.h>
 
 #include "rocket_core.h"
+#include "rocket_job.h"
 
 int rocket_core_init(struct rocket_core *core)
 {
@@ -57,6 +58,10 @@ int rocket_core_init(struct rocket_core *core)
 
 	core->iommu_group = iommu_group_get(dev);
 
+	err = rocket_job_init(core);
+	if (err)
+		return err;
+
 	pm_runtime_use_autosuspend(dev);
 
 	/*
@@ -70,6 +75,10 @@ int rocket_core_init(struct rocket_core *core)
 	pm_runtime_enable(dev);
 
 	err = pm_runtime_get_sync(dev);
+	if (err) {
+		rocket_job_fini(core);
+		return err;
+	}
 
 	version = rocket_pc_readl(core, VERSION);
 	version += rocket_pc_readl(core, VERSION_NUM) & 0xffff;
@@ -88,6 +97,7 @@ void rocket_core_fini(struct rocket_core *core)
 	pm_runtime_disable(core->dev);
 	iommu_group_put(core->iommu_group);
 	core->iommu_group = NULL;
+	rocket_job_fini(core);
 }
 
 void rocket_core_reset(struct rocket_core *core)
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index 660de2d70f7d9294bc4db8b235b3796941136307..f6d7382854ca9eaf53971fe70a1b5341b73bb76e 100644
--- a/drivers/accel/rocket/rocket_core.h
+++ b/drivers/accel/rocket/rocket_core.h
@@ -40,6 +40,21 @@ struct rocket_core {
 	struct reset_control_bulk_data resets[2];
 
 	struct iommu_group *iommu_group;
+
+	struct mutex job_lock;
+	struct rocket_job *in_flight_job;
+
+	spinlock_t fence_lock;
+
+	struct {
+		struct workqueue_struct *wq;
+		struct work_struct work;
+		atomic_t pending;
+	} reset;
+
+	struct drm_gpu_scheduler sched;
+	u64 fence_context;
+	u64 emit_seqno;
 };
 
 int rocket_core_init(struct rocket_core *core);
diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
index b05a0df91d48385ce4ada22137842b3e819f8266..46e6ee1e72c5f23048ef631b7cc0fe8cb4349f46 100644
--- a/drivers/accel/rocket/rocket_device.c
+++ b/drivers/accel/rocket/rocket_device.c
@@ -41,6 +41,10 @@ struct rocket_device *rocket_device_init(struct platform_device *pdev,
 	if (err)
 		return ERR_PTR(err);
 
+	err = devm_mutex_init(dev, &rdev->sched_lock);
+	if (err)
+		return ERR_PTR(-ENOMEM);
+
 	err = drm_dev_register(ddev, 0);
 	if (err)
 		return ERR_PTR(err);
diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
index a5a5857bb1991161ebfbdcbffacd75bbb579c572..ce662abc01d3d1c384d3c4bc2f0ded5400b57c7f 100644
--- a/drivers/accel/rocket/rocket_device.h
+++ b/drivers/accel/rocket/rocket_device.h
@@ -15,6 +15,8 @@
 struct rocket_device {
 	struct drm_device ddev;
 
+	struct mutex sched_lock;
+
 	struct rocket_core *cores;
 	unsigned int num_cores;
 };
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 8b7fbe9226f424b69d409e47b58651cba8c42bcf..a21aa9aa189ba585c70fbf57d2a41fb578357efd 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -15,6 +15,7 @@
 
 #include "rocket_drv.h"
 #include "rocket_gem.h"
+#include "rocket_job.h"
 
 /*
  * Facade device, used to expose a single DRM device to userspace, that
@@ -97,8 +98,16 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
 	drm_mm_init(&rocket_priv->mm, start, end - start + 1);
 	mutex_init(&rocket_priv->mm_lock);
 
+	ret = rocket_job_open(rocket_priv);
+	if (ret)
+		goto err_mm_takedown;
+
 	return 0;
 
+err_mm_takedown:
+	mutex_destroy(&rocket_priv->mm_lock);
+	drm_mm_takedown(&rocket_priv->mm);
+	rocket_iommu_domain_put(rocket_priv->domain);
 err_free:
 	kfree(rocket_priv);
 err_put_mod:
@@ -111,6 +120,7 @@ rocket_postclose(struct drm_device *dev, struct drm_file *file)
 {
 	struct rocket_file_priv *rocket_priv = file->driver_priv;
 
+	rocket_job_close(rocket_priv);
 	mutex_destroy(&rocket_priv->mm_lock);
 	drm_mm_takedown(&rocket_priv->mm);
 	rocket_iommu_domain_put(rocket_priv->domain);
@@ -123,6 +133,7 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
 
 	ROCKET_IOCTL(CREATE_BO, create_bo),
+	ROCKET_IOCTL(SUBMIT, submit),
 };
 
 DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
@@ -230,6 +241,9 @@ static int rocket_device_runtime_suspend(struct device *dev)
 	if (core < 0)
 		return -ENODEV;
 
+	if (!rocket_job_is_idle(&rdev->cores[core]))
+		return -EBUSY;
+
 	clk_bulk_disable_unprepare(ARRAY_SIZE(rdev->cores[core].clks), rdev->cores[core].clks);
 
 	return 0;
diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
index 2944e0136ab991da61fb8f66f7e9c1ba214878a6..f50634935b605c542cce16a2b91c1e43ec16bc81 100644
--- a/drivers/accel/rocket/rocket_drv.h
+++ b/drivers/accel/rocket/rocket_drv.h
@@ -5,6 +5,7 @@
 #define __ROCKET_DRV_H__
 
 #include <drm/drm_mm.h>
+#include <drm/gpu_scheduler.h>
 
 #include "rocket_device.h"
 
@@ -19,6 +20,8 @@ struct rocket_file_priv {
 	struct rocket_iommu_domain *domain;
 	struct drm_mm mm;
 	struct mutex mm_lock;
+
+	struct drm_sched_entity sched_entity;
 };
 
 struct rocket_iommu_domain *rocket_iommu_domain_get(struct rocket_file_priv *rocket_priv);
diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
new file mode 100644
index 0000000000000000000000000000000000000000..e731da15ebffca12e74035d2739a666a8e02d747
--- /dev/null
+++ b/drivers/accel/rocket/rocket_job.c
@@ -0,0 +1,636 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
+/* Copyright 2019 Collabora ltd. */
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include <drm/drm_print.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/rocket_accel.h>
+#include <linux/interrupt.h>
+#include <linux/iommu.h>
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
+static struct rocket_job *
+to_rocket_job(struct drm_sched_job *sched_job)
+{
+	return container_of(sched_job, struct rocket_job, base);
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
+	struct dma_fence *fence;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence)
+		return ERR_PTR(-ENOMEM);
+
+	dma_fence_init(fence, &rocket_fence_ops, &core->fence_lock,
+		       core->fence_context, ++core->emit_seqno);
+
+	return fence;
+}
+
+static int
+rocket_copy_tasks(struct drm_device *dev,
+		  struct drm_file *file_priv,
+		  struct drm_rocket_job *job,
+		  struct rocket_job *rjob)
+{
+	int ret = 0;
+
+	if (job->task_struct_size < sizeof(struct drm_rocket_task))
+		return -EINVAL;
+
+	rjob->task_count = job->task_count;
+
+	if (!rjob->task_count)
+		return 0;
+
+	rjob->tasks = kvmalloc_array(job->task_count, sizeof(*rjob->tasks), GFP_KERNEL);
+	if (!rjob->tasks) {
+		drm_dbg(dev, "Failed to allocate task array\n");
+		return -ENOMEM;
+	}
+
+	for (int i = 0; i < rjob->task_count; i++) {
+		struct drm_rocket_task task = {0};
+
+		if (copy_from_user(&task,
+				   u64_to_user_ptr(job->tasks) + i * job->task_struct_size,
+				   sizeof(task))) {
+			drm_dbg(dev, "Failed to copy incoming tasks\n");
+			ret = -EFAULT;
+			goto fail;
+		}
+
+		if (task.regcmd_count == 0) {
+			drm_dbg(dev, "regcmd_count field in drm_rocket_task should be > 0.\n");
+			ret = -EINVAL;
+			goto fail;
+		}
+
+		rjob->tasks[i].regcmd = task.regcmd;
+		rjob->tasks[i].regcmd_count = task.regcmd_count;
+	}
+
+	return 0;
+
+fail:
+	kvfree(rjob->tasks);
+	return ret;
+}
+
+static void rocket_job_hw_submit(struct rocket_core *core, struct rocket_job *job)
+{
+	struct rocket_task *task;
+	unsigned int extra_bit;
+
+	/* Don't queue the job if a reset is in progress */
+	if (atomic_read(&core->reset.pending))
+		return;
+
+	/* GO ! */
+
+	task = &job->tasks[job->next_task_idx];
+	job->next_task_idx++;
+
+	rocket_pc_writel(core, BASE_ADDRESS, 0x1);
+
+	 /* From rknpu, in the TRM this bit is marked as reserved */
+	extra_bit = 0x10000000 * core->index;
+	rocket_cna_writel(core, S_POINTER, CNA_S_POINTER_POINTER_PP_EN(1) |
+					   CNA_S_POINTER_EXECUTER_PP_EN(1) |
+					   CNA_S_POINTER_POINTER_PP_MODE(1) |
+					   extra_bit);
+
+	rocket_core_writel(core, S_POINTER, CORE_S_POINTER_POINTER_PP_EN(1) |
+					    CORE_S_POINTER_EXECUTER_PP_EN(1) |
+					    CORE_S_POINTER_POINTER_PP_MODE(1) |
+					    extra_bit);
+
+	rocket_pc_writel(core, BASE_ADDRESS, task->regcmd);
+	rocket_pc_writel(core, REGISTER_AMOUNTS,
+			 PC_REGISTER_AMOUNTS_PC_DATA_AMOUNT((task->regcmd_count + 1) / 2 - 1));
+
+	rocket_pc_writel(core, INTERRUPT_MASK, PC_INTERRUPT_MASK_DPU_0 | PC_INTERRUPT_MASK_DPU_1);
+	rocket_pc_writel(core, INTERRUPT_CLEAR, PC_INTERRUPT_CLEAR_DPU_0 | PC_INTERRUPT_CLEAR_DPU_1);
+
+	rocket_pc_writel(core, TASK_CON, PC_TASK_CON_RESERVED_0(1) |
+					 PC_TASK_CON_TASK_COUNT_CLEAR(1) |
+					 PC_TASK_CON_TASK_NUMBER(1) |
+					 PC_TASK_CON_TASK_PP_EN(1));
+
+	rocket_pc_writel(core, TASK_DMA_BASE_ADDR, PC_TASK_DMA_BASE_ADDR_DMA_BASE_ADDR(0x0));
+
+	rocket_pc_writel(core, OPERATION_ENABLE, PC_OPERATION_ENABLE_OP_EN(1));
+
+	dev_dbg(core->dev, "Submitted regcmd at 0x%llx to core %d", task->regcmd, core->index);
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
+					int bo_count,
+					struct dma_fence *fence)
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
+	bos = kvmalloc_array(job->in_bo_count + job->out_bo_count, sizeof(void *),
+			     GFP_KERNEL);
+	memcpy(bos, job->in_bos, job->in_bo_count * sizeof(void *));
+	memcpy(&bos[job->in_bo_count], job->out_bos, job->out_bo_count * sizeof(void *));
+
+	ret = drm_gem_lock_reservations(bos, job->in_bo_count + job->out_bo_count, &acquire_ctx);
+	if (ret)
+		goto err;
+
+	scoped_guard(mutex, &rdev->sched_lock) {
+		drm_sched_job_arm(&job->base);
+
+		job->inference_done_fence = dma_fence_get(&job->base.s_fence->finished);
+
+		ret = rocket_acquire_object_fences(job->in_bos, job->in_bo_count, &job->base, false);
+		if (ret)
+			goto err_unlock;
+
+		ret = rocket_acquire_object_fences(job->out_bos, job->out_bo_count, &job->base, true);
+		if (ret)
+			goto err_unlock;
+
+		kref_get(&job->refcount); /* put by scheduler job completion */
+
+		drm_sched_entity_push_job(&job->base);
+	}
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
+	rocket_iommu_domain_put(job->domain);
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
+	kvfree(job->tasks);
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
+static struct rocket_core *sched_to_core(struct rocket_device *rdev,
+					 struct drm_gpu_scheduler *sched)
+{
+	unsigned int core;
+
+	for (core = 0; core < rdev->num_cores; core++) {
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
+	/*
+	 * Nothing to execute: can happen if the job has finished while
+	 * we were resetting the NPU.
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
+	ret = pm_runtime_get_sync(core->dev);
+	if (ret < 0)
+		return fence;
+
+	ret = iommu_attach_group(job->domain->domain, core->iommu_group);
+	if (ret < 0)
+		return fence;
+
+	scoped_guard(mutex, &core->job_lock) {
+		core->in_flight_job = job;
+		rocket_job_hw_submit(core, job);
+	}
+
+	return fence;
+}
+
+static void rocket_job_handle_irq(struct rocket_core *core)
+{
+	pm_runtime_mark_last_busy(core->dev);
+
+	rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
+	rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
+
+	scoped_guard(mutex, &core->job_lock)
+		if (core->in_flight_job) {
+			if (core->in_flight_job->next_task_idx < core->in_flight_job->task_count) {
+				rocket_job_hw_submit(core, core->in_flight_job);
+				return;
+			}
+
+			iommu_detach_group(NULL, iommu_group_get(core->dev));
+			dma_fence_signal(core->in_flight_job->done_fence);
+			pm_runtime_put_autosuspend(core->dev);
+			core->in_flight_job = NULL;
+		}
+}
+
+static void
+rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
+{
+	if (!atomic_read(&core->reset.pending))
+		return;
+
+	drm_sched_stop(&core->sched, bad);
+
+	/*
+	 * Remaining interrupts have been handled, but we might still have
+	 * stuck jobs. Let's make sure the PM counters stay balanced by
+	 * manually calling pm_runtime_put_noidle().
+	 */
+	scoped_guard(mutex, &core->job_lock) {
+		if (core->in_flight_job)
+			pm_runtime_put_noidle(core->dev);
+
+		iommu_detach_group(NULL, core->iommu_group);
+
+		core->in_flight_job = NULL;
+	}
+
+	/* Proceed with reset now. */
+	rocket_core_reset(core);
+
+	/* NPU has been reset, we can clear the reset pending bit. */
+	atomic_set(&core->reset.pending, 0);
+
+	/* Restart the scheduler */
+	drm_sched_start(&core->sched, 0);
+}
+
+static enum drm_gpu_sched_stat rocket_job_timedout(struct drm_sched_job *sched_job)
+{
+	struct rocket_job *job = to_rocket_job(sched_job);
+	struct rocket_device *rdev = job->rdev;
+	struct rocket_core *core = sched_to_core(rdev, sched_job->sched);
+
+	dev_err(core->dev, "NPU job timed out");
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
+	u32 raw_status = rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
+
+	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
+	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
+
+	if (!(raw_status & PC_INTERRUPT_RAW_STATUS_DPU_0 ||
+	      raw_status & PC_INTERRUPT_RAW_STATUS_DPU_1))
+		return IRQ_NONE;
+
+	rocket_pc_writel(core, INTERRUPT_MASK, 0x0);
+
+	return IRQ_WAKE_THREAD;
+}
+
+int rocket_job_init(struct rocket_core *core)
+{
+	struct drm_sched_init_args args = {
+		.ops = &rocket_sched_ops,
+		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
+		.credit_limit = 1,
+		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
+		.name = dev_name(core->dev),
+		.dev = core->dev,
+	};
+	int ret;
+
+	INIT_WORK(&core->reset.work, rocket_reset_work);
+	spin_lock_init(&core->fence_lock);
+	mutex_init(&core->job_lock);
+
+	core->irq = platform_get_irq(to_platform_device(core->dev), 0);
+	if (core->irq < 0)
+		return core->irq;
+
+	ret = devm_request_threaded_irq(core->dev, core->irq,
+					rocket_job_irq_handler,
+					rocket_job_irq_handler_thread,
+					IRQF_SHARED, dev_name(core->dev),
+					core);
+	if (ret) {
+		dev_err(core->dev, "failed to request job irq");
+		return ret;
+	}
+
+	core->reset.wq = alloc_ordered_workqueue("rocket-reset-%d", 0, core->index);
+	if (!core->reset.wq)
+		return -ENOMEM;
+
+	core->fence_context = dma_fence_context_alloc(1);
+
+	args.timeout_wq = core->reset.wq;
+	ret = drm_sched_init(&core->sched, &args);
+	if (ret) {
+		dev_err(core->dev, "Failed to create scheduler: %d.", ret);
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
+	struct drm_gpu_scheduler **scheds = kmalloc_array(rdev->num_cores, sizeof(scheds),
+							  GFP_KERNEL);
+	unsigned int core;
+	int ret;
+
+	for (core = 0; core < rdev->num_cores; core++)
+		scheds[core] = &rdev->cores[core].sched;
+
+	ret = drm_sched_entity_init(&rocket_priv->sched_entity,
+				    DRM_SCHED_PRIORITY_NORMAL,
+				    scheds,
+				    rdev->num_cores, NULL);
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
+int rocket_job_is_idle(struct rocket_core *core)
+{
+	/* If there are any jobs in this HW queue, we're not idle */
+	if (atomic_read(&core->sched.credit_count))
+		return false;
+
+	return true;
+}
+
+static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file,
+				   struct drm_rocket_job *job)
+{
+	struct rocket_device *rdev = to_rocket_device(dev);
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
+	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->in_bo_handles),
+				     job->in_bo_handle_count, &rjob->in_bos);
+	if (ret)
+		goto out_cleanup_job;
+
+	rjob->in_bo_count = job->in_bo_handle_count;
+
+	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->out_bo_handles),
+				     job->out_bo_handle_count, &rjob->out_bos);
+	if (ret)
+		goto out_cleanup_job;
+
+	rjob->out_bo_count = job->out_bo_handle_count;
+
+	rjob->domain = rocket_iommu_domain_get(file_priv);
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
+	if (args->job_count == 0)
+		return 0;
+
+	if (args->job_struct_size < sizeof(struct drm_rocket_job)) {
+		drm_dbg(dev, "job_struct_size field in drm_rocket_submit struct is too small.\n");
+		return -EINVAL;
+	}
+
+	if (args->reserved != 0) {
+		drm_dbg(dev, "Reserved field in drm_rocket_submit struct should be 0.\n");
+		return -EINVAL;
+	}
+
+	jobs = kvmalloc_array(args->job_count, sizeof(*jobs), GFP_KERNEL);
+	if (!jobs) {
+		drm_dbg(dev, "Failed to allocate incoming job array\n");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < args->job_count; i++) {
+		if (copy_from_user(&jobs[i],
+				   u64_to_user_ptr(args->jobs) + i * args->job_struct_size,
+				   sizeof(*jobs))) {
+			ret = -EFAULT;
+			drm_dbg(dev, "Failed to copy incoming job array\n");
+			goto exit;
+		}
+	}
+
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
index 0000000000000000000000000000000000000000..4ae00feec3b939a592b99ee6c32854f788acd395
--- /dev/null
+++ b/drivers/accel/rocket/rocket_job.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_JOB_H__
+#define __ROCKET_JOB_H__
+
+#include <drm/drm_drv.h>
+#include <drm/gpu_scheduler.h>
+
+#include "rocket_core.h"
+#include "rocket_drv.h"
+
+struct rocket_task {
+	u64 regcmd;
+	u32 regcmd_count;
+};
+
+struct rocket_job {
+	struct drm_sched_job base;
+
+	struct rocket_device *rdev;
+
+	struct drm_gem_object **in_bos;
+	struct drm_gem_object **out_bos;
+
+	u32 in_bo_count;
+	u32 out_bo_count;
+
+	struct rocket_task *tasks;
+	u32 task_count;
+	u32 next_task_idx;
+
+	/* Fence to be signaled by drm-sched once its done with the job */
+	struct dma_fence *inference_done_fence;
+
+	/* Fence to be signaled by IRQ handler when the job is complete. */
+	struct dma_fence *done_fence;
+
+	struct rocket_iommu_domain *domain;
+
+	struct kref refcount;
+};
+
+int rocket_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file);
+
+int rocket_job_init(struct rocket_core *core);
+void rocket_job_fini(struct rocket_core *core);
+int rocket_job_open(struct rocket_file_priv *rocket_priv);
+void rocket_job_close(struct rocket_file_priv *rocket_priv);
+int rocket_job_is_idle(struct rocket_core *core);
+
+#endif
diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
index 95720702b7c4413d72b89c1f0f59abb22dc8c6b3..374f8370ac9df6944fdb6ef06e56f15226e072ba 100644
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
@@ -37,6 +39,68 @@ struct drm_rocket_create_bo {
 	__u64 offset;
 };
 
+/**
+ * struct drm_rocket_task - A task to be run on the NPU
+ *
+ * A task is the smallest unit of work that can be run on the NPU.
+ */
+struct drm_rocket_task {
+	/** Input: DMA address to NPU mapping of register command buffer */
+	__u32 regcmd;
+
+	/** Input: Number of commands in the register command buffer */
+	__u32 regcmd_count;
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
+	/** Input: Pointer to an array of struct drm_rocket_task. */
+	__u64 tasks;
+
+	/** Input: Pointer to a u32 array of the BOs that are read by the job. */
+	__u64 in_bo_handles;
+
+	/** Input: Pointer to a u32 array of the BOs that are written to by the job. */
+	__u64 out_bo_handles;
+
+	/** Input: Number of tasks passed in. */
+	__u32 task_count;
+
+	/** Input: Size in bytes of the structs in the @tasks field. */
+	__u32 task_struct_size;
+
+	/** Input: Number of input BO handles passed in (size is that times 4). */
+	__u32 in_bo_handle_count;
+
+	/** Input: Number of output BO handles passed in (size is that times 4). */
+	__u32 out_bo_handle_count;
+};
+
+/**
+ * struct drm_rocket_submit - ioctl argument for submitting commands to the NPU.
+ *
+ * The kernel will schedule the execution of these jobs in dependency order.
+ */
+struct drm_rocket_submit {
+	/** Input: Pointer to an array of struct drm_rocket_job. */
+	__u64 jobs;
+
+	/** Input: Number of jobs passed in. */
+	__u32 job_count;
+
+	/** Input: Size in bytes of the structs in the @jobs field. */
+	__u32 job_struct_size;
+
+	/** Reserved, must be zero. */
+	__u64 reserved;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.50.0

