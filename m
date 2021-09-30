Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE53F41E209
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 21:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8D36EC4D;
	Thu, 30 Sep 2021 19:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCA96EC4D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 19:10:00 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2A4BB1F451E7;
 Thu, 30 Sep 2021 20:09:59 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v5 1/8] drm/panfrost: Pass a job to panfrost_{acquire,
 attach}_object_fences()
Date: Thu, 30 Sep 2021 21:09:47 +0200
Message-Id: <20210930190954.1525933-2-boris.brezillon@collabora.com>
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

So we don't have to change the prototype if we extend the function.

v3:
* Fix subject

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 908d79520853..ed8d1588b1de 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -240,15 +240,13 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 	spin_unlock(&pfdev->js->job_lock);
 }
 
-static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
-					  int bo_count,
-					  struct drm_sched_job *job)
+static int panfrost_acquire_object_fences(struct panfrost_job *job)
 {
 	int i, ret;
 
-	for (i = 0; i < bo_count; i++) {
+	for (i = 0; i < job->bo_count; i++) {
 		/* panfrost always uses write mode in its current uapi */
-		ret = drm_sched_job_add_implicit_dependencies(job, bos[i],
+		ret = drm_sched_job_add_implicit_dependencies(&job->base, job->bos[i],
 							      true);
 		if (ret)
 			return ret;
@@ -257,14 +255,12 @@ static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
 	return 0;
 }
 
-static void panfrost_attach_object_fences(struct drm_gem_object **bos,
-					  int bo_count,
-					  struct dma_fence *fence)
+static void panfrost_attach_object_fences(struct panfrost_job *job)
 {
 	int i;
 
-	for (i = 0; i < bo_count; i++)
-		dma_resv_add_excl_fence(bos[i]->resv, fence);
+	for (i = 0; i < job->bo_count; i++)
+		dma_resv_add_excl_fence(job->bos[i]->resv, job->render_done_fence);
 }
 
 int panfrost_job_push(struct panfrost_job *job)
@@ -283,8 +279,7 @@ int panfrost_job_push(struct panfrost_job *job)
 
 	job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
 
-	ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
-					     &job->base);
+	ret = panfrost_acquire_object_fences(job);
 	if (ret) {
 		mutex_unlock(&pfdev->sched_lock);
 		goto unlock;
@@ -296,8 +291,7 @@ int panfrost_job_push(struct panfrost_job *job)
 
 	mutex_unlock(&pfdev->sched_lock);
 
-	panfrost_attach_object_fences(job->bos, job->bo_count,
-				      job->render_done_fence);
+	panfrost_attach_object_fences(job);
 
 unlock:
 	drm_gem_unlock_reservations(job->bos, job->bo_count, &acquire_ctx);
-- 
2.31.1

