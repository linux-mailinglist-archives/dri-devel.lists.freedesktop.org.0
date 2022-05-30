Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F77538C11
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 09:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E960610F472;
	Tue, 31 May 2022 07:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3886C112180
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 20:15:06 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id p10so15994002wrg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dM1Miawze8sKsOoDP6eNmyD3lGqsAxM4OZW/CsiBCqQ=;
 b=DV2NtNINZimMJqxbhbxmkjmSZbFIXt24MmqWcuL8/ZvoThgLXtp65oYm46Qeakffzp
 8YiwMlunn2bwit89barcdfiiBdM1VgK6D127PSqRqZPGniRfU8r4b2fPz4sDdo5G9y77
 Kl3OQVuwTNBNkTr5qh/edlV6c4xN3cHk3LXZAqoB6py0WCQHzq5ovmoWOWF31g7x2Ntx
 r2DOWTOIsoO7MxsUbK5Bpu2HFOYlbuAdMIx7iyTj/RHJpvNIEwW+E6NxPl/2nCVgsBQC
 2OjX2o7X8EMlkC0ZIOh+kdfCyv+s2p1+KbPalUDTcj0g2XgHloTLysG/DR4T1qKo37IF
 REog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dM1Miawze8sKsOoDP6eNmyD3lGqsAxM4OZW/CsiBCqQ=;
 b=zVMSThYmhtEeU9fjSkqFBOmyVFkLEUCMOE2MhMlTz3YZOFEO0QTMuvIsE+uiHfBsx9
 L1NP0IjGIj2LvJ6iQyW9ss7TyUQ09nd1UsNxKnpaOpD/1/kQuQ050sZRUgMc3TOunWVM
 Sc10mnOkdJKBPzyk9aEJpXnXFk+IWcD0OGxJMbptQNzJpjQP+o0XGnaUpBcjqHFN1XUV
 9TO8d/qiapqaTUb8PN5iDhLVK+qUYVQmxFfqc3kYTWfkH6zeaW/+45hWcbxyJbbPLCab
 2dUTTxhl45Qj2GvFikjtSrtCVCv5Rg5rKlzAQPz1aV7Y1PlNUMOovcN3Nes2DpxlBy09
 mj5A==
X-Gm-Message-State: AOAM531VlpD/Bz/Qf0PkESpv/5Zl2FzMy5CU65RDD6vGAlNkdynIICmJ
 i0S4GUaqf11+yJLsIdkcEABYYg==
X-Google-Smtp-Source: ABdhPJwSSjliAbJddGUfeFIGpLGf9IXHfVrDvhvqnHzFPZT6n2sJsLeNwQeWBnxlnJ7JxvHZVTrllw==
X-Received: by 2002:a5d:6051:0:b0:20d:d49:26b8 with SMTP id
 j17-20020a5d6051000000b0020d0d4926b8mr45843588wrt.454.1653941705665; 
 Mon, 30 May 2022 13:15:05 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfe101000000b0020d110bc39esm9770401wrz.64.2022.05.30.13.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 13:15:04 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: [PATCH 5/7] soc: mediatek: mt8365-mmsys: add DPI/HDMI display path
Date: Mon, 30 May 2022 22:14:34 +0200
Message-Id: <20220530201436.902505-5-fparent@baylibre.com>
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

Right now only the DSI path connections are described in the mt8365
mmsys driver. The external path will be DPI/HDMI. This commit adds
the connections for DPI/HDMI.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/soc/mediatek/mt8365-mmsys.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/soc/mediatek/mt8365-mmsys.h b/drivers/soc/mediatek/mt8365-mmsys.h
index 24129a6c25f8..7abaf048d91e 100644
--- a/drivers/soc/mediatek/mt8365-mmsys.h
+++ b/drivers/soc/mediatek/mt8365-mmsys.h
@@ -10,6 +10,9 @@
 #define MT8365_DISP_REG_CONFIG_DISP_RDMA0_RSZ0_SEL_IN	0xf60
 #define MT8365_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0xf64
 #define MT8365_DISP_REG_CONFIG_DISP_DSI0_SEL_IN		0xf68
+#define MT8365_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL	0xfd0
+#define MT8365_DISP_REG_CONFIG_DISP_DPI0_SEL_IN		0xfd8
+#define MT8365_DISP_REG_CONFIG_DISP_LVDS_SYS_CFG_00	0xfdc
 
 #define MT8365_RDMA0_SOUT_COLOR0			0x1
 #define MT8365_DITHER_MOUT_EN_DSI0			0x1
@@ -18,6 +21,10 @@
 #define MT8365_RDMA0_RSZ0_SEL_IN_RDMA0			0x0
 #define MT8365_DISP_COLOR_SEL_IN_COLOR0			0x0
 #define MT8365_OVL0_MOUT_PATH0_SEL			BIT(0)
+#define MT8365_RDMA1_SOUT_DPI0				0x1
+#define MT8365_DPI0_SEL_IN_RDMA1			0x0
+#define MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK		0x1
+#define MT8365_DPI0_SEL_IN_RDMA1			0x0
 
 static const struct mtk_mmsys_routes mt8365_mmsys_routing_table[] = {
 	{
@@ -55,6 +62,21 @@ static const struct mtk_mmsys_routes mt8365_mmsys_routing_table[] = {
 		MT8365_DISP_REG_CONFIG_DISP_RDMA0_RSZ0_SEL_IN,
 		MT8365_RDMA0_RSZ0_SEL_IN_RDMA0, MT8365_RDMA0_RSZ0_SEL_IN_RDMA0
 	},
+	{
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		MT8365_DISP_REG_CONFIG_DISP_LVDS_SYS_CFG_00,
+		MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK, MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK
+	},
+	{
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		MT8365_DISP_REG_CONFIG_DISP_DPI0_SEL_IN,
+		MT8365_DPI0_SEL_IN_RDMA1, MT8365_DPI0_SEL_IN_RDMA1
+	},
+	{
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		MT8365_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL,
+		MT8365_RDMA1_SOUT_DPI0, MT8365_RDMA1_SOUT_DPI0
+	},
 };
 
 #endif /* __SOC_MEDIATEK_MT8365_MMSYS_H */
-- 
2.36.1

