Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3641B2C308
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E1410E5CF;
	Tue, 19 Aug 2025 12:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YZyOBnNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B934A10E5CF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:17:16 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-afcb7af30a5so863892166b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605835; x=1756210635; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YukELvO7BFxuqmK3Fc4YvloW8oK9mFXAGI0A1yxBoL0=;
 b=YZyOBnNGnPkAWpdtCS9JIwbzXp0gieDr56tgURul176Sv8R8RIuLzdSJ2CUjPYMb8x
 79GXxcPIWAaDtKuiNggalAF1n1AqbLLIBEdnEGxhMVk5QWn5lqS5+uq9sV5lyHLd5UkW
 hdlJWpIDMAL/bDypNhuGgbg5J3GQVmxOIslqKiCQBCYdHvpiYqK5lLWmggY6c1cqJXcc
 bC/I+juz82383VMCdw+zOvDQNmUd7ewnBoIR5zt9JfpuCwO9WVVg2/ax+EHtShUN6Jiw
 o6tPwSCOK29VKaKMIsDMUjZr3cC+i8l7Qe+gmjZqFdTWQBxuydeIhbqSx/vQbV2P6K0e
 8bdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605835; x=1756210635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YukELvO7BFxuqmK3Fc4YvloW8oK9mFXAGI0A1yxBoL0=;
 b=dWvw/b8cJBAQhJWO52MgtZrZSwPznh6TFW92CaGa/kJABI8wFYqg305vRSKAJZdAI5
 5N/5/hvqgGO1CqCFnFOStqBSQTCzUbX08KP5bO0YM2IFniYUu23MwNlScHx1GY5IZ3Aa
 5CDOrx+Cn0CQOqlrCto/H4odMT2cDb3cezZvvKK7VJj/PqsXbRjrFsLSiDnegFTSuP8C
 9TfSs1AbSBVCXETyn7q0t3OJXxu8JmBcYKl68kTy9NC4gXsZG2MnmvyD0GWCX2ZkpcWx
 qYXheEcmX3EG0d8KUVo96NMsn9KfSh53YPedIWJ+yxzEOEB9g9guMvYFlxwXSMC5kdV4
 DzQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBH2HDIWWmvIuZ/ztWWMj64eXGrhLqKrI2ZNTogFggiqQy5jGnHBg+oj6zhbs2o1UvyZFH9YwXbKU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydA/Lxu6s2eNjf658NHpkqZh/+j/4ykg7gmYgP/MMZbk97TCHM
 pD/McbQGfLfdmL1dZ3dPNUyvQICJaZYohHQm61/0gBekrbmmLiNEQAt5
X-Gm-Gg: ASbGncul3oub4yqSDOL+SnpvMEeGInN41ch7wmnbA8kfTTmr/nlBVmy20/Vfi9HPS7J
 QL+34IQb0QKV6MV5Fk6CALWJxnVjq2nvAcwo2/FAlgp0Gynq3hB+17/rrKNWe2ZqnBOYaSY6H9e
 jxRluP4tvTyeiw4CtpQ31TT2qHPtwnSS8e6mJJIOH/CWC7Cv/QH2vZEBgja85PpCeYtg18HIIyP
 t9jRMOarLcjAM6ZsuTDo7WBUveKV9XvHrrVMv3qeyzR1bgCZQ2nIDduoNi7GIRqQaDBE1tZaKoc
 5PfAzEFLcUYp4PUY1uVvIxliTnYwoPBbozYyqRpQJPsBUxhuI6syX3HqUmFBLYLvU3B8gyPFGB1
 W9Gfii795bh9DfQ==
X-Google-Smtp-Source: AGHT+IEBdIhP85UWceYVgxh+bBpUkfsaA6ldq+vEot3qTNaCKXppeQwm0GMn0ec+M9EpLp0nzjbrdQ==
X-Received: by 2002:a17:906:4ec3:b0:af9:3c68:f743 with SMTP id
 a640c23a62f3a-afddd0b5f90mr189547166b.34.1755605834894; 
 Tue, 19 Aug 2025 05:17:14 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:17:14 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v1 19/19] staging: media: tegra-video: add CSI support for
 Tegra20 and Tegra30
Date: Tue, 19 Aug 2025 15:16:31 +0300
Message-ID: <20250819121631.84280-20-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC.

Co-developed-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c     |  12 +
 drivers/staging/media/tegra-video/tegra20.c | 575 ++++++++++++++++++--
 drivers/staging/media/tegra-video/vi.h      |   2 +
 drivers/staging/media/tegra-video/video.c   |   2 +
 4 files changed, 553 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 2f9907a20db1..714ce52a793c 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -826,11 +826,23 @@ static void tegra_csi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+extern const struct tegra_csi_soc tegra20_csi_soc;
+#endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+extern const struct tegra_csi_soc tegra30_csi_soc;
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 extern const struct tegra_csi_soc tegra210_csi_soc;
 #endif
 
 static const struct of_device_id tegra_csi_of_id_table[] = {
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+	{ .compatible = "nvidia,tegra20-csi", .data = &tegra20_csi_soc },
+#endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+	{ .compatible = "nvidia,tegra30-csi", .data = &tegra30_csi_soc },
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
 #endif
diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index a06afe91d2de..e528ba280ae4 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -4,6 +4,9 @@
  *
  * Copyright (C) 2023 SKIDATA GmbH
  * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
+ *
+ * Copyright (c) 2025 Svyatoslav Ryhel <clamor95@gmail.com>
+ * Copyright (c) 2025 Jonas Schwöbel <jonasschwoebel@yahoo.de>
  */
 
 /*
@@ -12,12 +15,16 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clk/tegra.h>
 #include <linux/delay.h>
 #include <linux/host1x.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/kthread.h>
 #include <linux/v4l2-mediabus.h>
 
+#include "csi.h"
 #include "vip.h"
 #include "vi.h"
 
@@ -42,6 +49,9 @@ enum {
 #define       VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT	BIT(8)
 #define       VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT		0
 
+#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(n)	(0x0070 + (n) * 8)
+#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_END(n)	(0x0074 + (n) * 8)
+
 #define TEGRA_VI_VI_INPUT_CONTROL			0x0088
 #define       VI_INPUT_FIELD_DETECT			BIT(27)
 #define       VI_INPUT_BT656				BIT(25)
@@ -87,6 +97,8 @@ enum {
 #define       VI_OUTPUT_OUTPUT_FORMAT_SFT		0
 #define       VI_OUTPUT_OUTPUT_FORMAT_YUV422POST	(3 << VI_OUTPUT_OUTPUT_FORMAT_SFT)
 #define       VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR	(6 << VI_OUTPUT_OUTPUT_FORMAT_SFT)
+#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPA_BAYER	(7 << VI_OUTPUT_OUTPUT_FORMAT_SFT)
+#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPB_BAYER	(8 << VI_OUTPUT_OUTPUT_FORMAT_SFT)
 #define       VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT	(9 << VI_OUTPUT_OUTPUT_FORMAT_SFT)
 
 #define TEGRA_VI_VIP_H_ACTIVE				0x00a4
@@ -151,8 +163,106 @@ enum {
 #define TEGRA_VI_VI_RAISE				0x01ac
 #define       VI_VI_RAISE_ON_EDGE			BIT(0)
 
+#define TEGRA_VI_CSI_PP_RAISE_FRAME_START(n)		(0x01d8 + (n) * 8)
+#define TEGRA_VI_CSI_PP_RAISE_FRAME_END(n)		(0x01dc + (n) * 8)
+#define TEGRA_VI_CSI_PP_H_ACTIVE(n)			(0x01e8 + (n) * 8)
+#define TEGRA_VI_CSI_PP_V_ACTIVE(n)			(0x01ec + (n) * 8)
+
+/* Tegra20 CSI registers: Starts from 0x800, offset 0x0 */
+#define TEGRA_CSI_VI_INPUT_STREAM_CONTROL		0x0000
+#define TEGRA_CSI_HOST_INPUT_STREAM_CONTROL		0x0008
+#define TEGRA_CSI_INPUT_STREAM_CONTROL(n)		(0x0010 + (n) * 0x2c)
+#define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
+#define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
+#define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
+#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
+#define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
+#define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
+#define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
+#define       CSI_PP_PAD_SHORT_LINE_PAD1S		(1 << 24)
+#define       CSI_PP_PAD_SHORT_LINE_NOPAD		(2 << 24)
+#define       CSI_PP_EMBEDDED_DATA_EMBEDDED		BIT(20)
+#define       CSI_PP_OUTPUT_FORMAT_ARBITRARY		(0 << 16)
+#define       CSI_PP_OUTPUT_FORMAT_PIXEL		(1 << 16)
+#define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP		(2 << 16)
+#define       CSI_PP_OUTPUT_FORMAT_STORE		(3 << 16)
+#define       CSI_PP_VIRTUAL_CHANNEL_ID(n)		(((n) - 1) << 14)
+#define       CSI_PP_DATA_TYPE(n)			((n) << 8)
+#define       CSI_PP_CRC_CHECK_ENABLE			BIT(7)
+#define       CSI_PP_WORD_COUNT_HEADER			BIT(6)
+#define       CSI_PP_DATA_IDENTIFIER_ENABLE		BIT(5)
+#define       CSI_PP_PACKET_HEADER_SENT			BIT(4)
+#define TEGRA_CSI_PIXEL_STREAM_CONTROL1(n)		(0x001c + (n) * 0x2c)
+#define TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(n)		(0x0020 + (n) * 0x2c)
+#define TEGRA_CSI_PIXEL_STREAM_GAP(n)			(0x0024 + (n) * 0x2c)
+#define       CSI_PP_FRAME_MIN_GAP(n)			(((n) & 0xffff) << 16)
+#define       CSI_PP_LINE_MIN_GAP(n)			(((n) & 0xffff))
+#define TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(n)		(0x0028 + (n) * 0x2c)
+#define       CSI_PP_START_MARKER_FRAME_MAX(n)		(((n) & 0xf) << 12)
+#define       CSI_PP_START_MARKER_FRAME_MIN(n)		(((n) & 0xf) << 8)
+#define       CSI_PP_VSYNC_START_MARKER			BIT(4)
+#define       CSI_PP_SINGLE_SHOT			BIT(2)
+#define       CSI_PP_NOP				0
+#define       CSI_PP_ENABLE				1
+#define       CSI_PP_DISABLE				2
+#define       CSI_PP_RST				3
+#define TEGRA_CSI_PHY_CIL_COMMAND			0x0068
+#define       CSI_A_PHY_CIL_NOP				0x0
+#define       CSI_A_PHY_CIL_ENABLE			0x1
+#define       CSI_A_PHY_CIL_DISABLE			0x2
+#define       CSI_A_PHY_CIL_ENABLE_MASK			0x3
+#define       CSI_B_PHY_CIL_NOP				(0x0 << 16)
+#define       CSI_B_PHY_CIL_ENABLE			(0x1 << 16)
+#define       CSI_B_PHY_CIL_DISABLE			(0x2 << 16)
+#define       CSI_B_PHY_CIL_ENABLE_MASK			(0x3 << 16)
+#define TEGRA_CSI_PHY_CIL_CONTROL0(n)			(0x006c + (n) * 4)
+#define       CSI_CONTINUOUS_CLOCK_MODE_ENABLE		BIT(5)
+#define TEGRA_CSI_CSI_PIXEL_PARSER_STATUS		0x0078
+#define TEGRA_CSI_CSI_CIL_STATUS			0x007c
+#define       CSI_MIPI_AUTO_CAL_DONE			BIT(15)
+#define TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_MASK	0x0080
+#define TEGRA_CSI_CSI_CIL_INTERRUPT_MASK		0x0084
+#define TEGRA_CSI_CSI_READONLY_STATUS			0x0088
+#define TEGRA_CSI_ESCAPE_MODE_COMMAND			0x008c
+#define TEGRA_CSI_ESCAPE_MODE_DATA			0x0090
+#define TEGRA_CSI_CIL_PAD_CONFIG0(n)			(0x0094 + (n) * 8)
+#define TEGRA_CSI_CIL_PAD_CONFIG1(n)			(0x0098 + (n) * 8)
+#define TEGRA_CSI_CIL_PAD_CONFIG			0x00a4
+#define TEGRA_CSI_CILA_MIPI_CAL_CONFIG			0x00a8
+#define TEGRA_CSI_CILB_MIPI_CAL_CONFIG			0x00ac
+#define       CSI_CIL_MIPI_CAL_STARTCAL			BIT(31)
+#define       CSI_CIL_MIPI_CAL_OVERIDE_A		BIT(30)
+#define       CSI_CIL_MIPI_CAL_OVERIDE_B		BIT(30)
+#define       CSI_CIL_MIPI_CAL_NOISE_FLT(n)		(((n) & 0xf) << 26)
+#define       CSI_CIL_MIPI_CAL_PRESCALE(n)		(((n) & 0x3) << 24)
+#define       CSI_CIL_MIPI_CAL_SEL_A			BIT(21)
+#define       CSI_CIL_MIPI_CAL_SEL_B			BIT(21)
+#define       CSI_CIL_MIPI_CAL_HSPDOS(n)		(((n) & 0x1f) << 16)
+#define       CSI_CIL_MIPI_CAL_HSPUOS(n)		(((n) & 0x1f) << 8)
+#define       CSI_CIL_MIPI_CAL_TERMOS(n)		(((n) & 0x1f))
+#define TEGRA_CSI_CIL_MIPI_CAL_STATUS			0x00b0
+#define TEGRA_CSI_CLKEN_OVERRIDE			0x00b4
+#define TEGRA_CSI_DEBUG_CONTROL				0x00b8
+#define       CSI_DEBUG_CONTROL_DEBUG_EN_ENABLED	BIT(0)
+#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_0		BIT(4)
+#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_1		BIT(5)
+#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_2		BIT(6)
+#define       CSI_DEBUG_CONTROL_DBG_CNT_SEL(n, v)	((v) << (8 + 8 * (n)))
+#define TEGRA_CSI_DEBUG_COUNTER(n)			(0x00bc + (n) * 4)
+#define TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(n)	(0x00c8 + (n) * 4)
+#define       CSI_PP_EXP_FRAME_HEIGHT(n)		(((n) & 0x1fff) << 16)
+#define       CSI_PP_MAX_CLOCKS(n)			(((n) & 0xfff) << 4)
+#define       CSI_PP_LINE_TIMEOUT_ENABLE		BIT(0)
+#define TEGRA_CSI_DSI_MIPI_CAL_CONFIG			0x00d0
+#define TEGRA_CSI_MIPIBIAS_PAD_CONFIG0			0x00d4
+#define       CSI_PAD_DRIV_DN_REF(n)			(((n) & 0x7) << 16)
+#define       CSI_PAD_DRIV_UP_REF(n)			(((n) & 0x7) << 8)
+#define       CSI_PAD_TERM_REF(n)			(((n) & 0x7) << 0)
+#define TEGRA_CSI_CSI_CILA_STATUS			0x00d8
+#define TEGRA_CSI_CSI_CILB_STATUS			0x00dc
+
 /* --------------------------------------------------------------------------
- * VI
+ * Read and Write helpers
  */
 
 static void tegra20_vi_write(struct tegra_vi_channel *chan, unsigned int addr, u32 val)
@@ -160,6 +270,25 @@ static void tegra20_vi_write(struct tegra_vi_channel *chan, unsigned int addr, u
 	writel(val, chan->vi->iomem + addr);
 }
 
+static int __maybe_unused tegra20_vi_read(struct tegra_vi_channel *chan, unsigned int addr)
+{
+	return readl(chan->vi->iomem + addr);
+}
+
+static void tegra20_csi_write(struct tegra_csi_channel *csi_chan, unsigned int addr, u32 val)
+{
+	writel(val, csi_chan->csi->iomem + addr);
+}
+
+static int __maybe_unused tegra20_csi_read(struct tegra_csi_channel *csi_chan, unsigned int addr)
+{
+	return readl(csi_chan->csi->iomem + addr);
+}
+
+/* --------------------------------------------------------------------------
+ * VI
+ */
+
 /*
  * Get the main input format (YUV/RGB...) and the YUV variant as values to
  * be written into registers for the current VI input mbus code.
@@ -282,20 +411,27 @@ static int tegra20_vi_enable(struct tegra_vi *vi, bool on)
 static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel *chan)
 {
 	struct tegra_vi *vi = chan->vi;
-	struct host1x_syncpt *out_sp;
+	struct host1x_syncpt *out_sp, *fs_sp;
 
 	out_sp = host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAGED);
 	if (!out_sp)
-		return dev_err_probe(vi->dev, -ENOMEM, "failed to request syncpoint\n");
+		return dev_err_probe(vi->dev, -ENOMEM, "failed to request mw ack syncpoint\n");
 
 	chan->mw_ack_sp[0] = out_sp;
 
+	fs_sp = host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAGED);
+	if (!fs_sp)
+		return dev_err_probe(vi->dev, -ENOMEM, "failed to request frame start syncpoint\n");
+
+	chan->frame_start_sp[0] = fs_sp;
+
 	return 0;
 }
 
 static void tegra20_channel_host1x_syncpt_free(struct tegra_vi_channel *chan)
 {
 	host1x_syncpt_put(chan->mw_ack_sp[0]);
+	host1x_syncpt_put(chan->frame_start_sp[0]);
 }
 
 static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
@@ -418,30 +554,60 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 static int tegra20_channel_capture_frame(struct tegra_vi_channel *chan,
 					 struct tegra_channel_buffer *buf)
 {
+	struct v4l2_subdev *csi_subdev = NULL;
+	struct tegra_csi_channel *csi_chan = NULL;
+	u32 port;
 	int err;
 
-	chan->next_out_sp_idx++;
+	csi_subdev = tegra_channel_get_remote_csi_subdev(chan);
+	if (csi_subdev) {
+		/* CSI subdevs are named after nodes, channel@0 or channel@1 */
+		if (!strncmp(csi_subdev->name, "channel", 7)) {
+			csi_chan = to_csi_chan(csi_subdev);
+			port = csi_chan->csi_port_nums[0] & 1;
+		}
+	}
 
 	tegra20_channel_vi_buffer_setup(chan, buf);
 
-	tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_VIP_ENABLE);
+	if (csi_chan) {
+		tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
+				  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
+				  CSI_PP_SINGLE_SHOT | CSI_PP_ENABLE);
+
+		chan->next_fs_sp_idx++;
+		err = host1x_syncpt_wait(chan->frame_start_sp[0], chan->next_fs_sp_idx,
+					 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
+		if (err) {
+			host1x_syncpt_incr(chan->frame_start_sp[0]);
+			if (err != -ERESTARTSYS)
+				dev_err_ratelimited(&chan->video.dev,
+						    "frame start syncpt timeout: %d\n", err);
+		}
+
+		tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
+				  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
+				  CSI_PP_DISABLE);
+	} else {
+		tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_VIP_ENABLE);
+	}
 
-	/* Wait for syncpt counter to reach frame start event threshold */
+	chan->next_out_sp_idx++;
 	err = host1x_syncpt_wait(chan->mw_ack_sp[0], chan->next_out_sp_idx,
 				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
 	if (err) {
 		host1x_syncpt_incr(chan->mw_ack_sp[0]);
-		dev_err_ratelimited(&chan->video.dev, "frame start syncpt timeout: %d\n", err);
-		release_buffer(chan, buf, VB2_BUF_STATE_ERROR);
-		return err;
+		if (err != -ERESTARTSYS)
+			dev_err_ratelimited(&chan->video.dev, "mw ack syncpt timeout: %d\n", err);
 	}
 
-	tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
-			 VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA_CONTROL_VIP_ENABLE);
+	if (!csi_chan)
+		tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
+				 VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA_CONTROL_VIP_ENABLE);
 
 	release_buffer(chan, buf, VB2_BUF_STATE_DONE);
 
-	return 0;
+	return err;
 }
 
 static int tegra20_chan_capture_kthread_start(void *data)
@@ -502,28 +668,6 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	int output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
 			      data_type == TEGRA_IMAGE_DT_RAW10) ?
 			      OUT_2 : OUT_1;
-	int main_output_format;
-	int yuv_output_format;
-
-	tegra20_vi_get_output_formats(chan, &main_output_format, &yuv_output_format);
-
-	/*
-	 * Set up low pass filter.  Use 0x240 for chromaticity and 0x240
-	 * for luminance, which is the default and means not to touch
-	 * anything.
-	 */
-	tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
-			 0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
-			 0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
-
-	/* Set up raise-on-edge, so we get an interrupt on end of frame. */
-	tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
-
-	tegra20_vi_write(chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
-			 (chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
-			 (chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
-			 yuv_output_format << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT |
-			 main_output_format << VI_OUTPUT_OUTPUT_FORMAT_SFT);
 
 	/* Set up frame size */
 	tegra20_vi_write(chan, TEGRA_VI_OUTPUT_FRAME_SIZE(output_channel),
@@ -548,24 +692,148 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE(output_channel), 0);
 }
 
+static int tegra20_csi_pad_calibration(struct tegra_csi_channel *csi_chan)
+{
+	struct tegra_csi *csi = csi_chan->csi;
+	void __iomem *cil_status_reg = csi_chan->csi->iomem + TEGRA_CSI_CSI_CIL_STATUS;
+	unsigned int port = csi_chan->csi_port_nums[0] & 1;
+	u32 value, pp, cil;
+	int ret;
+
+	tegra20_csi_write(csi_chan, TEGRA_CSI_DSI_MIPI_CAL_CONFIG,
+			  CSI_CIL_MIPI_CAL_HSPDOS(4) |
+			  CSI_CIL_MIPI_CAL_HSPUOS(3) |
+			  CSI_CIL_MIPI_CAL_TERMOS(0));
+	tegra20_csi_write(csi_chan, TEGRA_CSI_MIPIBIAS_PAD_CONFIG0,
+			  CSI_PAD_DRIV_DN_REF(5) |
+			  CSI_PAD_DRIV_UP_REF(7) |
+			  CSI_PAD_TERM_REF(0));
+
+	/* CSI B */
+	value = CSI_CIL_MIPI_CAL_HSPDOS(0) |
+		CSI_CIL_MIPI_CAL_HSPUOS(0) |
+		CSI_CIL_MIPI_CAL_TERMOS(4);
+
+	if (port == PORT_B || csi_chan->numlanes == 4)
+		value |= CSI_CIL_MIPI_CAL_SEL_B;
+
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CILB_MIPI_CAL_CONFIG, value);
+
+	/* CSI A */
+	value = CSI_CIL_MIPI_CAL_STARTCAL |
+		CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
+		CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
+		CSI_CIL_MIPI_CAL_HSPDOS(0) |
+		CSI_CIL_MIPI_CAL_HSPUOS(0) |
+		CSI_CIL_MIPI_CAL_TERMOS(4);
+
+	if (port == PORT_A)
+		value |= CSI_CIL_MIPI_CAL_SEL_A;
+
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CILA_MIPI_CAL_CONFIG, value);
+
+	ret = readl_relaxed_poll_timeout(cil_status_reg, value,
+					 value & CSI_MIPI_AUTO_CAL_DONE, 50, 250000);
+	if (ret < 0) {
+		dev_warn(csi->dev, "MIPI calibration timeout!\n");
+		goto exit;
+	}
+
+	/* clear status */
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, value);
+	ret = readl_relaxed_poll_timeout(cil_status_reg, value,
+					 !(value & CSI_MIPI_AUTO_CAL_DONE), 50, 250000);
+	if (ret < 0) {
+		dev_warn(csi->dev, "MIPI calibration status timeout!\n");
+		goto exit;
+	}
+
+	pp = tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS);
+	cil = tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_CIL_STATUS);
+	if (pp | cil) {
+		dev_warn(csi->dev, "Calibration status not been cleared!\n");
+		ret = -EINVAL;
+		goto exit;
+	}
+
+exit:
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, pp);
+
+	/* un-select to avoid interference with DSI */
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CILB_MIPI_CAL_CONFIG,
+			  CSI_CIL_MIPI_CAL_HSPDOS(0) |
+			  CSI_CIL_MIPI_CAL_HSPUOS(0) |
+			  CSI_CIL_MIPI_CAL_TERMOS(4));
+
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CILA_MIPI_CAL_CONFIG,
+			  CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
+			  CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
+			  CSI_CIL_MIPI_CAL_HSPDOS(0) |
+			  CSI_CIL_MIPI_CAL_HSPUOS(0) |
+			  CSI_CIL_MIPI_CAL_TERMOS(4));
+
+	return ret;
+}
+
 static int tegra20_vi_start_streaming(struct vb2_queue *vq, u32 count)
 {
 	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
 	struct media_pipeline *pipe = &chan->video.pipe;
+	struct v4l2_subdev *csi_subdev, *src_subdev;
+	struct tegra_csi_channel *csi_chan = NULL;
 	int err;
 
+	csi_subdev = tegra_channel_get_remote_csi_subdev(chan);
+	if (csi_subdev) {
+		if (!strncmp(csi_subdev->name, "channel", 7))
+			csi_chan = to_csi_chan(csi_subdev);
+	}
+
+	chan->next_fs_sp_idx = host1x_syncpt_read(chan->frame_start_sp[0]);
 	chan->next_out_sp_idx = host1x_syncpt_read(chan->mw_ack_sp[0]);
 
 	err = video_device_pipeline_start(&chan->video, pipe);
 	if (err)
 		goto error_pipeline_start;
 
-	tegra20_camera_capture_setup(chan);
+	/*
+	 * Set up low pass filter.  Use 0x240 for chromaticity and 0x240
+	 * for luminance, which is the default and means not to touch
+	 * anything.
+	 */
+	tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
+			 0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
+			 0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
+
+	/* Set up raise-on-edge, so we get an interrupt on end of frame. */
+	tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
 
 	err = tegra_channel_set_stream(chan, true);
 	if (err)
 		goto error_set_stream;
 
+	tegra20_camera_capture_setup(chan);
+
+	if (csi_chan) {
+		/*
+		 * TRM has incorrectly documented to wait for done status from
+		 * calibration logic after CSI interface power on.
+		 * As per the design, calibration results are latched and applied
+		 * to the pads only when the link is in LP11 state which will happen
+		 * during the sensor stream-on.
+		 * CSI subdev stream-on triggers start of MIPI pads calibration.
+		 * Wait for calibration to finish here after sensor subdev stream-on.
+		 */
+		src_subdev = tegra_channel_get_remote_source_subdev(chan);
+		if (!src_subdev->s_stream_enabled) {
+			err = v4l2_subdev_call(src_subdev, video, s_stream, true);
+			if (err < 0 && err != -ENOIOCTLCMD)
+				goto error_set_stream;
+		}
+
+		tegra20_csi_pad_calibration(csi_chan);
+	}
+
 	chan->sequence = 0;
 
 	chan->kthread_start_capture = kthread_run(tegra20_chan_capture_kthread_start,
@@ -592,12 +860,17 @@ static int tegra20_vi_start_streaming(struct vb2_queue *vq, u32 count)
 static void tegra20_vi_stop_streaming(struct vb2_queue *vq)
 {
 	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
+	struct v4l2_subdev *src_subdev;
 
 	if (chan->kthread_start_capture) {
 		kthread_stop(chan->kthread_start_capture);
 		chan->kthread_start_capture = NULL;
 	}
 
+	src_subdev = tegra_channel_get_remote_source_subdev(chan);
+	if (src_subdev->s_stream_enabled)
+		v4l2_subdev_call(src_subdev, video, s_stream, false);
+
 	tegra_channel_release_buffers(chan, VB2_BUF_STATE_ERROR);
 	tegra_channel_set_stream(chan, false);
 	video_device_pipeline_stop(&chan->video);
@@ -652,11 +925,231 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
-	.vi_max_channels = 1, /* parallel input (VIP) */
+	.vi_max_channels = 4, /* parallel input (VIP), CSIA, CSIB, HOST */
 	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
+/* --------------------------------------------------------------------------
+ * CSI
+ */
+static void tegra20_csi_capture_clean(struct tegra_csi_channel *csi_chan)
+{
+	tegra20_csi_write(csi_chan, TEGRA_CSI_VI_INPUT_STREAM_CONTROL, 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_HOST_INPUT_STREAM_CONTROL, 0);
+
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_MASK, 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_INTERRUPT_MASK, 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_READONLY_STATUS, 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_COMMAND, 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_DATA, 0);
+
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG, 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_MIPI_CAL_STATUS, 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CLKEN_OVERRIDE, 0);
+
+	tegra20_csi_write(csi_chan, TEGRA_CSI_DEBUG_CONTROL,
+			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_0 |
+			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_1 |
+			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_2);
+}
+
+static int tegra20_csi_port_start_streaming(struct tegra_csi_channel *csi_chan,
+					    u8 portno)
+{
+	struct tegra_vi_channel *vi_chan = v4l2_get_subdev_hostdata(&csi_chan->subdev);
+	int width  = vi_chan->format.width;
+	int height = vi_chan->format.height;
+	u32 data_type = vi_chan->fmtinfo->img_dt;
+	u32 word_count = (width * vi_chan->fmtinfo->bit_width) / 8;
+	int output_channel = OUT_1;
+
+	unsigned int main_output_format, yuv_output_format;
+	unsigned int port = portno & 1;
+	u32 value;
+
+	tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yuv_output_format);
+
+	switch (data_type) {
+	case TEGRA_IMAGE_DT_RAW8:
+	case TEGRA_IMAGE_DT_RAW10:
+		output_channel = OUT_2;
+		if (port == PORT_A)
+			main_output_format = VI_OUTPUT_OUTPUT_FORMAT_CSI_PPA_BAYER;
+		else
+			main_output_format = VI_OUTPUT_OUTPUT_FORMAT_CSI_PPB_BAYER;
+		break;
+	}
+
+	tegra20_csi_capture_clean(csi_chan);
+
+	/* CSI port cleanup */
+	tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port), 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(port), 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(port), 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(port), 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port), 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port), 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(port), 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port), 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG0(port), 0);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG1(port), 0);
+
+	tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, BIT(25 + port)); /* CSI_PP_YUV422 */
+
+	tegra20_vi_write(vi_chan, TEGRA_VI_H_DOWNSCALE_CONTROL, BIT(2 + port)); /* CSI_PP */
+	tegra20_vi_write(vi_chan, TEGRA_VI_V_DOWNSCALE_CONTROL, BIT(2 + port)); /* CSI_PP */
+
+	tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_H_ACTIVE(port), width << 16);
+	tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_V_ACTIVE(port), height << 16);
+
+	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(port), 0x1);
+
+	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(port), word_count);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port),
+			  CSI_PP_FRAME_MIN_GAP(0x14)); /* 14 vi clks between frames */
+
+	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(port),
+			  CSI_PP_EXP_FRAME_HEIGHT(height) |
+			  CSI_PP_MAX_CLOCKS(0x300) | /* wait 0x300 vi clks for timeout */
+			  CSI_PP_LINE_TIMEOUT_ENABLE);
+
+	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(port),
+			  CSI_PP_OUTPUT_FORMAT_PIXEL |
+			  CSI_PP_DATA_TYPE(data_type) |
+			  CSI_PP_CRC_CHECK_ENABLE |
+			  CSI_PP_WORD_COUNT_HEADER |
+			  CSI_PP_DATA_IDENTIFIER_ENABLE |
+			  CSI_PP_PACKET_HEADER_SENT |
+			  port);
+
+	tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port),
+			  CSI_SKIP_PACKET_THRESHOLD(0x3f) |
+			  (csi_chan->numlanes - 1));
+
+	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port),
+			  CSI_CONTINUOUS_CLOCK_MODE_ENABLE |
+			  0x5); /* Clock settle time */
+
+	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(port),
+			 VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
+			 host1x_syncpt_id(vi_chan->frame_start_sp[0])
+			 << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
+
+	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT(output_channel),
+			 VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
+			 host1x_syncpt_id(vi_chan->mw_ack_sp[0])
+			 << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
+
+	value = (port == PORT_A) ? CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_DISABLE :
+		CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_DISABLE;
+	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
+
+	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
+			  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
+			  CSI_PP_DISABLE);
+
+	tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
+			 (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
+			 (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
+			 yuv_output_format | main_output_format);
+
+	return 0;
+};
+
+static void tegra20_csi_port_stop_streaming(struct tegra_csi_channel *csi_chan, u8 portno)
+{
+	struct tegra_csi *csi = csi_chan->csi;
+	unsigned int port = portno & 1;
+	u32 value;
+
+	value = tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS);
+	dev_dbg(csi->dev, "TEGRA_CSI_CSI_PIXEL_PARSER_STATUS 0x%08x\n", value);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, value);
+
+	value = tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_CIL_STATUS);
+	dev_dbg(csi->dev, "TEGRA_CSI_CSI_CIL_STATUS 0x%08x\n", value);
+	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, value);
+
+	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
+			  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
+			  CSI_PP_DISABLE);
+
+	if (csi_chan->numlanes == 4) {
+		tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND,
+				  CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_DISABLE);
+	} else {
+		value = (port == PORT_A) ? CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_NOP :
+			CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
+		tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
+	}
+}
+
+static int tegra20_csi_start_streaming(struct tegra_csi_channel *csi_chan)
+{
+	u8 *portnos = csi_chan->csi_port_nums;
+	int ret, i;
+
+	for (i = 0; i < csi_chan->numgangports; i++) {
+		ret = tegra20_csi_port_start_streaming(csi_chan, portnos[i]);
+		if (ret)
+			goto stream_start_fail;
+	}
+
+	return 0;
+
+stream_start_fail:
+	for (i = i - 1; i >= 0; i--)
+		tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
+
+	return ret;
+}
+
+static void tegra20_csi_stop_streaming(struct tegra_csi_channel *csi_chan)
+{
+	u8 *portnos = csi_chan->csi_port_nums;
+	int i;
+
+	for (i = 0; i < csi_chan->numgangports; i++)
+		tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
+}
+
+/* Tegra20 CSI operations */
+static const struct tegra_csi_ops tegra20_csi_ops = {
+	.csi_start_streaming = tegra20_csi_start_streaming,
+	.csi_stop_streaming = tegra20_csi_stop_streaming,
+};
+
+static const char * const tegra20_csi_clks[] = {
+	"csi",
+};
+
+/* Tegra20 CSI SoC data */
+const struct tegra_csi_soc tegra20_csi_soc = {
+	.ops = &tegra20_csi_ops,
+	.csi_max_channels = 2, /* CSI-A and CSI-B */
+	.clk_names = tegra20_csi_clks,
+	.num_clks = ARRAY_SIZE(tegra20_csi_clks),
+	.has_mipi_calibration = false,
+};
+
+static const char * const tegra30_csi_clks[] = {
+	"csi",
+	"csia_pad",
+	"csib_pad",
+};
+
+/* Tegra30 CSI SoC data */
+const struct tegra_csi_soc tegra30_csi_soc = {
+	.ops = &tegra20_csi_ops,
+	.csi_max_channels = 2, /* CSI-A and CSI-B */
+	.clk_names = tegra30_csi_clks,
+	.num_clks = ARRAY_SIZE(tegra30_csi_clks),
+	.has_mipi_calibration = false,
+};
+
 /* --------------------------------------------------------------------------
  * VIP
  */
@@ -677,10 +1170,11 @@ static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_chan)
 			      data_type == TEGRA_IMAGE_DT_RAW10) ?
 			      OUT_2 : OUT_1;
 
-	unsigned int main_input_format;
-	unsigned int yuv_input_format;
+	unsigned int main_input_format, yuv_input_format;
+	unsigned int main_output_format, yuv_output_format;
 
 	tegra20_vi_get_input_formats(vi_chan, &main_input_format, &yuv_input_format);
+	tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yuv_output_format);
 
 	tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, 0);
 
@@ -713,6 +1207,11 @@ static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_chan)
 
 	tegra20_vi_write(vi_chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_STOP_CAPTURE);
 
+	tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
+			 (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
+			 (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
+			  yuv_output_format | main_output_format);
+
 	return 0;
 }
 
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index cac0c0d0e225..c02517c9e09b 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -127,6 +127,7 @@ struct tegra_vi {
  *		frame through host1x syncpoint counters (On Tegra20 used for the
  *              OUT_1 syncpt)
  * @sp_incr_lock: protects cpu syncpoint increment.
+ * @next_fs_sp_idx: next expected value for frame_start_sp[0] (Tegra20)
  * @next_out_sp_idx: next expected value for mw_ack_sp[0], i.e. OUT_1 (Tegra20)
  *
  * @kthread_start_capture: kthread to start capture of single frame when
@@ -191,6 +192,7 @@ struct tegra_vi_channel {
 	/* protects the cpu syncpoint increment */
 	spinlock_t sp_incr_lock[GANG_PORTS_MAX];
 	u32 next_out_sp_idx;
+	u32 next_fs_sp_idx;
 
 	struct task_struct *kthread_start_capture;
 	wait_queue_head_t start_wait;
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
index a25885f93cd7..8fa660431eb0 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -124,10 +124,12 @@ static int host1x_video_remove(struct host1x_device *dev)
 
 static const struct of_device_id host1x_video_subdevs[] = {
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+	{ .compatible = "nvidia,tegra20-csi", },
 	{ .compatible = "nvidia,tegra20-vip", },
 	{ .compatible = "nvidia,tegra20-vi", },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+	{ .compatible = "nvidia,tegra30-csi", },
 	{ .compatible = "nvidia,tegra30-vip", },
 	{ .compatible = "nvidia,tegra30-vi", },
 #endif
-- 
2.48.1

