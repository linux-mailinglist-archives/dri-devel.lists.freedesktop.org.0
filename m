Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525CA8C955B
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 18:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238A610E2C7;
	Sun, 19 May 2024 16:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="cVpdhXYz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com
 [91.218.175.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5433B10E2C7
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 16:55:46 +0000 (UTC)
X-Envelope-To: l.stach@pengutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716137744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EFYuWykwL1U4iv85dPQQK/TFC0Vjyb1IATiwN/iE76Q=;
 b=cVpdhXYzbGvg9D3LY2MmiBLKPrGIEy/mf3TWS3BAPUz9HMPI8ILszrEsLY5Rp0HacuSaIn
 bMdWGQWdg7IWkfT/5oziJ+hhzycV7sQjLFC1obPYqGaHf0h543ME/N7rVVQ7dBbP5D0rEV
 IM1M9zkwbTWclhbIqGujBrA8psHb7xA=
X-Envelope-To: linux+etnaviv@armlinux.org.uk
X-Envelope-To: christian.gmeiner@gmail.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: etnaviv@lists.freedesktop.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: sui.jingfeng@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [etnaviv-next v14 6/8] drm/etnaviv: Replace the '&pdev->dev' with
 'dev'
Date: Mon, 20 May 2024 00:53:19 +0800
Message-Id: <20240519165321.2123356-7-sui.jingfeng@linux.dev>
In-Reply-To: <20240519165321.2123356-1-sui.jingfeng@linux.dev>
References: <20240519165321.2123356-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

In the etnaviv_pdev_probe(), etnaviv_gpu_platform_probe() function, the
value of '&pdev->dev' has been cached to the 'dev' local auto variable.
But part of callers use 'dev' as argument, while the rest use '&pdev->dev'.

To keep it consistent, use 'dev' uniformly.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 10 +++++-----
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 16 ++++++++--------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 986fd68b489a..863faac2ea19 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -614,7 +614,7 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 			if (!of_device_is_available(core_node))
 				continue;
 
-			drm_of_component_match_add(&pdev->dev, &match,
+			drm_of_component_match_add(dev, &match,
 						   component_compare_of, core_node);
 		}
 	} else {
@@ -637,9 +637,9 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 	 * bit to make sure we are allocating the command buffers and
 	 * TLBs in the lower 4 GiB address space.
 	 */
-	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(40)) ||
-	    dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32))) {
-		dev_dbg(&pdev->dev, "No suitable DMA available\n");
+	if (dma_set_mask(dev, DMA_BIT_MASK(40)) ||
+	    dma_set_coherent_mask(dev, DMA_BIT_MASK(32))) {
+		dev_dbg(dev, "No suitable DMA available\n");
 		return -ENODEV;
 	}
 
@@ -650,7 +650,7 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 	 */
 	first_node = etnaviv_of_first_available_node();
 	if (first_node) {
-		of_dma_configure(&pdev->dev, first_node, true);
+		of_dma_configure(dev, first_node, true);
 		of_node_put(first_node);
 	}
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index aa15682f94db..3a14e187388a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1891,7 +1891,7 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	if (!gpu)
 		return -ENOMEM;
 
-	gpu->dev = &pdev->dev;
+	gpu->dev = dev;
 	mutex_init(&gpu->lock);
 	mutex_init(&gpu->sched_lock);
 
@@ -1905,8 +1905,8 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	if (gpu->irq < 0)
 		return gpu->irq;
 
-	err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
-			       dev_name(gpu->dev), gpu);
+	err = devm_request_irq(dev, gpu->irq, irq_handler, 0,
+			       dev_name(dev), gpu);
 	if (err) {
 		dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq, err);
 		return err;
@@ -1925,13 +1925,13 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	 * autosuspend delay is rather arbitary: no measurements have
 	 * yet been performed to determine an appropriate value.
 	 */
-	pm_runtime_use_autosuspend(gpu->dev);
-	pm_runtime_set_autosuspend_delay(gpu->dev, 200);
-	pm_runtime_enable(gpu->dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 200);
+	pm_runtime_enable(dev);
 
-	err = component_add(&pdev->dev, &gpu_ops);
+	err = component_add(dev, &gpu_ops);
 	if (err < 0) {
-		dev_err(&pdev->dev, "failed to register component: %d\n", err);
+		dev_err(dev, "failed to register component: %d\n", err);
 		return err;
 	}
 
-- 
2.34.1

