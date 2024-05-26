Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF948CF48C
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 16:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AFC10ED98;
	Sun, 26 May 2024 14:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="r+WinUCU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088E610ECFA
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 14:44:53 +0000 (UTC)
X-UUID: 7f4ed2da1b6e11efbfff99f2466cf0b4-20240526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NWnj6OnW6ninVyJIWL6Bpz7Xphnne5qV2VadTlYzLZk=; 
 b=r+WinUCUZzx9nTU0k0GDesgwnTeuNM7pXYP0hFtS6A4zDEQaB6aNFMJndaR76y3kjuy6Btag9J+DVElbn122Yq44S4qtpb4fzHKCx5N9bEmEccukrhd6Rm9T34Oc9hCZJB6L8cfE1RJgo8yLfUitG2ZP/aNWQUBM24hQSasl3NY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:2722128b-c9e5-4504-b38b-c2fb5e961dc7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:c519d143-4544-4d06-b2b2-d7e12813c598,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7f4ed2da1b6e11efbfff99f2466cf0b4-20240526
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1072969248; Sun, 26 May 2024 22:44:46 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 26 May 2024 22:44:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 26 May 2024 22:44:45 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor+dt@kernel.org>, Jason-ch Chen
 <jason-ch.chen@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH RESEND,
 v6 6/8] mailbox: mediatek: Add CMDQ secure mailbox driver
Date: Sun, 26 May 2024 22:44:41 +0800
Message-ID: <20240526144443.14345-7-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
References: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--18.602300-8.000000
X-TMASE-MatchedRID: Rj0O6AIDomDJmaR8yBHGWN35+5/2RxqmmdrHMkUHHq/xSV7YBeBhS0/3
 ZkXeY1OAifPL5t/+d1VCJf+TySNSZK/0kNd183+//4ToWehCRQUZKp0SZ4P+dcUmcSma304TOGj
 73Ju1zWPhNoChA1M9WA7VVWr/VuT8LSTGw1g/Kd4SEYfcJF0pRV+BkiRsmHN+atWbs9bibghm+j
 6YVbX2YERy0RXCimV3YSKmTHn75DHVDAMEwzgZ7Mnlbo5l7mGF81hDEI6KFM3xxaAXDrCns0vBU
 YaaBg9+LZMXwlpLmfPH1tncxMS/Ak3NdyQQY/k0ttAWxuM5sl6dCQesAegqpsA0eOJZYj7tkOpG
 t8jTd6z5gayaUQa+83KsSHzyep+hPddTF47kT4vil2r2x2PwtZdhffisWXfHlBswc/o+g79rcDq
 Fw27ycAuxjYe89suLvESuIClZOuGXzBACGD0EVYzowSg21/RlS8T7akvAZueen0qBdy7fjJKjtg
 G1Urj8WsDcgJ4EicCYOsnXI2BT/+wy2NhRsPybnu1HSadECDVKgIbix5+XxMi9AjK6C8p1UAtgP
 dAuvr2a3n2WvXP6UPV/jn7tqoZ5KXGXWv7oGogWny127IX6ILYxxljjfMnjvqaU9Ng0zJL1O9p2
 Fcb2DYw1RpiFxkSgyYyeAPTbBZbyZ92BnYqk5iEK7m5BT0HZlHLUcNM85drzYcyIF7RSVc5QrsY
 lVpIaXJHQkxrKVxlC9EGPgxYwBr2Lbd/YaZ5jj56aIafJ4NHVBDonH99+VjcMuA1n9YHfC9u4t4
 siKdf08SxTLpWHh5wL4v+LSBHy3p2WLLHw99CeAiCmPx4NwJuJ+Pb8n/VxSnQ4MjwaO9cqtq5d3
 cxkNQP90fJP9eHt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.602300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3AF9CDB74B9C2C773FF12C74E4AF6FBAAE5B77BC56A196C92ADFE93EF9E492B92000:8
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

To support secure video path feature, GCE have to read/write registgers
in the secure world. GCE will enable the secure access permission to the
HW who wants to access the secure content buffer.

Add CMDQ secure mailbox driver to make CMDQ client user is able to
sending their HW settings to the secure world. So that GCE can execute
all instructions to configure HW in the secure world.

TODO:
1. Squash cmdq_sec_task_exec_work() into cmdq_sec_mbox_send_data().
2. Call into TEE to query cookie instead of using shared memory in
   cmdq_sec_get_cookie().
3. Register shared memory as command buffer instead of copying normal
   command buffer to IWC shared memory.
4. Use SOFTDEP to make cmdq_sec_probe later than OPTEE loaded and then
   move cmdq_sec_session_init into cmdq_sec_probe().
5. Remove timeout detection in cmdq_sec_session_send().

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/mailbox/Makefile                      |   2 +-
 drivers/mailbox/mtk-cmdq-sec-mailbox.c        | 931 ++++++++++++++++++
 drivers/mailbox/mtk-cmdq-sec-tee.c            | 195 ++++
 include/linux/mailbox/mtk-cmdq-mailbox.h      |   1 +
 .../linux/mailbox/mtk-cmdq-sec-iwc-common.h   | 342 +++++++
 include/linux/mailbox/mtk-cmdq-sec-mailbox.h  | 106 ++
 include/linux/mailbox/mtk-cmdq-sec-tee.h      | 105 ++
 7 files changed, 1681 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-mailbox.c
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-tee.c
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-iwc-common.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-mailbox.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-tee.h

diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 5cf2f54debaf..f4c304b50328 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -53,7 +53,7 @@ obj-$(CONFIG_STM32_IPCC) 	+= stm32-ipcc.o
 
 obj-$(CONFIG_MTK_ADSP_MBOX)	+= mtk-adsp-mailbox.o
 
-obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o
+obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o mtk-cmdq-sec-mailbox.o mtk-cmdq-sec-tee.o
 
 obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
 
diff --git a/drivers/mailbox/mtk-cmdq-sec-mailbox.c b/drivers/mailbox/mtk-cmdq-sec-mailbox.c
new file mode 100644
index 000000000000..f1ba827bf3a1
--- /dev/null
+++ b/drivers/mailbox/mtk-cmdq-sec-mailbox.c
@@ -0,0 +1,931 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/io.h>
+#include <linux/mailbox_client.h>
+#include <linux/mailbox_controller.h>
+#include <linux/of_platform.h>
+#include <linux/sched/clock.h>
+#include <linux/timer.h>
+
+#include <linux/mailbox/mtk-cmdq-mailbox.h>
+#include <linux/mailbox/mtk-cmdq-sec-mailbox.h>
+
+#define CMDQ_THR_EXEC_CNT_PA		(0x28)
+
+#define CMDQ_TIMEOUT_DEFAULT		(1000)
+
+#define CMDQ_WFE_CMD(event)		(0x2000000080008001ULL | ((u64)(event) << 32))
+#define CMDQ_EOC_CMD			(0x4000000000000001ULL)
+#define CMDQ_JUMP_CMD(addr, shift)	(0x1000000100000000ULL | ((addr) >> (shift)))
+
+struct cmdq_sec_task {
+	struct cmdq_task		task;
+
+	/* secure CMDQ */
+	bool				reset_exec;
+	u32				wait_cookie;
+	s32				scenario;
+	u64				trigger;
+	u64				exec_time;
+	struct work_struct		exec_work;
+};
+
+struct cmdq_sec_thread {
+	struct cmdq_thread		thread;
+
+	/* secure CMDQ */
+	struct device			*dev;
+	u32				idx;
+	struct timer_list		timeout;
+	u32				timeout_ms;
+	struct work_struct		timeout_work;
+	u32				wait_cookie;
+	u32				next_cookie;
+	u32				task_cnt;
+	struct workqueue_struct		*task_exec_wq;
+};
+
+/**
+ * struct cmdq_sec_context - CMDQ secure context structure.
+ * @tgid: tgid of process context.
+ * @state: state of inter-world communicatiom.
+ * @iwc_msg: buffer for inter-world communicatiom message.
+ * @tee_ctx: context structure for tee vendor.
+ *
+ * Note it is not global data, each process has its own cmdq_sec_context.
+ */
+struct cmdq_sec_context {
+	u32				tgid;
+	enum cmdq_iwc_state_enum	state;
+	void				*iwc_msg;
+	struct cmdq_sec_tee_context	tee_ctx;
+};
+
+/**
+ * struct cmdq_sec_shared_mem - shared memory between normal and secure world
+ * @va: virtual address of share memory.
+ * @pa: physical address of share memory.
+ * @size: size of share memory.
+ *
+ */
+struct cmdq_sec_shared_mem {
+	void				*va;
+	dma_addr_t			pa;
+	u32				size;
+};
+
+struct cmdq_sec {
+	struct device			dev;
+	const struct gce_sec_plat	*pdata;
+	void __iomem			*base;
+	phys_addr_t			base_pa;
+	struct cmdq_sec_thread		*sec_thread;
+	struct cmdq_pkt			clt_pkt;
+
+	atomic_t			path_res;
+	struct cmdq_sec_shared_mem	*shared_mem;
+	struct cmdq_sec_context		*context;
+
+	struct workqueue_struct		*timeout_wq;
+	u64				sec_invoke;
+	u64				sec_done;
+
+	struct mbox_client		notify_clt;
+	struct mbox_chan		*notify_chan;
+	bool				notify_run;
+	struct work_struct		irq_notify_work;
+	struct workqueue_struct		*notify_wq;
+	/* mutex for cmdq_sec_thread excuting cmdq_sec_task */
+	struct mutex			exec_lock;
+};
+
+static atomic_t cmdq_path_res = ATOMIC_INIT(0);
+
+static int cmdq_sec_task_submit(struct cmdq_sec *cmdq, struct cmdq_sec_task *sec_task,
+				const u32 iwc_cmd, const u32 thrd_idx);
+
+u16 cmdq_sec_get_eof_event_id(struct mbox_chan *chan)
+{
+	struct cmdq_thread *thread = chan->con_priv;
+	struct cmdq_sec_thread *sec_thread = container_of(thread, struct cmdq_sec_thread, thread);
+	struct cmdq_sec *cmdq = container_of(sec_thread->dev, struct cmdq_sec, dev);
+
+	return (u16)cmdq->pdata->cmdq_event;
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_get_eof_event_id);
+
+dma_addr_t cmdq_sec_get_exec_cnt_addr(struct mbox_chan *chan)
+{
+	struct cmdq_thread *thread = chan->con_priv;
+	struct cmdq_sec_thread *sec_thread = container_of(thread, struct cmdq_sec_thread, thread);
+	struct cmdq_sec *cmdq = container_of(sec_thread->dev, struct cmdq_sec, dev);
+
+	if (!cmdq->shared_mem) {
+		dev_err(&cmdq->dev, "%s share memory not ready!", __func__);
+		return 0;
+	}
+
+	dev_dbg(&cmdq->dev, "%s %d: thread:%u gce:%#lx",
+		__func__, __LINE__, sec_thread->idx,
+			(unsigned long)cmdq->base_pa);
+
+	return cmdq->base_pa + CMDQ_THR_BASE +
+		CMDQ_THR_SIZE * sec_thread->idx + CMDQ_THR_EXEC_CNT_PA;
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_get_exec_cnt_addr);
+
+dma_addr_t cmdq_sec_get_cookie_addr(struct mbox_chan *chan)
+{
+	struct cmdq_thread *thread = chan->con_priv;
+	struct cmdq_sec_thread *sec_thread = container_of(thread, struct cmdq_sec_thread, thread);
+	struct cmdq_sec *cmdq = container_of(sec_thread->dev, struct cmdq_sec, dev);
+
+	if (!cmdq->shared_mem) {
+		dev_err(&cmdq->dev, "%s share memory not ready!", __func__);
+		return 0;
+	}
+
+	dev_dbg(&cmdq->dev, "%s %d: thread:%u gce:%#lx",
+		__func__, __LINE__, sec_thread->idx,
+			(unsigned long)cmdq->base_pa);
+
+	return cmdq->shared_mem->pa +
+		CMDQ_SEC_SHARED_THR_CNT_OFFSET + sec_thread->idx * sizeof(u32);
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_get_cookie_addr);
+
+static u32 cmdq_sec_get_cookie(struct cmdq_sec *cmdq, u32 idx)
+{
+	return *(u32 *)(cmdq->shared_mem->va +
+		CMDQ_SEC_SHARED_THR_CNT_OFFSET + idx * sizeof(u32));
+}
+
+static void cmdq_sec_task_done(struct cmdq_sec_task *sec_task, int sta)
+{
+	struct cmdq_cb_data data;
+
+	data.sta = sta;
+	data.pkt = sec_task->task.pkt;
+
+	pr_debug("%s sec_task:%p pkt:%p err:%d",
+		 __func__, sec_task, sec_task->task.pkt, sta);
+
+	mbox_chan_received_data(sec_task->task.thread->chan, &data);
+
+	list_del_init(&sec_task->task.list_entry);
+	kfree(sec_task);
+}
+
+static bool cmdq_sec_irq_handler(struct cmdq_sec_thread *sec_thread,
+				 const u32 cookie, const int err)
+{
+	struct cmdq_sec_task *sec_task;
+	struct cmdq_task *task, *temp, *cur_task = NULL;
+	struct cmdq_sec *cmdq = container_of(sec_thread->dev, struct cmdq_sec, dev);
+	unsigned long flags;
+	int done;
+
+	spin_lock_irqsave(&sec_thread->thread.chan->lock, flags);
+	if (sec_thread->wait_cookie <= cookie)
+		done = cookie - sec_thread->wait_cookie + 1;
+	else if (sec_thread->wait_cookie == (cookie + 1) % CMDQ_MAX_COOKIE_VALUE)
+		done = 0;
+	else
+		done = CMDQ_MAX_COOKIE_VALUE - sec_thread->wait_cookie + 1 + cookie + 1;
+
+	list_for_each_entry_safe(task, temp, &sec_thread->thread.task_busy_list, list_entry) {
+		if (!done)
+			break;
+
+		sec_task = container_of(task, struct cmdq_sec_task, task);
+		cmdq_sec_task_done(sec_task, err);
+
+		if (sec_thread->task_cnt)
+			sec_thread->task_cnt -= 1;
+
+		done--;
+	}
+
+	cur_task = list_first_entry_or_null(&sec_thread->thread.task_busy_list,
+					    struct cmdq_task, list_entry);
+	if (err && cur_task) {
+		spin_unlock_irqrestore(&sec_thread->thread.chan->lock, flags);
+
+		sec_task = container_of(cur_task, struct cmdq_sec_task, task);
+
+		/* for error task, cancel, callback and done */
+		cmdq_sec_task_submit(cmdq, sec_task, CMD_CMDQ_IWC_CANCEL_TASK,
+				     sec_thread->idx);
+
+		cmdq_sec_task_done(sec_task, err);
+
+		spin_lock_irqsave(&sec_thread->thread.chan->lock, flags);
+
+		task = list_first_entry_or_null(&sec_thread->thread.task_busy_list,
+						struct cmdq_task, list_entry);
+		if (cur_task == task)
+			cmdq_sec_task_done(sec_task, err);
+		else
+			dev_err(&cmdq->dev, "task list changed");
+
+		/*
+		 * error case stop all task for secure,
+		 * since secure tdrv always remove all when cancel
+		 */
+		while (!list_empty(&sec_thread->thread.task_busy_list)) {
+			cur_task = list_first_entry(&sec_thread->thread.task_busy_list,
+						    struct cmdq_task, list_entry);
+
+			sec_task = container_of(cur_task, struct cmdq_sec_task, task);
+			cmdq_sec_task_done(sec_task, -ECONNABORTED);
+		}
+	} else if (err) {
+		dev_dbg(&cmdq->dev, "error but all task done, check notify callback");
+	}
+
+	if (list_empty(&sec_thread->thread.task_busy_list)) {
+		sec_thread->wait_cookie = 0;
+		sec_thread->next_cookie = 0;
+		sec_thread->task_cnt = 0;
+		__raw_writel(0, (void __iomem *)cmdq->shared_mem->va +
+			     CMDQ_SEC_SHARED_THR_CNT_OFFSET +
+			     sec_thread->idx * sizeof(u32));
+		spin_unlock_irqrestore(&sec_thread->thread.chan->lock, flags);
+		del_timer(&sec_thread->timeout);
+		return true;
+	}
+
+	sec_thread->wait_cookie = cookie % CMDQ_MAX_COOKIE_VALUE + 1;
+
+	mod_timer(&sec_thread->timeout, jiffies + msecs_to_jiffies(sec_thread->timeout_ms));
+	spin_unlock_irqrestore(&sec_thread->thread.chan->lock, flags);
+
+	return false;
+}
+
+static void cmdq_sec_irq_notify_work(struct work_struct *work_item)
+{
+	struct cmdq_sec *cmdq = container_of(work_item, struct cmdq_sec, irq_notify_work);
+	int i;
+
+	mutex_lock(&cmdq->exec_lock);
+
+	for (i = 0; i <= cmdq->pdata->secure_thread_nr; i++) {
+		struct cmdq_sec_thread *sec_thread = &cmdq->sec_thread[i];
+		u32 cookie = cmdq_sec_get_cookie(cmdq, sec_thread->idx);
+
+		if (cookie < sec_thread->wait_cookie || !sec_thread->task_cnt)
+			continue;
+
+		cmdq_sec_irq_handler(sec_thread, cookie, 0);
+	}
+
+	mutex_unlock(&cmdq->exec_lock);
+}
+
+static void cmdq_sec_irq_notify_callback(struct mbox_client *cl, void *mssg)
+{
+	struct cmdq_cb_data *data = (struct cmdq_cb_data *)mssg;
+	struct cmdq_sec *cmdq = container_of(data->pkt, struct cmdq_sec, clt_pkt);
+
+	if (work_pending(&cmdq->irq_notify_work)) {
+		dev_dbg(&cmdq->dev, "%s last notify callback working", __func__);
+		return;
+	}
+
+	queue_work(cmdq->notify_wq, &cmdq->irq_notify_work);
+}
+
+static int cmdq_sec_irq_notify_start(struct cmdq_sec *cmdq)
+{
+	int err;
+	dma_addr_t dma_addr;
+	u64 *inst = NULL;
+
+	if (cmdq->notify_run)
+		return 0;
+
+	cmdq->notify_clt.dev = cmdq->pdata->mbox->dev;
+	cmdq->notify_clt.rx_callback = cmdq_sec_irq_notify_callback;
+	cmdq->notify_clt.tx_block = false;
+	cmdq->notify_clt.knows_txdone = true;
+	cmdq->notify_chan = mbox_request_channel(&cmdq->notify_clt, 0);
+	if (IS_ERR(cmdq->notify_chan)) {
+		dev_err(&cmdq->dev, "failed to request channel\n");
+		return -ENODEV;
+	}
+
+	cmdq->clt_pkt.va_base = kzalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!cmdq->clt_pkt.va_base)
+		return -ENOMEM;
+
+	cmdq->clt_pkt.buf_size = PAGE_SIZE;
+
+	dma_addr = dma_map_single(cmdq->pdata->mbox->dev, cmdq->clt_pkt.va_base,
+				  cmdq->clt_pkt.buf_size, DMA_TO_DEVICE);
+	if (dma_mapping_error(cmdq->pdata->mbox->dev, dma_addr)) {
+		dev_err(cmdq->pdata->mbox->dev, "dma map failed, size=%lu\n", PAGE_SIZE);
+		kfree(cmdq->clt_pkt.va_base);
+		return -ENOMEM;
+	}
+	cmdq->clt_pkt.pa_base = dma_addr;
+
+	INIT_WORK(&cmdq->irq_notify_work, cmdq_sec_irq_notify_work);
+
+	/* generate irq notify loop command */
+	inst = (u64 *)cmdq->clt_pkt.va_base;
+	*inst = CMDQ_WFE_CMD(cmdq->pdata->cmdq_event);
+	inst++;
+	*inst = CMDQ_EOC_CMD;
+	inst++;
+	*inst = CMDQ_JUMP_CMD(cmdq->clt_pkt.pa_base, cmdq->pdata->shift);
+	inst++;
+	cmdq->clt_pkt.cmd_buf_size += CMDQ_INST_SIZE * 3;
+	cmdq->clt_pkt.loop = true;
+
+	dma_sync_single_for_device(cmdq->pdata->mbox->dev,
+				   cmdq->clt_pkt.pa_base,
+				   cmdq->clt_pkt.cmd_buf_size,
+				   DMA_TO_DEVICE);
+	err = mbox_send_message(cmdq->notify_chan, &cmdq->clt_pkt);
+	mbox_client_txdone(cmdq->notify_chan, 0);
+	if (err < 0) {
+		dev_err(&cmdq->dev, "%s failed:%d", __func__, err);
+		dma_unmap_single(cmdq->pdata->mbox->dev, cmdq->clt_pkt.pa_base,
+				 cmdq->clt_pkt.buf_size, DMA_TO_DEVICE);
+		kfree(cmdq->clt_pkt.va_base);
+		mbox_free_channel(cmdq->notify_chan);
+
+		return err;
+	}
+
+	cmdq->notify_run = true;
+	dev_dbg(&cmdq->dev, "%s success!", __func__);
+
+	return 0;
+}
+
+static int cmdq_sec_session_init(struct cmdq_sec_context *context)
+{
+	int err = 0;
+
+	if (context->state >= IWC_SES_OPENED) {
+		pr_debug("session opened:%u", context->state);
+		return 0;
+	}
+
+	if (context->state == IWC_INIT) {
+		err = cmdq_sec_init_context(&context->tee_ctx);
+		if (err)
+			return err;
+		context->state = IWC_CONTEXT_INITED;
+	}
+
+	if (context->state == IWC_CONTEXT_INITED) {
+		if (context->iwc_msg) {
+			pr_err("iwcMessage not NULL:%p", context->iwc_msg);
+			return -EINVAL;
+		}
+
+		err = cmdq_sec_allocate_wsm(&context->tee_ctx, &context->iwc_msg,
+					    sizeof(struct iwc_cmdq_message_t));
+		if (err)
+			return err;
+
+		context->state = IWC_WSM_ALLOCATED;
+	}
+
+	if (context->state == IWC_WSM_ALLOCATED) {
+		err = cmdq_sec_open_session(&context->tee_ctx, context->iwc_msg);
+		if (err)
+			return err;
+
+		context->state = IWC_SES_OPENED;
+	}
+
+	return 0;
+}
+
+static int cmdq_sec_fill_iwc_msg(struct cmdq_sec_context *context,
+				 struct cmdq_sec_task *sec_task, u32 thrd_idx)
+{
+	struct iwc_cmdq_message_t *iwc_msg = NULL;
+	struct cmdq_sec_data *data = (struct cmdq_sec_data *)sec_task->task.pkt->sec_data;
+	u32 size = 0, *instr;
+
+	iwc_msg = (struct iwc_cmdq_message_t *)context->iwc_msg;
+
+	if (sec_task->task.pkt->cmd_buf_size + 4 * CMDQ_INST_SIZE > CMDQ_TZ_CMD_BLOCK_SIZE) {
+		pr_err("sec_task:%p size:%zu > %u",
+		       sec_task, sec_task->task.pkt->cmd_buf_size, CMDQ_TZ_CMD_BLOCK_SIZE);
+		return -EFAULT;
+	}
+
+	if (thrd_idx == CMDQ_INVALID_THREAD) {
+		iwc_msg->command.cmd_size = 0;
+		iwc_msg->command.metadata.addr_list_length = 0;
+		return -EINVAL;
+	}
+
+	iwc_msg->command.thread = thrd_idx;
+	iwc_msg->command.scenario = sec_task->scenario;
+	size = sec_task->task.pkt->cmd_buf_size;
+	memcpy(iwc_msg->command.va_base, sec_task->task.pkt->va_base, size);
+	iwc_msg->command.cmd_size += size;
+
+	instr = &iwc_msg->command.va_base[iwc_msg->command.cmd_size / 4 - 4];
+	/* Remove IRQ_EN in EOC */
+	if (*(u64 *)instr == CMDQ_EOC_CMD)
+		instr[0] = 0;
+	else
+		pr_err("%s %d: find EOC failed: %#x %#x",
+		       __func__, __LINE__, instr[1], instr[0]);
+
+	iwc_msg->command.wait_cookie = sec_task->wait_cookie;
+	iwc_msg->command.reset_exec = sec_task->reset_exec;
+
+	if (data->addr_metadata_cnt) {
+		iwc_msg->command.metadata.addr_list_length = data->addr_metadata_cnt;
+		memcpy(iwc_msg->command.metadata.addr_list,
+		       (u32 *)(unsigned long)data->addr_metadatas,
+		       data->addr_metadata_cnt * sizeof(struct iwc_cmdq_addr_metadata_t));
+	}
+
+	iwc_msg->command.normal_task_handle = (unsigned long)sec_task->task.pkt;
+
+	return 0;
+}
+
+static int cmdq_sec_session_send(struct cmdq_sec_context *context,
+				 struct cmdq_sec_task *sec_task, const u32 iwc_cmd,
+				 const u32 thrd_idx, struct cmdq_sec *cmdq)
+{
+	int err = 0;
+	u64 cost;
+	struct iwc_cmdq_message_t *iwc_msg = NULL;
+
+	iwc_msg = (struct iwc_cmdq_message_t *)context->iwc_msg;
+
+	memset(iwc_msg, 0, sizeof(*iwc_msg));
+	iwc_msg->cmd = iwc_cmd;
+	iwc_msg->cmdq_id = cmdq->pdata->hwid;
+	iwc_msg->command.thread = thrd_idx;
+
+	switch (iwc_cmd) {
+	case CMD_CMDQ_IWC_SUBMIT_TASK:
+		err = cmdq_sec_fill_iwc_msg(context, sec_task, thrd_idx);
+		if (err)
+			return err;
+		break;
+	case CMD_CMDQ_IWC_CANCEL_TASK:
+		iwc_msg->cancel_task.wait_cookie = sec_task->wait_cookie;
+		iwc_msg->cancel_task.thread = thrd_idx;
+		break;
+	case CMD_CMDQ_IWC_PATH_RES_ALLOCATE:
+		if (!cmdq->shared_mem || !cmdq->shared_mem->va) {
+			dev_err(&cmdq->dev, "%s %d: shared_mem is NULL", __func__, __LINE__);
+			return -EFAULT;
+		}
+		iwc_msg->path_resource.size = cmdq->shared_mem->size;
+		iwc_msg->path_resource.share_memoy_pa = cmdq->shared_mem->pa;
+		iwc_msg->path_resource.use_normal_irq = 1;
+		break;
+	default:
+		break;
+	}
+
+	cmdq->sec_invoke = sched_clock();
+	dev_dbg(&cmdq->dev, "%s execute cmdq:%p sec_task:%p command:%u thread:%u cookie:%d",
+		__func__, cmdq, sec_task, iwc_cmd, thrd_idx,
+		sec_task ? sec_task->wait_cookie : -1);
+
+	/* send message */
+	err = cmdq_sec_execute_session(&context->tee_ctx, iwc_cmd, CMDQ_TIMEOUT_DEFAULT);
+
+	cmdq->sec_done = sched_clock();
+	cost = div_u64(cmdq->sec_done - cmdq->sec_invoke, 1000000);
+	if (cost >= CMDQ_TIMEOUT_DEFAULT)
+		dev_err(&cmdq->dev, "%s execute timeout cmdq:%p sec_task:%p cost:%lluus",
+			__func__, cmdq, sec_task, cost);
+	else
+		dev_dbg(&cmdq->dev, "%s execute done cmdq:%p sec_task:%p cost:%lluus",
+			__func__, cmdq, sec_task, cost);
+
+	if (err)
+		return err;
+
+	context->state = IWC_SES_ON_TRANSACTED;
+	return 0;
+}
+
+static int cmdq_sec_session_reply(const u32 iwc_cmd, struct iwc_cmdq_message_t *iwc_msg,
+				  struct cmdq_sec_task *sec_task)
+{
+	if (iwc_msg->rsp >= 0)
+		return iwc_msg->rsp;
+
+	if (iwc_cmd == CMD_CMDQ_IWC_SUBMIT_TASK) {
+		struct iwc_cmdq_sec_status_t *sec_status = &iwc_msg->sec_status;
+		int i;
+
+		/* print submit fail case status */
+		pr_err("last sec status: step:%u status:%d args:%#x %#x %#x %#x dispatch:%s\n",
+		       sec_status->step, sec_status->status, sec_status->args[0],
+			   sec_status->args[1], sec_status->args[2], sec_status->args[3],
+			   sec_status->dispatch);
+
+		for (i = 0; i < sec_status->inst_index; i += 2)
+			pr_err("instr %d: %08x %08x\n", i / 2,
+			       sec_status->sec_inst[i], sec_status->sec_inst[i + 1]);
+	} else if (iwc_cmd == CMD_CMDQ_IWC_CANCEL_TASK) {
+		struct iwc_cmdq_cancel_task_t *cancel = &iwc_msg->cancel_task;
+
+		/* print cancel task fail case status */
+		if ((cancel->err_instr[1] >> 24) == CMDQ_CODE_WFE)
+			pr_err("secure error inst event:%u value:%d\n",
+			       cancel->err_instr[1], cancel->reg_value);
+
+		pr_err("cancel_task inst:%08x %08x aee:%d reset:%d pc:0x%08x\n",
+		       cancel->err_instr[1], cancel->err_instr[0],
+			   cancel->throw_aee, cancel->has_reset, cancel->pc);
+	}
+
+	return iwc_msg->rsp;
+}
+
+static int cmdq_sec_task_submit(struct cmdq_sec *cmdq, struct cmdq_sec_task *sec_task,
+				const u32 iwc_cmd, const u32 thrd_idx)
+{
+	struct cmdq_sec_context *context;
+	int err = 0;
+
+	if (!cmdq->context) {
+		context = kzalloc(sizeof(*cmdq->context), GFP_ATOMIC);
+		if (!context)
+			return -ENOMEM;
+
+		cmdq->context = context;
+		cmdq->context->state = IWC_INIT;
+		cmdq->context->tgid = current->tgid;
+	}
+
+	if (cmdq->context->state == IWC_INIT)
+		cmdq_sec_setup_tee_context(&cmdq->context->tee_ctx);
+
+	err = cmdq_sec_session_init(cmdq->context);
+	if (err) {
+		dev_err(&cmdq->dev, "%s %d: cmdq_sec_session_init fail: %d",
+			__func__, __LINE__, err);
+		return err;
+	}
+
+	err = cmdq_sec_irq_notify_start(cmdq);
+	if (err) {
+		dev_err(&cmdq->dev, "%s %d: cmdq_sec_irq_notify_start fail: %d",
+			__func__, __LINE__, err);
+		return err;
+	}
+
+	err = cmdq_sec_session_send(cmdq->context, sec_task, iwc_cmd, thrd_idx, cmdq);
+	if (err) {
+		dev_err(&cmdq->dev, "%s %d: iwc_cmd:%d err:%d sec_task:%p thread:%u gce:%#lx",
+			__func__, __LINE__, iwc_cmd, err, sec_task, thrd_idx,
+			(unsigned long)cmdq->base_pa);
+		return err;
+	}
+
+	err = cmdq_sec_session_reply(iwc_cmd, cmdq->context->iwc_msg, sec_task);
+	if (err) {
+		dev_err(&cmdq->dev, "%s %d: cmdq_sec_session_reply fail: %d",
+			__func__, __LINE__, err);
+		return err;
+	}
+
+	return 0;
+}
+
+static void cmdq_sec_task_exec_work(struct work_struct *work_item)
+{
+	struct cmdq_sec_task *sec_task = container_of(work_item,
+						      struct cmdq_sec_task, exec_work);
+	struct cmdq_sec_thread *sec_thread = container_of(sec_task->task.thread,
+							 struct cmdq_sec_thread, thread);
+	struct cmdq_sec *cmdq = container_of(sec_thread->dev, struct cmdq_sec, dev);
+	unsigned long flags;
+	int err;
+
+	dev_dbg(&cmdq->dev, "%s gce:%#lx sec_task:%p pkt:%p thread:%u",
+		__func__, (unsigned long)cmdq->base_pa,
+		sec_task, sec_task->task.pkt, sec_thread->idx);
+
+	if (!sec_task->task.pkt->sec_data) {
+		dev_err(&cmdq->dev, "pkt:%p without sec_data", sec_task->task.pkt);
+		return;
+	}
+	data = (struct cmdq_sec_data *)sec_task->task.pkt->sec_data;
+
+	mutex_lock(&cmdq->exec_lock);
+
+	spin_lock_irqsave(&sec_thread->thread.chan->lock, flags);
+	if (!sec_thread->task_cnt) {
+		mod_timer(&sec_thread->timeout, jiffies +
+			  msecs_to_jiffies(sec_thread->timeout_ms));
+		sec_thread->wait_cookie = 1;
+		sec_thread->next_cookie = 1;
+		sec_thread->task_cnt = 0;
+		__raw_writel(0, (void __iomem *)cmdq->shared_mem->va +
+			     CMDQ_SEC_SHARED_THR_CNT_OFFSET + sec_thread->idx * sizeof(u32));
+	}
+
+	sec_task->reset_exec = sec_thread->task_cnt ? false : true;
+	sec_task->wait_cookie = sec_thread->next_cookie;
+	sec_thread->next_cookie = (sec_thread->next_cookie + 1) % CMDQ_MAX_COOKIE_VALUE;
+	list_add_tail(&sec_task->task.list_entry, &sec_thread->thread.task_busy_list);
+	sec_thread->task_cnt += 1;
+	spin_unlock_irqrestore(&sec_thread->thread.chan->lock, flags);
+	sec_task->trigger = sched_clock();
+
+	if (!atomic_cmpxchg(&cmdq_path_res, 0, 1)) {
+		err = cmdq_sec_task_submit(cmdq, NULL, CMD_CMDQ_IWC_PATH_RES_ALLOCATE,
+					   CMDQ_INVALID_THREAD);
+		if (err) {
+			atomic_set(&cmdq_path_res, 0);
+			goto task_end;
+		}
+	}
+
+	if (sec_thread->task_cnt > CMDQ_MAX_TASK_IN_SECURE_THREAD) {
+		dev_err(&cmdq->dev, "task_cnt:%u cannot more than %u sec_task:%p thread:%u",
+			sec_thread->task_cnt, CMDQ_MAX_TASK_IN_SECURE_THREAD,
+			sec_task, sec_thread->idx);
+		err = -EMSGSIZE;
+		goto task_end;
+	}
+
+	err = cmdq_sec_task_submit(cmdq, sec_task, CMD_CMDQ_IWC_SUBMIT_TASK,
+				   sec_thread->idx);
+	if (err)
+		dev_err(&cmdq->dev, "cmdq_sec_task_submit err:%d sec_task:%p thread:%u",
+			err, sec_task, sec_thread->idx);
+
+task_end:
+	if (err) {
+		struct cmdq_cb_data cb_data;
+
+		cb_data.sta = err;
+		cb_data.pkt = sec_task->task.pkt;
+		mbox_chan_received_data(sec_thread->thread.chan, &cb_data);
+
+		spin_lock_irqsave(&sec_thread->thread.chan->lock, flags);
+		if (!sec_thread->task_cnt)
+			dev_err(&cmdq->dev, "thread:%u task_cnt:%u cannot below zero",
+				sec_thread->idx, sec_thread->task_cnt);
+		else
+			sec_thread->task_cnt -= 1;
+
+		sec_thread->next_cookie = (sec_thread->next_cookie - 1 +
+			CMDQ_MAX_COOKIE_VALUE) % CMDQ_MAX_COOKIE_VALUE;
+		list_del(&sec_task->task.list_entry);
+		dev_dbg(&cmdq->dev, "gce:%#lx err:%d sec_task:%p pkt:%p",
+			(unsigned long)cmdq->base_pa, err, sec_task, sec_task->task.pkt);
+		dev_dbg(&cmdq->dev, "thread:%u task_cnt:%u wait_cookie:%u next_cookie:%u",
+			sec_thread->idx, sec_thread->task_cnt,
+			sec_thread->wait_cookie, sec_thread->next_cookie);
+		spin_unlock_irqrestore(&sec_thread->thread.chan->lock, flags);
+
+		kfree(sec_task);
+	}
+
+	mutex_unlock(&cmdq->exec_lock);
+}
+
+static int cmdq_sec_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct cmdq_pkt *pkt = (struct cmdq_pkt *)data;
+	struct cmdq_sec_data *sec_data = (struct cmdq_sec_data *)pkt->sec_data;
+	struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
+	struct cmdq_sec_thread *sec_thread = container_of(thread, struct cmdq_sec_thread, thread);
+	struct cmdq_sec_task *sec_task;
+
+	if (!sec_data)
+		return -EINVAL;
+
+	sec_task = kzalloc(sizeof(*sec_task), GFP_ATOMIC);
+	if (!sec_task)
+		return -ENOMEM;
+
+	sec_task->task.pkt = pkt;
+	sec_task->task.thread = thread;
+	sec_task->scenario = sec_data->scenario;
+
+	INIT_WORK(&sec_task->exec_work, cmdq_sec_task_exec_work);
+	queue_work(sec_thread->task_exec_wq, &sec_task->exec_work);
+
+	return 0;
+}
+
+static void cmdq_sec_thread_timeout(struct timer_list *t)
+{
+	struct cmdq_sec_thread *sec_thread = from_timer(sec_thread, t, timeout);
+	struct cmdq_sec *cmdq = container_of(sec_thread->dev, struct cmdq_sec, dev);
+
+	if (!work_pending(&sec_thread->timeout_work))
+		queue_work(cmdq->timeout_wq, &sec_thread->timeout_work);
+}
+
+static void cmdq_sec_task_timeout_work(struct work_struct *work_item)
+{
+	struct cmdq_sec_thread *sec_thread = container_of(work_item,
+							  struct cmdq_sec_thread, timeout_work);
+	struct cmdq_sec *cmdq = container_of(sec_thread->dev, struct cmdq_sec, dev);
+	struct cmdq_task *task;
+	struct cmdq_sec_task *sec_task;
+	unsigned long flags;
+	u64 duration;
+	u32 cookie;
+
+	mutex_lock(&cmdq->exec_lock);
+
+	spin_lock_irqsave(&sec_thread->thread.chan->lock, flags);
+	if (list_empty(&sec_thread->thread.task_busy_list)) {
+		dev_err(&cmdq->dev, "thread:%u task_list is empty", sec_thread->idx);
+		spin_unlock_irqrestore(&sec_thread->thread.chan->lock, flags);
+		goto done;
+	}
+
+	task = list_first_entry(&sec_thread->thread.task_busy_list,
+				struct cmdq_task, list_entry);
+	sec_task = container_of(task, struct cmdq_sec_task, task);
+	duration = div_u64(sched_clock() - sec_task->trigger, 1000000);
+	if (duration < sec_thread->timeout_ms) {
+		mod_timer(&sec_thread->timeout, jiffies +
+			  msecs_to_jiffies(sec_thread->timeout_ms - duration));
+		spin_unlock_irqrestore(&sec_thread->thread.chan->lock, flags);
+		goto done;
+	}
+
+	cookie = cmdq_sec_get_cookie(cmdq, sec_thread->idx);
+	spin_unlock_irqrestore(&sec_thread->thread.chan->lock, flags);
+
+	dev_err(&cmdq->dev, "%s duration:%llu cookie:%u thread:%u",
+		__func__, duration, cookie, sec_thread->idx);
+	cmdq_sec_irq_handler(sec_thread, cookie, -ETIMEDOUT);
+
+done:
+	mutex_unlock(&cmdq->exec_lock);
+}
+
+static int cmdq_sec_mbox_startup(struct mbox_chan *chan)
+{
+	struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
+	struct cmdq_sec_thread *sec_thread = container_of(thread,
+							  struct cmdq_sec_thread, thread);
+	char name[20];
+
+	snprintf(name, sizeof(name), "task_exec_wq_%u", sec_thread->idx);
+	sec_thread->task_exec_wq = create_singlethread_workqueue(name);
+
+	return 0;
+}
+
+static int cmdq_sec_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
+{
+	struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
+	struct cmdq_sec_thread *sec_thread = container_of(thread,
+							  struct cmdq_sec_thread, thread);
+	struct cmdq_sec *cmdq = container_of(sec_thread->dev, struct cmdq_sec, dev);
+	u32 cookie = 0;
+
+	mutex_lock(&cmdq->exec_lock);
+
+	if (list_empty(&thread->task_busy_list)) {
+		mutex_unlock(&cmdq->exec_lock);
+		return 0;
+	}
+
+	cookie = cmdq_sec_get_cookie(cmdq, sec_thread->idx);
+	if (cookie >= sec_thread->wait_cookie && sec_thread->task_cnt > 0)
+		cmdq_sec_irq_handler(sec_thread, cookie, -ECONNABORTED);
+
+	mutex_unlock(&cmdq->exec_lock);
+	return 0;
+}
+
+static void cmdq_sec_mbox_shutdown(struct mbox_chan *chan)
+{
+	cmdq_sec_mbox_flush(chan, 0);
+}
+
+static const struct mbox_chan_ops cmdq_sec_mbox_chan_ops = {
+	.send_data = cmdq_sec_mbox_send_data,
+	.startup = cmdq_sec_mbox_startup,
+	.shutdown = cmdq_sec_mbox_shutdown,
+	.flush = cmdq_sec_mbox_flush,
+};
+
+struct cmdq_sec_mailbox cmdq_sec_mbox = {
+	.ops = &cmdq_sec_mbox_chan_ops,
+};
+EXPORT_SYMBOL_GPL(cmdq_sec_mbox);
+
+static int cmdq_sec_probe(struct platform_device *pdev)
+{
+	int i;
+	struct cmdq_sec *cmdq;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+
+	cmdq = devm_kzalloc(dev, sizeof(*cmdq), GFP_KERNEL);
+	if (!cmdq)
+		return -ENOMEM;
+
+	cmdq->dev = pdev->dev;
+	cmdq->pdata = (struct gce_sec_plat *)pdev->dev.platform_data;
+	if (!cmdq->pdata) {
+		dev_err(dev, "no valid gce platform data!\n");
+		return -EINVAL;
+	}
+
+	cmdq->base = cmdq->pdata->base;
+	res = platform_get_resource(to_platform_device(cmdq->pdata->mbox->dev),
+				    IORESOURCE_MEM, 0);
+	if (IS_ERR(cmdq->base)) {
+		dev_err(dev, "devm_platform_get_and_ioremap_resource failed!\n");
+		return PTR_ERR(cmdq->base);
+	}
+
+	cmdq->base_pa = res->start;
+
+	cmdq->sec_thread = devm_kcalloc(dev, cmdq->pdata->secure_thread_nr,
+					sizeof(*cmdq->sec_thread), GFP_KERNEL);
+	if (!cmdq->sec_thread)
+		return -ENOMEM;
+
+	mutex_init(&cmdq->exec_lock);
+	for (i = 0; i < cmdq->pdata->secure_thread_nr; i++) {
+		u32  idx = i + cmdq->pdata->secure_thread_min;
+
+		cmdq->sec_thread[i].dev = &cmdq->dev;
+		cmdq->sec_thread[i].idx = idx;
+		cmdq->sec_thread[i].thread.base = cmdq->base + CMDQ_THR_BASE + CMDQ_THR_SIZE * idx;
+		cmdq->sec_thread[i].timeout_ms = CMDQ_TIMEOUT_DEFAULT;
+		INIT_LIST_HEAD(&cmdq->sec_thread[i].thread.task_busy_list);
+		cmdq->pdata->mbox->chans[idx].con_priv = (void *)&cmdq->sec_thread[i].thread;
+		dev_dbg(dev, "re-assign chans[%d] as secure thread\n", idx);
+		timer_setup(&cmdq->sec_thread[i].timeout, cmdq_sec_thread_timeout, 0);
+		INIT_WORK(&cmdq->sec_thread[i].timeout_work, cmdq_sec_task_timeout_work);
+	}
+
+	cmdq->notify_wq = create_singlethread_workqueue("mtk_cmdq_sec_notify_wq");
+	cmdq->timeout_wq = create_singlethread_workqueue("mtk_cmdq_sec_timeout_wq");
+
+	cmdq->shared_mem = devm_kzalloc(dev, sizeof(*cmdq->shared_mem), GFP_KERNEL);
+	if (!cmdq->shared_mem)
+		return -ENOMEM;
+
+	cmdq->shared_mem->va = dma_alloc_coherent(dev, PAGE_SIZE,
+						  &cmdq->shared_mem->pa, GFP_KERNEL);
+	cmdq->shared_mem->size = PAGE_SIZE;
+
+	platform_set_drvdata(pdev, cmdq);
+
+	return 0;
+}
+
+static int cmdq_sec_remove(struct platform_device *pdev)
+{
+	struct cmdq_sec *cmdq = platform_get_drvdata(pdev);
+
+	if (cmdq->context)
+		cmdq_sec_free_wsm(&cmdq->context->tee_ctx, &cmdq->context->iwc_msg);
+
+	return 0;
+}
+
+static struct platform_driver cmdq_sec_drv = {
+	.probe = cmdq_sec_probe,
+	.remove = cmdq_sec_remove,
+	.driver = {
+		.name = "mtk-cmdq-sec",
+	},
+};
+
+static int __init cmdq_sec_init(void)
+{
+	return platform_driver_register(&cmdq_sec_drv);
+}
+
+static void __exit cmdq_sec_exit(void)
+{
+	platform_driver_unregister(&cmdq_sec_drv);
+}
+
+module_init(cmdq_sec_init);
+module_exit(cmdq_sec_exit);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/mailbox/mtk-cmdq-sec-tee.c b/drivers/mailbox/mtk-cmdq-sec-tee.c
new file mode 100644
index 000000000000..acb552bd7f0d
--- /dev/null
+++ b/drivers/mailbox/mtk-cmdq-sec-tee.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#include <linux/math64.h>
+#include <linux/sched/clock.h>
+
+#include <linux/mailbox/mtk-cmdq-sec-tee.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+/* lock to protect atomic secure task execution */
+static DEFINE_MUTEX(cmdq_sec_exec_lock);
+
+void cmdq_sec_setup_tee_context(struct cmdq_sec_tee_context *tee)
+{
+	/* 09010000 0000 0000 0000000000000000 */
+	memset(tee->uuid, 0, sizeof(tee->uuid));
+	tee->uuid[0] = 0x9;
+	tee->uuid[1] = 0x1;
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_setup_tee_context);
+
+#if IS_ENABLED(CONFIG_TEE)
+static int tee_dev_match(struct tee_ioctl_version_data *t, const void *v)
+{
+	if (t->impl_id == TEE_IMPL_ID_OPTEE)
+		return 1;
+
+	return 0;
+}
+#endif
+
+int cmdq_sec_init_context(struct cmdq_sec_tee_context *tee)
+{
+#if IS_ENABLED(CONFIG_TEE)
+	tee->tee_context = tee_client_open_context(NULL, tee_dev_match, NULL, NULL);
+	if (!tee->tee_context) {
+		pr_err("[%s][%d] tee_client_open_context failed!", __func__, __LINE__);
+		return -EFAULT;
+	}
+
+	return 0;
+#else
+	return -EFAULT;
+#endif
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_init_context);
+
+int cmdq_sec_deinit_context(struct cmdq_sec_tee_context *tee)
+{
+#if IS_ENABLED(CONFIG_TEE)
+	if (tee && tee->tee_context)
+		tee_client_close_context(tee->tee_context);
+
+	return 0;
+#else
+	return -EFAULT;
+#endif
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_deinit_context);
+
+int cmdq_sec_allocate_wsm(struct cmdq_sec_tee_context *tee, void **wsm_buffer, u32 size)
+{
+#if IS_ENABLED(CONFIG_TEE)
+	void *buffer;
+
+	if (!wsm_buffer)
+		return -EINVAL;
+
+	if (size == 0)
+		return -EINVAL;
+
+	buffer = kmalloc(size, GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	tee->shared_mem = tee_shm_register_kernel_buf(tee->tee_context, buffer, size);
+	if (!tee->shared_mem) {
+		kfree(buffer);
+		return -ENOMEM;
+	}
+
+	*wsm_buffer = buffer;
+
+	return 0;
+#else
+	return -EFAULT;
+#endif
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_allocate_wsm);
+
+int cmdq_sec_free_wsm(struct cmdq_sec_tee_context *tee, void **wsm_buffer)
+{
+#if IS_ENABLED(CONFIG_TEE)
+	if (!wsm_buffer)
+		return -EINVAL;
+
+	tee_shm_free(tee->shared_mem);
+	tee->shared_mem = NULL;
+	kfree(*wsm_buffer);
+	*wsm_buffer = NULL;
+
+	return 0;
+#else
+	return -EFAULT;
+#endif
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_free_wsm);
+
+int cmdq_sec_open_session(struct cmdq_sec_tee_context *tee, void *wsm_buffer)
+{
+#if IS_ENABLED(CONFIG_TEE)
+	struct tee_ioctl_open_session_arg osarg = {0};
+	struct tee_param params = {0};
+	int ret = 0;
+
+	if (!wsm_buffer)
+		return -EINVAL;
+
+	osarg.num_params = 1;
+	memcpy(osarg.uuid, tee->uuid, sizeof(osarg.uuid));
+	osarg.clnt_login = 0;
+
+	ret = tee_client_open_session(tee->tee_context, &osarg, &params);
+	if (ret)
+		return -EFAULT;
+
+	if (!osarg.ret)
+		tee->session = osarg.session;
+
+	return 0;
+#else
+	return -EFAULT;
+#endif
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_open_session);
+
+int cmdq_sec_close_session(struct cmdq_sec_tee_context *tee)
+{
+#if IS_ENABLED(CONFIG_TEE)
+	tee_client_close_session(tee->tee_context, tee->session);
+	return 0;
+#else
+	return -EFAULT;
+#endif
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_close_session);
+
+int cmdq_sec_execute_session(struct cmdq_sec_tee_context *tee, u32 cmd, s32 timeout_ms)
+{
+#if IS_ENABLED(CONFIG_TEE)
+	struct tee_ioctl_invoke_arg invoke_arg = {0};
+	struct tee_param params = {0};
+	u64 ts = sched_clock();
+	int ret = 0;
+
+	mutex_lock(&cmdq_sec_exec_lock);
+
+	params.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
+	params.u.memref.shm = tee->shared_mem;
+	params.u.memref.shm_offs = 0;
+	params.u.memref.size = tee->shared_mem->size;
+
+	invoke_arg.num_params = 1;
+	invoke_arg.session = tee->session;
+	invoke_arg.func = cmd;
+
+	ret = tee_client_invoke_func(tee->tee_context, &invoke_arg, &params);
+	if (ret) {
+		pr_err("tee_client_invoke_func failed, ret=%d\n", ret);
+		return -EFAULT;
+	}
+
+	ret = invoke_arg.ret;
+
+	mutex_unlock(&cmdq_sec_exec_lock);
+
+	ts = div_u64(sched_clock() - ts, 1000000);
+
+	if (ret != 0)
+		pr_err("[SEC]execute: TEEC_InvokeCommand:%u ret:%d cost:%lluus", cmd, ret, ts);
+	else if (ts > timeout_ms)
+		pr_err("[SEC]execute: TEEC_InvokeCommand:%u ret:%d cost:%lluus", cmd, ret, ts);
+	else
+		pr_debug("[SEC]execute: TEEC_InvokeCommand:%u ret:%d cost:%lluus", cmd, ret, ts);
+
+	return ret;
+#else
+	return -EFAULT;
+#endif
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_execute_session);
+
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 43eae45a08c9..36101c63450f 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -84,6 +84,7 @@ struct cmdq_pkt {
 	size_t			buf_size; /* real buffer size */
 	void			*cl;
 	bool			loop;
+	void			*sec_data;
 };
 
 struct cmdq_thread {
diff --git a/include/linux/mailbox/mtk-cmdq-sec-iwc-common.h b/include/linux/mailbox/mtk-cmdq-sec-iwc-common.h
new file mode 100644
index 000000000000..39d1122edd5c
--- /dev/null
+++ b/include/linux/mailbox/mtk-cmdq-sec-iwc-common.h
@@ -0,0 +1,342 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#ifndef __CMDQ_SEC_IWC_COMMON_H__
+#define __CMDQ_SEC_IWC_COMMON_H__
+
+/**
+ * CMDQ_SEC_SHARED_THR_CNT_OFFSET - shared memory offset to store thread count.
+ */
+#define CMDQ_SEC_SHARED_THR_CNT_OFFSET		0x100
+
+/**
+ * CMDQ_TZ_CMD_BLOCK_SIZE - total command buffer size copy from normal world to secure world.
+ * Maximum 1 pages will be requested for each command buffer.
+ * This size could be adjusted when command buffer size is not enough.
+ */
+#define CMDQ_TZ_CMD_BLOCK_SIZE		(4096)
+
+/**
+ * CMDQ_IWC_MAX_CMD_LENGTH - max length of u32 array to store commanad buffer.
+ */
+#define CMDQ_IWC_MAX_CMD_LENGTH		(CMDQ_TZ_CMD_BLOCK_SIZE / sizeof(u32))
+
+/**
+ * CMDQ_IWC_MAX_ADDR_LIST_LENGTH - max length of addr metadata list.
+ */
+#define CMDQ_IWC_MAX_ADDR_LIST_LENGTH	(30)
+
+/**
+ * CMDQ_IWC_CLIENT_NAME - length for caller_name in iwc_cmdq_command_t.
+ */
+#define CMDQ_IWC_CLIENT_NAME		(16)
+
+/**
+ * CMDQ_MAX_READBACK_ENG - length for readback_engs in iwc_cmdq_command_t.
+ */
+#define CMDQ_MAX_READBACK_ENG		(8)
+
+/**
+ * CMDQ_SEC_MESSAGE_INST_LEN - length for sec_inst in iwc_cmdq_sec_status_t.
+ */
+#define CMDQ_SEC_MESSAGE_INST_LEN	(8)
+
+/**
+ * CMDQ_SEC_DISPATCH_LEN - length for dispatch in iwc_cmdq_sec_status_t.
+ */
+#define CMDQ_SEC_DISPATCH_LEN		(8)
+
+/*
+ * IWC Command IDs - ID for normal world(TLC or linux kernel) to secure world.
+ */
+#define CMD_CMDQ_IWC_SUBMIT_TASK	(1) /* submit current task */
+#define CMD_CMDQ_IWC_CANCEL_TASK	(3) /* cancel current task */
+#define CMD_CMDQ_IWC_PATH_RES_ALLOCATE	(4) /* create global resource for secure path */
+
+/**
+ * enum cmdq_iwc_addr_metadata_type - address medadata type to be converted in secure world.
+ * @CMDQ_IWC_H_2_PA: secure handle to sec PA.
+ * @CMDQ_IWC_H_2_MVA: secure handle to sec MVA.
+ * @CMDQ_IWC_NMVA_2_MVA: map normal MVA to secure world.
+ * @CMDQ_IWC_PH_2_MVA: session protected handle to sec MVA.
+ *
+ * To tell secure world waht operation to use for converting address in metadata list.
+ */
+enum cmdq_iwc_addr_metadata_type {
+	CMDQ_IWC_H_2_PA		= 0,
+	CMDQ_IWC_H_2_MVA	= 1,
+	CMDQ_IWC_NMVA_2_MVA	= 2,
+	CMDQ_IWC_PH_2_MVA	= 3,
+};
+
+/*
+ * enum cmdq_sec_engine_enum - the flag for HW engines need to be proteced in secure world.
+ * Each enum is a bit in a u64 engine flag variable.
+ */
+enum cmdq_sec_engine_enum {
+	/* MDP */
+	CMDQ_SEC_MDP_RDMA0		= 0,
+	CMDQ_SEC_MDP_RDMA1		= 1,
+	CMDQ_SEC_MDP_WDMA		= 2,
+	CMDQ_SEC_MDP_RDMA2		= 3,
+	CMDQ_SEC_MDP_RDMA3		= 4,
+	CMDQ_SEC_MDP_WROT0		= 5,
+	CMDQ_SEC_MDP_WROT1		= 6,
+	CMDQ_SEC_MDP_WROT2		= 7,
+	CMDQ_SEC_MDP_WROT3		= 8,
+	CMDQ_SEC_MDP_HDR0		= 9,
+	CMDQ_SEC_MDP_HDR1		= 10,
+	CMDQ_SEC_MDP_HDR2		= 11,
+	CMDQ_SEC_MDP_HDR3		= 12,
+	CMDQ_SEC_MDP_AAL0		= 13,
+	CMDQ_SEC_MDP_AAL1		= 14,
+	CMDQ_SEC_MDP_AAL2		= 15,
+	CMDQ_SEC_MDP_AAL3		= 16,
+
+	/* DISP (VDOSYS0) */
+	CMDQ_SEC_DISP_RDMA0		= 17,
+	CMDQ_SEC_DISP_RDMA1		= 18,
+	CMDQ_SEC_DISP_WDMA0		= 19,
+	CMDQ_SEC_DISP_WDMA1		= 20,
+	CMDQ_SEC_DISP_OVL0		= 21,
+	CMDQ_SEC_DISP_OVL1		= 22,
+	CMDQ_SEC_DISP_OVL2		= 23,
+	CMDQ_SEC_DISP_2L_OVL0		= 24,
+	CMDQ_SEC_DISP_2L_OVL1		= 25,
+	CMDQ_SEC_DISP_2L_OVL2		= 26,
+
+	/* DSIP (VDOSYS1) */
+	CMDQ_SEC_VDO1_DISP_RDMA_L0	= 27,
+	CMDQ_SEC_VDO1_DISP_RDMA_L1	= 28,
+	CMDQ_SEC_VDO1_DISP_RDMA_L2	= 29,
+	CMDQ_SEC_VDO1_DISP_RDMA_L3	= 30,
+
+	/* VENC */
+	CMDQ_SEC_VENC_BSDMA		= 31,
+	CMDQ_SEC_VENC_CUR_LUMA		= 32,
+	CMDQ_SEC_VENC_CUR_CHROMA	= 33,
+	CMDQ_SEC_VENC_REF_LUMA		= 34,
+	CMDQ_SEC_VENC_REF_CHROMA	= 35,
+	CMDQ_SEC_VENC_REC		= 36,
+	CMDQ_SEC_VENC_SUB_R_LUMA	= 37,
+	CMDQ_SEC_VENC_SUB_W_LUMA	= 38,
+	CMDQ_SEC_VENC_SV_COMV		= 39,
+	CMDQ_SEC_VENC_RD_COMV		= 40,
+	CMDQ_SEC_VENC_NBM_RDMA		= 41,
+	CMDQ_SEC_VENC_NBM_WDMA		= 42,
+	CMDQ_SEC_VENC_NBM_RDMA_LITE	= 43,
+	CMDQ_SEC_VENC_NBM_WDMA_LITE	= 44,
+	CMDQ_SEC_VENC_FCS_NBM_RDMA	= 45,
+	CMDQ_SEC_VENC_FCS_NBM_WDMA	= 46,
+
+	CMDQ_SEC_MAX_ENG_COUNT
+};
+
+/**
+ * struct iwc_cmdq_addr_metadata_t - metadata structure for converting address of secure buffer.
+ * @type: addr metadata type.
+ * @base_handle: secure address handle.
+ * @block_offset: block offset from handle(PA) to current block(plane).
+ * @offset: buffser offset to secure handle.
+ */
+struct iwc_cmdq_addr_metadata_t {
+	/**
+	 * @type: address medadata type to be converted in secure world.
+	 */
+	u32 type;
+
+	/**
+	 * @base_handle:
+	 * @block_offset:
+	 * @offset:
+	 * these members are used to store the buffer and offset relationship.
+	 *
+	 *   -------------
+	 *   |     |     |
+	 *   -------------
+	 *   ^     ^  ^  ^
+	 *   A     B  C  D
+	 *
+	 *  A: base_handle
+	 *  B: base_handle + block_offset
+	 *  C: base_handle + block_offset + offset
+	 */
+	u64 base_handle;
+	u32 block_offset;
+	u32 offset;
+};
+
+/**
+ * struct iwc_cmdq_metadata_t - metadata structure for converting a list of secure buffer address.
+ * @addr_list_length: length of metadata address list.
+ * @addr_list: array of metadata address list.
+ */
+struct iwc_cmdq_metadata_t {
+	u32 addr_list_length;
+	struct iwc_cmdq_addr_metadata_t addr_list[CMDQ_IWC_MAX_ADDR_LIST_LENGTH];
+};
+
+/**
+ * enum sec_extension_iwc - extension HW engine flag to be protcted in secure world.
+ * @IWC_MDP_AAL: for MDP AAL engine.
+ * @IWC_MDP_TDSHP: for MDP TDSHP engine.
+ */
+enum sec_extension_iwc {
+	IWC_MDP_AAL = 0,
+	IWC_MDP_TDSHP,
+};
+
+/**
+ * struct readback_engine - readback engine parameters.
+ * @engine: HW engine flag for readback.
+ * @start: start address pa of readback buffer.
+ * @count: u32 size count of readback buffer.
+ * @param: other parameters need in secure world.
+ */
+struct readback_engine {
+	u32 engine;
+	u32 start;
+	u32 count;
+	u32 param;
+};
+
+/**
+ * struct iwc_cmdq_command_t - structure for excuting cmdq task in secure world.
+ * @thread: GCE secure thread index to execute command.
+ * @scenario: scenario to execute command.
+ * @priority: priority of GCE secure thread.
+ * @cmd_size: command size used in command buffer.
+ * @va_base: command buffer
+ * @wait_cookie: index in thread's task list, it should be (nextCookie - 1).
+ * @reset_exec: reset HW thread.
+ * @metadata: metadata structure for converting a list of secure buffer address.
+ * @normal_task_handle: handle to reference task in normal world.
+ */
+struct iwc_cmdq_command_t {
+	/* basic execution data */
+	u32 thread;
+	u32 scenario;
+	u32 priority;
+	u32 cmd_size;
+	u32 va_base[CMDQ_IWC_MAX_CMD_LENGTH];
+
+	/* exec order data */
+	u32 wait_cookie;
+	bool reset_exec;
+
+	/* metadata */
+	struct iwc_cmdq_metadata_t metadata;
+
+	/* debug */
+	u64 normal_task_handle;
+};
+
+/**
+ * struct iwc_cmdq_cancel_task_t - structure for canceling cmdq task in the secure world.
+ * @thread: [IN] GCE secure thread index.
+ * @wait_cookie: [IN] execute count cookie to wait.
+ * @throw_aee: [OUT] AEE has thrown.
+ * @has_reset: [OUT] current secure thread has been reset
+ * @irq_status: [OUT] global secure IRQ flag.
+ * @irq_flag: [OUT] thread IRQ flag.
+ * @err_instr: [OUT] err_instr[0] = instruction low bits, err_instr[1] = instruction high bits.
+ * @reg_value: [OUT] value of error register.
+ * @pc: [OUT] current pc.
+ *
+ * used to allocate share memory from secure world.
+ */
+struct iwc_cmdq_cancel_task_t {
+	s32 thread;
+	u32 wait_cookie;
+	bool throw_aee;
+	bool has_reset;
+	s32 irq_status;
+	s32 irq_flag;
+	u32 err_instr[2];
+	u32 reg_value;
+	u32 pc;
+};
+
+/**
+ * struct iwc_cmdq_path_resource_t - Inter-World Communication resource allocation structure.
+ * @share_memoy_pa: use long long for 64 bit compatible support.
+ * @size: size of share memory.
+ * @use_normal_irq: use normal IRQ in secure world.
+ *
+ * used to allocate share memory from secure world.
+ */
+struct iwc_cmdq_path_resource_t {
+	long long share_memoy_pa;
+	u32 size;
+	bool use_normal_irq;
+};
+
+/**
+ * struct iwc_cmdq_debug_config_t - debug config structure for secure debug log.
+ *
+ * @log_level: log level in secure world.
+ * @enable_profile: enable profile in secure world.
+ */
+struct iwc_cmdq_debug_config_t {
+	s32 log_level;
+	s32 enable_profile;
+};
+
+/**
+ * struct iwc_cmdq_sec_status_t - secure status from secure world.
+ *
+ * @step: the step in secure cmdq TA.
+ * @status: the status in secure cmdq TA.
+ * @args: the status arguments in secure cmdq TA.
+ * @sec_inst: current instruction in secure cmdq TA.
+ * @inst_index: current instruction index in secure cmdq TA.
+ * @dispatch: current HW engine configuring in secure cmdq TA.
+ */
+struct iwc_cmdq_sec_status_t {
+	u32 step;
+	s32 status;
+	u32 args[4];
+	u32 sec_inst[CMDQ_SEC_MESSAGE_INST_LEN];
+	u32 inst_index;
+	char dispatch[CMDQ_SEC_DISPATCH_LEN];
+};
+
+/**
+ * struct iwc_cmdq_message_t - Inter-World Communication message structure.
+ * @cmd: [IN] iwc command id.
+ * @rsp: [OUT] respond from secureworld, 0 for success, < 0 for error.
+ * @command: [IN] structure for excuting cmdq task in secure world.
+ * @cancel_task: [IN] structure for canceling cmdq task in the secure world.
+ * @path_resource: [IN]
+ * @debug: [IN] debug config structure for secure debug log.
+ * @sec_status: [OUT] secure status from secure world.
+ * @cmdq_id: [IN] GCE core id.
+ *
+ * Both Linex kernel and mobicore have their own MMU tables for mapping
+ * world shared memory and physical addresses, so mobicore does not understand
+ * linux virtual address mapping.
+ * If we want to transact a large buffer in TCI/DCI, there are 2 ways (both require 1 copy):
+ * 1. Ue mc_map to map the normal world buffer to WSM and pass secure_virt_addr in TCI/DCI buffer.
+ *    Note that mc_map implies a memcopy to copy the content from normal world to WSM.
+ * 2. Declare a fixed-length array in TCI/DCI struct and its size must be < 1M.
+ */
+struct iwc_cmdq_message_t {
+	union {
+		u32 cmd;
+		s32 rsp;
+	};
+
+	union {
+		struct iwc_cmdq_command_t command;
+		struct iwc_cmdq_cancel_task_t cancel_task;
+		struct iwc_cmdq_path_resource_t path_resource;
+	};
+
+	struct iwc_cmdq_debug_config_t debug;
+	struct iwc_cmdq_sec_status_t sec_status;
+
+	u8 cmdq_id;
+};
+#endif /* __CMDQ_SEC_IWC_COMMON_H__ */
diff --git a/include/linux/mailbox/mtk-cmdq-sec-mailbox.h b/include/linux/mailbox/mtk-cmdq-sec-mailbox.h
new file mode 100644
index 000000000000..5964b235ef6c
--- /dev/null
+++ b/include/linux/mailbox/mtk-cmdq-sec-mailbox.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#ifndef __MTK_CMDQ_SEC_MAILBOX_H__
+#define __MTK_CMDQ_SEC_MAILBOX_H__
+
+#include <linux/mailbox_controller.h>
+#include <linux/types.h>
+
+#include <linux/mailbox/mtk-cmdq-sec-iwc-common.h>
+#include <linux/mailbox/mtk-cmdq-sec-tee.h>
+
+#define CMDQ_INVALID_THREAD		(-1)
+#define CMDQ_MAX_TASK_IN_SECURE_THREAD	(16)
+#define ADDR_METADATA_MAX_COUNT_ORIGIN	(8)
+
+/**
+ * CMDQ_MAX_COOKIE_VALUE - max value of CMDQ_THR_EXEC_CNT_PA (value starts from 0)
+ */
+#define CMDQ_MAX_COOKIE_VALUE           (0xffff)
+
+/**
+ * enum cmdq_sec_scenario - scenario settings for cmdq TA.
+ * @CMDQ_SEC_SCNR_PRIMARY_DISP: primary display vdo mode enable.
+ * @CMDQ_SEC_SCNR_SUB_DISP: external display vdo mode enable.
+ * @CMDQ_SEC_SCNR_PRIMARY_DISP_DISABLE: primary display vdo mode disable.
+ * @CMDQ_SEC_SCNR_SUB_DISP_DISABLE: external display vdo mode disable.
+ * @CMDQ_SEC_SCNR_MAX: the end of enum.
+ *
+ * These states are used to record the state of IWC message structure.
+ */
+enum cmdq_sec_scenario {
+	CMDQ_SEC_SCNR_PRIMARY_DISP		= 1,
+	CMDQ_SEC_SCNR_SUB_DISP			= 4,
+	CMDQ_SEC_SCNR_PRIMARY_DISP_DISABLE	= 18,
+	CMDQ_SEC_SCNR_SUB_DISP_DISABLE		= 19,
+	CMDQ_SEC_SCNR_MAX,
+};
+
+/**
+ * enum cmdq_iwc_state_enum - state of Inter-world Communication(IWC) message
+ * @IWC_INIT: state of initializing tee context, means tee context has not initialized.
+ * @IWC_CONTEXT_INITED: tee context has initialized.
+ * @IWC_WSM_ALLOCATED: world share memory has allocated.
+ * @IWC_SES_OPENED: session to the tee context has opend.
+ * @IWC_SES_ON_TRANSACTED: session to the tee context has transacted.
+ * @IWC_STATE_MAX: the end of enum.
+ *
+ * These states are used to record the state of IWC message structure.
+ */
+enum cmdq_iwc_state_enum {
+	IWC_INIT,
+	IWC_CONTEXT_INITED,
+	IWC_WSM_ALLOCATED,
+	IWC_SES_OPENED,
+	IWC_SES_ON_TRANSACTED,
+	IWC_STATE_MAX,
+};
+
+/**
+ * struct gce_sec_plat - used to pass platform data from cmdq driver.
+ * @mbox: pointer to mbox controller.
+ * @base: GCE register base va.
+ * @hwid: GCE core id.
+ * @secure_thread_nr: number of secure thread.
+ * @secure_thread_min: min index of secure thread.
+ * @cmdq_event: secure EOF event id.
+ * @shift: address shift bit for GCE
+ */
+struct gce_sec_plat {
+	struct mbox_controller *mbox;
+	void __iomem *base;
+	u32 hwid;
+	u8 secure_thread_nr;
+	u8 secure_thread_min;
+	u32 cmdq_event;
+	u8 shift;
+};
+
+struct cmdq_sec_mailbox {
+	const struct mbox_chan_ops *ops;
+};
+
+extern struct cmdq_sec_mailbox cmdq_sec_mbox;
+
+/**
+ * struct cmdq_sec_data - used to translate secure buffer PA related instruction
+ * @addr_metadata_cnt: count of element in addr_list.
+ * @addr_metadatas: array of iwc_cmdq_addr_metadata_t.
+ * @addr_metadata_max_cnt: Reserved.
+ * @scenario: scenario config for secure world.
+ */
+struct cmdq_sec_data {
+	u32 addr_metadata_cnt;
+	u64 addr_metadatas;
+	u32 addr_metadata_max_cnt;
+	enum cmdq_sec_scenario scenario;
+};
+
+u16 cmdq_sec_get_eof_event_id(struct mbox_chan *chan);
+dma_addr_t cmdq_sec_get_cookie_addr(struct mbox_chan *chan);
+dma_addr_t cmdq_sec_get_exec_cnt_addr(struct mbox_chan *chan);
+
+#endif /* __MTK_CMDQ_SEC_MAILBOX_H__ */
diff --git a/include/linux/mailbox/mtk-cmdq-sec-tee.h b/include/linux/mailbox/mtk-cmdq-sec-tee.h
new file mode 100644
index 000000000000..d2c97a137e01
--- /dev/null
+++ b/include/linux/mailbox/mtk-cmdq-sec-tee.h
@@ -0,0 +1,105 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#ifndef __MTK_CMDQ_SEC_TEE_H__
+#define __MTK_CMDQ_SEC_TEE_H__
+
+#include <linux/types.h>
+#include <linux/delay.h>
+#include <linux/tee_drv.h>
+
+/**
+ * struct cmdq_sec_tee_context - context for tee vendor
+ * @uuid: Universally Unique Identifier of secure world.
+ * @tee_context: basic tee context.
+ * @session: session handle.
+ * @shared_mem: shared memory.
+ */
+struct cmdq_sec_tee_context {
+	u8			uuid[TEE_IOCTL_UUID_LEN];
+	struct tee_context	*tee_context;
+	u32			session;
+	struct tee_shm		*shared_mem;
+};
+
+/**
+ * cmdq_sec_setup_tee_context() - setup the uuid for the tee context to communicate with
+ * @tee:	context for tee vendor
+ *
+ * Return: 0 for success; else the error code is returned
+ *
+ */
+void cmdq_sec_setup_tee_context(struct cmdq_sec_tee_context *tee);
+
+/**
+ * cmdq_sec_init_context() - initialize the tee context
+ * @tee:	context for tee vendor
+ *
+ * Return: 0 for success; else the error code is returned
+ *
+ */
+int cmdq_sec_init_context(struct cmdq_sec_tee_context *tee);
+
+/**
+ * cmdq_sec_deinit_context() - de-initialize the tee context
+ * @tee:	context for tee vendor
+ *
+ * Return: 0 for success; else the error code is returned
+ *
+ */
+int cmdq_sec_deinit_context(struct cmdq_sec_tee_context *tee);
+
+/**
+ * cmdq_sec_allocate_wsm() - allocate the world share memory to pass message to tee
+ * @tee:	context for tee vendor
+ * @wsm_buffer:	world share memory buffer with parameters pass to tee
+ * @size:	size to allocate
+ *
+ * Return: 0 for success; else the error code is returned
+ *
+ */
+int cmdq_sec_allocate_wsm(struct cmdq_sec_tee_context *tee, void **wsm_buffer, u32 size);
+
+/**
+ * cmdq_sec_free_wsm() - free the world share memory
+ * @tee:	context for tee vendor
+ * @wsm_buffer:	world share memory buffer with parameters pass to tee
+ *
+ * Return: 0 for success; else the error code is returned
+ *
+ */
+int cmdq_sec_free_wsm(struct cmdq_sec_tee_context *tee, void **wsm_buffer);
+
+/**
+ * cmdq_sec_open_session() - open session to the tee context
+ * @tee:	context for tee vendor
+ * @wsm_buffer:	world share memory buffer with parameters pass to tee
+ *
+ * Return: 0 for success; else the error code is returned
+ *
+ */
+int cmdq_sec_open_session(struct cmdq_sec_tee_context *tee, void *wsm_buffer);
+
+/**
+ * cmdq_sec_close_session() - close session to the tee context
+ * @tee:	context for tee vendor
+ *
+ * Return: 0 for success; else the error code is returned
+ *
+ */
+int cmdq_sec_close_session(struct cmdq_sec_tee_context *tee);
+
+/**
+ * cmdq_sec_execute_session() - execute session to the tee context
+ * @tee:	context for tee vendor
+ * @cmd:	tee invoke cmd id
+ * @timeout_ms:	timeout ms to current tee invoke cmd
+ *
+ * Return: 0 for success; else the error code is returned
+ *
+ */
+int cmdq_sec_execute_session(struct cmdq_sec_tee_context *tee, u32 cmd, s32 timeout_ms);
+
+#endif	/* __MTK_CMDQ_SEC_TEE_H__ */
-- 
2.18.0

