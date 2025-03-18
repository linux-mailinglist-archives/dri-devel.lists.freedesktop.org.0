Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD965A675D1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 15:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9464F10E490;
	Tue, 18 Mar 2025 14:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="K6uxwC5q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE33C10E490
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 14:02:54 +0000 (UTC)
X-UUID: ae631046040111f0aae1fd9735fae912-20250318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=n1N1uor0+xs1/4OgUrk3Wvc3O6AFf/tYcx3ythp+XII=; 
 b=K6uxwC5qWU2y7xkv1Cf1z0vDAEh7AYyqm+nmMlh6BqaEHL49+zEDwXibTo/qpQrpEXkQD09BTk5y/99jvG3okJJA44fBDCfyVL2ECzfB6XSWXYQFmqIZxs+WHgLeIDdrUcu2bPYhI/e4U019b/Mz/ilf5DXQc7lZAHhcmrJ124Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:5e62f628-c1ea-4736-9622-37cba7915dc5, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:b8d3878c-f5b8-47d5-8cf3-b68fe7530c9a,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: ae631046040111f0aae1fd9735fae912-20250318
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1992630280; Tue, 18 Mar 2025 22:02:51 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 18 Mar 2025 22:02:50 +0800
Received: from mszsdclx1211.gcn.mediatek.inc (10.16.7.31) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 18 Mar 2025 22:02:49 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <simona@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
 <mac.shen@mediatek.com>, <peng.liu@mediatek.com>,
 <liankun.yang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/1] drm/mediatek: Adjust bandwidth limit for DP
Date: Tue, 18 Mar 2025 22:02:21 +0800
Message-ID: <20250318140236.13650-2-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250318140236.13650-1-liankun.yang@mediatek.com>
References: <20250318140236.13650-1-liankun.yang@mediatek.com>
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

By adjusting the order of link training and relocating it to HPD,
link training can identify the usability of each lane in the current link.

It also supports handling signal instability and weakness due to
environmental issues, enabling the acquisition of a stable bandwidth
for the current link. Subsequently, DP work can proceed based on
the actual maximum bandwidth.

It should training in the hpd event thread.
Check the mode with lane count and link rate of training.

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
Change in V3:
- Remove 'mtk_dp->enabled = false" in atomic disable.
- Remove 'mtk_dp->enabled = true" in atomic enable.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20241025083036.8829-4-liankun.yang@mediatek.com/

Change in V2:
- Adjust DP training timing.
- Adjust parse capabilities timing.
- Add power on/off for connect/disconnect.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240315015233.2023-1-liankun.yang@mediatek.com/
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 39 ++++++++++++++++---------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 3d4648d2e15f..fb76fc1bf497 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1976,6 +1976,7 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 	struct mtk_dp *mtk_dp = dev;
 	unsigned long flags;
 	u32 status;
+	int ret;
 
 	if (mtk_dp->need_debounce && mtk_dp->train_info.cable_plugged_in)
 		msleep(100);
@@ -1994,9 +1995,28 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 			memset(&mtk_dp->info.audio_cur_cfg, 0,
 			       sizeof(mtk_dp->info.audio_cur_cfg));
 
+			mtk_dp->enabled = false;
+			/* power off aux */
+			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+			       DP_PWR_STATE_BANDGAP_TPLL,
+			       DP_PWR_STATE_MASK);
+
 			mtk_dp->need_debounce = false;
 			mod_timer(&mtk_dp->debounce_timer,
 				  jiffies + msecs_to_jiffies(100) - 1);
+		} else {
+			mtk_dp_aux_panel_poweron(mtk_dp, true);
+
+			ret = mtk_dp_parse_capabilities(mtk_dp);
+			if (ret)
+				drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
+
+			/* Training */
+			ret = mtk_dp_training(mtk_dp);
+			if (ret)
+				drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
+
+			mtk_dp->enabled = true;
 		}
 	}
 
@@ -2162,16 +2182,6 @@ static const struct drm_edid *mtk_dp_edid_read(struct drm_bridge *bridge,
 
 	drm_edid = drm_edid_read_ddc(connector, &mtk_dp->aux.ddc);
 
-	/*
-	 * Parse capability here to let atomic_get_input_bus_fmts and
-	 * mode_valid use the capability to calculate sink bitrates.
-	 */
-	if (mtk_dp_parse_capabilities(mtk_dp)) {
-		drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
-		drm_edid_free(drm_edid);
-		drm_edid = NULL;
-	}
-
 	if (drm_edid) {
 		/*
 		 * FIXME: get rid of drm_edid_raw()
@@ -2365,13 +2375,6 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	mtk_dp_aux_panel_poweron(mtk_dp, true);
 
-	/* Training */
-	ret = mtk_dp_training(mtk_dp);
-	if (ret) {
-		drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
-		goto power_off_aux;
-	}
-
 	ret = mtk_dp_video_config(mtk_dp);
 	if (ret)
 		goto power_off_aux;
@@ -2389,7 +2392,6 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		       sizeof(mtk_dp->info.audio_cur_cfg));
 	}
 
-	mtk_dp->enabled = true;
 	mtk_dp_update_plugged_status(mtk_dp);
 
 	return;
@@ -2404,7 +2406,6 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 
-	mtk_dp->enabled = false;
 	mtk_dp_update_plugged_status(mtk_dp);
 	mtk_dp_video_enable(mtk_dp, false);
 	mtk_dp_audio_mute(mtk_dp, true);
-- 
2.45.2

