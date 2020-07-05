Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BA2215339
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D6C6E328;
	Mon,  6 Jul 2020 07:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 468916EBF5
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jul 2020 06:48:44 +0000 (UTC)
X-UUID: 43869b2c4200463bad3ac465d0b5121e-20200705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NMbzrFgr1D1ON+0m4oV6SYOuNW2QtIquhnTgvJXv7Bg=; 
 b=oKvDflsVrjLnmAv3Xo2oRgcDGG5qRyj5zw1Sq4HwX3cmXiqBSPT1SWgKkZzD9PZmKsMavvGilrKNwIdk+2B+q9BCPac8Te06o0QB8441yPFnR/Ve1ImAjvyWtqCDZ5sfEn+5HMMXNJA1KRZuSUEZlHrtSUzNNP0jc5c9Drm9VlM=;
X-UUID: 43869b2c4200463bad3ac465d0b5121e-20200705
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1935553053; Sun, 05 Jul 2020 14:48:39 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Jul 2020 14:48:36 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 5 Jul 2020 14:48:37 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>
Subject: [PATCH v2 7/8] soc: mediatek: cmdq: add jump function
Date: Sun, 5 Jul 2020 14:48:34 +0800
Message-ID: <1593931715-32761-8-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1593931715-32761-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1593931715-32761-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add jump function so that client can jump to any address which
contains instruction.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c |   13 +++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  |   11 +++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index b6e25f216605..d55dc3296105 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -13,6 +13,7 @@
 #define CMDQ_POLL_ENABLE_MASK	BIT(0)
 #define CMDQ_EOC_IRQ_EN		BIT(0)
 #define CMDQ_REG_TYPE		1
+#define CMDQ_JUMP_RELATIVE	1
 
 struct cmdq_instruction {
 	union {
@@ -407,6 +408,18 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 }
 EXPORT_SYMBOL(cmdq_pkt_assign);
 
+int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
+{
+	struct cmdq_instruction inst = {};
+
+	inst.op = CMDQ_CODE_JUMP;
+	inst.offset = CMDQ_JUMP_RELATIVE;
+	inst.value = addr >>
+		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_jump);
+
 int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 {
 	struct cmdq_instruction inst = { {0} };
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index d9390d76ee14..34354e952f60 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -253,6 +253,17 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
 int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
 
 /**
+ * cmdq_pkt_jump() - Append jump command to the CMDQ packet, ask GCE
+ *		     to execute an instruction that change current thread PC to
+ *		     a physical address which should contains more instruction.
+ * @pkt:        the CMDQ packet
+ * @addr:       physical address of target instruction buffer
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr);
+
+/**
  * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
  * @pkt:	the CMDQ packet
  *
-- 
1.7.9.5
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
