Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAE441E20E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 21:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68386EC51;
	Thu, 30 Sep 2021 19:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCEB6EC50
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 19:10:03 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C95621F451E5;
 Thu, 30 Sep 2021 20:10:01 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v5 6/8] drm/panfrost: Support synchronization jobs
Date: Thu, 30 Sep 2021 21:09:52 +0200
Message-Id: <20210930190954.1525933-7-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930190954.1525933-1-boris.brezillon@collabora.com>
References: <20210930190954.1525933-1-boris.brezillon@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sometimes, all the user wants to do is add a synchronization point.
Userspace can already do that by submitting a NULL job, but this implies
submitting something to the GPU when we could simply skip the job and
signal the done fence directly.

v5:
* New patch

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 9 +++++++--
 drivers/gpu/drm/panfrost/panfrost_job.c | 6 ++++++
 include/uapi/drm/panfrost_drm.h         | 7 +++++++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 30dc158d56e6..89a0c484310c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -542,7 +542,9 @@ static const struct panfrost_submit_ioctl_version_info submit_versions[] = {
 	[1] = { 48, 8, 16 },
 };
 
-#define PANFROST_JD_ALLOWED_REQS PANFROST_JD_REQ_FS
+#define PANFROST_JD_ALLOWED_REQS \
+	(PANFROST_JD_REQ_FS | \
+	 PANFROST_JD_REQ_DEP_ONLY)
 
 static int
 panfrost_submit_job(struct drm_device *dev, struct drm_file *file_priv,
@@ -559,7 +561,10 @@ panfrost_submit_job(struct drm_device *dev, struct drm_file *file_priv,
 	if (args->requirements & ~PANFROST_JD_ALLOWED_REQS)
 		return -EINVAL;
 
-	if (!args->head)
+	/* If this is a dependency-only job, the job chain head should be NULL,
+	 * otherwise it should be non-NULL.
+	 */
+	if ((args->head != 0) != !(args->requirements & PANFROST_JD_REQ_DEP_ONLY))
 		return -EINVAL;
 
 	bo_stride = submit_versions[version].bo_ref_stride;
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 0367cee8f6df..6d8706d4a096 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -192,6 +192,12 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 	u64 jc_head = job->jc;
 	int ret;
 
+	if (job->requirements & PANFROST_JD_REQ_DEP_ONLY) {
+		/* Nothing to execute, signal the fence directly. */
+		dma_fence_signal_locked(job->done_fence);
+		return;
+	}
+
 	panfrost_devfreq_record_busy(&pfdev->pfdevfreq);
 
 	ret = pm_runtime_get_sync(pfdev->dev);
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 5e3f8a344f41..b9df066970f6 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -46,6 +46,13 @@ extern "C" {
 #define DRM_IOCTL_PANFROST_PERFCNT_DUMP		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_PERFCNT_DUMP, struct drm_panfrost_perfcnt_dump)
 
 #define PANFROST_JD_REQ_FS (1 << 0)
+
+/*
+ * Dependency only job. The job chain head should be set to 0 when this flag
+ * is set.
+ */
+#define PANFROST_JD_REQ_DEP_ONLY (1 << 1)
+
 /**
  * struct drm_panfrost_submit - ioctl argument for submitting commands to the 3D
  * engine.
-- 
2.31.1

