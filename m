Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D82E3F8744
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 14:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C73E6E825;
	Thu, 26 Aug 2021 12:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CADC6E825;
 Thu, 26 Aug 2021 12:19:31 +0000 (UTC)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6ACD122249;
 Thu, 26 Aug 2021 14:10:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1629979813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=niYNgQZFFX4h1KJxNUvDocP9d3R8SkyAI9p9cuLyy7g=;
 b=FOw9ikDR/mMI5CtoWs4+wtymhqglQR+/EY6rrfLuZPnfXuEMyTXMNGLW8mni2RSEw38w2e
 q0exi144/r71Qn8vyERX1vwftkfQA1Chx9u3GAQPg8adiQ/F15eLwRNpgsrFnuvNfXHCbt
 heIarGhVMTaTJWfmw8MHBEOruTLwp3I=
From: Michael Walle <michael@walle.cc>
To: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: "Lukas F . Hartmann" <lukas@mntre.com>,
 Marek Vasut <marek.vasut@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH 2/3] drm/etnaviv: fix dma configuration of the virtual device
Date: Thu, 26 Aug 2021 14:10:05 +0200
Message-Id: <20210826121006.685257-3-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210826121006.685257-1-michael@walle.cc>
References: <20210826121006.685257-1-michael@walle.cc>
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

The DMA configuration of the virtual device is inherited from the first
actual etnaviv device. Unfortunately, this doesn't work with an IOMMU:

[    5.191008] Failed to set up IOMMU for device (null); retaining platform DMA ops

This is because there is no associated iommu_group with the device. The
group is set in iommu_group_add_device() which is eventually called by
device_add() via the platform bus:
  device_add()
    blocking_notifier_call_chain()
      iommu_bus_notifier()
        iommu_probe_device()
          __iommu_probe_device()
            iommu_group_get_for_dev()
              iommu_group_add_device()

Move of_dma_configure() into the probe function, which is called after
device_add(). Normally, the platform code will already call it itself
if .of_node is set. Unfortunately, this isn't the case here.

Also move the dma mask assignemnts to probe() to keep all DMA related
settings together.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 2509b3e85709..ff6425f6ebad 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -589,6 +589,7 @@ static int compare_str(struct device *dev, void *data)
 static int etnaviv_pdev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *first_node = NULL;
 	struct component_match *match = NULL;
 
 	if (!dev->platform_data) {
@@ -598,6 +599,9 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 			if (!of_device_is_available(core_node))
 				continue;
 
+			if (!first_node)
+				first_node = core_node;
+
 			drm_of_component_match_add(&pdev->dev, &match,
 						   compare_of, core_node);
 		}
@@ -609,6 +613,17 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 			component_match_add(dev, &match, compare_str, names[i]);
 	}
 
+	pdev->dev.coherent_dma_mask = DMA_BIT_MASK(40);
+	pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
+
+	/*
+	 * Apply the same DMA configuration to the virtual etnaviv
+	 * device as the GPU we found. This assumes that all Vivante
+	 * GPUs in the system share the same DMA constraints.
+	 */
+	if (first_node)
+		of_dma_configure(&pdev->dev, first_node, true);
+
 	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
 }
 
@@ -659,15 +674,6 @@ static int __init etnaviv_init(void)
 			of_node_put(np);
 			goto unregister_platform_driver;
 		}
-		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(40);
-		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
-
-		/*
-		 * Apply the same DMA configuration to the virtual etnaviv
-		 * device as the GPU we found. This assumes that all Vivante
-		 * GPUs in the system share the same DMA constraints.
-		 */
-		of_dma_configure(&pdev->dev, np, true);
 
 		ret = platform_device_add(pdev);
 		if (ret) {
-- 
2.30.2

