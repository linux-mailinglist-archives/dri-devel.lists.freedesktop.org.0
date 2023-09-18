Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4AD7A52F8
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 21:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0D210E2D6;
	Mon, 18 Sep 2023 19:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A5910E2C7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 19:22:15 +0000 (UTC)
X-UUID: a9172c24565811eea33bb35ae8d461a2-20230919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oiecY3aLuF2Uda/hs6ZgQF+rwnJWxeNDGSsoKotjExI=; 
 b=fma80+TT75jIr0Un02uXHtU0fNfNeX7v8C2mOEO5x0uey370wZFgkUNYLL1nEnvi9I60khOH1yy0kcPkaXdf88ko7A53vxDPtCt6V6+QHrV0OjOQtWUr57E1wzepBRwtSRaiPeaM3bsqYkxQRDlvw32IgC5Tk3Fq8NJZId2glKQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:0d9afd99-b9dc-4e71-b638-2cbd354b6000, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:d40b1514-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a9172c24565811eea33bb35ae8d461a2-20230919
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1891936702; Tue, 19 Sep 2023 03:22:08 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 03:22:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 03:22:08 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 10/15] mailbox: mediatek: Add CMDQ secure mailbox driver
Date: Tue, 19 Sep 2023 03:21:59 +0800
Message-ID: <20230918192204.32263-11-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.411700-8.000000
X-TMASE-MatchedRID: Rj0O6AIDomDJmaR8yBHGWN35+5/2RxqmmdrHMkUHHq/xSV7YBeBhS0/3
 ZkXeY1OAifPL5t/+d1VCJf+TySNSZPA5M+x5RjkcA9lly13c/gEraL2mh8ZVK5gEXULQnZA+R3R
 HPHTssNWcPcDHCp4L+uSWVqW5qzmOi9Om4SO4imT/hOhZ6EJFBVPgO2JKQydYrZxUUf33k/2eti
 5lU6HVXBQt9tGZn+icj4L7oyN1w35qcOCJ4oqGage06kQGFaIWXccelkX/ubDANHjiWWI+7V3UD
 3GDOhnW+YGsmlEGvvP5IIbHrzGppXdWNVeH9NKPvnSVh24OCE5eu73mFK6GNAqiCYa6w8tvOnIM
 ExXg3X+fc0/i85Dp4PC14zF3T3DEeu/cjehQEBMSDAzxRL+lMTAKasuXH5J18/mfuYg/okXxbK8
 1yZ48gAuxjYe89suLvESuIClZOuGXzBACGD0EVR3EEAbn+GRbzSnbR3NwN1xUjspoiX02F5Kjtg
 G1Urj8RCbzrMXBmjfSSP0IJUq/lx86MpJTSkIRYEtx50+o738WqFCTrySlp9SVUkz9BPXe4tNzM
 3EYHuKHoVMNZvrxW01W22RVmMC3GClvwc20fT5tPeYaZY+k1ypu5kfrgzqLw62uSG5kL1b6WY1k
 IqgZYUBWCF6nDJ33mVv4zOFeLFb9ZtdNDGvzhaDH6drx3JPVAG+WI8pfMRw/tlCkjnChZH3YvtP
 37IU4fYa4bdJNcqJjg454hu1exwKyMc0EqMjKogGd8wIUGIKso8njyo9aJc7DGUsCqCKQqM8PYJ
 GuHYrxOm+awezRYuEOX7rOQlHnTwz35qPn7ceeAiCmPx4NwJuJ+Pb8n/VxSnQ4MjwaO9cqtq5d3
 cxkNQP90fJP9eHt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.411700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9DBD335F92E735A8C4311A7435810AA3D4170FEE28CD96A611B7AEF6043E42342000:8
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Elvis Wang <Elvis.Wang@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To support secure video path feature, GCE have to read/write registgers
in the secure world. GCE will enable the secure access permission to the
HW who wants to access the secure content buffer.

Add CMDQ secure mailbox driver to make CMDQ client user is able to
sending their HW settings to the secure world. So that GCE can execute
all instructions to configure HW in the secure world.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/Makefile                      |    2 +-
 drivers/mailbox/mtk-cmdq-sec-mailbox.c        | 1103 +++++++++++++++++
 drivers/mailbox/mtk-cmdq-sec-tee.c            |  202 +++
 include/linux/mailbox/mtk-cmdq-mailbox.h      |    2 +
 .../linux/mailbox/mtk-cmdq-sec-iwc-common.h   |  293 +++++
 include/linux/mailbox/mtk-cmdq-sec-mailbox.h  |   83 ++
 include/linux/mailbox/mtk-cmdq-sec-tee.h      |   31 +
 7 files changed, 1715 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-mailbox.c
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-tee.c
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-iwc-common.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-mailbox.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-tee.h

diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index fc9376117111..82da2f4ee81a 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -51,7 +51,7 @@ obj-$(CONFIG_STM32_IPCC) 	+= stm32-ipcc.o
 
 obj-$(CONFIG_MTK_ADSP_MBOX)	+= mtk-adsp-mailbox.o
 
-obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o
+obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o mtk-cmdq-sec-mailbox.o mtk-cmdq-sec-tee.o
 
 obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
 
diff --git a/drivers/mailbox/mtk-cmdq-sec-mailbox.c b/drivers/mailbox/mtk-cmdq-sec-mailbox.c
new file mode 100644
index 000000000000..954dfe7a57ed
--- /dev/null
+++ b/drivers/mailbox/mtk-cmdq-sec-mailbox.c
@@ -0,0 +1,1103 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2019 MediaTek Inc.
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/io.h>
+#include <linux/mailbox_controller.h>
+#include <linux/of_platform.h>
+#include <linux/sched/clock.h>
+#include <linux/timer.h>
+
+#include <linux/mailbox/mtk-cmdq-sec-mailbox.h>
+
+#define CMDQ_THR_BASE		(0x100)
+#define CMDQ_THR_SIZE		(0x80)
+#define CMDQ_THR_EXEC_CNT_PA	(0x28)
+
+#define CMDQ_BUF_ALLOC_SIZE		(PAGE_SIZE)
+#define CMDQ_TIMEOUT_DEFAULT		(1000)
+#define CMDQ_NO_TIMEOUT			(0xffffffff)
+#define ADDR_METADATA_MAX_COUNT_ORIGIN	(8)
+
+/*
+ * CMDQ secure context struct
+ * note it is not global data, each process has its own CMDQ sec context
+ */
+struct cmdq_sec_context {
+	struct list_head		listEntry;
+
+	/* basic info */
+	u32				tgid; /* tgid of process context */
+	u32				referCount; /* reference count for open cmdq device node */
+
+	/* iwc state */
+	enum cmdq_iwc_state_enum	state;
+
+	/* iwc information */
+	void				*iwc_msg; /* message buffer */
+
+	struct cmdq_sec_tee_context	tee; /* trustzone parameters */
+};
+
+struct cmdq_sec_task {
+	struct list_head	list_entry;
+	dma_addr_t		pa_base;
+	struct cmdq_sec_thread	*thread;
+	struct cmdq_pkt		*pkt;
+	u64			exec_time;
+	struct work_struct	exec_work;
+
+	bool			resetExecCnt;
+	u32			waitCookie;
+
+	u64			engineFlag;
+	s32			scenario;
+	u64			trigger;
+};
+
+struct cmdq_sec_thread {
+	struct mbox_chan	*chan;
+	void __iomem		*base;
+	struct list_head	task_list;
+	struct timer_list	timeout;
+	u32			timeout_ms;
+	struct work_struct	timeout_work;
+	u32			priority;
+	u32			idx;
+	bool			occupied;
+
+	/* following part only secure ctrl */
+	u32			wait_cookie;
+	u32			next_cookie;
+	u32			task_cnt;
+	struct workqueue_struct	*task_exec_wq;
+};
+
+/**
+ * shared memory between normal and secure world
+ */
+struct cmdq_sec_shared_mem {
+	void		*va;
+	dma_addr_t	pa;
+	u32		size;
+};
+
+struct cmdq_sec {
+	struct mbox_controller		mbox;
+	void __iomem			*base;
+	phys_addr_t			base_pa;
+	u32				hwid;
+	u32				gce_num;
+	struct clk_bulk_data		*clocks;
+	u32				thread_nr;
+	struct cmdq_sec_thread		*thread;
+	struct cmdq_client		*clt;
+	struct cmdq_pkt			*clt_pkt;
+
+	atomic_t			path_res;
+	struct cmdq_sec_shared_mem	*shared_mem;
+	struct cmdq_sec_context		*context;
+	struct iwcCmdqCancelTask_t	cancel;
+
+	struct workqueue_struct		*timeout_wq;
+	u64				sec_invoke;
+	u64				sec_done;
+
+	bool				notify_run;
+	struct work_struct		irq_notify_work;
+	struct workqueue_struct		*notify_wq;
+	u32				cmdq_event;
+	/* mutex for cmdq_sec_thread excuting cmdq_sec_task */
+	struct mutex			exec_lock;
+};
+
+static atomic_t cmdq_path_res = ATOMIC_INIT(0);
+
+static s32 cmdq_sec_task_submit(struct cmdq_sec *cmdq, struct cmdq_sec_task *task,
+				const u32 iwc_cmd, const u32 thrd_idx, void *data);
+
+static inline void cmdq_sec_setup_tee_context_base(struct cmdq_sec_context *context)
+{
+	cmdq_sec_setup_tee_context(&context->tee);
+}
+
+static inline s32 cmdq_sec_init_context_base(struct cmdq_sec_context *context)
+{
+	s32 status;
+
+	status = cmdq_sec_init_context(&context->tee);
+	if (status < 0)
+		return status;
+
+	return status;
+}
+
+s32 cmdq_sec_insert_backup_cookie(struct cmdq_pkt *pkt)
+{
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
+	struct cmdq_sec_thread *thread = ((struct mbox_chan *)(cl->chan))->con_priv;
+	struct cmdq_sec *cmdq = container_of(thread->chan->mbox, struct cmdq_sec, mbox);
+	struct cmdq_operand left, right;
+	dma_addr_t addr;
+
+	if (!thread->occupied || !cmdq->shared_mem)
+		return -EFAULT;
+
+	pr_debug("%s %d: pkt:%p thread:%u gce:%#lx",
+		 __func__, __LINE__, pkt, thread->idx, (unsigned long)cmdq->base_pa);
+
+	addr = (u32)(cmdq->base_pa + CMDQ_THR_BASE +
+		CMDQ_THR_SIZE * thread->idx + CMDQ_THR_EXEC_CNT_PA);
+
+	cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX1, CMDQ_ADDR_HIGH(addr));
+	cmdq_pkt_read_s(pkt, CMDQ_THR_SPR_IDX1, CMDQ_ADDR_LOW(addr), CMDQ_THR_SPR_IDX1);
+
+	left.reg = true;
+	left.idx = CMDQ_THR_SPR_IDX1;
+	right.reg = false;
+	right.value = 1;
+	cmdq_pkt_logic_command(pkt, CMDQ_LOGIC_ADD, CMDQ_THR_SPR_IDX1, &left, &right);
+
+	addr = cmdq->shared_mem->pa + CMDQ_SEC_SHARED_THR_CNT_OFFSET +
+		thread->idx * sizeof(u32);
+
+	cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX2, CMDQ_ADDR_HIGH(addr));
+	cmdq_pkt_write_s(pkt, CMDQ_THR_SPR_IDX2, CMDQ_ADDR_LOW(addr), CMDQ_THR_SPR_IDX1);
+	cmdq_pkt_set_event(pkt, cmdq->cmdq_event);
+
+	return 0;
+}
+EXPORT_SYMBOL(cmdq_sec_insert_backup_cookie);
+
+static s32 cmdq_sec_realloc_addr_list(struct cmdq_pkt *pkt, const u32 count)
+{
+	struct cmdq_sec_data *sec_data = (struct cmdq_sec_data *)pkt->sec_data;
+	void *prev = (void *)(unsigned long)sec_data->addrMetadatas, *curr;
+
+	if (count <= sec_data->addrMetadataMaxCount)
+		return 0;
+
+	curr = kcalloc(count, sizeof(*sec_data), GFP_KERNEL);
+	if (!curr)
+		return -ENOMEM;
+
+	if (count && sec_data->addrMetadatas)
+		memcpy(curr, prev, sizeof(*sec_data) * sec_data->addrMetadataMaxCount);
+
+	kfree(prev);
+
+	sec_data->addrMetadatas = (uintptr_t)curr;
+	sec_data->addrMetadataMaxCount = count;
+	return 0;
+}
+
+static s32 cmdq_sec_check_sec(struct cmdq_pkt *pkt)
+{
+	struct cmdq_sec_data *sec_data;
+
+	if (pkt->sec_data)
+		return 0;
+
+	sec_data = kzalloc(sizeof(*sec_data), GFP_KERNEL);
+	if (!sec_data)
+		return -ENOMEM;
+
+	pkt->sec_data = (void *)sec_data;
+
+	return 0;
+}
+
+static s32 cmdq_sec_append_metadata(struct cmdq_pkt *pkt,
+				    const enum cmdq_iwc_addr_metadata_type type,
+				    const u64 base, const u32 offset, const u32 size,
+				    const u32 port)
+{
+	struct cmdq_sec_data *sec_data;
+	struct iwcCmdqAddrMetadata_t *meta;
+	s32 idx, max, ret;
+
+	pr_debug("[%s %d] pkt:%p type:%u base:%#llx offset:%#x size:%#x port:%#x",
+		 __func__, __LINE__, pkt, type, base, offset, size, port);
+
+	ret = cmdq_sec_check_sec(pkt);
+	if (ret < 0)
+		return ret;
+
+	sec_data = (struct cmdq_sec_data *)pkt->sec_data;
+	idx = sec_data->addrMetadataCount;
+	if (idx >= CMDQ_IWC_MAX_ADDR_LIST_LENGTH) {
+		pr_err("idx:%u reach over:%u", idx, CMDQ_IWC_MAX_ADDR_LIST_LENGTH);
+		return -EFAULT;
+	}
+
+	if (!sec_data->addrMetadataMaxCount)
+		max = ADDR_METADATA_MAX_COUNT_ORIGIN;
+	else if (idx >= sec_data->addrMetadataMaxCount)
+		max = sec_data->addrMetadataMaxCount * 2;
+	else
+		max = sec_data->addrMetadataMaxCount;
+
+	ret = cmdq_sec_realloc_addr_list(pkt, max);
+	if (ret)
+		return ret;
+
+	if (!sec_data->addrMetadatas) {
+		pr_info("addrMetadatas is missing");
+
+		meta = kzalloc(sizeof(*meta), GFP_KERNEL);
+		if (!meta)
+			return -ENOMEM;
+
+		sec_data->addrMetadatas = (uintptr_t)(void *)meta;
+	}
+	meta = (struct iwcCmdqAddrMetadata_t *)(uintptr_t)sec_data->addrMetadatas;
+
+	meta[idx].instrIndex = pkt->cmd_buf_size / CMDQ_INST_SIZE - 1;
+	meta[idx].type = type;
+	meta[idx].baseHandle = base;
+	meta[idx].offset = offset;
+	meta[idx].size = size;
+	meta[idx].port = port;
+	sec_data->addrMetadataCount += 1;
+	return 0;
+}
+
+s32 cmdq_sec_pkt_set_data(struct cmdq_pkt *pkt, const u64 dapc_engine,
+			  const u64 port_sec_engine, const enum cmdq_sec_scenario scenario)
+{
+	struct cmdq_sec_data *sec_data;
+	s32 ret;
+
+	if (!pkt) {
+		pr_err("invalid pkt:%p", pkt);
+		return -EINVAL;
+	}
+
+	ret = cmdq_sec_check_sec(pkt);
+	if (ret < 0)
+		return ret;
+
+	pr_debug("[%s %d] pkt:%p sec_data:%p dapc:%llu port_sec:%llu scen:%u",
+		 __func__, __LINE__, pkt, pkt->sec_data, dapc_engine, port_sec_engine, scenario);
+
+	sec_data = (struct cmdq_sec_data *)pkt->sec_data;
+	sec_data->enginesNeedDAPC |= dapc_engine;
+	sec_data->enginesNeedPortSecurity |= port_sec_engine;
+	sec_data->scenario = scenario;
+
+	return 0;
+}
+EXPORT_SYMBOL(cmdq_sec_pkt_set_data);
+
+s32 cmdq_sec_pkt_write(struct cmdq_pkt *pkt, u32 addr, u64 base,
+		       const enum cmdq_iwc_addr_metadata_type type,
+		       const u32 offset, const u32 size, const u32 port)
+{
+	s32 ret;
+
+	ret = cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX0, addr);
+	if (ret)
+		return ret;
+
+	ret = cmdq_pkt_write_s_reg_value(pkt, CMDQ_THR_SPR_IDX0, (u32)base);
+	if (ret)
+		return ret;
+
+	return cmdq_sec_append_metadata(pkt, type, base, offset, size, port);
+}
+EXPORT_SYMBOL(cmdq_sec_pkt_write);
+
+static u32 cmdq_sec_get_cookie(struct cmdq_sec *cmdq, u32 idx)
+{
+	return *(u32 *)(cmdq->shared_mem->va +
+		CMDQ_SEC_SHARED_THR_CNT_OFFSET + idx * sizeof(u32));
+}
+
+static void cmdq_sec_task_done(struct cmdq_sec_task *task, int sta)
+{
+	struct cmdq_cb_data data;
+
+	data.sta = sta;
+	data.pkt = task->pkt;
+
+	pr_debug("%s task:%p pkt:%p err:%d",
+		 __func__, task, task->pkt, sta);
+
+	mbox_chan_received_data(task->thread->chan, &data);
+
+	list_del_init(&task->list_entry);
+	kfree(task);
+}
+
+static bool cmdq_sec_irq_handler(struct cmdq_sec_thread *thread, const u32 cookie, const s32 err)
+{
+	struct cmdq_sec_task *task, *temp, *cur_task = NULL;
+	struct cmdq_sec *cmdq = container_of(thread->chan->mbox, struct cmdq_sec, mbox);
+	unsigned long flags;
+	s32 done;
+
+	spin_lock_irqsave(&thread->chan->lock, flags);
+	if (thread->wait_cookie <= cookie)
+		done = cookie - thread->wait_cookie + 1;
+	else if (thread->wait_cookie == (cookie + 1) % CMDQ_MAX_COOKIE_VALUE)
+		done = 0;
+	else
+		done = CMDQ_MAX_COOKIE_VALUE - thread->wait_cookie + 1 +
+			cookie + 1;
+
+	list_for_each_entry_safe(task, temp, &thread->task_list, list_entry) {
+		if (!done)
+			break;
+
+		cmdq_sec_task_done(task, err);
+
+		if (thread->task_cnt)
+			thread->task_cnt -= 1;
+
+		done--;
+	}
+
+	cur_task = list_first_entry_or_null(&thread->task_list,
+					    struct cmdq_sec_task, list_entry);
+
+	if (err && cur_task) {
+		spin_unlock_irqrestore(&thread->chan->lock, flags);
+
+		/* for error task, cancel, callback and done */
+		memset(&cmdq->cancel, 0, sizeof(cmdq->cancel));
+		cmdq_sec_task_submit(cmdq, cur_task, CMD_CMDQ_IWC_CANCEL_TASK,
+				     thread->idx, &cmdq->cancel);
+
+		cmdq_sec_task_done(task, err);
+
+		spin_lock_irqsave(&thread->chan->lock, flags);
+
+		task = list_first_entry_or_null(&thread->task_list,
+						struct cmdq_sec_task, list_entry);
+		if (cur_task == task)
+			cmdq_sec_task_done(cur_task, err);
+		else
+			pr_err("task list changed");
+
+		/*
+		 * error case stop all task for secure,
+		 * since secure tdrv always remove all when cancel
+		 */
+		while (!list_empty(&thread->task_list)) {
+			cur_task = list_first_entry(&thread->task_list,
+						    struct cmdq_sec_task, list_entry);
+
+			cmdq_sec_task_done(cur_task, -ECONNABORTED);
+		}
+	} else if (err) {
+		pr_debug("error but all task done, check notify callback");
+	}
+
+	if (list_empty(&thread->task_list)) {
+		thread->wait_cookie = 0;
+		thread->next_cookie = 0;
+		thread->task_cnt = 0;
+		__raw_writel(0, (void __iomem *)cmdq->shared_mem->va +
+			     CMDQ_SEC_SHARED_THR_CNT_OFFSET +
+			     thread->idx * sizeof(s32));
+		spin_unlock_irqrestore(&thread->chan->lock, flags);
+		del_timer(&thread->timeout);
+		return true;
+	}
+
+	thread->wait_cookie = cookie % CMDQ_MAX_COOKIE_VALUE + 1;
+
+	mod_timer(&thread->timeout, jiffies + msecs_to_jiffies(thread->timeout_ms));
+	spin_unlock_irqrestore(&thread->chan->lock, flags);
+
+	return false;
+}
+
+static void cmdq_sec_irq_notify_work(struct work_struct *work_item)
+{
+	struct cmdq_sec *cmdq = container_of(work_item, struct cmdq_sec, irq_notify_work);
+	s32 i;
+
+	mutex_lock(&cmdq->exec_lock);
+
+	for (i = 0; i < CMDQ_MAX_SECURE_THREAD_COUNT; i++) {
+		struct cmdq_sec_thread *thread = &cmdq->thread[CMDQ_MIN_SECURE_THREAD_ID + i];
+		u32 cookie = cmdq_sec_get_cookie(cmdq, thread->idx);
+
+		if (cookie < thread->wait_cookie || !thread->task_cnt)
+			continue;
+
+		cmdq_sec_irq_handler(thread, cookie, 0);
+	}
+
+	mutex_unlock(&cmdq->exec_lock);
+}
+
+static void cmdq_sec_irq_notify_callback(struct mbox_client *cl, void *mssg)
+{
+	struct cmdq_cb_data *data = (struct cmdq_cb_data *)mssg;
+	struct cmdq_sec *cmdq = container_of(((struct cmdq_client *)data->pkt->cl)->chan->mbox,
+					     struct cmdq_sec, mbox);
+
+	if (!work_pending(&cmdq->irq_notify_work))
+		queue_work(cmdq->notify_wq, &cmdq->irq_notify_work);
+	else
+		pr_debug("%s last notify callback working", __func__);
+}
+
+static s32 cmdq_sec_irq_notify_start(struct cmdq_sec *cmdq)
+{
+	s32 err;
+
+	if (cmdq->notify_run)
+		return 0;
+
+	if (!cmdq->clt_pkt) {
+		cmdq->clt = cmdq_mbox_create(cmdq->mbox.dev, 0);
+		if (!cmdq->clt || IS_ERR(cmdq->clt)) {
+			pr_err("clt mbox_create failed clt:%p index:%d",
+			       cmdq->clt, CMDQ_SEC_IRQ_THREAD);
+			return -EINVAL;
+		}
+		cmdq->clt->client.rx_callback = cmdq_sec_irq_notify_callback;
+
+		cmdq->clt_pkt = cmdq_pkt_create(cmdq->clt, CMDQ_BUF_ALLOC_SIZE);
+		if (!cmdq->clt_pkt || IS_ERR(cmdq->clt_pkt)) {
+			pr_err("clt_pkt cmdq_pkt_create failed pkt:%p index:%d",
+			       cmdq->clt_pkt, CMDQ_SEC_IRQ_THREAD);
+			return -EINVAL;
+		}
+
+		INIT_WORK(&cmdq->irq_notify_work, cmdq_sec_irq_notify_work);
+	}
+
+	cmdq_pkt_wfe(cmdq->clt_pkt, cmdq->cmdq_event, true);
+	cmdq_pkt_finalize_loop(cmdq->clt_pkt);
+	dma_sync_single_for_device(cmdq->mbox.dev,
+				   cmdq->clt_pkt->pa_base,
+				   cmdq->clt_pkt->cmd_buf_size,
+				   DMA_TO_DEVICE);
+	err = mbox_send_message(cmdq->clt->chan, cmdq->clt_pkt);
+	mbox_client_txdone(cmdq->clt->chan, 0);
+	if (err < 0) {
+		pr_err("%s failed:%d", __func__, err);
+		cmdq_pkt_destroy(cmdq->clt_pkt);
+		cmdq_mbox_stop(cmdq->clt->chan);
+		cmdq_mbox_destroy(cmdq->clt);
+	} else {
+		cmdq->notify_run = true;
+		pr_debug("%s success!", __func__);
+	}
+
+	return err;
+}
+
+static s32 cmdq_sec_session_init(struct cmdq_sec_context *context)
+{
+	s32 err = 0;
+
+	if (context->state >= IWC_SES_OPENED) {
+		pr_debug("session opened:%u", context->state);
+		return err;
+	}
+
+	switch (context->state) {
+	case IWC_INIT:
+		err = cmdq_sec_init_context_base(context);
+		if (err)
+			break;
+		context->state = IWC_CONTEXT_INITED;
+	fallthrough;
+	case IWC_CONTEXT_INITED:
+		if (context->iwc_msg) {
+			pr_err("iwcMessage not NULL:%p", context->iwc_msg);
+			err = -EINVAL;
+			break;
+		}
+
+		err = cmdq_sec_allocate_wsm(&context->tee, &context->iwc_msg,
+					    sizeof(struct iwcCmdqMessage_t));
+		if (err)
+			break;
+
+		context->state = IWC_WSM_ALLOCATED;
+	fallthrough;
+	case IWC_WSM_ALLOCATED:
+		err = cmdq_sec_open_session(&context->tee, context->iwc_msg);
+		if (err)
+			break;
+
+		context->state = IWC_SES_OPENED;
+	fallthrough;
+	default:
+		break;
+	}
+	return err;
+}
+
+static s32 cmdq_sec_fill_iwc_msg(struct cmdq_sec_context *context,
+				 struct cmdq_sec_task *task, u32 thrd_idx)
+{
+	struct iwcCmdqMessage_t *iwc_msg = NULL;
+	struct cmdq_sec_data *data = (struct cmdq_sec_data *)task->pkt->sec_data;
+	u32 size = 0, offset = 0, *instr;
+
+	iwc_msg = (struct iwcCmdqMessage_t *)context->iwc_msg;
+
+	if (task->pkt->cmd_buf_size + 4 * CMDQ_INST_SIZE > CMDQ_TZ_CMD_BLOCK_SIZE) {
+		pr_err("task:%p size:%zu > %u",
+		       task, task->pkt->cmd_buf_size, CMDQ_TZ_CMD_BLOCK_SIZE);
+		return -EFAULT;
+	}
+
+	if (thrd_idx == CMDQ_INVALID_THREAD) {
+		iwc_msg->command.commandSize = 0;
+		iwc_msg->command.metadata.addrListLength = 0;
+		return 0;
+	}
+
+	iwc_msg->command.thread = thrd_idx;
+	iwc_msg->command.scenario = task->scenario;
+	iwc_msg->command.engineFlag = task->engineFlag;
+	size = task->pkt->cmd_buf_size;
+	memcpy(iwc_msg->command.pVABase + offset, task->pkt->va_base, size);
+	iwc_msg->command.commandSize += size;
+	offset += size / 4;
+
+	if (iwc_msg->command.commandSize == 0) {
+		pr_err("%s %d: commandSize is 0\n", __func__, __LINE__);
+		return 0;
+	}
+
+	instr = &iwc_msg->command.pVABase[iwc_msg->command.commandSize / 4 - 4];
+	if (instr[0] == 0x1 && instr[1] == 0x40000000)
+		instr[0] = 0;
+	else
+		pr_err("%s %d: find EOC failed: %#x %#x",
+		       __func__, __LINE__, instr[1], instr[0]);
+
+	iwc_msg->command.waitCookie = task->waitCookie;
+	iwc_msg->command.resetExecCnt = task->resetExecCnt;
+
+	if (data->addrMetadataCount) {
+		iwc_msg->command.metadata.addrListLength = data->addrMetadataCount;
+		memcpy(iwc_msg->command.metadata.addrList,
+		       (u32 *)(unsigned long)data->addrMetadatas,
+		       data->addrMetadataCount * sizeof(struct iwcCmdqAddrMetadata_t));
+	}
+
+	iwc_msg->command.metadata.enginesNeedDAPC = data->enginesNeedDAPC;
+	iwc_msg->command.metadata.enginesNeedPortSecurity =
+		data->enginesNeedPortSecurity;
+	iwc_msg->command.hNormalTask = (unsigned long)task->pkt;
+
+	return 0;
+}
+
+static s32 cmdq_sec_session_send(struct cmdq_sec_context *context,
+				 struct cmdq_sec_task *task, const u32 iwc_cmd,
+				 const u32 thrd_idx, struct cmdq_sec *cmdq)
+{
+	s32 err = 0;
+	u64 cost;
+	struct iwcCmdqMessage_t *iwc_msg = NULL;
+
+	iwc_msg = (struct iwcCmdqMessage_t *)context->iwc_msg;
+
+	memset(iwc_msg, 0, sizeof(*iwc_msg));
+	iwc_msg->cmd = iwc_cmd;
+	iwc_msg->cmdq_id = cmdq->hwid;
+	iwc_msg->command.thread = thrd_idx;
+
+	switch (iwc_cmd) {
+	case CMD_CMDQ_IWC_SUBMIT_TASK:
+		err = cmdq_sec_fill_iwc_msg(context, task, thrd_idx);
+		if (err)
+			return err;
+		break;
+	case CMD_CMDQ_IWC_CANCEL_TASK:
+		iwc_msg->cancelTask.waitCookie = task->waitCookie;
+		iwc_msg->cancelTask.thread = thrd_idx;
+		break;
+	case CMD_CMDQ_IWC_PATH_RES_ALLOCATE:
+		if (!cmdq->shared_mem || !cmdq->shared_mem->va) {
+			pr_err("%s %d: shared_mem is NULL", __func__, __LINE__);
+			return -EFAULT;
+		}
+		iwc_msg->pathResource.size = cmdq->shared_mem->size;
+		iwc_msg->pathResource.shareMemoyPA = cmdq->shared_mem->pa;
+		iwc_msg->pathResource.useNormalIRQ = 1;
+		break;
+	default:
+		break;
+	}
+
+	cmdq->sec_invoke = sched_clock();
+	pr_debug("%s execute cmdq:%p task:%lx command:%u thread:%u cookie:%d",
+		 __func__, cmdq, (unsigned long)task, iwc_cmd, thrd_idx,
+		 task ? task->waitCookie : -1);
+
+	/* send message */
+	err = cmdq_sec_execute_session(&context->tee, iwc_cmd, CMDQ_TIMEOUT_DEFAULT);
+
+	cmdq->sec_done = sched_clock();
+	cost = div_u64(cmdq->sec_done - cmdq->sec_invoke, 1000000);
+	if (cost >= CMDQ_TIMEOUT_DEFAULT)
+		pr_err("%s execute timeout cmdq:%p task:%lx cost:%lluus",
+		       __func__, cmdq, (unsigned long)task, cost);
+	else
+		pr_debug("%s execute done cmdq:%p task:%lx cost:%lluus",
+			 __func__, cmdq, (unsigned long)task, cost);
+
+	if (err == 0)
+		context->state = IWC_SES_ON_TRANSACTED;
+
+	return err;
+}
+
+static s32 cmdq_sec_session_reply(const u32 iwc_cmd, struct iwcCmdqMessage_t *iwc_msg,
+				  void *data, struct cmdq_sec_task *task)
+{
+	struct iwcCmdqCancelTask_t *cancel = data;
+	struct cmdq_sec_data *sec_data = task->pkt->sec_data;
+
+	if (iwc_cmd == CMD_CMDQ_IWC_SUBMIT_TASK) {
+		if (iwc_msg->rsp < 0) {
+			/* submit fail case copy status */
+			memcpy(&sec_data->sec_status, &iwc_msg->secStatus,
+			       sizeof(sec_data->sec_status));
+			sec_data->response = iwc_msg->rsp;
+		}
+	} else if (iwc_cmd == CMD_CMDQ_IWC_CANCEL_TASK && cancel) {
+		/* cancel case only copy cancel result */
+		memcpy(cancel, &iwc_msg->cancelTask, sizeof(*cancel));
+	}
+
+	return iwc_msg->rsp;
+}
+
+static s32 cmdq_sec_task_submit(struct cmdq_sec *cmdq, struct cmdq_sec_task *task,
+				const u32 iwc_cmd, const u32 thrd_idx, void *data)
+{
+	struct cmdq_sec_context *context;
+	s32 err;
+
+	do {
+		if (!cmdq->context) {
+			context = kzalloc(sizeof(*cmdq->context), GFP_ATOMIC);
+			if (!context) {
+				err = -ENOMEM;
+				break;
+			}
+			cmdq->context = context;
+			cmdq->context->state = IWC_INIT;
+			cmdq->context->tgid = current->tgid;
+		}
+
+		if (cmdq->context->state == IWC_INIT)
+			cmdq_sec_setup_tee_context_base(cmdq->context);
+
+		err = cmdq_sec_session_init(cmdq->context);
+		if (err) {
+			pr_err("%s %d: cmdq_sec_session_init fail", __func__, __LINE__);
+			break;
+		}
+
+		err = cmdq_sec_irq_notify_start(cmdq);
+		if (err < 0) {
+			pr_err("%s %d: cmdq_sec_irq_notify_start fail", __func__, __LINE__);
+			break;
+		}
+
+		err = cmdq_sec_session_send(cmdq->context, task, iwc_cmd, thrd_idx, cmdq);
+		if (err)
+			pr_err("%s %d: cmdq_sec_session_send fail: %d\n", __func__, __LINE__, err);
+		else
+			err = cmdq_sec_session_reply(iwc_cmd, cmdq->context->iwc_msg, data, task);
+	} while (0);
+
+	if (err)
+		pr_err("%s %d: sec invoke err:%d task:%p thread:%u gce:%#lx",
+		       __func__, __LINE__, err, task, thrd_idx, (unsigned long)cmdq->base_pa);
+
+	return err;
+}
+
+static int cmdq_sec_suspend(struct device *dev)
+{
+	struct cmdq_sec *cmdq = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(cmdq->gce_num, cmdq->clocks);
+	return 0;
+}
+
+static int cmdq_sec_resume(struct device *dev)
+{
+	struct cmdq_sec *cmdq = dev_get_drvdata(dev);
+
+	WARN_ON(clk_bulk_prepare_enable(cmdq->gce_num, cmdq->clocks));
+	return 0;
+}
+
+static const struct dev_pm_ops cmdq_sec_pm_ops = {
+	.suspend = cmdq_sec_suspend,
+	.resume = cmdq_sec_resume,
+};
+
+static void cmdq_sec_task_exec_work(struct work_struct *work_item)
+{
+	struct cmdq_sec_task *task = container_of(work_item, struct cmdq_sec_task, exec_work);
+	struct cmdq_sec *cmdq = container_of(task->thread->chan->mbox, struct cmdq_sec, mbox);
+	struct cmdq_sec_data *data;
+	unsigned long flags;
+	s32 err;
+
+	pr_debug("%s gce:%#lx task:%p pkt:%p thread:%u",
+		 __func__, (unsigned long)cmdq->base_pa, task, task->pkt, task->thread->idx);
+
+	if (!task->pkt->sec_data) {
+		pr_err("pkt:%p without sec_data", task->pkt);
+		return;
+	}
+	data = (struct cmdq_sec_data *)task->pkt->sec_data;
+
+	mutex_lock(&cmdq->exec_lock);
+
+	spin_lock_irqsave(&task->thread->chan->lock, flags);
+	if (!task->thread->task_cnt) {
+		mod_timer(&task->thread->timeout, jiffies +
+			msecs_to_jiffies(task->thread->timeout_ms));
+		task->thread->wait_cookie = 1;
+		task->thread->next_cookie = 1;
+		task->thread->task_cnt = 0;
+		__raw_writel(0, (void __iomem *)cmdq->shared_mem->va +
+			     CMDQ_SEC_SHARED_THR_CNT_OFFSET +
+			     task->thread->idx * sizeof(s32));
+	}
+
+	task->resetExecCnt = task->thread->task_cnt ? false : true;
+	task->waitCookie = task->thread->next_cookie;
+	task->thread->next_cookie = (task->thread->next_cookie + 1) % CMDQ_MAX_COOKIE_VALUE;
+	list_add_tail(&task->list_entry, &task->thread->task_list);
+	task->thread->task_cnt += 1;
+	spin_unlock_irqrestore(&task->thread->chan->lock, flags);
+	task->trigger = sched_clock();
+
+	if (!atomic_cmpxchg(&cmdq_path_res, 0, 1)) {
+		err = cmdq_sec_task_submit(cmdq, NULL, CMD_CMDQ_IWC_PATH_RES_ALLOCATE,
+					   CMDQ_INVALID_THREAD, NULL);
+		if (err) {
+			atomic_set(&cmdq_path_res, 0);
+			goto task_err_callback;
+		}
+	}
+
+	if (task->thread->task_cnt > CMDQ_MAX_TASK_IN_SECURE_THREAD) {
+		pr_err("task_cnt:%u cannot more than %u task:%p thrd-idx:%u",
+		       task->thread->task_cnt, CMDQ_MAX_TASK_IN_SECURE_THREAD,
+		       task, task->thread->idx);
+		err = -EMSGSIZE;
+		goto task_err_callback;
+	}
+
+	err = cmdq_sec_task_submit(cmdq, task, CMD_CMDQ_IWC_SUBMIT_TASK, task->thread->idx, NULL);
+	if (err)
+		pr_err("task submit CMD_CMDQ_IWC_SUBMIT_TASK failed:%d gce:%#lx task:%p thread:%u",
+		       err, (unsigned long)cmdq->base_pa, task, task->thread->idx);
+
+task_err_callback:
+	if (err) {
+		struct cmdq_cb_data cb_data;
+
+		cb_data.sta = err;
+		cb_data.pkt = task->pkt;
+		mbox_chan_received_data(task->thread->chan, &cb_data);
+
+		spin_lock_irqsave(&task->thread->chan->lock, flags);
+		if (!task->thread->task_cnt)
+			pr_err("thread:%u task_cnt:%u cannot below zero",
+			       task->thread->idx, task->thread->task_cnt);
+		else
+			task->thread->task_cnt -= 1;
+
+		task->thread->next_cookie = (task->thread->next_cookie - 1 +
+			CMDQ_MAX_COOKIE_VALUE) % CMDQ_MAX_COOKIE_VALUE;
+		list_del(&task->list_entry);
+		pr_debug("gce:%#lx err:%d task:%p pkt:%p thread:%u task_cnt:%u wait_cookie:%u next_cookie:%u",
+			 (unsigned long)cmdq->base_pa, err, task, task->pkt,
+			 task->thread->idx, task->thread->task_cnt,
+			 task->thread->wait_cookie, task->thread->next_cookie);
+		spin_unlock_irqrestore(&task->thread->chan->lock, flags);
+		kfree(task);
+	}
+	mutex_unlock(&cmdq->exec_lock);
+}
+
+static int cmdq_sec_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct cmdq_pkt *pkt = (struct cmdq_pkt *)data;
+	struct cmdq_sec_data *sec_data = (struct cmdq_sec_data *)pkt->sec_data;
+	struct cmdq_sec_thread *thread = (struct cmdq_sec_thread *)chan->con_priv;
+	struct cmdq_sec_task *task;
+
+	if (!sec_data)
+		return -EINVAL;
+
+	task = kzalloc(sizeof(*task), GFP_ATOMIC);
+	if (!task)
+		return -ENOMEM;
+
+	task->pkt = pkt;
+	task->thread = thread;
+	task->scenario = sec_data->scenario;
+	task->engineFlag = sec_data->enginesNeedDAPC | sec_data->enginesNeedPortSecurity;
+
+	INIT_WORK(&task->exec_work, cmdq_sec_task_exec_work);
+	queue_work(thread->task_exec_wq, &task->exec_work);
+	return 0;
+}
+
+static void cmdq_sec_thread_timeout(struct timer_list *t)
+{
+	struct cmdq_sec_thread *thread = from_timer(thread, t, timeout);
+	struct cmdq_sec *cmdq = container_of(thread->chan->mbox, struct cmdq_sec, mbox);
+
+	if (!work_pending(&thread->timeout_work))
+		queue_work(cmdq->timeout_wq, &thread->timeout_work);
+}
+
+static void cmdq_sec_task_timeout_work(struct work_struct *work_item)
+{
+	struct cmdq_sec_thread *thread = container_of(work_item, struct cmdq_sec_thread,
+						      timeout_work);
+	struct cmdq_sec *cmdq = container_of(thread->chan->mbox, struct cmdq_sec, mbox);
+	struct cmdq_sec_task *task;
+	unsigned long flags;
+	u64 duration;
+	u32 cookie;
+
+	mutex_lock(&cmdq->exec_lock);
+
+	spin_lock_irqsave(&thread->chan->lock, flags);
+	if (list_empty(&thread->task_list)) {
+		pr_err("thread:%u task_list is empty", thread->idx);
+		spin_unlock_irqrestore(&thread->chan->lock, flags);
+		goto done;
+	}
+
+	task = list_first_entry(&thread->task_list, struct cmdq_sec_task, list_entry);
+	duration = div_u64(sched_clock() - task->trigger, 1000000);
+	if (duration < thread->timeout_ms) {
+		mod_timer(&thread->timeout, jiffies +
+			  msecs_to_jiffies(thread->timeout_ms - duration));
+		spin_unlock_irqrestore(&thread->chan->lock, flags);
+		goto done;
+	}
+
+	cookie = cmdq_sec_get_cookie(cmdq, thread->idx);
+	spin_unlock_irqrestore(&thread->chan->lock, flags);
+
+	pr_err("%s duration:%llu cookie:%u thread:%u",
+	       __func__, duration, cookie, thread->idx);
+	cmdq_sec_irq_handler(thread, cookie, -ETIMEDOUT);
+
+done:
+	mutex_unlock(&cmdq->exec_lock);
+}
+
+static int cmdq_sec_mbox_startup(struct mbox_chan *chan)
+{
+	struct cmdq_sec_thread *thread = (struct cmdq_sec_thread *)chan->con_priv;
+	char name[20];
+
+	timer_setup(&thread->timeout, cmdq_sec_thread_timeout, 0);
+
+	INIT_WORK(&thread->timeout_work, cmdq_sec_task_timeout_work);
+	snprintf(name, sizeof(name), "task_exec_wq_%u", thread->idx);
+	thread->task_exec_wq = create_singlethread_workqueue(name);
+	thread->occupied = true;
+	return 0;
+}
+
+static void cmdq_sec_mbox_shutdown(struct mbox_chan *chan)
+{
+	struct cmdq_sec_thread *thread = (struct cmdq_sec_thread *)chan->con_priv;
+
+	thread->occupied = false;
+}
+
+static int cmdq_sec_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
+{
+	struct cmdq_sec_thread *thread = (struct cmdq_sec_thread *)chan->con_priv;
+	struct cmdq_sec *cmdq = container_of(thread->chan->mbox, struct cmdq_sec, mbox);
+	s32 i;
+
+	mutex_lock(&cmdq->exec_lock);
+
+	if (list_empty(&thread->task_list))
+		goto out;
+
+	for (i = 0; i < CMDQ_MAX_SECURE_THREAD_COUNT; i++) {
+		struct cmdq_sec_thread *thread = &cmdq->thread[CMDQ_MIN_SECURE_THREAD_ID + i];
+		u32 cookie = cmdq_sec_get_cookie(cmdq, thread->idx);
+
+		if (cookie < thread->wait_cookie || !thread->task_cnt)
+			continue;
+
+		cmdq_sec_irq_handler(thread, cookie, -ECONNABORTED);
+	}
+
+out:
+	mutex_unlock(&cmdq->exec_lock);
+	return 0;
+}
+
+static bool cmdq_sec_mbox_last_tx_done(struct mbox_chan *chan)
+{
+	return true;
+}
+
+static const struct mbox_chan_ops cmdq_sec_mbox_chan_ops = {
+	.send_data = cmdq_sec_mbox_send_data,
+	.startup = cmdq_sec_mbox_startup,
+	.shutdown = cmdq_sec_mbox_shutdown,
+	.flush = cmdq_sec_mbox_flush,
+	.last_tx_done = cmdq_sec_mbox_last_tx_done,
+};
+
+static struct mbox_chan *cmdq_sec_mbox_of_xlate(struct mbox_controller *mbox,
+						const struct of_phandle_args *sp)
+{
+	struct cmdq_sec_thread *thread;
+	s32 idx = sp->args[0];
+
+	if (mbox->num_chans <= idx) {
+		pr_err("invalid thrd-idx:%u", idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	thread = (struct cmdq_sec_thread *)mbox->chans[idx].con_priv;
+	thread->chan = &mbox->chans[idx];
+	thread->timeout_ms = CMDQ_NO_TIMEOUT;
+	thread->priority = sp->args[1];
+
+	return &mbox->chans[idx];
+}
+
+static int cmdq_sec_probe(struct platform_device *pdev)
+{
+	s32 i, err;
+	struct cmdq_sec *cmdq;
+	struct cmdq_sec_plat *plat_data;
+	struct device *dev = &pdev->dev;
+
+	plat_data = (struct cmdq_sec_plat *)pdev->dev.platform_data;
+	if (!plat_data) {
+		dev_err(dev, "no valid platform data!\n");
+		return -EINVAL;
+	}
+
+	cmdq = devm_kzalloc(dev, sizeof(*cmdq), GFP_KERNEL);
+	if (!cmdq)
+		return -ENOMEM;
+
+	cmdq->base_pa = plat_data->base_pa;
+	cmdq->base = plat_data->base;
+	cmdq->thread_nr = plat_data->thread_nr;
+	cmdq->gce_num = plat_data->gce_num;
+	cmdq->clocks = devm_kcalloc(dev, cmdq->gce_num,
+				    sizeof(struct clk_bulk_data), GFP_KERNEL);
+	if (!cmdq->clocks)
+		return -ENOMEM;
+
+	for (i = 0 ; i < cmdq->gce_num; i++)
+		cmdq->clocks[i] = plat_data->clocks[i];
+
+	cmdq->hwid = plat_data->hwid;
+	cmdq->cmdq_event = plat_data->cmdq_event;
+
+	cmdq->mbox.dev = plat_data->gce_dev;
+	cmdq->mbox.chans = devm_kcalloc(dev, cmdq->thread_nr,
+					sizeof(*cmdq->mbox.chans), GFP_KERNEL);
+	if (!cmdq->mbox.chans)
+		return -ENOMEM;
+
+	cmdq->mbox.ops = &cmdq_sec_mbox_chan_ops;
+	cmdq->mbox.num_chans = cmdq->thread_nr;
+	cmdq->mbox.of_xlate = cmdq_sec_mbox_of_xlate;
+
+	/* make use of TXDONE_BY_ACK */
+	cmdq->mbox.txdone_irq = false;
+	cmdq->mbox.txdone_poll = false;
+
+	cmdq->thread = devm_kcalloc(dev, cmdq->thread_nr,
+				    sizeof(*cmdq->thread), GFP_KERNEL);
+	if (!cmdq->thread)
+		return -ENOMEM;
+
+	mutex_init(&cmdq->exec_lock);
+	for (i = 0; i < cmdq->thread_nr; i++) {
+		cmdq->thread[i].base = cmdq->base + CMDQ_THR_BASE + CMDQ_THR_SIZE * i;
+		INIT_LIST_HEAD(&cmdq->thread[i].task_list);
+		cmdq->thread[i].idx = i;
+		cmdq->thread[i].occupied = false;
+		cmdq->mbox.chans[i].con_priv = (void *)&cmdq->thread[i];
+	}
+
+	cmdq->notify_wq = create_singlethread_workqueue("mtk_cmdq_sec_notify_wq");
+	cmdq->timeout_wq = create_singlethread_workqueue("mtk_cmdq_sec_timeout_wq");
+	err = devm_mbox_controller_register(dev, &cmdq->mbox);
+	if (err)
+		return err;
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
+	WARN_ON(clk_bulk_prepare_enable(cmdq->gce_num, cmdq->clocks));
+
+	return 0;
+}
+
+static int cmdq_sec_remove(struct platform_device *pdev)
+{
+	struct cmdq_sec *cmdq = platform_get_drvdata(pdev);
+
+	if (cmdq->context)
+		cmdq_sec_free_wsm(&cmdq->context->tee, &cmdq->context->iwc_msg);
+
+	mbox_controller_unregister(&cmdq->mbox);
+
+	clk_bulk_disable_unprepare(cmdq->gce_num, cmdq->clocks);
+	return 0;
+}
+
+static struct platform_driver cmdq_sec_drv = {
+	.probe = cmdq_sec_probe,
+	.remove = cmdq_sec_remove,
+	.driver = {
+		.name = "mtk_cmdq_sec",
+		.pm = &cmdq_sec_pm_ops,
+	},
+};
+
+static int __init cmdq_sec_init(void)
+{
+	s32 err;
+
+	err = platform_driver_register(&cmdq_sec_drv);
+	if (err)
+		pr_err("platform_driver_register failed:%d", err);
+	return err;
+}
+
+arch_initcall(cmdq_sec_init);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/mailbox/mtk-cmdq-sec-tee.c b/drivers/mailbox/mtk-cmdq-sec-tee.c
new file mode 100644
index 000000000000..2b69862d8d0e
--- /dev/null
+++ b/drivers/mailbox/mtk-cmdq-sec-tee.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2019 MediaTek Inc.
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
+static void cmdq_sec_lock_secure_path(void)
+{
+	mutex_lock(&cmdq_sec_exec_lock);
+	smp_mb();	/*memory barrier*/
+}
+
+static void cmdq_sec_unlock_secure_path(void)
+{
+	mutex_unlock(&cmdq_sec_exec_lock);
+}
+
+void cmdq_sec_setup_tee_context(struct cmdq_sec_tee_context *tee)
+{
+	/* 09010000 0000 0000 0000000000000000 */
+	memset(tee->uuid, 0, sizeof(tee->uuid));
+	tee->uuid[0] = 0x9;
+	tee->uuid[1] = 0x1;
+}
+EXPORT_SYMBOL(cmdq_sec_setup_tee_context);
+
+#if IS_ENABLED(CONFIG_TEE)
+static int tee_dev_match(struct tee_ioctl_version_data *t, const void *v)
+{
+#if IS_ENABLED(CONFIG_OPTEE)
+	if (t->impl_id == TEE_IMPL_ID_OPTEE)
+		return 1;
+#endif
+	return 0;
+}
+#endif
+
+s32 cmdq_sec_init_context(struct cmdq_sec_tee_context *tee)
+{
+	s32 status;
+
+#if IS_ENABLED(CONFIG_TEE)
+	tee->tee_context = tee_client_open_context(NULL, tee_dev_match, NULL, NULL);
+#endif
+	if (tee->tee_context)
+		status = 0;
+	else
+		status = -EINVAL;
+
+	pr_info("[%s][%d]status=%d\n", __func__, __LINE__, status);
+
+	return status;
+}
+EXPORT_SYMBOL(cmdq_sec_init_context);
+
+s32 cmdq_sec_deinit_context(struct cmdq_sec_tee_context *tee)
+{
+#if IS_ENABLED(CONFIG_TEE)
+	if (tee)
+		tee_client_close_context(tee->tee_context);
+#endif
+	return 0;
+}
+EXPORT_SYMBOL(cmdq_sec_deinit_context);
+
+s32 cmdq_sec_allocate_wsm(struct cmdq_sec_tee_context *tee, void **wsm_buffer, u32 size)
+{
+	void *buffer;
+
+	if (!wsm_buffer)
+		return -EINVAL;
+
+	if (!size)
+		size = 8;
+
+	buffer = kmalloc(size, GFP_KERNEL);
+	if (!buffer)
+		return -EINVAL;
+
+#if IS_ENABLED(CONFIG_TEE)
+	tee->shared_mem = tee_shm_register_kernel_buf(tee->tee_context,
+						      buffer,
+						      size);
+#endif
+	if (!tee->shared_mem) {
+		kfree(buffer);
+		return -EINVAL;
+	}
+
+	*wsm_buffer = buffer;
+
+	return 0;
+}
+EXPORT_SYMBOL(cmdq_sec_allocate_wsm);
+
+s32 cmdq_sec_free_wsm(struct cmdq_sec_tee_context *tee, void **wsm_buffer)
+{
+	if (!wsm_buffer)
+		return -EINVAL;
+
+#if IS_ENABLED(CONFIG_TEE)
+	tee_shm_put(tee->shared_mem);
+#endif
+	tee->shared_mem = NULL;
+	kfree(*wsm_buffer);
+	*wsm_buffer = NULL;
+
+	return 0;
+}
+EXPORT_SYMBOL(cmdq_sec_free_wsm);
+
+s32 cmdq_sec_open_session(struct cmdq_sec_tee_context *tee, void *wsm_buffer)
+{
+	struct tee_ioctl_open_session_arg osarg;
+	struct tee_param params;
+	int rc = 0;
+
+	if (!wsm_buffer)
+		return -EINVAL;
+
+	memset(&params, 0, sizeof(struct tee_param));
+
+	memset(&osarg, 0, sizeof(osarg));
+	osarg.num_params = 1;
+	memcpy(osarg.uuid, tee->uuid, sizeof(osarg.uuid));
+	osarg.clnt_login = 0;
+#if IS_ENABLED(CONFIG_TEE)
+	rc = tee_client_open_session(tee->tee_context, &osarg, &params);
+#endif
+	if (rc)
+		return -EINVAL;
+
+	if (!osarg.ret)
+		tee->session = osarg.session;
+
+	return 0;
+}
+EXPORT_SYMBOL(cmdq_sec_open_session);
+
+s32 cmdq_sec_close_session(struct cmdq_sec_tee_context *tee)
+{
+#if IS_ENABLED(CONFIG_TEE)
+	tee_client_close_session(tee->tee_context, tee->session);
+#endif
+	return 0;
+}
+EXPORT_SYMBOL(cmdq_sec_close_session);
+
+s32 cmdq_sec_execute_session(struct cmdq_sec_tee_context *tee, u32 cmd, s32 timeout_ms)
+{
+	s32 status;
+	struct tee_ioctl_invoke_arg ivarg;
+	struct tee_param params;
+	u64 ts = sched_clock();
+	int rc = 0;
+
+	cmdq_sec_lock_secure_path();
+
+	memset(&params, 0, sizeof(struct tee_param));
+	params.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
+	params.u.memref.shm = tee->shared_mem;
+	params.u.memref.shm_offs = 0;
+	params.u.memref.size = tee->shared_mem->size;
+
+	memset(&ivarg, 0, sizeof(ivarg));
+	ivarg.num_params = 1;
+	ivarg.session = tee->session;
+	ivarg.func = cmd;
+
+#if IS_ENABLED(CONFIG_TEE)
+	rc = tee_client_invoke_func(tee->tee_context, &ivarg, &params);
+#endif
+	if (rc) {
+		pr_err("tee_client_invoke_func failed, ret=%d\n", rc);
+		return -EINVAL;
+	}
+
+	status = ivarg.ret;
+
+	cmdq_sec_unlock_secure_path();
+
+	ts = div_u64(sched_clock() - ts, 1000000);
+
+	if (status != 0)
+		pr_err("[SEC]execute: TEEC_InvokeCommand:%u err:%d cost:%lluus", cmd, status, ts);
+	else if (ts > timeout_ms)
+		pr_err("[SEC]execute: TEEC_InvokeCommand:%u ret:%d cost:%lluus", cmd, status, ts);
+	else
+		pr_debug("[SEC]execute: TEEC_InvokeCommand:%u ret:%d cost:%lluus", cmd, status, ts);
+
+	return status;
+}
+EXPORT_SYMBOL(cmdq_sec_execute_session);
+
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index a8f4f78f21d8..89deb06413c3 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -7,6 +7,7 @@
 #ifndef __MTK_CMDQ_MAILBOX_H__
 #define __MTK_CMDQ_MAILBOX_H__
 
+#include <linux/mailbox_controller.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -77,6 +78,7 @@ struct cmdq_pkt {
 	size_t			buf_size; /* real buffer size */
 	void			*cl;
 	bool			loop;
+	void			*sec_data;
 };
 
 struct cmdq_sec_plat {
diff --git a/include/linux/mailbox/mtk-cmdq-sec-iwc-common.h b/include/linux/mailbox/mtk-cmdq-sec-iwc-common.h
new file mode 100644
index 000000000000..addc515df279
--- /dev/null
+++ b/include/linux/mailbox/mtk-cmdq-sec-iwc-common.h
@@ -0,0 +1,293 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#ifndef __CMDQ_SEC_IWC_COMMON_H__
+#define __CMDQ_SEC_IWC_COMMON_H__
+
+/*
+ * shared DRAM
+ * bit x = 1 means thread x raise IRQ
+ */
+#define CMDQ_SEC_SHARED_IRQ_RAISED_OFFSET	0
+#define CMDQ_SEC_SHARED_THR_CNT_OFFSET		0x100
+#define CMDQ_SEC_SHARED_TASK_VA_OFFSET		0x200
+#define CMDQ_SEC_SHARED_OP_OFFSET		0x300
+#define CMDQ_SEC_SHARED_SUSPEND_CNT		0x304
+#define CMDQ_SEC_SHARED_RESET_CNT		0x308
+
+/* commanad buffer & metadata */
+#define CMDQ_TZ_CMD_BLOCK_SIZE		(20 << 12) /* MDP readback may request 20 pages */
+#define CMDQ_IWC_MAX_CMD_LENGTH		(CMDQ_TZ_CMD_BLOCK_SIZE / 4)
+
+#define CMDQ_IWC_MAX_ADDR_LIST_LENGTH	(30)
+
+#define CMDQ_IWC_CLIENT_NAME		(16)
+
+#define CMDQ_SEC_MESSAGE_INST_LEN	(8)
+#define CMDQ_SEC_DISPATCH_LEN		(8)
+#define CMDQ_MAX_READBACK_ENG		(8)
+
+/*
+ * Command IDs for normal world(TLC or linux kernel) to secure world
+ */
+/* submit current task */
+#define CMD_CMDQ_IWC_SUBMIT_TASK	(1)
+/* (not used)release resource in secure path per session */
+#define CMD_CMDQ_IWC_RES_RELEASE	(2)
+/* cancel current task */
+#define CMD_CMDQ_IWC_CANCEL_TASK	(3)
+/* create global resource for secure path */
+#define CMD_CMDQ_IWC_PATH_RES_ALLOCATE	(4)
+/* destroy globacl resource for secure path */
+#define CMD_CMDQ_IWC_PATH_RES_RELEASE	(5)
+
+/*
+ * ERROR code number (ERRNO)
+ * note the error result returns negative value, i.e, -(ERRNO)
+ */
+#define CMDQ_ERR_NOMEM					(12) /* out of memory */
+#define CMDQ_ERR_FAULT					(14) /* bad address */
+
+#define CMDQ_ERR_ADDR_CONVERT_HANDLE_2_PA		(1000)
+#define CMDQ_ERR_ADDR_CONVERT_ALLOC_MVA			(1100)
+#define CMDQ_ERR_ADDR_CONVERT_ALLOC_MVA_N2S		(1101)
+#define CMDQ_ERR_ADDR_CONVERT_FREE_MVA			(1200)
+#define CMDQ_ERR_PORT_CONFIG				(1300)
+
+/* param check */
+#define CMDQ_ERR_UNKNOWN_ADDR_METADATA_TYPE		(1400)
+#define CMDQ_ERR_TOO_MANY_SEC_HANDLE			(1401)
+/* security check */
+#define CMDQ_ERR_SECURITY_INVALID_INSTR			(1500)
+#define CMDQ_ERR_SECURITY_INVALID_SEC_HANDLE		(1501)
+#define CMDQ_ERR_SECURITY_INVALID_DAPC_FALG		(1502)
+#define CMDQ_ERR_INSERT_DAPC_INSTR_FAILED		(1503)
+#define CMDQ_ERR_INSERT_PORT_SECURITY_INSTR_FAILED	(1504)
+#define CMDQ_ERR_INVALID_SECURITY_THREAD		(1505)
+#define CMDQ_ERR_PATH_RESOURCE_NOT_READY		(1506)
+#define CMDQ_ERR_NULL_TASK				(1507)
+#define CMDQ_ERR_SECURITY_INVALID_SOP			(1508)
+#define CMDQ_ERR_SECURITY_INVALID_SEC_PORT_FALG		(1511)
+
+enum cmdq_iwc_addr_metadata_type {
+	CMDQ_IWC_H_2_PA		= 0, /* sec handle to sec PA */
+	CMDQ_IWC_H_2_MVA	= 1, /* sec handle to sec MVA */
+	CMDQ_IWC_NMVA_2_MVA	= 2, /* map normal MVA to secure world */
+	CMDQ_IWC_PH_2_MVA	= 3, /* protected handle to sec MVA */
+};
+
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
+	CMDQ_SEC_MAX_ENG_COUNT		/* keep in the end */
+};
+
+/*
+ * IWC message
+ */
+struct iwcCmdqAddrMetadata_t {
+	/*
+	 * [IN] index of instruction
+	 * Update its arg_b value to real PA/MVA in secure world
+	 */
+	u32 instrIndex;
+
+	/*
+	 * Note: Buffer and offset
+	 *
+	 *   -------------
+	 *   |     |     |
+	 *   -------------
+	 *   ^     ^  ^  ^
+	 *   A     B  C  D
+	 *
+	 *	A: baseHandle
+	 *	B: baseHandle + blockOffset
+	 *	C: baseHandle + blockOffset + offset
+	 *	A~B or B~D: size
+	 */
+
+	u32 type;		/* [IN] addr handle type */
+	u64 baseHandle;	/* [IN] secure address handle */
+	u32 blockOffset;	/* [IN] block offset from handle(PA) to current block(plane) */
+	u32 offset;	/* [IN]_b, buffser offset to secure handle */
+	u32 size;		/* [IN] buffer size */
+	u32 port;		/* [IN] HW port id (i.e. M4U port id)*/
+};
+
+struct iwcCmdqDebugConfig_t {
+	s32 logLevel;
+	s32 enableProfile;
+};
+
+struct iwcCmdqSecStatus_t {
+	u32 step;
+	s32 status;
+	u32 args[4];
+	u32 sec_inst[CMDQ_SEC_MESSAGE_INST_LEN];
+	u32 inst_index;
+	char dispatch[CMDQ_SEC_DISPATCH_LEN];
+};
+
+struct iwcCmdqMetadata_t {
+	u32 addrListLength;
+	struct iwcCmdqAddrMetadata_t addrList[CMDQ_IWC_MAX_ADDR_LIST_LENGTH];
+
+	u64 enginesNeedDAPC;
+	u64 enginesNeedPortSecurity;
+};
+
+struct iwcCmdqPathResource_t {
+	long long shareMemoyPA; /* use long long for 64 bit compatible support */
+	u32 size;
+	bool useNormalIRQ; /* use normal IRQ in SWd */
+};
+
+struct iwcCmdqCancelTask_t {
+	/* [IN] */
+	s32 thread;
+	u32 waitCookie;
+
+	/* [OUT] */
+	bool throwAEE;
+	bool hasReset;
+	s32 irqStatus; /* global secure IRQ flag */
+	s32 irqFlag; /* thread IRQ flag */
+	u32 errInstr[2]; /* errInstr[0] = instB, errInstr[1] = instA */
+	u32 regValue;
+	u32 pc;
+};
+
+struct iwcCmdqMetaBuf {
+	u64 va;
+	u64 size;
+};
+
+/* extension flag for secure driver, must sync with def */
+enum sec_extension_iwc {
+	IWC_MDP_AAL = 0,
+	IWC_MDP_TDSHP,
+};
+
+struct readback_engine {
+	u32 engine;
+	u32 start;
+	u32 count;
+	u32 param;
+};
+
+struct iwcCmdqCommand_t {
+	/* basic execution data */
+	u32 thread;
+	u32 scenario;
+	u32 priority;
+	u32 commandSize;
+	u64 engineFlag;
+	u32 pVABase[CMDQ_IWC_MAX_CMD_LENGTH];
+
+	/* exec order data */
+	u32 waitCookie; /* [IN] index in thread's task list, it should be (nextCookie - 1) */
+	bool resetExecCnt;   /* [IN] reset HW thread */
+
+	/* client info */
+	s32 callerPid;
+	char callerName[CMDQ_IWC_CLIENT_NAME];
+
+	/* metadata */
+	struct iwcCmdqMetadata_t metadata;
+
+	/* client extension bits */
+	u64 extension;
+	u64 readback_pa;
+
+	/* debug */
+	u64 hNormalTask; /* handle to reference task in normal world */
+
+	/* SVP HDR */
+	u32 mdp_extension;
+	struct readback_engine readback_engs[CMDQ_MAX_READBACK_ENG];
+	u32 readback_cnt;
+};
+
+/*
+ * Linex kernel and mobicore has their own MMU tables,
+ * the latter's is used to map world shared memory and physical address
+ * so mobicore dose not understand linux virtual address mapping.
+ * If we want to transact a large buffer in TCI/DCI, there are 2 method (both need 1 copy):
+ * 1. use mc_map, to map normal world buffer to WSM, and pass secure_virt_addr in TCI/DCI buffer
+ *    note mc_map implies a memcopy to copy content from normal world to WSM.
+ * 2. declare a fixed length array in TCI/DCI struct, and its size must be < 1M.
+ */
+struct iwcCmdqMessage_t {
+	union {
+		u32 cmd;	/* [IN] command id */
+		s32 rsp;	/* [OUT] 0 for success, < 0 for error */
+	};
+
+	union {
+		struct iwcCmdqCommand_t command;
+		struct iwcCmdqCancelTask_t cancelTask;
+		struct iwcCmdqPathResource_t pathResource;
+	};
+
+	struct iwcCmdqDebugConfig_t debug;
+	struct iwcCmdqSecStatus_t secStatus;
+
+	u8 cmdq_id;
+};
+#endif /* __CMDQ_SEC_IWC_COMMON_H__ */
diff --git a/include/linux/mailbox/mtk-cmdq-sec-mailbox.h b/include/linux/mailbox/mtk-cmdq-sec-mailbox.h
new file mode 100644
index 000000000000..848fbcfdd59a
--- /dev/null
+++ b/include/linux/mailbox/mtk-cmdq-sec-mailbox.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#ifndef __MTK_CMDQ_SEC_MAILBOX_H__
+#define __MTK_CMDQ_SEC_MAILBOX_H__
+
+#include <linux/kernel.h>
+
+#include <linux/mailbox/mtk-cmdq-mailbox.h>
+#include <linux/mailbox/mtk-cmdq-sec-iwc-common.h>
+#include <linux/mailbox/mtk-cmdq-sec-tee.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#define CMDQ_INVALID_THREAD		(-1)
+#define CMDQ_MAX_TASK_IN_SECURE_THREAD	(16)
+#define CMDQ_SEC_IRQ_THREAD		(15)
+
+/* This define should sync with cmdq_sec_def.h in secure world */
+#define CMDQ_MIN_SECURE_THREAD_ID	(8)
+#define CMDQ_MAX_SECURE_THREAD_ID	(10)
+#define CMDQ_MAX_SECURE_THREAD_COUNT	(CMDQ_MAX_SECURE_THREAD_ID - CMDQ_MIN_SECURE_THREAD_ID)
+
+/* Max value of CMDQ_THR_EXEC_CMD_CNT (value starts from 0) */
+#define CMDQ_MAX_COOKIE_VALUE           (0xffff)
+
+enum cmdq_sec_scenario {
+	CMDQ_SEC_PRIMARY_DISP		= 1,
+	CMDQ_SEC_SUB_DISP		= 4,
+	CMDQ_SEC_PRIMARY_DISP_DISABLE	= 18,
+	CMDQ_SEC_SUB_DISP_DISABLE	= 19,
+
+	CMDQ_MAX_SEC_COUNT	/* keep in the end */
+};
+
+/* Inter-world communication state */
+enum cmdq_iwc_state_enum {
+	IWC_INIT,
+	IWC_CONTEXT_INITED,
+	IWC_WSM_ALLOCATED,
+	IWC_SES_OPENED,
+	IWC_SES_ON_TRANSACTED,
+
+	IWC_STATE_END_OF_ENUM,
+};
+
+/*
+ * Address metadata, used to translate secure buffer PA
+ * related instruction in secure world.
+ */
+struct cmdq_sec_data {
+	u32 addrMetadataCount;	/* [IN] count of element in addrList */
+	u64 addrMetadatas;		/* [IN] array of iwcCmdqAddrMetadata_t */
+	u32 addrMetadataMaxCount;	/* [Reserved] */
+
+	enum cmdq_sec_scenario scenario;
+
+	u64 enginesNeedDAPC;
+	u64 enginesNeedPortSecurity;
+
+	/*
+	 * [Reserved]
+	 * This is task index in thread's tasklist for CMDQ driver usage.
+	 * Not for client. -1 means not in tasklist.
+	 */
+	s32 waitCookie;
+	/* [Reserved] reset HW thread in secure world */
+	bool resetExecCnt;
+
+	/* [OUT] response */
+	s32 response;
+	struct iwcCmdqSecStatus_t sec_status;
+};
+
+s32 cmdq_sec_insert_backup_cookie(struct cmdq_pkt *pkt);
+s32 cmdq_sec_pkt_set_data(struct cmdq_pkt *pkt, const u64 dapc_engine,
+			  const u64 port_sec_engine, const enum cmdq_sec_scenario scenario);
+s32 cmdq_sec_pkt_write(struct cmdq_pkt *pkt, u32 addr, u64 base,
+		       const enum cmdq_iwc_addr_metadata_type type,
+		       const u32 offset, const u32 size, const u32 port);
+
+#endif /* __MTK_CMDQ_SEC_MAILBOX_H__ */
diff --git a/include/linux/mailbox/mtk-cmdq-sec-tee.h b/include/linux/mailbox/mtk-cmdq-sec-tee.h
new file mode 100644
index 000000000000..2596d2866837
--- /dev/null
+++ b/include/linux/mailbox/mtk-cmdq-sec-tee.h
@@ -0,0 +1,31 @@
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
+/* context for tee vendor */
+struct cmdq_sec_tee_context {
+	/* Universally Unique Identifier of secure world */
+	u8			uuid[TEE_IOCTL_UUID_LEN];
+	struct tee_context	*tee_context; /* basic context */
+	u32			session; /* session handle */
+	struct tee_shm		*shared_mem; /* shared memory */
+};
+
+void cmdq_sec_setup_tee_context(struct cmdq_sec_tee_context *tee);
+s32 cmdq_sec_init_context(struct cmdq_sec_tee_context *tee);
+s32 cmdq_sec_deinit_context(struct cmdq_sec_tee_context *tee);
+s32 cmdq_sec_allocate_wsm(struct cmdq_sec_tee_context *tee, void **wsm_buffer, u32 size);
+s32 cmdq_sec_free_wsm(struct cmdq_sec_tee_context *tee, void **wsm_buffer);
+s32 cmdq_sec_open_session(struct cmdq_sec_tee_context *tee, void *wsm_buffer);
+s32 cmdq_sec_close_session(struct cmdq_sec_tee_context *tee);
+s32 cmdq_sec_execute_session(struct cmdq_sec_tee_context *tee, u32 cmd, s32 timeout_ms);
+
+#endif	/* __MTK_CMDQ_SEC_TEE_H__ */
-- 
2.18.0

