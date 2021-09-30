Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFED941E213
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 21:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CEA6EC56;
	Thu, 30 Sep 2021 19:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F116EC4B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 19:10:01 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3AE771F451F4;
 Thu, 30 Sep 2021 20:10:00 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v5 3/8] drm/panfrost: Add BO access flags to relax
 dependencies between jobs
Date: Thu, 30 Sep 2021 21:09:49 +0200
Message-Id: <20210930190954.1525933-4-boris.brezillon@collabora.com>
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

Jobs reading from the same BO should not be serialized. Add access
flags so we can relax the implicit dependencies in that case. We force
exclusive access for now to keep the behavior unchanged, but a new
SUBMIT ioctl taking explicit access flags will be introduced.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++++
 drivers/gpu/drm/panfrost/panfrost_job.c | 21 ++++++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_job.h |  1 +
 include/uapi/drm/panfrost_drm.h         |  3 +++
 4 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index b131da3c9399..a386c66f349c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -165,6 +165,7 @@ panfrost_lookup_bos(struct drm_device *dev,
 		  struct drm_panfrost_submit *args,
 		  struct panfrost_job *job)
 {
+	unsigned int i;
 	int ret;
 
 	job->bo_count = args->bo_handle_count;
@@ -172,6 +173,15 @@ panfrost_lookup_bos(struct drm_device *dev,
 	if (!job->bo_count)
 		return 0;
 
+	job->bo_flags = kvmalloc_array(job->bo_count,
+				       sizeof(*job->bo_flags),
+				       GFP_KERNEL | __GFP_ZERO);
+	if (!job->bo_flags)
+		return -ENOMEM;
+
+	for (i = 0; i < job->bo_count; i++)
+		job->bo_flags[i] = PANFROST_BO_REF_EXCLUSIVE;
+
 	ret = drm_gem_objects_lookup(file_priv,
 				     (void __user *)(uintptr_t)args->bo_handles,
 				     job->bo_count, &job->bos);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index ed8d1588b1de..1a9085d8dcf1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -245,9 +245,17 @@ static int panfrost_acquire_object_fences(struct panfrost_job *job)
 	int i, ret;
 
 	for (i = 0; i < job->bo_count; i++) {
+		bool exclusive = job->bo_flags[i] & PANFROST_BO_REF_EXCLUSIVE;
+
+		if (!exclusive) {
+			ret = dma_resv_reserve_shared(job->bos[i]->resv, 1);
+			if (ret)
+				return ret;
+		}
+
 		/* panfrost always uses write mode in its current uapi */
 		ret = drm_sched_job_add_implicit_dependencies(&job->base, job->bos[i],
-							      true);
+							      exclusive);
 		if (ret)
 			return ret;
 	}
@@ -259,8 +267,14 @@ static void panfrost_attach_object_fences(struct panfrost_job *job)
 {
 	int i;
 
-	for (i = 0; i < job->bo_count; i++)
-		dma_resv_add_excl_fence(job->bos[i]->resv, job->render_done_fence);
+	for (i = 0; i < job->bo_count; i++) {
+		struct dma_resv *robj = job->bos[i]->resv;
+
+		if (job->bo_flags[i] & PANFROST_BO_REF_EXCLUSIVE)
+			dma_resv_add_excl_fence(robj, job->render_done_fence);
+		else
+			dma_resv_add_shared_fence(robj, job->render_done_fence);
+	}
 }
 
 int panfrost_job_push(struct panfrost_job *job)
@@ -326,6 +340,7 @@ static void panfrost_job_cleanup(struct kref *ref)
 		kvfree(job->bos);
 	}
 
+	kvfree(job->bo_flags);
 	kfree(job);
 }
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index 77e6d0e6f612..96d755f12cf7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -28,6 +28,7 @@ struct panfrost_job {
 
 	struct panfrost_gem_mapping **mappings;
 	struct drm_gem_object **bos;
+	u32 *bo_flags;
 	u32 bo_count;
 
 	/* Fence to be signaled by drm-sched once its done with the job */
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index a2de81225125..c8fdf45b1573 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -226,6 +226,9 @@ struct drm_panfrost_madvise {
 	__u32 retained;       /* out, whether backing store still exists */
 };
 
+/* Exclusive (AKA write) access to the BO */
+#define PANFROST_BO_REF_EXCLUSIVE	0x1
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.31.1

