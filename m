Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AE87853B9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 11:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADECA10E3F2;
	Wed, 23 Aug 2023 09:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5856010E3F2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 09:20:41 +0000 (UTC)
X-UUID: 514216f2419611ee9cb5633481061a41-20230823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=uetrbrfWrgD400OH1ojtvDiq8JdXohR2zwXYZOz9U4I=; 
 b=EaTd+3oXhGAg3ImJSZ03o5sJ8bG3Cyn++9YVsciV0iUqNvxSdekYi5RbAFD1KdB2GId1fedJ1cxd7eeRX8kHyz/oYVUOoiEeUG9p0eu9NBapcTlwMrH2wVbNCQuzY0lGIxUA5t/5P4E5STfEIixsJpXq3yNdba5TbocLJ40vBYw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:c8c4894b-af02-4e88-b8e9-0876ce9f5bb6, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.31, REQID:c8c4894b-af02-4e88-b8e9-0876ce9f5bb6, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:0ad78a4, CLOUDID:c996a81f-33fd-4aaa-bb43-d3fd68d9d5ae,
 B
 ulkID:23082317203649PNTAB8,BulkQuantity:1,Recheck:0,SF:38|29|28|17|19|48,T
 C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
 :0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SDM, TF_CID_SPAM_ASC, TF_CID_SPAM_FAS,
 TF_CID_SPAM_FSD, TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 514216f2419611ee9cb5633481061a41-20230823
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <shuijing.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 513278503; Wed, 23 Aug 2023 17:20:35 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Aug 2023 17:20:34 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Aug 2023 17:20:34 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] drm/mediatek: dsi: Add mode_valid callback to DSI bridge
Date: Wed, 23 Aug 2023 17:20:47 +0800
Message-ID: <20230823092047.32258-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Shuijing Li <shuijing.li@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support IGT (Intel GPU Tools) in Mediatek DSI driver.
According to the description of MIPI Alliance Specification for D-PHY 
Version 1.1, the maximum supported data rate is 1.5Gbps, so add mode_valid
callback to dsi bridge to filter out the data rate exceeding the
Specification.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
---
Changes in v2:
Correct descriptions of title and commit message.
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 7d5250351193..a494e04f0ddf 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -806,6 +806,25 @@ static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	mtk_dsi_poweroff(dsi);
 }
 
+static enum drm_mode_status
+mtk_dsi_bridge_mode_valid(struct drm_bridge *bridge,
+			  const struct drm_display_info *info,
+			  const struct drm_display_mode *mode)
+{
+	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
+	u32 bpp;
+
+	if (dsi->format == MIPI_DSI_FMT_RGB565)
+		bpp = 16;
+	else
+		bpp = 24;
+
+	if (mode->clock * bpp / dsi->lanes > 1500000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.attach = mtk_dsi_bridge_attach,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -815,6 +834,7 @@ static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
 	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.mode_valid = mtk_dsi_bridge_mode_valid,
 	.mode_set = mtk_dsi_bridge_mode_set,
 };
 
-- 
2.40.1

