Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 094357FBA69
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 13:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB9C10E500;
	Tue, 28 Nov 2023 12:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D310510E501
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 12:45:21 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8EF8C66072F6;
 Tue, 28 Nov 2023 12:45:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701175520;
 bh=0umlz4dwJlFJAduAl5HgGCXkRZH39+x3xG+dhKr/5F8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eyN+cG5cJVVdcP/q3DXImvfdulek8dh0KZFJElwOdS+pC4qdmj/qGptY3B1gX5hhf
 fpeI8eALk/5q6oksE3kf+s8ZwPhjOsTVVsaVhIiQSLb4ixghWAXyyMFxOG5rOYEkUZ
 wJbTO9yTAgkAnjHlRo6ltJ71PY/sJkuwUqIJ/eTYO1xXIXaO4HcYIPVYnF6o4wCxHH
 xnxdoz+rs+JB0APPKMzK2g1bDGvCmgDT5hyWmWnZBOEY0DM7lck/UClB93vmuHejls
 v3dTLSWdQq/YLJLm/sQew3tHHJUeEXBkXnVIb50KX7KG2d5rBuCt6OnxD4cCLs775m
 AQyYsNIrQCePQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH v2 3/3] drm/panfrost: Synchronize and disable interrupts
 before powering off
Date: Tue, 28 Nov 2023 13:45:10 +0100
Message-ID: <20231128124510.391007-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128124510.391007-1-angelogioacchino.delregno@collabora.com>
References: <20231128124510.391007-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, m.szyprowski@samsung.com, kernel@collabora.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To make sure that we don't unintentionally perform any unclocked and/or
unpowered R/W operation on GPU registers, before turning off clocks and
regulators we must make sure that no GPU, JOB or MMU ISR execution is
pending: doing that required to add a mechanism to synchronize the
interrupts on suspend.

Add functions panfrost_{gpu,job,mmu}_suspend_irq() which will perform
interrupts masking and ISR execution synchronization, and then call
those in the panfrost_device_runtime_suspend() handler in the exact
sequence of job (may require mmu!) -> mmu -> gpu.

As a side note, JOB and MMU suspend_irq functions needed some special
treatment: as their interrupt handlers will unmask interrupts, it was
necessary to add a bitmap for "is_suspending" which is used to address
the possible corner case of unintentional IRQ unmasking because of ISR
execution after a call to synchronize_irq().

Of course, unmasking the interrupts is being done as part of the reset
happening during runtime_resume(): since we're anyway resuming all of
GPU, JOB, MMU, the only additional action is to zero out the newly
introduced `is_suspending` bitmap directly in the resume handler, as
to avoid adding panfrost_{job,mmu}_resume_irq() function just for
clearing own bits, especially because it currently makes way more sense
to just zero out the bitmap.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c |  4 ++++
 drivers/gpu/drm/panfrost/panfrost_device.h |  7 +++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c    |  7 +++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h    |  1 +
 drivers/gpu/drm/panfrost/panfrost_job.c    | 18 +++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_job.h    |  1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c    | 17 ++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_mmu.h    |  1 +
 8 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index c90ad5ee34e7..ed34aa55a7da 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -407,6 +407,7 @@ static int panfrost_device_runtime_resume(struct device *dev)
 {
 	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 
+	bitmap_zero(pfdev->is_suspending, PANFROST_COMP_BIT_MAX);
 	panfrost_device_reset(pfdev);
 	panfrost_devfreq_resume(pfdev);
 
@@ -421,6 +422,9 @@ static int panfrost_device_runtime_suspend(struct device *dev)
 		return -EBUSY;
 
 	panfrost_devfreq_suspend(pfdev);
+	panfrost_job_suspend_irq(pfdev);
+	panfrost_mmu_suspend_irq(pfdev);
+	panfrost_gpu_suspend_irq(pfdev);
 	panfrost_gpu_power_off(pfdev);
 
 	return 0;
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 54a8aad54259..29f89f2d3679 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -25,6 +25,12 @@ struct panfrost_perfcnt;
 #define NUM_JOB_SLOTS 3
 #define MAX_PM_DOMAINS 5
 
+enum panfrost_drv_comp_bits {
+	PANFROST_COMP_BIT_MMU,
+	PANFROST_COMP_BIT_JOB,
+	PANFROST_COMP_BIT_MAX
+};
+
 /**
  * enum panfrost_gpu_pm - Supported kernel power management features
  * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
@@ -109,6 +115,7 @@ struct panfrost_device {
 
 	struct panfrost_features features;
 	const struct panfrost_compatible *comp;
+	DECLARE_BITMAP(is_suspending, PANFROST_COMP_BIT_MAX);
 
 	spinlock_t as_lock;
 	unsigned long as_in_use_mask;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 7adc4441fa14..2bf645993ab4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -452,6 +452,13 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
 		dev_err(pfdev->dev, "l2 power transition timeout");
 }
 
+void panfrost_gpu_suspend_irq(struct panfrost_device *pfdev)
+{
+	gpu_write(pfdev, GPU_INT_MASK, 0);
+	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
+	synchronize_irq(pfdev->gpu_irq);
+}
+
 int panfrost_gpu_init(struct panfrost_device *pfdev)
 {
 	int err;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
index 876fdad9f721..d841b86504ea 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
@@ -15,6 +15,7 @@ u32 panfrost_gpu_get_latest_flush_id(struct panfrost_device *pfdev);
 int panfrost_gpu_soft_reset(struct panfrost_device *pfdev);
 void panfrost_gpu_power_on(struct panfrost_device *pfdev);
 void panfrost_gpu_power_off(struct panfrost_device *pfdev);
+void panfrost_gpu_suspend_irq(struct panfrost_device *pfdev);
 
 void panfrost_cycle_counter_get(struct panfrost_device *pfdev);
 void panfrost_cycle_counter_put(struct panfrost_device *pfdev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index f9446e197428..e8de44cc56e2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -413,6 +413,14 @@ void panfrost_job_enable_interrupts(struct panfrost_device *pfdev)
 	job_write(pfdev, JOB_INT_MASK, irq_mask);
 }
 
+void panfrost_job_suspend_irq(struct panfrost_device *pfdev)
+{
+	set_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspending);
+
+	job_write(pfdev, JOB_INT_MASK, 0);
+	synchronize_irq(pfdev->js->irq);
+}
+
 static void panfrost_job_handle_err(struct panfrost_device *pfdev,
 				    struct panfrost_job *job,
 				    unsigned int js)
@@ -792,9 +800,13 @@ static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
 	struct panfrost_device *pfdev = data;
 
 	panfrost_job_handle_irqs(pfdev);
-	job_write(pfdev, JOB_INT_MASK,
-		  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
-		  GENMASK(NUM_JOB_SLOTS - 1, 0));
+
+	/* Enable interrupts only if we're not about to get suspended */
+	if (!test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspending))
+		job_write(pfdev, JOB_INT_MASK,
+			  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
+			  GENMASK(NUM_JOB_SLOTS - 1, 0));
+
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index 17ff808dba07..ec581b97852b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -47,6 +47,7 @@ int panfrost_job_get_slot(struct panfrost_job *job);
 int panfrost_job_push(struct panfrost_job *job);
 void panfrost_job_put(struct panfrost_job *job);
 void panfrost_job_enable_interrupts(struct panfrost_device *pfdev);
+void panfrost_job_suspend_irq(struct panfrost_device *pfdev);
 int panfrost_job_is_idle(struct panfrost_device *pfdev);
 
 #endif
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index ac4296c1e54b..6ccf0a65b8fb 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -744,9 +744,12 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
 			status = mmu_read(pfdev, MMU_INT_RAWSTAT) & ~pfdev->as_faulty_mask;
 	}
 
-	spin_lock(&pfdev->as_lock);
-	mmu_write(pfdev, MMU_INT_MASK, ~pfdev->as_faulty_mask);
-	spin_unlock(&pfdev->as_lock);
+	/* Enable interrupts only if we're not about to get suspended */
+	if (!test_bit(PANFROST_COMP_BIT_MMU, pfdev->is_suspending)) {
+		spin_lock(&pfdev->as_lock);
+		mmu_write(pfdev, MMU_INT_MASK, ~pfdev->as_faulty_mask);
+		spin_unlock(&pfdev->as_lock);
+	}
 
 	return IRQ_HANDLED;
 };
@@ -777,3 +780,11 @@ void panfrost_mmu_fini(struct panfrost_device *pfdev)
 {
 	mmu_write(pfdev, MMU_INT_MASK, 0);
 }
+
+void panfrost_mmu_suspend_irq(struct panfrost_device *pfdev)
+{
+	set_bit(PANFROST_COMP_BIT_MMU, pfdev->is_suspending);
+
+	mmu_write(pfdev, MMU_INT_MASK, 0);
+	synchronize_irq(pfdev->mmu_irq);
+}
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.h b/drivers/gpu/drm/panfrost/panfrost_mmu.h
index cc2a0d307feb..022a9a74a114 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.h
@@ -14,6 +14,7 @@ void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping);
 int panfrost_mmu_init(struct panfrost_device *pfdev);
 void panfrost_mmu_fini(struct panfrost_device *pfdev);
 void panfrost_mmu_reset(struct panfrost_device *pfdev);
+void panfrost_mmu_suspend_irq(struct panfrost_device *pfdev);
 
 u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu);
 void panfrost_mmu_as_put(struct panfrost_device *pfdev, struct panfrost_mmu *mmu);
-- 
2.42.0

