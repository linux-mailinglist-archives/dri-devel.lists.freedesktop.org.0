Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7291896C50
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5EE1129AE;
	Wed,  3 Apr 2024 10:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="c8PbsavI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF511129A6
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:27:11 +0000 (UTC)
X-UUID: b6b50d8cf1a411eeb8927bc1f75efef4-20240403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JZkUKgIPLh7/qe2xhIetKSxoRL0ImVbOMTN8ofcMOdE=; 
 b=c8PbsavIaMn8do79zCUtoFu6Ph4zce8XX3opnr1/QV4utypye8diTmpjqdHdHwdndDsCXx3WIi7zKIfB1xj+dJAlqp1xKuQHvPTCTF5DW9Dhf9HOzfsdJRq6iTqoo9wduq117eK2Hhg4Jm0Ygz5V7c6IsSETAjwRQnGJUGmvPDI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:249d1f70-8f84-4299-ae58-d2fbc2a81f1e, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:6f543d0, CLOUDID:01fec585-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b6b50d8cf1a411eeb8927bc1f75efef4-20240403
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 928806549; Wed, 03 Apr 2024 18:27:03 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 18:27:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 18:27:02 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, Jason-JH.Lin <jason-jh.lin@mediatek.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v5 4/9] drm/mediatek: Add mtk_ddp_sec_write to config secure
 buffer info
Date: Wed, 3 Apr 2024 18:26:56 +0800
Message-ID: <20240403102701.369-5-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240403102701.369-1-shawn.sung@mediatek.com>
References: <20240403102701.369-1-shawn.sung@mediatek.com>
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

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

Add mtk_ddp_sec_write to configure secure buffer information to
cmdq secure packet data.
Then secure cmdq driver will use these information to configure
curresponding secure DRAM address to HW overlay in secure world.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 14 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 8aab373ce67c9..0ee9e42cdf0a0 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -111,6 +111,20 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 #endif
 }
 
+void mtk_ddp_sec_write(struct cmdq_pkt *cmdq_pkt, u32 addr, u64 base,
+		       const enum cmdq_iwc_addr_metadata_type type,
+		       const u32 offset, const u32 size, const u32 port)
+{
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	if (!cmdq_pkt)
+		return;
+
+	/* secure buffer will be 4K alignment */
+	cmdq_sec_pkt_write(cmdq_pkt, addr, base, type,
+			   offset, ALIGN(size, PAGE_SIZE), port);
+#endif
+}
+
 static int mtk_ddp_clk_enable(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index b9c79e740abe0..17c690e1f477f 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -7,6 +7,7 @@
 #define MTK_DDP_COMP_H
 
 #include <linux/io.h>
+#include <linux/mailbox/mtk-cmdq-sec-mailbox.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
@@ -346,4 +347,7 @@ void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 			struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 			unsigned int offset, unsigned int mask);
+void mtk_ddp_sec_write(struct cmdq_pkt *cmdq_pkt, u32 addr, u64 base,
+		       const enum cmdq_iwc_addr_metadata_type type,
+		       const u32 offset, const u32 size, const u32 port);
 #endif /* MTK_DDP_COMP_H */
-- 
2.18.0

