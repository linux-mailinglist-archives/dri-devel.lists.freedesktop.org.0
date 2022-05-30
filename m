Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBE1538C10
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 09:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA4D10F441;
	Tue, 31 May 2022 07:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BA2112178
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 20:15:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t6so16034115wra.4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tSb7UJsPw6fMK+gU6mTIYkwhoB6cAnQoeEgSTcX6/b8=;
 b=ueLCtT8HrcGEyzdRDJmnkTKVUsCJvfppcoiRujOdqjJ6m+mcEENWGPW1E1dQV8M9Q9
 zA5C8YoLjTwZpAqaCXYpf75KEZLoxBV7kxjlL28SQBbWmWJrG8TnBXzL+Dk7FTuzNpF3
 Kn09zUv7N9xWjsLZQhUMXjxLZ2dGpq87apiiLcA/g7EsoCS/sYD7ajo1O1/1vqdUugqr
 9sO1ZPXTBwxSuv6CarfFQS8tFJ1G1m+0+RwDZdIIF0TRG+Kd8pEjXiqdKdza6zdtn4TG
 A5BXQY0WEPEjOre5d8ebOqo4QUISRsDGzzevA5fR9SXe5ai2Oo9w4RLguoDgyDujQ8cP
 Qhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tSb7UJsPw6fMK+gU6mTIYkwhoB6cAnQoeEgSTcX6/b8=;
 b=fr/VLMBr7m9LkDQ59MOkwGbz+uC3qnnXKB/2tW8Ht717peIaQAyGzuXDBK6N0ckGgD
 wz/LJwKvm08q5VOuIfo2PnCfpsBqPouXsmNJRu5dDogrpQaN3wkuIfxA4bPgX1H33TxT
 IABog/Kh+atSPHNj3+RDb7vERGY3U9qErYsCsGLMgszGanShaQ1aPZseMBaURFUNZ04F
 2sqrhPKEXzFC+OcEiKHZXrT/91pgRFNJs5/ViWlTvD+SWXEvxYQOyVz1B7b9r+69FPFn
 VUunR7HpGBNXzZTcnTb83XCcIN6VH8cGhI0ev3IP13SKM3dpOdZMl03hQmagyLUlg3KB
 +FmA==
X-Gm-Message-State: AOAM533E3SaMoBxnWVaCi8u3I5ZggvsxD1hmv3A2QjHmVaAH1d3hs06P
 8imElmqEVep/Xsv6mV53xjdamA==
X-Google-Smtp-Source: ABdhPJwiSzKSg4qkJcPG/0zZ8t9Q6QeHPF/daPy2MXTaCiYXpMfO/YtIWydybS5kvNowbkqSfI9riA==
X-Received: by 2002:a5d:648e:0:b0:210:18f6:f954 with SMTP id
 o14-20020a5d648e000000b0021018f6f954mr11230877wri.323.1653941703895; 
 Mon, 30 May 2022 13:15:03 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfe101000000b0020d110bc39esm9770401wrz.64.2022.05.30.13.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 13:15:03 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: [PATCH 4/7] soc: mediatek: mutex: add MT8365 support
Date: Mon, 30 May 2022 22:14:33 +0200
Message-Id: <20220530201436.902505-4-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530201436.902505-1-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 31 May 2022 07:41:20 +0000
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
Cc: chunkuang.hu@kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mutex support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 981d56967e7a..b8d5c4a62542 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -110,6 +110,20 @@
 #define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
 #define MT8195_MUTEX_MOD_DISP_PWM0		27
 
+#define MT8365_MUTEX_MOD_DISP_OVL0		7
+#define MT8365_MUTEX_MOD_DISP_OVL0_2L		8
+#define MT8365_MUTEX_MOD_DISP_RDMA0		9
+#define MT8365_MUTEX_MOD_DISP_RDMA1		10
+#define MT8365_MUTEX_MOD_DISP_WDMA0		11
+#define MT8365_MUTEX_MOD_DISP_COLOR0		12
+#define MT8365_MUTEX_MOD_DISP_CCORR		13
+#define MT8365_MUTEX_MOD_DISP_AAL		14
+#define MT8365_MUTEX_MOD_DISP_GAMMA		15
+#define MT8365_MUTEX_MOD_DISP_DITHER		16
+#define MT8365_MUTEX_MOD_DISP_DSI0		17
+#define MT8365_MUTEX_MOD_DISP_PWM0		20
+#define MT8365_MUTEX_MOD_DISP_DPI0		22
+
 #define MT2712_MUTEX_MOD_DISP_PWM2		10
 #define MT2712_MUTEX_MOD_DISP_OVL0		11
 #define MT2712_MUTEX_MOD_DISP_OVL1		12
@@ -315,6 +329,22 @@ static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
 };
 
+static const unsigned int mt8365_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+	[DDP_COMPONENT_AAL0] = MT8365_MUTEX_MOD_DISP_AAL,
+	[DDP_COMPONENT_CCORR] = MT8365_MUTEX_MOD_DISP_CCORR,
+	[DDP_COMPONENT_COLOR0] = MT8365_MUTEX_MOD_DISP_COLOR0,
+	[DDP_COMPONENT_DITHER] = MT8365_MUTEX_MOD_DISP_DITHER,
+	[DDP_COMPONENT_DPI0] = MT8365_MUTEX_MOD_DISP_DPI0,
+	[DDP_COMPONENT_DSI0] = MT8365_MUTEX_MOD_DISP_DSI0,
+	[DDP_COMPONENT_GAMMA] = MT8365_MUTEX_MOD_DISP_GAMMA,
+	[DDP_COMPONENT_OVL0] = MT8365_MUTEX_MOD_DISP_OVL0,
+	[DDP_COMPONENT_OVL_2L0] = MT8365_MUTEX_MOD_DISP_OVL0_2L,
+	[DDP_COMPONENT_PWM0] = MT8365_MUTEX_MOD_DISP_PWM0,
+	[DDP_COMPONENT_RDMA0] = MT8365_MUTEX_MOD_DISP_RDMA0,
+	[DDP_COMPONENT_RDMA1] = MT8365_MUTEX_MOD_DISP_RDMA1,
+	[DDP_COMPONENT_WDMA0] = MT8365_MUTEX_MOD_DISP_WDMA0,
+};
+
 static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
@@ -423,6 +453,14 @@ static const struct mtk_mutex_data mt8195_mutex_driver_data = {
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 };
 
+static const struct mtk_mutex_data mt8365_mutex_driver_data = {
+	.mutex_mod = mt8365_mutex_mod,
+	.mutex_sof = mt8183_mutex_sof,
+	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
+	.no_clk = true,
+};
+
 struct mtk_mutex *mtk_mutex_get(struct device *dev)
 {
 	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
@@ -665,6 +703,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	  .data = &mt8192_mutex_driver_data},
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = &mt8195_mutex_driver_data},
+	{ .compatible = "mediatek,mt8365-disp-mutex",
+	  .data = &mt8365_mutex_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
-- 
2.36.1

