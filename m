Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE998CD8441
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 07:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1594F10E16C;
	Tue, 23 Dec 2025 06:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="bRQXF2Yx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5110610E172
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 06:34:45 +0000 (UTC)
X-UUID: 7582fb02dfc911f08a742f2735aaa5e5-20251223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=BUdMX3RZokn+DfUSwP4bbdyZ8AJv2cnlkh2Qs0G9DkA=; 
 b=bRQXF2Yx4HELs4dUGos2I9RKALLhcElU3I1ta0sEg3XX4inbxkgG1vwnxGSgFvWRJ+afQH4GzK+lajMaj2vD9EVKGnva+MzYHnC/5R+ABidrtnO6ccPem5uzYgGaMy69zPhWi1IyOOX6FxM0OseJZHBq7O7ucJTnx+enArp3PdI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9, REQID:90bf572b-00c1-4fdf-87df-e4214e594e3d, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:5047765, CLOUDID:e995bec6-8a73-4871-aac2-7b886d064f36,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
 0,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7582fb02dfc911f08a742f2735aaa5e5-20251223
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 49064867; Tue, 23 Dec 2025 14:34:40 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 14:34:38 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 14:34:37 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <simona@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <mac.shen@mediatek.com>,
 <peng.liu@mediatek.com>, <liankun.yang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 1/1] drm/mediatek: Move DP training to hotplug thread
Date: Tue, 23 Dec 2025 14:16:52 +0800
Message-ID: <20251223061755.7717-1-liankun.yang@mediatek.com>
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

`mtk_dp_parse_capabilities` is related to DP training, it is
used in `mtk_dp_hpd_event_thread` before DP training, and then only
used by eDP when read edid.

-Modify part of in `mtk_dp_bridge_atomic_disable`
    if (mtk_dp->train_info.cable_plugged_in) {
       drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
       usleep_range(2000, 3000);
    }

    /* power off aux */
    mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
		DP_PWR_STATE_BANDGAP_TPLL,
		DP_PWR_STATE_MASK);

-Modify part of in `mtk_dp_aux_panel_poweron(mtk_dp, false);`
    if (pwron) {
       ....
    } else {
       /* power off panel */
       drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
       usleep_range(2000, 3000);

       /* power off aux */
       mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
			DP_PWR_STATE_BANDGAP_TPLL,
			DP_PWR_STATE_MASK);
    }

The `mtk_dp_aux_panel_poweron` function fails to align.
Within the `mtk_dp_hpd_event_thread`, if DP is disconnected,
the `mtk_dp_aux_panel_poweron` function will write from `aux`
to `DPRX`, causing a failure and thus preventing symmetry.

This shows the current timings after the DP cable is plugged in,
as well as the modified timings.

current timings:		Fix timings:

mtk_dp_hpd_event_thread()	mtk_dp_hpd_event_thread()
				(including DP link training)
	|				|
       ...			       ...
mtk_dp_bridge_mode_valid()	mtk_dp_bridge_mode_valid()
	|
       ...			       ...
mtk_dp_bridge_atomic_check()	mtk_dp_bridge_atomic_check()
	|
       ...			       ...
mtk_dp_bridge_atomic_enable()	mtk_dp_bridge_atomic_enable()
(including DP link training)

PS:
1. "..." represents ommited steps;

2. `mtk_dp_bridge_mode_valid()` calculates the bandwidth using the
current lane count and link rate, and then filters each mode to
determine if it supports returning a status.

3. In the `drm_display_mode_to_videomode(&crtc_state->adjusted_mode,
&mtk_dp->info.vm);` function, within the `mtk_dp_bridge_atomic_check()`
function, `adjusted_mode` sets the currently selected display mode for
the DRM.

4. DP link training tests the signal conditions of the link between
DPTX and DPRX, and selects the lane count and link rate that meet
the signal conditions.

5. For example, the platform support DP 4lane 5.4G,
but panel A support DP 2lane 5.4G.

   This is a time sequence:

   a).Plug in panel A. According to the platform, it can output 4K60Hz.
   b).Timing mode set 4K 60Hz(Including in mtk_dp_bridge_atomic_check
   function).
   c).Atomic enable(Based on panel A ability, training pass 2lane
   5.4G).
   d).Finally, due to 2lane 5.4G bandwidth limitation, the platform
   cannot output 4K 60Hz, resulting in a black sreen.

   If apply this patch.

   a).Plug in panel A.
   b).Training pass 2lane 5.4G
   c).Timing mode set 2K 60Hz(Based on the 2lane 5.4G bandwidth limit
   and including in mtk_dp_bridge_atomic_che

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
Change in V8:
- Update the commit message.
- Update the commit title.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20251104085957.1175-2-liankun.yang@mediatek.com/

Change in V7:
- Separate the edp part.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20250822120506.15486-1-liankun.yang@mediatek.com/

Change in V6:
- Fixed power on in atomic enable.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20250630080824.7107-1-liankun.yang@mediatek.com/

Change in V5:
- Fixed the issue that the 4th version of the patch caused DP to have no screen.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20250625095446.31726-1-liankun.yang@mediatek.com/

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
 drivers/gpu/drm/mediatek/mtk_dp.c | 57 ++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index b0b1e158600f..5e67dab6e2e9 100644
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
+			mtk_dp->enabled = true;
 		}
 	}
 
@@ -2168,7 +2188,8 @@ static const struct drm_edid *mtk_dp_edid_read(struct drm_bridge *bridge,
 	 * Parse capability here to let atomic_get_input_bus_fmts and
 	 * mode_valid use the capability to calculate sink bitrates.
 	 */
-	if (mtk_dp_parse_capabilities(mtk_dp)) {
+	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP &&
+	    mtk_dp_parse_capabilities(mtk_dp)) {
 		drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
 		drm_edid_free(drm_edid);
 		drm_edid = NULL;
@@ -2366,13 +2387,15 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
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
@@ -2392,7 +2415,9 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		       sizeof(mtk_dp->info.audio_cur_cfg));
 	}
 
-	mtk_dp->enabled = true;
+	if (mtk_dp->data->bridge_type == DRM_MODE_CONNECTOR_eDP)
+		mtk_dp->enabled = true;
+
 	mtk_dp_update_plugged_status(mtk_dp);
 
 	return;
@@ -2407,21 +2432,15 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
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

