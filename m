Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAE62205A4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 09:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90886E439;
	Wed, 15 Jul 2020 06:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr
 [80.12.242.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D74A6E5A4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 18:35:34 +0000 (UTC)
Received: from localhost.localdomain ([93.23.14.36]) by mwinf5d77 with ME
 id 36bS2300P0mgUh1036bTVi; Tue, 14 Jul 2020 20:35:32 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 14 Jul 2020 20:35:32 +0200
X-ME-IP: 93.23.14.36
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: sumit.semwal@linaro.org, davem@davemloft.net, kuba@kernel.org,
 christian.koenig@amd.com, mhabets@solarflare.com, jwi@linux.ibm.com,
 zhongjiang@huawei.com, weiyongjun1@huawei.com, vaibhavgupta40@gmail.com
Subject: [PATCH] ksz884x: switch from 'pci_' to 'dma_' API
Date: Tue, 14 Jul 2020 20:35:01 +0200
Message-Id: <20200714183501.310949-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Jul 2020 06:59:56 +0000
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
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below and has been
hand modified to replace GFP_ with a correct flag.
It has been compile tested.

When memory is allocated in 'ksz_alloc_desc()', GFP_KERNEL can be used
because a few lines below, GFP_KERNEL is also used in the
'ksz_alloc_soft_desc()' calls.


@@
@@
-    PCI_DMA_BIDIRECTIONAL
+    DMA_BIDIRECTIONAL

@@
@@
-    PCI_DMA_TODEVICE
+    DMA_TO_DEVICE

@@
@@
-    PCI_DMA_FROMDEVICE
+    DMA_FROM_DEVICE

@@
@@
-    PCI_DMA_NONE
+    DMA_NONE

@@
expression e1, e2, e3;
@@
-    pci_alloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3;
@@
-    pci_zalloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3, e4;
@@
-    pci_free_consistent(e1, e2, e3, e4)
+    dma_free_coherent(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_single(e1, e2, e3, e4)
+    dma_map_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_single(e1, e2, e3, e4)
+    dma_unmap_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4, e5;
@@
-    pci_map_page(e1, e2, e3, e4, e5)
+    dma_map_page(&e1->dev, e2, e3, e4, e5)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_page(e1, e2, e3, e4)
+    dma_unmap_page(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_sg(e1, e2, e3, e4)
+    dma_map_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_sg(e1, e2, e3, e4)
+    dma_unmap_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
+    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_device(e1, e2, e3, e4)
+    dma_sync_single_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
+    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
+    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2;
@@
-    pci_dma_mapping_error(e1, e2)
+    dma_mapping_error(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_dma_mask(e1, e2)
+    dma_set_mask(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_consistent_dma_mask(e1, e2)
+    dma_set_coherent_mask(&e1->dev, e2)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
If needed, see post from Christoph Hellwig on the kernel-janitors ML:
   https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
---
 drivers/net/ethernet/micrel/ksz884x.c | 68 ++++++++++++---------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/micrel/ksz884x.c b/drivers/net/ethernet/micrel/ksz884x.c
index 2ce7304d3753..bb646b65cc95 100644
--- a/drivers/net/ethernet/micrel/ksz884x.c
+++ b/drivers/net/ethernet/micrel/ksz884x.c
@@ -4390,9 +4390,9 @@ static int ksz_alloc_desc(struct dev_info *adapter)
 		DESC_ALIGNMENT;
 
 	adapter->desc_pool.alloc_virt =
-		pci_zalloc_consistent(adapter->pdev,
-				      adapter->desc_pool.alloc_size,
-				      &adapter->desc_pool.dma_addr);
+		dma_alloc_coherent(&adapter->pdev->dev,
+				   adapter->desc_pool.alloc_size,
+				   &adapter->desc_pool.dma_addr, GFP_KERNEL);
 	if (adapter->desc_pool.alloc_virt == NULL) {
 		adapter->desc_pool.alloc_size = 0;
 		return 1;
@@ -4431,7 +4431,8 @@ static int ksz_alloc_desc(struct dev_info *adapter)
 static void free_dma_buf(struct dev_info *adapter, struct ksz_dma_buf *dma_buf,
 	int direction)
 {
-	pci_unmap_single(adapter->pdev, dma_buf->dma, dma_buf->len, direction);
+	dma_unmap_single(&adapter->pdev->dev, dma_buf->dma, dma_buf->len,
+			 direction);
 	dev_kfree_skb(dma_buf->skb);
 	dma_buf->skb = NULL;
 	dma_buf->dma = 0;
@@ -4456,16 +4457,15 @@ static void ksz_init_rx_buffers(struct dev_info *adapter)
 
 		dma_buf = DMA_BUFFER(desc);
 		if (dma_buf->skb && dma_buf->len != adapter->mtu)
-			free_dma_buf(adapter, dma_buf, PCI_DMA_FROMDEVICE);
+			free_dma_buf(adapter, dma_buf, DMA_FROM_DEVICE);
 		dma_buf->len = adapter->mtu;
 		if (!dma_buf->skb)
 			dma_buf->skb = alloc_skb(dma_buf->len, GFP_ATOMIC);
 		if (dma_buf->skb && !dma_buf->dma)
-			dma_buf->dma = pci_map_single(
-				adapter->pdev,
-				skb_tail_pointer(dma_buf->skb),
-				dma_buf->len,
-				PCI_DMA_FROMDEVICE);
+			dma_buf->dma = dma_map_single(&adapter->pdev->dev,
+						skb_tail_pointer(dma_buf->skb),
+						dma_buf->len,
+						DMA_FROM_DEVICE);
 
 		/* Set descriptor. */
 		set_rx_buf(desc, dma_buf->dma);
@@ -4543,11 +4543,10 @@ static void ksz_free_desc(struct dev_info *adapter)
 
 	/* Free memory. */
 	if (adapter->desc_pool.alloc_virt)
-		pci_free_consistent(
-			adapter->pdev,
-			adapter->desc_pool.alloc_size,
-			adapter->desc_pool.alloc_virt,
-			adapter->desc_pool.dma_addr);
+		dma_free_coherent(&adapter->pdev->dev,
+				  adapter->desc_pool.alloc_size,
+				  adapter->desc_pool.alloc_virt,
+				  adapter->desc_pool.dma_addr);
 
 	/* Reset resource pool. */
 	adapter->desc_pool.alloc_size = 0;
@@ -4590,12 +4589,10 @@ static void ksz_free_buffers(struct dev_info *adapter,
 static void ksz_free_mem(struct dev_info *adapter)
 {
 	/* Free transmit buffers. */
-	ksz_free_buffers(adapter, &adapter->hw.tx_desc_info,
-		PCI_DMA_TODEVICE);
+	ksz_free_buffers(adapter, &adapter->hw.tx_desc_info, DMA_TO_DEVICE);
 
 	/* Free receive buffers. */
-	ksz_free_buffers(adapter, &adapter->hw.rx_desc_info,
-		PCI_DMA_FROMDEVICE);
+	ksz_free_buffers(adapter, &adapter->hw.rx_desc_info, DMA_FROM_DEVICE);
 
 	/* Free descriptors. */
 	ksz_free_desc(adapter);
@@ -4657,9 +4654,8 @@ static void send_packet(struct sk_buff *skb, struct net_device *dev)
 
 		dma_buf->len = skb_headlen(skb);
 
-		dma_buf->dma = pci_map_single(
-			hw_priv->pdev, skb->data, dma_buf->len,
-			PCI_DMA_TODEVICE);
+		dma_buf->dma = dma_map_single(&hw_priv->pdev->dev, skb->data,
+					      dma_buf->len, DMA_TO_DEVICE);
 		set_tx_buf(desc, dma_buf->dma);
 		set_tx_len(desc, dma_buf->len);
 
@@ -4676,11 +4672,10 @@ static void send_packet(struct sk_buff *skb, struct net_device *dev)
 			dma_buf = DMA_BUFFER(desc);
 			dma_buf->len = skb_frag_size(this_frag);
 
-			dma_buf->dma = pci_map_single(
-				hw_priv->pdev,
-				skb_frag_address(this_frag),
-				dma_buf->len,
-				PCI_DMA_TODEVICE);
+			dma_buf->dma = dma_map_single(&hw_priv->pdev->dev,
+						      skb_frag_address(this_frag),
+						      dma_buf->len,
+						      DMA_TO_DEVICE);
 			set_tx_buf(desc, dma_buf->dma);
 			set_tx_len(desc, dma_buf->len);
 
@@ -4700,9 +4695,8 @@ static void send_packet(struct sk_buff *skb, struct net_device *dev)
 	} else {
 		dma_buf->len = len;
 
-		dma_buf->dma = pci_map_single(
-			hw_priv->pdev, skb->data, dma_buf->len,
-			PCI_DMA_TODEVICE);
+		dma_buf->dma = dma_map_single(&hw_priv->pdev->dev, skb->data,
+					      dma_buf->len, DMA_TO_DEVICE);
 		set_tx_buf(desc, dma_buf->dma);
 		set_tx_len(desc, dma_buf->len);
 	}
@@ -4756,9 +4750,8 @@ static void transmit_cleanup(struct dev_info *hw_priv, int normal)
 		}
 
 		dma_buf = DMA_BUFFER(desc);
-		pci_unmap_single(
-			hw_priv->pdev, dma_buf->dma, dma_buf->len,
-			PCI_DMA_TODEVICE);
+		dma_unmap_single(&hw_priv->pdev->dev, dma_buf->dma,
+				 dma_buf->len, DMA_TO_DEVICE);
 
 		/* This descriptor contains the last buffer in the packet. */
 		if (dma_buf->skb) {
@@ -4991,9 +4984,8 @@ static inline int rx_proc(struct net_device *dev, struct ksz_hw* hw,
 	packet_len = status.rx.frame_len - 4;
 
 	dma_buf = DMA_BUFFER(desc);
-	pci_dma_sync_single_for_cpu(
-		hw_priv->pdev, dma_buf->dma, packet_len + 4,
-		PCI_DMA_FROMDEVICE);
+	dma_sync_single_for_cpu(&hw_priv->pdev->dev, dma_buf->dma,
+				packet_len + 4, DMA_FROM_DEVICE);
 
 	do {
 		/* skb->data != skb->head */
@@ -6935,8 +6927,8 @@ static int pcidev_init(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	result = -ENODEV;
 
-	if (pci_set_dma_mask(pdev, DMA_BIT_MASK(32)) ||
-			pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32)))
+	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(32)) ||
+	    dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32)))
 		return result;
 
 	reg_base = pci_resource_start(pdev, 0);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
