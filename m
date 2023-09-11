Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DEA79A7D8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 14:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3392E10E2D9;
	Mon, 11 Sep 2023 12:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B2710E096
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 12:07:52 +0000 (UTC)
X-UUID: d1d8ff6a509b11eea33bb35ae8d461a2-20230911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vo2+Ht37rnzqncUjP5jQLU3n66LjuW5bTm8lsUZgRBs=; 
 b=cxjUr8GVZQ/7AK54Bk5oI274CX1haREkAjeEh3Db+TidObOT4GOkW9gYdK4DLL1FKQ39BOAoGC2jseNdmBuJznCXBRZMkBKNPVhidlGKoG1noHYhCKL1gpK00/EJ+L5e2PF5COI0go992Uhcnek3aqEFDwpDb8yGYUiLvY1ZUVw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:f52b5986-b4fe-48e9-ab8e-0c5296812f8a, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:0ad78a4, CLOUDID:bd71e4c2-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d1d8ff6a509b11eea33bb35ae8d461a2-20230911
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <shuijing.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2032066479; Mon, 11 Sep 2023 20:07:46 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 20:07:45 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 20:07:44 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
Subject: [PATCH v4,
 2/3] drm/mediatek: dsi: Add dsi cmdq_ctl to send panel initial code
Date: Mon, 11 Sep 2023 20:07:59 +0800
Message-ID: <20230911120800.17369-3-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230911120800.17369-1-shuijing.li@mediatek.com>
References: <20230911120800.17369-1-shuijing.li@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Shuijing Li <shuijing.li@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For mt8188, add dsi cmdq reg control to send long packets to panel
initialization. MT8188 hardware has been changed to automatically
set the cmdq_size value by default when sending long packets.
In this patch, the cmdq_size value is set manually instead.
Remain consistent with previous IC.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes in v4:
Add a comment per suggestion from the previous thread:
https://lore.kernel.org/all/14e03873-3723-8293-0190-445a71828b25@collabora.com/
Changes in v3:
reorder patch 2/3 and 3/3, and describe more about why mt8188 need this
patch,
per suggestion from the previous thread:
https://lore.kernel.org/lkml/411ddbf95e2c2298b84899065691d478069ec273.camel@mediatek.com/
Changes in v2:
use mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE_SEL, CMDQ_SIZE_SEL); directly,
per suggestion from the previous thread:
https://lore.kernel.org/lkml/015f4c60-ed77-9e1f-8a6b-cda6e4f6ac93@gmail.com/
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d8bfc2cce54d..623aa829ef6b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -86,6 +86,7 @@
 
 #define DSI_CMDQ_SIZE		0x60
 #define CMDQ_SIZE			0x3f
+#define CMDQ_SIZE_SEL		BIT(15)
 
 #define DSI_HSTX_CKL_WC		0x64
 
@@ -178,6 +179,7 @@ struct mtk_dsi_driver_data {
 	const u32 reg_cmdq_off;
 	bool has_shadow_ctl;
 	bool has_size_ctl;
+	bool cmdq_long_packet_ctl;
 };
 
 struct mtk_dsi {
@@ -996,6 +998,10 @@ static void mtk_dsi_cmdq(struct mtk_dsi *dsi, const struct mipi_dsi_msg *msg)
 
 	mtk_dsi_mask(dsi, reg_cmdq_off, cmdq_mask, reg_val);
 	mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE, cmdq_size);
+	if (dsi->driver_data->cmdq_long_packet_ctl) {
+		/* Disable setting cmdq_size automatically for long packets */
+		mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE_SEL, CMDQ_SIZE_SEL);
+	}
 }
 
 static ssize_t mtk_dsi_host_send_cmd(struct mtk_dsi *dsi,
-- 
2.40.1

