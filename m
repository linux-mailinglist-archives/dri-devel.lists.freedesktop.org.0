Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A742AC9FC5
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jun 2025 19:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DE310E35A;
	Sun,  1 Jun 2025 17:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="mvsb//Ld";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D82D10E2F8
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jun 2025 17:34:17 +0000 (UTC)
X-UUID: 9da4dae43f0e11f082f7f7ac98dee637-20250602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=u8tgo9s7qv+siGOki8TcsEv+NlGk2nFqIOpd/asZ3eY=; 
 b=mvsb//Ld2zgwMGztZYNuDHYea1k9d/u9dnjocs26qNC6x7yCDKFkvOBiEK3/UPep3nIxMzd/uJI6lxQ9Tm7hcK3NyBdTsk43+Pi0+QLhO43OPQ029poaKv3sbIyiePDE2pswaO9Zc1NXQn9tyCTQ3XYWzIKHL2C0KXnJmYYzE6U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:333d333e-384e-4a0b-bb7d-fa61c3a3789b, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:eb3381f1-2ded-45ed-94e2-b3e9fa87100d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9da4dae43f0e11f082f7f7ac98dee637-20250602
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 929744371; Mon, 02 Jun 2025 01:34:05 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 2 Jun 2025 01:34:03 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 2 Jun 2025 01:34:03 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
 <jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, "Moudy
 Ho" <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
 <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
 <wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v6 02/20] mailbox: mtk-cmdq: Refine DMA address handling for
 the command buffer
Date: Mon, 2 Jun 2025 01:31:34 +0800
Message-ID: <20250601173355.1731140-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
References: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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

GCE can only fetch the command buffer address from a 32-bit register.
Some SoCs support a 35-bit command buffer address for GCE, which
requires a right shift of 3 bits before setting the address into
the 32-bit register. A comment has been added to the header of
cmdq_get_shift_pa() to explain this requirement.

To prevent the GCE command buffer address from being DMA mapped beyond
its supported bit range, the DMA bit mask for the device is set during
initialization.

Additionally, to ensure the correct shift is applied when setting or
reading the register that stores the GCE command buffer address,
new APIs, cmdq_reg_shift_addr() and cmdq_reg_revert_addr(), have been
introduced for consistent operations on this register.

The variable type for the command buffer address has been standardized
to dma_addr_t to prevent handling issues caused by type mismatches.

Fixes: 0858fde496f8 ("mailbox: cmdq: variablize address shift in platform")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       | 43 ++++++++++++++++--------
 include/linux/mailbox/mtk-cmdq-mailbox.h | 10 ++++++
 2 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index ab4e8d1954a1..a3d94f1eb1a3 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -92,6 +92,16 @@ struct gce_plat {
 	u32 gce_num;
 };
 
+static inline u32 cmdq_reg_shift_addr(dma_addr_t addr, const struct gce_plat *pdata)
+{
+	return (addr >> pdata->shift);
+}
+
+static inline dma_addr_t cmdq_reg_revert_addr(u32 addr, const struct gce_plat *pdata)
+{
+	return ((dma_addr_t)addr << pdata->shift);
+}
+
 u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 {
 	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
@@ -188,13 +198,12 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
 	struct cmdq_task *prev_task = list_last_entry(
 			&thread->task_busy_list, typeof(*task), list_entry);
 	u64 *prev_task_base = prev_task->pkt->va_base;
+	u32 shift_addr = cmdq_reg_shift_addr(task->pa_base, task->cmdq->pdata);
 
 	/* let previous task jump to this task */
 	dma_sync_single_for_cpu(dev, prev_task->pa_base,
 				prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
-	prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] =
-		(u64)CMDQ_JUMP_BY_PA << 32 |
-		(task->pa_base >> task->cmdq->pdata->shift);
+	prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] = (u64)CMDQ_JUMP_BY_PA << 32 | shift_addr;
 	dma_sync_single_for_device(dev, prev_task->pa_base,
 				   prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
 
@@ -237,7 +246,8 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 				    struct cmdq_thread *thread)
 {
 	struct cmdq_task *task, *tmp, *curr_task = NULL;
-	u32 curr_pa, irq_flag, task_end_pa;
+	u32 irq_flag, shift_addr;
+	dma_addr_t curr_pa, task_end_pa;
 	bool err;
 
 	irq_flag = readl(thread->base + CMDQ_THR_IRQ_STATUS);
@@ -259,7 +269,8 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 	else
 		return;
 
-	curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) << cmdq->pdata->shift;
+	shift_addr = readl(thread->base + CMDQ_THR_CURR_ADDR);
+	curr_pa = cmdq_reg_revert_addr(shift_addr, cmdq->pdata);
 
 	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
 				 list_entry) {
@@ -378,7 +389,8 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
 	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
 	struct cmdq_task *task;
-	unsigned long curr_pa, end_pa;
+	u32 shift_addr;
+	dma_addr_t curr_pa, end_pa;
 	int ret;
 
 	/* Client should not flush new tasks if suspended. */
@@ -409,20 +421,20 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 		 */
 		WARN_ON(cmdq_thread_reset(cmdq, thread) < 0);
 
-		writel(task->pa_base >> cmdq->pdata->shift,
-		       thread->base + CMDQ_THR_CURR_ADDR);
-		writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->pdata->shift,
-		       thread->base + CMDQ_THR_END_ADDR);
+		shift_addr = cmdq_reg_shift_addr(task->pa_base, cmdq->pdata);
+		writel(shift_addr, thread->base + CMDQ_THR_CURR_ADDR);
+		shift_addr = cmdq_reg_shift_addr(task->pa_base + pkt->cmd_buf_size, cmdq->pdata);
+		writel(shift_addr, thread->base + CMDQ_THR_END_ADDR);
 
 		writel(thread->priority, thread->base + CMDQ_THR_PRIORITY);
 		writel(CMDQ_THR_IRQ_EN, thread->base + CMDQ_THR_IRQ_ENABLE);
 		writel(CMDQ_THR_ENABLED, thread->base + CMDQ_THR_ENABLE_TASK);
 	} else {
 		WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
-		curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) <<
-			cmdq->pdata->shift;
-		end_pa = readl(thread->base + CMDQ_THR_END_ADDR) <<
-			cmdq->pdata->shift;
+		shift_addr = readl(thread->base + CMDQ_THR_CURR_ADDR);
+		curr_pa = cmdq_reg_revert_addr(shift_addr, cmdq->pdata);
+		shift_addr = readl(thread->base + CMDQ_THR_END_ADDR);
+		end_pa = cmdq_reg_revert_addr(shift_addr, cmdq->pdata);
 		/* check boundary */
 		if (curr_pa == end_pa - CMDQ_INST_SIZE ||
 		    curr_pa == end_pa) {
@@ -656,6 +668,9 @@ static int cmdq_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	dma_set_coherent_mask(dev,
+			      DMA_BIT_MASK(sizeof(u32) * BITS_PER_BYTE + cmdq->pdata->shift));
+
 	cmdq->mbox.dev = dev;
 	cmdq->mbox.chans = devm_kcalloc(dev, cmdq->pdata->thread_nr,
 					sizeof(*cmdq->mbox.chans), GFP_KERNEL);
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 4c1a91b07de3..e1555e06e7e5 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -77,6 +77,16 @@ struct cmdq_pkt {
 	size_t			buf_size; /* real buffer size */
 };
 
+/**
+ * cmdq_get_shift_pa() - get the shift bits of physical address
+ * @chan: mailbox channel
+ *
+ * GCE can only fetch the command buffer address from a 32-bit register.
+ * Some SOCs support more than 32-bit command buffer address for GCE, which
+ * requires some shift bits to make the address fit into the 32-bit register.
+ *
+ * Return: the shift bits of physical address
+ */
 u8 cmdq_get_shift_pa(struct mbox_chan *chan);
 
 #endif /* __MTK_CMDQ_MAILBOX_H__ */
-- 
2.43.0

