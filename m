Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAA88BF9D0
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 11:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7ED110FA86;
	Wed,  8 May 2024 09:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="bFSwIteg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512A510FA86
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 09:51:49 +0000 (UTC)
X-UUID: 9416d58e0d2011efb92737409a0e9459-20240508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=EpbT5fkgin4b8SqQc5adWxDC5bZ2ttTXku30oyuQHbw=; 
 b=bFSwItegwhH7VnuTFtnAqYOAtfLYcKtr2df+Ukm1X2pAdf7MtT8plA9bjhH26C420GOkPWT+aLD/37abeBL3850QrVbXMlN7dnFl9OtzF2IXoO+v9f9fSyvMEMkEG7z8HjcXwQfXQurr32CtaZAFgFgcM7glNxHk6nunfw8iRRc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:dd9d5ad5-4e05-4884-9de1-38c3080c3812, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:a5b68092-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 9416d58e0d2011efb92737409a0e9459-20240508
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 583157918; Wed, 08 May 2024 17:51:44 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 8 May 2024 17:51:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 8 May 2024 17:51:43 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Jason-ch Chen
 <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
 <shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Fei Shao
 <fshao@chromium.org>
Subject: [PATCH v2] mailbox: mtk-cmdq: Fix sleeping function called from
 invalid context
Date: Wed, 8 May 2024 17:51:43 +0800
Message-ID: <20240508095143.12023-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When we run kernel with lockdebug option, we will get the BUG below:
[  106.692124] BUG: sleeping function called from invalid context at drivers/base/power/runtime.c:1164
[  106.692190] in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 3616, name: kworker/u17:3
[  106.692226] preempt_count: 1, expected: 0
[  106.692254] RCU nest depth: 0, expected: 0
[  106.692282] INFO: lockdep is turned off.
[  106.692306] irq event stamp: 0
[  106.692331] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[  106.692376] hardirqs last disabled at (0): [<ffffffee15d37fa0>] copy_process+0xc90/0x2ac0
[  106.692429] softirqs last  enabled at (0): [<ffffffee15d37fc4>] copy_process+0xcb4/0x2ac0
[  106.692473] softirqs last disabled at (0): [<0000000000000000>] 0x0
[  106.692513] CPU: 1 PID: 3616 Comm: kworker/u17:3 Not tainted 6.1.87-lockdep-14133-g26e933aca785 #1 6839942e1cf34914b0a366137843dd2366f52aa9
[  106.692556] Hardware name: Google Ciri sku0/unprovisioned board (DT)
[  106.692586] Workqueue: imgsys_runner imgsys_runner_func
[  106.692638] Call trace:
[  106.692662]  dump_backtrace+0x100/0x120
[  106.692702]  show_stack+0x20/0x2c
[  106.692737]  dump_stack_lvl+0x84/0xb4
[  106.692775]  dump_stack+0x18/0x48
[  106.692809]  __might_resched+0x354/0x4c0
[  106.692847]  __might_sleep+0x98/0xe4
[  106.692883]  __pm_runtime_resume+0x70/0x124
[  106.692921]  cmdq_mbox_send_data+0xe4/0xb1c
[  106.692964]  msg_submit+0x194/0x2dc
[  106.693003]  mbox_send_message+0x190/0x330
[  106.693043]  imgsys_cmdq_sendtask+0x1618/0x2224
[  106.693082]  imgsys_runner_func+0xac/0x11c
[  106.693118]  process_one_work+0x638/0xf84
[  106.693158]  worker_thread+0x808/0xcd0
[  106.693196]  kthread+0x24c/0x324
[  106.693231]  ret_from_fork+0x10/0x20

We found that there is a spin_lock_irqsave protection in msg_submit()
of mailbox.c and it is in the atomic context.
So when cmdq driver calls pm_runtime_get_sync() in cmdq_mbox_send_data(),
it will get this BUG report.

1. Change pm_runtime_get_sync() to pm_runtime_get() to avoid using sleep
   in atomic context.
2. Move clk_bulk_enable() outside cmdq_runtime_resume() to ensure GCE
   clocks are enabled before configuring GCE register.
3. Add used_count to avoid cmdq_runtime_suspend() being called before
   calling cmdq_runtime_resume().

Fixes: 8afe816b0c99 ("mailbox: mtk-cmdq-mailbox: Implement Runtime PM with autosuspend")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 033aff11f87c..b50f42e69aab 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -82,6 +82,7 @@ struct cmdq {
 	const struct gce_plat	*pdata;
 	struct cmdq_thread	*thread;
 	struct clk_bulk_data	clocks[CMDQ_GCE_NUM_MAX];
+	atomic_t		used_count;
 	bool			suspended;
 };
 
@@ -317,14 +318,21 @@ static int cmdq_runtime_resume(struct device *dev)
 {
 	struct cmdq *cmdq = dev_get_drvdata(dev);
 
-	return clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks);
+	atomic_inc(&cmdq->used_count);
+	return 0;
 }
 
 static int cmdq_runtime_suspend(struct device *dev)
 {
 	struct cmdq *cmdq = dev_get_drvdata(dev);
 
+	if (atomic_read(&cmdq->used_count) == 0) {
+		dev_warn(dev, "%s when used_count is 0!", __func__);
+		return -EINVAL;
+	}
+
 	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
+	atomic_dec(&cmdq->used_count);
 	return 0;
 }
 
@@ -392,9 +400,8 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	/* Client should not flush new tasks if suspended. */
 	WARN_ON(cmdq->suspended);
 
-	ret = pm_runtime_get_sync(cmdq->mbox.dev);
-	if (ret < 0)
-		return ret;
+	WARN_ON(pm_runtime_get(cmdq->mbox.dev) < 0);
+	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
 
 	task = kzalloc(sizeof(*task), GFP_ATOMIC);
 	if (!task) {
@@ -465,7 +472,8 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 	struct cmdq_task *task, *tmp;
 	unsigned long flags;
 
-	WARN_ON(pm_runtime_get_sync(cmdq->mbox.dev) < 0);
+	WARN_ON(pm_runtime_get(cmdq->mbox.dev) < 0);
+	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
 
 	spin_lock_irqsave(&thread->chan->lock, flags);
 	if (list_empty(&thread->task_busy_list))
@@ -507,11 +515,9 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 	struct cmdq_task *task, *tmp;
 	unsigned long flags;
 	u32 enable;
-	int ret;
 
-	ret = pm_runtime_get_sync(cmdq->mbox.dev);
-	if (ret < 0)
-		return ret;
+	WARN_ON(pm_runtime_get(cmdq->mbox.dev) < 0);
+	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
 
 	spin_lock_irqsave(&thread->chan->lock, flags);
 	if (list_empty(&thread->task_busy_list))
-- 
2.18.0

