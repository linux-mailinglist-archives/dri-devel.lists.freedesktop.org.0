Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D739EC324
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 04:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C64210EA4B;
	Wed, 11 Dec 2024 03:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="MK2FNaR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7F210EA4A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 03:23:07 +0000 (UTC)
X-UUID: 39cfd13ab76f11ef99858b75a2457dd9-20241211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XXYbZaarLcOFWSwit2AJs5GzodrHS17+95EDCQbDaJk=; 
 b=MK2FNaR6gOUNiXx7D2effV2Vmhn5YBYgTNBuUuu38g0UMx6RA535eGAcXyBa5pGZEJjtzqhNCqYm3o8e2qA8vrLIsO2iQowMWwLdMBJzdWgYPGgmUk0CYW3V4/2LC2XfPKJRcpj1BLSvj25/11GN/an7vlGP5HGqFxrdypyLymQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:9f4a2da2-409b-4980-afa9-4f39ed5cf47f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:60532dc1-1c82-4420-82d9-d6eb228f5c4a,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
 :nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 39cfd13ab76f11ef99858b75a2457dd9-20241211
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1853415402; Wed, 11 Dec 2024 11:23:01 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Dec 2024 11:22:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Dec 2024 11:22:59 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho
 <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 8/8] media: mediatek: mdp3: Add programming flow for
 unsupported subsys ID hardware
Date: Wed, 11 Dec 2024 11:22:56 +0800
Message-ID: <20241211032256.28494-9-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
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

To support hardware without subsys IDs on new SoCs, add a programming
flow that checks whether the subsys ID is valid. If the subsys ID is
invalid, the flow will call 2 alternative CMDQ APIs:
cmdq_pkt_assign() and cmdq_pkt_write_s_mask_value() to achieve the
same functionality.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 26 ++++++++++--
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    | 41 +++++++++++++++----
 2 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index df0ab338ef41..58beeffd3fdf 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -320,9 +320,18 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 		return ret;
 	/* Enable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
+		struct cmdq_client *cl = (struct cmdq_client *)cmd->pkt.cl;
+
 		set = &ctrl->sets[index];
-		cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
-				    set->value, 0xFFFFFFFF);
+		if (cmdq_subsys_is_valid(cl->chan, set->subsys_id)) {
+			cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
+					    set->value, 0xFFFFFFFF);
+		} else {
+			/* only MMIO access, no need to check mminfro_offset */
+			cmdq_pkt_assign(&cmd->pkt, 0, CMDQ_ADDR_HIGH(set->reg));
+			cmdq_pkt_write_s_mask_value(&cmd->pkt, 0, CMDQ_ADDR_LOW(set->reg),
+						    set->value, 0xFFFFFFFF);
+		}
 	}
 	/* Config sub-frame information */
 	for (index = (num_comp - 1); index >= 0; index--) {
@@ -376,9 +385,18 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	}
 	/* Disable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
+		struct cmdq_client *cl = (struct cmdq_client *)cmd->pkt.cl;
+
 		set = &ctrl->sets[index];
-		cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
-				    0, 0xFFFFFFFF);
+		if (cmdq_subsys_is_valid(cl->chan, set->subsys_id)) {
+			cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
+					    0, 0xFFFFFFFF);
+		} else {
+			/* only MMIO access, no need to check mminfro_offset */
+			cmdq_pkt_assign(&cmd->pkt, 0, CMDQ_ADDR_HIGH(set->reg));
+			cmdq_pkt_write_s_mask_value(&cmd->pkt, 0, CMDQ_ADDR_LOW(set->reg),
+						    0, 0xFFFFFFFF);
+		}
 	}
 
 	return 0;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index 3e5d2da1c807..f6c041934779 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -9,9 +9,25 @@
 
 #include "mtk-mdp3-cmdq.h"
 
-#define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask, ...)	\
-	cmdq_pkt_write_mask(&((cmd)->pkt), id,			\
-		(base) + (ofst), (val), (mask), ##__VA_ARGS__)
+#define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask, ...)				\
+do {											\
+	typeof(cmd) (_cmd) = (cmd);							\
+	typeof(id) (_id) = (id);							\
+	typeof(base) (_base) = (base);							\
+	typeof(ofst) (_ofst) = (ofst);							\
+	typeof(val) (_val) = (val);							\
+	typeof(mask) (_mask) = (mask);							\
+	if (cmdq_subsys_is_valid(((struct cmdq_client *)_cmd->pkt.cl)->chan, _id)) {	\
+		cmdq_pkt_write_mask(&_cmd->pkt, _id, _base + _ofst, _val,		\
+				    _mask, ##__VA_ARGS__);				\
+	} else {									\
+		/* only MMIO access, no need to check mminfro_offset */			\
+		cmdq_pkt_assign(&_cmd->pkt, 0, CMDQ_ADDR_HIGH(_base));			\
+		cmdq_pkt_write_s_mask_value(&_cmd->pkt, 0,				\
+					    CMDQ_ADDR_LOW(_base + _ofst), _val,		\
+					    _mask, ##__VA_ARGS__);			\
+	}										\
+} while (0)
 
 #define MM_REG_WRITE(cmd, id, base, ofst, val, mask, ...)	\
 do {								\
@@ -49,11 +65,20 @@ do {								\
 	cmdq_pkt_set_event(&((c)->pkt), (e));			\
 } while (0)
 
-#define MM_REG_POLL_MASK(cmd, id, base, ofst, val, _mask, ...)	\
-do {								\
-	typeof(_mask) (_m) = (_mask);				\
-	cmdq_pkt_poll_mask(&((cmd)->pkt), id,			\
-		(base) + (ofst), (val), (_m), ##__VA_ARGS__);	\
+#define MM_REG_POLL_MASK(cmd, id, base, ofst, val, _mask, ...)				\
+do {											\
+	typeof(cmd) (_cmd) = (cmd);							\
+	typeof(id) (_id) = (id);							\
+	typeof(base) (_base) = (base);							\
+	typeof(ofst) (_ofst) = (ofst);							\
+	typeof(val) (_val) = (val);							\
+	typeof(_mask) (_m) = (_mask);							\
+	if (cmdq_subsys_is_valid(((struct cmdq_client *)_cmd->pkt.cl)->chan, _id))	\
+		cmdq_pkt_poll_mask(&_cmd->pkt, _id, _base + _ofst, _val,		\
+				   _m, ##__VA_ARGS__);					\
+	else										\
+		cmdq_pkt_poll_addr(&_cmd->pkt, _base + _ofst, _val,			\
+				   _m, ##__VA_ARGS__);					\
 } while (0)
 
 #define MM_REG_POLL(cmd, id, base, ofst, val, mask, ...)	\
-- 
2.43.0

