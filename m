Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC4D4FC77A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 00:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3DD10E0A0;
	Mon, 11 Apr 2022 22:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFD810E0A0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 22:16:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 5B7181F43242
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649715379;
 bh=5ktnqTbMMHX7JjM1x4kfTyCzWU6VswdmB+oOmMaUXzQ=;
 h=From:To:Cc:Subject:Date:From;
 b=SCUxpvTtvSXqWaPUjB3p6PQUx4FhVyGZ2c0qihVCWw4EXMUU5j3o95Y/RI6FRxFVO
 DRjJgN/kCr0Usnvzt93xXLas9CWlovnKwvQp3JpoLcuEcym9B8hdhjyfy43sPMIQr7
 iGpJ/+gqx5X8CoFxuPrO0V+rHA00TUWgF7pYNjPv86KUR87oAAJ7A8BO5a0PTtRo8M
 4ECAJ66QYoyj40TCXeH+E2vl1XoktxGH138Wb2KyjuYN/LIXy3Sts1Ze/FJD73peMr
 yTV97BwBjuFGGizXBz5ovkCxFnHvoSrfufsH2Vq2jnKWqPr3oXqrNRJo8UVj8J0BW9
 9EEBpICe2zp0Q==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
Date: Tue, 12 Apr 2022 01:15:36 +0300
Message-Id: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Interrupt context can't sleep. Drivers like Panfrost and MSM are taking
mutex when job is released, and thus, that code can sleep. This results
into "BUG: scheduling while atomic" if locks are contented while job is
freed. There is no good reason for releasing scheduler's jobs in IRQ
context, hence use normal context to fix the trouble.

Cc: stable@vger.kernel.org
Fixes: 542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a processes")
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 6 +++---
 include/drm/gpu_scheduler.h              | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 191c56064f19..6b25b2f4f5a3 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -190,7 +190,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 }
 EXPORT_SYMBOL(drm_sched_entity_flush);
 
-static void drm_sched_entity_kill_jobs_irq_work(struct irq_work *wrk)
+static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
 {
 	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
 
@@ -207,8 +207,8 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
 						 finish_cb);
 
-	init_irq_work(&job->work, drm_sched_entity_kill_jobs_irq_work);
-	irq_work_queue(&job->work);
+	INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
+	schedule_work(&job->work);
 }
 
 static struct dma_fence *
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 0fca8f38bee4..addb135eeea6 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -28,7 +28,7 @@
 #include <linux/dma-fence.h>
 #include <linux/completion.h>
 #include <linux/xarray.h>
-#include <linux/irq_work.h>
+#include <linux/workqueue.h>
 
 #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
 
@@ -295,7 +295,7 @@ struct drm_sched_job {
 	 */
 	union {
 		struct dma_fence_cb		finish_cb;
-		struct irq_work 		work;
+		struct work_struct 		work;
 	};
 
 	uint64_t			id;
-- 
2.35.1

