Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFB3760BCD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF1F10E3A9;
	Tue, 25 Jul 2023 07:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED5910E3A9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 07:32:49 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A388B6607106;
 Tue, 25 Jul 2023 08:32:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690270368;
 bh=RteFl78OPAscSrhmShuyzWWjAye9KXEUFGwSstlu+Ng=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GPDWnvxC40W5D6oHk33UAE+91Bmjr2HiowKQbzMrpQoJORcYkI0j/ahwIedlxd4xU
 FMkRVJWYwJiIzSo0IYNj3aorZJ0RjWwPbHknNmwy8aK4tVwNeysyxsKGluPm6OpnHR
 PsKgHA6rkQTUtIBygZqxTL/iHM4MjcdqH5NDexJESSDoilLNxTF7szoSZwU4RSEDQA
 2q2kAwtqHSFlz3T/Gw08zzFdsgM3+IoEh4jpqwNFAQfjYGIkRZ0eXD/Dhlx+lNVHGy
 or6PPsd6c9QVjapmwlYdxilUH177tldd8vhd7CKPqShJmARq3oSXLaww4WpEpuM6wh
 ieG2+ReGv6ytw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v7 02/11] drm/mediatek: dp: Move AUX and panel poweron/off
 sequence to function
Date: Tue, 25 Jul 2023 09:32:25 +0200
Message-ID: <20230725073234.55892-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
References: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: nfraprado@collabora.com, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, ehristev@collabora.com, wenst@chromium.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Everytime we run bridge detection and/or EDID read we run a poweron
and poweroff sequence for both the AUX and the panel; moreover, this
is also done when enabling the bridge in the .atomic_enable() callback.

Move this power on/off sequence to a new mtk_dp_aux_panel_poweron()
function as to commonize it.
Note that, before this commit, in mtk_dp_bridge_atomic_enable() only
the AUX was getting powered on but the panel was left powered off if
the DP cable wasn't plugged in while now we unconditionally send a D0
request and this is done for two reasons:
 - First, whether this request fails or not, it takes the same time
   and anyway the DP hardware won't produce any error (or, if it
   does, it's ignorable because it won't block further commands)
 - Second, training the link between a sleeping/standby/unpowered
   display makes little sense.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 76 ++++++++++++-------------------
 1 file changed, 30 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index c58b775877a3..77da0d002e9f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1251,6 +1251,29 @@ static void mtk_dp_audio_mute(struct mtk_dp *mtk_dp, bool mute)
 			   val[2], AU_TS_CFG_DP_ENC0_P0_MASK);
 }
 
+static void mtk_dp_aux_panel_poweron(struct mtk_dp *mtk_dp, bool pwron)
+{
+	if (pwron) {
+		/* power on aux */
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
+				   DP_PWR_STATE_MASK);
+
+		/* power on panel */
+		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
+		usleep_range(2000, 5000);
+	} else {
+		/* power off panel */
+		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
+		usleep_range(2000, 3000);
+
+		/* power off aux */
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+				   DP_PWR_STATE_BANDGAP_TPLL,
+				   DP_PWR_STATE_MASK);
+	}
+}
+
 static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
 {
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE,
@@ -1941,16 +1964,9 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	if (!mtk_dp->train_info.cable_plugged_in)
 		return ret;
 
-	if (!enabled) {
-		/* power on aux */
-		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
-				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
-				   DP_PWR_STATE_MASK);
+	if (!enabled)
+		mtk_dp_aux_panel_poweron(mtk_dp, true);
 
-		/* power on panel */
-		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
-		usleep_range(2000, 5000);
-	}
 	/*
 	 * Some dongles still source HPD when they do not connect to any
 	 * sink device. To avoid this, we need to read the sink count
@@ -1962,16 +1978,8 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	if (DP_GET_SINK_COUNT(sink_count))
 		ret = connector_status_connected;
 
-	if (!enabled) {
-		/* power off panel */
-		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
-		usleep_range(2000, 3000);
-
-		/* power off aux */
-		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
-				   DP_PWR_STATE_BANDGAP_TPLL,
-				   DP_PWR_STATE_MASK);
-	}
+	if (!enabled)
+		mtk_dp_aux_panel_poweron(mtk_dp, false);
 
 	return ret;
 }
@@ -1987,15 +1995,7 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 
 	if (!enabled) {
 		drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
-
-		/* power on aux */
-		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
-				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
-				   DP_PWR_STATE_MASK);
-
-		/* power on panel */
-		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
-		usleep_range(2000, 5000);
+		mtk_dp_aux_panel_poweron(mtk_dp, true);
 	}
 
 	new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
@@ -2015,15 +2015,7 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 	}
 
 	if (!enabled) {
-		/* power off panel */
-		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
-		usleep_range(2000, 3000);
-
-		/* power off aux */
-		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
-				   DP_PWR_STATE_BANDGAP_TPLL,
-				   DP_PWR_STATE_MASK);
-
+		mtk_dp_aux_panel_poweron(mtk_dp, false);
 		drm_atomic_bridge_chain_post_disable(bridge, connector->state->state);
 	}
 
@@ -2183,15 +2175,7 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
-	/* power on aux */
-	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
-			   DP_PWR_STATE_BANDGAP_TPLL_LANE,
-			   DP_PWR_STATE_MASK);
-
-	if (mtk_dp->train_info.cable_plugged_in) {
-		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
-		usleep_range(2000, 5000);
-	}
+	mtk_dp_aux_panel_poweron(mtk_dp, true);
 
 	/* Training */
 	ret = mtk_dp_training(mtk_dp);
-- 
2.41.0

