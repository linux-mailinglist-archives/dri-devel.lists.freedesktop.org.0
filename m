Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5DA9D3AFA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 13:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8617610E754;
	Wed, 20 Nov 2024 12:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NX9W86Q1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FD810E752
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 12:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732106732;
 bh=qpO+nJZF0DU6fSTLFPnVmHghbUVHnculHwGGQ/6LCi8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NX9W86Q1TPiY+1Yt2VBV9uj6cWrLWushb6ljz4Ccs+vTq42Jick8R6jSmYvXK9CzU
 cLbv8CJsdH/DFG/B+WV08f4Z0iirOTMvE9AxYLpRzaexLUCdw+21V2CSTYpsu8PGdP
 ChMOF44Jmbc28If1JcSf8oWGgIcPffaabmubhY67l4cnRiAwtQKFk1SousmaQNoBBO
 qw5r/HFZBHozyskAp4GJBxdbxU8oidvYkv2Nb5tt8BC29gP00n4Y7jbvRPhWD6ogQz
 tOP7Cimq+WwltDp17Lo88d+r4ZLaf8v70b8E0tEslm8C+OsD4tfGwMAKje6Ezmf53V
 pA50E32IlKsfw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 08C3117E3661;
 Wed, 20 Nov 2024 13:45:30 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Guillaume Ranquet <granquet@baylibre.com>
Subject: [PATCH v1 5/7] drm/mediatek: hdmi: Use regmap instead of iomem for
 main registers
Date: Wed, 20 Nov 2024 13:45:10 +0100
Message-ID: <20241120124512.134278-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
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
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 173 +++++++++++-----------------
 1 file changed, 65 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index bacb1a5289cb..9e8d9144cf86 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -170,7 +170,7 @@ struct mtk_hdmi {
 	u32 ibias_up;
 	struct regmap *sys_regmap;
 	unsigned int sys_offset;
-	void __iomem *regs;
+	struct regmap *regs;
 	enum hdmi_colorspace csp;
 	struct hdmi_audio_param aud_param;
 	bool audio_enable;
@@ -186,50 +186,10 @@ static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
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
@@ -264,12 +224,12 @@ static void mtk_hdmi_hw_1p4_version_enable(struct mtk_hdmi *hdmi, bool enable)
 
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
@@ -278,25 +238,25 @@ static void mtk_hdmi_hw_reset(struct mtk_hdmi *hdmi)
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
@@ -342,22 +302,22 @@ static void mtk_hdmi_hw_send_info_frame(struct mtk_hdmi *hdmi, u8 *buffer,
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
@@ -378,44 +338,44 @@ static void mtk_hdmi_hw_set_deep_color_mode(struct mtk_hdmi *hdmi)
 
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
@@ -443,7 +403,7 @@ static void mtk_hdmi_hw_aud_set_channel_swap(struct mtk_hdmi *hdmi,
 		swap_bit = LFE_CC_SWAP;
 		break;
 	}
-	mtk_hdmi_mask(hdmi, GRL_CH_SWAP, swap_bit, 0xff);
+	regmap_update_bits(hdmi->regs, GRL_CH_SWAP, 0xff, swap_bit);
 }
 
 static void mtk_hdmi_hw_aud_set_bit_num(struct mtk_hdmi *hdmi,
@@ -464,7 +424,7 @@ static void mtk_hdmi_hw_aud_set_bit_num(struct mtk_hdmi *hdmi,
 		break;
 	}
 
-	mtk_hdmi_mask(hdmi, GRL_AOUT_CFG, val, AOUT_BNUM_SEL_MASK);
+	regmap_update_bits(hdmi->regs, GRL_AOUT_CFG, AOUT_BNUM_SEL_MASK, val);
 }
 
 static void mtk_hdmi_hw_aud_set_i2s_fmt(struct mtk_hdmi *hdmi,
@@ -472,7 +432,7 @@ static void mtk_hdmi_hw_aud_set_i2s_fmt(struct mtk_hdmi *hdmi,
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_CFG0);
+	regmap_read(hdmi->regs, GRL_CFG0, &val);
 	val &= ~(CFG0_W_LENGTH_MASK | CFG0_I2S_MODE_MASK);
 
 	switch (i2s_fmt) {
@@ -496,7 +456,7 @@ static void mtk_hdmi_hw_aud_set_i2s_fmt(struct mtk_hdmi *hdmi,
 		val |= CFG0_I2S_MODE_I2S | CFG0_W_LENGTH_16BIT;
 		break;
 	}
-	mtk_hdmi_write(hdmi, GRL_CFG0, val);
+	regmap_write(hdmi->regs, GRL_CFG0, val);
 }
 
 static void mtk_hdmi_hw_audio_config(struct mtk_hdmi *hdmi, bool dst)
@@ -505,14 +465,14 @@ static void mtk_hdmi_hw_audio_config(struct mtk_hdmi *hdmi, bool dst)
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
@@ -553,10 +513,10 @@ static void mtk_hdmi_hw_aud_set_i2s_chan_num(struct mtk_hdmi *hdmi,
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
@@ -564,7 +524,7 @@ static void mtk_hdmi_hw_aud_set_input_type(struct mtk_hdmi *hdmi,
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_CFG1);
+	regmap_read(hdmi->regs, GRL_CFG1, &val);
 	if (input_type == HDMI_AUD_INPUT_I2S &&
 	    (val & CFG1_SPDIF) == CFG1_SPDIF) {
 		val &= ~CFG1_SPDIF;
@@ -572,7 +532,7 @@ static void mtk_hdmi_hw_aud_set_input_type(struct mtk_hdmi *hdmi,
 		(val & CFG1_SPDIF) == 0) {
 		val |= CFG1_SPDIF;
 	}
-	mtk_hdmi_write(hdmi, GRL_CFG1, val);
+	regmap_write(hdmi->regs, GRL_CFG1, val);
 }
 
 static void mtk_hdmi_hw_aud_set_channel_status(struct mtk_hdmi *hdmi,
@@ -581,13 +541,13 @@ static void mtk_hdmi_hw_aud_set_channel_status(struct mtk_hdmi *hdmi,
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
 
@@ -595,13 +555,13 @@ static void mtk_hdmi_hw_aud_src_reenable(struct mtk_hdmi *hdmi)
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
 
@@ -609,10 +569,10 @@ static void mtk_hdmi_hw_aud_src_disable(struct mtk_hdmi *hdmi)
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
@@ -620,7 +580,7 @@ static void mtk_hdmi_hw_aud_set_mclk(struct mtk_hdmi *hdmi,
 {
 	u32 val;
 
-	val = mtk_hdmi_read(hdmi, GRL_CFG5);
+	regmap_read(hdmi->regs, GRL_CFG5, &val);
 	val &= CFG5_CD_RATIO_MASK;
 
 	switch (mclk) {
@@ -643,7 +603,7 @@ static void mtk_hdmi_hw_aud_set_mclk(struct mtk_hdmi *hdmi,
 		val |= CFG5_FS256;
 		break;
 	}
-	mtk_hdmi_write(hdmi, GRL_CFG5, val);
+	regmap_write(hdmi->regs, GRL_CFG5, val);
 }
 
 struct hdmi_acr_n {
@@ -727,9 +687,9 @@ static void do_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi, unsigned int n,
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
@@ -742,7 +702,7 @@ static void do_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi, unsigned int n,
 	val[6] = n & 0xff;
 
 	for (i = 0; i < NCTS_BYTES; i++)
-		mtk_hdmi_write(hdmi, GRL_NCTS, val[i]);
+		regmap_write(hdmi->regs, GRL_NCTS, val[i]);
 }
 
 static void mtk_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi,
@@ -757,8 +717,7 @@ static void mtk_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi,
 	dev_dbg(hdmi->dev, "%s: sample_rate=%u, clock=%d, cts=%u, n=%u\n",
 		__func__, sample_rate, clock, n, cts);
 
-	mtk_hdmi_mask(hdmi, DUMMY_304, AUDIO_I2S_NCTS_SEL_64,
-		      AUDIO_I2S_NCTS_SEL);
+	regmap_update_bits(hdmi->regs, DUMMY_304, AUDIO_I2S_NCTS_SEL, AUDIO_I2S_NCTS_SEL_64);
 	do_hdmi_hw_aud_set_ncts(hdmi, n, cts);
 }
 
@@ -878,7 +837,7 @@ static void mtk_hdmi_aud_set_input(struct mtk_hdmi *hdmi)
 	bool dst;
 
 	mtk_hdmi_hw_aud_set_channel_swap(hdmi, HDMI_AUD_SWAP_LFE_CC);
-	mtk_hdmi_set_bits(hdmi, GRL_MIX_CTRL, MIX_CTRL_FLAT);
+	regmap_set_bits(hdmi->regs, GRL_MIX_CTRL, MIX_CTRL_FLAT);
 
 	if (hdmi->aud_param.aud_input_type == HDMI_AUD_INPUT_SPDIF &&
 	    hdmi->aud_param.aud_codec == HDMI_AUDIO_CODING_TYPE_DST) {
@@ -910,7 +869,7 @@ static int mtk_hdmi_aud_set_src(struct mtk_hdmi *hdmi,
 
 	mtk_hdmi_hw_ncts_enable(hdmi, false);
 	mtk_hdmi_hw_aud_src_disable(hdmi);
-	mtk_hdmi_clear_bits(hdmi, GRL_CFG2, CFG2_ACLK_INV);
+	regmap_clear_bits(hdmi->regs, GRL_CFG2, CFG2_ACLK_INV);
 
 	if (hdmi->aud_param.aud_input_type == HDMI_AUD_INPUT_I2S) {
 		switch (sample_rate) {
@@ -1424,7 +1383,6 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	struct device_node *cec_np, *remote, *i2c_np;
 	struct platform_device *cec_pdev;
 	struct regmap *regmap;
-	struct resource *mem;
 	int ret;
 
 	ret = mtk_hdmi_get_all_clk(hdmi, np);
@@ -1470,8 +1428,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	}
 	hdmi->sys_regmap = regmap;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hdmi->regs = devm_ioremap_resource(dev, mem);
+	hdmi->regs = device_node_to_regmap(dev->of_node);
 	if (IS_ERR(hdmi->regs)) {
 		ret = PTR_ERR(hdmi->regs);
 		goto put_device;
-- 
2.47.0

