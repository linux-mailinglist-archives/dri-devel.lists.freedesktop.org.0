Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB5D52D74D
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 17:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFC910E41E;
	Thu, 19 May 2022 15:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C29710E41E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 15:20:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A48614BF;
 Thu, 19 May 2022 08:20:13 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com
 [10.1.25.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 831E33F66F;
 Thu, 19 May 2022 08:20:11 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH] drm/panfrost: Job should reference MMU not file_priv
Date: Thu, 19 May 2022 16:20:03 +0100
Message-Id: <20220519152003.81081-1-steven.price@arm.com>
X-Mailer: git-send-email 2.25.1
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For a while now it's been allowed for a MMU context to outlive it's
corresponding panfrost_priv, however the job structure still references
panfrost_priv to get hold of the MMU context. If panfrost_priv has been
freed this is a use-after-free which I've been able to trigger resulting
in a splat.

To fix this, drop the reference to panfrost_priv in the job structure
and add a direct reference to the MMU structure which is what's actually
needed.

Fixes: 7fdc48cc63a3 ("drm/panfrost: Make sure MMU context lifetime is not bound to panfrost_priv")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 5 +++--
 drivers/gpu/drm/panfrost/panfrost_job.c | 6 +++---
 drivers/gpu/drm/panfrost/panfrost_job.h | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7fcbc2a5b6cd..087e69b98d06 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -233,6 +233,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
 	struct panfrost_device *pfdev = dev->dev_private;
+	struct panfrost_file_priv *file_priv = file->driver_priv;
 	struct drm_panfrost_submit *args = data;
 	struct drm_syncobj *sync_out = NULL;
 	struct panfrost_job *job;
@@ -262,12 +263,12 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 	job->jc = args->jc;
 	job->requirements = args->requirements;
 	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
-	job->file_priv = file->driver_priv;
+	job->mmu = file_priv->mmu;
 
 	slot = panfrost_job_get_slot(job);
 
 	ret = drm_sched_job_init(&job->base,
-				 &job->file_priv->sched_entity[slot],
+				 &file_priv->sched_entity[slot],
 				 NULL);
 	if (ret)
 		goto out_put_job;
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index fda5871aebe3..7c4208476fbd 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -201,7 +201,7 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 		return;
 	}
 
-	cfg = panfrost_mmu_as_get(pfdev, job->file_priv->mmu);
+	cfg = panfrost_mmu_as_get(pfdev, job->mmu);
 
 	job_write(pfdev, JS_HEAD_NEXT_LO(js), lower_32_bits(jc_head));
 	job_write(pfdev, JS_HEAD_NEXT_HI(js), upper_32_bits(jc_head));
@@ -435,7 +435,7 @@ static void panfrost_job_handle_err(struct panfrost_device *pfdev,
 		job->jc = 0;
 	}
 
-	panfrost_mmu_as_put(pfdev, job->file_priv->mmu);
+	panfrost_mmu_as_put(pfdev, job->mmu);
 	panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
 
 	if (signal_fence)
@@ -456,7 +456,7 @@ static void panfrost_job_handle_done(struct panfrost_device *pfdev,
 	 * happen when we receive the DONE interrupt while doing a GPU reset).
 	 */
 	job->jc = 0;
-	panfrost_mmu_as_put(pfdev, job->file_priv->mmu);
+	panfrost_mmu_as_put(pfdev, job->mmu);
 	panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
 
 	dma_fence_signal_locked(job->done_fence);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index 77e6d0e6f612..8becc1ba0eb9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -17,7 +17,7 @@ struct panfrost_job {
 	struct kref refcount;
 
 	struct panfrost_device *pfdev;
-	struct panfrost_file_priv *file_priv;
+	struct panfrost_mmu *mmu;
 
 	/* Fence to be signaled by IRQ handler when the job is complete. */
 	struct dma_fence *done_fence;
-- 
2.30.2

