Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBF38C1EA6
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 09:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6223510E53B;
	Fri, 10 May 2024 07:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="PDFEemqR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1825D10E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 02:18:24 +0000 (UTC)
X-UUID: 9197f03c0e7311ef8065b7b53f7091ad-20240510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=DQMjWMZ5it8OZyRBbUrQVWokP1+YbLgDB/9+MCPLpVQ=; 
 b=PDFEemqR/w0/yqQQ7l/P/cErFe2kgjlMvWtMjC7+1eTYWdc6wOhqtBDESAspqaesZG5il+7hUZpt6p5qdjlH94hQW7JSyvxAplzA0gfTobJj3lD2beKzc/1dXtQbarchLBiGNiGkP7pgU92Pp93rwEfCm9rxWy1hviZmZ4Q/6hg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:8f3e01a1-1cb7-4e93-8d8e-9a87f5f31950, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:c3c72c87-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:5,IP:nil,UR
 L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
 PR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9197f03c0e7311ef8065b7b53f7091ad-20240510
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <liankun.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 536206815; Fri, 10 May 2024 10:18:19 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 May 2024 10:18:14 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 May 2024 10:18:14 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>,
 <mac.shen@mediatek.com>, <liankun.yang@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/1] Support YUV422 for DPTX.
Date: Fri, 10 May 2024 10:15:29 +0800
Message-ID: <20240510021810.19302-1-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.021300-8.000000
X-TMASE-MatchedRID: UqpZKsHsMCd6C/DhL53MofU1Xpm2N12SEbxKVXd70tXfUZT83lbkEH3q
 33AN90RFNEOprWfLXKfxmtEYLZtVoj3BvXglGRuk4pdq9sdj8LU7r2Gtb9iBYWHtZs6e3ZMHgSk
 lFxt6Wp0ANcTxXeakRbFdDzVRJSPNxz6opuAAUJKO0rt0LpQGeVo1rFkFFs1atK3FOVf6Entlln
 dVQSPeh37oxe7d+k8QcAwOsowI+VKlTHNxJDwdpELEoH0ynuZVFk73i4rVVIH4JyR+b5tvoBFG4
 EGBR4d4XLIhLtaujX6/GjIHLzn7BgEzlKcqjzGckDpLRKO9xhThKQh1LCmGBpsoi2XrUn/Jn6Kd
 MrRsL14qtq5d3cxkNRz4tF/sDU5vhRA3SI9h7KmYftgi7sAl3zpKgU6ixfgAeW4/xVzXMTY/l3L
 cZRxL5jxLPNsXewJyspCzPmuFTck1skRKpMV4OkGv8R81e9TV82Gj2QC3yG0smXVK/H8eHzG7sr
 7xobSAzcDEvJaUSgU=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.021300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E8F621250D14A1442EC801CC57FAB1D2DE56DC6ACD66D8FDC57EB1D2246BAA102000:8
X-MTK: N
X-Mailman-Approved-At: Fri, 10 May 2024 07:07:42 +0000
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

Adjust the training sequence.Detects the actual link condition
and calculates the bandwidth where the relevant resolution resides.

The bandwidth is recalculated and modes that exceed the bandwidth are
filtered.

Example Modify bandwidth filtering requirements.

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 81 ++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 2136a596efa1..3e645bd6fe27 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -66,6 +66,13 @@ enum {
 	MTK_DP_CAL_MAX,
 };
 
+enum mtk_dp_color_format {
+	MTK_DP_COLOR_FORMAT_RGB = 0,
+	MTK_DP_COLOR_FORMAT_YUV422 = 0x1,
+	MTK_DP_COLOR_FORMAT_YUV444 = 0x2,
+	MTK_DP_COLOR_FORMAT_YUV420 = 0x3,
+};
+
 struct mtk_dp_train_info {
 	bool sink_ssc;
 	bool cable_plugged_in;
@@ -84,7 +91,7 @@ struct mtk_dp_audio_cfg {
 };
 
 struct mtk_dp_info {
-	enum dp_pixelformat format;
+	enum mtk_dp_color_format format;
 	struct videomode vm;
 	struct mtk_dp_audio_cfg audio_cur_cfg;
 };
@@ -457,7 +464,7 @@ static void mtk_dp_set_msa(struct mtk_dp *mtk_dp)
 }
 
 static int mtk_dp_set_color_format(struct mtk_dp *mtk_dp,
-				   enum dp_pixelformat color_format)
+				   enum mtk_dp_color_format color_format)
 {
 	u32 val;
 
@@ -467,10 +474,10 @@ static int mtk_dp_set_color_format(struct mtk_dp *mtk_dp,
 			   DP_TEST_COLOR_FORMAT_MASK);
 
 	switch (color_format) {
-	case DP_PIXELFORMAT_YUV422:
+	case MTK_DP_COLOR_FORMAT_YUV422:
 		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR422;
 		break;
-	case DP_PIXELFORMAT_RGB:
+	case MTK_DP_COLOR_FORMAT_RGB:
 		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB;
 		break;
 	default:
@@ -1322,7 +1329,7 @@ static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
 	mtk_dp->train_info.lane_count = mtk_dp->max_lanes;
 	mtk_dp->train_info.cable_plugged_in = plugged_in;
 
-	mtk_dp->info.format = DP_PIXELFORMAT_RGB;
+	mtk_dp->info.format = MTK_DP_COLOR_FORMAT_YUV422;
 	memset(&mtk_dp->info.vm, 0, sizeof(struct videomode));
 	mtk_dp->audio_enable = false;
 }
@@ -1371,7 +1378,7 @@ static void mtk_dp_sdp_set_down_cnt_init_in_hblank(struct mtk_dp *mtk_dp)
 
 	drm_display_mode_from_videomode(vm, &mode);
 
-	pix_clk_mhz = mtk_dp->info.format == DP_PIXELFORMAT_YUV420 ?
+	pix_clk_mhz = mtk_dp->info.format == MTK_DP_COLOR_FORMAT_YUV420 ?
 		      mode.clock / 2000 : mode.clock / 1000;
 
 	switch (mtk_dp->train_info.lane_count) {
@@ -1870,6 +1877,7 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 	struct mtk_dp *mtk_dp = dev;
 	unsigned long flags;
 	u32 status;
+	int ret;
 
 	if (mtk_dp->need_debounce && mtk_dp->train_info.cable_plugged_in)
 		msleep(100);
@@ -1888,9 +1896,28 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
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
 
@@ -2057,16 +2084,6 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 
 	new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
 
-	/*
-	 * Parse capability here to let atomic_get_input_bus_fmts and
-	 * mode_valid use the capability to calculate sink bitrates.
-	 */
-	if (mtk_dp_parse_capabilities(mtk_dp)) {
-		drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
-		kfree(new_edid);
-		new_edid = NULL;
-	}
-
 	if (new_edid) {
 		struct cea_sad *sads;
 
@@ -2243,14 +2260,10 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
-	mtk_dp_aux_panel_poweron(mtk_dp, true);
-
-	/* Training */
-	ret = mtk_dp_training(mtk_dp);
-	if (ret) {
-		drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
-		goto power_off_aux;
-	}
+	/* power on aux */
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+			   DP_PWR_STATE_BANDGAP_TPLL_LANE,
+			   DP_PWR_STATE_MASK);
 
 	ret = mtk_dp_video_config(mtk_dp);
 	if (ret)
@@ -2310,12 +2323,11 @@ mtk_dp_bridge_mode_valid(struct drm_bridge *bridge,
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 	u32 bpp = info->color_formats & DRM_COLOR_FORMAT_YCBCR422 ? 16 : 24;
-	u32 rate = min_t(u32, drm_dp_max_link_rate(mtk_dp->rx_cap) *
-			      drm_dp_max_lane_count(mtk_dp->rx_cap),
-			 drm_dp_bw_code_to_link_rate(mtk_dp->max_linkrate) *
-			 mtk_dp->max_lanes);
+	u32 lane_count_min = mtk_dp->train_info.lane_count;
+	u32 rate = drm_dp_bw_code_to_link_rate(mtk_dp->train_info.link_rate) *
+			 lane_count_min;
 
-	if (rate < mode->clock * bpp / 8)
+	if (rate * 97 / 100 < (mode->clock * bpp / 8))
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
@@ -2356,10 +2368,9 @@ static u32 *mtk_dp_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct drm_display_info *display_info =
 		&conn_state->connector->display_info;
-	u32 rate = min_t(u32, drm_dp_max_link_rate(mtk_dp->rx_cap) *
-			      drm_dp_max_lane_count(mtk_dp->rx_cap),
-			 drm_dp_bw_code_to_link_rate(mtk_dp->max_linkrate) *
-			 mtk_dp->max_lanes);
+	u32 lane_count_min = mtk_dp->train_info.lane_count;
+	u32 rate = drm_dp_bw_code_to_link_rate(mtk_dp->train_info.link_rate) *
+			 lane_count_min;
 
 	*num_input_fmts = 0;
 
@@ -2406,9 +2417,9 @@ static int mtk_dp_bridge_atomic_check(struct drm_bridge *bridge,
 		 bridge_state->output_bus_cfg.format);
 
 	if (input_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
-		mtk_dp->info.format = DP_PIXELFORMAT_YUV422;
+		mtk_dp->info.format = MTK_DP_COLOR_FORMAT_YUV422;
 	else
-		mtk_dp->info.format = DP_PIXELFORMAT_RGB;
+		mtk_dp->info.format = MTK_DP_COLOR_FORMAT_RGB;
 
 	if (!crtc) {
 		drm_err(mtk_dp->drm_dev,
-- 
2.18.0

