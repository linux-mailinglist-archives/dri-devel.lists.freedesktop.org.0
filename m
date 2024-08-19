Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3AD956521
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 10:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A9410E1E5;
	Mon, 19 Aug 2024 08:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="jT4O58UY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B62310E1E5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 08:02:57 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724054568; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=M2WVo+Ly3Y9i7hmUKWlpWpanxR1MtfQEiToDtqT6p3zhWSCfCRaaAUBHQTlvN8Akp5yAG9kWRJ47FP2uq0yNCiLoM2SIbPrmTAm2/slrXzqrhRZkkzuKTbW3qd4BX5weB/jEDGzrf2vs+rvyxrYHX+5M+YwY4WB/1jx+ZdIqD/Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724054568;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=WM+wqGp9qLzx1kIn1dgpyGNYvgrZqELl8IsnsJ4nghA=; 
 b=i3wY5IXaM9777plSt9Pkeop1MYo24Lhb023yXzZqMUeH5j/AkLGmWUFoF3OX1lPzdT0hf7vR8dkhILzole4WAQ6WB2GXqJIebFk0Mo+Ww05rXPkVyi4pNlvUbz0SfrdqvxMMV4eGe74KOdumSZquKEO9JIqjBrYyqwNhP6N1JFs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724054568; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=WM+wqGp9qLzx1kIn1dgpyGNYvgrZqELl8IsnsJ4nghA=;
 b=jT4O58UYzlEkd6sLATagyUvvAE1kw1LylLw3yBsWf4zVeVBD+ZitzvW08HoL8Qem
 27dtV19lTyh+LBpJSVFCFPM/HNHAwv3gfkuR/5BmL9an6hnyAFq7Te/LqqXHKcfxFez
 Mfr7sXpVrNcRcKpsrq8WJceyugNz/y+wrq4pm2SE=
Received: by mx.zohomail.com with SMTPS id 1724054566910393.5531239813379;
 Mon, 19 Aug 2024 01:02:46 -0700 (PDT)
From: Mary Guillemard <mary.guillemard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Mary Guillemard <mary.guillemard@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 2/2] drm/panfrost: Add cycle counter job requirement
Date: Mon, 19 Aug 2024 10:02:23 +0200
Message-ID: <20240819080224.24914-3-mary.guillemard@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819080224.24914-1-mary.guillemard@collabora.com>
References: <20240819080224.24914-1-mary.guillemard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Extend the uAPI with a new job requirement flag for cycle
counters. This requirement is used by userland to indicate that a job
requires cycle counters or system timestamp to be propagated. (for use
with write value timestamp jobs)

We cannot enable cycle counters unconditionally as this would result in
an increase of GPU power consumption. As a result, they should be left
off unless required by the application.

If a job requires cycle counters or system timestamps propagation, we
must enable cycle counting before issuing a job and disable it right
after the job completes.

Since this extends the uAPI and because userland needs a way to advertise
features like VK_KHR_shader_clock conditionally, we bumps the driver
minor version.

v2:
- Rework commit message
- Squash uAPI changes and implementation in this commit
- Simplify changes based on Steven Price comments

v3:
- Add Steven Price r-b
- Fix a codestyle issue

Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c |  8 +++++--
 drivers/gpu/drm/panfrost/panfrost_job.c | 28 +++++++++++++++----------
 include/uapi/drm/panfrost_drm.h         |  1 +
 3 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 790c4ad31143..04d615df5259 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -25,6 +25,8 @@
 #include "panfrost_gpu.h"
 #include "panfrost_perfcnt.h"
 
+#define JOB_REQUIREMENTS (PANFROST_JD_REQ_FS | PANFROST_JD_REQ_CYCLE_COUNT)
+
 static bool unstable_ioctls;
 module_param_unsafe(unstable_ioctls, bool, 0600);
 
@@ -282,7 +284,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 	if (!args->jc)
 		return -EINVAL;
 
-	if (args->requirements && args->requirements != PANFROST_JD_REQ_FS)
+	if (args->requirements & ~JOB_REQUIREMENTS)
 		return -EINVAL;
 
 	if (args->out_sync > 0) {
@@ -621,6 +623,8 @@ static const struct file_operations panfrost_drm_driver_fops = {
  * - 1.0 - initial interface
  * - 1.1 - adds HEAP and NOEXEC flags for CREATE_BO
  * - 1.2 - adds AFBC_FEATURES query
+ * - 1.3 - adds JD_REQ_CYCLE_COUNT job requirement for SUBMIT
+ *       - adds SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY queries
  */
 static const struct drm_driver panfrost_drm_driver = {
 	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
@@ -634,7 +638,7 @@ static const struct drm_driver panfrost_drm_driver = {
 	.desc			= "panfrost DRM",
 	.date			= "20180908",
 	.major			= 1,
-	.minor			= 2,
+	.minor			= 3,
 
 	.gem_create_object	= panfrost_gem_create_object,
 	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index df49d37d0e7e..3ad131eb6657 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -159,16 +159,17 @@ panfrost_dequeue_job(struct panfrost_device *pfdev, int slot)
 	struct panfrost_job *job = pfdev->jobs[slot][0];
 
 	WARN_ON(!job);
-	if (job->is_profiled) {
-		if (job->engine_usage) {
-			job->engine_usage->elapsed_ns[slot] +=
-				ktime_to_ns(ktime_sub(ktime_get(), job->start_time));
-			job->engine_usage->cycles[slot] +=
-				panfrost_cycle_counter_read(pfdev) - job->start_cycles;
-		}
-		panfrost_cycle_counter_put(job->pfdev);
+
+	if (job->is_profiled && job->engine_usage) {
+		job->engine_usage->elapsed_ns[slot] +=
+			ktime_to_ns(ktime_sub(ktime_get(), job->start_time));
+		job->engine_usage->cycles[slot] +=
+			panfrost_cycle_counter_read(pfdev) - job->start_cycles;
 	}
 
+	if (job->requirements & PANFROST_JD_REQ_CYCLE_COUNT || job->is_profiled)
+		panfrost_cycle_counter_put(pfdev);
+
 	pfdev->jobs[slot][0] = pfdev->jobs[slot][1];
 	pfdev->jobs[slot][1] = NULL;
 
@@ -243,9 +244,13 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 	subslot = panfrost_enqueue_job(pfdev, js, job);
 	/* Don't queue the job if a reset is in progress */
 	if (!atomic_read(&pfdev->reset.pending)) {
-		if (pfdev->profile_mode) {
+		job->is_profiled = pfdev->profile_mode;
+
+		if (job->requirements & PANFROST_JD_REQ_CYCLE_COUNT ||
+		    job->is_profiled)
 			panfrost_cycle_counter_get(pfdev);
-			job->is_profiled = true;
+
+		if (job->is_profiled) {
 			job->start_time = ktime_get();
 			job->start_cycles = panfrost_cycle_counter_read(pfdev);
 		}
@@ -693,7 +698,8 @@ panfrost_reset(struct panfrost_device *pfdev,
 	spin_lock(&pfdev->js->job_lock);
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
 		for (j = 0; j < ARRAY_SIZE(pfdev->jobs[0]) && pfdev->jobs[i][j]; j++) {
-			if (pfdev->jobs[i][j]->is_profiled)
+			if (pfdev->jobs[i][j]->requirements & PANFROST_JD_REQ_CYCLE_COUNT ||
+			    pfdev->jobs[i][j]->is_profiled)
 				panfrost_cycle_counter_put(pfdev->jobs[i][j]->pfdev);
 			pm_runtime_put_noidle(pfdev->dev);
 			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 52b050e2b660..568724be6628 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -40,6 +40,7 @@ extern "C" {
 #define DRM_IOCTL_PANFROST_PERFCNT_DUMP		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_PERFCNT_DUMP, struct drm_panfrost_perfcnt_dump)
 
 #define PANFROST_JD_REQ_FS (1 << 0)
+#define PANFROST_JD_REQ_CYCLE_COUNT (1 << 1)
 /**
  * struct drm_panfrost_submit - ioctl argument for submitting commands to the 3D
  * engine.
-- 
2.46.0

