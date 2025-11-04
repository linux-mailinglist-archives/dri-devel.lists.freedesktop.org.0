Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CE0C301DC
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 10:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A4B10E596;
	Tue,  4 Nov 2025 09:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="mWaP5HOI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6581410E590
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 09:00:10 +0000 (UTC)
X-UUID: a6cd5146b95c11f0b33aeb1e7f16c2b6-20251104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EFMzCk1paJ9NcqfOsnEwrxiB8ulWofvWjGo/w1p9HJU=; 
 b=mWaP5HOI8g+Oku6mV2AaaAfUFtNTaqkm8zTqLWqAmmDQJg7wOjZXvjH9JX7N6g811yXz743EgXJ9U8MNnkzVuwiUKd2BSF7kEqQwV8QB9ngILkStalgh0NmBHbfsFCgAv9AZaYbjdF/YB5p4mGIdJEVH8u7qT0hqTjx/cz5VOU8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:cfa40ccd-9ba3-4214-a5f0-e4550c84d28e, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:28121de0-3890-4bb9-a90e-2a6a4ecf6c66,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
 I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a6cd5146b95c11f0b33aeb1e7f16c2b6-20251104
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1688992907; Tue, 04 Nov 2025 17:00:03 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 4 Nov 2025 17:00:01 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 4 Nov 2025 17:00:00 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <simona@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <mac.shen@mediatek.com>,
 <peng.liu@mediatek.com>, <liankun.yang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 2/2] drm/mediatek: Add isolation to edp
Date: Tue, 4 Nov 2025 16:55:12 +0800
Message-ID: <20251104085957.1175-3-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251104085957.1175-1-liankun.yang@mediatek.com>
References: <20251104085957.1175-1-liankun.yang@mediatek.com>
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

Because edp doesn't expect any (un)plug events during runtime and
its process differs from DP. Therefore, it is necessary to isolate
the parsing capability, panel power, training state and enable state.

And DP related behaviors are adjusted to execute in the second half
of the interrupt.
For DP details, see drm/mediatek: Adjust bandwidth limit for DP

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 37 +++++++++++++++----------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 0ba2c208811c..efd4c45985ca 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2187,7 +2187,8 @@ static const struct drm_edid *mtk_dp_edid_read(struct drm_bridge *bridge,
 	 * Parse capability here to let atomic_get_input_bus_fmts and
 	 * mode_valid use the capability to calculate sink bitrates.
 	 */
-	if (mtk_dp_parse_capabilities(mtk_dp)) {
+	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP &&
+	    mtk_dp_parse_capabilities(mtk_dp)) {
 		drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
 		drm_edid_free(drm_edid);
 		drm_edid = NULL;
@@ -2385,13 +2386,15 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
-	mtk_dp_aux_panel_poweron(mtk_dp, true);
+	if (mtk_dp->data->bridge_type == DRM_MODE_CONNECTOR_eDP) {
+		mtk_dp_aux_panel_poweron(mtk_dp, true);
 
-	/* Training */
-	ret = mtk_dp_training(mtk_dp);
-	if (ret) {
-		drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
-		goto power_off_aux;
+		/* Training */
+		ret = mtk_dp_training(mtk_dp);
+		if (ret) {
+			drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
+			goto power_off_aux;
+		}
 	}
 
 	ret = mtk_dp_video_config(mtk_dp);
@@ -2411,7 +2414,9 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		       sizeof(mtk_dp->info.audio_cur_cfg));
 	}
 
-	mtk_dp->enabled = true;
+	if (mtk_dp->data->bridge_type == DRM_MODE_CONNECTOR_eDP)
+		mtk_dp->enabled = true;
+
 	mtk_dp_update_plugged_status(mtk_dp);
 
 	return;
@@ -2426,21 +2431,15 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 
-	mtk_dp->enabled = false;
+	if (mtk_dp->data->bridge_type == DRM_MODE_CONNECTOR_eDP) {
+		mtk_dp->enabled = false;
+		mtk_dp_aux_panel_poweron(mtk_dp, false);
+	}
+
 	mtk_dp_update_plugged_status(mtk_dp);
 	mtk_dp_video_enable(mtk_dp, false);
 	mtk_dp_audio_mute(mtk_dp, true);
 
-	if (mtk_dp->train_info.cable_plugged_in) {
-		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
-		usleep_range(2000, 3000);
-	}
-
-	/* power off aux */
-	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
-			   DP_PWR_STATE_BANDGAP_TPLL,
-			   DP_PWR_STATE_MASK);
-
 	/* SDP path reset sw*/
 	mtk_dp_sdp_path_reset(mtk_dp);
 
-- 
2.45.2

