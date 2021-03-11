Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA66336ECA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 10:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DC76EB5B;
	Thu, 11 Mar 2021 09:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C126EB51
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 09:25:46 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D08B91F46003;
 Thu, 11 Mar 2021 09:25:44 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [RFC PATCH 1/7] drm/panfrost: Pass a job to panfrost_{acquire,
 attach_object_fences}()
Date: Thu, 11 Mar 2021 10:25:33 +0100
Message-Id: <20210311092539.2405596-2-boris.brezillon@collabora.com>
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

So we don't have to change the prototype if we extend the function.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 6003cfeb1322..564054a96ca9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -196,24 +196,20 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 	job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
 }
 
-static void panfrost_acquire_object_fences(struct drm_gem_object **bos,
-					   int bo_count,
-					   struct dma_fence **implicit_fences)
+static void panfrost_acquire_object_fences(struct panfrost_job *job)
 {
 	int i;
 
-	for (i = 0; i < bo_count; i++)
-		implicit_fences[i] = dma_resv_get_excl_rcu(bos[i]->resv);
+	for (i = 0; i < job->bo_count; i++)
+		job->implicit_fences[i] = dma_resv_get_excl_rcu(job->bos[i]->resv);
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
@@ -243,15 +239,13 @@ int panfrost_job_push(struct panfrost_job *job)
 
 	kref_get(&job->refcount); /* put by scheduler job completion */
 
-	panfrost_acquire_object_fences(job->bos, job->bo_count,
-				       job->implicit_fences);
+	panfrost_acquire_object_fences(job);
 
 	drm_sched_entity_push_job(&job->base, entity);
 
 	mutex_unlock(&pfdev->sched_lock);
 
-	panfrost_attach_object_fences(job->bos, job->bo_count,
-				      job->render_done_fence);
+	panfrost_attach_object_fences(job);
 
 unlock:
 	drm_gem_unlock_reservations(job->bos, job->bo_count, &acquire_ctx);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
