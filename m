Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAECA6E06BE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 08:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851C610EA2C;
	Thu, 13 Apr 2023 06:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB0D10EA2C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 06:09:38 +0000 (UTC)
X-UUID: c1501242d9c111edb6b9f13eb10bd0fe-20230413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=cooVt/7DyMIfNymQDJe2zBqzAP0xjJRI2g2y8h0vqO4=; 
 b=Htq0n6dz1KPeMU5iAX/9cGoikK/kx3m4D/XzhZfCSL5MIA0vwEFH3nABRsd9FW2qUpVAsguGkbDzE0e9J/TjUqx2nNf98miWNyMWVLSBP8RLkLzO3v9o5j6gidu/OWJznM6Tpm4fw+QAqeD3I5+soXWSCqo1oIgOg5cIxZ8Aluk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:44ef7ec6-2e05-468f-94ad-4ddd4e851da6, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:120426c, CLOUDID:3a55e983-cd9c-45f5-8134-710979e3df0e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: c1501242d9c111edb6b9f13eb10bd0fe-20230413
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 389169649; Thu, 13 Apr 2023 14:09:31 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 13 Apr 2023 14:09:29 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 13 Apr 2023 14:09:29 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>,
 <shuijing.li@mediatek.com>
Subject: [PATCH 3/3] drm/mediatek: dsi: Add dsi cmdq_ctl to send panel initial
 code
Date: Thu, 13 Apr 2023 14:09:22 +0800
Message-ID: <1681366162-4949-4-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1681366162-4949-1-git-send-email-xinlei.lee@mediatek.com>
References: <1681366162-4949-1-git-send-email-xinlei.lee@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Xinlei Lee <xinlei.lee@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xinlei Lee <xinlei.lee@mediatek.com>

For mt8188, add dsi cmdq reg control to send long packets to panel initialization.

Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 500a3054282d..cbfe5df4647c 100644
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
@@ -965,6 +967,11 @@ static u32 mtk_dsi_recv_cnt(u8 type, u8 *read_data)
 	return 0;
 }
 
+static void mtk_dsi_cmd_packet_ctl(struct mtk_dsi *dsi)
+{
+	mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE_SEL, CMDQ_SIZE_SEL);
+}
+
 static void mtk_dsi_cmdq(struct mtk_dsi *dsi, const struct mipi_dsi_msg *msg)
 {
 	const char *tx_buf = msg->tx_buf;
@@ -996,6 +1003,8 @@ static void mtk_dsi_cmdq(struct mtk_dsi *dsi, const struct mipi_dsi_msg *msg)
 
 	mtk_dsi_mask(dsi, reg_cmdq_off, cmdq_mask, reg_val);
 	mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE, cmdq_size);
+	if (dsi->driver_data->cmdq_long_packet_ctl)
+		mtk_dsi_cmd_packet_ctl(dsi);
 }
 
 static ssize_t mtk_dsi_host_send_cmd(struct mtk_dsi *dsi,
@@ -1200,18 +1209,21 @@ static const struct mtk_dsi_driver_data mt8183_dsi_driver_data = {
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
2.18.0

