Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C58E79CA48
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 10:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E525810E3C0;
	Tue, 12 Sep 2023 08:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B5310E3BE;
 Tue, 12 Sep 2023 08:40:57 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 71B5F6607322;
 Tue, 12 Sep 2023 09:40:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694508055;
 bh=EM3igmxwCKy35m8bvuOy/761mEjLZAv7xaG5wm36EL4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l7/EMyKvgEApA/yzJ921FE/1+K57t8rKwSdKowFJXi49E8V48BN9baWm8ay+/AU4S
 KzvfF9M6chDG2MA9SvcPs6VI2XYIIVG4EHN+nZ+CGLTxmVV++ItqP2zjsTsWl6rVZC
 73+Aaxx3NsnysEBtGkxDPYWoxcjnbLKotxmXR2Yf6EUd5TB3zKtlwblNNX+b91JdiC
 NMRp3Peq3wYl2N0J6+EoWDPET2+uZCCYyPzKWihwPR+rHmj4wXy88XOA7CgIe9sA6D
 WZeJlkibug+qH68DsM4v189ucxcqKAprlI6Nmg+iaGxuZBtlrHgr6jJ9T9WLfih/N8
 GOJq/Evy0ml8g==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
Subject: [PATCH v4 2/6] drm/panfrost: Add fdinfo support GPU load metrics
Date: Tue, 12 Sep 2023 09:36:56 +0100
Message-ID: <20230912084044.955864-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230912084044.955864-1-adrian.larumbe@collabora.com>
References: <20230912084044.955864-1-adrian.larumbe@collabora.com>
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

The drm-stats fdinfo tags made available to user space are drm-engine,
drm-cycles, drm-max-freq and drm-curfreq, one per job slot.

This deviates from standard practice in other DRM drivers, where a single
set of key:value pairs is provided for the whole render engine. However,
Panfrost has separate queues for fragment and vertex/tiler jobs, so a
decision was made to calculate bus cycles and workload times separately.

Maximum operating frequency is calculated at devfreq initialisation time.
Current frequency is made available to user space because nvtop uses it
when performing engine usage calculations.

It is important to bear in mind that both GPU cycle and kernel time numbers
provided are at best rough estimations, and always reported in excess from
the actual figure because of two reasons:
 - Excess time because of the delay between the end of a job processing,
   the subsequent job IRQ and the actual time of the sample.
 - Time spent in the engine queue waiting for the GPU to pick up the next
   job.

To avoid race conditions during enablement/disabling, a reference counting
mechanism was introduced, and a job flag that tells us whether a given job
increased the refcount. This is necessary, because user space can toggle
cycle counting through a debugfs file, and a given job might have been in
flight by the time cycle counting was disabled.

The main goal of the debugfs cycle counter knob is letting tools like nvtop
or IGT's gputop switch it at any time, to avoid power waste in case no
engine usage measuring is necessary.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/Makefile           |  2 +
 drivers/gpu/drm/panfrost/panfrost_debugfs.c | 20 ++++++++
 drivers/gpu/drm/panfrost/panfrost_debugfs.h | 13 +++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c |  8 +++
 drivers/gpu/drm/panfrost/panfrost_devfreq.h |  3 ++
 drivers/gpu/drm/panfrost/panfrost_device.c  |  2 +
 drivers/gpu/drm/panfrost/panfrost_device.h  | 13 +++++
 drivers/gpu/drm/panfrost/panfrost_drv.c     | 57 ++++++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_gpu.c     | 41 +++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h     |  6 +++
 drivers/gpu/drm/panfrost/panfrost_job.c     | 39 ++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_job.h     |  5 ++
 12 files changed, 208 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h

diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
index 7da2b3f02ed9..2c01c1e7523e 100644
--- a/drivers/gpu/drm/panfrost/Makefile
+++ b/drivers/gpu/drm/panfrost/Makefile
@@ -12,4 +12,6 @@ panfrost-y := \
 	panfrost_perfcnt.o \
 	panfrost_dump.o
 
+panfrost-$(CONFIG_DEBUG_FS) += panfrost_debugfs.o
+
 obj-$(CONFIG_DRM_PANFROST) += panfrost.o
diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.c b/drivers/gpu/drm/panfrost/panfrost_debugfs.c
new file mode 100644
index 000000000000..cc14eccba206
--- /dev/null
+++ b/drivers/gpu/drm/panfrost/panfrost_debugfs.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023 Collabora ltd. */
+
+#include <linux/debugfs.h>
+#include <linux/platform_device.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_file.h>
+#include <drm/panfrost_drm.h>
+
+#include "panfrost_device.h"
+#include "panfrost_gpu.h"
+#include "panfrost_debugfs.h"
+
+void panfrost_debugfs_init(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct panfrost_device *pfdev = platform_get_drvdata(to_platform_device(dev->dev));
+
+	debugfs_create_atomic_t("profile", 0600, minor->debugfs_root, &pfdev->profile_mode);
+}
diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.h b/drivers/gpu/drm/panfrost/panfrost_debugfs.h
new file mode 100644
index 000000000000..db1c158bcf2f
--- /dev/null
+++ b/drivers/gpu/drm/panfrost/panfrost_debugfs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2023 Collabora ltd.
+ */
+
+#ifndef PANFROST_DEBUGFS_H
+#define PANFROST_DEBUGFS_H
+
+#ifdef CONFIG_DEBUG_FS
+void panfrost_debugfs_init(struct drm_minor *minor);
+#endif
+
+#endif  /* PANFROST_DEBUGFS_H */
diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 58dfb15a8757..28caffc689e2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -58,6 +58,7 @@ static int panfrost_devfreq_get_dev_status(struct device *dev,
 	spin_lock_irqsave(&pfdevfreq->lock, irqflags);
 
 	panfrost_devfreq_update_utilization(pfdevfreq);
+	pfdevfreq->current_frequency = status->current_frequency;
 
 	status->total_time = ktime_to_ns(ktime_add(pfdevfreq->busy_time,
 						   pfdevfreq->idle_time));
@@ -117,6 +118,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct devfreq *devfreq;
 	struct thermal_cooling_device *cooling;
 	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
+	unsigned long freq = ULONG_MAX;
 
 	if (pfdev->comp->num_supplies > 1) {
 		/*
@@ -172,6 +174,12 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 		return ret;
 	}
 
+	/* Find the fastest defined rate  */
+	opp = dev_pm_opp_find_freq_floor(dev, &freq);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+	pfdevfreq->fast_rate = freq;
+
 	dev_pm_opp_put(opp);
 
 	/*
diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.h b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
index 1514c1f9d91c..48dbe185f206 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.h
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
@@ -19,6 +19,9 @@ struct panfrost_devfreq {
 	struct devfreq_simple_ondemand_data gov_data;
 	bool opp_of_table_added;
 
+	unsigned long current_frequency;
+	unsigned long fast_rate;
+
 	ktime_t busy_time;
 	ktime_t idle_time;
 	ktime_t time_last_update;
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index fa1a086a862b..9a140af97b24 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -207,6 +207,8 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 
 	spin_lock_init(&pfdev->as_lock);
 
+	atomic_set(&pfdev->profile_mode, false);
+
 	err = panfrost_clk_init(pfdev);
 	if (err) {
 		dev_err(pfdev->dev, "clk init failed %d\n", err);
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index b0126b9fbadc..1e85656dc2f7 100644
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
@@ -135,12 +141,19 @@ struct panfrost_mmu {
 	struct list_head list;
 };
 
+struct panfrost_engine_usage {
+	unsigned long long elapsed_ns[NUM_JOB_SLOTS];
+	unsigned long long cycles[NUM_JOB_SLOTS];
+};
+
 struct panfrost_file_priv {
 	struct panfrost_device *pfdev;
 
 	struct drm_sched_entity sched_entity[NUM_JOB_SLOTS];
 
 	struct panfrost_mmu *mmu;
+
+	struct panfrost_engine_usage engine_usage;
 };
 
 static inline struct panfrost_device *to_panfrost_device(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index a2ab99698ca8..2d9c115821a7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -20,6 +20,7 @@
 #include "panfrost_job.h"
 #include "panfrost_gpu.h"
 #include "panfrost_perfcnt.h"
+#include "panfrost_debugfs.h"
 
 static bool unstable_ioctls;
 module_param_unsafe(unstable_ioctls, bool, 0600);
@@ -267,6 +268,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 	job->requirements = args->requirements;
 	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
 	job->mmu = file_priv->mmu;
+	job->priv = file_priv;
 
 	slot = panfrost_job_get_slot(job);
 
@@ -523,7 +525,55 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
 	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
 };
 
-DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
+
+static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
+				     struct panfrost_file_priv *panfrost_priv,
+				     struct drm_printer *p)
+{
+	int i;
+
+	/*
+	 * IMPORTANT NOTE: drm-cycles and drm-engine measurements are not
+	 * accurate, as they only provide a rough estimation of the number of
+	 * GPU cycles and CPU time spent in a given context. This is due to two
+	 * different factors:
+	 * - Firstly, we must consider the time the CPU and then the kernel
+	 *   takes to process the GPU interrupt, which means additional time and
+	 *   GPU cycles will be added in excess to the real figure.
+	 * - Secondly, the pipelining done by the Job Manager (2 job slots per
+	 *   engine) implies there is no way to know exactly how much time each
+	 *   job spent on the GPU.
+	 */
+
+	static const char * const engine_names[] = {
+		"fragment", "vertex-tiler", "compute-only"
+	};
+
+	for (i = 0; i < NUM_JOB_SLOTS - 1; i++) {
+		drm_printf(p, "drm-engine-%s:\t%llu ns\n",
+			   engine_names[i], panfrost_priv->engine_usage.cycles[i]);
+		drm_printf(p, "drm-cycles-%s:\t%llu\n",
+			   engine_names[i], panfrost_priv->engine_usage.elapsed_ns[i]);
+		drm_printf(p, "drm-maxfreq-%s:\t%lu Hz\n",
+			   engine_names[i], pfdev->pfdevfreq.fast_rate);
+		drm_printf(p, "drm-curfreq-%s:\t%lu Hz\n",
+			   engine_names[i], pfdev->pfdevfreq.current_frequency);
+	}
+}
+
+static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
+{
+	struct drm_device *dev = file->minor->dev;
+	struct panfrost_device *pfdev = dev->dev_private;
+
+	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
+}
+
+static const struct file_operations panfrost_drm_driver_fops = {
+	.owner = THIS_MODULE,
+	DRM_GEM_FOPS,
+	.show_fdinfo = drm_show_fdinfo,
+};
 
 /*
  * Panfrost driver version:
@@ -535,6 +585,7 @@ static const struct drm_driver panfrost_drm_driver = {
 	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
 	.open			= panfrost_open,
 	.postclose		= panfrost_postclose,
+	.show_fdinfo		= panfrost_show_fdinfo,
 	.ioctls			= panfrost_drm_driver_ioctls,
 	.num_ioctls		= ARRAY_SIZE(panfrost_drm_driver_ioctls),
 	.fops			= &panfrost_drm_driver_fops,
@@ -546,6 +597,10 @@ static const struct drm_driver panfrost_drm_driver = {
 
 	.gem_create_object	= panfrost_gem_create_object,
 	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
+
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init		= panfrost_debugfs_init,
+#endif
 };
 
 static int panfrost_probe(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 2faa344d89ee..f0be7e19b13e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -73,6 +73,13 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
 	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
 	gpu_write(pfdev, GPU_INT_MASK, GPU_IRQ_MASK_ALL);
 
+	/*
+	 * All in-flight jobs should have released their cycle
+	 * counter references upon reset, but let us make sure
+	 */
+	if (drm_WARN_ON(pfdev->ddev, atomic_read(&pfdev->cycle_counter.use_count) != 0))
+		atomic_set(&pfdev->cycle_counter.use_count, 0);
+
 	return 0;
 }
 
@@ -321,6 +328,40 @@ static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
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
index 033f5e684707..b6d3c5309a8c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -159,6 +159,23 @@ panfrost_dequeue_job(struct panfrost_device *pfdev, int slot)
 	struct panfrost_job *job = pfdev->jobs[slot][0];
 
 	WARN_ON(!job);
+	if (job->priv) {
+		if (job->is_profiled) {
+			job->priv->engine_usage.elapsed_ns[slot] +=
+				ktime_to_ns(ktime_sub(ktime_get(), job->start_time));
+			job->priv->engine_usage.cycles[slot] +=
+				panfrost_cycle_counter_read(pfdev) - job->start_cycles;
+
+			/* Reset in case the job has to be requeued */
+			job->start_time = 0;
+			/* A GPU reset puts the Cycle Counter register back to 0 */
+			job->start_cycles = atomic_read(&pfdev->reset.pending) ?
+				0 : panfrost_cycle_counter_read(pfdev);
+		}
+	} else {
+		dev_WARN(pfdev->dev, "Panfrost DRM file closed when job was in-flight\n");
+	}
+
 	pfdev->jobs[slot][0] = pfdev->jobs[slot][1];
 	pfdev->jobs[slot][1] = NULL;
 
@@ -233,6 +250,13 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 	subslot = panfrost_enqueue_job(pfdev, js, job);
 	/* Don't queue the job if a reset is in progress */
 	if (!atomic_read(&pfdev->reset.pending)) {
+		if (atomic_read(&pfdev->profile_mode)) {
+			panfrost_cycle_counter_get(pfdev);
+			job->is_profiled = true;
+			job->start_time = ktime_get();
+			job->start_cycles = panfrost_cycle_counter_read(pfdev);
+		}
+
 		job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
 		dev_dbg(pfdev->dev,
 			"JS: Submitting atom %p to js[%d][%d] with head=0x%llx AS %d",
@@ -404,6 +428,9 @@ static void panfrost_job_handle_err(struct panfrost_device *pfdev,
 	const char *exception_name = panfrost_exception_name(js_status);
 	bool signal_fence = true;
 
+	if (job->is_profiled)
+		panfrost_cycle_counter_put(job->pfdev);
+
 	if (!panfrost_exception_is_fault(js_status)) {
 		dev_dbg(pfdev->dev, "js event, js=%d, status=%s, head=0x%x, tail=0x%x",
 			js, exception_name,
@@ -453,6 +480,9 @@ static void panfrost_job_handle_err(struct panfrost_device *pfdev,
 static void panfrost_job_handle_done(struct panfrost_device *pfdev,
 				     struct panfrost_job *job)
 {
+	if (job->is_profiled)
+		panfrost_cycle_counter_put(job->pfdev);
+
 	/* Set ->jc to 0 to avoid re-submitting an already finished job (can
 	 * happen when we receive the DONE interrupt while doing a GPU reset).
 	 */
@@ -660,10 +690,14 @@ panfrost_reset(struct panfrost_device *pfdev,
 	 * stuck jobs. Let's make sure the PM counters stay balanced by
 	 * manually calling pm_runtime_put_noidle() and
 	 * panfrost_devfreq_record_idle() for each stuck job.
+	 * Let's also make sure the cycle counting register's refcnt is
+	 * kept balanced to prevent it from running forever
 	 */
 	spin_lock(&pfdev->js->job_lock);
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
 		for (j = 0; j < ARRAY_SIZE(pfdev->jobs[0]) && pfdev->jobs[i][j]; j++) {
+			if (pfdev->jobs[i][j]->is_profiled)
+				panfrost_cycle_counter_put(pfdev->jobs[i][j]->pfdev);
 			pm_runtime_put_noidle(pfdev->dev);
 			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
 		}
@@ -842,6 +876,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		}
 	}
 
+	spin_lock_init(&pfdev->cycle_counter.lock);
+
 	panfrost_job_enable_interrupts(pfdev);
 
 	return 0;
@@ -926,6 +962,9 @@ void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
 			}
 
 			job_write(pfdev, JS_COMMAND(i), cmd);
+
+			/* Jobs can outlive their file context */
+			job->priv = NULL;
 		}
 	}
 	spin_unlock(&pfdev->js->job_lock);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index 8becc1ba0eb9..63bc830e057d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -32,6 +32,11 @@ struct panfrost_job {
 
 	/* Fence to be signaled by drm-sched once its done with the job */
 	struct dma_fence *render_done_fence;
+
+	struct panfrost_file_priv *priv;
+	bool is_profiled;
+	ktime_t start_time;
+	u64 start_cycles;
 };
 
 int panfrost_job_init(struct panfrost_device *pfdev);
-- 
2.42.0

