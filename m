Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F3572F2C4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 04:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE73B10E414;
	Wed, 14 Jun 2023 02:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C5B610E40C;
 Wed, 14 Jun 2023 02:48:00 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:39796.1729481184
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 56F9A102A0A;
 Wed, 14 Jun 2023 10:47:57 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-xp9j7 with ESMTP id
 9bcf566c75864b53860340869d884dc2 for l.stach@pengutronix.de; 
 Wed, 14 Jun 2023 10:47:59 CST
X-Transaction-ID: 9bcf566c75864b53860340869d884dc2
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v9 9/9] drm/etnaviv: Clean up etnaviv_pdev_probe() function
Date: Wed, 14 Jun 2023 10:47:45 +0800
Message-Id: <20230614024745.865129-10-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230614024745.865129-1-15330273260@189.cn>
References: <20230614024745.865129-1-15330273260@189.cn>
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
Cc: loongson-kernel@lists.loongnix.cn, Sui Jingfeng <suijingfeng@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Add a dedicate function to do the DMA configuration to the virtual master.
Also replace the &pdev->dev with dev.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 65 +++++++++++++++------------
 1 file changed, 36 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 0ee7f641cee3..df4c21a17d9d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -54,6 +54,40 @@ static bool etnaviv_is_dma_coherent(struct device *dev)
 	return coherent;
 }
 
+static int etnaviv_of_dma_configure(struct device *dev)
+{
+	struct device_node *first_node;
+
+	/*
+	 * PTA and MTLB can have 40 bit base addresses, but
+	 * unfortunately, an entry in the MTLB can only point to a
+	 * 32 bit base address of a STLB. Moreover, to initialize the
+	 * MMU we need a command buffer with a 32 bit address because
+	 * without an MMU there is only an indentity mapping between
+	 * the internal 32 bit addresses and the bus addresses.
+	 *
+	 * To make things easy, we set the dma_coherent_mask to 32
+	 * bit to make sure we are allocating the command buffers and
+	 * TLBs in the lower 4 GiB address space.
+	 */
+	if (dma_set_mask(dev, DMA_BIT_MASK(40)) ||
+	    dma_set_coherent_mask(dev, DMA_BIT_MASK(32))) {
+		dev_err(dev, "No suitable DMA available\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * Apply the same DMA configuration to the virtual etnaviv
+	 * device as the GPU we found. This assumes that all Vivante
+	 * GPUs in the system share the same DMA constraints.
+	 */
+	first_node = etnaviv_of_first_available_node();
+	if (first_node)
+		of_dma_configure(dev, first_node, true);
+
+	return 0;
+}
+
 /*
  * etnaviv private data construction and destructions:
  */
@@ -663,7 +697,6 @@ static const struct component_master_ops etnaviv_master_ops = {
 static int etnaviv_pdev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *first_node = NULL;
 	struct component_match *match = NULL;
 
 	if (!dev->platform_data) {
@@ -673,10 +706,7 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 			if (!of_device_is_available(core_node))
 				continue;
 
-			if (!first_node)
-				first_node = core_node;
-
-			drm_of_component_match_add(&pdev->dev, &match,
+			drm_of_component_match_add(dev, &match,
 						   component_compare_of, core_node);
 		}
 	} else {
@@ -687,31 +717,8 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 			component_match_add(dev, &match, component_compare_dev_name, names[i]);
 	}
 
-	/*
-	 * PTA and MTLB can have 40 bit base addresses, but
-	 * unfortunately, an entry in the MTLB can only point to a
-	 * 32 bit base address of a STLB. Moreover, to initialize the
-	 * MMU we need a command buffer with a 32 bit address because
-	 * without an MMU there is only an indentity mapping between
-	 * the internal 32 bit addresses and the bus addresses.
-	 *
-	 * To make things easy, we set the dma_coherent_mask to 32
-	 * bit to make sure we are allocating the command buffers and
-	 * TLBs in the lower 4 GiB address space.
-	 */
-	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(40)) ||
-	    dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32))) {
-		dev_dbg(&pdev->dev, "No suitable DMA available\n");
+	if (etnaviv_of_dma_configure(dev))
 		return -ENODEV;
-	}
-
-	/*
-	 * Apply the same DMA configuration to the virtual etnaviv
-	 * device as the GPU we found. This assumes that all Vivante
-	 * GPUs in the system share the same DMA constraints.
-	 */
-	if (first_node)
-		of_dma_configure(&pdev->dev, first_node, true);
 
 	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
 }
-- 
2.25.1

