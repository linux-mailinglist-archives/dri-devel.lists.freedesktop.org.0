Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899766CD23B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 08:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9559010E4B5;
	Wed, 29 Mar 2023 06:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDBB10E4B5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 06:43:36 +0000 (UTC)
X-UUID: 02ede92acdfd11edb6b9f13eb10bd0fe-20230329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=L8S2VPO1BHTRjj+EeuISd/97JupfkUS9QELUdXcrrDY=; 
 b=oEWctwD61s8RcEOAyiZKLWe2eM0v2GcUvkqL+uc1Hi42r+Pocftr5bUg6uuxsfSOZ7nzlspsrLZbPRBvmmXjyTKzhQHSltFKT1GrgpPO8UV8Ugj1QIzfBEDzpJ7sYg6q7ea7tD3gAESifkxS6QKnE8/z+7PDp4onIZdJu39Hx9Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:6b81de52-eaa9-4270-b9fd-e657dab39e8d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.22, REQID:6b81de52-eaa9-4270-b9fd-e657dab39e8d, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:120426c, CLOUDID:1e7b41f7-ddba-41c3-91d9-10eeade8eac7,
 B
 ulkID:230329144329Y8DGHL50,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
 C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
 L:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 02ede92acdfd11edb6b9f13eb10bd0fe-20230329
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 786726925; Wed, 29 Mar 2023 14:43:27 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 29 Mar 2023 14:43:26 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 29 Mar 2023 14:43:26 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
Subject: [PATCH] drm/mediatek: dp: change the aux retries times when receiving
 AUX_DEFER
Date: Wed, 29 Mar 2023 14:43:23 +0800
Message-ID: <1680072203-10394-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
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
Cc: Xinlei Lee <xinlei.lee@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xinlei Lee <xinlei.lee@mediatek.com>

DP 1.4a Section 2.8.7.1.5.6.1:
A DP Source device shall retry at least seven times upon receiving
AUX_DEFER before giving up the AUX transaction.

The drm_dp_i2c_do_msg() function in the drm_dp_helper.c file will
judge the status of the msg->reply parameter passed to aux_transfer
ange-the-aux-retries-times-when-re.patchfor different processing.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 1f94fcc144d3..767b71da31a4 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -806,10 +806,9 @@ static int mtk_dp_aux_wait_for_completion(struct mtk_dp *mtk_dp, bool is_read)
 }
 
 static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_dp, bool is_read, u8 cmd,
-				  u32 addr, u8 *buf, size_t length)
+				  u32 addr, u8 *buf, size_t length, u8 *reply_cmd)
 {
 	int ret;
-	u32 reply_cmd;
 
 	if (is_read && (length > DP_AUX_MAX_PAYLOAD_BYTES ||
 			(cmd == DP_AUX_NATIVE_READ && !length)))
@@ -841,10 +840,10 @@ static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_dp, bool is_read, u8 cmd,
 	/* Wait for feedback from sink device. */
 	ret = mtk_dp_aux_wait_for_completion(mtk_dp, is_read);
 
-	reply_cmd = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3624) &
-		    AUX_RX_REPLY_COMMAND_AUX_TX_P0_MASK;
+	*reply_cmd = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3624) &
+		     AUX_RX_REPLY_COMMAND_AUX_TX_P0_MASK;
 
-	if (ret || reply_cmd) {
+	if (ret) {
 		u32 phy_status = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3628) &
 				 AUX_RX_PHY_STATE_AUX_TX_P0_MASK;
 		if (phy_status != AUX_RX_PHY_STATE_AUX_TX_P0_RX_IDLE) {
@@ -2070,7 +2069,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 		ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
 					     msg->address + accessed_bytes,
 					     msg->buffer + accessed_bytes,
-					     to_access);
+					     to_access, &msg->reply);
 
 		if (ret) {
 			drm_info(mtk_dp->drm_dev,
@@ -2080,7 +2079,6 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 		accessed_bytes += to_access;
 	} while (accessed_bytes < msg->size);
 
-	msg->reply = DP_AUX_NATIVE_REPLY_ACK | DP_AUX_I2C_REPLY_ACK;
 	return msg->size;
 err:
 	msg->reply = DP_AUX_NATIVE_REPLY_NACK | DP_AUX_I2C_REPLY_NACK;
-- 
2.18.0

