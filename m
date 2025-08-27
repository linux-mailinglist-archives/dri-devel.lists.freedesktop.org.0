Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF2EB38149
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 13:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D8C10E543;
	Wed, 27 Aug 2025 11:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Q6Z6Cm1R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE04510E7C9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 11:40:17 +0000 (UTC)
X-UUID: 97c324e4833a11f0b33aeb1e7f16c2b6-20250827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UK2W//uM1VgvPFkvpGuNnDYKk6n3fgin1KZzOCbVh/g=; 
 b=Q6Z6Cm1RboWeLkr5qM27Rsbm+CQF+QsOZwHOML6ftZmQDzMaUKwTzXZ81buMa02qPfYjAnrKyPN8wxqzJJK9Y0NrrSAoen+wpO98Lx4YhuLqV2/Z+myH+79yPJJA717u+o8r3lmxf31zEaCJFTwx8hYg+x59Pj/Imf5eEYKs86Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:0322c1e9-ee8a-468c-98e3-792e602f230a, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:f1326cf, CLOUDID:e6a59020-786d-4870-a017-e7b4f3839b3f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
 -3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 97c324e4833a11f0b33aeb1e7f16c2b6-20250827
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1849753756; Wed, 27 Aug 2025 19:40:12 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 27 Aug 2025 19:40:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 27 Aug 2025 19:40:08 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Dufresne
 <nicolas@ndufresne.ca>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xiandong
 Wang <xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>,
 Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v7 06/20] mailbox: mtk-cmdq: Add GCE hardware virtualization
 configuration
Date: Wed, 27 Aug 2025 19:37:38 +0800
Message-ID: <20250827114006.3310175-7-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
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

The GCE hardware virtualization configuration supports the isolation of
GCE hardware resources across different OS environments. Each OS is
treated as a virtual machine (VM) for GCE purposes.
There are 6 VMs and 1 host VM. The host VM has main control over the
GCE virtualization settings for all VMs.

To properly access the GCE thread registers, it is necessary to
configure access permissions for specific GCE threads assigned to
different VMs.
Currently, since only the host VM is being used, it is required to
enable access permissions for all GCE threads for the host VM.

There are 2 VM configurations:
1. VM_ID_MAP
There are 4 registers to allocate 32 GCE threads across different VMs:
VM_ID_MAP0 for threads 0-9, VM_ID_MAP1 for threads 10-19,
VM_ID_MAP2 for threads 20-29, and VM_ID_MAP3 for threads 30-31.
Each thread has a 3-bit configuration, where setting all bits to 1
configures the thread for the host VM.

2. VM_CPR_GSIZE
It is used to allocate the CPR SRAM size to each VM. Each VM has 4-bit
configuration, where setting bit 0-3 to configures the size of host VM.
This setting must be configured before the VM configuration to prevent
resource leakage.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 48 ++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 6b6b0abe9c36..a9e8895d14df 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -43,6 +43,13 @@
 #define GCE_CTRL_BY_SW				GENMASK(2, 0)
 #define GCE_DDR_EN				GENMASK(18, 16)
 
+#define GCE_VM_ID_MAP(n)		(0x5018 + (n) / 10 * 4)
+#define GCE_VM_ID_MAP_THR_FLD_SHIFT(n)		((n) % 10 * 3)
+#define GCE_VM_ID_MAP_HOST_VM			GENMASK(2, 0)
+#define GCE_VM_CPR_GSIZE		0x50c4
+#define GCE_VM_CPR_GSIZE_FLD_SHIFT(vm_id)	((vm_id) * 4)
+#define GCE_VM_CPR_GSIZE_MAX			GENMASK(3, 0)
+
 #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
 #define CMDQ_THR_ENABLED		0x1
 #define CMDQ_THR_DISABLED		0x0
@@ -89,6 +96,7 @@ struct gce_plat {
 	u8 shift;
 	bool control_by_sw;
 	bool sw_ddr_en;
+	bool gce_vm;
 	u32 gce_num;
 };
 
@@ -118,6 +126,45 @@ u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 }
 EXPORT_SYMBOL(cmdq_get_shift_pa);
 
+static void cmdq_vm_init(struct cmdq *cmdq)
+{
+	int i;
+	u32 vm_cpr_gsize = 0, vm_id_map = 0;
+	u32 *vm_map = NULL;
+
+	if (!cmdq->pdata->gce_vm)
+		return;
+
+	vm_map = kcalloc(cmdq->pdata->thread_nr, sizeof(*vm_map), GFP_KERNEL);
+	if (!vm_map)
+		return;
+
+	/* only configure the max CPR SRAM size to host vm (vm_id = 0) currently */
+	vm_cpr_gsize = GCE_VM_CPR_GSIZE_MAX << GCE_VM_CPR_GSIZE_FLD_SHIFT(0);
+
+	/* set all thread mapping to host vm currently */
+	for (i = 0; i < cmdq->pdata->thread_nr; i++)
+		vm_map[i] = GCE_VM_ID_MAP_HOST_VM << GCE_VM_ID_MAP_THR_FLD_SHIFT(i);
+
+	/* set the amount of CPR SRAM to allocate to each VM */
+	writel(vm_cpr_gsize, cmdq->base + GCE_VM_CPR_GSIZE);
+
+	/* config CPR_GSIZE before setting VM_ID_MAP to avoid data leakage */
+	for (i = 0; i < cmdq->pdata->thread_nr; i++) {
+		vm_id_map |= vm_map[i];
+		/* config every 10 threads, e.g., thread id=0~9, 10~19, ..., into one register */
+		if ((i + 1) % 10 == 0) {
+			writel(vm_id_map, cmdq->base + GCE_VM_ID_MAP(i));
+			vm_id_map = 0;
+		}
+	}
+	/* config remaining threads settings */
+	if (cmdq->pdata->thread_nr % 10 != 0)
+		writel(vm_id_map, cmdq->base + GCE_VM_ID_MAP(cmdq->pdata->thread_nr - 1));
+
+	kfree(vm_map);
+}
+
 static void cmdq_gctl_value_toggle(struct cmdq *cmdq, bool ddr_enable)
 {
 	u32 val = cmdq->pdata->control_by_sw ? GCE_CTRL_BY_SW : 0;
@@ -162,6 +209,7 @@ static void cmdq_init(struct cmdq *cmdq)
 
 	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
 
+	cmdq_vm_init(cmdq);
 	cmdq_gctl_value_toggle(cmdq, true);
 
 	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
-- 
2.43.0

