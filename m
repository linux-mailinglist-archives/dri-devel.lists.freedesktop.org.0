Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A198717AD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 09:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F25112913;
	Tue,  5 Mar 2024 08:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GFeDG5cA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B571D112910
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 08:12:18 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-565b434f90aso7694618a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 00:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709626337; x=1710231137; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=licg3hUE5I9iVSUhaQvUY/ICMniTjfaDb2iJSuUjn84=;
 b=GFeDG5cAjJ7o/dotJyjp1WCJ4rIlOblIi2wm0nU16mZO4s6cHEbpjAMj+ebCh9oNwd
 fgcd2S3d/ciMqDBFgnB4YNm3k+qoSOb3vMnA12E0KtdcL+9OngeafRnswkrh+S5rwlyD
 t7+oonCbjVQPrwnKPanBG+QwzAp22xwIp4o/re4iLHX2oWuFyDeVlbfYEAFM4vAxMCwF
 r5EFNK+N5My8kXwtRlRcejJKW1+c+6X5a2hQjhrpu7RFsOfbb1cPeNzaK+fIBmx2Uy7D
 e9flgFXFnMvw6GNn6NXSUxHlcH1KBhLMnsxDmHfu1CZTpRwjK4A8Ne762pD8uv95qgP8
 GzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709626337; x=1710231137;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=licg3hUE5I9iVSUhaQvUY/ICMniTjfaDb2iJSuUjn84=;
 b=GZdJuY3+fBoRO8mKOeMbWiK1YazhSi8oxTkXipxJEGxsY7PlxLbTWnki0cRbT6VCc6
 yDd085f+ap64Kon9l1Z+FGJdknJdnE55i+44DDQsQ7u7g/MqWzn0IxHnD9hjpJbEprT6
 KyQsZOmvze8U/L9MjPu2ozI6cc2qg6wsap5yzShDMIb9juvIy7G1t0zb0tUGGCdXOf48
 Zs2Dl6GEyBqH0F4o0DFya2Yvt/fgjI+D9kx+AYoWghTB2TE5T0hM6xiEPCQKwaDpnjRp
 CneRiOTrsSBvNIrSHcBRQcrIbCpWp0Vhhowr4RL1LA8SXllPV97hB8WhehpKu0M9nrRN
 dEQw==
X-Gm-Message-State: AOJu0Yx/hlNfmvakH0i6vLsNbiCK7+zKRYNrU5SvjWKPmdtlcl16wW0D
 e4dD56bxvcZ+0B0OW7NQOumFgGLX/2+0lgUEQgbj1O4kWMU4IDUe3m+iaTihhTg=
X-Google-Smtp-Source: AGHT+IGfm7sGGkR9kUh8su5+o2QBu2BkEz27QYtpHoYuWXB8OY86QmE12Had2uOqdDw7VGaIixtjVw==
X-Received: by 2002:a50:fa83:0:b0:566:51fa:3647 with SMTP id
 w3-20020a50fa83000000b0056651fa3647mr6968122edr.10.1709626336755; 
 Tue, 05 Mar 2024 00:12:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056402221000b005672a346a8fsm2761557edb.57.2024.03.05.00.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 00:12:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 05 Mar 2024 09:11:57 +0100
Subject: [PATCH v2 2/7] backlight: l4f00242t03: Simplify with dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-backlight-probe-v2-2-609b0cf24bde@linaro.org>
References: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
In-Reply-To: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2489;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=V74J1dzwFo5ezSQUueHMb1/NFOrfZ3e7TgmXv0EuHDM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5tPXy6RPQ//PsVb4IYTUFFLKfQGgTqhNZjAe5
 k8y1iiltayJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZebT1wAKCRDBN2bmhouD
 1wKfEACbULmem8OvAeK+RHjlMayIwaUJM+uAeRNpZGPV6L4vyj8fGOfNFabiu5jtYwEOD8P1n5k
 sjmhuOectJ71wUf1KLkpU9jYUFDRIpF3IWplDn352HLVqkZevuejVUTS0D7zb2MHcs4HWf8ecI+
 PRDIH87OTbGXXS6/CswU1Bnr83esrM05RJ94hfM5vkoom10EeTaCuD/GbCm0Qddi6VxMKnQF05U
 5aUspkmJRq3JTIbZqpLsqcGJ4gZOBk10m+KXHEw66rRsimBz9hpnzyf3DC7dzmAxMZF9VUKY1xS
 fG25pvaOChS3UhIT3RjRcLUBElvel8TWrUIDXFIesd4bvewciUkRXPxlZm7iwzJv7rApgw93sNi
 fJPm2n0H5nbA+SXXlDfMgP3/QcVtfqkY6mtVyY/yU/j97vmq1tzodZVZZu0zDt9DWSfRXug6DZI
 OGULgir2GA6xgNGtufI4T115U3XlFPYpuzrLL9UawHvNJXlDcogHTMpjOZjvJHxHRa/9DdiVie2
 goA++dpv0wqlnpInjDBFjh8MPlEqceV/nA/SkU4QAFi73i0HOQrDVdlUCrM+5cqHu/L+aeqCzX5
 5ibcScLzNg7LET3QCv/K78ESsxWMz5U8T9vxWV8VAOaA8ILZkwLdjspJP344Bi4UQcBxiO//n1j
 GY2+W8LLtWpqZxw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/video/backlight/l4f00242t03.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/video/backlight/l4f00242t03.c b/drivers/video/backlight/l4f00242t03.c
index cc763cf15f53..bd5137ee203b 100644
--- a/drivers/video/backlight/l4f00242t03.c
+++ b/drivers/video/backlight/l4f00242t03.c
@@ -179,34 +179,28 @@ static int l4f00242t03_probe(struct spi_device *spi)
 	priv->spi = spi;
 
 	priv->reset = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(priv->reset)) {
-		dev_err(&spi->dev,
-			"Unable to get the lcd l4f00242t03 reset gpio.\n");
-		return PTR_ERR(priv->reset);
-	}
+	if (IS_ERR(priv->reset))
+		return dev_err_probe(&spi->dev, PTR_ERR(priv->reset),
+				     "Unable to get the lcd l4f00242t03 reset gpio.\n");
 	gpiod_set_consumer_name(priv->reset, "lcd l4f00242t03 reset");
 
 	priv->enable = devm_gpiod_get(&spi->dev, "enable", GPIOD_OUT_LOW);
-	if (IS_ERR(priv->enable)) {
-		dev_err(&spi->dev,
-			"Unable to get the lcd l4f00242t03 data en gpio.\n");
-		return PTR_ERR(priv->enable);
-	}
+	if (IS_ERR(priv->enable))
+		return dev_err_probe(&spi->dev, PTR_ERR(priv->enable),
+				     "Unable to get the lcd l4f00242t03 data en gpio.\n");
 	gpiod_set_consumer_name(priv->enable, "lcd l4f00242t03 data enable");
 
 	priv->io_reg = devm_regulator_get(&spi->dev, "vdd");
-	if (IS_ERR(priv->io_reg)) {
-		dev_err(&spi->dev, "%s: Unable to get the IO regulator\n",
-		       __func__);
-		return PTR_ERR(priv->io_reg);
-	}
+	if (IS_ERR(priv->io_reg))
+		return dev_err_probe(&spi->dev, PTR_ERR(priv->io_reg),
+				     "%s: Unable to get the IO regulator\n",
+				     __func__);
 
 	priv->core_reg = devm_regulator_get(&spi->dev, "vcore");
-	if (IS_ERR(priv->core_reg)) {
-		dev_err(&spi->dev, "%s: Unable to get the core regulator\n",
-		       __func__);
-		return PTR_ERR(priv->core_reg);
-	}
+	if (IS_ERR(priv->core_reg))
+		return dev_err_probe(&spi->dev, PTR_ERR(priv->core_reg),
+				     "%s: Unable to get the core regulator\n",
+				     __func__);
 
 	priv->ld = devm_lcd_device_register(&spi->dev, "l4f00242t03", &spi->dev,
 					priv, &l4f_ops);

-- 
2.34.1

