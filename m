Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D51AE7E28
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 11:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4C910E00F;
	Wed, 25 Jun 2025 09:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="q0MLzdob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601A410E00F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 09:54:58 +0000 (UTC)
X-UUID: 707c5ba651aa11f0b910cdf5d4d8066a-20250625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=uaERh9WXMUH50buLEjUZuWOW4z8gIJvNjLqZNnawyZ0=; 
 b=q0MLzdobaOUU30Wi1YSs7cJjdpq1nk85W+IZBN1qP5qlT7ItYf+qipztTjpwffmqw5SRB6FiAtTQw9OlNPZ2r5IRJ5Y5kwD/9Muk6HLoZgKpQiW3bSyVCArJZeYqZV1Tf5INU/CJZ/Ue16T1/fICOACaSPeBGGMtLhJK/aKdxzw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:fa43f2c9-61b6-4139-a616-e4c4e67c099c, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:9eb4ff7, CLOUDID:7e409f5f-2aa0-4c76-8faa-804d844c7164,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
 l,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
 LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 707c5ba651aa11f0b910cdf5d4d8066a-20250625
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 658317065; Wed, 25 Jun 2025 17:54:52 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 25 Jun 2025 17:54:49 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 25 Jun 2025 17:54:48 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <simona@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <mac.shen@mediatek.com>,
 <peng.liu@mediatek.com>, <liankun.yang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/1] drm/mediatek: Adjust bandwidth limit for DP
Date: Wed, 25 Jun 2025 17:54:17 +0800
Message-ID: <20250625095446.31726-1-liankun.yang@mediatek.com>
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

By adjusting the order of link training and relocating it to HPD,
link training can identify the usability of each lane in the current link.

It also supports handling signal instability and weakness due to
environmental issues, enabling the acquisition of a stable bandwidth
for the current link. Subsequently, DP work can proceed based on
the actual maximum bandwidth.

It should training in the hpd event thread.
Check the mode with lane count and link rate of training.

If we're eDP and capabilities were already parsed we can skip
reading again because eDP panels aren't hotpluggable hence the
caps and training information won't ever change in a boot life

Therefore, bridge typec judgment is required for edp training in
atomic_enable function.

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
Change in V4:
- Tested the internal eDP display on MT8195 Tomato and it is fine.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20250318140236.13650-2-liankun.yang@mediatek.com/

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
 drivers/gpu/drm/mediatek/mtk_dp.c | 42 +++++++++++++++++++------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index a5b10b2545dc..36e07954965b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1976,6 +1976,7 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 	struct mtk_dp *mtk_dp = dev;
 	unsigned long flags;
 	u32 status;
+	int ret;
 
 	if (mtk_dp->need_debounce && mtk_dp->train_info.cable_plugged_in)
 		msleep(100);
@@ -1994,9 +1995,27 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 			memset(&mtk_dp->info.audio_cur_cfg, 0,
 			       sizeof(mtk_dp->info.audio_cur_cfg));
 
+			/* power off aux */
+			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+					   DP_PWR_STATE_BANDGAP_TPLL,
+					   DP_PWR_STATE_MASK);
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
+			mtk_dp_aux_panel_poweron(mtk_dp, false);
 		}
 	}
 
@@ -2161,17 +2180,6 @@ static const struct drm_edid *mtk_dp_edid_read(struct drm_bridge *bridge,
 	}
 
 	drm_edid = drm_edid_read_ddc(connector, &mtk_dp->aux.ddc);
-
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
@@ -2366,11 +2374,13 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	mtk_dp_aux_panel_poweron(mtk_dp, true);
 
-	/* Training */
-	ret = mtk_dp_training(mtk_dp);
-	if (ret) {
-		drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
-		goto power_off_aux;
+	if (mtk_dp->data->bridge_type == DRM_MODE_CONNECTOR_eDP) {
+		/* Training */
+		ret = mtk_dp_training(mtk_dp);
+		if (ret) {
+			drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
+			goto power_off_aux;
+		}
 	}
 
 	ret = mtk_dp_video_config(mtk_dp);
-- 
2.45.2

