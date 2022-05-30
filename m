Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2F3538C17
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 09:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4262D10F483;
	Tue, 31 May 2022 07:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0A811217D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 20:15:08 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u3so16004261wrg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PD07AGQSISBrBm8fI0Y+y6jJGPbS9zphsEozNpxvp5c=;
 b=MIjCVNm9g03WUwxU5l29QvEepUh5wgB7oQF4k3VLWcYaS9VXU+YwiZFLHJ3xuT1eSW
 nfeoWSQ3Cx/AgyV8zGDKSNUGXjId6MJxju4d+uaToMm2lBCqtTOldeSKsdYeocKgPt6D
 dZVvQ6Mxp5sMfcruCnIxWupF/gPGMBjsDRzn+lCvvIw+tg8dBT2+NAXfkzpUjRX5sUUC
 E257NMxeK8YUQWugfDhCqwmO8DVnL/8cDLQ5sC+LTETOKTR4CIsFg/KT7pRcoFc2YrS2
 VMvs2eDy8Ql5unLyZ1AdVLM32fevHoEod0supyC5nJJeKF7FJokoujZTL4357QG7MrNL
 IKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PD07AGQSISBrBm8fI0Y+y6jJGPbS9zphsEozNpxvp5c=;
 b=CQbFtjcEscnyLOW8UUtD5zGP6osRfh5CDREcy1NwcnW0EZAGf9a1vPeWNhgsInlmcm
 g0SyOiqKhqwjchP4kDA9uBrCbVPBMyS99/LNDeUHwteEOwaQV8uME5QySoAn9CZ62bFe
 s5NnME1OFv/0LsTo1d3AnV41K7sBKZAgk+rg07HhXYzTLenzBX4aD9Dt9+UnikT+ftlP
 VCEXuGvg9gmEQG6NPSrOxX3YP1oTE+moGafjL3vtp91dEmcpP82l8Xtpk6WxV0og30AN
 EDDJYsDDbVSpYAjxwdyxFXF5Im+VcXZaClrt7sJUtX27haB7hH0QinKIsi5UoNi4R/gg
 f44Q==
X-Gm-Message-State: AOAM532EtLuF3NADjsUsgP9wr9Aq2oCVlAYTwm/CdqAzes8b/YkQmnJF
 lrTlfxXW4wz7n1fxt7eVQBlHYg==
X-Google-Smtp-Source: ABdhPJzABVtC2tkCZEtAl4IfibZ4A1woYgNYxWWP2/bB92DTuTd5TnPRpW2iy1sQkdfWlmVR0yHj5Q==
X-Received: by 2002:a05:6000:15c7:b0:210:472:e0e8 with SMTP id
 y7-20020a05600015c700b002100472e0e8mr20637968wry.365.1653941706961; 
 Mon, 30 May 2022 13:15:06 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfe101000000b0020d110bc39esm9770401wrz.64.2022.05.30.13.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 13:15:06 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: [PATCH 6/7] drm/mediatek: dpi: add support for dpi clock
Date: Mon, 30 May 2022 22:14:35 +0200
Message-Id: <20220530201436.902505-6-fparent@baylibre.com>
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

MT8365 requires an additional clock for DPI. Add support for that
additional clock.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index e61cd67b978f..7872db60840e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -72,6 +72,7 @@ struct mtk_dpi {
 	struct device *dev;
 	struct clk *engine_clk;
 	struct clk *pixel_clk;
+	struct clk *dpi_clk;
 	struct clk *tvd_clk;
 	int irq;
 	struct drm_display_mode mode;
@@ -412,6 +413,7 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 	mtk_dpi_disable(dpi);
 	clk_disable_unprepare(dpi->pixel_clk);
 	clk_disable_unprepare(dpi->engine_clk);
+	clk_disable_unprepare(dpi->dpi_clk);
 }
 
 static int mtk_dpi_power_on(struct mtk_dpi *dpi)
@@ -421,10 +423,16 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 	if (++dpi->refcount != 1)
 		return 0;
 
+	ret = clk_prepare_enable(dpi->dpi_clk);
+	if (ret) {
+		dev_err(dpi->dev, "failed to enable dpi clock: %d\n", ret);
+		goto err_refcount;
+	}
+
 	ret = clk_prepare_enable(dpi->engine_clk);
 	if (ret) {
 		dev_err(dpi->dev, "Failed to enable engine clock: %d\n", ret);
-		goto err_refcount;
+		goto err_engine;
 	}
 
 	ret = clk_prepare_enable(dpi->pixel_clk);
@@ -441,6 +449,8 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 
 err_pixel:
 	clk_disable_unprepare(dpi->engine_clk);
+err_engine:
+	clk_disable_unprepare(dpi->dpi_clk);
 err_refcount:
 	dpi->refcount--;
 	return ret;
@@ -893,6 +903,12 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dpi->dpi_clk = devm_clk_get_optional(dev, "dpi");
+	if (IS_ERR(dpi->dpi_clk)) {
+		return dev_err_probe(dev, ret, "Failed to get dpi clock: %pe\n",
+				     dpi->dpi_clk);
+	}
+
 	dpi->irq = platform_get_irq(pdev, 0);
 	if (dpi->irq <= 0)
 		return -EINVAL;
-- 
2.36.1

