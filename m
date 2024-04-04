Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2EA898967
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 16:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E8010E7FD;
	Thu,  4 Apr 2024 14:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GGjUUgyh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7DE10E7FD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 14:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712239229;
 bh=tORiLbSgUIPtw0RzW/7izuqRT/xBH93hl3mraCm/EG4=;
 h=From:To:Cc:Subject:Date:From;
 b=GGjUUgyhHAiRBOS4ZTeGUqXCK2CyFLkVf1jPgH00ge6tqAcCwEH5kFsBJ1wXyHOBF
 1GcD//kEWkDmt/VwVN669gexJLVK0RLjP+050PvEqZ56+zMeHRZ+v2SbPDjkk1+hVs
 K4iAx+mGEDE/2hZwWub4lsOxH/6rS5rPWLpKrsLRyPJ7c+oWvjs09dNrqC/4Z6KH8h
 oljuaVpCYYQT9AolDFEf7Q/qDbKNpQShuYU/gB4yCYoA75yKrtziXs9NGB4TbF3w3g
 Re2YXET3kkqFClr8hXpwmieDSgkWAYV1dLFuFl8Q5M/nc3/gjJp+zun0X5ylogiLSs
 4r413raimUj3g==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1C304378000E;
 Thu,  4 Apr 2024 14:00:29 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panfrost: Show overall GPU usage stats through sysfs knob
Date: Thu,  4 Apr 2024 15:00:09 +0100
Message-ID: <20240404140014.1022816-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.44.0
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

This changeset is heavily inspired by commit 509433d8146c ("drm/v3d: Expose
the total GPU usage stats on sysfs"). The point is making broader GPU
occupancy numbers available through the sysfs interface, so that for every
job slot, its number of processed jobs and total processing time are
displayed.

Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Christopher Healy <healych@amazon.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h |  5 +++
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 49 ++++++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_job.c    | 17 +++++++-
 drivers/gpu/drm/panfrost/panfrost_job.h    |  3 ++
 4 files changed, 68 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index cffcb0ac7c11..1d343351c634 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -169,6 +169,11 @@ struct panfrost_engine_usage {
 	unsigned long long cycles[NUM_JOB_SLOTS];
 };
 
+struct panfrost_slot_usage {
+	u64 enabled_ns;
+	u64 jobs_sent;
+};
+
 struct panfrost_file_priv {
 	struct panfrost_device *pfdev;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index ef9f6c0716d5..6afcde66270f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -8,6 +8,7 @@
 #include <linux/pagemap.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/sched/clock.h>
 #include <drm/panfrost_drm.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
@@ -524,6 +525,10 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
 	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
 };
 
+static const char * const engine_names[] = {
+	"fragment", "vertex-tiler", "compute-only"
+};
+
 static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
 				     struct panfrost_file_priv *panfrost_priv,
 				     struct drm_printer *p)
@@ -543,10 +548,6 @@ static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
 	 *   job spent on the GPU.
 	 */
 
-	static const char * const engine_names[] = {
-		"fragment", "vertex-tiler", "compute-only"
-	};
-
 	BUILD_BUG_ON(ARRAY_SIZE(engine_names) != NUM_JOB_SLOTS);
 
 	for (i = 0; i < NUM_JOB_SLOTS - 1; i++) {
@@ -716,8 +717,48 @@ static ssize_t profiling_store(struct device *dev,
 
 static DEVICE_ATTR_RW(profiling);
 
+static ssize_t
+gpu_stats_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct panfrost_device *pfdev = dev_get_drvdata(dev);
+	struct panfrost_slot_usage stats;
+	u64 timestamp = local_clock();
+	ssize_t len = 0;
+	unsigned int i;
+
+	BUILD_BUG_ON(ARRAY_SIZE(engine_names) != NUM_JOB_SLOTS);
+
+	len += sysfs_emit(buf, "queue        timestamp        jobs        runtime\n");
+	len += sysfs_emit_at(buf, len, "-------------------------------------------------\n");
+
+	for (i = 0; i < NUM_JOB_SLOTS - 1; i++) {
+
+		stats = get_slot_stats(pfdev, i);
+
+		/*
+		 * Each line will display the slot name, timestamp, the number
+		 * of jobs handled by that engine and runtime, as shown below:
+		 *
+		 * queue        timestamp        jobs        runtime
+		 * -------------------------------------------------
+		 * fragment     12252943467507   638         1184747640
+		 * vertex-tiler 12252943467507   636         121663838
+		 *
+		 */
+		len += sysfs_emit_at(buf, len, "%-13s%-17llu%-12llu%llu\n",
+				     engine_names[i],
+				     timestamp,
+				     stats.jobs_sent,
+				     stats.enabled_ns);
+	}
+
+	return len;
+}
+static DEVICE_ATTR_RO(gpu_stats);
+
 static struct attribute *panfrost_attrs[] = {
 	&dev_attr_profiling.attr,
+	&dev_attr_gpu_stats.attr,
 	NULL,
 };
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index a61ef0af9a4e..4c779e6f4cb0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -31,6 +31,8 @@ struct panfrost_queue_state {
 	struct drm_gpu_scheduler sched;
 	u64 fence_context;
 	u64 emit_seqno;
+
+	struct panfrost_slot_usage stats;
 };
 
 struct panfrost_job_slot {
@@ -160,15 +162,20 @@ panfrost_dequeue_job(struct panfrost_device *pfdev, int slot)
 
 	WARN_ON(!job);
 	if (job->is_profiled) {
+		u64 job_time = ktime_to_ns(ktime_sub(ktime_get(), job->start_time));
+
 		if (job->engine_usage) {
-			job->engine_usage->elapsed_ns[slot] +=
-				ktime_to_ns(ktime_sub(ktime_get(), job->start_time));
+			job->engine_usage->elapsed_ns[slot] += job_time;
 			job->engine_usage->cycles[slot] +=
 				panfrost_cycle_counter_read(pfdev) - job->start_cycles;
 		}
+
 		panfrost_cycle_counter_put(job->pfdev);
+		pfdev->js->queue[slot].stats.enabled_ns += job_time;
 	}
 
+	pfdev->js->queue[slot].stats.jobs_sent++;
+
 	pfdev->jobs[slot][0] = pfdev->jobs[slot][1];
 	pfdev->jobs[slot][1] = NULL;
 
@@ -987,3 +994,9 @@ int panfrost_job_is_idle(struct panfrost_device *pfdev)
 
 	return true;
 }
+
+struct panfrost_slot_usage
+get_slot_stats(struct panfrost_device *pfdev, unsigned int slot)
+{
+	return pfdev->js->queue[slot].stats;
+}
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index ec581b97852b..e9e2c9db0526 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -50,4 +50,7 @@ void panfrost_job_enable_interrupts(struct panfrost_device *pfdev);
 void panfrost_job_suspend_irq(struct panfrost_device *pfdev);
 int panfrost_job_is_idle(struct panfrost_device *pfdev);
 
+struct panfrost_slot_usage
+get_slot_stats(struct panfrost_device *pfdev, unsigned int slot);
+
 #endif

base-commit: 45c734fdd43db14444025910b4c59dd2b8be714a
prerequisite-patch-id: 06ac397dd381984bfbff2a7661320c4f05470635
-- 
2.44.0

