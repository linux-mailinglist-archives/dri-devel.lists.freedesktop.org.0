Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79FA732906
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 09:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8837010E5BF;
	Fri, 16 Jun 2023 07:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B5210E0B0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 07:36:46 +0000 (UTC)
X-UUID: 890ab7b40c1811ee9cb5633481061a41-20230616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hSlQPaorM1P9B2NSyWEK4oYVFDuqaVKAFs4EBFP55OY=; 
 b=WTiJcthb1wuxnUUmdcBos7MH5qSWiv/HKk60YvQ7FhzYKpCCrzELa0ppzL2+f99pDOZWuyWqo2kQB3XbNXCaf55FAC3VbFhImieDhxlrywsXPsbqfE+6n6vbU7vHK4aZPS7huNRgy73la5jmZdnOLHPdKPfmNmseAEe4YOYjgKw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26, REQID:1e526910-c1cb-48a2-8fd4-91d9423821ca, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:cb9a4e1, CLOUDID:ba3bd23e-7aa7-41f3-a6bd-0433bee822f3,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 890ab7b40c1811ee9cb5633481061a41-20230616
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <shuijing.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 78709751; Fri, 16 Jun 2023 15:36:41 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 16 Jun 2023 15:36:40 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 16 Jun 2023 15:36:39 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
Subject: [PATCH v2,
 3/3] drm/mediatek: dsi: Add dsi cmdq_ctl to send panel initial code
Date: Fri, 16 Jun 2023 15:36:59 +0800
Message-ID: <20230616073659.26536-4-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616073659.26536-1-shuijing.li@mediatek.com>
References: <20230616073659.26536-1-shuijing.li@mediatek.com>
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
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Shuijing Li <shuijing.li@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For mt8188, add dsi cmdq reg control to send long packets to panel
initialization.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
Changes in v2:
use mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE_SEL, CMDQ_SIZE_SEL); directly,
per suggestion from the previous thread:
https://lore.kernel.org/lkml/015f4c60-ed77-9e1f-8a6b-cda6e4f6ac93@gmail.com/
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 500a3054282d..8b43d9f48178 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -86,6 +86,7 @@
 
 #define DSI_CMDQ_SIZE		0x60
 #define CMDQ_SIZE			0x3f
+#define CMDQ_SIZE_SEL			BIT(15)
 
 #define DSI_HSTX_CKL_WC		0x64
 
@@ -178,6 +179,7 @@ struct mtk_dsi_driver_data {
 	const u32 reg_cmdq_off;
 	bool has_shadow_ctl;
 	bool has_size_ctl;
+	bool cmdq_long_packet_ctl;
 };
 
 struct mtk_dsi {
@@ -996,6 +998,8 @@ static void mtk_dsi_cmdq(struct mtk_dsi *dsi, const struct mipi_dsi_msg *msg)
 
 	mtk_dsi_mask(dsi, reg_cmdq_off, cmdq_mask, reg_val);
 	mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE, cmdq_size);
+	if (dsi->driver_data->cmdq_long_packet_ctl)
+		mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE_SEL, CMDQ_SIZE_SEL);
 }
 
 static ssize_t mtk_dsi_host_send_cmd(struct mtk_dsi *dsi,
@@ -1200,18 +1204,21 @@ static const struct mtk_dsi_driver_data mt8183_dsi_driver_data = {
 	.reg_cmdq_off = 0x200,
 	.has_shadow_ctl = true,
 	.has_size_ctl = true,
+	.cmdq_long_packet_ctl = false,
 };
 
 static const struct mtk_dsi_driver_data mt8186_dsi_driver_data = {
 	.reg_cmdq_off = 0xd00,
 	.has_shadow_ctl = true,
 	.has_size_ctl = true,
+	.cmdq_long_packet_ctl = false,
 };
 
 static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
 	.reg_cmdq_off = 0xd00,
 	.has_shadow_ctl = true,
 	.has_size_ctl = true,
+	.cmdq_long_packet_ctl = true,
 };
 
 static const struct of_device_id mtk_dsi_of_match[] = {
-- 
2.40.1

