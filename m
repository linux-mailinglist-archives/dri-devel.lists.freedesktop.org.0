Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1F23086E5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 09:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E476EAA3;
	Fri, 29 Jan 2021 08:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84716EA83
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 07:34:59 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id 31so4772099plb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 23:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wOi9QsUAhsr7iOKdmI6bYDRMDfnhlrXkKfvmwGZhqRA=;
 b=n4D3JO3S4t+WNZhakl78F73RWjyDMwdEy/o0eff7r6tmikHuAY8jB2o7PNYk0pIa+U
 igZ3FfSZS9zaKLN+1modzbwPA5JIKMNmvenXlDXWFG+i0WlBMOAWCvu/2FBfHC2gOZ4P
 u+OuWB43Jx2ExgFppSEkyiyjffZ6pNhswX6c0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wOi9QsUAhsr7iOKdmI6bYDRMDfnhlrXkKfvmwGZhqRA=;
 b=EB3ApOI+9cIaSuTCbG5EutxZeWkghSgaty60bZr8ANWLWpdXUi9EGBvK+Wgf5GqCYh
 GFosbon89qyDCuuEjpiQAM8f0/2W5rO+38uiaOJdcet6bo7OSK1wgiBnJ+vZi3eNAG9H
 YtNjLyL+m1MpsYV3bB8102NNRsX0fCTzXkhNOV5FCJ8ppccZTA+rtde2JM7PBxi/X57U
 e9q9kyOXSinEUHwSKgYjhxxqbnR9G31s9ZBTdoVAxILpmgm59BQVW2g4Hwz7AchxSXiv
 L+YlEKyyqjMNjBcrZVDBexlCHy0UkjZcon2C0jUo1Gv3mzZMaw0jApVI38HNjCcdsS0W
 KcWg==
X-Gm-Message-State: AOAM533QjLAyuVVZ3zeEDFoJ689AkODW5WdgxPLsyF9OImXs/X097fNG
 wFprpSj4xpRCo0YDc19BEW2JGw==
X-Google-Smtp-Source: ABdhPJxmU9dAxfGiTXL/EdpLxp7QGbO8AUpQNCyHvk5wtMxMoTRXSCrw3w5gbFEosSVXIJ27rb90yQ==
X-Received: by 2002:a17:90b:313:: with SMTP id
 ay19mr3214196pjb.184.1611905699259; 
 Thu, 28 Jan 2021 23:34:59 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p1sm7689980pfn.21.2021.01.28.23.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 23:34:58 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 7/8] soc: mediatek: add mtk mutex support for MT8192
Date: Fri, 29 Jan 2021 15:34:35 +0800
Message-Id: <20210129073436.2429834-8-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129073436.2429834-1-hsinyi@chromium.org>
References: <20210129073436.2429834-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 29 Jan 2021 08:11:32 +0000
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
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

Add mtk mutex support for MT8192 SoC.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/soc/mediatek/mtk-mutex.c | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 718a41beb6afb..dfd9806d5a001 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -39,6 +39,18 @@
 #define MT8167_MUTEX_MOD_DISP_DITHER		15
 #define MT8167_MUTEX_MOD_DISP_UFOE		16
 
+#define MT8192_MUTEX_MOD_DISP_OVL0		0
+#define MT8192_MUTEX_MOD_DISP_OVL0_2L		1
+#define MT8192_MUTEX_MOD_DISP_RDMA0		2
+#define MT8192_MUTEX_MOD_DISP_COLOR0		4
+#define MT8192_MUTEX_MOD_DISP_CCORR0		5
+#define MT8192_MUTEX_MOD_DISP_AAL0		6
+#define MT8192_MUTEX_MOD_DISP_GAMMA0		7
+#define MT8192_MUTEX_MOD_DISP_POSTMASK0		8
+#define MT8192_MUTEX_MOD_DISP_DITHER0		9
+#define MT8192_MUTEX_MOD_DISP_OVL2_2L		16
+#define MT8192_MUTEX_MOD_DISP_RDMA4		17
+
 #define MT8183_MUTEX_MOD_DISP_RDMA0		0
 #define MT8183_MUTEX_MOD_DISP_RDMA1		1
 #define MT8183_MUTEX_MOD_DISP_OVL0		9
@@ -214,6 +226,20 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
 };
 
+static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
+	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
+	[DDP_COMPONENT_COLOR0] = MT8192_MUTEX_MOD_DISP_COLOR0,
+	[DDP_COMPONENT_DITHER] = MT8192_MUTEX_MOD_DISP_DITHER0,
+	[DDP_COMPONENT_GAMMA] = MT8192_MUTEX_MOD_DISP_GAMMA0,
+	[DDP_COMPONENT_POSTMASK0] = MT8192_MUTEX_MOD_DISP_POSTMASK0,
+	[DDP_COMPONENT_OVL0] = MT8192_MUTEX_MOD_DISP_OVL0,
+	[DDP_COMPONENT_OVL_2L0] = MT8192_MUTEX_MOD_DISP_OVL0_2L,
+	[DDP_COMPONENT_OVL_2L2] = MT8192_MUTEX_MOD_DISP_OVL2_2L,
+	[DDP_COMPONENT_RDMA0] = MT8192_MUTEX_MOD_DISP_RDMA0,
+	[DDP_COMPONENT_RDMA4] = MT8192_MUTEX_MOD_DISP_RDMA4,
+};
+
 static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
@@ -275,6 +301,13 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
 	.no_clk = true,
 };
 
+static const struct mtk_mutex_data mt8192_mutex_driver_data = {
+	.mutex_mod = mt8192_mutex_mod,
+	.mutex_sof = mt8183_mutex_sof,
+	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
+};
+
 struct mtk_mutex *mtk_mutex_get(struct device *dev)
 {
 	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
@@ -507,6 +540,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	  .data = &mt8173_mutex_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-mutex",
 	  .data = &mt8183_mutex_driver_data},
+	{ .compatible = "mediatek,mt8192-disp-mutex",
+	  .data = &mt8192_mutex_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
