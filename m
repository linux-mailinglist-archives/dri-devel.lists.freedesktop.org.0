Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F261A203033
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC6F6E5BD;
	Mon, 22 Jun 2020 07:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7D5996E090
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 14:18:46 +0000 (UTC)
X-UUID: 12948ce7a11b4243a23cbb0e9e05b9ca-20200621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=z/6MqrLHQsTQsidTuO2irev1UR5xIKmOifSBkXoSUNg=; 
 b=bln4AG+0VjMKgJ8vPRpqkAYNx450z1hXuTT7+ZICca6RRLBbaGNW56BIUWOUuDq9wruTJDr0TEF8HYYQn3pai5p0lZZ3zuP2I0BYHEmHas81TCja+ZNwjm6UAO58Q1QNfUfDAaDYi+creeIc/FiFxSGJAm0Hy0KiO34DNPCvY8o=;
X-UUID: 12948ce7a11b4243a23cbb0e9e05b9ca-20200621
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 282607526; Sun, 21 Jun 2020 22:18:42 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Jun 2020 22:18:29 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 21 Jun 2020 22:18:30 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>
Subject: [PATCH v1 05/11] soc: mediatek: cmdq: add read_s function
Date: Sun, 21 Jun 2020 22:18:29 +0800
Message-ID: <1592749115-24158-6-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1592749115-24158-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1592749115-24158-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2881870B036DE4DA193C50849BC95BCEDAFF4D93D72505568081E3DCDD0D60412000:8
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

Add read_s function in cmdq helper functions which support read value from
register or dma physical address into gce internal register.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c   |   15 +++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h |    1 +
 include/linux/soc/mediatek/mtk-cmdq.h    |   12 ++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 13b888779093..58075589509b 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -226,6 +226,21 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
 }
 EXPORT_SYMBOL(cmdq_pkt_write_mask);
 
+int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx, u16 addr_low,
+		    u16 reg_idx)
+{
+	struct cmdq_instruction inst = {};
+
+	inst.op = CMDQ_CODE_READ_S;
+	inst.dst_t = CMDQ_REG_TYPE;
+	inst.sop = high_addr_reg_idx;
+	inst.reg_dst = reg_idx;
+	inst.src_reg = addr_low;
+
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_read_s);
+
 int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
 		     u16 addr_low, u16 src_reg_idx)
 {
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 8ef87e1bd03b..3f6bc0dfd5da 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -59,6 +59,7 @@ enum cmdq_code {
 	CMDQ_CODE_JUMP = 0x10,
 	CMDQ_CODE_WFE = 0x20,
 	CMDQ_CODE_EOC = 0x40,
+	CMDQ_CODE_READ_S = 0x80,
 	CMDQ_CODE_WRITE_S = 0x90,
 	CMDQ_CODE_WRITE_S_MASK = 0x91,
 	CMDQ_CODE_LOGIC = 0xa0,
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index ca9c75fd8125..40fe1eb52190 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -104,6 +104,18 @@ struct cmdq_client *cmdq_mbox_create(struct device *dev, int index,
 int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
 			u16 offset, u32 value, u32 mask);
 
+/*
+ * cmdq_pkt_read_s() - append read_s command to the CMDQ packet
+ * @pkt:	the CMDQ packet
+ * @high_addr_reg_idx:	internal register ID which contains high address of pa
+ * @addr_low:	low address of pa
+ * @reg_idx:	the CMDQ internal register ID to cache read data
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx, u16 addr_low,
+		    u16 reg_idx);
+
 /**
  * cmdq_pkt_write_s() - append write_s command to the CMDQ packet
  * @pkt:	the CMDQ packet
-- 
1.7.9.5
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
