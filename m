Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46834336EC7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 10:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427506EB59;
	Thu, 11 Mar 2021 09:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220BD6EB57
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 09:25:47 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CCEE71F4600D;
 Thu, 11 Mar 2021 09:25:45 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [RFC PATCH 4/7] drm/panfrost: Add BO access flags to relax
 dependencies between jobs
Date: Thu, 11 Mar 2021 10:25:36 +0100
Message-Id: <20210311092539.2405596-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311092539.2405596-1-boris.brezillon@collabora.com>
References: <20210311092539.2405596-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jobs reading from the same BO should not be serialized. Add access flags
so we can relax the implicit dependencies in that case. We force RW
access for now to keep the behavior unchanged, but a new SUBMIT ioctl
taking explicit access flags will be introduced.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c |  9 +++++++++
 drivers/gpu/drm/panfrost/panfrost_job.c | 15 +++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_job.h |  1 +
 include/uapi/drm/panfrost_drm.h         |  4 ++++
 4 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 32e822e00a08..be45efee47a2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -163,6 +163,15 @@ panfrost_lookup_bos(struct drm_device *dev,
 	if (!job->bo_count)
 		return 0;
 
+	job->bo_flags = kvmalloc_array(job->bo_count,
+				       sizeof(*job->bo_flags),
+				       GFP_KERNEL | __GFP_ZERO);
+	if (!job->bo_flags)
+		return -ENOMEM;
+
+	for (i = 0; i < job->bo_count; i++)
+		job->bo_flags[i] = PANFROST_BO_REF_RW;
+
 	ret = drm_gem_objects_lookup(file_priv,
 				     (void __user *)(uintptr_t)args->bo_handles,
 				     job->bo_count, &job->bos);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 87bfbd77d753..170c3b0c8641 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -201,10 +201,17 @@ static int panfrost_acquire_object_fences(struct panfrost_job *job)
 	int i;
 
 	for (i = 0; i < job->bo_count; i++) {
+		bool write = job->bo_flags[i] & PANFROST_BO_REF_WRITE;
 		int ret;
 
+		if (!(job->bo_flags[i] & PANFROST_BO_REF_WRITE)) {
+			ret = dma_resv_reserve_shared(job->bos[i]->resv, 1);
+			if (ret)
+				return ret;
+		}
+
 		ret = drm_gem_fence_array_add_implicit(&job->deps,
-						       job->bos[i], true);
+						       job->bos[i], write);
 		if (ret)
 			return ret;
 	}
@@ -219,7 +226,10 @@ static void panfrost_attach_object_fences(struct panfrost_job *job)
 	for (i = 0; i < job->bo_count; i++) {
 		struct dma_resv *robj = job->bos[i]->resv;
 
-		dma_resv_add_excl_fence(robj, job->render_done_fence);
+		if (job->bo_flags[i] & PANFROST_BO_REF_WRITE)
+			dma_resv_add_excl_fence(robj, job->render_done_fence);
+		else
+			dma_resv_add_shared_fence(robj, job->render_done_fence);
 	}
 }
 
@@ -298,6 +308,7 @@ static void panfrost_job_cleanup(struct kref *ref)
 		kvfree(job->bos);
 	}
 
+	kvfree(job->bo_flags);
 	kfree(job);
 }
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index b10b5be57dd2..c3f662771ed9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -31,6 +31,7 @@ struct panfrost_job {
 
 	struct panfrost_gem_mapping **mappings;
 	struct drm_gem_object **bos;
+	u32 *bo_flags;
 	u32 bo_count;
 
 	/* Fence to be signaled by drm-sched once its done with the job */
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index ec19db1eead8..eab96d7e0e0e 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -223,6 +223,10 @@ struct drm_panfrost_madvise {
 	__u32 retained;       /* out, whether backing store still exists */
 };
 
+#define PANFROST_BO_REF_READ		0x1
+#define PANFROST_BO_REF_WRITE		0x2
+#define PANFROST_BO_REF_RW		(PANFROST_BO_REF_READ | PANFROST_BO_REF_WRITE)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
