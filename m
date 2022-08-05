Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935E558A992
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 12:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6ED8B34DA;
	Fri,  5 Aug 2022 10:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC14FB3CF6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 10:15:10 +0000 (UTC)
X-UUID: 3e7b18dba3fe4f4d858146a3d6ddfe5c-20220805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=sGX6YzjigDRiefwq1x9TnO0pG3WTYmLcs7/JWY07XCk=; 
 b=dbU4CWEAgTI3N3A1dt6XycD6D57MpJUI8a4RfZTvNzY7dknN5xCfQovSOsPXSk3+/58vjJ/a0aXBQa9XHpT5+ctJCNjZ2dKvM3aq8IMVcZJnZ1nJ1rqR0PUqwfXbvFkKe1aV0uBmVdVPhSh6LVIHWwJlGhf7jRl+xt1LiX7Kybc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:d34b1369-3efb-4565-a8f0-01e15deb4436, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:0f94e32, CLOUDID:fd10e19b-da39-4e3b-a854-56c7d2111b46,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 3e7b18dba3fe4f4d858146a3d6ddfe5c-20220805
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1036865094; Fri, 05 Aug 2022 18:15:01 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 5 Aug 2022 18:15:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 5 Aug 2022 18:15:00 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <deller@gmx.de>, <airlied@linux.ie>
Subject: [PATCH v16 8/8] drm/mediatek: Use cached audio config when changing
 resolution
Date: Fri, 5 Aug 2022 18:14:59 +0800
Message-ID: <20220805101459.3386-9-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
References: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the audio is playing, we need to use the original configuration to
set the audio instead of using new configuration. Therefore, use the
cached audio configuration during a resolution switch to avoid loss of
sound.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 108 +++++-------------------------
 1 file changed, 17 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 3efac9920304..e725e3104147 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -45,18 +45,6 @@
 #define MTK_DP_TRAIN_DOWNSCALE_RETRY 8
 #define MTK_DP_VERSION 0x11
 
-#define MTK_DP_CEA_SAD_FREQ_32KHZ  BIT(0)
-#define MTK_DP_CEA_SAD_FREQ_44KHZ  BIT(1)
-#define MTK_DP_CEA_SAD_FREQ_48KHZ  BIT(2)
-#define MTK_DP_CEA_SAD_FREQ_88KHZ  BIT(3)
-#define MTK_DP_CEA_SAD_FREQ_96KHZ  BIT(4)
-#define MTK_DP_CEA_SAD_FREQ_176KHZ BIT(5)
-#define MTK_DP_CEA_SAD_FREQ_192KHZ BIT(6)
-
-#define MTK_DP_CEA_SAD_UNCOMPRESSED_WORD_16BIT BIT(0)
-#define MTK_DP_CEA_SAD_UNCOMPRESSED_WORD_20BIT BIT(1)
-#define MTK_DP_CEA_SAD_UNCOMPRESSED_WORD_24BIT BIT(2)
-
 struct mtk_dp_train_info {
 	bool tps3;
 	bool tps4;
@@ -106,7 +94,7 @@ struct mtk_dp_info {
 	struct videomode vm;
 	u8 frame_rate;
 	u32 pix_rate_khz;
-	struct mtk_dp_audio_cfg audio_caps;
+	struct mtk_dp_audio_cfg audio_cur_cfg;
 };
 
 struct dp_cal_data {
@@ -413,48 +401,6 @@ static void mtk_dp_pg_enable(struct mtk_dp *mtk_dp, bool enable)
 			   4 << PGEN_PATTERN_SEL_SHIFT, PGEN_PATTERN_SEL_MASK);
 }
 
-static int mtk_dp_cea_sad_get_sample_rate(const struct cea_sad *sad)
-{
-	switch (sad->freq) {
-	case MTK_DP_CEA_SAD_FREQ_32KHZ:
-		return 32000;
-	case MTK_DP_CEA_SAD_FREQ_44KHZ:
-		return 44100;
-	case MTK_DP_CEA_SAD_FREQ_48KHZ:
-		return 48000;
-	case MTK_DP_CEA_SAD_FREQ_88KHZ:
-		return 88200;
-	case MTK_DP_CEA_SAD_FREQ_96KHZ:
-		return 96000;
-	case MTK_DP_CEA_SAD_FREQ_176KHZ:
-		return 176400;
-	case MTK_DP_CEA_SAD_FREQ_192KHZ:
-		return 192000;
-	default:
-		return -EINVAL;
-	}
-}
-
-static int mtk_dp_cea_sad_get_uncompressed_word_length(const struct cea_sad *sad)
-{
-	if (sad->format != HDMI_AUDIO_CODING_TYPE_PCM) {
-		pr_err("Unable to get the uncompressed word length for format: %u\n",
-		       sad->format);
-		return -EINVAL;
-	}
-
-	switch (sad->byte2) {
-	case MTK_DP_CEA_SAD_UNCOMPRESSED_WORD_16BIT:
-		return 16;
-	case MTK_DP_CEA_SAD_UNCOMPRESSED_WORD_20BIT:
-		return 20;
-	case MTK_DP_CEA_SAD_UNCOMPRESSED_WORD_24BIT:
-		return 24;
-	default:
-		return -EINVAL;
-	}
-}
-
 static void mtk_dp_audio_setup_channels(struct mtk_dp *mtk_dp,
 					struct mtk_dp_audio_cfg *cfg)
 {
@@ -1859,9 +1805,7 @@ static bool mtk_dp_edid_parse_audio_capabilities(struct mtk_dp *mtk_dp,
 						 struct mtk_dp_audio_cfg *cfg)
 {
 	struct cea_sad *sads;
-	int sad_count;
-	int i;
-	bool ret = false;
+	int ret;
 
 	if (!mtk_dp->data->audio_supported)
 		return false;
@@ -1872,36 +1816,16 @@ static bool mtk_dp_edid_parse_audio_capabilities(struct mtk_dp *mtk_dp,
 		dev_err(mtk_dp->dev, "EDID not found!\n");
 		return false;
 	}
-	sad_count = drm_edid_to_sad(mtk_dp->edid, &sads);
-	mutex_unlock(&mtk_dp->edid_lock);
 
-	if (sad_count <= 0) {
+	ret = drm_edid_to_sad(mtk_dp->edid, &sads);
+	mutex_unlock(&mtk_dp->edid_lock);
+	if (ret <= 0) {
 		drm_info(mtk_dp->drm_dev, "The SADs is NULL\n");
 		return false;
 	}
-
-	for (i = 0; i < sad_count; i++) {
-		int sample_rate, word_length;
-
-		/* Only PCM supported at the moment */
-		if (sads[i].format != HDMI_AUDIO_CODING_TYPE_PCM)
-			continue;
-
-		sample_rate = mtk_dp_cea_sad_get_sample_rate(&sads[i]);
-		word_length =
-			mtk_dp_cea_sad_get_uncompressed_word_length(&sads[i]);
-		if (sample_rate <= 0 || word_length <= 0)
-			continue;
-
-		cfg->channels = sads[i].channels;
-		cfg->word_length_bits = word_length;
-		cfg->sample_rate = sample_rate;
-		ret = true;
-		break;
-	}
 	kfree(sads);
 
-	return ret;
+	return true;
 }
 
 static void mtk_dp_train_change_mode(struct mtk_dp *mtk_dp)
@@ -2070,13 +1994,13 @@ static int mtk_dp_training(struct mtk_dp *mtk_dp)
 
 	mtk_dp->audio_enable =
 		mtk_dp_edid_parse_audio_capabilities(mtk_dp,
-						     &mtk_dp->info.audio_caps);
+						     &mtk_dp->info.audio_cur_cfg);
 	if (mtk_dp->audio_enable) {
-		mtk_dp_audio_setup(mtk_dp, &mtk_dp->info.audio_caps);
+		mtk_dp_audio_setup(mtk_dp, &mtk_dp->info.audio_cur_cfg);
 		mtk_dp_audio_mute(mtk_dp, false);
 	} else {
-		memset(&mtk_dp->info.audio_caps, 0,
-		       sizeof(mtk_dp->info.audio_caps));
+		memset(&mtk_dp->info.audio_cur_cfg, 0,
+		       sizeof(mtk_dp->info.audio_cur_cfg));
 	}
 
 	return 0;
@@ -2442,6 +2366,9 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	if (mtk_dp_plug_state(mtk_dp)) {
 		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
 		usleep_range(2000, 3000);
+	} else {
+		memset(&mtk_dp->info.audio_cur_cfg, 0,
+		       sizeof(mtk_dp->info.audio_cur_cfg));
 	}
 
 	mtk_dp_video_mute(mtk_dp, true);
@@ -2641,18 +2568,17 @@ static int mtk_dp_audio_hw_params(struct device *dev, void *data,
 				  struct hdmi_codec_params *params)
 {
 	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
-	struct mtk_dp_audio_cfg cfg;
 
 	if (!mtk_dp->enabled) {
 		dev_err(mtk_dp->dev, "%s, DP is not ready!\n", __func__);
 		return -ENODEV;
 	}
 
-	cfg.channels = params->cea.channels;
-	cfg.sample_rate = params->sample_rate;
-	cfg.word_length_bits = 24;
+	mtk_dp->info.audio_cur_cfg.channels = params->cea.channels;
+	mtk_dp->info.audio_cur_cfg.sample_rate = params->sample_rate;
+	mtk_dp->info.audio_cur_cfg.word_length_bits = 24;
 
-	mtk_dp_audio_setup(mtk_dp, &cfg);
+	mtk_dp_audio_setup(mtk_dp, &mtk_dp->info.audio_cur_cfg);
 
 	return 0;
 }
-- 
2.18.0

