Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C575F89D669
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E6E112C5F;
	Tue,  9 Apr 2024 10:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FtjtUrAN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2457C10E617
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:13:51 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d8863d8a6eso36193861fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 03:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657629; x=1713262429;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jAOSUHPpOI437DuBEDokZB8X/c18KNLVUPwKPKsfSf8=;
 b=FtjtUrANYfiVnqk2scrfSx3cscSQ/u5I1E5yth8jwEsoMzNyhir2FkfPdKjJ01cAjG
 am9ttKlKtn0lq/rCDUYX3LyrZWv62VorPLW6C3QSUNwWjfk4ORZ6csbPdgAzLmeLUGox
 HPyIV2IT4l+71ttauFIrJtYHKXaqUBHjy4J/IkrvbKYZCRPS6QwQJwydlzlXwTDxasir
 dkYB8m4Fk+VzEugHEAvVj/4xzyE4w8a419LLA2ks92TUIxBND41VSgTE16/Om4Wh7xBd
 vpOKElUllOGgf4pB8V/YayN0Oxzf7tK56ok2xzvaOpu86C73RYrhEY6r+AL0RnD3SRRh
 +SNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712657629; x=1713262429;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jAOSUHPpOI437DuBEDokZB8X/c18KNLVUPwKPKsfSf8=;
 b=uGG02R48d2t1jtAoz9qdRF3sxTIZn1WlTBI3q+9mQR9K1tB9KjwqkLRu/cV3Q+c8cm
 jnfwrDKg9rHGlj92VRxXAAZ9jQXIt0e8EIEcdidTheLvnDgwI3gpMr7LIlVEo/4MdcoQ
 EmWzVdy12Nn1ZJX1Ak6+jgYlgdBzivOk0Ss5IPvphmrFx2pVtJupmgHcl73kDo4JJew9
 ZcZi1UV3FLCZolbZDgIxHL5zgv2DQHOsgzAlyZQNk402NBCEm2hhL4K2yhGYQRBd31ut
 7U1AcAr1tdAPCItH9a7E2FHTBY7Rlqv1B0eMNRt1QPyGngfLN2fHn0Juyi/IYtOCOP98
 Je9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHQDwpyqUmfPoG3VJfyPWQr+NZvV9gK/jXOMynmSKvD73uEFDoixBy6ZEEZbWQWj3wcP6mhKLdu7000ZeqTYV+Y4Qu2O1P0LzcgX3o2zIc
X-Gm-Message-State: AOJu0YydYbw9eAJ+XDKbbvShS5MDFt1A9edhssqGH5lQruJwyJwhVdsW
 UWYJeyA6O22GnBtnhE9Yx0W1sBCVKBGwPZDV3bAXJrHT+X4N9N7cLgwav4Bs4sQ=
X-Google-Smtp-Source: AGHT+IEhQKBl/TLw773YllRubdwBLDxUUV7MyYNXKQOPbPsT1Z2de5wI97b4eYiRsw8KiVn1Z5MB7w==
X-Received: by 2002:a2e:83d0:0:b0:2d8:63a2:50d9 with SMTP id
 s16-20020a2e83d0000000b002d863a250d9mr9444119ljh.1.1712657628857; 
 Tue, 09 Apr 2024 03:13:48 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 03:13:48 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:26 +0200
Subject: [PATCH v2 05/18] ASoC: mediatek: mt8365: Add common header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-5-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=51608;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=DH9bdMsUhvBoSaMPtaGV5zufNn9i3LR4MExSJEpvGKE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTTkTf8qX123PlV0t7VUpcYHbvyyNZz3g+YCtO8
 eOi12FmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURWhRD/
 495cA6Pph09RMHBUaPx4XWQqud1vKgZpnK13G+hvdQ8GVZM31dCscoFoZ3cXMu4CkYLmFW9Tba9DaV
 rG8ToNoyVp7EedriWUlIpOHjir/IJ4hEJTfBU2xSvm2OmonHDAvD1VfFZLdndwo0Vx1+1aPlasaz9l
 J5q+tcQIJswampt5bfNb7JTxRSUzdXOBgDDAaui1ufsHsqd5dB4vwXLOjlX/+4vLDqhSDC043WhcKh
 GfTaeYi7W8ky14yzZxh1pIDwDK9Al3KMySiln2Buu1iTRsnAcghkG0/LNwld/+bs+8dgA2qUw2cplC
 mrOD935Wu4D/rfUHMFbLA5XneyBKkeNBpTsCB1sFqNyI9gb6UWMruZO2CJNIm+5MYAETrfSw/P/Uk+
 KCE/UIEw9c8RZ8WfqsTgqQkjD8QmsA86fUVVbp3zt7Q/HRtr+RwqpPC3Shqv00e7vro39p4v3E50j2
 zi6+hBDXnl+qiPMzDYFJWSBmoSjXLECB9pr9qm52wyB5om8mp0Ez6JDIibbrph71Y1qVzvLzh/wGy7
 8m1yTw4JPcVy0o/8LLVWMYxDgWxU9Sc1xYhnpWlEpvyXb+bfjDjiiIcNKtQKhp5eU8cW7gQzSsu1eB
 9IC65TLBwKSDxr0ECXKpfahfPuiIeH4DFM4cT+xnue6M9ZWGXQTCKWDi0xZA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

Add header files for register definition and structure.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-common.h | 491 +++++++++++++
 sound/soc/mediatek/mt8365/mt8365-reg.h        | 991 ++++++++++++++++++++++++++
 2 files changed, 1482 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-common.h b/sound/soc/mediatek/mt8365/mt8365-afe-common.h
new file mode 100644
index 000000000000..4d8f8c4b19e3
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-common.h
@@ -0,0 +1,491 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Mediatek 8365 audio driver common definitions
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ * Authors: Jia Zeng <jia.zeng@mediatek.com>
+ *          Alexandre Mergnat <amergnat@baylibre.com>
+ */
+
+#ifndef _MT8365_AFE_COMMON_H_
+#define _MT8365_AFE_COMMON_H_
+
+#define COMMON_CLOCK_FRAMEWORK_API
+#define IDLE_TASK_DRIVER_API
+#define ENABLE_AFE_APLL_TUNER
+
+#include <linux/clk.h>
+#include <linux/list.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include <sound/asound.h>
+#include "../common/mtk-base-afe.h"
+#include "mt8365-reg.h"
+
+#define ENUM_TO_STR(enum) #enum
+
+#define snd_soc_dai_stream_active_playback(dai) \
+		snd_soc_dai_stream_active(dai, SNDRV_PCM_STREAM_PLAYBACK)
+#define snd_soc_dai_stream_active_capture(dai) \
+		snd_soc_dai_stream_active(dai, SNDRV_PCM_STREAM_CAPTURE)
+
+enum {
+	MT8365_AFE_MEMIF_DL1,
+	MT8365_AFE_MEMIF_DL2,
+	MT8365_AFE_MEMIF_TDM_OUT,
+	/*
+	 * MT8365_AFE_MEMIF_SPDIF_OUT,
+	 */
+	MT8365_AFE_MEMIF_AWB,
+	MT8365_AFE_MEMIF_VUL,
+	MT8365_AFE_MEMIF_VUL2,
+	MT8365_AFE_MEMIF_VUL3,
+	MT8365_AFE_MEMIF_TDM_IN,
+	/*
+	 * MT8365_AFE_MEMIF_SPDIF_IN,
+	 */
+	MT8365_AFE_MEMIF_NUM,
+	MT8365_AFE_BACKEND_BASE = MT8365_AFE_MEMIF_NUM,
+	MT8365_AFE_IO_TDM_OUT = MT8365_AFE_BACKEND_BASE,
+	MT8365_AFE_IO_TDM_IN,
+	MT8365_AFE_IO_I2S,
+	MT8365_AFE_IO_2ND_I2S,
+	MT8365_AFE_IO_PCM1,
+	MT8365_AFE_IO_VIRTUAL_DL_SRC,
+	MT8365_AFE_IO_VIRTUAL_TDM_OUT_SRC,
+	MT8365_AFE_IO_VIRTUAL_FM,
+	MT8365_AFE_IO_DMIC,
+	MT8365_AFE_IO_INT_ADDA,
+	MT8365_AFE_IO_GASRC1,
+	MT8365_AFE_IO_GASRC2,
+	MT8365_AFE_IO_TDM_ASRC,
+	MT8365_AFE_IO_HW_GAIN1,
+	MT8365_AFE_IO_HW_GAIN2,
+	MT8365_AFE_BACKEND_END,
+	MT8365_AFE_BACKEND_NUM = (MT8365_AFE_BACKEND_END -
+				  MT8365_AFE_BACKEND_BASE),
+};
+
+enum {
+	MT8365_AFE_IRQ1,
+	MT8365_AFE_IRQ2,
+	MT8365_AFE_IRQ3,
+	MT8365_AFE_IRQ4,
+	MT8365_AFE_IRQ5,
+	MT8365_AFE_IRQ6,
+	MT8365_AFE_IRQ7,
+	MT8365_AFE_IRQ8,
+	MT8365_AFE_IRQ9,
+	MT8365_AFE_IRQ10,
+	MT8365_AFE_IRQ_NUM,
+};
+
+enum {
+	MT8365_TOP_CG_AFE,
+	MT8365_TOP_CG_I2S_IN,
+	MT8365_TOP_CG_22M,
+	MT8365_TOP_CG_24M,
+	MT8365_TOP_CG_INTDIR_CK,
+	MT8365_TOP_CG_APLL2_TUNER,
+	MT8365_TOP_CG_APLL_TUNER,
+	MT8365_TOP_CG_SPDIF,
+	MT8365_TOP_CG_TDM_OUT,
+	MT8365_TOP_CG_TDM_IN,
+	MT8365_TOP_CG_ADC,
+	MT8365_TOP_CG_DAC,
+	MT8365_TOP_CG_DAC_PREDIS,
+	MT8365_TOP_CG_TML,
+	MT8365_TOP_CG_I2S1_BCLK,
+	MT8365_TOP_CG_I2S2_BCLK,
+	MT8365_TOP_CG_I2S3_BCLK,
+	MT8365_TOP_CG_I2S4_BCLK,
+	MT8365_TOP_CG_DMIC0_ADC,
+	MT8365_TOP_CG_DMIC1_ADC,
+	MT8365_TOP_CG_DMIC2_ADC,
+	MT8365_TOP_CG_DMIC3_ADC,
+	MT8365_TOP_CG_CONNSYS_I2S_ASRC,
+	MT8365_TOP_CG_GENERAL1_ASRC,
+	MT8365_TOP_CG_GENERAL2_ASRC,
+	MT8365_TOP_CG_TDM_ASRC,
+	MT8365_TOP_CG_NUM
+};
+
+enum {
+	MT8365_CLK_TOP_AUD_SEL,
+	MT8365_CLK_AUD_I2S0_M,
+	MT8365_CLK_AUD_I2S1_M,
+	MT8365_CLK_AUD_I2S2_M,
+	MT8365_CLK_AUD_I2S3_M,
+	MT8365_CLK_ENGEN1,
+	MT8365_CLK_ENGEN2,
+	MT8365_CLK_AUD1,
+	MT8365_CLK_AUD2,
+	MT8365_CLK_I2S0_M_SEL,
+	MT8365_CLK_I2S1_M_SEL,
+	MT8365_CLK_I2S2_M_SEL,
+	MT8365_CLK_I2S3_M_SEL,
+	MT8365_CLK_CLK26M,
+	MT8365_CLK_NUM
+};
+
+enum {
+	MT8365_AFE_APLL1 = 0,
+	MT8365_AFE_APLL2,
+	MT8365_AFE_APLL_NUM,
+};
+
+enum {
+	MT8365_AFE_1ST_I2S = 0,
+	MT8365_AFE_2ND_I2S,
+	MT8365_AFE_I2S_SETS,
+};
+
+enum {
+	MT8365_AFE_I2S_SEPARATE_CLOCK = 0,
+	MT8365_AFE_I2S_SHARED_CLOCK,
+};
+
+enum {
+	MT8365_AFE_TDM_OUT_I2S = 0,
+	MT8365_AFE_TDM_OUT_TDM,
+	MT8365_AFE_TDM_OUT_I2S_32BITS,
+};
+
+enum mt8365_afe_tdm_ch_start {
+	AFE_TDM_CH_START_O28_O29 = 0,
+	AFE_TDM_CH_START_O30_O31,
+	AFE_TDM_CH_START_O32_O33,
+	AFE_TDM_CH_START_O34_O35,
+	AFE_TDM_CH_ZERO,
+};
+
+enum {
+	MT8365_PCM_FORMAT_I2S = 0,
+	MT8365_PCM_FORMAT_EIAJ,
+	MT8365_PCM_FORMAT_PCMA,
+	MT8365_PCM_FORMAT_PCMB,
+};
+
+enum {
+	MT8365_FS_8K = 0,
+	MT8365_FS_11D025K,
+	MT8365_FS_12K,
+	MT8365_FS_384K,
+	MT8365_FS_16K,
+	MT8365_FS_22D05K,
+	MT8365_FS_24K,
+	MT8365_FS_130K,
+	MT8365_FS_32K,
+	MT8365_FS_44D1K,
+	MT8365_FS_48K,
+	MT8365_FS_88D2K,
+	MT8365_FS_96K,
+	MT8365_FS_176D4K,
+	MT8365_FS_192K,
+};
+
+enum {
+	FS_8000HZ  = 0, /* 0000b */
+	FS_11025HZ = 1, /* 0001b */
+	FS_12000HZ = 2, /* 0010b */
+	FS_384000HZ = 3, /* 0011b */
+	FS_16000HZ = 4, /* 0100b */
+	FS_22050HZ = 5, /* 0101b */
+	FS_24000HZ = 6, /* 0110b */
+	FS_130000HZ = 7, /* 0111b */
+	FS_32000HZ = 8, /* 1000b */
+	FS_44100HZ = 9, /* 1001b */
+	FS_48000HZ = 10, /* 1010b */
+	FS_88200HZ = 11, /* 1011b */
+	FS_96000HZ = 12, /* 1100b */
+	FS_176400HZ = 13, /* 1101b */
+	FS_192000HZ = 14, /* 1110b */
+	FS_260000HZ = 15, /* 1111b */
+};
+
+enum {
+	MT8365_AFE_DEBUGFS_AFE,
+	MT8365_AFE_DEBUGFS_MEMIF,
+	MT8365_AFE_DEBUGFS_IRQ,
+	MT8365_AFE_DEBUGFS_CONN,
+	MT8365_AFE_DEBUGFS_DBG,
+	MT8365_AFE_DEBUGFS_NUM,
+};
+
+enum {
+	MT8365_AFE_IRQ_DIR_MCU = 0,
+	MT8365_AFE_IRQ_DIR_DSP,
+	MT8365_AFE_IRQ_DIR_BOTH,
+};
+
+/* MCLK */
+enum {
+	MT8365_I2S0_MCK = 0,
+	MT8365_I2S3_MCK,
+	MT8365_MCK_NUM,
+};
+
+struct mt8365_fe_dai_data {
+	bool use_sram;
+	unsigned int sram_phy_addr;
+	void __iomem *sram_vir_addr;
+	unsigned int sram_size;
+};
+
+struct mt8365_be_dai_data {
+	bool prepared[SNDRV_PCM_STREAM_LAST + 1];
+	unsigned int fmt_mode;
+};
+
+#define MT8365_CLK_26M 26000000
+#define MT8365_CLK_24M 24000000
+#define MT8365_CLK_22M 22000000
+#define MT8365_CM_UPDATA_CNT_SET 8
+
+enum mt8365_cm_num {
+	MT8365_CM1 = 0,
+	MT8365_CM2,
+	MT8365_CM_NUM,
+};
+
+enum mt8365_cm2_mux_in {
+	MT8365_FROM_GASRC1 = 1,
+	MT8365_FROM_GASRC2,
+	MT8365_FROM_TDM_ASRC,
+	MT8365_CM_MUX_NUM,
+};
+
+enum cm2_mux_conn_in {
+	GENERAL2_ASRC_OUT_LCH = 0,
+	GENERAL2_ASRC_OUT_RCH = 1,
+	TDM_IN_CH0 = 2,
+	TDM_IN_CH1 = 3,
+	TDM_IN_CH2 = 4,
+	TDM_IN_CH3 = 5,
+	TDM_IN_CH4 = 6,
+	TDM_IN_CH5 = 7,
+	TDM_IN_CH6 = 8,
+	TDM_IN_CH7 = 9,
+	GENERAL1_ASRC_OUT_LCH = 10,
+	GENERAL1_ASRC_OUT_RCH = 11,
+	TDM_OUT_ASRC_CH0 = 12,
+	TDM_OUT_ASRC_CH1 = 13,
+	TDM_OUT_ASRC_CH2 = 14,
+	TDM_OUT_ASRC_CH3 = 15,
+	TDM_OUT_ASRC_CH4 = 16,
+	TDM_OUT_ASRC_CH5 = 17,
+	TDM_OUT_ASRC_CH6 = 18,
+	TDM_OUT_ASRC_CH7 = 19
+};
+
+struct mt8365_cm_ctrl_reg {
+	unsigned int con0;
+	unsigned int con1;
+	unsigned int con2;
+	unsigned int con3;
+	unsigned int con4;
+};
+
+struct mt8365_control_data {
+	bool bypass_cm1;
+	bool bypass_cm2;
+	unsigned int loopback_type;
+};
+
+enum dmic_input_mode {
+	DMIC_MODE_3P25M = 0,
+	DMIC_MODE_1P625M,
+	DMIC_MODE_812P5K,
+	DMIC_MODE_406P25K,
+};
+
+enum iir_mode {
+	IIR_MODE0 = 0,
+	IIR_MODE1,
+	IIR_MODE2,
+	IIR_MODE3,
+	IIR_MODE4,
+	IIR_MODE5,
+};
+
+enum {
+	MT8365_GASRC1 = 0,
+	MT8365_GASRC2,
+	MT8365_GASRC_NUM,
+	MT8365_TDM_ASRC1 = MT8365_GASRC_NUM,
+	MT8365_TDM_ASRC2,
+	MT8365_TDM_ASRC3,
+	MT8365_TDM_ASRC4,
+	MT8365_TDM_ASRC_NUM,
+};
+
+struct mt8365_gasrc_ctrl_reg {
+	unsigned int con0;
+	unsigned int con2;
+	unsigned int con3;
+	unsigned int con4;
+	unsigned int con5;
+	unsigned int con6;
+	unsigned int con9;
+	unsigned int con10;
+	unsigned int con12;
+	unsigned int con13;
+};
+
+struct mt8365_gasrc_data {
+	bool duplex;
+	bool tx_mode;
+	bool cali_on;
+	bool tdm_asrc_out_cm2;
+	bool iir_on;
+};
+
+#ifdef CONFIG_MTK_HIFIXDSP_SUPPORT
+struct mt8365_adsp_data {
+	/* information adsp supply */
+	bool adsp_on;
+	int (*hostless_active)(void);
+	/* information afe supply */
+	int (*set_afe_memif)(struct mtk_base_afe *afe,
+			     int memif_id,
+			     unsigned int rate,
+			     unsigned int channels,
+			     snd_pcm_format_t format);
+	int (*set_afe_memif_enable)(struct mtk_base_afe *afe,
+				    int memif_id,
+				    unsigned int rate,
+				    unsigned int period_size,
+				    int enable);
+	void (*get_afe_memif_sram)(struct mtk_base_afe *afe,
+				   int memif_id,
+				   unsigned int *paddr,
+				   unsigned int *size);
+	void (*set_afe_init)(struct mtk_base_afe *afe);
+	void (*set_afe_uninit)(struct mtk_base_afe *afe);
+};
+#endif
+
+struct mt8365_afe_private {
+	struct clk *clocks[MT8365_CLK_NUM];
+	struct regmap *topckgen;
+	struct mt8365_fe_dai_data fe_data[MT8365_AFE_MEMIF_NUM];
+	struct mt8365_be_dai_data be_data[MT8365_AFE_BACKEND_NUM];
+	struct mt8365_control_data ctrl_data;
+	struct mt8365_gasrc_data gasrc_data[MT8365_TDM_ASRC_NUM];
+#ifdef CONFIG_MTK_HIFIXDSP_SUPPORT
+	struct mt8365_adsp_data adsp_data;
+#endif
+	int afe_on_ref_cnt;
+	int top_cg_ref_cnt[MT8365_TOP_CG_NUM];
+	void __iomem *afe_sram_vir_addr;
+	unsigned int afe_sram_phy_addr;
+	unsigned int afe_sram_size;
+	/* locks */
+	spinlock_t afe_ctrl_lock;
+	struct mutex afe_clk_mutex;	/* Protect & sync APLL TUNER registers access*/
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *debugfs_dentry[MT8365_AFE_DEBUGFS_NUM];
+#endif
+	int apll_tuner_ref_cnt[MT8365_AFE_APLL_NUM];
+	unsigned int tdm_out_mode;
+	unsigned int cm2_mux_input;
+
+	/* dai */
+	bool dai_on[MT8365_AFE_BACKEND_END];
+	void *dai_priv[MT8365_AFE_BACKEND_END];
+};
+
+static inline u32 rx_frequency_palette(unsigned int fs)
+{
+	/* *
+	 * A = (26M / fs) * 64
+	 * B = 8125 / A
+	 * return = DEC2HEX(B * 2^23)
+	 */
+	switch (fs) {
+	case FS_8000HZ:		return 0x050000;
+	case FS_11025HZ:	return 0x06E400;
+	case FS_12000HZ:	return 0x078000;
+	case FS_16000HZ:	return 0x0A0000;
+	case FS_22050HZ:	return 0x0DC800;
+	case FS_24000HZ:	return 0x0F0000;
+	case FS_32000HZ:	return 0x140000;
+	case FS_44100HZ:	return 0x1B9000;
+	case FS_48000HZ:	return 0x1E0000;
+	case FS_88200HZ:	return 0x372000;
+	case FS_96000HZ:	return 0x3C0000;
+	case FS_176400HZ:	return 0x6E4000;
+	case FS_192000HZ:	return 0x780000;
+	default:		return 0x0;
+	}
+}
+
+static inline u32 AutoRstThHi(unsigned int fs)
+{
+	switch (fs) {
+	case FS_8000HZ:		return 0x36000;
+	case FS_11025HZ:	return 0x27000;
+	case FS_12000HZ:	return 0x24000;
+	case FS_16000HZ:	return 0x1B000;
+	case FS_22050HZ:	return 0x14000;
+	case FS_24000HZ:	return 0x12000;
+	case FS_32000HZ:	return 0x0D800;
+	case FS_44100HZ:	return 0x09D00;
+	case FS_48000HZ:	return 0x08E00;
+	case FS_88200HZ:	return 0x04E00;
+	case FS_96000HZ:	return 0x04800;
+	case FS_176400HZ:	return 0x02700;
+	case FS_192000HZ:	return 0x02400;
+	default:		return 0x0;
+	}
+}
+
+static inline u32 AutoRstThLo(unsigned int fs)
+{
+	switch (fs) {
+	case FS_8000HZ:		return 0x30000;
+	case FS_11025HZ:	return 0x23000;
+	case FS_12000HZ:	return 0x20000;
+	case FS_16000HZ:	return 0x18000;
+	case FS_22050HZ:	return 0x11000;
+	case FS_24000HZ:	return 0x0FE00;
+	case FS_32000HZ:	return 0x0BE00;
+	case FS_44100HZ:	return 0x08A00;
+	case FS_48000HZ:	return 0x07F00;
+	case FS_88200HZ:	return 0x04500;
+	case FS_96000HZ:	return 0x04000;
+	case FS_176400HZ:	return 0x02300;
+	case FS_192000HZ:	return 0x02000;
+	default:		return 0x0;
+	}
+}
+
+bool mt8365_afe_clk_group_48k(int sample_rate);
+bool mt8365_afe_rate_supported(unsigned int rate, unsigned int id);
+bool mt8365_afe_channel_supported(unsigned int channel, unsigned int id);
+#ifdef CONFIG_MTK_HIFIXDSP_SUPPORT
+struct mtk_base_afe *mt8365_afe_pcm_get_info(void);
+#endif
+
+int mt8365_dai_i2s_register(struct mtk_base_afe *afe);
+int mt8365_dai_set_priv(struct mtk_base_afe *afe,
+			int id,
+			int priv_size,
+			const void *priv_data);
+
+int mt8365_afe_fs_timing(unsigned int rate);
+
+void mt8365_afe_set_i2s_out_enable(struct mtk_base_afe *afe, bool enable);
+int mt8365_afe_set_i2s_out(struct mtk_base_afe *afe, unsigned int rate,	int bit_width);
+
+int mt8365_dai_adda_register(struct mtk_base_afe *afe);
+int mt8365_dai_enable_adda_on(struct mtk_base_afe *afe);
+int mt8365_dai_disable_adda_on(struct mtk_base_afe *afe);
+
+int mt8365_dai_dmic_register(struct mtk_base_afe *afe);
+
+int mt8365_dai_pcm_register(struct mtk_base_afe *afe);
+
+int mt8365_dai_tdm_register(struct mtk_base_afe *afe);
+
+#endif
diff --git a/sound/soc/mediatek/mt8365/mt8365-reg.h b/sound/soc/mediatek/mt8365/mt8365-reg.h
new file mode 100644
index 000000000000..f79ae78b5c1e
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-reg.h
@@ -0,0 +1,991 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Mediatek 8365 audio driver reg definition
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ * Authors: Jia Zeng <jia.zeng@mediatek.com>
+ *          Alexandre Mergnat <amergnat@baylibre.com>
+ */
+
+#ifndef _MT8365_REG_H_
+#define _MT8365_REG_H_
+
+#define AUDIO_TOP_CON0			(0x0000)
+#define AUDIO_TOP_CON1			(0x0004)
+#define AUDIO_TOP_CON2			(0x0008)
+#define AUDIO_TOP_CON3			(0x000c)
+
+#define AFE_DAC_CON0			(0x0010)
+#define AFE_DAC_CON1			(0x0014)
+#define AFE_I2S_CON			(0x0018)
+#define AFE_CONN0			(0x0020)
+#define AFE_CONN1			(0x0024)
+#define AFE_CONN2			(0x0028)
+#define AFE_CONN3			(0x002c)
+#define AFE_CONN4			(0x0030)
+#define AFE_I2S_CON1			(0x0034)
+#define AFE_I2S_CON2			(0x0038)
+#define AFE_MRGIF_CON			(0x003c)
+#define AFE_DL1_BASE			(0x0040)
+#define AFE_DL1_CUR			(0x0044)
+#define AFE_DL1_END			(0x0048)
+#define AFE_I2S_CON3			(0x004c)
+#define AFE_DL2_BASE			(0x0050)
+#define AFE_DL2_CUR			(0x0054)
+#define AFE_DL2_END			(0x0058)
+#define AFE_CONN5			(0x005c)
+#define AFE_AWB_BASE			(0x0070)
+#define AFE_AWB_END			(0x0078)
+#define AFE_AWB_CUR			(0x007c)
+#define AFE_VUL_BASE			(0x0080)
+#define AFE_VUL_END			(0x0088)
+#define AFE_VUL_CUR			(0x008c)
+#define AFE_CONN6			(0x00bc)
+#define AFE_MEMIF_MSB			(0x00cc)
+#define AFE_MEMIF_MON0			(0x00d0)
+#define AFE_MEMIF_MON1			(0x00d4)
+#define AFE_MEMIF_MON2			(0x00d8)
+#define AFE_MEMIF_MON3			(0x00dc)
+#define AFE_MEMIF_MON4			(0x00e0)
+#define AFE_MEMIF_MON5			(0x00e4)
+#define AFE_MEMIF_MON6			(0x00e8)
+#define AFE_MEMIF_MON7			(0x00ec)
+#define AFE_MEMIF_MON8			(0x00f0)
+#define AFE_MEMIF_MON9			(0x00f4)
+#define AFE_MEMIF_MON10			(0x00f8)
+#define AFE_MEMIF_MON11			(0x00fc)
+#define AFE_ADDA_DL_SRC2_CON0		(0x0108)
+#define AFE_ADDA_DL_SRC2_CON1		(0x010c)
+#define AFE_ADDA_UL_SRC_CON0		(0x0114)
+#define AFE_ADDA_UL_SRC_CON1		(0x0118)
+#define AFE_ADDA_TOP_CON0		(0x0120)
+#define AFE_ADDA_UL_DL_CON0		(0x0124)
+#define AFE_ADDA_SRC_DEBUG		(0x012c)
+#define AFE_ADDA_SRC_DEBUG_MON0		(0x0130)
+#define AFE_ADDA_SRC_DEBUG_MON1		(0x0134)
+#define AFE_ADDA_UL_SRC_MON0		(0x0148)
+#define AFE_ADDA_UL_SRC_MON1		(0x014c)
+#define AFE_SRAM_BOUND			(0x0170)
+#define AFE_SECURE_CON			(0x0174)
+#define AFE_SECURE_CONN0		(0x0178)
+#define AFE_SIDETONE_DEBUG		(0x01d0)
+#define AFE_SIDETONE_MON		(0x01d4)
+#define AFE_SIDETONE_CON0		(0x01e0)
+#define AFE_SIDETONE_COEFF		(0x01e4)
+#define AFE_SIDETONE_CON1		(0x01e8)
+#define AFE_SIDETONE_GAIN		(0x01ec)
+#define AFE_SGEN_CON0			(0x01f0)
+#define AFE_SINEGEN_CON_TDM		(0x01f8)
+#define AFE_SINEGEN_CON_TDM_IN		(0x01fc)
+#define AFE_TOP_CON0			(0x0200)
+#define AFE_BUS_CFG			(0x0240)
+#define AFE_BUS_MON0			(0x0244)
+#define AFE_ADDA_PREDIS_CON0		(0x0260)
+#define AFE_ADDA_PREDIS_CON1		(0x0264)
+#define AFE_CONN_MON0			(0x0280)
+#define AFE_CONN_MON1			(0x0284)
+#define AFE_CONN_MON2			(0x0288)
+#define AFE_CONN_MON3			(0x028c)
+#define AFE_ADDA_IIR_COEF_02_01		(0x0290)
+#define AFE_ADDA_IIR_COEF_04_03		(0x0294)
+#define AFE_ADDA_IIR_COEF_06_05		(0x0298)
+#define AFE_ADDA_IIR_COEF_08_07		(0x029c)
+#define AFE_ADDA_IIR_COEF_10_09		(0x02a0)
+#define AFE_VUL_D2_BASE			(0x0350)
+#define AFE_VUL_D2_END			(0x0358)
+#define AFE_VUL_D2_CUR			(0x035c)
+#define AFE_HDMI_OUT_CON0		(0x0370)
+#define AFE_HDMI_OUT_BASE		(0x0374)
+#define AFE_HDMI_OUT_CUR		(0x0378)
+#define AFE_HDMI_OUT_END		(0x037c)
+#define AFE_SPDIF_OUT_CON0		(0x0380)
+#define AFE_SPDIF_OUT_BASE		(0x0384)
+#define AFE_SPDIF_OUT_CUR		(0x0388)
+#define AFE_SPDIF_OUT_END		(0x038c)
+#define AFE_HDMI_CONN0			(0x0390)
+#define AFE_HDMI_CONN1			(0x0398)
+#define AFE_CONN_TDMIN_CON		(0x039c)
+#define AFE_IRQ_MCU_CON			(0x03a0)
+#define AFE_IRQ_MCU_STATUS		(0x03a4)
+#define AFE_IRQ_MCU_CLR			(0x03a8)
+#define AFE_IRQ_MCU_CNT1		(0x03ac)
+#define AFE_IRQ_MCU_CNT2		(0x03b0)
+#define AFE_IRQ_MCU_EN			(0x03b4)
+#define AFE_IRQ_MCU_MON2		(0x03b8)
+#define AFE_IRQ_MCU_CNT5		(0x03bc)
+#define AFE_IRQ1_MCU_CNT_MON		(0x03c0)
+#define AFE_IRQ2_MCU_CNT_MON		(0x03c4)
+#define AFE_IRQ1_MCU_EN_CNT_MON		(0x03c8)
+#define AFE_IRQ5_MCU_CNT_MON		(0x03cc)
+#define AFE_MEMIF_MINLEN		(0x03d0)
+#define AFE_MEMIF_MAXLEN		(0x03d4)
+#define AFE_MEMIF_PBUF_SIZE		(0x03d8)
+#define AFE_IRQ_MCU_CNT7		(0x03dc)
+#define AFE_IRQ7_MCU_CNT_MON		(0x03e0)
+#define AFE_MEMIF_PBUF2_SIZE		(0x03ec)
+#define AFE_APLL_TUNER_CFG		(0x03f0)
+#define AFE_APLL_TUNER_CFG1		(0x03f4)
+#define AFE_IRQ_MCU_CON2		(0x03f8)
+#define IRQ13_MCU_CNT			(0x0408)
+#define IRQ13_MCU_CNT_MON		(0x040c)
+#define AFE_GAIN1_CON0			(0x0410)
+#define AFE_GAIN1_CON1			(0x0414)
+#define AFE_GAIN1_CON2			(0x0418)
+#define AFE_GAIN1_CON3			(0x041c)
+#define AFE_GAIN2_CON0			(0x0428)
+#define AFE_GAIN2_CON1			(0x042c)
+#define AFE_GAIN2_CON2			(0x0430)
+#define AFE_GAIN2_CON3			(0x0434)
+#define AFE_GAIN2_CUR			(0x043c)
+#define AFE_CONN11			(0x0448)
+#define AFE_CONN12			(0x044c)
+#define AFE_CONN13			(0x0450)
+#define AFE_CONN14			(0x0454)
+#define AFE_CONN15			(0x0458)
+#define AFE_CONN16			(0x045c)
+#define AFE_CONN7			(0x0460)
+#define AFE_CONN8			(0x0464)
+#define AFE_CONN9			(0x0468)
+#define AFE_CONN10			(0x046c)
+#define AFE_CONN21			(0x0470)
+#define AFE_CONN22			(0x0474)
+#define AFE_CONN23			(0x0478)
+#define AFE_CONN24			(0x047c)
+#define AFE_IEC_CFG			(0x0480)
+#define AFE_IEC_NSNUM			(0x0484)
+#define AFE_IEC_BURST_INFO		(0x0488)
+#define AFE_IEC_BURST_LEN		(0x048c)
+#define AFE_IEC_NSADR			(0x0490)
+#define AFE_CONN_RS			(0x0494)
+#define AFE_CONN_DI			(0x0498)
+#define AFE_IEC_CHL_STAT0		(0x04a0)
+#define AFE_IEC_CHL_STAT1		(0x04a4)
+#define AFE_IEC_CHR_STAT0		(0x04a8)
+#define AFE_IEC_CHR_STAT1		(0x04ac)
+#define AFE_CONN25			(0x04b0)
+#define AFE_CONN26			(0x04b4)
+#define FPGA_CFG2			(0x04b8)
+#define FPGA_CFG3			(0x04bc)
+#define FPGA_CFG0			(0x04c0)
+#define FPGA_CFG1			(0x04c4)
+#define AFE_SRAM_DELSEL_CON0		(0x04f0)
+#define AFE_SRAM_DELSEL_CON1		(0x04f4)
+#define AFE_SRAM_DELSEL_CON2		(0x04f8)
+#define FPGA_CFG4			(0x04fc)
+#define AFE_TDM_GASRC4_ASRC_2CH_CON0	(0x0500)
+#define AFE_TDM_GASRC4_ASRC_2CH_CON1	(0x0504)
+#define AFE_TDM_GASRC4_ASRC_2CH_CON2	(0x0508)
+#define AFE_TDM_GASRC4_ASRC_2CH_CON3	(0x050c)
+#define AFE_TDM_GASRC4_ASRC_2CH_CON4	(0x0510)
+#define AFE_TDM_GASRC4_ASRC_2CH_CON5	(0x0514)
+#define AFE_TDM_GASRC4_ASRC_2CH_CON6	(0x0518)
+#define AFE_TDM_GASRC4_ASRC_2CH_CON7	(0x051c)
+#define AFE_TDM_GASRC4_ASRC_2CH_CON8	(0x0520)
+#define AFE_TDM_GASRC4_ASRC_2CH_CON9	(0x0524)
+#define AFE_TDM_GASRC4_ASRC_2CH_CON10	(0x0528)
+#define AFE_TDM_GASRC4_ASRC_2CH_CON12	(0x0530)
+#define AFE_TDM_GASRC4_ASRC_2CH_CON13	(0x0534)
+#define PCM_INTF_CON2			(0x0538)
+#define PCM2_INTF_CON			(0x053c)
+#define AFE_APB_MON			(0x0540)
+#define AFE_CONN34			(0x0544)
+#define AFE_TDM_CON1			(0x0548)
+#define AFE_TDM_CON2			(0x054c)
+#define PCM_INTF_CON1			(0x0550)
+#define AFE_SECURE_MASK_CONN47_1	(0x0554)
+#define AFE_SECURE_MASK_CONN48_1	(0x0558)
+#define AFE_SECURE_MASK_CONN49_1	(0x055c)
+#define AFE_SECURE_MASK_CONN50_1	(0x0560)
+#define AFE_SECURE_MASK_CONN51_1	(0x0564)
+#define AFE_SECURE_MASK_CONN52_1	(0x0568)
+#define AFE_SECURE_MASK_CONN53_1	(0x056c)
+#define AFE_SE_SECURE_CON		(0x0570)
+#define AFE_TDM_IN_CON1			(0x0588)
+#define AFE_TDM_IN_CON2			(0x058c)
+#define AFE_TDM_IN_MON1			(0x0590)
+#define AFE_TDM_IN_MON2			(0x0594)
+#define AFE_TDM_IN_MON3			(0x0598)
+#define AFE_DMIC0_UL_SRC_CON0		(0x05b4)
+#define AFE_DMIC0_UL_SRC_CON1		(0x05b8)
+#define AFE_DMIC0_SRC_DEBUG		(0x05bc)
+#define AFE_DMIC0_SRC_DEBUG_MON0	(0x05c0)
+#define AFE_DMIC0_UL_SRC_MON0		(0x05c8)
+#define AFE_DMIC0_UL_SRC_MON1		(0x05cc)
+#define AFE_DMIC0_IIR_COEF_02_01	(0x05d0)
+#define AFE_DMIC0_IIR_COEF_04_03	(0x05d4)
+#define AFE_DMIC0_IIR_COEF_06_05	(0x05d8)
+#define AFE_DMIC0_IIR_COEF_08_07	(0x05dc)
+#define AFE_DMIC0_IIR_COEF_10_09	(0x05e0)
+#define AFE_DMIC1_UL_SRC_CON0		(0x0620)
+#define AFE_DMIC1_UL_SRC_CON1		(0x0624)
+#define AFE_DMIC1_SRC_DEBUG		(0x0628)
+#define AFE_DMIC1_SRC_DEBUG_MON0	(0x062c)
+#define AFE_DMIC1_UL_SRC_MON0		(0x0634)
+#define AFE_DMIC1_UL_SRC_MON1		(0x0638)
+#define AFE_DMIC1_IIR_COEF_02_01	(0x063c)
+#define AFE_DMIC1_IIR_COEF_04_03	(0x0640)
+#define AFE_DMIC1_IIR_COEF_06_05	(0x0644)
+#define AFE_DMIC1_IIR_COEF_08_07	(0x0648)
+#define AFE_DMIC1_IIR_COEF_10_09	(0x064c)
+#define AFE_SECURE_MASK_CONN39_1	(0x068c)
+#define AFE_SECURE_MASK_CONN40_1	(0x0690)
+#define AFE_SECURE_MASK_CONN41_1	(0x0694)
+#define AFE_SECURE_MASK_CONN42_1	(0x0698)
+#define AFE_SECURE_MASK_CONN43_1	(0x069c)
+#define AFE_SECURE_MASK_CONN44_1	(0x06a0)
+#define AFE_SECURE_MASK_CONN45_1	(0x06a4)
+#define AFE_SECURE_MASK_CONN46_1	(0x06a8)
+#define AFE_TDM_GASRC1_ASRC_2CH_CON0	(0x06c0)
+#define AFE_TDM_GASRC1_ASRC_2CH_CON1	(0x06c4)
+#define AFE_TDM_GASRC1_ASRC_2CH_CON2	(0x06c8)
+#define AFE_TDM_GASRC1_ASRC_2CH_CON3	(0x06cc)
+#define AFE_TDM_GASRC1_ASRC_2CH_CON4	(0x06d0)
+#define AFE_TDM_GASRC1_ASRC_2CH_CON5	(0x06d4)
+#define AFE_TDM_GASRC1_ASRC_2CH_CON6	(0x06d8)
+#define AFE_TDM_GASRC1_ASRC_2CH_CON7	(0x06dc)
+#define AFE_TDM_GASRC1_ASRC_2CH_CON8	(0x06e0)
+#define AFE_TDM_GASRC1_ASRC_2CH_CON9	(0x06e4)
+#define AFE_TDM_GASRC1_ASRC_2CH_CON10	(0x06e8)
+#define AFE_TDM_GASRC1_ASRC_2CH_CON12	(0x06f0)
+#define AFE_TDM_GASRC1_ASRC_2CH_CON13	(0x06f4)
+#define AFE_TDM_ASRC_CON0		(0x06f8)
+#define AFE_TDM_GASRC2_ASRC_2CH_CON0	(0x0700)
+#define AFE_TDM_GASRC2_ASRC_2CH_CON1	(0x0704)
+#define AFE_TDM_GASRC2_ASRC_2CH_CON2	(0x0708)
+#define AFE_TDM_GASRC2_ASRC_2CH_CON3	(0x070c)
+#define AFE_TDM_GASRC2_ASRC_2CH_CON4	(0x0710)
+#define AFE_TDM_GASRC2_ASRC_2CH_CON5	(0x0714)
+#define AFE_TDM_GASRC2_ASRC_2CH_CON6	(0x0718)
+#define AFE_TDM_GASRC2_ASRC_2CH_CON7	(0x071c)
+#define AFE_TDM_GASRC2_ASRC_2CH_CON8	(0x0720)
+#define AFE_TDM_GASRC2_ASRC_2CH_CON9	(0x0724)
+#define AFE_TDM_GASRC2_ASRC_2CH_CON10	(0x0728)
+#define AFE_TDM_GASRC2_ASRC_2CH_CON12	(0x0730)
+#define AFE_TDM_GASRC2_ASRC_2CH_CON13	(0x0734)
+#define AFE_TDM_GASRC3_ASRC_2CH_CON0	(0x0740)
+#define AFE_TDM_GASRC3_ASRC_2CH_CON1	(0x0744)
+#define AFE_TDM_GASRC3_ASRC_2CH_CON2	(0x0748)
+#define AFE_TDM_GASRC3_ASRC_2CH_CON3	(0x074c)
+#define AFE_TDM_GASRC3_ASRC_2CH_CON4	(0x0750)
+#define AFE_TDM_GASRC3_ASRC_2CH_CON5	(0x0754)
+#define AFE_TDM_GASRC3_ASRC_2CH_CON6	(0x0758)
+#define AFE_TDM_GASRC3_ASRC_2CH_CON7	(0x075c)
+#define AFE_TDM_GASRC3_ASRC_2CH_CON8	(0x0760)
+#define AFE_TDM_GASRC3_ASRC_2CH_CON9	(0x0764)
+#define AFE_TDM_GASRC3_ASRC_2CH_CON10	(0x0768)
+#define AFE_TDM_GASRC3_ASRC_2CH_CON12	(0x0770)
+#define AFE_TDM_GASRC3_ASRC_2CH_CON13	(0x0774)
+#define AFE_DMIC2_UL_SRC_CON0		(0x0780)
+#define AFE_DMIC2_UL_SRC_CON1		(0x0784)
+#define AFE_DMIC2_SRC_DEBUG		(0x0788)
+#define AFE_DMIC2_SRC_DEBUG_MON0	(0x078c)
+#define AFE_DMIC2_UL_SRC_MON0		(0x0794)
+#define AFE_DMIC2_UL_SRC_MON1		(0x0798)
+#define AFE_DMIC2_IIR_COEF_02_01	(0x079c)
+#define AFE_DMIC2_IIR_COEF_04_03	(0x07a0)
+#define AFE_DMIC2_IIR_COEF_06_05	(0x07a4)
+#define AFE_DMIC2_IIR_COEF_08_07	(0x07a8)
+#define AFE_DMIC2_IIR_COEF_10_09	(0x07ac)
+#define AFE_DMIC3_UL_SRC_CON0		(0x07ec)
+#define AFE_DMIC3_UL_SRC_CON1		(0x07f0)
+#define AFE_DMIC3_SRC_DEBUG		(0x07f4)
+#define AFE_DMIC3_SRC_DEBUG_MON0	(0x07f8)
+#define AFE_DMIC3_UL_SRC_MON0		(0x0800)
+#define AFE_DMIC3_UL_SRC_MON1		(0x0804)
+#define AFE_DMIC3_IIR_COEF_02_01	(0x0808)
+#define AFE_DMIC3_IIR_COEF_04_03	(0x080c)
+#define AFE_DMIC3_IIR_COEF_06_05	(0x0810)
+#define AFE_DMIC3_IIR_COEF_08_07	(0x0814)
+#define AFE_DMIC3_IIR_COEF_10_09	(0x0818)
+#define AFE_SECURE_MASK_CONN25_1	(0x0858)
+#define AFE_SECURE_MASK_CONN26_1	(0x085c)
+#define AFE_SECURE_MASK_CONN27_1	(0x0860)
+#define AFE_SECURE_MASK_CONN28_1	(0x0864)
+#define AFE_SECURE_MASK_CONN29_1	(0x0868)
+#define AFE_SECURE_MASK_CONN30_1	(0x086c)
+#define AFE_SECURE_MASK_CONN31_1	(0x0870)
+#define AFE_SECURE_MASK_CONN32_1	(0x0874)
+#define AFE_SECURE_MASK_CONN33_1	(0x0878)
+#define AFE_SECURE_MASK_CONN34_1	(0x087c)
+#define AFE_SECURE_MASK_CONN35_1	(0x0880)
+#define AFE_SECURE_MASK_CONN36_1	(0x0884)
+#define AFE_SECURE_MASK_CONN37_1	(0x0888)
+#define AFE_SECURE_MASK_CONN38_1	(0x088c)
+#define AFE_IRQ_MCU_SCP_EN		(0x0890)
+#define AFE_IRQ_MCU_DSP_EN		(0x0894)
+#define AFE_IRQ3_MCU_CNT_MON		(0x0898)
+#define AFE_IRQ4_MCU_CNT_MON		(0x089c)
+#define AFE_IRQ8_MCU_CNT_MON		(0x08a0)
+#define AFE_IRQ_MCU_CNT3		(0x08a4)
+#define AFE_IRQ_MCU_CNT4		(0x08a8)
+#define AFE_IRQ_MCU_CNT8		(0x08ac)
+#define AFE_IRQ_MCU_CNT11		(0x08b0)
+#define AFE_IRQ_MCU_CNT12		(0x08b4)
+#define AFE_IRQ11_MCU_CNT_MON		(0x08b8)
+#define AFE_IRQ12_MCU_CNT_MON		(0x08bc)
+#define AFE_VUL3_BASE			(0x08c0)
+#define AFE_VUL3_CUR			(0x08c4)
+#define AFE_VUL3_END			(0x08c8)
+#define AFE_VUL3_BASE_MSB		(0x08d0)
+#define AFE_VUL3_END_MSB		(0x08d4)
+#define AFE_IRQ10_MCU_CNT_MON		(0x08d8)
+#define AFE_IRQ_MCU_CNT10		(0x08dc)
+#define AFE_IRQ_ACC1_CNT		(0x08e0)
+#define AFE_IRQ_ACC2_CNT		(0x08e4)
+#define AFE_IRQ_ACC1_CNT_MON1		(0x08e8)
+#define AFE_IRQ_ACC2_CNT_MON		(0x08ec)
+#define AFE_TSF_CON			(0x08f0)
+#define AFE_TSF_MON			(0x08f4)
+#define AFE_IRQ_ACC1_CNT_MON2		(0x08f8)
+#define AFE_SPDIFIN_CFG0		(0x0900)
+#define AFE_SPDIFIN_CFG1		(0x0904)
+#define AFE_SPDIFIN_CHSTS1		(0x0908)
+#define AFE_SPDIFIN_CHSTS2		(0x090c)
+#define AFE_SPDIFIN_CHSTS3		(0x0910)
+#define AFE_SPDIFIN_CHSTS4		(0x0914)
+#define AFE_SPDIFIN_CHSTS5		(0x0918)
+#define AFE_SPDIFIN_CHSTS6		(0x091c)
+#define AFE_SPDIFIN_DEBUG1		(0x0920)
+#define AFE_SPDIFIN_DEBUG2		(0x0924)
+#define AFE_SPDIFIN_DEBUG3		(0x0928)
+#define AFE_SPDIFIN_DEBUG4		(0x092c)
+#define AFE_SPDIFIN_EC			(0x0930)
+#define AFE_SPDIFIN_CKLOCK_CFG		(0x0934)
+#define AFE_SPDIFIN_BR			(0x093c)
+#define AFE_SPDIFIN_BR_DBG1		(0x0940)
+#define AFE_SPDIFIN_INT_EXT		(0x0948)
+#define AFE_SPDIFIN_INT_EXT2		(0x094c)
+#define SPDIFIN_FREQ_INFO		(0x0950)
+#define SPDIFIN_FREQ_INFO_2		(0x0954)
+#define SPDIFIN_FREQ_INFO_3		(0x0958)
+#define SPDIFIN_FREQ_STATUS		(0x095c)
+#define SPDIFIN_USERCODE1		(0x0960)
+#define SPDIFIN_USERCODE2		(0x0964)
+#define SPDIFIN_USERCODE3		(0x0968)
+#define SPDIFIN_USERCODE4		(0x096c)
+#define SPDIFIN_USERCODE5		(0x0970)
+#define SPDIFIN_USERCODE6		(0x0974)
+#define SPDIFIN_USERCODE7		(0x0978)
+#define SPDIFIN_USERCODE8		(0x097c)
+#define SPDIFIN_USERCODE9		(0x0980)
+#define SPDIFIN_USERCODE10		(0x0984)
+#define SPDIFIN_USERCODE11		(0x0988)
+#define SPDIFIN_USERCODE12		(0x098c)
+#define SPDIFIN_MEMIF_CON0		(0x0990)
+#define SPDIFIN_BASE_ADR		(0x0994)
+#define SPDIFIN_END_ADR			(0x0998)
+#define SPDIFIN_APLL_TUNER_CFG		(0x09a0)
+#define SPDIFIN_APLL_TUNER_CFG1		(0x09a4)
+#define SPDIFIN_APLL2_TUNER_CFG		(0x09a8)
+#define SPDIFIN_APLL2_TUNER_CFG1	(0x09ac)
+#define SPDIFIN_TYPE_DET		(0x09b0)
+#define MPHONE_MULTI_CON0		(0x09b4)
+#define SPDIFIN_CUR_ADR			(0x09b8)
+#define AFE_SINEGEN_CON_SPDIFIN		(0x09bc)
+#define AFE_HDMI_IN_2CH_CON0		(0x09c0)
+#define AFE_HDMI_IN_2CH_BASE		(0x09c4)
+#define AFE_HDMI_IN_2CH_END		(0x09c8)
+#define AFE_HDMI_IN_2CH_CUR		(0x09cc)
+#define AFE_MEMIF_BUF_MON0		(0x09d0)
+#define AFE_MEMIF_BUF_MON1		(0x09d4)
+#define AFE_MEMIF_BUF_MON2		(0x09d8)
+#define AFE_MEMIF_BUF_MON3		(0x09dc)
+#define AFE_MEMIF_BUF_MON6		(0x09e8)
+#define AFE_MEMIF_BUF_MON7		(0x09ec)
+#define AFE_MEMIF_BUF_MON8		(0x09f0)
+#define AFE_MEMIF_BUF_MON10		(0x09f8)
+#define AFE_MEMIF_BUF_MON11		(0x09fc)
+#define SYSTOP_STC_CONFIG		(0x0a00)
+#define AUDIO_STC_STATUS		(0x0a04)
+#define SYSTOP_W_STC_H			(0x0a08)
+#define SYSTOP_W_STC_L			(0x0a0c)
+#define SYSTOP_R_STC_H			(0x0a10)
+#define SYSTOP_R_STC_L			(0x0a14)
+#define AUDIO_W_STC_H			(0x0a18)
+#define AUDIO_W_STC_L			(0x0a1c)
+#define AUDIO_R_STC_H			(0x0a20)
+#define AUDIO_R_STC_L			(0x0a24)
+#define SYSTOP_W_STC2_H			(0x0a28)
+#define SYSTOP_W_STC2_L			(0x0a2c)
+#define SYSTOP_R_STC2_H			(0x0a30)
+#define SYSTOP_R_STC2_L			(0x0a34)
+#define AUDIO_W_STC2_H			(0x0a38)
+#define AUDIO_W_STC2_L			(0x0a3c)
+#define AUDIO_R_STC2_H			(0x0a40)
+#define AUDIO_R_STC2_L			(0x0a44)
+
+#define AFE_CONN17			(0x0a48)
+#define AFE_CONN18			(0x0a4c)
+#define AFE_CONN19			(0x0a50)
+#define AFE_CONN20			(0x0a54)
+#define AFE_CONN27			(0x0a58)
+#define AFE_CONN28			(0x0a5c)
+#define AFE_CONN29			(0x0a60)
+#define AFE_CONN30			(0x0a64)
+#define AFE_CONN31			(0x0a68)
+#define AFE_CONN32			(0x0a6c)
+#define AFE_CONN33			(0x0a70)
+#define AFE_CONN35			(0x0a74)
+#define AFE_CONN36			(0x0a78)
+#define AFE_CONN37			(0x0a7c)
+#define AFE_CONN38			(0x0a80)
+#define AFE_CONN39			(0x0a84)
+#define AFE_CONN40			(0x0a88)
+#define AFE_CONN41			(0x0a8c)
+#define AFE_CONN42			(0x0a90)
+#define AFE_CONN44			(0x0a94)
+#define AFE_CONN45			(0x0a98)
+#define AFE_CONN46			(0x0a9c)
+#define AFE_CONN47			(0x0aa0)
+#define AFE_CONN_24BIT			(0x0aa4)
+#define AFE_CONN0_1			(0x0aa8)
+#define AFE_CONN1_1			(0x0aac)
+#define AFE_CONN2_1			(0x0ab0)
+#define AFE_CONN3_1			(0x0ab4)
+#define AFE_CONN4_1			(0x0ab8)
+#define AFE_CONN5_1			(0x0abc)
+#define AFE_CONN6_1			(0x0ac0)
+#define AFE_CONN7_1			(0x0ac4)
+#define AFE_CONN8_1			(0x0ac8)
+#define AFE_CONN9_1			(0x0acc)
+#define AFE_CONN10_1			(0x0ad0)
+#define AFE_CONN11_1			(0x0ad4)
+#define AFE_CONN12_1			(0x0ad8)
+#define AFE_CONN13_1			(0x0adc)
+#define AFE_CONN14_1			(0x0ae0)
+#define AFE_CONN15_1			(0x0ae4)
+#define AFE_CONN16_1			(0x0ae8)
+#define AFE_CONN17_1			(0x0aec)
+#define AFE_CONN18_1			(0x0af0)
+#define AFE_CONN19_1			(0x0af4)
+#define AFE_CONN43			(0x0af8)
+#define AFE_CONN43_1			(0x0afc)
+#define AFE_CONN21_1			(0x0b00)
+#define AFE_CONN22_1			(0x0b04)
+#define AFE_CONN23_1			(0x0b08)
+#define AFE_CONN24_1			(0x0b0c)
+#define AFE_CONN25_1			(0x0b10)
+#define AFE_CONN26_1			(0x0b14)
+#define AFE_CONN27_1			(0x0b18)
+#define AFE_CONN28_1			(0x0b1c)
+#define AFE_CONN29_1			(0x0b20)
+#define AFE_CONN30_1			(0x0b24)
+#define AFE_CONN31_1			(0x0b28)
+#define AFE_CONN32_1			(0x0b2c)
+#define AFE_CONN33_1			(0x0b30)
+#define AFE_CONN34_1			(0x0b34)
+#define AFE_CONN35_1			(0x0b38)
+#define AFE_CONN36_1			(0x0b3c)
+#define AFE_CONN37_1			(0x0b40)
+#define AFE_CONN38_1			(0x0b44)
+#define AFE_CONN39_1			(0x0b48)
+#define AFE_CONN40_1			(0x0b4c)
+#define AFE_CONN41_1			(0x0b50)
+#define AFE_CONN42_1			(0x0b54)
+#define AFE_CONN44_1			(0x0b58)
+#define AFE_CONN45_1			(0x0b5c)
+#define AFE_CONN46_1			(0x0b60)
+#define AFE_CONN47_1			(0x0b64)
+#define AFE_CONN_RS_1			(0x0b68)
+#define AFE_CONN_DI_1			(0x0b6c)
+#define AFE_CONN_24BIT_1		(0x0b70)
+#define AFE_GAIN1_CUR			(0x0b78)
+#define AFE_CONN20_1			(0x0b7c)
+#define AFE_DL1_BASE_MSB		(0x0b80)
+#define AFE_DL1_END_MSB			(0x0b84)
+#define AFE_DL2_BASE_MSB		(0x0b88)
+#define AFE_DL2_END_MSB			(0x0b8c)
+#define AFE_AWB_BASE_MSB		(0x0b90)
+#define AFE_AWB_END_MSB			(0x0b94)
+#define AFE_VUL_BASE_MSB		(0x0ba0)
+#define AFE_VUL_END_MSB			(0x0ba4)
+#define AFE_VUL_D2_BASE_MSB		(0x0ba8)
+#define AFE_VUL_D2_END_MSB		(0x0bac)
+#define AFE_HDMI_OUT_BASE_MSB		(0x0bb8)
+#define AFE_HDMI_OUT_END_MSB		(0x0bbc)
+#define AFE_HDMI_IN_2CH_BASE_MSB	(0x0bc0)
+#define AFE_HDMI_IN_2CH_END_MSB		(0x0bc4)
+#define AFE_SPDIF_OUT_BASE_MSB		(0x0bc8)
+#define AFE_SPDIF_OUT_END_MSB		(0x0bcc)
+#define SPDIFIN_BASE_MSB		(0x0bd0)
+#define SPDIFIN_END_MSB			(0x0bd4)
+#define AFE_DL1_CUR_MSB			(0x0bd8)
+#define AFE_DL2_CUR_MSB			(0x0bdc)
+#define AFE_AWB_CUR_MSB			(0x0be8)
+#define AFE_VUL_CUR_MSB			(0x0bf8)
+#define AFE_VUL_D2_CUR_MSB		(0x0c04)
+#define AFE_HDMI_OUT_CUR_MSB		(0x0c0c)
+#define AFE_HDMI_IN_2CH_CUR_MSB		(0x0c10)
+#define AFE_SPDIF_OUT_CUR_MSB		(0x0c14)
+#define SPDIFIN_CUR_MSB			(0x0c18)
+#define AFE_CONN_REG			(0x0c20)
+#define AFE_SECURE_MASK_CONN14_1	(0x0c24)
+#define AFE_SECURE_MASK_CONN15_1	(0x0c28)
+#define AFE_SECURE_MASK_CONN16_1	(0x0c2c)
+#define AFE_SECURE_MASK_CONN17_1	(0x0c30)
+#define AFE_SECURE_MASK_CONN18_1	(0x0c34)
+#define AFE_SECURE_MASK_CONN19_1	(0x0c38)
+#define AFE_SECURE_MASK_CONN20_1	(0x0c3c)
+#define AFE_SECURE_MASK_CONN21_1	(0x0c40)
+#define AFE_SECURE_MASK_CONN22_1	(0x0c44)
+#define AFE_SECURE_MASK_CONN23_1	(0x0c48)
+#define AFE_SECURE_MASK_CONN24_1	(0x0c4c)
+#define AFE_ADDA_DL_SDM_DCCOMP_CON	(0x0c50)
+#define AFE_ADDA_DL_SDM_TEST		(0x0c54)
+#define AFE_ADDA_DL_DC_COMP_CFG0	(0x0c58)
+#define AFE_ADDA_DL_DC_COMP_CFG1	(0x0c5c)
+#define AFE_ADDA_DL_SDM_FIFO_MON	(0x0c60)
+#define AFE_ADDA_DL_SRC_LCH_MON		(0x0c64)
+#define AFE_ADDA_DL_SRC_RCH_MON		(0x0c68)
+#define AFE_ADDA_DL_SDM_OUT_MON		(0x0c6c)
+#define AFE_ADDA_DL_SDM_DITHER_CON	(0x0c70)
+
+#define AFE_VUL3_CUR_MSB		(0x0c78)
+#define AFE_ASRC_2CH_CON0		(0x0c80)
+#define AFE_ASRC_2CH_CON1		(0x0c84)
+#define AFE_ASRC_2CH_CON2		(0x0c88)
+#define AFE_ASRC_2CH_CON3		(0x0c8c)
+#define AFE_ASRC_2CH_CON4		(0x0c90)
+#define AFE_ASRC_2CH_CON5		(0x0c94)
+#define AFE_ASRC_2CH_CON6		(0x0c98)
+#define AFE_ASRC_2CH_CON7		(0x0c9c)
+#define AFE_ASRC_2CH_CON8		(0x0ca0)
+#define AFE_ASRC_2CH_CON9		(0x0ca4)
+#define AFE_ASRC_2CH_CON10		(0x0ca8)
+#define AFE_ASRC_2CH_CON12		(0x0cb0)
+#define AFE_ASRC_2CH_CON13		(0x0cb4)
+
+#define AFE_PCM_TX_ASRC_2CH_CON0	(0x0cc0)
+#define AFE_PCM_TX_ASRC_2CH_CON1	(0x0cc4)
+#define AFE_PCM_TX_ASRC_2CH_CON2	(0x0cc8)
+#define AFE_PCM_TX_ASRC_2CH_CON3	(0x0ccc)
+#define AFE_PCM_TX_ASRC_2CH_CON4	(0x0cd0)
+#define AFE_PCM_TX_ASRC_2CH_CON5	(0x0cd4)
+#define AFE_PCM_TX_ASRC_2CH_CON6	(0x0cd8)
+#define AFE_PCM_TX_ASRC_2CH_CON7	(0x0cdc)
+#define AFE_PCM_TX_ASRC_2CH_CON8	(0x0ce0)
+#define AFE_PCM_TX_ASRC_2CH_CON9	(0x0ce4)
+#define AFE_PCM_TX_ASRC_2CH_CON10	(0x0ce8)
+#define AFE_PCM_TX_ASRC_2CH_CON12	(0x0cf0)
+#define AFE_PCM_TX_ASRC_2CH_CON13	(0x0cf4)
+#define AFE_PCM_RX_ASRC_2CH_CON0	(0x0d00)
+#define AFE_PCM_RX_ASRC_2CH_CON1	(0x0d04)
+#define AFE_PCM_RX_ASRC_2CH_CON2	(0x0d08)
+#define AFE_PCM_RX_ASRC_2CH_CON3	(0x0d0c)
+#define AFE_PCM_RX_ASRC_2CH_CON4	(0x0d10)
+#define AFE_PCM_RX_ASRC_2CH_CON5	(0x0d14)
+#define AFE_PCM_RX_ASRC_2CH_CON6	(0x0d18)
+#define AFE_PCM_RX_ASRC_2CH_CON7	(0x0d1c)
+#define AFE_PCM_RX_ASRC_2CH_CON8	(0x0d20)
+#define AFE_PCM_RX_ASRC_2CH_CON9	(0x0d24)
+#define AFE_PCM_RX_ASRC_2CH_CON10	(0x0d28)
+#define AFE_PCM_RX_ASRC_2CH_CON12	(0x0d30)
+#define AFE_PCM_RX_ASRC_2CH_CON13	(0x0d34)
+
+#define AFE_ADDA_PREDIS_CON2		(0x0d40)
+#define AFE_ADDA_PREDIS_CON3		(0x0d44)
+#define AFE_SECURE_MASK_CONN4_1		(0x0d48)
+#define AFE_SECURE_MASK_CONN5_1		(0x0d4c)
+#define AFE_SECURE_MASK_CONN6_1		(0x0d50)
+#define AFE_SECURE_MASK_CONN7_1		(0x0d54)
+#define AFE_SECURE_MASK_CONN8_1		(0x0d58)
+#define AFE_SECURE_MASK_CONN9_1		(0x0d5c)
+#define AFE_SECURE_MASK_CONN10_1	(0x0d60)
+#define AFE_SECURE_MASK_CONN11_1	(0x0d64)
+#define AFE_SECURE_MASK_CONN12_1	(0x0d68)
+#define AFE_SECURE_MASK_CONN13_1	(0x0d6c)
+#define AFE_MEMIF_MON12			(0x0d70)
+#define AFE_MEMIF_MON13			(0x0d74)
+#define AFE_MEMIF_MON14			(0x0d78)
+#define AFE_MEMIF_MON15			(0x0d7c)
+#define AFE_SECURE_MASK_CONN42		(0x0dbc)
+#define AFE_SECURE_MASK_CONN43		(0x0dc0)
+#define AFE_SECURE_MASK_CONN44		(0x0dc4)
+#define AFE_SECURE_MASK_CONN45		(0x0dc8)
+#define AFE_SECURE_MASK_CONN46		(0x0dcc)
+#define AFE_HD_ENGEN_ENABLE		(0x0dd0)
+#define AFE_SECURE_MASK_CONN47		(0x0dd4)
+#define AFE_SECURE_MASK_CONN48		(0x0dd8)
+#define AFE_SECURE_MASK_CONN49		(0x0ddc)
+#define AFE_SECURE_MASK_CONN50		(0x0de0)
+#define AFE_SECURE_MASK_CONN51		(0x0de4)
+#define AFE_SECURE_MASK_CONN52		(0x0de8)
+#define AFE_SECURE_MASK_CONN53		(0x0dec)
+#define AFE_SECURE_MASK_CONN0_1		(0x0df0)
+#define AFE_SECURE_MASK_CONN1_1		(0x0df4)
+#define AFE_SECURE_MASK_CONN2_1		(0x0df8)
+#define AFE_SECURE_MASK_CONN3_1		(0x0dfc)
+
+#define AFE_ADDA_MTKAIF_CFG0		(0x0e00)
+#define AFE_ADDA_MTKAIF_SYNCWORD_CFG	(0x0e14)
+#define AFE_ADDA_MTKAIF_RX_CFG0		(0x0e20)
+#define AFE_ADDA_MTKAIF_RX_CFG1		(0x0e24)
+#define AFE_ADDA_MTKAIF_RX_CFG2		(0x0e28)
+#define AFE_ADDA_MTKAIF_MON0		(0x0e34)
+#define AFE_ADDA_MTKAIF_MON1		(0x0e38)
+#define AFE_AUD_PAD_TOP			(0x0e40)
+
+#define AFE_CM1_CON4			(0x0e48)
+#define AFE_CM2_CON4			(0x0e4c)
+#define AFE_CM1_CON0			(0x0e50)
+#define AFE_CM1_CON1			(0x0e54)
+#define AFE_CM1_CON2			(0x0e58)
+#define AFE_CM1_CON3			(0x0e5c)
+#define AFE_CM2_CON0			(0x0e60)
+#define AFE_CM2_CON1			(0x0e64)
+#define AFE_CM2_CON2			(0x0e68)
+#define AFE_CM2_CON3			(0x0e6c)
+#define AFE_CM2_CONN0			(0x0e70)
+#define AFE_CM2_CONN1			(0x0e74)
+#define AFE_CM2_CONN2			(0x0e78)
+
+#define AFE_GENERAL1_ASRC_2CH_CON0	(0x0e80)
+#define AFE_GENERAL1_ASRC_2CH_CON1	(0x0e84)
+#define AFE_GENERAL1_ASRC_2CH_CON2	(0x0e88)
+#define AFE_GENERAL1_ASRC_2CH_CON3	(0x0e8c)
+#define AFE_GENERAL1_ASRC_2CH_CON4	(0x0e90)
+#define AFE_GENERAL1_ASRC_2CH_CON5	(0x0e94)
+#define AFE_GENERAL1_ASRC_2CH_CON6	(0x0e98)
+#define AFE_GENERAL1_ASRC_2CH_CON7	(0x0e9c)
+#define AFE_GENERAL1_ASRC_2CH_CON8	(0x0ea0)
+#define AFE_GENERAL1_ASRC_2CH_CON9	(0x0ea4)
+#define AFE_GENERAL1_ASRC_2CH_CON10	(0x0ea8)
+#define AFE_GENERAL1_ASRC_2CH_CON12	(0x0eb0)
+#define AFE_GENERAL1_ASRC_2CH_CON13	(0x0eb4)
+#define GENERAL_ASRC_MODE		(0x0eb8)
+#define GENERAL_ASRC_EN_ON		(0x0ebc)
+
+#define AFE_CONN48			(0x0ec0)
+#define AFE_CONN49			(0x0ec4)
+#define AFE_CONN50			(0x0ec8)
+#define AFE_CONN51			(0x0ecc)
+#define AFE_CONN52			(0x0ed0)
+#define AFE_CONN53			(0x0ed4)
+#define AFE_CONN48_1			(0x0ee0)
+#define AFE_CONN49_1			(0x0ee4)
+#define AFE_CONN50_1			(0x0ee8)
+#define AFE_CONN51_1			(0x0eec)
+#define AFE_CONN52_1			(0x0ef0)
+#define AFE_CONN53_1			(0x0ef4)
+
+#define AFE_GENERAL2_ASRC_2CH_CON0	(0x0f00)
+#define AFE_GENERAL2_ASRC_2CH_CON1	(0x0f04)
+#define AFE_GENERAL2_ASRC_2CH_CON2	(0x0f08)
+#define AFE_GENERAL2_ASRC_2CH_CON3	(0x0f0c)
+#define AFE_GENERAL2_ASRC_2CH_CON4	(0x0f10)
+#define AFE_GENERAL2_ASRC_2CH_CON5	(0x0f14)
+#define AFE_GENERAL2_ASRC_2CH_CON6	(0x0f18)
+#define AFE_GENERAL2_ASRC_2CH_CON7	(0x0f1c)
+#define AFE_GENERAL2_ASRC_2CH_CON8	(0x0f20)
+#define AFE_GENERAL2_ASRC_2CH_CON9	(0x0f24)
+#define AFE_GENERAL2_ASRC_2CH_CON10	(0x0f28)
+#define AFE_GENERAL2_ASRC_2CH_CON12	(0x0f30)
+#define AFE_GENERAL2_ASRC_2CH_CON13	(0x0f34)
+
+#define AFE_SECURE_MASK_CONN28		(0x0f48)
+#define AFE_SECURE_MASK_CONN29		(0x0f4c)
+#define AFE_SECURE_MASK_CONN30		(0x0f50)
+#define AFE_SECURE_MASK_CONN31		(0x0f54)
+#define AFE_SECURE_MASK_CONN32		(0x0f58)
+#define AFE_SECURE_MASK_CONN33		(0x0f5c)
+#define AFE_SECURE_MASK_CONN34		(0x0f60)
+#define AFE_SECURE_MASK_CONN35		(0x0f64)
+#define AFE_SECURE_MASK_CONN36		(0x0f68)
+#define AFE_SECURE_MASK_CONN37		(0x0f6c)
+#define AFE_SECURE_MASK_CONN38		(0x0f70)
+#define AFE_SECURE_MASK_CONN39		(0x0f74)
+#define AFE_SECURE_MASK_CONN40		(0x0f78)
+#define AFE_SECURE_MASK_CONN41		(0x0f7c)
+#define AFE_SIDEBAND0			(0x0f80)
+#define AFE_SIDEBAND1			(0x0f84)
+#define AFE_SECURE_SIDEBAND0		(0x0f88)
+#define AFE_SECURE_SIDEBAND1		(0x0f8c)
+#define AFE_SECURE_MASK_CONN0		(0x0f90)
+#define AFE_SECURE_MASK_CONN1		(0x0f94)
+#define AFE_SECURE_MASK_CONN2		(0x0f98)
+#define AFE_SECURE_MASK_CONN3		(0x0f9c)
+#define AFE_SECURE_MASK_CONN4		(0x0fa0)
+#define AFE_SECURE_MASK_CONN5		(0x0fa4)
+#define AFE_SECURE_MASK_CONN6		(0x0fa8)
+#define AFE_SECURE_MASK_CONN7		(0x0fac)
+#define AFE_SECURE_MASK_CONN8		(0x0fb0)
+#define AFE_SECURE_MASK_CONN9		(0x0fb4)
+#define AFE_SECURE_MASK_CONN10		(0x0fb8)
+#define AFE_SECURE_MASK_CONN11		(0x0fbc)
+#define AFE_SECURE_MASK_CONN12		(0x0fc0)
+#define AFE_SECURE_MASK_CONN13		(0x0fc4)
+#define AFE_SECURE_MASK_CONN14		(0x0fc8)
+#define AFE_SECURE_MASK_CONN15		(0x0fcc)
+#define AFE_SECURE_MASK_CONN16		(0x0fd0)
+#define AFE_SECURE_MASK_CONN17		(0x0fd4)
+#define AFE_SECURE_MASK_CONN18		(0x0fd8)
+#define AFE_SECURE_MASK_CONN19		(0x0fdc)
+#define AFE_SECURE_MASK_CONN20		(0x0fe0)
+#define AFE_SECURE_MASK_CONN21		(0x0fe4)
+#define AFE_SECURE_MASK_CONN22		(0x0fe8)
+#define AFE_SECURE_MASK_CONN23		(0x0fec)
+#define AFE_SECURE_MASK_CONN24		(0x0ff0)
+#define AFE_SECURE_MASK_CONN25		(0x0ff4)
+#define AFE_SECURE_MASK_CONN26		(0x0ff8)
+#define AFE_SECURE_MASK_CONN27		(0x0ffc)
+
+#define MAX_REGISTER			AFE_SECURE_MASK_CONN27
+
+#define AFE_IRQ_STATUS_BITS		0x3ff
+
+/* AUDIO_TOP_CON0 (0x0000) */
+#define AUD_TCON0_PDN_TML		BIT(27)
+#define AUD_TCON0_PDN_DAC_PREDIS	BIT(26)
+#define AUD_TCON0_PDN_DAC		BIT(25)
+#define AUD_TCON0_PDN_ADC		BIT(24)
+#define AUD_TCON0_PDN_TDM_IN		BIT(23)
+#define AUD_TCON0_PDN_TDM_OUT		BIT(22)
+#define AUD_TCON0_PDN_SPDIF		BIT(21)
+#define AUD_TCON0_PDN_APLL_TUNER	BIT(19)
+#define AUD_TCON0_PDN_APLL2_TUNER	BIT(18)
+#define AUD_TCON0_PDN_INTDIR		BIT(15)
+#define AUD_TCON0_PDN_24M		BIT(9)
+#define AUD_TCON0_PDN_22M		BIT(8)
+#define AUD_TCON0_PDN_I2S_IN		BIT(6)
+#define AUD_TCON0_PDN_AFE		BIT(2)
+
+/* AUDIO_TOP_CON1 (0x0004) */
+#define AUD_TCON1_PDN_TDM_ASRC		BIT(15)
+#define AUD_TCON1_PDN_GENERAL2_ASRC	BIT(14)
+#define AUD_TCON1_PDN_GENERAL1_ASRC	BIT(13)
+#define AUD_TCON1_PDN_CONNSYS_I2S_ASRC	BIT(12)
+#define AUD_TCON1_PDN_DMIC3_ADC		BIT(11)
+#define AUD_TCON1_PDN_DMIC2_ADC		BIT(10)
+#define AUD_TCON1_PDN_DMIC1_ADC		BIT(9)
+#define AUD_TCON1_PDN_DMIC0_ADC		BIT(8)
+#define AUD_TCON1_PDN_I2S4_BCLK		BIT(7)
+#define AUD_TCON1_PDN_I2S3_BCLK		BIT(6)
+#define AUD_TCON1_PDN_I2S2_BCLK		BIT(5)
+#define AUD_TCON1_PDN_I2S1_BCLK		BIT(4)
+
+/* AUDIO_TOP_CON3 (0x000C) */
+#define AUD_TCON3_HDMI_BCK_INV		BIT(3)
+
+/* AFE_I2S_CON (0x0018) */
+#define AFE_I2S_CON_PHASE_SHIFT_FIX	BIT(31)
+#define AFE_I2S_CON_FROM_IO_MUX		BIT(28)
+#define AFE_I2S_CON_LOW_JITTER_CLK	BIT(12)
+#define AFE_I2S_CON_RATE_MASK		GENMASK(11, 8)
+#define AFE_I2S_CON_FORMAT_I2S		BIT(3)
+#define AFE_I2S_CON_SRC_SLAVE		BIT(2)
+
+/* AFE_ASRC_2CH_CON0 */
+#define ONE_HEART	BIT(31)
+#define CHSET_STR_CLR	BIT(4)
+#define COEFF_SRAM_CTRL	BIT(1)
+#define ASM_ON		BIT(0)
+
+/* CON2 */
+#define O16BIT		BIT(19)
+#define CLR_IIR_HISTORY	BIT(17)
+#define IS_MONO		BIT(16)
+#define IIR_EN		BIT(11)
+#define IIR_STAGE_MASK	GENMASK(10, 8)
+
+/* CON5 */
+#define CALI_CYCLE_MASK	GENMASK(31, 16)
+#define CALI_64_CYCLE	FIELD_PREP(CALI_CYCLE_MASK, 0x3F)
+#define CALI_96_CYCLE	FIELD_PREP(CALI_CYCLE_MASK, 0x5F)
+#define CALI_441_CYCLE	FIELD_PREP(CALI_CYCLE_MASK, 0x1B8)
+
+#define CALI_AUTORST	BIT(15)
+#define AUTO_TUNE_FREQ5	BIT(12)
+#define COMP_FREQ_RES	BIT(11)
+
+#define CALI_SEL_MASK	GENMASK(9, 8)
+#define CALI_SEL_00	FIELD_PREP(CALI_SEL_MASK, 0)
+#define CALI_SEL_01	FIELD_PREP(CALI_SEL_MASK, 1)
+
+#define CALI_BP_DGL		BIT(7) /* Bypass the deglitch circuit */
+#define AUTO_TUNE_FREQ4		BIT(3)
+#define CALI_AUTO_RESTART	BIT(2)
+#define CALI_USE_FREQ_OUT	BIT(1)
+#define CALI_ON			BIT(0)
+
+#define AFE_I2S_CON_WLEN_32BIT		BIT(1)
+#define AFE_I2S_CON_EN			BIT(0)
+
+#define AFE_CONN3_I03_O03_S		BIT(3)
+#define AFE_CONN4_I04_O04_S		BIT(4)
+#define AFE_CONN4_I03_O04_S		BIT(3)
+
+/* AFE_I2S_CON1 (0x0034) */
+#define AFE_I2S_CON1_I2S2_TO_PAD	BIT(18)
+#define AFE_I2S_CON1_TDMOUT_TO_PAD	(0 << 18)
+#define AFE_I2S_CON1_RATE		GENMASK(11, 8)
+#define AFE_I2S_CON1_FORMAT_I2S		BIT(3)
+#define AFE_I2S_CON1_WLEN_32BIT		BIT(1)
+#define AFE_I2S_CON1_EN			BIT(0)
+
+/* AFE_I2S_CON2 (0x0038) */
+#define AFE_I2S_CON2_LOW_JITTER_CLK	BIT(12)
+#define AFE_I2S_CON2_RATE		GENMASK(11, 8)
+#define AFE_I2S_CON2_FORMAT_I2S		BIT(3)
+#define AFE_I2S_CON2_WLEN_32BIT		BIT(1)
+#define AFE_I2S_CON2_EN			BIT(0)
+
+/* AFE_I2S_CON3 (0x004C) */
+#define AFE_I2S_CON3_LOW_JITTER_CLK	BIT(12)
+#define AFE_I2S_CON3_RATE		GENMASK(11, 8)
+#define AFE_I2S_CON3_FORMAT_I2S		BIT(3)
+#define AFE_I2S_CON3_WLEN_32BIT		BIT(1)
+#define AFE_I2S_CON3_EN			BIT(0)
+
+/* AFE_ADDA_DL_SRC2_CON0 (0x0108) */
+#define AFE_ADDA_DL_SAMPLING_RATE	GENMASK(31, 28)
+#define AFE_ADDA_DL_8X_UPSAMPLE		GENMASK(25, 24)
+#define AFE_ADDA_DL_MUTE_OFF_CH1	BIT(12)
+#define AFE_ADDA_DL_MUTE_OFF_CH2	BIT(11)
+#define AFE_ADDA_DL_VOICE_DATA		BIT(5)
+#define AFE_ADDA_DL_DEGRADE_GAIN	BIT(1)
+
+/* AFE_ADDA_UL_SRC_CON0 (0x0114) */
+#define AFE_ADDA_UL_SAMPLING_RATE	GENMASK(19, 17)
+
+/* AFE_ADDA_UL_DL_CON0 */
+#define AFE_ADDA_UL_DL_ADDA_AFE_ON	BIT(0)
+#define AFE_ADDA_UL_DL_DMIC_CLKDIV_ON	BIT(1)
+
+/* AFE_APLL_TUNER_CFG (0x03f0) */
+#define AFE_APLL_TUNER_CFG_MASK		GENMASK(15, 1)
+#define AFE_APLL_TUNER_CFG_EN_MASK	BIT(0)
+
+/* AFE_APLL_TUNER_CFG1 (0x03f4) */
+#define AFE_APLL_TUNER_CFG1_MASK	GENMASK(15, 1)
+#define AFE_APLL_TUNER_CFG1_EN_MASK	BIT(0)
+
+/* PCM_INTF_CON1 (0x0550) */
+#define PCM_INTF_CON1_EXT_MODEM		BIT(17)
+#define PCM_INTF_CON1_16BIT		(0 << 16)
+#define PCM_INTF_CON1_24BIT		BIT(16)
+#define PCM_INTF_CON1_32BCK		(0 << 14)
+#define PCM_INTF_CON1_64BCK		BIT(14)
+#define PCM_INTF_CON1_MASTER_MODE	(0 << 5)
+#define PCM_INTF_CON1_SLAVE_MODE	BIT(5)
+#define PCM_INTF_CON1_FS_MASK		GENMASK(4, 3)
+#define PCM_INTF_CON1_FS_8K		FIELD_PREP(PCM_INTF_CON1_FS_MASK, 0)
+#define PCM_INTF_CON1_FS_16K		FIELD_PREP(PCM_INTF_CON1_FS_MASK, 1)
+#define PCM_INTF_CON1_FS_32K		FIELD_PREP(PCM_INTF_CON1_FS_MASK, 2)
+#define PCM_INTF_CON1_FS_48K		FIELD_PREP(PCM_INTF_CON1_FS_MASK, 3)
+#define PCM_INTF_CON1_SYNC_LEN_MASK	GENMASK(13, 9)
+#define PCM_INTF_CON1_SYNC_LEN(x)	FIELD_PREP(PCM_INTF_CON1_SYNC_LEN_MASK, ((x) - 1))
+#define PCM_INTF_CON1_FORMAT_MASK	GENMASK(2, 1)
+#define PCM_INTF_CON1_SYNC_OUT_INV	BIT(23)
+#define PCM_INTF_CON1_BCLK_OUT_INV	BIT(22)
+#define PCM_INTF_CON1_SYNC_IN_INV	BIT(21)
+#define PCM_INTF_CON1_BCLK_IN_INV	BIT(20)
+#define PCM_INTF_CON1_BYPASS_ASRC	BIT(6)
+#define PCM_INTF_CON1_EN		BIT(0)
+#define PCM_INTF_CON1_CONFIG_MASK	(0xf3fffe)
+
+/* AFE_DMIC0_UL_SRC_CON0 (0x05b4)
+ * AFE_DMIC1_UL_SRC_CON0 (0x0620)
+ * AFE_DMIC2_UL_SRC_CON0 (0x0780)
+ * AFE_DMIC3_UL_SRC_CON0 (0x07ec)
+ */
+#define DMIC_TOP_CON_CK_PHASE_SEL_CH1		GENMASK(29, 27)
+#define DMIC_TOP_CON_CK_PHASE_SEL_CH2		GENMASK(26, 24)
+#define DMIC_TOP_CON_TWO_WIRE_MODE		BIT(23)
+#define DMIC_TOP_CON_CH2_ON			BIT(22)
+#define DMIC_TOP_CON_CH1_ON			BIT(21)
+#define DMIC_TOP_CON_VOICE_MODE_MASK		GENMASK(19, 17)
+#define DMIC_TOP_CON_VOICE_MODE_8K		FIELD_PREP(DMIC_TOP_CON_VOICE_MODE_MASK, 0)
+#define DMIC_TOP_CON_VOICE_MODE_16K		FIELD_PREP(DMIC_TOP_CON_VOICE_MODE_MASK, 1)
+#define DMIC_TOP_CON_VOICE_MODE_32K		FIELD_PREP(DMIC_TOP_CON_VOICE_MODE_MASK, 2)
+#define DMIC_TOP_CON_VOICE_MODE_48K		FIELD_PREP(DMIC_TOP_CON_VOICE_MODE_MASK, 3)
+#define DMIC_TOP_CON_LOW_POWER_MODE_MASK	GENMASK(15, 14)
+#define DMIC_TOP_CON_LOW_POWER_MODE(x)		FIELD_PREP(DMIC_TOP_CON_LOW_POWER_MODE_MASK, (x))
+#define DMIC_TOP_CON_IIR_ON			BIT(10)
+#define DMIC_TOP_CON_IIR_MODE			GENMASK(9, 7)
+#define DMIC_TOP_CON_INPUT_MODE			BIT(5)
+#define DMIC_TOP_CON_SDM3_LEVEL_MODE		BIT(1)
+#define DMIC_TOP_CON_SRC_ON			BIT(0)
+#define DMIC_TOP_CON_SDM3_DE_SELECT		(0 << 1)
+#define DMIC_TOP_CON_CONFIG_MASK		(0x3f8ed7a6)
+
+/* AFE_CONN_24BIT (0x0AA4) */
+#define AFE_CONN_24BIT_O10		BIT(10)
+#define AFE_CONN_24BIT_O09		BIT(9)
+#define AFE_CONN_24BIT_O06		BIT(6)
+#define AFE_CONN_24BIT_O05		BIT(5)
+#define AFE_CONN_24BIT_O04		BIT(4)
+#define AFE_CONN_24BIT_O03		BIT(3)
+#define AFE_CONN_24BIT_O02		BIT(2)
+#define AFE_CONN_24BIT_O01		BIT(1)
+#define AFE_CONN_24BIT_O00		BIT(0)
+
+/* AFE_HD_ENGEN_ENABLE */
+#define AFE_22M_PLL_EN		BIT(0)
+#define AFE_24M_PLL_EN		BIT(1)
+
+/* AFE_GAIN1_CON0 (0x0410) */
+#define AFE_GAIN1_CON0_EN_MASK			GENMASK(0, 0)
+#define AFE_GAIN1_CON0_MODE_MASK		GENMASK(7, 4)
+#define AFE_GAIN1_CON0_SAMPLE_PER_STEP_MASK	GENMASK(15, 8)
+
+/* AFE_GAIN1_CON1 (0x0414) */
+#define AFE_GAIN1_CON1_MASK		GENMASK(19, 0)
+
+/* AFE_GAIN1_CUR (0x0B78) */
+#define AFE_GAIN1_CUR_MASK		GENMASK(19, 0)
+
+/* AFE_CM1_CON0 (0x0e50) */
+/* AFE_CM2_CON0 (0x0e60) */
+#define CM_AFE_CM_CH_NUM_MASK		GENMASK(3, 0)
+#define CM_AFE_CM_CH_NUM(x)		FIELD_PREP(CM_AFE_CM_CH_NUM_MASK, ((x) - 1))
+#define CM_AFE_CM_ON			BIT(4)
+#define CM_AFE_CM_START_DATA_MASK	GENMASK(11, 8)
+
+#define CM_AFE_CM1_VUL_SEL		BIT(12)
+#define CM_AFE_CM1_IN_MODE_MASK		GENMASK(19, 16)
+#define CM_AFE_CM2_TDM_SEL		BIT(12)
+#define CM_AFE_CM2_CLK_SEL		BIT(13)
+#define CM_AFE_CM2_GASRC1_OUT_SEL	BIT(17)
+#define CM_AFE_CM2_GASRC2_OUT_SEL	BIT(16)
+
+/* AFE_CM2_CONN* */
+#define CM2_AFE_CM2_CONN_CFG1(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG1_MASK, (x))
+#define CM2_AFE_CM2_CONN_CFG1_MASK	GENMASK(4, 0)
+#define CM2_AFE_CM2_CONN_CFG2(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG2_MASK, (x))
+#define CM2_AFE_CM2_CONN_CFG2_MASK	GENMASK(9, 5)
+#define CM2_AFE_CM2_CONN_CFG3(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG3_MASK, (x))
+#define CM2_AFE_CM2_CONN_CFG3_MASK	GENMASK(14, 10)
+#define CM2_AFE_CM2_CONN_CFG4(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG4_MASK, (x))
+#define CM2_AFE_CM2_CONN_CFG4_MASK	GENMASK(19, 15)
+#define CM2_AFE_CM2_CONN_CFG5(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG5_MASK, (x))
+#define CM2_AFE_CM2_CONN_CFG5_MASK	GENMASK(24, 20)
+#define CM2_AFE_CM2_CONN_CFG6(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG6_MASK, (x))
+#define CM2_AFE_CM2_CONN_CFG6_MASK	GENMASK(29, 25)
+#define CM2_AFE_CM2_CONN_CFG7(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG7_MASK, (x))
+#define CM2_AFE_CM2_CONN_CFG7_MASK	GENMASK(4, 0)
+#define CM2_AFE_CM2_CONN_CFG8(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG8_MASK, (x))
+#define CM2_AFE_CM2_CONN_CFG8_MASK	GENMASK(9, 5)
+#define CM2_AFE_CM2_CONN_CFG9(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG9_MASK, (x))
+#define CM2_AFE_CM2_CONN_CFG9_MASK	GENMASK(14, 10)
+#define CM2_AFE_CM2_CONN_CFG10(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG10_MASK, (x))
+#define CM2_AFE_CM2_CONN_CFG10_MASK	GENMASK(19, 15)
+#define CM2_AFE_CM2_CONN_CFG11(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG11_MASK, (x))
+#define CM2_AFE_CM2_CONN_CFG11_MASK	GENMASK(24, 20)
+#define CM2_AFE_CM2_CONN_CFG12(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG12_MASK, (x))
+#define CM2_AFE_CM2_CONN_CFG12_MASK	GENMASK(29, 25)
+#define CM2_AFE_CM2_CONN_CFG13(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG13_MASK, (x))
+#define CM2_AFE_CM2_CONN_CFG13_MASK	GENMASK(4, 0)
+#define CM2_AFE_CM2_CONN_CFG14(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG14_MASK, (x))
+#define CM2_AFE_CM2_CONN_CFG14_MASK	GENMASK(9, 5)
+#define CM2_AFE_CM2_CONN_CFG15(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG15_MASK, (x))
+#define CM2_AFE_CM2_CONN_CFG15_MASK	GENMASK(14, 10)
+#define CM2_AFE_CM2_CONN_CFG16(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG16_MASK, (x))
+#define CM2_AFE_CM2_CONN_CFG16_MASK	GENMASK(19, 15)
+
+/* AFE_CM1_CON* */
+#define CM_AFE_CM_UPDATE_CNT1_MASK	GENMASK(15, 0)
+#define CM_AFE_CM_UPDATE_CNT1(x)	FIELD_PREP(CM_AFE_CM_UPDATE_CNT1_MASK, (x))
+#define CM_AFE_CM_UPDATE_CNT2_MASK	GENMASK(31, 16)
+#define CM_AFE_CM_UPDATE_CNT2(x)	FIELD_PREP(CM_AFE_CM_UPDATE_CNT2_MASK, (x))
+
+#endif

-- 
2.25.1

