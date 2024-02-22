Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A8285FCC0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A65810E985;
	Thu, 22 Feb 2024 15:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I9h3a/Eg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8650910E989
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 15:41:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF717618E5;
 Thu, 22 Feb 2024 15:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D17C433A6;
 Thu, 22 Feb 2024 15:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708616511;
 bh=9avcaQo+g1SO3OnMBO0SW08LTKb5Q/Pc21HFm51gndM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I9h3a/EgFD0efBdf9svW4VSrGmDb6rsd2zPtk3U/b2zo/X5iMDU8AfEEL2k0d9tGW
 Yyh37Kn8PPwqqS7Aseq8cxgUFfX7wQtEJOLjs0B8MAiQ5LNayOfTCeWgdUndvS7IdT
 hvOR274o+TGEjGTKzdy/5EuYnO26HTEcMV1C0uvzAEZYinyEesdVnBtZ7LLclZeYSo
 apxaQmIxZvulopyzfm/b3aYiSP7p6hvXwVclkGiwOcwQIBS4O/c1ADziRgE4nD8cn0
 nU8xAHIhys2JpoCwhGzc7wEBdc41y3GgISPPlwxN+eqxQwzUV+qnowsbht3Uw3SX7U
 erKvjaBM/Ad0Q==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 07/12] soc: mediatek: cmdq: Refine cmdq_pkt_create() and
 cmdq_pkt_destroy()
Date: Thu, 22 Feb 2024 15:41:15 +0000
Message-Id: <20240222154120.16959-8-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222154120.16959-1-chunkuang.hu@kernel.org>
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
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

cmdq_pkt_create() and cmdq_pkt_destroy() is not suitable for
client drivers so each client driver has implement its own
function. This refinement would pass struct cmdq_pkt pointer into
cmdq_pkt_create(). In addition, client driver has the struct
cmdq_client information, so it's not necessary to store this
information in struct cmdq_pkt. After this refinement, client
drivers could use these helper funciton instead of implementing
its own version.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 24 +++++++-----------------
 include/linux/soc/mediatek/mtk-cmdq.h  | 14 ++++++++------
 2 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index bbe41302210a..1a1f1b260a06 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -106,22 +106,16 @@ void cmdq_mbox_destroy(struct cmdq_client *client)
 }
 EXPORT_SYMBOL(cmdq_mbox_destroy);
 
-struct cmdq_pkt *cmdq_pkt_create(struct cmdq_client *client, size_t size)
+int cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt, size_t size)
 {
-	struct cmdq_pkt *pkt;
 	struct device *dev;
 	dma_addr_t dma_addr;
 
-	pkt = kzalloc(sizeof(*pkt), GFP_KERNEL);
-	if (!pkt)
-		return ERR_PTR(-ENOMEM);
 	pkt->va_base = kzalloc(size, GFP_KERNEL);
-	if (!pkt->va_base) {
-		kfree(pkt);
-		return ERR_PTR(-ENOMEM);
-	}
+	if (!pkt->va_base)
+		return -ENOMEM;
+
 	pkt->buf_size = size;
-	pkt->cl = (void *)client;
 
 	dev = client->chan->mbox->dev;
 	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
@@ -129,24 +123,20 @@ struct cmdq_pkt *cmdq_pkt_create(struct cmdq_client *client, size_t size)
 	if (dma_mapping_error(dev, dma_addr)) {
 		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
 		kfree(pkt->va_base);
-		kfree(pkt);
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 
 	pkt->pa_base = dma_addr;
 
-	return pkt;
+	return 0;
 }
 EXPORT_SYMBOL(cmdq_pkt_create);
 
-void cmdq_pkt_destroy(struct cmdq_pkt *pkt)
+void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt)
 {
-	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
-
 	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
 			 DMA_TO_DEVICE);
 	kfree(pkt->va_base);
-	kfree(pkt);
 }
 EXPORT_SYMBOL(cmdq_pkt_destroy);
 
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index f82e789550ae..d9d0ee5ecb7a 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -62,17 +62,19 @@ void cmdq_mbox_destroy(struct cmdq_client *client);
 /**
  * cmdq_pkt_create() - create a CMDQ packet
  * @client:	the CMDQ mailbox client
+ * @pkt:	the CMDQ packet
  * @size:	required CMDQ buffer size
  *
- * Return: CMDQ packet pointer
+ * Return: 0 for success; else the error code is returned
  */
-struct cmdq_pkt *cmdq_pkt_create(struct cmdq_client *client, size_t size);
+int cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt, size_t size);
 
 /**
  * cmdq_pkt_destroy() - destroy the CMDQ packet
+ * @client:	the CMDQ mailbox client
  * @pkt:	the CMDQ packet
  */
-void cmdq_pkt_destroy(struct cmdq_pkt *pkt);
+void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt);
 
 /**
  * cmdq_pkt_write() - append write command to the CMDQ packet
@@ -312,12 +314,12 @@ static inline struct cmdq_client *cmdq_mbox_create(struct device *dev, int index
 
 static inline void cmdq_mbox_destroy(struct cmdq_client *client) { }
 
-static inline  struct cmdq_pkt *cmdq_pkt_create(struct cmdq_client *client, size_t size)
+static inline int cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt, size_t size)
 {
-	return ERR_PTR(-EINVAL);
+	return -EINVAL;
 }
 
-static inline void cmdq_pkt_destroy(struct cmdq_pkt *pkt) { }
+static inline void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt) { }
 
 static inline int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
 {
-- 
2.34.1

