Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2643D203036
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEA96E5B6;
	Mon, 22 Jun 2020 07:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2F9DA6E040
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 14:18:44 +0000 (UTC)
X-UUID: 6cdfa703b5e54dbba54a8113a8526736-20200621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=X35jl0A9PZWG4f89VGa/z8r3XNAzAElwSV6w2JuPHEc=; 
 b=f9sDRcVUAN7ud9fFW/9fvZvuafMj54aq6p8Yz/z5rmsGMJeS8EaD3zRbUwe4GL6rhfmp9WAS5j1hetZ+9m/IplkbZBtuDK3QvaB7BSJLpOop5Kj5PesaVmGPv9niy83atQt/YzbR3Cne+EKRetz7VsNBXS7KD/9zwspSu6JVtG0=;
X-UUID: 6cdfa703b5e54dbba54a8113a8526736-20200621
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1560567633; Sun, 21 Jun 2020 22:18:40 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Jun 2020 22:18:30 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 21 Jun 2020 22:18:30 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>
Subject: [PATCH v1 04/11] soc: mediatek: cmdq: add write_s_mask function
Date: Sun, 21 Jun 2020 22:18:28 +0800
Message-ID: <1592749115-24158-5-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1592749115-24158-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1592749115-24158-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3ACBD90302F77DCF451BC8BFB949AB79550ECD588DDFECE7EC7AB1739C6B44602000:8
X-MTK: N
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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

add write_s_mask function in cmdq helper functions which
writes value contains in internal register to address
with mask and large dma access support.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c   |   23 +++++++++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h |    1 +
 include/linux/soc/mediatek/mtk-cmdq.h    |   18 ++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 817a5a97dbe5..13b888779093 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -241,6 +241,29 @@ int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
 }
 EXPORT_SYMBOL(cmdq_pkt_write_s);
 
+int cmdq_pkt_write_s_mask(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
+			  u16 addr_low, u16 src_reg_idx, u32 mask)
+{
+	struct cmdq_instruction inst = {};
+	int err;
+
+	inst.op = CMDQ_CODE_MASK;
+	inst.mask = ~mask;
+	err = cmdq_pkt_append_command(pkt, inst);
+	if (err < 0)
+		return err;
+
+	inst.mask = 0;
+	inst.op = CMDQ_CODE_WRITE_S_MASK;
+	inst.src_t = CMDQ_REG_TYPE;
+	inst.sop = high_addr_reg_idx;
+	inst.offset = addr_low;
+	inst.src_reg = src_reg_idx;
+
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_write_s_mask);
+
 int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
 {
 	struct cmdq_instruction inst = { {0} };
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index ee67dd3b86f5..8ef87e1bd03b 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -60,6 +60,7 @@ enum cmdq_code {
 	CMDQ_CODE_WFE = 0x20,
 	CMDQ_CODE_EOC = 0x40,
 	CMDQ_CODE_WRITE_S = 0x90,
+	CMDQ_CODE_WRITE_S_MASK = 0x91,
 	CMDQ_CODE_LOGIC = 0xa0,
 };
 
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index e1c5a7549b4f..ca9c75fd8125 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -122,6 +122,24 @@ int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
 		     u16 addr_low, u16 src_reg_idx);
 
 /**
+ * cmdq_pkt_write_s_mask() - append write_s with mask command to the CMDQ packet
+ * @pkt:	the CMDQ packet
+ * @high_addr_reg_idx:	internal register ID which contains high address of pa
+ * @addr_low:	low address of pa
+ * @src_reg_idx:	the CMDQ internal register ID which cache source value
+ * @mask:	the specified target address mask, use U32_MAX if no need
+ *
+ * Return: 0 for success; else the error code is returned
+ *
+ * Support write value to physical address without subsys. Use CMDQ_ADDR_HIGH()
+ * to get high address and call cmdq_pkt_assign() to assign value into internal
+ * reg. Also use CMDQ_ADDR_LOW() to get low address for addr_low parameter when
+ * call to this function.
+ */
+int cmdq_pkt_write_s_mask(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
+			  u16 addr_low, u16 src_reg_idx, u32 mask);
+
+/**
  * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
  * @pkt:	the CMDQ packet
  * @event:	the desired event type to "wait and CLEAR"
-- 
1.7.9.5
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
