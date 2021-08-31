Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE78B3FC855
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 15:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AFA89F31;
	Tue, 31 Aug 2021 13:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDE889F31
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 13:36:04 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4E9451F431EA;
 Tue, 31 Aug 2021 14:36:02 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH] panfrost: Don't cleanup the job if it was successfully queued
Date: Tue, 31 Aug 2021 15:35:56 +0200
Message-Id: <20210831133556.236984-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
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

The labels are misleading. Even though they are all prefixed with 'fail_'
the success case also takes that path, and we should definitely not
cleanup the job if it's been queued. While at it, let's rename those
labels so we don't do the same mistake again.

Fixes: 53516280cc38 ("drm/panfrost: use scheduler dependency tracking")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 16212b6b202e..077cbbfa506b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -253,7 +253,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 	job = kzalloc(sizeof(*job), GFP_KERNEL);
 	if (!job) {
 		ret = -ENOMEM;
-		goto fail_out_sync;
+		goto out_put_syncout;
 	}
 
 	kref_init(&job->refcount);
@@ -270,29 +270,30 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 				 &job->file_priv->sched_entity[slot],
 				 NULL);
 	if (ret)
-		goto fail_job_put;
+		goto out_put_job;
 
 	ret = panfrost_copy_in_sync(dev, file, args, job);
 	if (ret)
-		goto fail_job;
+		goto out_cleanup_job;
 
 	ret = panfrost_lookup_bos(dev, file, args, job);
 	if (ret)
-		goto fail_job;
+		goto out_cleanup_job;
 
 	ret = panfrost_job_push(job);
 	if (ret)
-		goto fail_job;
+		goto out_cleanup_job;
 
 	/* Update the return sync object for the job */
 	if (sync_out)
 		drm_syncobj_replace_fence(sync_out, job->render_done_fence);
 
-fail_job:
-	drm_sched_job_cleanup(&job->base);
-fail_job_put:
+out_cleanup_job:
+	if (ret)
+		drm_sched_job_cleanup(&job->base);
+out_put_job:
 	panfrost_job_put(job);
-fail_out_sync:
+out_put_syncout:
 	if (sync_out)
 		drm_syncobj_put(sync_out);
 
-- 
2.31.1

