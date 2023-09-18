Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E1D7A52EE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 21:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7871010E2CB;
	Mon, 18 Sep 2023 19:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18A110E2CF
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 19:22:15 +0000 (UTC)
X-UUID: a913b620565811eea33bb35ae8d461a2-20230919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6IIBBJBJ63SFZZQA5wr9GdzT8XSzEgNVr+5DsHu+xEU=; 
 b=aMy1o9RBeaZvCjJe+2/8hCxx/3Ld9W7MWguFIbZUBGLOH32vvdGRnk/RKMl+Jqf8Pw8zl9HxPoBE19xSv6QzMubhFPl30DJB+jKf3bU7zWNRMj1cw945EMNBXTO1VVpAbaQR5XIcI0JHlQNQWIsu1SeABzk/rVARIxUxzGk4FUc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:14561841-563b-4853-a55d-3118eff50011, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:f89a2bc3-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a913b620565811eea33bb35ae8d461a2-20230919
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 342932200; Tue, 19 Sep 2023 03:22:08 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 03:22:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 03:22:06 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 04/15] soc: mailbox: Add cmdq_pkt_logic_command to support
 math operation
Date: Tue, 19 Sep 2023 03:21:53 +0800
Message-ID: <20230918192204.32263-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.806100-8.000000
X-TMASE-MatchedRID: wDTc/wNgEcM7GQ7VM/DlUU0IfQOJvRLRQKuv8uQBDjr7efdnqtsaExFx
 R5JQAS6O09NQNrxIpFbaGEeUNUEoVATsy5Ctk/ajpLS2yK6GQKOXYX34rFl3xxUZTfM00s4+tTD
 LZLR3mBE84GeYDGFPpnegIXkiA/apHxPMjOKY7A8LbigRnpKlKZvjAepGmdoOHtpbiBM+IIWdIL
 j3dG0of6jhxFuDFdR1OdcuU4zixecSmoBX6S8VpM2u57DRRyzIbp8JiPR3CoLqvNGbk5Dc0TT8a
 /G/YAmESZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvrHlT8euJ0YHKn7N1oOA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.806100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E194136FE2D2C764BB295C6E61B169B8D069091474C886F8D2C7D4D91EB050D62000:8
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

Add cmdq_pkt_logic_command to support match operation.

cmdq_pkt_logic_command can append logic command to the CMDQ packet,
ask GCE to execute a arithematic calculate instruction,
such as add, subtract, multiply, AND, OR and NOT, etc.

Note that all instructions just accept unsigned calculate.
If there are any overflows, GCE will sent the invalid IRQ to notify
CMDQ driver.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 36 ++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  | 41 ++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index b0cd071c4719..5194d66dfc0a 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -13,9 +13,18 @@
 #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
 #define CMDQ_POLL_ENABLE_MASK	BIT(0)
 #define CMDQ_EOC_IRQ_EN		BIT(0)
+#define CMDQ_IMMEDIATE_VALUE	0
 #define CMDQ_REG_TYPE		1
 #define CMDQ_JUMP_RELATIVE	1
 
+#define CMDQ_OPERAND_GET_IDX_VALUE(operand) \
+	({ \
+		struct cmdq_operand *op = operand; \
+		op->reg ? op->idx : op->value; \
+	})
+#define CMDQ_OPERAND_TYPE(operand) \
+	((operand)->reg ? CMDQ_REG_TYPE : CMDQ_IMMEDIATE_VALUE)
+
 struct cmdq_instruction {
 	union {
 		u32 value;
@@ -380,6 +389,33 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
 }
 EXPORT_SYMBOL(cmdq_pkt_poll_mask);
 
+int cmdq_pkt_logic_command(struct cmdq_pkt *pkt, enum CMDQ_LOGIC_ENUM s_op,
+			   u16 result_reg_idx,
+			   struct cmdq_operand *left_operand,
+			   struct cmdq_operand *right_operand)
+{
+	struct cmdq_instruction inst = { {0} };
+	u32 left_idx_value;
+	u32 right_idx_value;
+
+	if (!left_operand || !right_operand)
+		return -EINVAL;
+
+	left_idx_value = CMDQ_OPERAND_GET_IDX_VALUE(left_operand);
+	right_idx_value = CMDQ_OPERAND_GET_IDX_VALUE(right_operand);
+	inst.op = CMDQ_CODE_LOGIC;
+	inst.dst_t = CMDQ_REG_TYPE;
+	inst.src_t = CMDQ_OPERAND_TYPE(left_operand);
+	inst.arg_c_t = CMDQ_OPERAND_TYPE(right_operand);
+	inst.sop = s_op;
+	inst.arg_c = right_idx_value;
+	inst.src_reg = left_idx_value;
+	inst.reg_dst = result_reg_idx;
+
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_logic_command);
+
 int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 {
 	struct cmdq_instruction inst = {};
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index f49ca8bd58e8..40e6f3097319 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -21,6 +21,30 @@
 
 struct cmdq_pkt;
 
+enum CMDQ_LOGIC_ENUM {
+	CMDQ_LOGIC_ASSIGN = 0,
+	CMDQ_LOGIC_ADD = 1,
+	CMDQ_LOGIC_SUBTRACT = 2,
+	CMDQ_LOGIC_MULTIPLY = 3,
+	CMDQ_LOGIC_XOR = 8,
+	CMDQ_LOGIC_NOT = 9,
+	CMDQ_LOGIC_OR = 10,
+	CMDQ_LOGIC_AND = 11,
+	CMDQ_LOGIC_LEFT_SHIFT = 12,
+	CMDQ_LOGIC_RIGHT_SHIFT = 13,
+};
+
+struct cmdq_operand {
+	/* register type */
+	bool reg;
+	union {
+		/* index */
+		u16 idx;
+		/* value */
+		u16 value;
+	};
+};
+
 struct cmdq_client_reg {
 	u8 subsys;
 	u16 offset;
@@ -239,6 +263,23 @@ int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
 int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
 		       u16 offset, u32 value, u32 mask);
 
+/**
+ * cmdq_pkt_logic_command() - Append logic command to the CMDQ packet, ask GCE to
+ *		          execute an instruction that store the result of logic operation
+ *		          with left and right operand into result_reg_idx.
+ * @pkt:		the CMDQ packet
+ * @s_op:		the logic operator enum
+ * @result_reg_idx:	SPR index that store operation result of left_operand and right_operand
+ * @left_operand:	left operand
+ * @right_operand:	right operand
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_logic_command(struct cmdq_pkt *pkt, enum CMDQ_LOGIC_ENUM s_op,
+			   u16 result_reg_idx,
+			   struct cmdq_operand *left_operand,
+			   struct cmdq_operand *right_operand);
+
 /**
  * cmdq_pkt_assign() - Append logic assign command to the CMDQ packet, ask GCE
  *		       to execute an instruction that set a constant value into
-- 
2.18.0

