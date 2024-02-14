Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E7B8548FE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 13:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9279C10E222;
	Wed, 14 Feb 2024 12:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="41HykHli";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E8E10E219
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 12:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707912901;
 bh=a9LrVHonu2XB3YYQb5kFdwq7EY9F5HNdPDXVenpHkh4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=41HykHliSAXpFUgAys8pjHgemH2RaB+j1D9U3+itBqGNSls4fBavEJaVK51Lt2L7B
 Y+QAFVZVgLCxg59MCs4ga+esKiRDwX1D/WawTLP/e38G8IQXNkBrWVRJA7nviWF2uN
 Ua6H0bwgXWcfMoPPq6IfDYe3jXyr/f1G9EEbvOUxEi1pzWUf7ZY2Ups+1ba+CE/tma
 sf+EBU+uWikHQDtxxVO3jy1N1/iLlLdH44na4532GaMuQ6xkRj7o6/orHEZLIl4mR6
 w0s1OTUMeiimlTexs856TToWa06qTaNzdiiX7Ug7S+lfkcqmHQpvnFoy/RuGQQRYC0
 8u/Ey845oTf2Q==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B600A37813DF;
 Wed, 14 Feb 2024 12:15:00 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/panfrost: Always record job cycle and timestamp
 information
Date: Wed, 14 Feb 2024 12:14:27 +0000
Message-ID: <20240214121435.3813983-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214121435.3813983-1-adrian.larumbe@collabora.com>
References: <20240214121435.3813983-1-adrian.larumbe@collabora.com>
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

Some users of Panfrost expressed interest in being able to gather fdinfo
stats for running jobs, on production builds with no built-in debugfs
support. Sysfs was first considered, but eventually it was realised
timestamp and cycle counting don't incur in additional power consumption
when the GPU is running and there are inflight jobs, so there's no reason
to let user space toggle profiling.

Remove the profiling debugfs knob altogether so that cycle and timestamp
counting is always enabled for inflight jobs.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/Makefile           |  2 --
 drivers/gpu/drm/panfrost/panfrost_debugfs.c | 21 ------------------
 drivers/gpu/drm/panfrost/panfrost_debugfs.h | 14 ------------
 drivers/gpu/drm/panfrost/panfrost_device.h  |  1 -
 drivers/gpu/drm/panfrost/panfrost_drv.c     |  5 -----
 drivers/gpu/drm/panfrost/panfrost_job.c     | 24 ++++++++-------------
 drivers/gpu/drm/panfrost/panfrost_job.h     |  1 -
 7 files changed, 9 insertions(+), 59 deletions(-)
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h

diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
index 2c01c1e7523e..7da2b3f02ed9 100644
--- a/drivers/gpu/drm/panfrost/Makefile
+++ b/drivers/gpu/drm/panfrost/Makefile
@@ -12,6 +12,4 @@ panfrost-y := \
 	panfrost_perfcnt.o \
 	panfrost_dump.o
 
-panfrost-$(CONFIG_DEBUG_FS) += panfrost_debugfs.o
-
 obj-$(CONFIG_DRM_PANFROST) += panfrost.o
diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.c b/drivers/gpu/drm/panfrost/panfrost_debugfs.c
deleted file mode 100644
index 72d4286a6bf7..000000000000
--- a/drivers/gpu/drm/panfrost/panfrost_debugfs.c
+++ /dev/null
@@ -1,21 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright 2023 Collabora ltd. */
-/* Copyright 2023 Amazon.com, Inc. or its affiliates. */
-
-#include <linux/debugfs.h>
-#include <linux/platform_device.h>
-#include <drm/drm_debugfs.h>
-#include <drm/drm_file.h>
-#include <drm/panfrost_drm.h>
-
-#include "panfrost_device.h"
-#include "panfrost_gpu.h"
-#include "panfrost_debugfs.h"
-
-void panfrost_debugfs_init(struct drm_minor *minor)
-{
-	struct drm_device *dev = minor->dev;
-	struct panfrost_device *pfdev = platform_get_drvdata(to_platform_device(dev->dev));
-
-	debugfs_create_atomic_t("profile", 0600, minor->debugfs_root, &pfdev->profile_mode);
-}
diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.h b/drivers/gpu/drm/panfrost/panfrost_debugfs.h
deleted file mode 100644
index c5af5f35877f..000000000000
--- a/drivers/gpu/drm/panfrost/panfrost_debugfs.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright 2023 Collabora ltd.
- * Copyright 2023 Amazon.com, Inc. or its affiliates.
- */
-
-#ifndef PANFROST_DEBUGFS_H
-#define PANFROST_DEBUGFS_H
-
-#ifdef CONFIG_DEBUG_FS
-void panfrost_debugfs_init(struct drm_minor *minor);
-#endif
-
-#endif  /* PANFROST_DEBUGFS_H */
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 62f7e3527385..cd6bbcb2bea4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -130,7 +130,6 @@ struct panfrost_device {
 	struct list_head scheduled_jobs;
 
 	struct panfrost_perfcnt *perfcnt;
-	atomic_t profile_mode;
 
 	struct mutex sched_lock;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index a926d71e8131..e31fd4d62bbe 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -20,7 +20,6 @@
 #include "panfrost_job.h"
 #include "panfrost_gpu.h"
 #include "panfrost_perfcnt.h"
-#include "panfrost_debugfs.h"
 
 static bool unstable_ioctls;
 module_param_unsafe(unstable_ioctls, bool, 0600);
@@ -600,10 +599,6 @@ static const struct drm_driver panfrost_drm_driver = {
 
 	.gem_create_object	= panfrost_gem_create_object,
 	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
-
-#ifdef CONFIG_DEBUG_FS
-	.debugfs_init		= panfrost_debugfs_init,
-#endif
 };
 
 static int panfrost_probe(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 0c2dbf6ef2a5..745b16a77edd 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -159,13 +159,11 @@ panfrost_dequeue_job(struct panfrost_device *pfdev, int slot)
 	struct panfrost_job *job = pfdev->jobs[slot][0];
 
 	WARN_ON(!job);
-	if (job->is_profiled) {
-		if (job->engine_usage) {
-			job->engine_usage->elapsed_ns[slot] +=
-				ktime_to_ns(ktime_sub(ktime_get(), job->start_time));
-			job->engine_usage->cycles[slot] +=
-				panfrost_cycle_counter_read(pfdev) - job->start_cycles;
-		}
+	if (job->engine_usage) {
+		job->engine_usage->elapsed_ns[slot] +=
+			ktime_to_ns(ktime_sub(ktime_get(), job->start_time));
+		job->engine_usage->cycles[slot] +=
+			panfrost_cycle_counter_read(pfdev) - job->start_cycles;
 		panfrost_cycle_counter_put(job->pfdev);
 	}
 
@@ -243,12 +241,9 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 	subslot = panfrost_enqueue_job(pfdev, js, job);
 	/* Don't queue the job if a reset is in progress */
 	if (!atomic_read(&pfdev->reset.pending)) {
-		if (atomic_read(&pfdev->profile_mode)) {
-			panfrost_cycle_counter_get(pfdev);
-			job->is_profiled = true;
-			job->start_time = ktime_get();
-			job->start_cycles = panfrost_cycle_counter_read(pfdev);
-		}
+		panfrost_cycle_counter_get(pfdev);
+		job->start_time = ktime_get();
+		job->start_cycles = panfrost_cycle_counter_read(pfdev);
 
 		job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
 		dev_dbg(pfdev->dev,
@@ -693,8 +688,7 @@ panfrost_reset(struct panfrost_device *pfdev,
 	spin_lock(&pfdev->js->job_lock);
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
 		for (j = 0; j < ARRAY_SIZE(pfdev->jobs[0]) && pfdev->jobs[i][j]; j++) {
-			if (pfdev->jobs[i][j]->is_profiled)
-				panfrost_cycle_counter_put(pfdev->jobs[i][j]->pfdev);
+			panfrost_cycle_counter_put(pfdev->jobs[i][j]->pfdev);
 			pm_runtime_put_noidle(pfdev->dev);
 			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
 		}
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index ec581b97852b..022c83ede368 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -34,7 +34,6 @@ struct panfrost_job {
 	struct dma_fence *render_done_fence;
 
 	struct panfrost_engine_usage *engine_usage;
-	bool is_profiled;
 	ktime_t start_time;
 	u64 start_cycles;
 };
-- 
2.43.0

