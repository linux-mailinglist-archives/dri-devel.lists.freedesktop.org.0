Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B10C1792D91
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 20:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC6B10E1A7;
	Tue,  5 Sep 2023 18:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E3110E2E9;
 Tue,  5 Sep 2023 18:45:46 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A4F36660725E;
 Tue,  5 Sep 2023 19:45:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693939544;
 bh=T0w/9ewtGaSWFKXNKJjvPNLeGF3c6rlMCZOOwei27ac=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fKWc2FrDs195RFkGo1XHWwPKlwIxs1Tnoex74M1zYAWh2kptEVsSKvvTMx3LqGGNg
 vU89h7tUm31YrrPaGmbqvJ+tQ89x2bog8QB00CAaNxu7nyNNkhiN/wQJLuo1Ll6V0O
 4G9qBbIgcnIFAPm4p6rzI9WLQxt1cq9RnypvuxRoX57Ua2GDFfyg6s+pswC0AUsCQ8
 T86rSVf3R9u8Q8hFLK36FAEwhfKeuHNVlQMjf1Y+Ix6RgbZT+fhUw9K+Gk8/wWrClZ
 P2gJKzaaHPWLrwCog78L1aQ8LWYYNBI0PDYylm8i6N1t6+STz/zNtrXSkBrrDqvaKk
 aJ7++Zmov1COQ==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
Subject: [PATCH v3 2/8] drm/panfrost: Enable cycle counter register upon job
 submission
Date: Tue,  5 Sep 2023 19:45:18 +0100
Message-ID: <20230905184533.959171-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230905184533.959171-1-adrian.larumbe@collabora.com>
References: <20230905184533.959171-1-adrian.larumbe@collabora.com>
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
Cc: linux-arm-msm@vger.kernel.org, adrian.larumbe@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 healych@amazon.com, kernel@collabora.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In a future development, we will want to keep track of the number of GPU
cycles spent on a given job. That means we should enable it only when the
GPU has work to do, and switch it off whenever it is idle to avoid power
waste.

To avoid race conditions during enablement/disabling, a reference counting
mechanism was introduced, and a job flag that tells us whether a given job
increased the refcount. This is necessary, because a future development
will let user space toggle cycle counting through a debugfs file, and a
given job might have been in flight by the time cycle counting was
disabled.

Toggling of GPU cycle counting has to be done through a module parameter.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c |  5 +++
 drivers/gpu/drm/panfrost/panfrost_device.h |  6 +++
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 43 ++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h    |  6 +++
 drivers/gpu/drm/panfrost/panfrost_job.c    | 10 +++++
 drivers/gpu/drm/panfrost/panfrost_job.h    |  1 +
 6 files changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index fa1a086a862b..1ea2ac3804f0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -18,6 +18,9 @@
 #include "panfrost_mmu.h"
 #include "panfrost_perfcnt.h"
 
+static bool profile;
+module_param(profile, bool, 0600);
+
 static int panfrost_reset_init(struct panfrost_device *pfdev)
 {
 	pfdev->rstc = devm_reset_control_array_get_optional_exclusive(pfdev->dev);
@@ -207,6 +210,8 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 
 	spin_lock_init(&pfdev->as_lock);
 
+	atomic_set(&pfdev->profile_mode, profile);
+
 	err = panfrost_clk_init(pfdev);
 	if (err) {
 		dev_err(pfdev->dev, "clk init failed %d\n", err);
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index b0126b9fbadc..5c09c9f3ae08 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -107,6 +107,7 @@ struct panfrost_device {
 	struct list_head scheduled_jobs;
 
 	struct panfrost_perfcnt *perfcnt;
+	atomic_t profile_mode;
 
 	struct mutex sched_lock;
 
@@ -121,6 +122,11 @@ struct panfrost_device {
 	struct shrinker shrinker;
 
 	struct panfrost_devfreq pfdevfreq;
+
+	struct {
+		atomic_t use_count;
+		spinlock_t lock;
+	} cycle_counter;
 };
 
 struct panfrost_mmu {
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 2faa344d89ee..fddbc72bf093 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -73,6 +73,8 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
 	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
 	gpu_write(pfdev, GPU_INT_MASK, GPU_IRQ_MASK_ALL);
 
+	atomic_set(&pfdev->cycle_counter.use_count, 0);
+
 	return 0;
 }
 
@@ -321,6 +323,46 @@ static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
 		 pfdev->features.shader_present, pfdev->features.l2_present);
 }
 
+void panfrost_cycle_counter_get(struct panfrost_device *pfdev)
+{
+	if (atomic_inc_not_zero(&pfdev->cycle_counter.use_count))
+		return;
+
+	spin_lock(&pfdev->cycle_counter.lock);
+	if (atomic_inc_return(&pfdev->cycle_counter.use_count) == 1)
+		gpu_write(pfdev, GPU_CMD, GPU_CMD_CYCLE_COUNT_START);
+	spin_unlock(&pfdev->cycle_counter.lock);
+}
+
+void panfrost_cycle_counter_put(struct panfrost_device *pfdev)
+{
+	if (atomic_add_unless(&pfdev->cycle_counter.use_count, -1, 1))
+		return;
+
+	spin_lock(&pfdev->cycle_counter.lock);
+	if (atomic_dec_return(&pfdev->cycle_counter.use_count) == 0)
+		gpu_write(pfdev, GPU_CMD, GPU_CMD_CYCLE_COUNT_STOP);
+	spin_unlock(&pfdev->cycle_counter.lock);
+}
+
+void panfrost_cycle_counter_stop(struct panfrost_device *pfdev)
+{
+	atomic_set(&pfdev->profile_mode, 0);
+	gpu_write(pfdev, GPU_CMD, GPU_CMD_CYCLE_COUNT_STOP);
+}
+
+unsigned long long panfrost_cycle_counter_read(struct panfrost_device *pfdev)
+{
+	u32 hi, lo;
+
+	do {
+		hi = gpu_read(pfdev, GPU_CYCLE_COUNT_HI);
+		lo = gpu_read(pfdev, GPU_CYCLE_COUNT_LO);
+	} while (hi != gpu_read(pfdev, GPU_CYCLE_COUNT_HI));
+
+	return ((u64)hi << 32) | lo;
+}
+
 void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 {
 	int ret;
@@ -367,6 +409,7 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 
 void panfrost_gpu_power_off(struct panfrost_device *pfdev)
 {
+	panfrost_cycle_counter_stop(pfdev);
 	gpu_write(pfdev, TILER_PWROFF_LO, 0);
 	gpu_write(pfdev, SHADER_PWROFF_LO, 0);
 	gpu_write(pfdev, L2_PWROFF_LO, 0);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
index 468c51e7e46d..4d62e8901c79 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
@@ -16,6 +16,12 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev);
 void panfrost_gpu_power_on(struct panfrost_device *pfdev);
 void panfrost_gpu_power_off(struct panfrost_device *pfdev);
 
+void panfrost_stop_cycle_counter(struct panfrost_device *pfdev);
+void panfrost_cycle_counter_get(struct panfrost_device *pfdev);
+void panfrost_cycle_counter_stop(struct panfrost_device *pfdev);
+void panfrost_cycle_counter_put(struct panfrost_device *pfdev);
+unsigned long long panfrost_cycle_counter_read(struct panfrost_device *pfdev);
+
 void panfrost_gpu_amlogic_quirk(struct panfrost_device *pfdev);
 
 #endif
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 033f5e684707..8b1bf6ac48f8 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -297,6 +297,11 @@ int panfrost_job_push(struct panfrost_job *job)
 
 	kref_get(&job->refcount); /* put by scheduler job completion */
 
+	if (atomic_read(&pfdev->profile_mode)) {
+		panfrost_cycle_counter_get(pfdev);
+		job->is_profiled = true;
+	}
+
 	drm_sched_entity_push_job(&job->base);
 
 	mutex_unlock(&pfdev->sched_lock);
@@ -351,6 +356,9 @@ static void panfrost_job_free(struct drm_sched_job *sched_job)
 
 	drm_sched_job_cleanup(sched_job);
 
+	if (job->is_profiled)
+		panfrost_cycle_counter_put(job->pfdev);
+
 	panfrost_job_put(job);
 }
 
@@ -842,6 +850,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		}
 	}
 
+	spin_lock_init(&pfdev->cycle_counter.lock);
+
 	panfrost_job_enable_interrupts(pfdev);
 
 	return 0;
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index 8becc1ba0eb9..2aa0add35459 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -32,6 +32,7 @@ struct panfrost_job {
 
 	/* Fence to be signaled by drm-sched once its done with the job */
 	struct dma_fence *render_done_fence;
+	bool is_profiled;
 };
 
 int panfrost_job_init(struct panfrost_device *pfdev);
-- 
2.42.0

