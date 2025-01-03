Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EF9A00524
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 08:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5456D10E190;
	Fri,  3 Jan 2025 07:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="KP1iPlWq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0195110E190
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 07:34:34 +0000 (UTC)
X-UUID: 2ab5a3e4c9a511efbd192953cf12861f-20250103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=cMDSCtGjZWJsWp0VLSuytv75YuoxhvMH+zr0NBthYg4=; 
 b=KP1iPlWqnO5mgSAAyfLGAG8Xi3QjSIpMirvZuj4k4POPhoy3gstCpR/oYVeHq7XXKgDUEo2pSeHmRCuDRz6m4q2xE14dw/DIomQUPJOt0Puq/SQdhw2NcgnfmZRppQLvp8lpsi0zLBJtrwu0qo2VDUuXIvUAH+D/hlL4ZUPz1+E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:6fce66d8-47c6-41e3-8e29-bdc1ee9dff96, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:236c4d37-e11c-4c1a-89f7-e7a032832c40,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
 l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 2ab5a3e4c9a511efbd192953cf12861f-20250103
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2142198021; Fri, 03 Jan 2025 15:34:29 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Jan 2025 15:34:28 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Jan 2025 15:34:27 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <simona@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <ck.hu@mediatek.com>,
 <msp@baylibre.com>, <granquet@baylibre.com>, <dmitry.osipenko@collabora.com>, 
 <rex-bc.chen@mediatek.com>, <jitao.shi@mediatek.com>,
 <mac.shen@mediatek.com>, <peng.liu@mediatek.com>,
 <liankun.yang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/1] drm/mediatek: Add return value check when reading DPCD
Date: Fri, 3 Jan 2025 15:33:22 +0800
Message-ID: <20250103073425.28615-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Returns the number of bytes transferred (1) on success.
Check the return value to confirm that AUX communication is successful.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
Changes in V4:
- Fix IF judgement condition.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20241218113448.2992-1-liankun.yang@mediatek.com/

Changes in V3:
- Using drm_dp_read_sink_count() to improve patch.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20241128030940.25657-1-liankun.yang@mediatek.com/

Changes in V2:
- Modify Fixes in Commit Message.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240930092000.5385-1-liankun.yang@mediatek.com/
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 36713c176cfc..b8e4e9a6eb78 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2100,7 +2100,6 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 	enum drm_connector_status ret = connector_status_disconnected;
 	bool enabled = mtk_dp->enabled;
-	u8 sink_count = 0;
 
 	if (!mtk_dp->train_info.cable_plugged_in)
 		return ret;
@@ -2115,8 +2114,8 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	 * function, we just need to check the HPD connection to check
 	 * whether we connect to a sink device.
 	 */
-	drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
-	if (DP_GET_SINK_COUNT(sink_count))
+
+	if (drm_dp_read_sink_count(&mtk_dp->aux) > 0)
 		ret = connector_status_connected;
 
 	if (!enabled)
-- 
2.45.2

