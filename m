Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD4E983A04
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 01:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D9610E4AE;
	Mon, 23 Sep 2024 23:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="DhZSYoL9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2384810E4AB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 23:09:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727132976; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=aWtRrStK/DEUWb+nBILEdu9JZgldEqeaaZUm0ezO4H2Go4jLBHrtFYQ9BpTd4K/WpWwsoOqkuSSpbjHFiUTjM/MtYOmNLouz0SZysw8DZinacnCIywg2SMD+OE3Vq5IyVj7UMwTmZVxSGptGxEY/zAZVs/X+x1JVNdnAQUX2wlY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1727132976;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=z368KWxhUN0qH5o1dJUVZiTFNr+v6P6q+7tIP0nSjf4=; 
 b=NHPxT8Rm4l+VM+2JA1TDBsSTeqnJAiM1OfFgzrnC464Xel/HxEy8Bgc4xxLedGtXBlatpFWIYTnTrXtgBWAcTvieM2936MbJoz5xnJtqtKyYqNYW8vikTN/mNQhlMWdrwjCyd+9vuiKv8EHesr9sRjoDUMJeg22zl55OrY/QKcE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727132976; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=z368KWxhUN0qH5o1dJUVZiTFNr+v6P6q+7tIP0nSjf4=;
 b=DhZSYoL9T23dvxicxP3YNA/RI5ZkBSIsjM1YpfugcRhyOxXjEYXyDHCK+Ed0A51l
 t+4psydkU+Yk1ulkUexXl0FZgLKElc3JpV1fhbuH0szn1l/Yk01TabsZiUuyttfgLbG
 Rmd6mZcQ2TZLtX6VFNX7EUJh7Rz4iHWgUAU8ivdU=
Received: by mx.zohomail.com with SMTPS id 1727132973830166.5786029711919;
 Mon, 23 Sep 2024 16:09:33 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v8 3/5] drm/panthor: add DRM fdinfo support
Date: Tue, 24 Sep 2024 00:06:23 +0100
Message-ID: <20240923230912.2207320-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240923230912.2207320-1-adrian.larumbe@collabora.com>
References: <20240923230912.2207320-1-adrian.larumbe@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drawing from the FW-calculated values in a previous commit, we can increase
the numbers for an open file by collecting them from finished jobs when
updating their group synchronisation objects.

Display of fdinfo key-value pairs is governed by a bitmask that is by
default unset in the present commit, and supporting manual toggle of it
will be the matter of a later commit.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.h |  8 ++++
 drivers/gpu/drm/panthor/panthor_drv.c    | 34 ++++++++++++++
 drivers/gpu/drm/panthor/panthor_sched.c  | 56 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_sched.h  |  2 +
 4 files changed, 100 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 2109905813e8..0e68f5a70d20 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -192,6 +192,11 @@ struct panthor_device {
 	unsigned long fast_rate;
 };
 
+struct panthor_gpu_usage {
+	u64 time;
+	u64 cycles;
+};
+
 /**
  * struct panthor_file - Panthor file
  */
@@ -204,6 +209,9 @@ struct panthor_file {
 
 	/** @groups: Scheduling group pool attached to this file. */
 	struct panthor_group_pool *groups;
+
+	/** @stats: cycle and timestamp measures for job execution. */
+	struct panthor_gpu_usage stats;
 };
 
 int panthor_device_init(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 0caf9e9a8c45..233b265c0819 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -13,6 +13,7 @@
 #include <linux/pagemap.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/time64.h>
 
 #include <drm/drm_auth.h>
 #include <drm/drm_debugfs.h>
@@ -1414,6 +1415,37 @@ static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
 	return ret;
 }
 
+static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
+				    struct panthor_file *pfile,
+				    struct drm_printer *p)
+{
+	if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_ALL)
+		panthor_fdinfo_gather_group_samples(pfile);
+
+	if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP) {
+#ifdef CONFIG_ARM_ARCH_TIMER
+		drm_printf(p, "drm-engine-panthor:\t%llu ns\n",
+			   DIV_ROUND_UP_ULL((pfile->stats.time * NSEC_PER_SEC),
+					    arch_timer_get_cntfrq()));
+#endif
+	}
+	if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_CYCLES)
+		drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->stats.cycles);
+
+	drm_printf(p, "drm-maxfreq-panthor:\t%lu Hz\n", ptdev->fast_rate);
+	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequency);
+}
+
+static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *file)
+{
+	struct drm_device *dev = file->minor->dev;
+	struct panthor_device *ptdev = container_of(dev, struct panthor_device, base);
+
+	panthor_gpu_show_fdinfo(ptdev, file->driver_priv, p);
+
+	drm_show_memory_stats(p, file);
+}
+
 static const struct file_operations panthor_drm_driver_fops = {
 	.open = drm_open,
 	.release = drm_release,
@@ -1423,6 +1455,7 @@ static const struct file_operations panthor_drm_driver_fops = {
 	.read = drm_read,
 	.llseek = noop_llseek,
 	.mmap = panthor_mmap,
+	.show_fdinfo = drm_show_fdinfo,
 };
 
 #ifdef CONFIG_DEBUG_FS
@@ -1442,6 +1475,7 @@ static const struct drm_driver panthor_drm_driver = {
 			   DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
 	.open = panthor_open,
 	.postclose = panthor_postclose,
+	.show_fdinfo = panthor_show_fdinfo,
 	.ioctls = panthor_drm_driver_ioctls,
 	.num_ioctls = ARRAY_SIZE(panthor_drm_driver_ioctls),
 	.fops = &panthor_drm_driver_fops,
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 4fc9946fd2ac..7ea97ede9c96 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -619,6 +619,18 @@ struct panthor_group {
 	 */
 	struct panthor_kernel_bo *syncobjs;
 
+	/** @fdinfo: Per-file total cycle and timestamp values reference. */
+	struct {
+		/** @data: Total sampled values for jobs in queues from this group. */
+		struct panthor_gpu_usage data;
+
+		/**
+		 * @lock: Mutex to govern concurrent access from drm file's fdinfo callback
+		 * and job post-completion processing function
+		 */
+		struct mutex lock;
+	} fdinfo;
+
 	/** @state: Group state. */
 	enum panthor_group_state state;
 
@@ -889,6 +901,8 @@ static void group_release_work(struct work_struct *work)
 						   release_work);
 	u32 i;
 
+	mutex_destroy(&group->fdinfo.lock);
+
 	for (i = 0; i < group->queue_count; i++)
 		group_free_queue(group, group->queues[i]);
 
@@ -2811,6 +2825,44 @@ void panthor_sched_post_reset(struct panthor_device *ptdev, bool reset_failed)
 	}
 }
 
+static void update_fdinfo_stats(struct panthor_job *job)
+{
+	struct panthor_group *group = job->group;
+	struct panthor_queue *queue = group->queues[job->queue_idx];
+	struct panthor_gpu_usage *fdinfo = &group->fdinfo.data;
+	struct panthor_job_profiling_data *times;
+
+	times = (struct panthor_job_profiling_data *)
+		((unsigned long) queue->profiling.slots->kmap +
+		 (job->profiling.slot * sizeof(struct panthor_job_profiling_data)));
+
+	mutex_lock(&group->fdinfo.lock);
+	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
+		fdinfo->cycles += times->cycles.after - times->cycles.before;
+	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
+		fdinfo->time += times->time.after - times->time.before;
+	mutex_unlock(&group->fdinfo.lock);
+}
+
+void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
+{
+	struct panthor_group_pool *gpool = pfile->groups;
+	struct panthor_group *group;
+	unsigned long i;
+
+	if (IS_ERR_OR_NULL(gpool))
+		return;
+
+	xa_for_each(&gpool->xa, i, group) {
+		mutex_lock(&group->fdinfo.lock);
+		pfile->stats.cycles += group->fdinfo.data.cycles;
+		pfile->stats.time += group->fdinfo.data.time;
+		group->fdinfo.data.cycles = 0;
+		group->fdinfo.data.time = 0;
+		mutex_unlock(&group->fdinfo.lock);
+	}
+}
+
 static void group_sync_upd_work(struct work_struct *work)
 {
 	struct panthor_group *group =
@@ -2843,6 +2895,8 @@ static void group_sync_upd_work(struct work_struct *work)
 	dma_fence_end_signalling(cookie);
 
 	list_for_each_entry_safe(job, job_tmp, &done_jobs, node) {
+		if (job->profiling.mask)
+			update_fdinfo_stats(job);
 		list_del_init(&job->node);
 		panthor_job_put(&job->base);
 	}
@@ -3421,6 +3475,8 @@ int panthor_group_create(struct panthor_file *pfile,
 	}
 	mutex_unlock(&sched->reset.lock);
 
+	mutex_init(&group->fdinfo.lock);
+
 	return gid;
 
 err_put_group:
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 3a30d2328b30..5ae6b4bde7c5 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -47,4 +47,6 @@ void panthor_sched_resume(struct panthor_device *ptdev);
 void panthor_sched_report_mmu_fault(struct panthor_device *ptdev);
 void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events);
 
+void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile);
+
 #endif
-- 
2.46.0

