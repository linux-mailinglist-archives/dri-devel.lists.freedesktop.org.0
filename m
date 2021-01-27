Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D09A3055A2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3689E6E5A5;
	Wed, 27 Jan 2021 08:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD9A6E51C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 04:54:56 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id 31so357042plb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 20:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N0grnaWPs5cVv17NsMPUYKcEnHrsKHmRnjkooea8sm8=;
 b=nv48sbxjX1LwiPsUQEgr3LETqtdAdfzQYiWv5UObt5MNPaVS5wRJjOW4pcEUeR0q0H
 F/rwrB9KGv1YYgDiYdrL6TRWV6f9KLOBS/Hy69O3zs3OifDhlMAt/ZBNv6JQwsA376Vu
 UQfrKC9qIm5Hj6vfVVdYDDCMC9cuGcSAmSEhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N0grnaWPs5cVv17NsMPUYKcEnHrsKHmRnjkooea8sm8=;
 b=ACmPzXMxm9M+zEcVULZoAPBH/1RGzDFrMgyU9gljBjldRt13Bzny/Cd+kNxNoXN27a
 d8IaSKdU+HveedJPvNn4sOeki8Rs57S8OtRYGI+1tfGjwHSyt11Wu87z8YvhEMp553/i
 T/WJBW8J5KHxLuif7hrBr32DnuC+0ftDJCuOKjLJFZSxZuDzzhzEWZKv9yOtZpBBkTmL
 7ZfLb2Tv6lLw1TnesdH88UsejYLNLYAI8w7KV5GxaboBItKiroNe/kAyXNGqo7xqqaOk
 B0R2zulNX/3c4hHrTSpt4ptt+mTmcjc/NR4i9piyKMER3iWwtMkhpZw144VPgWYVtTxA
 kDGQ==
X-Gm-Message-State: AOAM532gEWVopAzOTd6gORrKfp98V0buB7b3NVAu8BgxbN0iqFlth2CW
 +Pi/AfECBrd/67ikR7Zp3OaOXg==
X-Google-Smtp-Source: ABdhPJyh2ojiE8VejJajMQW0Iz93YL8D58j2tODSh2vfleJfz60lTScANSpXostgddONvJ4IQKHHUA==
X-Received: by 2002:a17:90a:c705:: with SMTP id
 o5mr3627972pjt.64.1611723296465; 
 Tue, 26 Jan 2021 20:54:56 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id a141sm684484pfa.189.2021.01.26.20.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 20:54:55 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v10 8/9] drm/mediatek: add DDP support for MT8183
Date: Wed, 27 Jan 2021 12:54:21 +0800
Message-Id: <20210127045422.2418917-9-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210127045422.2418917-1-hsinyi@chromium.org>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 Jan 2021 08:29:46 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

Add DDP support for MT8183 SoC.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/soc/mediatek/mtk-mutex.c | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index f531b119da7a9..f64e9c33e85ad 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -14,6 +14,8 @@
 
 #define MT2701_MUTEX0_MOD0			0x2c
 #define MT2701_MUTEX0_SOF0			0x30
+#define MT8183_DISP_MUTEX0_MOD0			0x30
+#define MT8183_DISP_MUTEX0_SOF0			0x2c
 
 #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
 #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
@@ -37,6 +39,18 @@
 #define MT8167_MUTEX_MOD_DISP_DITHER		15
 #define MT8167_MUTEX_MOD_DISP_UFOE		16
 
+#define MT8183_MUTEX_MOD_DISP_RDMA0		0
+#define MT8183_MUTEX_MOD_DISP_RDMA1		1
+#define MT8183_MUTEX_MOD_DISP_OVL0		9
+#define MT8183_MUTEX_MOD_DISP_OVL0_2L		10
+#define MT8183_MUTEX_MOD_DISP_OVL1_2L		11
+#define MT8183_MUTEX_MOD_DISP_WDMA0		12
+#define MT8183_MUTEX_MOD_DISP_COLOR0		13
+#define MT8183_MUTEX_MOD_DISP_CCORR0		14
+#define MT8183_MUTEX_MOD_DISP_AAL0		15
+#define MT8183_MUTEX_MOD_DISP_GAMMA0		16
+#define MT8183_MUTEX_MOD_DISP_DITHER0		17
+
 #define MT8173_MUTEX_MOD_DISP_OVL0		11
 #define MT8173_MUTEX_MOD_DISP_OVL1		12
 #define MT8173_MUTEX_MOD_DISP_RDMA0		13
@@ -87,6 +101,12 @@
 #define MT2712_MUTEX_SOF_DSI3			6
 #define MT8167_MUTEX_SOF_DPI0			2
 #define MT8167_MUTEX_SOF_DPI1			3
+#define MT8183_MUTEX_SOF_DSI0			1
+#define MT8183_MUTEX_SOF_DPI0			2
+
+/* Add EOF setting so overlay hardware can receive frame done irq */
+#define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
+#define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
 
 struct mtk_mutex {
 	int id;
@@ -181,6 +201,20 @@ static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
 };
 
+static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+	[DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
+	[DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
+	[DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
+	[DDP_COMPONENT_DITHER] = MT8183_MUTEX_MOD_DISP_DITHER0,
+	[DDP_COMPONENT_GAMMA] = MT8183_MUTEX_MOD_DISP_GAMMA0,
+	[DDP_COMPONENT_OVL0] = MT8183_MUTEX_MOD_DISP_OVL0,
+	[DDP_COMPONENT_OVL_2L0] = MT8183_MUTEX_MOD_DISP_OVL0_2L,
+	[DDP_COMPONENT_OVL_2L1] = MT8183_MUTEX_MOD_DISP_OVL1_2L,
+	[DDP_COMPONENT_RDMA0] = MT8183_MUTEX_MOD_DISP_RDMA0,
+	[DDP_COMPONENT_RDMA1] = MT8183_MUTEX_MOD_DISP_RDMA1,
+	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
+};
+
 static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
@@ -198,6 +232,12 @@ static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
 	[MUTEX_SOF_DPI1] = MT8167_MUTEX_SOF_DPI1,
 };
 
+static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
+	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
+	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
+	[MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
+};
+
 static const struct mtk_mutex_data mt2701_mutex_driver_data = {
 	.mutex_mod = mt2701_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
@@ -227,6 +267,14 @@ static const struct mtk_mutex_data mt8173_mutex_driver_data = {
 	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
 };
 
+static const struct mtk_mutex_data mt8183_mutex_driver_data = {
+	.mutex_mod = mt8183_mutex_mod,
+	.mutex_sof = mt8183_mutex_sof,
+	.mutex_mod_reg = MT8183_DISP_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8183_DISP_MUTEX0_SOF0,
+	.no_clk = true,
+};
+
 struct mtk_mutex *mtk_mutex_get(struct device *dev)
 {
 	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
@@ -457,6 +505,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	  .data = &mt8167_mutex_driver_data},
 	{ .compatible = "mediatek,mt8173-disp-mutex",
 	  .data = &mt8173_mutex_driver_data},
+	{ .compatible = "mediatek,mt8183-disp-mutex",
+	  .data = &mt8183_mutex_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
-- 
2.30.0.280.ga3ce27912f-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
