Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7009393741
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 22:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0616F4C6;
	Thu, 27 May 2021 20:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F6E6F4C2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 20:38:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2600:8800:8c09:5500::19dc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A329E1F43DF3;
 Thu, 27 May 2021 21:38:27 +0100 (BST)
From: alyssa.rosenzweig@collabora.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/panfrost: Handle PANFROST_JD_REQ_PERMON
Date: Thu, 27 May 2021 16:38:04 -0400
Message-Id: <20210527203804.12914-5-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210527203804.12914-1-alyssa.rosenzweig@collabora.com>
References: <20210527203804.12914-1-alyssa.rosenzweig@collabora.com>
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, steven.price@arm.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

If a job requires cycle counters or timestamps, we must enable cycle
counting just before issuing the job, and disable as soon as the job
completes.

Since this extends the UABI, we bump the driver minor version and date.
That lets userspace detect cycle counter support, and only advertise
features like ARB_shader_clock on kernels with this commit.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 10 +++++++---
 drivers/gpu/drm/panfrost/panfrost_job.c |  6 ++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index ca07098a6..0f11d2df4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -20,6 +20,10 @@
 #include "panfrost_gpu.h"
 #include "panfrost_perfcnt.h"
 
+#define JOB_REQUIREMENTS \
+	(PANFROST_JD_REQ_FS | \
+	 PANFROST_JD_REQ_PERMON)
+
 static bool unstable_ioctls;
 module_param_unsafe(unstable_ioctls, bool, 0600);
 
@@ -247,7 +251,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 	if (!args->jc)
 		return -EINVAL;
 
-	if (args->requirements && args->requirements != PANFROST_JD_REQ_FS)
+	if (args->requirements & ~JOB_REQUIREMENTS)
 		return -EINVAL;
 
 	if (args->out_sync > 0) {
@@ -557,9 +561,9 @@ static const struct drm_driver panfrost_drm_driver = {
 	.fops			= &panfrost_drm_driver_fops,
 	.name			= "panfrost",
 	.desc			= "panfrost DRM",
-	.date			= "20180908",
+	.date			= "20210527",
 	.major			= 1,
-	.minor			= 1,
+	.minor			= 2,
 
 	.gem_create_object	= panfrost_gem_create_object,
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 6003cfeb1..b78147e3d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -165,6 +165,9 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 		return;
 	}
 
+	if (job->requirements & PANFROST_JD_REQ_PERMON)
+		panfrost_acquire_permon(job->pfdev);
+
 	cfg = panfrost_mmu_as_get(pfdev, &job->file_priv->mmu);
 
 	job_write(pfdev, JS_HEAD_NEXT_LO(js), jc_head & 0xFFFFFFFF);
@@ -296,6 +299,9 @@ static void panfrost_job_cleanup(struct kref *ref)
 		kvfree(job->bos);
 	}
 
+	if (job->requirements & PANFROST_JD_REQ_PERMON)
+		panfrost_release_permon(job->pfdev);
+
 	kfree(job);
 }
 
-- 
2.30.2

