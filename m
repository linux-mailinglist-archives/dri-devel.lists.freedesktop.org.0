Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F17CC62D10
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 08:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CAE10E197;
	Mon, 17 Nov 2025 07:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B030110E197
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:57:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [202.112.113.212])
 by APP-01 (Coremail) with SMTP id qwCowABH4M9W1Rppg5AGAQ--.247S2;
 Mon, 17 Nov 2025 15:57:21 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: anitha.chrisanthus@intel.com, edmund.j.dea@intel.com, airlied@gmail.com,
 simona@ffwll.ch, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, Ma Ke <make24@iscas.ac.cn>,
 stable@vger.kernel.org
Subject: [PATCH] drm/kmb: Fix error handling in kmb_probe
Date: Mon, 17 Nov 2025 15:57:08 +0800
Message-Id: <20251117075708.37414-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowABH4M9W1Rppg5AGAQ--.247S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kry8uF43tryftrWkXF4fZrb_yoW8tF1DpF
 ZrGFyrtrW8Gr4IkrW7Z3W8Za43Aa17tayfursrG34kWr4Yyr9FgF97Z3W2yayrJFW8WFWx
 tFZrKa18uF4DXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
 648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67
 AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
 1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbsmitUU
 UUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
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

kmb_probe() obtain a reference to a platform device by
of_find_device_by_node(). This call increases the reference count of
the returned device, which should be dropped by calling put_device()
when the device is no longer needed. However, the code fails to call
put_device() in several error handling paths and the normal device
removal path. This could result in reference count leaks that prevent
the proper cleanup of the platform device when the driver is unloaded
or during error recovery.

Add put_device() in all code paths where dsi_pdev is no longer needed,
including error paths and the normal removal path.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 32cda134ae3e..4fc9fdf92118 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -473,6 +473,8 @@ static void kmb_remove(struct platform_device *pdev)
 
 	/* Unregister DSI host */
 	kmb_dsi_host_unregister(kmb->kmb_dsi);
+	if (kmb->kmb_dsi && kmb->kmb_dsi->pdev)
+		put_device(&kmb->kmb_dsi->pdev->dev);
 	drm_atomic_helper_shutdown(drm);
 }
 
@@ -517,17 +519,20 @@ static int kmb_probe(struct platform_device *pdev)
 	ret = kmb_dsi_host_bridge_init(get_device(&dsi_pdev->dev));
 
 	if (ret == -EPROBE_DEFER) {
-		return -EPROBE_DEFER;
+		ret = -EPROBE_DEFER;
+		goto err_free2;
 	} else if (ret) {
 		DRM_ERROR("probe failed to initialize DSI host bridge\n");
-		return ret;
+		goto err_free2;
 	}
 
 	/* Create DRM device */
 	kmb = devm_drm_dev_alloc(dev, &kmb_driver,
 				 struct kmb_drm_private, drm);
-	if (IS_ERR(kmb))
-		return PTR_ERR(kmb);
+	if (IS_ERR(kmb)) {
+		ret = PTR_ERR(kmb);
+		goto err_free2;
+	}
 
 	dev_set_drvdata(dev, &kmb->drm);
 
@@ -576,7 +581,8 @@ static int kmb_probe(struct platform_device *pdev)
  err_free1:
 	dev_set_drvdata(dev, NULL);
 	kmb_dsi_host_unregister(kmb->kmb_dsi);
-
+ err_free2:
+	put_device(&dsi_pdev->dev);
 	return ret;
 }
 
-- 
2.17.1

