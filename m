Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B36EF1B32C7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 00:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16BB6E0E0;
	Tue, 21 Apr 2020 22:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF1776E0E0;
 Tue, 21 Apr 2020 22:51:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 607BB31B;
 Tue, 21 Apr 2020 15:51:48 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C1CD33F73D;
 Tue, 21 Apr 2020 15:51:47 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: yuq825@gmail.com
Subject: [PATCH 2/2] drm/lima: Clean up redundant pdev pointer
Date: Tue, 21 Apr 2020 23:51:37 +0100
Message-Id: <8d9073cc91c10fc70910587fd1794e0e8f32b467.1587509150.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.23.0.dirty
In-Reply-To: <de475904091400ef6c123285f221094654d96d35.1587509150.git.robin.murphy@arm.com>
References: <de475904091400ef6c123285f221094654d96d35.1587509150.git.robin.murphy@arm.com>
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
Cc: lima@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no point explicitly tracking the platform device when it can be
trivially derived from the regular device pointer in the couple of
places it's ever used.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/lima/lima_devfreq.c | 7 +++----
 drivers/gpu/drm/lima/lima_device.c  | 5 ++---
 drivers/gpu/drm/lima/lima_device.h  | 1 -
 drivers/gpu/drm/lima/lima_drv.c     | 1 -
 4 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index 8c4d21d07529..1d479b5924fe 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -101,13 +101,12 @@ void lima_devfreq_fini(struct lima_device *ldev)
 	}
 
 	if (devfreq->devfreq) {
-		devm_devfreq_remove_device(&ldev->pdev->dev,
-					   devfreq->devfreq);
+		devm_devfreq_remove_device(ldev->dev, devfreq->devfreq);
 		devfreq->devfreq = NULL;
 	}
 
 	if (devfreq->opp_of_table_added) {
-		dev_pm_opp_of_remove_table(&ldev->pdev->dev);
+		dev_pm_opp_of_remove_table(ldev->dev);
 		devfreq->opp_of_table_added = false;
 	}
 
@@ -125,7 +124,7 @@ void lima_devfreq_fini(struct lima_device *ldev)
 int lima_devfreq_init(struct lima_device *ldev)
 {
 	struct thermal_cooling_device *cooling;
-	struct device *dev = &ldev->pdev->dev;
+	struct device *dev = ldev->dev;
 	struct opp_table *opp_table;
 	struct devfreq *devfreq;
 	struct lima_devfreq *ldevfreq = &ldev->devfreq;
diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
index c334d297796a..29285dedd124 100644
--- a/drivers/gpu/drm/lima/lima_device.c
+++ b/drivers/gpu/drm/lima/lima_device.c
@@ -297,8 +297,8 @@ static void lima_fini_pp_pipe(struct lima_device *dev)
 
 int lima_device_init(struct lima_device *ldev)
 {
+	struct platform_device *pdev = to_platform_device(ldev->dev);
 	int err, i;
-	struct resource *res;
 
 	dma_set_coherent_mask(ldev->dev, DMA_BIT_MASK(32));
 
@@ -329,8 +329,7 @@ int lima_device_init(struct lima_device *ldev)
 	} else
 		ldev->va_end = LIMA_VA_RESERVE_END;
 
-	res = platform_get_resource(ldev->pdev, IORESOURCE_MEM, 0);
-	ldev->iomem = devm_ioremap_resource(ldev->dev, res);
+	ldev->iomem = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ldev->iomem)) {
 		dev_err(ldev->dev, "fail to ioremap iomem\n");
 		err = PTR_ERR(ldev->iomem);
diff --git a/drivers/gpu/drm/lima/lima_device.h b/drivers/gpu/drm/lima/lima_device.h
index 06fd9636dd72..99b1fb147dad 100644
--- a/drivers/gpu/drm/lima/lima_device.h
+++ b/drivers/gpu/drm/lima/lima_device.h
@@ -76,7 +76,6 @@ enum lima_pipe_id {
 struct lima_device {
 	struct device *dev;
 	struct drm_device *ddev;
-	struct platform_device *pdev;
 
 	enum lima_gpu_id id;
 	u32 gp_version;
diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index bbbdc8455e2f..4e5dd75822c0 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -380,7 +380,6 @@ static int lima_pdev_probe(struct platform_device *pdev)
 		goto err_out0;
 	}
 
-	ldev->pdev = pdev;
 	ldev->dev = &pdev->dev;
 	ldev->id = (enum lima_gpu_id)of_device_get_match_data(&pdev->dev);
 
-- 
2.23.0.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
