Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FE6478F33
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 16:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7045112AF3;
	Fri, 17 Dec 2021 15:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7370112AF3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 15:09:34 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a9so4622715wrr.8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 07:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KyUN6E8qUmReiqQY1FT8fQDaFbqmWwGXJe5qEAY70jQ=;
 b=K/MGP2xsclZBpeUNmmwVhlNMJMWnloZ+j9jqvMDqLv5G2R84p8K/w3EX7kJRSzhxjk
 5/1ceuxfG+sCg048+PlNQSI8WpPG55aPVHP4tveKPrXYl3Fy4aICmTN5nfYv5fnX6Xdr
 HpEuDWKPQUbULqHW+Qc3DR0kbQjsU4vER/zBHWUEzmRXE66mmA3Naa1xwrMVBIsjLv41
 gZxBDc9U7b2vT2eNwijvllmLAqiJyWhKNK+kfELxqO98XHqpbPUX+Jr24WweCzuHR9PP
 SfEB+HeX2M7Y57ejckVSppJ0/Qng1/hBYawTg2b8BkY49/Syd58aIea2DTVWtoyQs8/K
 cXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KyUN6E8qUmReiqQY1FT8fQDaFbqmWwGXJe5qEAY70jQ=;
 b=MgiwP0o4bqca/gPxvNu3Ip/Ix9+RZ0dV/e5T0Sb9N2ZjgnB8NUgHwpMft6fjH6nQkY
 +uBb1hpm9jiGW0JvTMHhuzcZ8KzSxD4BK51zhBphhqPDjyYwDTRXfl1iBTVBEtUY1OHY
 c2vL0VjqhC0/sYATqC9Bc5c+peaVrdmzdov9JeWQLdTH5vs81sb1JFsvTZ1Q2GrF1pKy
 PGXJk4UlyFxLt3rJTXYuV3Rq+uyRurZFpDWGpeE8RfZ4nG1Zi19AilK449uT3nkoFi/0
 York30nGtsFCGt9plHLmz2CrycLIysVyUKv/zXIbnu+p+Z3HND8BnNfY3xrDtc5VBcjo
 T62A==
X-Gm-Message-State: AOAM532l5HRrSSQnbrZB1e/JVwwiEZIlhM2f6u66LAHlXhaQsSsJkRwM
 ReyujG9ljS5b8Q/NSlNMTq0gUQ==
X-Google-Smtp-Source: ABdhPJx6XLRFsU6ZGuvuPBKBJJ4/O2TOahGBNVwvg3cI532ukCaPRvC49dHF78Pflf+1YhJyugmUGg==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr2939240wri.297.1639753773296; 
 Fri, 17 Dec 2021 07:09:33 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6441-43a4-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6441:43a4:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id g18sm12655132wmq.4.2021.12.17.07.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 07:09:32 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v7 8/8] drm/mediatek: Add mt8195 eDP support
Date: Fri, 17 Dec 2021 16:08:54 +0100
Message-Id: <20211217150854.2081-9-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217150854.2081-1-granquet@baylibre.com>
References: <20211217150854.2081-1-granquet@baylibre.com>
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
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support of eDP panel to the mt8195 DP driver.

This driver is based on an initial version by
Jason-JH.Lin <jason-jh.lin@mediatek.com>.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 102 +++++++++++++++++++++---------
 1 file changed, 73 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 41e95a0bcaa2c..a256d55346a23 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -228,6 +228,11 @@ static struct regmap_config mtk_dp_regmap_config = {
 	.name = "mtk-dp-registers",
 };
 
+static bool mtk_dp_is_edp(struct mtk_dp *mtk_dp)
+{
+	return mtk_dp->next_bridge;
+}
+
 static struct mtk_dp *mtk_dp_from_bridge(struct drm_bridge *b)
 {
 	return container_of(b, struct mtk_dp, bridge);
@@ -1185,26 +1190,49 @@ static int mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
 		return PTR_ERR(buf);
 	}
 
-	cal_data->glb_bias_trim =
-		check_cal_data_valid(1, 0x1e, (buf[0] >> 27) & 0x1f, 0xf);
-	cal_data->clktx_impse =
-		check_cal_data_valid(1, 0xe, (buf[0] >> 13) & 0xf, 0x8);
-	cal_data->ln0_tx_impsel_pmos =
-		check_cal_data_valid(1, 0xe, (buf[1] >> 28) & 0xf, 0x8);
-	cal_data->ln0_tx_impsel_nmos =
-		check_cal_data_valid(1, 0xe, (buf[1] >> 24) & 0xf, 0x8);
-	cal_data->ln1_tx_impsel_pmos =
-		check_cal_data_valid(1, 0xe, (buf[1] >> 20) & 0xf, 0x8);
-	cal_data->ln1_tx_impsel_nmos =
-		check_cal_data_valid(1, 0xe, (buf[1] >> 16) & 0xf, 0x8);
-	cal_data->ln2_tx_impsel_pmos =
-		check_cal_data_valid(1, 0xe, (buf[1] >> 12) & 0xf, 0x8);
-	cal_data->ln2_tx_impsel_nmos =
-		check_cal_data_valid(1, 0xe, (buf[1] >> 8) & 0xf, 0x8);
-	cal_data->ln3_tx_impsel_pmos =
-		check_cal_data_valid(1, 0xe, (buf[1] >> 4) & 0xf, 0x8);
-	cal_data->ln3_tx_impsel_nmos =
-		check_cal_data_valid(1, 0xe, buf[1] & 0xf, 0x8);
+	if (mtk_dp_is_edp(mtk_dp)) {
+		cal_data->glb_bias_trim =
+			check_cal_data_valid(1, 0x1e, (buf[3] >> 27) & 0x1f, 0xf);
+		cal_data->clktx_impse =
+			check_cal_data_valid(1, 0xe, (buf[0] >> 9) & 0xf, 0x8);
+		cal_data->ln0_tx_impsel_pmos =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 28) & 0xf, 0x8);
+		cal_data->ln0_tx_impsel_nmos =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 24) & 0xf, 0x8);
+		cal_data->ln1_tx_impsel_pmos =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 20) & 0xf, 0x8);
+		cal_data->ln1_tx_impsel_nmos =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 16) & 0xf, 0x8);
+		cal_data->ln2_tx_impsel_pmos =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 12) & 0xf, 0x8);
+		cal_data->ln2_tx_impsel_nmos =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 8) & 0xf, 0x8);
+		cal_data->ln3_tx_impsel_pmos =
+			check_cal_data_valid(1, 0xe, (buf[2] >> 4) & 0xf, 0x8);
+		cal_data->ln3_tx_impsel_nmos =
+			check_cal_data_valid(1, 0xe, buf[2] & 0xf, 0x8);
+	} else {
+		cal_data->glb_bias_trim =
+			check_cal_data_valid(1, 0x1e, (buf[0] >> 27) & 0x1f, 0xf);
+		cal_data->clktx_impse =
+			check_cal_data_valid(1, 0xe, (buf[0] >> 13) & 0xf, 0x8);
+		cal_data->ln0_tx_impsel_pmos =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 28) & 0xf, 0x8);
+		cal_data->ln0_tx_impsel_nmos =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 24) & 0xf, 0x8);
+		cal_data->ln1_tx_impsel_pmos =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 20) & 0xf, 0x8);
+		cal_data->ln1_tx_impsel_nmos =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 16) & 0xf, 0x8);
+		cal_data->ln2_tx_impsel_pmos =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 12) & 0xf, 0x8);
+		cal_data->ln2_tx_impsel_nmos =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 8) & 0xf, 0x8);
+		cal_data->ln3_tx_impsel_pmos =
+			check_cal_data_valid(1, 0xe, (buf[1] >> 4) & 0xf, 0x8);
+		cal_data->ln3_tx_impsel_nmos =
+			check_cal_data_valid(1, 0xe, buf[1] & 0xf, 0x8);
+	}
 
 	kfree(buf);
 
@@ -1322,7 +1350,11 @@ static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
 	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000, val,
 			   VIDEO_MUTE_SEL_DP_ENC0_P0_MASK |
 			   VIDEO_MUTE_SW_DP_ENC0_P0_MASK);
-	mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_VIDEO_UNMUTE, enable);
+
+	if (mtk_dp_is_edp(mtk_dp))
+		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable);
+	else
+		mtk_dp_sip_atf_call(MTK_DP_SIP_ATF_VIDEO_UNMUTE, enable);
 }
 
 static void mtk_dp_audio_mute(struct mtk_dp *mtk_dp, bool mute)
@@ -2326,6 +2358,9 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	enum drm_connector_status ret = connector_status_disconnected;
 	u8 sink_count = 0;
 
+	if (mtk_dp_is_edp(mtk_dp))
+		return connector_status_connected;
+
 	if (mtk_dp_plug_state(mtk_dp)) {
 		drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
 		if (DP_GET_SINK_COUNT(sink_count))
@@ -2888,7 +2923,11 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	}
 
 	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
-	if (IS_ERR(mtk_dp->next_bridge)) {
+	if (IS_ERR(mtk_dp->next_bridge) && PTR_ERR(mtk_dp->next_bridge) == -ENODEV) {
+		dev_info(dev,
+			 "No panel connected in devicetree, continuing as external DP\n");
+		mtk_dp->next_bridge = NULL;
+	} else if (IS_ERR(mtk_dp->next_bridge)) {
 		ret = PTR_ERR(mtk_dp->next_bridge);
 		dev_err_probe(dev, ret, "Failed to get bridge\n");
 		return ret;
@@ -2915,12 +2954,14 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mtk_dp);
 
-	mutex_init(&mtk_dp->update_plugged_status_lock);
-	ret = mtk_dp_register_audio_driver(dev);
-	if (ret) {
-		dev_err(dev, "Failed to register audio driver: %d\n",
-			ret);
-		return ret;
+	if (!mtk_dp_is_edp(mtk_dp)) {
+		mutex_init(&mtk_dp->update_plugged_status_lock);
+		ret = mtk_dp_register_audio_driver(dev);
+		if (ret) {
+			dev_err(dev, "Failed to register audio driver: %d\n",
+				ret);
+			return ret;
+		}
 	}
 
 	mtk_dp->phy_dev = platform_device_register_data(dev, "mediatek-dp-phy",
@@ -2944,7 +2985,10 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	mtk_dp->bridge.funcs = &mtk_dp_bridge_funcs;
 	mtk_dp->bridge.of_node = dev->of_node;
-	mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
+	if (mtk_dp_is_edp(mtk_dp))
+		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	else
+		mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 
 	mtk_dp->bridge.ops =
 		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
-- 
2.32.0

