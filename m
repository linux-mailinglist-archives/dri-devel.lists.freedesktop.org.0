Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB18A3882C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 16:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EC310E527;
	Mon, 17 Feb 2025 15:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KYwK6rhs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252DE10E525
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 15:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739807383;
 bh=49yhbWmmpCyq3HDpjokOEmmKj3EwdezMp6oiFSUwhmA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KYwK6rhs5V1zK+DLvShi0Gvy9zYU5UwYm1o5F4WhqpbG612+M6Gh+w4Zo2eIg8VKO
 wSDM3thv7o+MCpgDt9pwFraPzAIX7huBDfcakPGD6PP62nHAjtBq8yqKVRTOeGunbN
 3yd2+FQvRvM3uIgGSmtFoVgT/laY6fMvGqLJeyg5jnSpmx4/w94waRLOwUddlDLwhn
 vDrgHMhgZwWl907uqxv/sSVTNv6Z5PuLEbde/4IsRI4Ewj7FxzNplCAC/FZG9wnHaN
 YN2OUrK/ZLND1opHCTdwgwUWcv8KdmzRbM1cluhLdk5j+RBlZiTL6oo17x3nAuwOAP
 orcEaa1/WRZcw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8776017E1571;
 Mon, 17 Feb 2025 16:49:42 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com,
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com, Guillaume Ranquet <granquet@baylibre.com>
Subject: [PATCH v7 18/43] drm/mediatek: hdmi: Use regmap instead of iomem for
 main registers
Date: Mon, 17 Feb 2025 16:48:11 +0100
Message-ID: <20250217154836.108895-19-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guillaume Ranquet <granquet@baylibre.com>

In preparation for the addition of a new version of the HDMI IP
which will need to share its iospace between multiple subdrivers,
and in preparation for moving out the common bits between the two,
migrate this driver to fully use regmap.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 173 +++++++++++-----------------
 1 file changed, 65 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index b9f4f06edde6..29000cfcf761 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -170,7 +170,7 @@ struct mtk_hdmi {
 	u32 ibias_up;
 	struct regmap *sys_regmap;
 	unsigned int sys_offset;
-	void __iomem *regs;
+	struct regmap *regs;
 	enum hdmi_colorspace csp;
 	struct platform_device *audio_pdev;
 	struct hdmi_audio_param aud_param;
@@ -187,50 +187,10 @@ static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
 	return container_of(b, struct mtk_hdmi, bridge);
 }
 
-static u32 mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset)
-{
-	return readl(hdmi->regs + offset);
-}
-
-static void mtk_hdmi_write(struct mtk_hdmi *hdmi, u32 offset, u32 val)
-{
-	writel(val, hdmi->regs + offset);
-}
-
-static void mtk_hdmi_clear_bits(struct mtk_hdmi *hdmi, u32 offset, u32 bits)
-{
-	void __iomem *reg = hdmi->regs + offset;
-	u32 tmp;
-
-	tmp = readl(reg);
-	tmp &= ~bits;
-	writel(tmp, reg);
-}
-
-static void mtk_hdmi_set_bits(struct mtk_hdmi *hdmi, u32 offset, u32 bits)
-{
-	void __iomem *reg = hdmi->regs + offset;
-	u32 tmp;
-
-	tmp = readl(reg);
-	tmp |= bits;
-	writel(tmp, reg);
-}
-
-static void mtk_hdmi_mask(struct mtk_hdmi *hdmi, u32 offset, u32 val, u32 mask)
-{
-	void __iomem *reg = hdmi->regs + offset;
-	u32 tmp;
-
-	tmp = readl(reg);
-	tmp = (tmp & ~mask) | (val & mask);
-	writel(tmp, reg);
-}
-
 static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
 {
-	mtk_hdmi_mask(hdmi, VIDEO_CFG_4, black ? GEN_RGB : NORMAL_PATH,
-		      VIDEO_SOURCE_SEL);
+	regmap_update_bits(hdmi->regs, VIDEO_SOURCE_SEL,
+			   VIDEO_CFG_4, black ? GEN_RGB : NORMAL_PATH);
 }
 
 static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool enable)
@@ -265,12 +225,12 @@ static void mtk_hdmi_hw_1p4_version_enable(struct mtk_hdmi *hdmi, bool enable)
 
 static void mtk_hdmi_hw_aud_mute(struct mtk_hdmi *hdmi)
 {
-	mtk_hdmi_set_bits(hdmi, GRL_AUDIO_CFG, AUDIO_ZERO);
+	regmap_set_bits(hdmi->regs, GRL_AUDIO_CFG, AUDIO_ZERO);
 }
 
 static void mtk_hdmi_hw_aud_unmute(struct mtk_hdmi *hdmi)
 {
-	mtk_hdmi_clear_bits(hdmi, GRL_AUDIO_CFG, AUDIO_ZERO);
+	regmap_clear_bits(hdmi->regs, GRL_AUDIO_CFG, AUDIO_ZERO);
 }
 
 static void mtk_hdmi_hw_reset(struct mtk_hdmi *hdmi)
@@ -279,25 +239,25 @@ static void mtk_hdmi_hw_reset(struct mtk_hdmi *hdmi)
 			   HDMI_RST, HDMI_RST);
 	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG1C,
 			   HDMI_RST, 0);
-	mtk_hdmi_clear_bits(hdmi, GRL_CFG3, CFG3_CONTROL_PACKET_DELAY);
+	regmap_clear_bits(hdmi->regs, GRL_CFG3, CFG3_CONTROL_PACKET_DELAY);
 	regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG1C,
 			   ANLG_ON, ANLG_ON);
 }
 
 static void mtk_hdmi_hw_enable_notice(struct mtk_hdmi *hdmi, bool enable_notice)
 {
-	mtk_hdmi_mask(hdmi, GRL_CFG2, enable_notice ? CFG2_NOTICE_EN : 0,
-		      CFG2_NOTICE_EN);
+	regmap_update_bits(hdmi->regs, GRL_CFG2, CFG2_NOTICE_EN,
+			   enable_notice ? CFG2_NOTICE_EN : 0);
 }
 
 static void mtk_hdmi_hw_write_int_mask(struct mtk_hdmi *hdmi, u32 int_mask)
 {
-	mtk_hdmi_write(hdmi, GRL_INT_MASK, int_mask);
+	regmap_write(hdmi->regs, GRL_INT_MASK, int_mask);
 }
 
 static void mtk_hdmi_hw_enable_dvi_mode(struct mtk_hdmi *hdmi, bool enable)
 {
-	mtk_hdmi_mask(hdmi, GRL_CFG1, enable ? CFG1_DVI : 0, CFG1_DVI);
+	regmap_update_bits(hdmi->regs, GRL_CFG1, CFG1_DVI, enable ? CFG1_DVI : 0);
 }
 
 static void mtk_hdmi_hw_send_info_frame(struct mtk_hdmi *hdmi, u8 *buffer,
@@ -343,22 +303,22 @@ static void mtk_hdmi_hw_send_info_frame(struct mtk_hdmi *hdmi, u8 *buffer,
 		dev_err(hdmi->dev, "Unknown infoframe type %d\n", frame_type);
 		return;
 	}
-	mtk_hdmi_clear_bits(hdmi, ctrl_reg, ctrl_frame_en);
-	mtk_hdmi_write(hdmi, GRL_INFOFRM_TYPE, frame_type);
-	mtk_hdmi_write(hdmi, GRL_INFOFRM_VER, frame_ver);
-	mtk_hdmi_write(hdmi, GRL_INFOFRM_LNG, frame_len);
+	regmap_clear_bits(hdmi->regs, ctrl_reg, ctrl_frame_en);
+	regmap_write(hdmi->regs, GRL_INFOFRM_TYPE, frame_type);
+	regmap_write(hdmi->regs, GRL_INFOFRM_VER, frame_ver);
+	regmap_write(hdmi->regs, GRL_INFOFRM_LNG, frame_len);
 
-	mtk_hdmi_write(hdmi, GRL_IFM_PORT, checksum);
+	regmap_write(hdmi->regs, GRL_IFM_PORT, checksum);
 	for (i = 0; i < frame_len; i++)
-		mtk_hdmi_write(hdmi, GRL_IFM_PORT, frame_data[i]);
+		regmap_write(hdmi->regs, GRL_IFM_PORT, frame_data[i]);
 
-	mtk_hdmi_set_bits(hdmi, ctrl_reg, ctrl_frame_en);
+	regmap_set_bits(hdmi->regs, ctrl_reg, ctrl_frame_en);
 }
 
 static void mtk_hdmi_hw_send_aud_packet(struct mtk_hdmi *hdmi, bool enable)
 {
-	mtk_hdmi_mask(hdmi, GRL_SHIFT_R2, enable ? 0 : AUDIO_PACKET_OFF,
-		      AUDIO_PACKET_OFF);
+	regmap_update_bits(hdmi->regs, AUDIO_PACKET_OFF,
+			   GRL_SHIFT_R2, enable ? 0 : AUDIO_PACKET_OFF);
 }
 
 static void mtk_hdmi_hw_config_sys(struct mtk_hdmi *hdmi)
@@ -379,44 +339,44 @@ static void mtk_hdmi_hw_set_deep_color_mode(struct mtk_hdmi *hdmi)
 
 static void mtk_hdmi_hw_send_av_mute(struct mtk_hdmi *hdmi)
 {
-	mtk_hdmi_clear_bits(hdmi, GRL_CFG4, CTRL_AVMUTE);
+	regmap_clear_bits(hdmi->regs, GRL_CFG4, CTRL_AVMUTE);
 	usleep_range(2000, 4000);
-	mtk_hdmi_set_bits(hdmi, GRL_CFG4, CTRL_AVMUTE);
+	regmap_set_bits(hdmi->regs, GRL_CFG4, CTRL_AVMUTE);
 }
 
 static void mtk_hdmi_hw_send_av_unmute(struct mtk_hdmi *hdmi)
 {
-	mtk_hdmi_mask(hdmi, GRL_CFG4, CFG4_AV_UNMUTE_EN,
-		      CFG4_AV_UNMUTE_EN | CFG4_AV_UNMUTE_SET);
+	regmap_update_bits(hdmi->regs, GRL_CFG4, CFG4_AV_UNMUTE_EN | CFG4_AV_UNMUTE_SET,
+			   CFG4_AV_UNMUTE_EN);
 	usleep_range(2000, 4000);
-	mtk_hdmi_mask(hdmi, GRL_CFG4, CFG4_AV_UNMUTE_SET,
-		      CFG4_AV_UNMUTE_EN | CFG4_AV_UNMUTE_SET);
+	regmap_update_bits(hdmi->regs, GRL_CFG4, CFG4_AV_UNMUTE_EN | CFG4_AV_UNMUTE_SET,
+			   CFG4_AV_UNMUTE_SET);
 }
 
 static void mtk_hdmi_hw_ncts_enable(struct mtk_hdmi *hdmi, bool on)
 {
-	mtk_hdmi_mask(hdmi, GRL_CTS_CTRL, on ? 0 : CTS_CTRL_SOFT,
-		      CTS_CTRL_SOFT);
+	regmap_update_bits(hdmi->regs, GRL_CTS_CTRL, CTS_CTRL_SOFT,
+			   on ? 0 : CTS_CTRL_SOFT);
 }
 
 static void mtk_hdmi_hw_ncts_auto_write_enable(struct mtk_hdmi *hdmi,
 					       bool enable)
 {
-	mtk_hdmi_mask(hdmi, GRL_CTS_CTRL, enable ? NCTS_WRI_ANYTIME : 0,
-		      NCTS_WRI_ANYTIME);
+	regmap_update_bits(hdmi->regs, GRL_CTS_CTRL, NCTS_WRI_ANYTIME,
+			   enable ? NCTS_WRI_ANYTIME : 0);
 }
 
 static void mtk_hdmi_hw_msic_setting(struct mtk_hdmi *hdmi,
 				     struct drm_display_mode *mode)
 {
-	mtk_hdmi_clear_bits(hdmi, GRL_CFG4, CFG4_MHL_MODE);
+	regmap_clear_bits(hdmi->regs, GRL_CFG4, CFG4_MHL_MODE);
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE &&
 	    mode->clock == 74250 &&
 	    mode->vdisplay == 1080)
-		mtk_hdmi_clear_bits(hdmi, GRL_CFG2, CFG2_MHL_DE_SEL);
+		regmap_clear_bits(hdmi->regs, GRL_CFG2, CFG2_MHL_DE_SEL);
 	else
-		mtk_hdmi_set_bits(hdmi, GRL_CFG2, CFG2_MHL_DE_SEL);
+		regmap_set_bits(hdmi->regs, GRL_CFG2, CFG2_MHL_DE_SEL);
 }
 
 static void mtk_hdmi_hw_aud_set_channel_swap(struct mtk_hdmi *hdmi,
@@ -444,7 +404,7 @@ static void mtk_hdmi_hw_aud_set_channel_swap(struct mtk_hdmi *hdmi,
 		swap_bit = LFE_CC_SWAP;
 		break;
 	}
-	mtk_hdmi_mask(hdmi, GRL_CH_SWAP, swap_bit, 0xff);
+	regmap_update_bits(hdmi->regs, GRL_CH_SWAP, 0xff, swap_bit);
 }
 
 static void mtk_hdmi_hw_aud_set_bit_num(struct mtk_hdmi *hdmi,
@@ -465,7 +425,7 @@ static void mtk_hdmi_hw_aud_set_bit_num(struct mtk_hdmi *hdmi,
 		break;
 	}
 
-	mtk_hdmi_mask(hdmi, GRL_AOUT_CFG, val, AOUT_BNUM_SEL_MASK);
+	regmap_update_bits(hdmi->regs, GRL_AOUT_CFG, AOUT_BNUM_SEL_MASK, val);
 }
 
 static void mtk_hdmi_hw_aud_set_i2s_fmt(struct mtk_hdmi *hdmi,
@@ -473,7 +433,7 @@ static void mtk_hdmi_hw_aud_set_i2s_fmt(struct mtk_hdmi *hdmi,
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_CFG0);
+	regmap_read(hdmi->regs, GRL_CFG0, &val);
 	val &= ~(CFG0_W_LENGTH_MASK | CFG0_I2S_MODE_MASK);
 
 	switch (i2s_fmt) {
@@ -497,7 +457,7 @@ static void mtk_hdmi_hw_aud_set_i2s_fmt(struct mtk_hdmi *hdmi,
 		val |= CFG0_I2S_MODE_I2S | CFG0_W_LENGTH_16BIT;
 		break;
 	}
-	mtk_hdmi_write(hdmi, GRL_CFG0, val);
+	regmap_write(hdmi->regs, GRL_CFG0, val);
 }
 
 static void mtk_hdmi_hw_audio_config(struct mtk_hdmi *hdmi, bool dst)
@@ -506,14 +466,14 @@ static void mtk_hdmi_hw_audio_config(struct mtk_hdmi *hdmi, bool dst)
 	u8 val;
 
 	/* Disable high bitrate, set DST packet normal/double */
-	mtk_hdmi_clear_bits(hdmi, GRL_AOUT_CFG, HIGH_BIT_RATE_PACKET_ALIGN);
+	regmap_clear_bits(hdmi->regs, GRL_AOUT_CFG, HIGH_BIT_RATE_PACKET_ALIGN);
 
 	if (dst)
 		val = DST_NORMAL_DOUBLE | SACD_DST;
 	else
 		val = 0;
 
-	mtk_hdmi_mask(hdmi, GRL_AUDIO_CFG, val, mask);
+	regmap_update_bits(hdmi->regs, GRL_AUDIO_CFG, mask, val);
 }
 
 static void mtk_hdmi_hw_aud_set_i2s_chan_num(struct mtk_hdmi *hdmi,
@@ -554,10 +514,10 @@ static void mtk_hdmi_hw_aud_set_i2s_chan_num(struct mtk_hdmi *hdmi,
 		i2s_uv = I2S_UV_CH_EN(0);
 	}
 
-	mtk_hdmi_write(hdmi, GRL_CH_SW0, ch_switch & 0xff);
-	mtk_hdmi_write(hdmi, GRL_CH_SW1, (ch_switch >> 8) & 0xff);
-	mtk_hdmi_write(hdmi, GRL_CH_SW2, (ch_switch >> 16) & 0xff);
-	mtk_hdmi_write(hdmi, GRL_I2S_UV, i2s_uv);
+	regmap_write(hdmi->regs, GRL_CH_SW0, ch_switch & 0xff);
+	regmap_write(hdmi->regs, GRL_CH_SW1, (ch_switch >> 8) & 0xff);
+	regmap_write(hdmi->regs, GRL_CH_SW2, (ch_switch >> 16) & 0xff);
+	regmap_write(hdmi->regs, GRL_I2S_UV, i2s_uv);
 }
 
 static void mtk_hdmi_hw_aud_set_input_type(struct mtk_hdmi *hdmi,
@@ -565,7 +525,7 @@ static void mtk_hdmi_hw_aud_set_input_type(struct mtk_hdmi *hdmi,
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_CFG1);
+	regmap_read(hdmi->regs, GRL_CFG1, &val);
 	if (input_type == HDMI_AUD_INPUT_I2S &&
 	    (val & CFG1_SPDIF) == CFG1_SPDIF) {
 		val &= ~CFG1_SPDIF;
@@ -573,7 +533,7 @@ static void mtk_hdmi_hw_aud_set_input_type(struct mtk_hdmi *hdmi,
 		(val & CFG1_SPDIF) == 0) {
 		val |= CFG1_SPDIF;
 	}
-	mtk_hdmi_write(hdmi, GRL_CFG1, val);
+	regmap_write(hdmi->regs, GRL_CFG1, val);
 }
 
 static void mtk_hdmi_hw_aud_set_channel_status(struct mtk_hdmi *hdmi,
@@ -582,13 +542,13 @@ static void mtk_hdmi_hw_aud_set_channel_status(struct mtk_hdmi *hdmi,
 	int i;
 
 	for (i = 0; i < 5; i++) {
-		mtk_hdmi_write(hdmi, GRL_I2S_C_STA0 + i * 4, channel_status[i]);
-		mtk_hdmi_write(hdmi, GRL_L_STATUS_0 + i * 4, channel_status[i]);
-		mtk_hdmi_write(hdmi, GRL_R_STATUS_0 + i * 4, channel_status[i]);
+		regmap_write(hdmi->regs, GRL_I2S_C_STA0 + i * 4, channel_status[i]);
+		regmap_write(hdmi->regs, GRL_L_STATUS_0 + i * 4, channel_status[i]);
+		regmap_write(hdmi->regs, GRL_R_STATUS_0 + i * 4, channel_status[i]);
 	}
 	for (; i < 24; i++) {
-		mtk_hdmi_write(hdmi, GRL_L_STATUS_0 + i * 4, 0);
-		mtk_hdmi_write(hdmi, GRL_R_STATUS_0 + i * 4, 0);
+		regmap_write(hdmi->regs, GRL_L_STATUS_0 + i * 4, 0);
+		regmap_write(hdmi->regs, GRL_R_STATUS_0 + i * 4, 0);
 	}
 }
 
@@ -596,13 +556,13 @@ static void mtk_hdmi_hw_aud_src_reenable(struct mtk_hdmi *hdmi)
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_MIX_CTRL);
+	regmap_read(hdmi->regs, GRL_MIX_CTRL, &val);
 	if (val & MIX_CTRL_SRC_EN) {
 		val &= ~MIX_CTRL_SRC_EN;
-		mtk_hdmi_write(hdmi, GRL_MIX_CTRL, val);
+		regmap_write(hdmi->regs, GRL_MIX_CTRL, val);
 		usleep_range(255, 512);
 		val |= MIX_CTRL_SRC_EN;
-		mtk_hdmi_write(hdmi, GRL_MIX_CTRL, val);
+		regmap_write(hdmi->regs, GRL_MIX_CTRL, val);
 	}
 }
 
@@ -610,10 +570,10 @@ static void mtk_hdmi_hw_aud_src_disable(struct mtk_hdmi *hdmi)
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_MIX_CTRL);
+	regmap_read(hdmi->regs, GRL_MIX_CTRL, &val);
 	val &= ~MIX_CTRL_SRC_EN;
-	mtk_hdmi_write(hdmi, GRL_MIX_CTRL, val);
-	mtk_hdmi_write(hdmi, GRL_SHIFT_L1, 0x00);
+	regmap_write(hdmi->regs, GRL_MIX_CTRL, val);
+	regmap_write(hdmi->regs, GRL_SHIFT_L1, 0x00);
 }
 
 static void mtk_hdmi_hw_aud_set_mclk(struct mtk_hdmi *hdmi,
@@ -621,7 +581,7 @@ static void mtk_hdmi_hw_aud_set_mclk(struct mtk_hdmi *hdmi,
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_CFG5);
+	regmap_read(hdmi->regs, GRL_CFG5, &val);
 	val &= CFG5_CD_RATIO_MASK;
 
 	switch (mclk) {
@@ -644,7 +604,7 @@ static void mtk_hdmi_hw_aud_set_mclk(struct mtk_hdmi *hdmi,
 		val |= CFG5_FS256;
 		break;
 	}
-	mtk_hdmi_write(hdmi, GRL_CFG5, val);
+	regmap_write(hdmi->regs, GRL_CFG5, val);
 }
 
 struct hdmi_acr_n {
@@ -728,9 +688,9 @@ static void do_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi, unsigned int n,
 	unsigned char val[NCTS_BYTES];
 	int i;
 
-	mtk_hdmi_write(hdmi, GRL_NCTS, 0);
-	mtk_hdmi_write(hdmi, GRL_NCTS, 0);
-	mtk_hdmi_write(hdmi, GRL_NCTS, 0);
+	regmap_write(hdmi->regs, GRL_NCTS, 0);
+	regmap_write(hdmi->regs, GRL_NCTS, 0);
+	regmap_write(hdmi->regs, GRL_NCTS, 0);
 	memset(val, 0, sizeof(val));
 
 	val[0] = (cts >> 24) & 0xff;
@@ -743,7 +703,7 @@ static void do_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi, unsigned int n,
 	val[6] = n & 0xff;
 
 	for (i = 0; i < NCTS_BYTES; i++)
-		mtk_hdmi_write(hdmi, GRL_NCTS, val[i]);
+		regmap_write(hdmi->regs, GRL_NCTS, val[i]);
 }
 
 static void mtk_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi,
@@ -758,8 +718,7 @@ static void mtk_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi,
 	dev_dbg(hdmi->dev, "%s: sample_rate=%u, clock=%d, cts=%u, n=%u\n",
 		__func__, sample_rate, clock, n, cts);
 
-	mtk_hdmi_mask(hdmi, DUMMY_304, AUDIO_I2S_NCTS_SEL_64,
-		      AUDIO_I2S_NCTS_SEL);
+	regmap_update_bits(hdmi->regs, DUMMY_304, AUDIO_I2S_NCTS_SEL, AUDIO_I2S_NCTS_SEL_64);
 	do_hdmi_hw_aud_set_ncts(hdmi, n, cts);
 }
 
@@ -879,7 +838,7 @@ static void mtk_hdmi_aud_set_input(struct mtk_hdmi *hdmi)
 	bool dst;
 
 	mtk_hdmi_hw_aud_set_channel_swap(hdmi, HDMI_AUD_SWAP_LFE_CC);
-	mtk_hdmi_set_bits(hdmi, GRL_MIX_CTRL, MIX_CTRL_FLAT);
+	regmap_set_bits(hdmi->regs, GRL_MIX_CTRL, MIX_CTRL_FLAT);
 
 	if (hdmi->aud_param.aud_input_type == HDMI_AUD_INPUT_SPDIF &&
 	    hdmi->aud_param.aud_codec == HDMI_AUDIO_CODING_TYPE_DST) {
@@ -911,7 +870,7 @@ static int mtk_hdmi_aud_set_src(struct mtk_hdmi *hdmi,
 
 	mtk_hdmi_hw_ncts_enable(hdmi, false);
 	mtk_hdmi_hw_aud_src_disable(hdmi);
-	mtk_hdmi_clear_bits(hdmi, GRL_CFG2, CFG2_ACLK_INV);
+	regmap_clear_bits(hdmi->regs, GRL_CFG2, CFG2_ACLK_INV);
 
 	if (hdmi->aud_param.aud_input_type == HDMI_AUD_INPUT_I2S) {
 		switch (sample_rate) {
@@ -1425,7 +1384,6 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	struct device_node *cec_np, *remote, *i2c_np;
 	struct platform_device *cec_pdev;
 	struct regmap *regmap;
-	struct resource *mem;
 	int ret;
 
 	ret = mtk_hdmi_get_all_clk(hdmi, np);
@@ -1471,8 +1429,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	}
 	hdmi->sys_regmap = regmap;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hdmi->regs = devm_ioremap_resource(dev, mem);
+	hdmi->regs = device_node_to_regmap(dev->of_node);
 	if (IS_ERR(hdmi->regs)) {
 		ret = PTR_ERR(hdmi->regs);
 		goto put_device;
-- 
2.48.1

