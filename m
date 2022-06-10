Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA535464C7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 12:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E20310E24C;
	Fri, 10 Jun 2022 10:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F334110E165
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 10:55:34 +0000 (UTC)
X-UUID: 162fb6474f0b4209a3e2fce00b0a9eb9-20220610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:5f622e50-ec84-4a02-adeb-51ab45030e42, OB:0,
 LO
 B:20,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:90
X-CID-INFO: VERSION:1.1.5, REQID:5f622e50-ec84-4a02-adeb-51ab45030e42, OB:0,
 LOB:
 20,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,A
 CTION:quarantine,TS:90
X-CID-META: VersionHash:2a19b09, CLOUDID:ad2ff27e-c8dc-403a-96e8-6237210dceee,
 C
 OID:9c5b22ce52bb,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:0,BEC:nil
X-UUID: 162fb6474f0b4209a3e2fce00b0a9eb9-20220610
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 819934223; Fri, 10 Jun 2022 18:55:26 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 10 Jun 2022 18:55:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 10 Jun 2022 18:55:24 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <deller@gmx.de>, <airlied@linux.ie>
Subject: [PATCH v11 09/10] drm/mediatek: DP audio support for MT8195
Date: Fri, 10 Jun 2022 18:55:21 +0800
Message-ID: <20220610105522.13449-10-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
References: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
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
 granquet@baylibre.com, jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, msp@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guillaume Ranquet <granquet@baylibre.com>

This patch adds audio support to the DP driver for MT8195 with up to 8
channels.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
[Bo-Chen: Cleanup and fix reviewers' comments]
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 698 ++++++++++++++++++++++++++++++
 1 file changed, 698 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index a5ed94ca00c6..35712ee6a04e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -85,9 +85,41 @@ enum mtk_dp_linkrate {
 	MTK_DP_LINKRATE_HBR3 = 0x1E,
 };
 
+enum mtk_dp_sdp_type {
+	MTK_DP_SDP_NONE = 0x00,
+	MTK_DP_SDP_ACM = 0x01,
+	MTK_DP_SDP_ISRC = 0x02,
+	MTK_DP_SDP_AVI = 0x03,
+	MTK_DP_SDP_AUI = 0x04,
+	MTK_DP_SDP_SPD = 0x05,
+	MTK_DP_SDP_MPEG = 0x06,
+	MTK_DP_SDP_NTSC = 0x07,
+	MTK_DP_SDP_VSP = 0x08,
+	MTK_DP_SDP_VSC = 0x09,
+	MTK_DP_SDP_EXT = 0x0A,
+	MTK_DP_SDP_PPS0 = 0x0B,
+	MTK_DP_SDP_PPS1 = 0x0C,
+	MTK_DP_SDP_PPS2 = 0x0D,
+	MTK_DP_SDP_PPS3 = 0x0E,
+	MTK_DP_SDP_DRM = 0x10,
+	MTK_DP_SDP_MAX_NUM
+};
+
+struct mtk_dp_sdp_packet {
+	enum mtk_dp_sdp_type type;
+	struct dp_sdp sdp;
+};
+
+struct mtk_dp_audio_cfg {
+	int sample_rate;
+	int word_length_bits;
+	int channels;
+};
+
 struct mtk_dp_info {
 	u32 depth;
 	enum dp_pixelformat format;
+	struct mtk_dp_audio_cfg audio_caps;
 	struct mtk_dp_timings timings;
 };
 
@@ -123,10 +155,22 @@ struct mtk_dp {
 	struct regmap *regs;
 
 	bool enabled;
+	bool audio_enable;
 
 	bool has_fec;
 	/* protect the mtk_dp struct */
 	struct mutex dp_lock;
+	/* protect the plugged_cb as it's used in both bridge ops and audio */
+	struct mutex update_plugged_status_lock;
+	/* protect the eld data as it's used in both bridge ops and audio */
+	struct mutex eld_lock;
+	/* protect edid as it is used in both bridge ops and IRQ handler */
+	struct mutex edid_lock;
+	struct edid *edid;
+
+	hdmi_codec_plugged_cb plugged_cb;
+	struct device *codec_dev;
+	u8 connector_eld[MAX_ELD_BYTES];
 
 	struct drm_connector *conn;
 	bool need_debounce;
@@ -416,6 +460,125 @@ static void mtk_dp_pg_disable(struct mtk_dp *mtk_dp)
 			   4 << PGEN_PATTERN_SEL_SHIFT, PGEN_PATTERN_SEL_MASK);
 }
 
+static void mtk_dp_audio_setup_channels(struct mtk_dp *mtk_dp,
+					struct mtk_dp_audio_cfg *cfg)
+{
+	u32 channel_enable_bits;
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3324,
+			   AUDIO_SOURCE_MUX_DP_ENC1_P0_DPRX,
+			   AUDIO_SOURCE_MUX_DP_ENC1_P0_MASK);
+
+	/* audio channel count change reset */
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_33F4, BIT(9), BIT(9));
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3304,
+			   AU_PRTY_REGEN_DP_ENC1_P0_MASK,
+			   AU_PRTY_REGEN_DP_ENC1_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3304,
+			   AU_CH_STS_REGEN_DP_ENC1_P0_MASK,
+			   AU_CH_STS_REGEN_DP_ENC1_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3304,
+			   AUDIO_SAMPLE_PRSENT_REGEN_DP_ENC1_P0_MASK,
+			   AUDIO_SAMPLE_PRSENT_REGEN_DP_ENC1_P0_MASK);
+
+	switch (cfg->channels) {
+	case 2:
+		channel_enable_bits = AUDIO_2CH_SEL_DP_ENC0_P0_MASK |
+				      AUDIO_2CH_EN_DP_ENC0_P0_MASK;
+		break;
+	case 8:
+	default:
+		channel_enable_bits = AUDIO_8CH_SEL_DP_ENC0_P0_MASK |
+				      AUDIO_8CH_EN_DP_ENC0_P0_MASK;
+		break;
+	}
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3088,
+			   channel_enable_bits | AU_EN_DP_ENC0_P0_MASK,
+			   AUDIO_2CH_SEL_DP_ENC0_P0_MASK |
+			   AUDIO_2CH_EN_DP_ENC0_P0_MASK |
+			   AUDIO_8CH_SEL_DP_ENC0_P0_MASK |
+			   AUDIO_8CH_EN_DP_ENC0_P0_MASK |
+			   AU_EN_DP_ENC0_P0_MASK);
+
+	/* audio channel count change reset */
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_33F4, 0, BIT(9));
+
+	/* enable audio reset */
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_33F4, BIT(0), BIT(0));
+}
+
+static void mtk_dp_audio_channel_status_set(struct mtk_dp *mtk_dp,
+					    struct mtk_dp_audio_cfg *cfg)
+{
+	struct snd_aes_iec958 iec = { 0 };
+
+	switch (cfg->sample_rate) {
+	case 32000:
+		iec.status[3] = IEC958_AES3_CON_FS_32000;
+		break;
+	case 44100:
+		iec.status[3] = IEC958_AES3_CON_FS_44100;
+		break;
+	case 48000:
+		iec.status[3] = IEC958_AES3_CON_FS_48000;
+		break;
+	case 88200:
+		iec.status[3] = IEC958_AES3_CON_FS_88200;
+		break;
+	case 96000:
+		iec.status[3] = IEC958_AES3_CON_FS_96000;
+		break;
+	case 192000:
+		iec.status[3] = IEC958_AES3_CON_FS_192000;
+		break;
+	default:
+		iec.status[3] = IEC958_AES3_CON_FS_NOTID;
+		break;
+	}
+
+	switch (cfg->word_length_bits) {
+	case 16:
+		iec.status[4] = IEC958_AES4_CON_WORDLEN_20_16;
+		break;
+	case 20:
+		iec.status[4] = IEC958_AES4_CON_WORDLEN_20_16 |
+			IEC958_AES4_CON_MAX_WORDLEN_24;
+		break;
+	case 24:
+		iec.status[4] = IEC958_AES4_CON_WORDLEN_24_20 |
+			IEC958_AES4_CON_MAX_WORDLEN_24;
+		break;
+	default:
+		iec.status[4] = IEC958_AES4_CON_WORDLEN_NOTID;
+	}
+
+	/* IEC 60958 consumer channel status bits */
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_308C,
+			   0, CH_STATUS_0_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3090,
+			   iec.status[3] << 8, CH_STATUS_1_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3094,
+			   iec.status[4], CH_STATUS_2_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_audio_sdp_asp_set_channels(struct mtk_dp *mtk_dp,
+					      int channels)
+{
+	if (channels != 2 && channels != 8)
+		channels = 8;
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_312C,
+			   (channels - 1) << ASP_HB3_DP_ENC0_P0_SHIFT,
+			   ASP_HB2_DP_ENC0_P0_MASK | ASP_HB3_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_audio_set_divider(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
+			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
+			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK);
+}
+
 static bool mtk_dp_plug_state(struct mtk_dp *mtk_dp)
 {
 	return !!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
@@ -436,6 +599,169 @@ static bool mtk_dp_plug_state_avoid_pulse(struct mtk_dp *mtk_dp)
 	return true;
 }
 
+static void mtk_dp_sdp_trigger_packet(struct mtk_dp *mtk_dp,
+				      enum mtk_dp_sdp_type type)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280,
+			   type, SDP_PACKET_TYPE_DP_ENC1_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280,
+			   SDP_PACKET_W_DP_ENC1_P0, SDP_PACKET_W_DP_ENC1_P0);
+}
+
+static void mtk_dp_sdp_set_data(struct mtk_dp *mtk_dp, u8 *data_bytes)
+{
+	mtk_dp_bulk_16bit_write(mtk_dp, MTK_DP_ENC1_P0_3200,
+				data_bytes, 0x10);
+}
+
+static void mtk_dp_sdp_set_header(struct mtk_dp *mtk_dp,
+				  enum mtk_dp_sdp_type type,
+				  struct dp_sdp_header *header)
+{
+	u32 db_addr;
+
+	switch (type) {
+	case MTK_DP_SDP_DRM:
+		db_addr = MTK_DP_ENC0_P0_3138;
+		break;
+	case MTK_DP_SDP_PPS0:
+	case MTK_DP_SDP_PPS1:
+	case MTK_DP_SDP_PPS2:
+	case MTK_DP_SDP_PPS3:
+		db_addr = MTK_DP_ENC0_P0_3130;
+		break;
+	default:
+		db_addr = MTK_DP_ENC0_P0_30D8 + (type - MTK_DP_SDP_ACM) * 8;
+		break;
+	}
+
+	mtk_dp_bulk_16bit_write(mtk_dp, db_addr, (u8 *)header, 4);
+}
+
+static const u32 sdp_type_to_reg[MTK_DP_SDP_MAX_NUM] = {
+	[MTK_DP_SDP_NONE]	= 0x0,
+	[MTK_DP_SDP_ACM]	= MTK_DP_ENC0_P0_30B4,
+	[MTK_DP_SDP_ISRC]	= MTK_DP_ENC0_P0_30B4 + 1,
+	[MTK_DP_SDP_AVI]	= MTK_DP_ENC0_P0_30A4 + 1,
+	[MTK_DP_SDP_AUI]	= MTK_DP_ENC0_P0_30A8,
+	[MTK_DP_SDP_SPD]	= MTK_DP_ENC0_P0_30A8 + 1,
+	[MTK_DP_SDP_MPEG]	= MTK_DP_ENC0_P0_30AC,
+	[MTK_DP_SDP_NTSC]	= MTK_DP_ENC0_P0_30AC + 1,
+	[MTK_DP_SDP_VSP]	= MTK_DP_ENC0_P0_30B0,
+	[MTK_DP_SDP_VSC]	= MTK_DP_ENC0_P0_30B8,
+	[MTK_DP_SDP_EXT]	= MTK_DP_ENC0_P0_30B0 + 1,
+	[MTK_DP_SDP_PPS0]	= MTK_DP_ENC0_P0_31E8,
+	[MTK_DP_SDP_PPS1]	= MTK_DP_ENC0_P0_31E8,
+	[MTK_DP_SDP_PPS2]	= MTK_DP_ENC0_P0_31E8,
+	[MTK_DP_SDP_PPS3]	= MTK_DP_ENC0_P0_31E8,
+	[MTK_DP_SDP_DRM]	= MTK_DP_ENC0_P0_31DC,
+};
+
+static void mtk_dp_disable_sdp(struct mtk_dp *mtk_dp, enum mtk_dp_sdp_type type)
+{
+	if (type == MTK_DP_SDP_NONE)
+		return;
+
+	/* Disable periodic send */
+	mtk_dp_update_bits(mtk_dp, sdp_type_to_reg[type] & 0xfffc, 0,
+			   0xFF << ((sdp_type_to_reg[type] & 3) * 8));
+}
+
+static void mtk_dp_setup_sdp(struct mtk_dp *mtk_dp,
+			     struct mtk_dp_sdp_packet *packet)
+{
+	u32 reg, shift;
+
+	mtk_dp_sdp_set_data(mtk_dp, packet->sdp.db);
+	mtk_dp_sdp_set_header(mtk_dp, packet->type, &packet->sdp.sdp_header);
+
+	mtk_dp_disable_sdp(mtk_dp, packet->type);
+
+	switch (packet->type) {
+	case MTK_DP_SDP_ISRC:
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_31EC,
+				   0x1C << ISRC1_HB3_DP_ENC0_P0_SHIFT,
+				   ISRC1_HB3_DP_ENC0_P0_MASK);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280,
+				   MTK_DP_SDP_ISRC,
+				   SDP_PACKET_TYPE_DP_ENC1_P0_MASK);
+
+		if (packet->sdp.sdp_header.HB3 & BIT(2))
+			mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
+					   BIT(ISRC_CONT_DP_ENC0_P0_SHIFT),
+					   ISRC_CONT_DP_ENC0_P0_MASK);
+		else
+			mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
+					   0, ISRC_CONT_DP_ENC0_P0_MASK);
+
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280,
+				   SDP_PACKET_W_DP_ENC1_P0,
+				   SDP_PACKET_W_DP_ENC1_P0);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30B4,
+				   5 << ISRC_CFG_DP_ENC0_P0_SHIFT,
+				   ISRC_CFG_DP_ENC0_P0_MASK);
+		break;
+	case MTK_DP_SDP_DRM:
+		mtk_dp_sdp_trigger_packet(mtk_dp, packet->type);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_31DC,
+				   5 << HDR0_CFG_DP_ENC0_P0_SHIFT,
+				   HDR0_CFG_DP_ENC0_P0_MASK);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_31EC,
+				   0x1C << ISRC1_HB3_DP_ENC0_P0_SHIFT,
+				   ISRC1_HB3_DP_ENC0_P0_MASK);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280,
+				   MTK_DP_SDP_ISRC,
+				   SDP_PACKET_TYPE_DP_ENC1_P0_MASK);
+
+		if (packet->sdp.sdp_header.HB3 & BIT(2))
+			mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
+					   BIT(ISRC_CONT_DP_ENC0_P0_SHIFT),
+					   ISRC_CONT_DP_ENC0_P0_MASK);
+		else
+			mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
+					   0, ISRC_CONT_DP_ENC0_P0_MASK);
+
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3280,
+				   SDP_PACKET_W_DP_ENC1_P0,
+				   SDP_PACKET_W_DP_ENC1_P0);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30B4,
+				   5 << ISRC_CFG_DP_ENC0_P0_SHIFT,
+				   ISRC_CFG_DP_ENC0_P0_MASK);
+		break;
+	case MTK_DP_SDP_ACM:
+	case MTK_DP_SDP_AVI:
+	case MTK_DP_SDP_AUI:
+	case MTK_DP_SDP_SPD:
+	case MTK_DP_SDP_MPEG:
+	case MTK_DP_SDP_NTSC:
+	case MTK_DP_SDP_VSP:
+	case MTK_DP_SDP_VSC:
+	case MTK_DP_SDP_EXT:
+	case MTK_DP_SDP_PPS0:
+	case MTK_DP_SDP_PPS1:
+	case MTK_DP_SDP_PPS2:
+	case MTK_DP_SDP_PPS3:
+		reg = sdp_type_to_reg[packet->type];
+		shift = (reg & 3) * 8;
+
+		mtk_dp_sdp_trigger_packet(mtk_dp, packet->type);
+		/* Enable periodic sending */
+		mtk_dp_update_bits(mtk_dp, reg & 0xfffc,
+				   0x05 << shift, 0xff << shift);
+		break;
+	case MTK_DP_SDP_NONE:
+	default:
+		break;
+	}
+}
+
+static void mtk_dp_sdp_vsc_ext_disable(struct mtk_dp *mtk_dp)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30A0,
+			   0, BIT(7) | BIT(8) | BIT(12));
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_328C, 0, BIT(7));
+}
+
 static void mtk_dp_aux_irq_clear(struct mtk_dp *mtk_dp)
 {
 	mtk_dp_write(mtk_dp, MTK_DP_AUX_P0_3640,
@@ -1088,6 +1414,32 @@ static void mtk_dp_video_mute(struct mtk_dp *mtk_dp, bool enable)
 			    MTK_DP_SIP_ATF_VIDEO_UNMUTE, enable);
 }
 
+static void mtk_dp_audio_mute(struct mtk_dp *mtk_dp, bool mute)
+{
+	u32 val[3];
+
+	if (mute) {
+		val[0] = BIT(VBID_AUDIO_MUTE_SW_DP_ENC0_P0_SHIFT) |
+			 BIT(VBID_AUDIO_MUTE_SEL_DP_ENC0_P0_SHIFT);
+		val[1] = 0;
+		val[2] = 0;
+	} else {
+		val[0] = 0;
+		val[1] = BIT(AU_EN_DP_ENC0_P0_SHIFT);
+		/* Send one every two frames */
+		val[2] = 0x0F;
+	}
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3030,
+			   val[0],
+			   VBID_AUDIO_MUTE_FLAG_SW_DP_ENC0_P0_MASK |
+			   VBID_AUDIO_MUTE_FLAG_SEL_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3088,
+			   val[1], AU_EN_DP_ENC0_P0_MASK);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30A4,
+			   val[2], AU_TS_CFG_DP_ENC0_P0_MASK);
+}
+
 static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
 {
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE,
@@ -1135,6 +1487,78 @@ static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
 	mtk_dp->info.timings.frame_rate = 60;
 
 	mtk_dp->has_fec = false;
+	mtk_dp->audio_enable = false;
+}
+
+static void mtk_dp_sdp_set_down_cnt_init(struct mtk_dp *mtk_dp,
+					 u32 sram_read_start)
+{
+	u32 sdp_down_cnt_init = 0;
+	struct drm_display_mode mode;
+	struct mtk_dp_timings *timings = &mtk_dp->info.timings;
+
+	drm_display_mode_from_videomode(&timings->vm, &mode);
+
+	if (mtk_dp->info.timings.pix_rate_khz > 0)
+		sdp_down_cnt_init = sram_read_start *
+				    mtk_dp->train_info.link_rate * 2700 * 8 /
+				    (timings->pix_rate_khz * 4);
+
+	switch (mtk_dp->train_info.lane_count) {
+	case 1:
+		sdp_down_cnt_init = max_t(u32, sdp_down_cnt_init, 0x1A);
+		break;
+	case 2:
+		/* case for LowResolution && High Audio Sample Rate */
+		sdp_down_cnt_init = max_t(u32, sdp_down_cnt_init, 0x10);
+		sdp_down_cnt_init += mode.vtotal <= 525 ? 4 : 0;
+		break;
+	case 4:
+	default:
+		sdp_down_cnt_init = max_t(u32, sdp_down_cnt_init, 6);
+		break;
+	}
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3040,
+			   sdp_down_cnt_init
+			   << SDP_DOWN_CNT_INIT_DP_ENC0_P0_SHIFT,
+			   SDP_DOWN_CNT_INIT_DP_ENC0_P0_MASK);
+}
+
+static void mtk_dp_sdp_set_down_cnt_init_in_hblank(struct mtk_dp *mtk_dp)
+{
+	int pix_clk_mhz;
+	u32 dc_offset;
+	u32 spd_down_cnt_init = 0;
+	struct drm_display_mode mode;
+	struct mtk_dp_timings *timings = &mtk_dp->info.timings;
+
+	drm_display_mode_from_videomode(&timings->vm, &mode);
+
+	pix_clk_mhz = mtk_dp->info.format == DP_PIXELFORMAT_YUV420 ?
+		      mtk_dp->info.timings.pix_rate_khz / 2000 :
+		      mtk_dp->info.timings.pix_rate_khz / 1000;
+
+	switch (mtk_dp->train_info.lane_count) {
+	case 1:
+		spd_down_cnt_init = 0x20;
+		break;
+	case 2:
+		dc_offset = (mode.vtotal <= 525) ? 0x14 : 0x00;
+		spd_down_cnt_init = 0x18 + dc_offset;
+		break;
+	case 4:
+	default:
+		dc_offset = (mode.vtotal <= 525) ? 0x08 : 0x00;
+		if (pix_clk_mhz > mtk_dp->train_info.link_rate * 27)
+			spd_down_cnt_init = 0x8;
+		else
+			spd_down_cnt_init = 0x10 + dc_offset;
+		break;
+	}
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3364, spd_down_cnt_init,
+			   SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK);
 }
 
 static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
@@ -1151,6 +1575,8 @@ static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
 	}
 
 	mtk_dp_setup_encoder(mtk_dp);
+	mtk_dp_sdp_set_down_cnt_init_in_hblank(mtk_dp);
+	mtk_dp_sdp_set_down_cnt_init(mtk_dp, sram_read_start);
 }
 
 static void mtk_dp_calculate_pixrate(struct mtk_dp *mtk_dp)
@@ -1184,6 +1610,14 @@ static void mtk_dp_set_tx_out(struct mtk_dp *mtk_dp)
 	mtk_dp_setup_tu(mtk_dp);
 }
 
+static void mtk_dp_edid_free(struct mtk_dp *mtk_dp)
+{
+	mutex_lock(&mtk_dp->edid_lock);
+	kfree(mtk_dp->edid);
+	mtk_dp->edid = NULL;
+	mutex_unlock(&mtk_dp->edid_lock);
+}
+
 static ssize_t mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
 {
 	ssize_t ret;
@@ -1217,6 +1651,7 @@ static ssize_t mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
 
 	if (DP_GET_SINK_COUNT(sink_count) &&
 	    (link_status[2] & DP_DOWNSTREAM_PORT_STATUS_CHANGED)) {
+		mtk_dp_edid_free(mtk_dp);
 		mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING;
 		msleep(20);
 	}
@@ -1224,6 +1659,17 @@ static ssize_t mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
 	return 0;
 }
 
+static void mtk_dp_sdp_stop_sending(struct mtk_dp *mtk_dp)
+{
+	u8 packet_type;
+
+	for (packet_type = MTK_DP_SDP_ACM; packet_type < MTK_DP_SDP_MAX_NUM;
+	     packet_type++)
+		mtk_dp_disable_sdp(mtk_dp, packet_type);
+
+	mtk_dp_sdp_vsc_ext_disable(mtk_dp);
+}
+
 static void mtk_dp_train_update_swing_pre(struct mtk_dp *mtk_dp, int lanes,
 					  u8 dpcd_adjust_req[2])
 {
@@ -1516,6 +1962,55 @@ static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
 	return 0;
 }
 
+static bool mtk_dp_edid_parse_audio_capabilities(struct mtk_dp *mtk_dp,
+						 struct mtk_dp_audio_cfg *cfg)
+{
+	struct cea_sad *sads;
+	int sad_count;
+	int i;
+	bool ret = false;
+
+	if (mtk_dp_is_edp(mtk_dp))
+		return false;
+
+	mutex_lock(&mtk_dp->edid_lock);
+	if (!mtk_dp->edid) {
+		mutex_unlock(&mtk_dp->edid_lock);
+		dev_err(mtk_dp->dev, "EDID not found!\n");
+		return false;
+	}
+	sad_count = drm_edid_to_sad(mtk_dp->edid, &sads);
+	mutex_unlock(&mtk_dp->edid_lock);
+
+	if (sad_count <= 0) {
+		drm_info(mtk_dp->drm_dev, "The SADs is NULL\n");
+		return false;
+	}
+
+	for (i = 0; i < sad_count; i++) {
+		int sample_rate, word_length;
+
+		/* Only PCM supported at the moment */
+		if (sads[i].format != HDMI_AUDIO_CODING_TYPE_PCM)
+			continue;
+
+		sample_rate = drm_cea_sad_get_sample_rate(&sads[i]);
+		word_length =
+			drm_cea_sad_get_uncompressed_word_length(&sads[i]);
+		if (sample_rate <= 0 || word_length <= 0)
+			continue;
+
+		cfg->channels = sads[i].channels;
+		cfg->word_length_bits = word_length;
+		cfg->sample_rate = sample_rate;
+		ret = true;
+		break;
+	}
+	kfree(sads);
+
+	return ret;
+}
+
 static void mtk_dp_train_change_mode(struct mtk_dp *mtk_dp)
 {
 	phy_reset(mtk_dp->phy);
@@ -1609,6 +2104,48 @@ static void mtk_dp_video_enable(struct mtk_dp *mtk_dp, bool enable)
 	}
 }
 
+static void mtk_dp_audio_sdp_setup(struct mtk_dp *mtk_dp,
+				   struct mtk_dp_audio_cfg *cfg)
+{
+	struct mtk_dp_sdp_packet packet;
+	struct hdmi_audio_infoframe frame;
+
+	hdmi_audio_infoframe_init(&frame);
+	frame.coding_type = HDMI_AUDIO_CODING_TYPE_PCM;
+	frame.channels = cfg->channels;
+	frame.sample_frequency = cfg->sample_rate;
+
+	switch (cfg->word_length_bits) {
+	case 16:
+		frame.sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+		break;
+	case 20:
+		frame.sample_size = HDMI_AUDIO_SAMPLE_SIZE_20;
+		break;
+	case 24:
+	default:
+		frame.sample_size = HDMI_AUDIO_SAMPLE_SIZE_24;
+		break;
+	}
+
+	packet.type = MTK_DP_SDP_AUI;
+	hdmi_audio_infoframe_pack_for_dp(&frame, &packet.sdp,
+					 MTK_DP_DP_VERSION_11);
+
+	mtk_dp_audio_sdp_asp_set_channels(mtk_dp, cfg->channels);
+	mtk_dp_setup_sdp(mtk_dp, &packet);
+}
+
+static void mtk_dp_audio_setup(struct mtk_dp *mtk_dp,
+			       struct mtk_dp_audio_cfg *cfg)
+{
+	mtk_dp_audio_sdp_setup(mtk_dp, cfg);
+	mtk_dp_audio_channel_status_set(mtk_dp, cfg);
+
+	mtk_dp_audio_setup_channels(mtk_dp, cfg);
+	mtk_dp_audio_set_divider(mtk_dp);
+}
+
 static void mtk_dp_video_config(struct mtk_dp *mtk_dp)
 {
 	mtk_dp_mn_overwrite_disable(mtk_dp);
@@ -1635,6 +2172,19 @@ static int mtk_dp_training(struct mtk_dp *mtk_dp)
 		case MTK_DP_TRAIN_STATE_NORMAL:
 			mtk_dp_video_config(mtk_dp);
 			mtk_dp_video_enable(mtk_dp, true);
+
+			mtk_dp->audio_enable =
+				mtk_dp_edid_parse_audio_capabilities(mtk_dp,
+								     &mtk_dp->info.audio_caps);
+
+			if (mtk_dp->audio_enable) {
+				mtk_dp_audio_setup(mtk_dp, &mtk_dp->info.audio_caps);
+				mtk_dp_audio_mute(mtk_dp, false);
+			} else {
+				memset(&mtk_dp->info.audio_caps, 0,
+				       sizeof(mtk_dp->info.audio_caps));
+			}
+
 			training_done = true;
 			break;
 		default:
@@ -1696,12 +2246,15 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 
 		if (!mtk_dp->train_info.cable_plugged_in) {
 			mtk_dp_video_mute(mtk_dp, true);
+			mtk_dp_audio_mute(mtk_dp, true);
 
 			mtk_dp_initialize_priv_data(mtk_dp);
 			mtk_dp_set_idle_pattern(mtk_dp, true);
 			if (mtk_dp->has_fec)
 				mtk_dp_fec_enable(mtk_dp, false);
+			mtk_dp_sdp_stop_sending(mtk_dp);
 
+			mtk_dp_edid_free(mtk_dp);
 			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
 					   DP_PWR_STATE_BANDGAP_TPLL,
 					   DP_PWR_STATE_MASK);
@@ -1841,6 +2394,18 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 	return ret;
 }
 
+static void mtk_dp_update_plugged_status(struct mtk_dp *mtk_dp)
+{
+	bool connected, has_audio;
+
+	mutex_lock(&mtk_dp->update_plugged_status_lock);
+	connected = mtk_dp_plug_state_avoid_pulse(mtk_dp);
+	has_audio = drm_detect_monitor_audio(mtk_dp->edid);
+	if (mtk_dp->plugged_cb && mtk_dp->codec_dev)
+		mtk_dp->plugged_cb(mtk_dp->codec_dev, connected & has_audio);
+	mutex_unlock(&mtk_dp->update_plugged_status_lock);
+}
+
 static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
@@ -1856,6 +2421,7 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 			ret = connector_status_connected;
 	}
 
+	mtk_dp_update_plugged_status(mtk_dp);
 	return ret;
 }
 
@@ -1878,6 +2444,18 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 	if (!enabled)
 		drm_bridge_chain_post_disable(bridge);
 
+	mutex_lock(&mtk_dp->edid_lock);
+	kfree(mtk_dp->edid);
+	mtk_dp->edid = NULL;
+
+	if (!new_edid) {
+		mutex_unlock(&mtk_dp->edid_lock);
+		return NULL;
+	}
+
+	mtk_dp->edid = drm_edid_duplicate(new_edid);
+	mutex_unlock(&mtk_dp->edid_lock);
+
 	return new_edid;
 }
 
@@ -2049,6 +2627,7 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	}
 
 	mtk_dp_video_mute(mtk_dp, true);
+	mtk_dp_audio_mute(mtk_dp, true);
 	mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING;
 
 	mtk_dp->enabled = false;
@@ -2079,6 +2658,8 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	}
 
 	mtk_dp_video_mute(mtk_dp, true);
+	mtk_dp_audio_mute(mtk_dp, true);
+	mtk_dp_sdp_stop_sending(mtk_dp);
 
 	if (mtk_dp_parse_capabilities(mtk_dp)) {
 		drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
@@ -2091,7 +2672,13 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
+	mutex_lock(&mtk_dp->eld_lock);
+	memcpy(mtk_dp->connector_eld, mtk_dp->conn->eld, MAX_ELD_BYTES);
+	mutex_unlock(&mtk_dp->eld_lock);
+
 	mtk_dp->enabled = true;
+
+	mtk_dp_update_plugged_status(mtk_dp);
 }
 
 static enum drm_mode_status
@@ -2239,6 +2826,104 @@ static void mtk_dp_debounce_timer(struct timer_list *t)
 	mtk_dp->need_debounce = true;
 }
 
+/*
+ * HDMI audio codec callbacks
+ */
+static int mtk_dp_audio_hw_params(struct device *dev, void *data,
+				  struct hdmi_codec_daifmt *daifmt,
+				  struct hdmi_codec_params *params)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+	struct mtk_dp_audio_cfg cfg;
+
+	if (!mtk_dp->enabled) {
+		pr_err("%s, DP is not ready!\n", __func__);
+		return -ENODEV;
+	}
+
+	cfg.channels = params->cea.channels;
+	cfg.sample_rate = params->sample_rate;
+	cfg.word_length_bits = 24;
+
+	mtk_dp_audio_setup(mtk_dp, &cfg);
+
+	return 0;
+}
+
+static int mtk_dp_audio_startup(struct device *dev, void *data)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+
+	mtk_dp_audio_mute(mtk_dp, false);
+
+	return 0;
+}
+
+static void mtk_dp_audio_shutdown(struct device *dev, void *data)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+
+	mtk_dp_audio_mute(mtk_dp, true);
+}
+
+static int mtk_dp_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
+				size_t len)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+
+	if (mtk_dp->enabled)
+		memcpy(buf, mtk_dp->connector_eld, len);
+	else
+		memset(buf, 0, len);
+
+	return 0;
+}
+
+static int mtk_dp_audio_hook_plugged_cb(struct device *dev, void *data,
+					hdmi_codec_plugged_cb fn,
+					struct device *codec_dev)
+{
+	struct mtk_dp *mtk_dp = data;
+
+	mutex_lock(&mtk_dp->update_plugged_status_lock);
+	mtk_dp->plugged_cb = fn;
+	mtk_dp->codec_dev = codec_dev;
+	mutex_unlock(&mtk_dp->update_plugged_status_lock);
+
+	mtk_dp_update_plugged_status(mtk_dp);
+
+	return 0;
+}
+
+static const struct hdmi_codec_ops mtk_dp_audio_codec_ops = {
+	.hw_params = mtk_dp_audio_hw_params,
+	.audio_startup = mtk_dp_audio_startup,
+	.audio_shutdown = mtk_dp_audio_shutdown,
+	.get_eld = mtk_dp_audio_get_eld,
+	.hook_plugged_cb = mtk_dp_audio_hook_plugged_cb,
+	.no_capture_mute = 1,
+};
+
+static int mtk_dp_register_audio_driver(struct device *dev)
+{
+	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &mtk_dp_audio_codec_ops,
+		.max_i2s_channels = 8,
+		.i2s = 1,
+		.data = mtk_dp,
+	};
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO, &codec_data,
+					     sizeof(codec_data));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	return 0;
+}
+
 static int mtk_dp_probe(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp;
@@ -2285,9 +2970,21 @@ static int mtk_dp_probe(struct platform_device *pdev)
 				     "failed to request mediatek dptx irq\n");
 
 	mutex_init(&mtk_dp->dp_lock);
+	mutex_init(&mtk_dp->edid_lock);
+	mutex_init(&mtk_dp->eld_lock);
+	mutex_init(&mtk_dp->update_plugged_status_lock);
 
 	platform_set_drvdata(pdev, mtk_dp);
 
+	if (!mtk_dp_is_edp(mtk_dp)) {
+		ret = mtk_dp_register_audio_driver(dev);
+		if (ret) {
+			dev_err(dev, "Failed to register audio driver: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
 	mtk_dp->phy_dev = platform_device_register_data(dev, "mediatek-dp-phy",
 							PLATFORM_DEVID_AUTO,
 							&mtk_dp->regs,
@@ -2333,6 +3030,7 @@ static int mtk_dp_remove(struct platform_device *pdev)
 
 	platform_device_unregister(mtk_dp->phy_dev);
 	mtk_dp_video_mute(mtk_dp, true);
+	mtk_dp_audio_mute(mtk_dp, true);
 	del_timer_sync(&mtk_dp->debounce_timer);
 
 	pm_runtime_disable(&pdev->dev);
-- 
2.18.0

