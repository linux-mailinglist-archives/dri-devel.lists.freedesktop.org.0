Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FC1726057
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 15:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7C510E4FA;
	Wed,  7 Jun 2023 13:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E5610E4F1
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 13:02:28 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q6snw-0004N0-Of; Wed, 07 Jun 2023 15:02:24 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 3/8] drm/etnaviv: move runtime PM handling to events
Date: Wed,  7 Jun 2023 15:02:18 +0200
Message-Id: <20230607130223.3533464-3-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230607130223.3533464-1-l.stach@pengutronix.de>
References: <20230607130223.3533464-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conceptually events are the right abstraction to handle the GPU
runtime PM state: as long as any event is pending the GPU can not
be idle. Events are also properly freed and reallocated when the
GPU has been reset after a hang.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  1 -
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  3 ---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 27 ++++++++++++--------
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
index baa81cbf701a..a42d260cac2c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
@@ -97,7 +97,6 @@ struct etnaviv_gem_submit {
 	struct list_head node; /* GPU active submit list */
 	struct etnaviv_cmdbuf cmdbuf;
 	struct pid *pid;       /* submitting process */
-	bool runtime_resumed;
 	u32 exec_state;
 	u32 flags;
 	unsigned int nr_pmrs;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 45403ea38906..2416c526f9b0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -362,9 +362,6 @@ static void submit_cleanup(struct kref *kref)
 			container_of(kref, struct etnaviv_gem_submit, refcount);
 	unsigned i;
 
-	if (submit->runtime_resumed)
-		pm_runtime_put_autosuspend(submit->gpu->dev);
-
 	if (submit->cmdbuf.suballoc)
 		etnaviv_cmdbuf_free(&submit->cmdbuf);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 4e18aa8566c6..54a1249c5bca 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1139,7 +1139,8 @@ static int event_alloc(struct etnaviv_gpu *gpu, unsigned nr_events,
 	unsigned int *events)
 {
 	unsigned long timeout = msecs_to_jiffies(10 * 10000);
-	unsigned i, acquired = 0;
+	unsigned i, acquired = 0, rpm_count = 0;
+	int ret;
 
 	for (i = 0; i < nr_events; i++) {
 		unsigned long ret;
@@ -1148,6 +1149,7 @@ static int event_alloc(struct etnaviv_gpu *gpu, unsigned nr_events,
 
 		if (!ret) {
 			dev_err(gpu->dev, "wait_for_completion_timeout failed");
+			ret = -EBUSY;
 			goto out;
 		}
 
@@ -1167,13 +1169,23 @@ static int event_alloc(struct etnaviv_gpu *gpu, unsigned nr_events,
 
 	spin_unlock(&gpu->event_spinlock);
 
+	for (i = 0; i < nr_events; i++) {
+		ret = pm_runtime_resume_and_get(gpu->dev);
+		if (ret)
+			goto out_rpm;
+		rpm_count++;
+	}
+
 	return 0;
 
+out_rpm:
+	for (i = 0; i < rpm_count; i++)
+		pm_runtime_put_autosuspend(gpu->dev);
 out:
 	for (i = 0; i < acquired; i++)
 		complete(&gpu->event_free);
 
-	return -EBUSY;
+	return ret;
 }
 
 static void event_free(struct etnaviv_gpu *gpu, unsigned int event)
@@ -1185,6 +1197,8 @@ static void event_free(struct etnaviv_gpu *gpu, unsigned int event)
 		clear_bit(event, gpu->event_bitmap);
 		complete(&gpu->event_free);
 	}
+
+	pm_runtime_put_autosuspend(gpu->dev);
 }
 
 /*
@@ -1327,15 +1341,6 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
 	unsigned int i, nr_events = 1, event[3];
 	int ret;
 
-	if (!submit->runtime_resumed) {
-		ret = pm_runtime_get_sync(gpu->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(gpu->dev);
-			return NULL;
-		}
-		submit->runtime_resumed = true;
-	}
-
 	/*
 	 * if there are performance monitor requests we need to have
 	 * - a sync point to re-configure gpu and process ETNA_PM_PROCESS_PRE
-- 
2.39.2

