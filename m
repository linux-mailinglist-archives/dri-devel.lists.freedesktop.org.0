Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C5F72605A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 15:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B648E10E4FB;
	Wed,  7 Jun 2023 13:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54D610E4F6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 13:02:29 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q6sny-0004N0-4v; Wed, 07 Jun 2023 15:02:26 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 7/8] drm/etnaviv: drop GPU initialized property
Date: Wed,  7 Jun 2023 15:02:22 +0200
Message-Id: <20230607130223.3533464-7-l.stach@pengutronix.de>
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

Now that it is only used to track the driver internal state of
the MMU global and cmdbuf objects, we can get rid of this property
by making the free/finit functions of those objects safe to call
on an uninitialized object.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c | 3 +++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c    | 9 ++-------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h    | 1 -
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c    | 3 +++
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
index 9dc20d892c15..721d633aece9 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
@@ -121,6 +121,9 @@ void etnaviv_cmdbuf_free(struct etnaviv_cmdbuf *cmdbuf)
 	int order = order_base_2(ALIGN(cmdbuf->size, SUBALLOC_GRANULE) /
 				 SUBALLOC_GRANULE);
 
+	if (!suballoc)
+		return;
+
 	mutex_lock(&suballoc->lock);
 	bitmap_release_region(suballoc->granule_map,
 			      cmdbuf->suballoc_offset / SUBALLOC_GRANULE,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 96cbb290b869..e62761032afe 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -868,8 +868,6 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	pm_runtime_mark_last_busy(gpu->dev);
 	pm_runtime_put_autosuspend(gpu->dev);
 
-	gpu->initialized = true;
-
 	return 0;
 
 fail:
@@ -1797,11 +1795,8 @@ static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
 	if (gpu->mmu_context)
 		etnaviv_iommu_context_put(gpu->mmu_context);
 
-	if (gpu->initialized) {
-		etnaviv_cmdbuf_free(&gpu->buffer);
-		etnaviv_iommu_global_fini(gpu);
-		gpu->initialized = false;
-	}
+	etnaviv_cmdbuf_free(&gpu->buffer);
+	etnaviv_iommu_global_fini(gpu);
 
 	gpu->drm = NULL;
 	xa_destroy(&gpu->user_fences);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 33ecc1bf84b1..a4a9253f0d52 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -114,7 +114,6 @@ struct etnaviv_gpu {
 	struct mutex sched_lock;
 	struct drm_gpu_scheduler sched;
 	enum etnaviv_gpu_state state;
-	bool initialized;
 
 	/* 'ring'-buffer: */
 	struct etnaviv_cmdbuf buffer;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index 67bdce5326c6..4fa72567183a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -553,6 +553,9 @@ void etnaviv_iommu_global_fini(struct etnaviv_gpu *gpu)
 	struct etnaviv_drm_private *priv = gpu->drm->dev_private;
 	struct etnaviv_iommu_global *global = priv->mmu_global;
 
+	if (!global)
+		return;
+
 	if (--global->use > 0)
 		return;
 
-- 
2.39.2

