Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85298178BBB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F7A6EAC4;
	Wed,  4 Mar 2020 07:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18A9D6E97D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 11:03:52 +0000 (UTC)
X-UUID: b974398f39a94f56a5065b1923579d4e-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tvJwnCsxKOoCpY4EO2ACWGPLaJ529RvRvxVs2WE/jK0=; 
 b=lOiIk3V0gvMpVTfuzTLbO7Z9tngXOcn6U5g9wUT3UX6i1Oe8utk4HPc+Zjpdmzv5zMHL9TA2ZVWUSGxvpMBd3Yj1LgIX0CN+UZ2JTxiIcV44VPVWiw8ES4uiozGBn30zhMpSdbAkKEEo7m5s/DF5bz4d7yeP5tobA6GywuEHPRg=;
X-UUID: b974398f39a94f56a5065b1923579d4e-20200303
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1075989224; Tue, 03 Mar 2020 18:58:50 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 18:57:42 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 3 Mar 2020 18:58:12 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jassi Brar
 <jassisinghbrar@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v4 13/13] soc: mediatek: cmdq: add set event function
Date: Tue, 3 Mar 2020 18:58:45 +0800
Message-ID: <1583233125-7827-14-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
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

Add set event function in cmdq helper functions to set specific event.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 15 +++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
 include/linux/soc/mediatek/mtk-cmdq.h    |  9 +++++++++
 3 files changed, 25 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 4f767198d0fc..e7cad8a4b6c6 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -326,6 +326,21 @@ int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event)
 }
 EXPORT_SYMBOL(cmdq_pkt_clear_event);
 
+int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16 event)
+{
+	struct cmdq_instruction inst = { {0} };
+
+	if (event >= CMDQ_MAX_EVENT)
+		return -EINVAL;
+
+	inst.op = CMDQ_CODE_WFE;
+	inst.value = CMDQ_WFE_UPDATE | CMDQ_WFE_UPDATE_VALUE;
+	inst.event = event;
+
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_set_event);
+
 int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
 		  u16 offset, u32 value)
 {
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 42d2a30e6a70..ba2d811183a9 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -17,6 +17,7 @@
 #define CMDQ_JUMP_PASS			CMDQ_INST_SIZE
 
 #define CMDQ_WFE_UPDATE			BIT(31)
+#define CMDQ_WFE_UPDATE_VALUE		BIT(16)
 #define CMDQ_WFE_WAIT			BIT(15)
 #define CMDQ_WFE_WAIT_VALUE		0x1
 
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index d63749440697..ca70296ae120 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -168,6 +168,15 @@ int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear);
  */
 int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event);
 
+/**
+ * cmdq_pkt_set_event() - append set event command to the CMDQ packet
+ * @pkt:	the CMDQ packet
+ * @event:	the desired event to be set
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16 event);
+
 /**
  * cmdq_pkt_poll() - Append polling command to the CMDQ packet, ask GCE to
  *		     execute an instruction that wait for a specified
-- 
2.18.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
