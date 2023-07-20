Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C82F975A931
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 10:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1510610E57B;
	Thu, 20 Jul 2023 08:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9394510E57F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 08:26:03 +0000 (UTC)
X-UUID: 0df6e9b026d711eeb20a276fd37b9834-20230720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ptIjMF7GamP9HGBt2cM7j3WtD+IyepmZwXMZ45MmUlw=; 
 b=UdE38rHtaGGB4mNfXdqkL5fOJ5YmFcMFsV0ro16/zbPNL8OXU1XRf8pWoxSrqcxzx7L+beI4cp7cuYcdqD3aKyKabQDPoMeKBcQOhyD0b7c9pWwa5PBxTv7Lyv4TMCD298JYp8e3TGL5C5RCQSfuvLHnbetrwud/JVoKJxjiIdc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28, REQID:d515f0d4-efb8-4c36-a6b2-eeb61be1b9c6, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:70
X-CID-INFO: VERSION:1.1.28, REQID:d515f0d4-efb8-4c36-a6b2-eeb61be1b9c6, IP:0,
 URL
 :0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
 ON:quarantine,TS:70
X-CID-META: VersionHash:176cd25, CLOUDID:51afec4c-06c1-468b-847d-5b62d44dbb9b,
 B
 ulkID:2307201626007VIC9UR4,BulkQuantity:1,Recheck:0,SF:48|38|29|28|17|19,T
 C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:43,QS:nil,BEC:nil,COL
 :0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR, TF_CID_SPAM_SDM, TF_CID_SPAM_ASC,
 TF_CID_SPAM_FAS, TF_CID_SPAM_FSD,TF_CID_SPAM_ULN
X-UUID: 0df6e9b026d711eeb20a276fd37b9834-20230720
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <shuijing.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1599951839; Thu, 20 Jul 2023 16:25:58 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 20 Jul 2023 16:25:57 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 20 Jul 2023 16:25:56 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
Subject: [PATCH v3,
 2/3] drm/mediatek: dp: Add the audio packet flag to mtk_dp_data struct
Date: Thu, 20 Jul 2023 16:26:03 +0800
Message-ID: <20230720082604.18618-3-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230720082604.18618-1-shuijing.li@mediatek.com>
References: <20230720082604.18618-1-shuijing.li@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Shuijing Li <shuijing.li@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The audio packet arrangement function is to only arrange audio.
packets into the Hblanking area. In order to align with the HW
default setting of mt8195, this function needs to be turned off.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
Changes in v3:
Separate these two things into two different patches.
per suggestion from the previous thread:
https://lore.kernel.org/lkml/e2ad22bcba31797f38a12a488d4246a01bf0cb2e.camel@mediatek.com/
Changes in v2:
- change the variables' name to be more descriptive
- add a comment that describes the function of mtk_dp_audio_sample_arrange
- reduce indentation by doing the inverse check
- add a definition of some bits
- add support for mediatek, mt8188-edp-tx
per suggestion from the previous thread:
https://lore.kernel.org/lkml/ac0fcec9-a2fe-06cc-c727-189ef7babe9c@collabora.com/
---
 drivers/gpu/drm/mediatek/mtk_dp.c     | 40 +++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |  5 ++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 64eee77452c0..d8cda83d6fef 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -139,6 +139,7 @@ struct mtk_dp_data {
 	unsigned int smc_cmd;
 	const struct mtk_dp_efuse_fmt *efuse_fmt;
 	bool audio_supported;
+	bool audio_pkt_in_hblank_area;
 };
 
 static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
@@ -1362,6 +1363,18 @@ static void mtk_dp_sdp_set_down_cnt_init_in_hblank(struct mtk_dp *mtk_dp)
 			   SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK);
 }
 
+static void mtk_dp_audio_sample_arrange(struct mtk_dp *mtk_dp)
+{
+	/* arrange audio packets into the Hblanking and Vblanking area */
+	if (!mtk_dp->data->audio_pkt_in_hblank_area)
+		return;
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3374, 0,
+			   SDP_ASP_INSERT_IN_HBLANK_DP_ENC1_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3374, 0,
+			   SDP_DOWN_ASP_CNT_INIT_DP_ENC1_P0_MASK);
+}
+
 static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
 {
 	u32 sram_read_start = min_t(u32, MTK_DP_TBC_BUF_READ_START_ADDR,
@@ -1371,6 +1384,7 @@ static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
 				    MTK_DP_PIX_PER_ADDR);
 	mtk_dp_set_sram_read_start(mtk_dp, sram_read_start);
 	mtk_dp_setup_encoder(mtk_dp);
+	mtk_dp_audio_sample_arrange(mtk_dp);
 	mtk_dp_sdp_set_down_cnt_init_in_hblank(mtk_dp);
 	mtk_dp_sdp_set_down_cnt_init(mtk_dp, sram_read_start);
 }
@@ -2616,11 +2630,28 @@ static int mtk_dp_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 
+static const struct mtk_dp_data mt8188_edp_data = {
+	.bridge_type = DRM_MODE_CONNECTOR_eDP,
+	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
+	.efuse_fmt = mt8195_edp_efuse_fmt,
+	.audio_supported = false,
+	.audio_pkt_in_hblank_area = false,
+};
+
+static const struct mtk_dp_data mt8188_dp_data = {
+	.bridge_type = DRM_MODE_CONNECTOR_DisplayPort,
+	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
+	.efuse_fmt = mt8195_dp_efuse_fmt,
+	.audio_supported = true,
+	.audio_pkt_in_hblank_area = true,
+};
+
 static const struct mtk_dp_data mt8195_edp_data = {
 	.bridge_type = DRM_MODE_CONNECTOR_eDP,
 	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
 	.efuse_fmt = mt8195_edp_efuse_fmt,
 	.audio_supported = false,
+	.audio_pkt_in_hblank_area = false,
 };
 
 static const struct mtk_dp_data mt8195_dp_data = {
@@ -2628,9 +2659,18 @@ static const struct mtk_dp_data mt8195_dp_data = {
 	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
 	.efuse_fmt = mt8195_dp_efuse_fmt,
 	.audio_supported = true,
+	.audio_pkt_in_hblank_area = false,
 };
 
 static const struct of_device_id mtk_dp_of_match[] = {
+	{
+		.compatible = "mediatek,mt8188-edp-tx",
+		.data = &mt8188_edp_data,
+	},
+	{
+		.compatible = "mediatek,mt8188-dp-tx",
+		.data = &mt8188_dp_data,
+	},
 	{
 		.compatible = "mediatek,mt8195-edp-tx",
 		.data = &mt8195_edp_data,
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 84e38cef03c2..f38d6ff12afe 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -228,6 +228,11 @@
 							 VIDEO_STABLE_CNT_THRD_DP_ENC1_P0 | \
 							 SDP_DP13_EN_DP_ENC1_P0 | \
 							 BS2BS_MODE_DP_ENC1_P0)
+
+#define MTK_DP_ENC1_P0_3374			0x3374
+#define SDP_ASP_INSERT_IN_HBLANK_DP_ENC1_P0_MASK	BIT(12)
+#define SDP_DOWN_ASP_CNT_INIT_DP_ENC1_P0_MASK		GENMASK(11, 0)
+
 #define MTK_DP_ENC1_P0_33F4			0x33f4
 #define DP_ENC_DUMMY_RW_1_AUDIO_RST_EN			BIT(0)
 #define DP_ENC_DUMMY_RW_1				BIT(9)
-- 
2.40.1

