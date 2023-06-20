Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C507385EF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA4510E485;
	Wed, 21 Jun 2023 13:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 927 seconds by postgrey-1.36 at gabe;
 Tue, 20 Jun 2023 10:03:08 UTC
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.217])
 by gabe.freedesktop.org (Postfix) with ESMTP id 880A310E2AA;
 Tue, 20 Jun 2023 10:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=CV0Q0
 YXYgyZAqdc3fwoTj25afaXkdgqTctwzpXI/ayg=; b=EiwznZWxKXx0QkWJX0JOA
 0M1QwURMCwkJ0HhdkxRSmwrH9Vdl2248xFlmfnjQ5xxW6uDwpkGWUeX7LySdvGJu
 vsYiowqyF1XA8k9gX+MKGsFFPUgEGJ8wgiVGsaWXZeaxvADD/1VMzYAXukNWB/YF
 dn/atgwcYbNqQU+GRldH1s=
Received: from openarena.loongson.cn (unknown [114.242.206.180])
 by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id
 _____wAXg3CldZFkB8yiAQ--.11241S11; 
 Tue, 20 Jun 2023 17:47:19 +0800 (CST)
From: Sui Jingfeng <18949883232@163.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v10 09/11] drm/etnaviv: Clean up etnaviv_pdev_probe() function
Date: Tue, 20 Jun 2023 17:47:14 +0800
Message-Id: <20230620094716.2231414-10-18949883232@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230620094716.2231414-1-18949883232@163.com>
References: <20230620094716.2231414-1-18949883232@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXg3CldZFkB8yiAQ--.11241S11
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF4fCryUur4UCryDuw1Utrb_yoWrGrW5pF
 W3JayYyryDX3WYgayxAan5ZryYkF9agayFyryUK34vk345Jr9avF9YkryUAas5Jr95CF10
 qr40krWUWF1rGrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxTmhUUUUU=
X-Originating-IP: [114.242.206.180]
X-CM-SenderInfo: jprymkizyyjjits6il2tof0z/1tbiEwmU0WE17eMXkQABsC
X-Mailman-Approved-At: Wed, 21 Jun 2023 13:58:32 +0000
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
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
index 47b2cdbb53e2..8907cdb8a1f8 100644
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
@@ -664,7 +698,6 @@ static const struct component_master_ops etnaviv_master_ops = {
 static int etnaviv_pdev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *first_node = NULL;
 	struct component_match *match = NULL;
 
 	if (!dev->platform_data) {
@@ -674,10 +707,7 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
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
@@ -688,31 +718,8 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
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

