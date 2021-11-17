Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D010A454109
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 07:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF75989E69;
	Wed, 17 Nov 2021 06:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B8889E69
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:42:04 +0000 (UTC)
X-UUID: 418f1292bf51447ea94c45bee93f563a-20211117
X-UUID: 418f1292bf51447ea94c45bee93f563a-20211117
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 144515743; Wed, 17 Nov 2021 14:42:01 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Nov 2021 14:41:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 17 Nov 2021 14:41:59 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Jassi
 Brar <jassisinghbrar@gmail.com>
Subject: [PATCH 1/3] mialbox: move cmdq suspend,
 resume and remove after cmdq_mbox_flush
Date: Wed, 17 Nov 2021 14:41:56 +0800
Message-ID: <20211117064158.27451-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
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
Cc: fshao@chromium.org, David Airlie <airlied@linux.ie>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzungbi@google.com, nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the function order to make sure cmdq_mbox_flush is declared
before cmdq_suspend calling it.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 84 +++++++++++++++---------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index c591dab9d5a4..03f9ed4c5131 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -296,48 +296,6 @@ static irqreturn_t cmdq_irq_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static int cmdq_suspend(struct device *dev)
-{
-	struct cmdq *cmdq = dev_get_drvdata(dev);
-	struct cmdq_thread *thread;
-	int i;
-	bool task_running = false;
-
-	cmdq->suspended = true;
-
-	for (i = 0; i < cmdq->thread_nr; i++) {
-		thread = &cmdq->thread[i];
-		if (!list_empty(&thread->task_busy_list)) {
-			task_running = true;
-			break;
-		}
-	}
-
-	if (task_running)
-		dev_warn(dev, "exist running task(s) in suspend\n");
-
-	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
-
-	return 0;
-}
-
-static int cmdq_resume(struct device *dev)
-{
-	struct cmdq *cmdq = dev_get_drvdata(dev);
-
-	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
-	cmdq->suspended = false;
-	return 0;
-}
-
-static int cmdq_remove(struct platform_device *pdev)
-{
-	struct cmdq *cmdq = platform_get_drvdata(pdev);
-
-	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
-	return 0;
-}
-
 static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 {
 	struct cmdq_pkt *pkt = (struct cmdq_pkt *)data;
@@ -521,6 +479,48 @@ static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
 	return &mbox->chans[ind];
 }
 
+static int cmdq_suspend(struct device *dev)
+{
+	struct cmdq *cmdq = dev_get_drvdata(dev);
+	struct cmdq_thread *thread;
+	int i;
+	bool task_running = false;
+
+	cmdq->suspended = true;
+
+	for (i = 0; i < cmdq->thread_nr; i++) {
+		thread = &cmdq->thread[i];
+		if (!list_empty(&thread->task_busy_list)) {
+			task_running = true;
+			break;
+		}
+	}
+
+	if (task_running)
+		dev_warn(dev, "exist running task(s) in suspend\n");
+
+	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
+
+	return 0;
+}
+
+static int cmdq_resume(struct device *dev)
+{
+	struct cmdq *cmdq = dev_get_drvdata(dev);
+
+	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
+	cmdq->suspended = false;
+	return 0;
+}
+
+static int cmdq_remove(struct platform_device *pdev)
+{
+	struct cmdq *cmdq = platform_get_drvdata(pdev);
+
+	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
+	return 0;
+}
+
 static int cmdq_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-- 
2.18.0

