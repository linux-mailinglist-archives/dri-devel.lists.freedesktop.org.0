Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4E7178BCA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBD96EACC;
	Wed,  4 Mar 2020 07:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 734916E968
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 11:03:53 +0000 (UTC)
X-UUID: c494ba658d584c97bfcd24746efc5d82-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ejj3muKchbZgb/7ccah0Y+HobyhZKtrbHXj/UzxNQYo=; 
 b=JGxjlR3OhJc8M3dE8De/MTGbOXrC4OOb1gcQHhEpPuX7rdw5qrVIA0jgwXE/31efdwJCsq1mnBkc7AbPuTSqQJZkg8ZSiLEL2TD4d2fnQo+X/7LkNz+5wwoPvkbHhd18/hN4GI57u/AIObocOkiAzI1WOWj/5MZmaNTawOyqg0Q=;
X-UUID: c494ba658d584c97bfcd24746efc5d82-20200303
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 2000072594; Tue, 03 Mar 2020 18:58:49 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 18:57:40 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 3 Mar 2020 18:58:10 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jassi Brar
 <jassisinghbrar@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v4 02/13] mailbox: cmdq: variablize address shift in platform
Date: Tue, 3 Mar 2020 18:58:34 +0800
Message-ID: <1583233125-7827-3-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 07C9060610B86C357E760526C4A97A7EADC80D043C4B46C4F34A51BF72FBE5802000:8
X-MTK: N
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 HS Liao <hs.liao@mediatek.com>, Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some gce hardware shift pc and end address in register to support
large dram addressing.
Implement gce address shift when write or read pc and end register.
And add shift bit in platform definition.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       | 61 ++++++++++++++++++------
 drivers/soc/mediatek/mtk-cmdq-helper.c   |  3 +-
 include/linux/mailbox/mtk-cmdq-mailbox.h |  2 +
 3 files changed, 50 insertions(+), 16 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 9a6ce9f5a7db..4dbee9258127 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -76,8 +76,22 @@ struct cmdq {
 	struct cmdq_thread	*thread;
 	struct clk		*clock;
 	bool			suspended;
+	u8			shift_pa;
 };
 
+struct gce_plat {
+	u32 thread_nr;
+	u8 shift;
+};
+
+u8 cmdq_mbox_shift(struct mbox_chan *chan)
+{
+	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
+
+	return cmdq->shift_pa;
+}
+EXPORT_SYMBOL(cmdq_mbox_shift);
+
 static int cmdq_thread_suspend(struct cmdq *cmdq, struct cmdq_thread *thread)
 {
 	u32 status;
@@ -183,7 +197,7 @@ static void cmdq_task_remove_wfe(struct cmdq_task *task)
 	for (i = 0; i < CMDQ_NUM_CMD(task->pkt); i++)
 		if (cmdq_command_is_wfe(base[i]))
 			base[i] = (u64)CMDQ_JUMP_BY_OFFSET << 32 |
-				  CMDQ_JUMP_PASS;
+				  CMDQ_JUMP_PASS >> task->cmdq->shift_pa;
 	dma_sync_single_for_device(dev, task->pa_base, task->pkt->cmd_buf_size,
 				   DMA_TO_DEVICE);
 }
@@ -221,13 +235,15 @@ static void cmdq_task_handle_error(struct cmdq_task *task)
 {
 	struct cmdq_thread *thread = task->thread;
 	struct cmdq_task *next_task;
+	struct cmdq *cmdq = task->cmdq;
 
-	dev_err(task->cmdq->mbox.dev, "task 0x%p error\n", task);
-	WARN_ON(cmdq_thread_suspend(task->cmdq, thread) < 0);
+	dev_err(cmdq->mbox.dev, "task 0x%p error\n", task);
+	WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
 	next_task = list_first_entry_or_null(&thread->task_busy_list,
 			struct cmdq_task, list_entry);
 	if (next_task)
-		writel(next_task->pa_base, thread->base + CMDQ_THR_CURR_ADDR);
+		writel(next_task->pa_base >> cmdq->shift_pa,
+		       thread->base + CMDQ_THR_CURR_ADDR);
 	cmdq_thread_resume(thread);
 }
 
@@ -257,7 +273,7 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 	else
 		return;
 
-	curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR);
+	curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) << cmdq->shift_pa;
 
 	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
 				 list_entry) {
@@ -373,16 +389,20 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 		WARN_ON(clk_enable(cmdq->clock) < 0);
 		WARN_ON(cmdq_thread_reset(cmdq, thread) < 0);
 
-		writel(task->pa_base, thread->base + CMDQ_THR_CURR_ADDR);
-		writel(task->pa_base + pkt->cmd_buf_size,
+		writel(task->pa_base >> cmdq->shift_pa,
+		       thread->base + CMDQ_THR_CURR_ADDR);
+		writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->shift_pa,
 		       thread->base + CMDQ_THR_END_ADDR);
+
 		writel(thread->priority, thread->base + CMDQ_THR_PRIORITY);
 		writel(CMDQ_THR_IRQ_EN, thread->base + CMDQ_THR_IRQ_ENABLE);
 		writel(CMDQ_THR_ENABLED, thread->base + CMDQ_THR_ENABLE_TASK);
 	} else {
 		WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
-		curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR);
-		end_pa = readl(thread->base + CMDQ_THR_END_ADDR);
+		curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) <<
+			cmdq->shift_pa;
+		end_pa = readl(thread->base + CMDQ_THR_END_ADDR) <<
+			cmdq->shift_pa;
 
 		/*
 		 * Atomic execution should remove the following wfe, i.e. only
@@ -395,7 +415,7 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 				cmdq_thread_wait_end(thread, end_pa);
 				WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
 				/* set to this task directly */
-				writel(task->pa_base,
+				writel(task->pa_base >> cmdq->shift_pa,
 				       thread->base + CMDQ_THR_CURR_ADDR);
 			} else {
 				cmdq_task_insert_into_thread(task);
@@ -407,14 +427,14 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 			if (curr_pa == end_pa - CMDQ_INST_SIZE ||
 			    curr_pa == end_pa) {
 				/* set to this task directly */
-				writel(task->pa_base,
+				writel(task->pa_base >> cmdq->shift_pa,
 				       thread->base + CMDQ_THR_CURR_ADDR);
 			} else {
 				cmdq_task_insert_into_thread(task);
 				smp_mb(); /* modify jump before enable thread */
 			}
 		}
-		writel(task->pa_base + pkt->cmd_buf_size,
+		writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->shift_pa,
 		       thread->base + CMDQ_THR_END_ADDR);
 		cmdq_thread_resume(thread);
 	}
@@ -461,6 +481,7 @@ static int cmdq_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct cmdq *cmdq;
 	int err, i;
+	struct gce_plat *plat_data;
 
 	cmdq = devm_kzalloc(dev, sizeof(*cmdq), GFP_KERNEL);
 	if (!cmdq)
@@ -479,7 +500,14 @@ static int cmdq_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	cmdq->thread_nr = (u32)(unsigned long)of_device_get_match_data(dev);
+	plat_data = (struct gce_plat *)of_device_get_match_data(dev);
+	if (!plat_data) {
+		dev_err(dev, "failed to get match data\n");
+		return -EINVAL;
+	}
+
+	cmdq->thread_nr = plat_data->thread_nr;
+	cmdq->shift_pa = plat_data->shift;
 	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
 	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
 			       "mtk_cmdq", cmdq);
@@ -542,9 +570,12 @@ static const struct dev_pm_ops cmdq_pm_ops = {
 	.resume = cmdq_resume,
 };
 
+static const struct gce_plat gce_plat_v2 = {.thread_nr = 16};
+static const struct gce_plat gce_plat_v3 = {.thread_nr = 24};
+
 static const struct of_device_id cmdq_of_ids[] = {
-	{.compatible = "mediatek,mt8173-gce", .data = (void *)16},
-	{.compatible = "mediatek,mt8183-gce", .data = (void *)24},
+	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_v2},
+	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_v3},
 	{}
 };
 
diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index de20e6cba83b..2e1bc513569b 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -291,7 +291,8 @@ static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 
 	/* JUMP to end */
 	inst.op = CMDQ_CODE_JUMP;
-	inst.value = CMDQ_JUMP_PASS;
+	inst.value = CMDQ_JUMP_PASS >>
+		cmdq_mbox_shift(((struct cmdq_client *)pkt->cl)->chan);
 	err = cmdq_pkt_append_command(pkt, inst);
 
 	return err;
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index a4dc45fbec0a..dfe5b2eb85cc 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -88,4 +88,6 @@ struct cmdq_pkt {
 	void			*cl;
 };
 
+u8 cmdq_mbox_shift(struct mbox_chan *chan);
+
 #endif /* __MTK_CMDQ_MAILBOX_H__ */
-- 
2.18.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
