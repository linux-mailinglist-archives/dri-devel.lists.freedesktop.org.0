Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D88F4DC213
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 09:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D02710E619;
	Thu, 17 Mar 2022 08:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF8710E5E0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 13:58:39 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d7so3097776wrb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GwYcPqh2K6PO4WArWT/2r3/tXBX4mlEpbIQgfNHB70U=;
 b=JnE1wGKizc21cbJxcu6AvY3wL4kgjqn6WDV8GoOnxB1GaM34XvPiZsmgzTmTlI40kt
 NudPi6zbbCswrre6uCXKBQheG+beKPrw2jlfbIDrrmK4MOkV6m7nJgM6w7kU9nzR0HXk
 qccFQKSforXfJ4+28s0j9n+Oa595r0SIpCKoVZpBOeuI6vXH+BjMu83f3MPI53HNL9qn
 QTWGV+j54tvDAewf5mFu9vBkEc6CE1V2OxNzEzOJHerXYYSdyB3wp8pjSuV7njVsVvnZ
 ENOw5oTYcr//CxkUtaujOidLkKTpuxZm+571zdtoWOMwklIqk4tMoIfj6orGhsNLXyYS
 duHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GwYcPqh2K6PO4WArWT/2r3/tXBX4mlEpbIQgfNHB70U=;
 b=vxzOdJWnOSZhjwzwDhWrrkIWfTwKuvbr36a/jNab8ENRsz9TwBS4rSA7QkKkXUbyI7
 RlnLzxg27c3nOOxdA3QEUT0M/lpzxInaxtaKrI961gfPJvWt4sKlYnyWTlmQ9rLifISt
 Cs1tjwRInEwJXh5QM2bJKEbhE6F74wrmIt++t66gZ8+4wm6+TrF1eL7qT3KuUyySvFtg
 G0zw8QaG3VcsdbPeQJ2rK3lULEmcnjlWCvkRgs0VFvRbHa4FhzzgOluGaloC7ftTGt9/
 HFlhD+rDsgmwFq6r8kdRJ+VzlRuzYXX8y0vFOGHSGkzNsyIZUJdsS4+I7Ksm2GAQ78Za
 RXlQ==
X-Gm-Message-State: AOAM532at80kj7m3ckxq3ZqXEIKux/Eaeyi1HQ7MtMkBmxH6548QQsCE
 pLYl1GCufSQ6voYcnaAC8MB2bA==
X-Google-Smtp-Source: ABdhPJwnIHUVbqQ20Hqyt67cExg2HCrei/Y6awS4jEuGy4SABotZ5cs3ZSGNjccS+xMjS4babp8Svw==
X-Received: by 2002:a5d:6712:0:b0:1f0:2486:2fff with SMTP id
 o18-20020a5d6712000000b001f024862fffmr115629wru.200.1647439118242; 
 Wed, 16 Mar 2022 06:58:38 -0700 (PDT)
Received: from localhost.localdomain ([37.173.241.155])
 by smtp.gmail.com with ESMTPSA id
 ay24-20020a05600c1e1800b00389a420e1ecsm1790563wmb.37.2022.03.16.06.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 06:58:37 -0700 (PDT)
From: Nicolas Belin <nbelin@baylibre.com>
To: narmstrong@baylibre.com, andrzej.hajda@intel.com, robert.foss@linaro.org
Subject: [PATCH 3/3] drm: bridge: it66121: Add audio support
Date: Wed, 16 Mar 2022 14:57:33 +0100
Message-Id: <20220316135733.173950-4-nbelin@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316135733.173950-1-nbelin@baylibre.com>
References: <20220316135733.173950-1-nbelin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Mar 2022 08:58:23 +0000
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
Cc: devicetree@vger.kernel.org, jonas@kwiboo.se,
 "Andy . Hsieh" <Andy.Hsieh@mediatek.com>, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 Nicolas Belin <nbelin@baylibre.com>, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding the audio support on the HDMI bridge for I2S only.

Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
Signed-off-by: Andy.Hsieh <Andy.Hsieh@mediatek.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 627 +++++++++++++++++++++++++++
 1 file changed, 627 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 64912b770086..514989676d07 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -27,6 +27,8 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
+#include <sound/hdmi-codec.h>
+
 #define IT66121_VENDOR_ID0_REG			0x00
 #define IT66121_VENDOR_ID1_REG			0x01
 #define IT66121_DEVICE_ID0_REG			0x02
@@ -155,6 +157,9 @@
 #define IT66121_AV_MUTE_ON			BIT(0)
 #define IT66121_AV_MUTE_BLUESCR			BIT(1)
 
+#define IT66121_PKT_CTS_CTRL_REG		0xC5
+#define IT66121_PKT_CTS_CTRL_SEL		BIT(1)
+
 #define IT66121_PKT_GEN_CTRL_REG		0xC6
 #define IT66121_PKT_GEN_CTRL_ON			BIT(0)
 #define IT66121_PKT_GEN_CTRL_RPT		BIT(1)
@@ -202,6 +207,89 @@
 #define IT66121_EDID_SLEEP_US			20000
 #define IT66121_EDID_TIMEOUT_US			200000
 #define IT66121_EDID_FIFO_SIZE			32
+
+#define IT66121_CLK_CTRL0_REG			0x58
+#define IT66121_CLK_CTRL0_AUTO_OVER_SAMPLING	BIT(4)
+#define IT66121_CLK_CTRL0_EXT_MCLK_MASK		GENMASK(3, 2)
+#define IT66121_CLK_CTRL0_EXT_MCLK_128FS	(0 << 2)
+#define IT66121_CLK_CTRL0_EXT_MCLK_256FS	BIT(2)
+#define IT66121_CLK_CTRL0_EXT_MCLK_512FS	(2 << 2)
+#define IT66121_CLK_CTRL0_EXT_MCLK_1024FS	(3 << 2)
+#define IT66121_CLK_CTRL0_AUTO_IPCLK		BIT(0)
+#define IT66121_CLK_STATUS1_REG			0x5E
+#define IT66121_CLK_STATUS2_REG			0x5F
+
+#define IT66121_AUD_CTRL0_REG			0xE0
+#define IT66121_AUD_SWL				(3 << 6)
+#define IT66121_AUD_16BIT			(0 << 6)
+#define IT66121_AUD_18BIT			BIT(6)
+#define IT66121_AUD_20BIT			(2 << 6)
+#define IT66121_AUD_24BIT			(3 << 6)
+#define IT66121_AUD_SPDIFTC			BIT(5)
+#define IT66121_AUD_SPDIF			BIT(4)
+#define IT66121_AUD_I2S				(0 << 4)
+#define IT66121_AUD_EN_I2S3			BIT(3)
+#define IT66121_AUD_EN_I2S2			BIT(2)
+#define IT66121_AUD_EN_I2S1			BIT(1)
+#define IT66121_AUD_EN_I2S0			BIT(0)
+#define IT66121_AUD_CTRL0_AUD_SEL		BIT(4)
+
+#define IT66121_AUD_CTRL1_REG			0xE1
+#define IT66121_AUD_FIFOMAP_REG			0xE2
+#define IT66121_AUD_CTRL3_REG			0xE3
+#define IT66121_AUD_SRCVALID_FLAT_REG		0xE4
+#define IT66121_AUD_FLAT_SRC0			BIT(4)
+#define IT66121_AUD_FLAT_SRC1			BIT(5)
+#define IT66121_AUD_FLAT_SRC2			BIT(6)
+#define IT66121_AUD_FLAT_SRC3			BIT(7)
+#define IT66121_AUD_HDAUDIO_REG			0xE5
+
+#define IT66121_AUD_PKT_CTS0_REG		0x130
+#define IT66121_AUD_PKT_CTS1_REG		0x131
+#define IT66121_AUD_PKT_CTS2_REG		0x132
+#define IT66121_AUD_PKT_N0_REG			0x133
+#define IT66121_AUD_PKT_N1_REG			0x134
+#define IT66121_AUD_PKT_N2_REG			0x135
+
+#define IT66121_AUD_CHST_MODE_REG		0x191
+#define IT66121_AUD_CHST_CAT_REG		0x192
+#define IT66121_AUD_CHST_SRCNUM_REG		0x193
+#define IT66121_AUD_CHST_CHTNUM_REG		0x194
+#define IT66121_AUD_CHST_CA_FS_REG		0x198
+#define IT66121_AUD_CHST_OFS_WL_REG		0x199
+
+#define IT66121_AUD_PKT_CTS_CNT0_REG		0x1A0
+#define IT66121_AUD_PKT_CTS_CNT1_REG		0x1A1
+#define IT66121_AUD_PKT_CTS_CNT2_REG		0x1A2
+
+#define IT66121_AUD_FS_22P05K			0x4
+#define IT66121_AUD_FS_44P1K			0x0
+#define IT66121_AUD_FS_88P2K			0x8
+#define IT66121_AUD_FS_176P4K			0xC
+#define IT66121_AUD_FS_24K			0x6
+#define IT66121_AUD_FS_48K			0x2
+#define IT66121_AUD_FS_96K			0xA
+#define IT66121_AUD_FS_192K			0xE
+#define IT66121_AUD_FS_768K			0x9
+#define IT66121_AUD_FS_32K			0x3
+#define IT66121_AUD_FS_OTHER			0x1
+
+#define IT66121_AUD_SWL_21BIT			0xD
+#define IT66121_AUD_SWL_24BIT			0xB
+#define IT66121_AUD_SWL_23BIT			0x9
+#define IT66121_AUD_SWL_22BIT			0x5
+#define IT66121_AUD_SWL_20BIT			0x3
+#define IT66121_AUD_SWL_17BIT			0xC
+#define IT66121_AUD_SWL_19BIT			0x8
+#define IT66121_AUD_SWL_18BIT			0x4
+#define IT66121_AUD_SWL_16BIT			0x2
+#define IT66121_AUD_SWL_NOT_INDICATED		0x0
+
+#define IT66121_VENDOR_ID0			0x54
+#define IT66121_VENDOR_ID1			0x49
+#define IT66121_DEVICE_ID0			0x12
+#define IT66121_DEVICE_ID1			0x06
+#define IT66121_DEVICE_MASK			0x0F
 #define IT66121_AFE_CLK_HIGH			80000 /* Khz */
 
 struct it66121_ctx {
@@ -216,6 +304,13 @@ struct it66121_ctx {
 	u32 bus_width;
 	struct mutex lock; /* Protects fields below and device registers */
 	struct hdmi_avi_infoframe hdmi_avi_infoframe;
+	struct {
+		struct platform_device *pdev;
+		u8 ch_enable;
+		u8 fs;
+		u8 swl;
+		bool auto_cts;
+	} audio;
 };
 
 static const struct regmap_range_cfg it66121_regmap_banks[] = {
@@ -886,6 +981,536 @@ static irqreturn_t it66121_irq_threaded_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int it661221_set_chstat(struct it66121_ctx *ctx, u8 iec60958_chstat[])
+{
+	int ret;
+
+	ret = regmap_write(ctx->regmap, IT66121_AUD_CHST_MODE_REG, iec60958_chstat[0] & 0x7C);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, IT66121_AUD_CHST_CAT_REG, iec60958_chstat[1]);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, IT66121_AUD_CHST_SRCNUM_REG, iec60958_chstat[2] & 0x0F);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, IT66121_AUD_CHST_CHTNUM_REG,
+			   (iec60958_chstat[2] >> 4) & 0x0F);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, IT66121_AUD_CHST_CA_FS_REG, iec60958_chstat[3]);
+	if (ret)
+		return ret;
+
+	return regmap_write(ctx->regmap, IT66121_AUD_CHST_OFS_WL_REG, iec60958_chstat[4]);
+}
+
+static int it661221_set_lpcm_audio(struct it66121_ctx *ctx, u8 audio_src_num, u8 audio_swl)
+{
+	int ret;
+	unsigned int audio_enable = 0;
+	unsigned int audio_format = 0;
+
+	switch (audio_swl) {
+	case 16:
+		audio_enable |= IT66121_AUD_16BIT;
+		break;
+	case 18:
+		audio_enable |= IT66121_AUD_18BIT;
+		break;
+	case 20:
+		audio_enable |= IT66121_AUD_20BIT;
+		break;
+	case 24:
+	default:
+		audio_enable |= IT66121_AUD_24BIT;
+		break;
+	}
+
+	audio_format |= 0x40;
+	switch (audio_src_num) {
+	case 4:
+		audio_enable |= IT66121_AUD_EN_I2S3 | IT66121_AUD_EN_I2S2 |
+				IT66121_AUD_EN_I2S1 | IT66121_AUD_EN_I2S0;
+		break;
+	case 3:
+		audio_enable |= IT66121_AUD_EN_I2S2 | IT66121_AUD_EN_I2S1 |
+				IT66121_AUD_EN_I2S0;
+		break;
+	case 2:
+		audio_enable |= IT66121_AUD_EN_I2S1 | IT66121_AUD_EN_I2S0;
+		break;
+	case 1:
+	default:
+		audio_format &= ~0x40;
+		audio_enable |= IT66121_AUD_EN_I2S0;
+		break;
+	}
+
+	audio_format |= 0x01;
+	ctx->audio.ch_enable = audio_enable;
+
+	ret = regmap_write(ctx->regmap, IT66121_AUD_CTRL0_REG, audio_enable & 0xF0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, IT66121_AUD_CTRL1_REG, audio_format);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, IT66121_AUD_FIFOMAP_REG, 0xE4);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, IT66121_AUD_CTRL3_REG, 0x00);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, IT66121_AUD_SRCVALID_FLAT_REG, 0x00);
+	if (ret)
+		return ret;
+
+	return regmap_write(ctx->regmap, IT66121_AUD_HDAUDIO_REG, 0x00);
+}
+
+static int it661221_set_ncts(struct it66121_ctx *ctx, u8 fs)
+{
+	int ret;
+	unsigned int n;
+
+	switch (fs) {
+	case IT66121_AUD_FS_32K:
+		n = 4096;
+		break;
+	case IT66121_AUD_FS_44P1K:
+		n = 6272;
+		break;
+	case IT66121_AUD_FS_48K:
+		n = 6144;
+		break;
+	case IT66121_AUD_FS_88P2K:
+		n = 12544;
+		break;
+	case IT66121_AUD_FS_96K:
+		n = 12288;
+		break;
+	case IT66121_AUD_FS_176P4K:
+		n = 25088;
+		break;
+	case IT66121_AUD_FS_192K:
+		n = 24576;
+		break;
+	case IT66121_AUD_FS_768K:
+		n = 24576;
+		break;
+	default:
+		n = 6144;
+		break;
+	}
+
+	ret = regmap_write(ctx->regmap, IT66121_AUD_PKT_N0_REG, (u8)((n) & 0xFF));
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, IT66121_AUD_PKT_N1_REG, (u8)((n >> 8) & 0xFF));
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, IT66121_AUD_PKT_N2_REG, (u8)((n >> 16) & 0xF));
+	if (ret)
+		return ret;
+
+	if (ctx->audio.auto_cts) {
+		u8 loop_cnt = 255;
+		u8 cts_stable_cnt = 0;
+		unsigned int sum_cts = 0;
+		unsigned int cts = 0;
+		unsigned int last_cts = 0;
+		unsigned int diff;
+		unsigned int val;
+
+		while (loop_cnt--) {
+			msleep(30);
+			regmap_read(ctx->regmap, IT66121_AUD_PKT_CTS_CNT2_REG, &val);
+			cts = val << 12;
+			regmap_read(ctx->regmap, IT66121_AUD_PKT_CTS_CNT1_REG, &val);
+			cts |= val << 4;
+			regmap_read(ctx->regmap, IT66121_AUD_PKT_CTS_CNT0_REG, &val);
+			cts |= val >> 4;
+			if (cts == 0) {
+				continue;
+			} else {
+				if (last_cts > cts)
+					diff = last_cts - cts;
+				else
+					diff = cts - last_cts;
+				last_cts = cts;
+				if (diff < 5) {
+					cts_stable_cnt++;
+					sum_cts += cts;
+				} else {
+					cts_stable_cnt = 0;
+					sum_cts = 0;
+					continue;
+				}
+
+				if (cts_stable_cnt >= 32) {
+					last_cts = (sum_cts >> 5);
+					break;
+				}
+			}
+		}
+
+		regmap_write(ctx->regmap, IT66121_AUD_PKT_CTS0_REG, (u8)((last_cts) & 0xFF));
+		regmap_write(ctx->regmap, IT66121_AUD_PKT_CTS1_REG, (u8)((last_cts >> 8) & 0xFF));
+		regmap_write(ctx->regmap, IT66121_AUD_PKT_CTS2_REG, (u8)((last_cts >> 16) & 0x0F));
+	}
+
+	ret = regmap_write(ctx->regmap, 0xF8, 0xC3);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, 0xF8, 0xA5);
+	if (ret)
+		return ret;
+
+	if (ctx->audio.auto_cts) {
+		ret = regmap_write_bits(ctx->regmap, IT66121_PKT_CTS_CTRL_REG,
+					IT66121_PKT_CTS_CTRL_SEL,
+					1);
+	} else {
+		ret = regmap_write_bits(ctx->regmap, IT66121_PKT_CTS_CTRL_REG,
+					IT66121_PKT_CTS_CTRL_SEL,
+					0);
+	}
+
+	if (ret)
+		return ret;
+
+	return regmap_write(ctx->regmap, 0xF8, 0xFF);
+}
+
+static int it661221_audio_output_enable(struct it66121_ctx *ctx, bool enable)
+{
+	int ret;
+
+	if (enable) {
+		ret = regmap_write_bits(ctx->regmap, IT66121_SW_RST_REG,
+					IT66121_SW_RST_AUD | IT66121_SW_RST_AREF,
+					0);
+		if (ret)
+			return ret;
+
+		ret = regmap_write_bits(ctx->regmap, IT66121_AUD_CTRL0_REG,
+					IT66121_AUD_EN_I2S3 | IT66121_AUD_EN_I2S2 |
+					IT66121_AUD_EN_I2S1 | IT66121_AUD_EN_I2S0,
+					ctx->audio.ch_enable);
+	} else {
+		ret = regmap_write_bits(ctx->regmap, IT66121_AUD_CTRL0_REG,
+					IT66121_AUD_EN_I2S3 | IT66121_AUD_EN_I2S2 |
+					IT66121_AUD_EN_I2S1 | IT66121_AUD_EN_I2S0,
+					ctx->audio.ch_enable & 0xF0);
+		if (ret)
+			return ret;
+
+		ret = regmap_write_bits(ctx->regmap, IT66121_SW_RST_REG,
+					IT66121_SW_RST_AUD | IT66121_SW_RST_AREF,
+					IT66121_SW_RST_AUD | IT66121_SW_RST_AREF);
+	}
+
+	return ret;
+}
+
+static int it661221_audio_ch_enable(struct it66121_ctx *ctx, bool enable)
+{
+	int ret;
+
+	if (enable) {
+		ret = regmap_write(ctx->regmap, IT66121_AUD_SRCVALID_FLAT_REG, 0);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(ctx->regmap, IT66121_AUD_CTRL0_REG, ctx->audio.ch_enable);
+	} else {
+		ret = regmap_write(ctx->regmap, IT66121_AUD_CTRL0_REG, ctx->audio.ch_enable & 0xF0);
+	}
+
+	return ret;
+}
+
+static int it66121_audio_hw_params(struct device *dev, void *data,
+				   struct hdmi_codec_daifmt *daifmt,
+				   struct hdmi_codec_params *params)
+{
+	u8 fs;
+	u8 swl;
+	int ret;
+	struct it66121_ctx *ctx = dev_get_drvdata(dev);
+	static u8 iec60958_chstat[5];
+	unsigned int channels = params->channels;
+	unsigned int sample_rate = params->sample_rate;
+	unsigned int sample_width = params->sample_width;
+
+	mutex_lock(&ctx->lock);
+	dev_dbg(dev, "%s: %u, %u, %u, %u\n", __func__,
+		daifmt->fmt, sample_rate, sample_width, channels);
+
+	switch (daifmt->fmt) {
+	case HDMI_I2S:
+		dev_dbg(dev, "Using HDMI I2S\n");
+		break;
+	default:
+		dev_err(dev, "Invalid or unsupported DAI format %d\n", daifmt->fmt);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	// Set audio clock recovery (N/CTS)
+	ret = regmap_write(ctx->regmap, IT66121_CLK_CTRL0_REG,
+			   IT66121_CLK_CTRL0_AUTO_OVER_SAMPLING |
+			   IT66121_CLK_CTRL0_EXT_MCLK_256FS |
+			   IT66121_CLK_CTRL0_AUTO_IPCLK);
+	if (ret)
+		goto out;
+
+	ret = regmap_write_bits(ctx->regmap, IT66121_AUD_CTRL0_REG,
+				IT66121_AUD_CTRL0_AUD_SEL, 0); // remove spdif selection
+	if (ret)
+		goto out;
+
+	switch (sample_rate) {
+	case 44100L:
+		fs = IT66121_AUD_FS_44P1K;
+		break;
+	case 88200L:
+		fs = IT66121_AUD_FS_88P2K;
+		break;
+	case 176400L:
+		fs = IT66121_AUD_FS_176P4K;
+		break;
+	case 32000L:
+		fs = IT66121_AUD_FS_32K;
+		break;
+	case 48000L:
+		fs = IT66121_AUD_FS_48K;
+		break;
+	case 96000L:
+		fs = IT66121_AUD_FS_96K;
+		break;
+	case 192000L:
+		fs = IT66121_AUD_FS_192K;
+		break;
+	case 768000L:
+		fs = IT66121_AUD_FS_768K;
+		break;
+	default:
+		fs = IT66121_AUD_FS_48K;
+		break;
+	}
+
+	ctx->audio.fs = fs;
+	ret = it661221_set_ncts(ctx, fs);
+	if (ret) {
+		dev_err(dev, "Failed to set N/CTS: %d\n", ret);
+		goto out;
+	}
+
+	// Set audio format register (except audio channel enable)
+	ret = it661221_set_lpcm_audio(ctx, (channels + 1) / 2, sample_width);
+	if (ret) {
+		dev_err(dev, "Failed to set LPCM audio: %d\n", ret);
+		goto out;
+	}
+
+	// Set audio channel status
+	iec60958_chstat[0] = 0;
+	if ((channels + 1) / 2 == 1)
+		iec60958_chstat[0] |= 0x1;
+	iec60958_chstat[0] &= ~(1 << 1);
+	iec60958_chstat[1] = 0;
+	iec60958_chstat[2] = (channels + 1) / 2;
+	iec60958_chstat[2] |= (channels << 4) & 0xF0;
+	iec60958_chstat[3] = fs;
+
+	switch (sample_width) {
+	case 21L:
+		swl = IT66121_AUD_SWL_21BIT;
+		break;
+	case 24L:
+		swl = IT66121_AUD_SWL_24BIT;
+		break;
+	case 23L:
+		swl = IT66121_AUD_SWL_23BIT;
+		break;
+	case 22L:
+		swl = IT66121_AUD_SWL_22BIT;
+		break;
+	case 20L:
+		swl = IT66121_AUD_SWL_20BIT;
+		break;
+	case 17L:
+		swl = IT66121_AUD_SWL_17BIT;
+		break;
+	case 19L:
+		swl = IT66121_AUD_SWL_19BIT;
+		break;
+	case 18L:
+		swl = IT66121_AUD_SWL_18BIT;
+		break;
+	case 16L:
+		swl = IT66121_AUD_SWL_16BIT;
+		break;
+	default:
+		swl = IT66121_AUD_SWL_NOT_INDICATED;
+		break;
+	}
+
+	iec60958_chstat[4] = (((~fs) << 4) & 0xF0) | swl;
+	ret = it661221_set_chstat(ctx, iec60958_chstat);
+	if (ret) {
+		dev_err(dev, "Failed to set channel status: %d\n", ret);
+		goto out;
+	}
+
+	// Enable audio channel enable while input clock stable (if SPDIF).
+	ret = it661221_audio_ch_enable(ctx, true);
+	if (ret) {
+		dev_err(dev, "Failed to enable audio channel: %d\n", ret);
+		goto out;
+	}
+
+	ret = regmap_write_bits(ctx->regmap, IT66121_INT_MASK1_REG,
+				IT66121_INT_MASK1_AUD_OVF,
+				0);
+	if (ret)
+		goto out;
+
+	dev_dbg(dev, "HDMI audio enabled.\n");
+out:
+	mutex_unlock(&ctx->lock);
+
+	return ret;
+}
+
+static int it66121_audio_startup(struct device *dev, void *data)
+{
+	int ret;
+	struct it66121_ctx *ctx = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "%s\n", __func__);
+
+	mutex_lock(&ctx->lock);
+	ret = it661221_audio_output_enable(ctx, true);
+	if (ret)
+		dev_err(dev, "Failed to enable audio output: %d\n", ret);
+
+	mutex_unlock(&ctx->lock);
+
+	return ret;
+}
+
+static void it66121_audio_shutdown(struct device *dev, void *data)
+{
+	int ret;
+	struct it66121_ctx *ctx = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "%s\n", __func__);
+
+	mutex_lock(&ctx->lock);
+	ret = it661221_audio_output_enable(ctx, false);
+	if (ret)
+		dev_err(dev, "Failed to disable audio output: %d\n", ret);
+
+	mutex_unlock(&ctx->lock);
+}
+
+static int it66121_audio_mute(struct device *dev, void *data,
+			      bool enable, int direction)
+{
+	int ret;
+	struct it66121_ctx *ctx = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "%s: enable=%s, direction=%d\n",
+		__func__, enable ? "true" : "false", direction);
+
+	mutex_lock(&ctx->lock);
+
+	if (enable) {
+		ret = regmap_write_bits(ctx->regmap, IT66121_AUD_SRCVALID_FLAT_REG,
+					IT66121_AUD_FLAT_SRC0 | IT66121_AUD_FLAT_SRC1 |
+					IT66121_AUD_FLAT_SRC2 | IT66121_AUD_FLAT_SRC3,
+					IT66121_AUD_FLAT_SRC0 | IT66121_AUD_FLAT_SRC1 |
+					IT66121_AUD_FLAT_SRC2 | IT66121_AUD_FLAT_SRC3);
+	} else {
+		ret = regmap_write_bits(ctx->regmap, IT66121_AUD_SRCVALID_FLAT_REG,
+					IT66121_AUD_FLAT_SRC0 | IT66121_AUD_FLAT_SRC1 |
+					IT66121_AUD_FLAT_SRC2 | IT66121_AUD_FLAT_SRC3,
+					0);
+	}
+
+	mutex_unlock(&ctx->lock);
+
+	return ret;
+}
+
+static int it66121_audio_get_eld(struct device *dev, void *data,
+				 u8 *buf, size_t len)
+{
+	struct it66121_ctx *ctx = dev_get_drvdata(dev);
+
+	mutex_lock(&ctx->lock);
+
+	memcpy(buf, ctx->connector->eld,
+	       min(sizeof(ctx->connector->eld), len));
+
+	mutex_unlock(&ctx->lock);
+
+	return 0;
+}
+
+static const struct hdmi_codec_ops it66121_audio_codec_ops = {
+	.hw_params = it66121_audio_hw_params,
+	.audio_startup = it66121_audio_startup,
+	.audio_shutdown = it66121_audio_shutdown,
+	.mute_stream = it66121_audio_mute,
+	.get_eld = it66121_audio_get_eld,
+	.no_capture_mute = 1,
+};
+
+static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
+{
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &it66121_audio_codec_ops,
+		.i2s = 1, /* Only i2s support for now */
+		.spdif = 0,
+		.max_i2s_channels = 8,
+	};
+
+	dev_dbg(dev, "%s\n", __func__);
+
+	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
+		dev_info(dev, "No \"#sound-dai-cells\", no audio\n");
+		return 0;
+	}
+
+	ctx->audio.pdev = platform_device_register_data(dev,
+							HDMI_CODEC_DRV_NAME,
+							PLATFORM_DEVID_AUTO,
+							&codec_data,
+							sizeof(codec_data));
+
+	if (IS_ERR(ctx->audio.pdev)) {
+		dev_err(dev, "Failed to initialize HDMI audio codec: %d\n",
+			PTR_ERR_OR_ZERO(ctx->audio.pdev));
+	}
+
+	return PTR_ERR_OR_ZERO(ctx->audio.pdev);
+}
+
 static int it66121_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -991,6 +1616,8 @@ static int it66121_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	it66121_audio_codec_init(ctx, dev);
+
 	drm_bridge_add(&ctx->bridge);
 
 	dev_info(ctx->dev, "IT66121 revision %d probed\n", revision_id);
-- 
2.25.1

