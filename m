Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBDF86FE7B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E1210FF30;
	Mon,  4 Mar 2024 10:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LDE7vJkM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFB010FF32
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:11:57 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a26fa294e56so735215766b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709547115; x=1710151915; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=N1FwEFy+Dl2uRsNArjy2my0aFqui23Xcgx08mwBp3cc=;
 b=LDE7vJkMF3woV4UZxSJXKCNURmpxB/cdrtg42rmrGgzajFm77S2s9Gr84RbcCv/A97
 ZqWKWfSpEd8wjp6UWB1lV5Pa9lVNdJWU2yJhPdAEc4692UUEj9DrsqjjemhRLupITV+t
 H/QfnymtqJjxBG/QqmKXk0ruDg8vVP85T6g1U6jt8tdF0x5Rb1wFQfpaogxeJTlbgrQu
 o0qUepxHYsQm09N8CS38IKGmjtl+mKTJZUDRlKVG5YBuvO/i9f62bz0zXgw+vh+pXY7o
 3321QKrixkSSZsxHgvhd8mqdvuO9j7Vj6PGXAcCJVVFgSwR/bzo/0EQOO8xoLF0tIKgy
 a0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709547115; x=1710151915;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N1FwEFy+Dl2uRsNArjy2my0aFqui23Xcgx08mwBp3cc=;
 b=oAlzni9mPSntcSK/dH9n8ZE8SBx+0M6m9QeDQbaQ9EmcbB0A97zbLKAyynvNuDzpNP
 zlHbtymN2M2kw9OA5jNGo8JoCEER2P97u44BPvcdJ3TgtpllT9lrXNE9ULWERf9WR0tw
 Gi9ESel+PyNf1aj1MDcALJgGHPj6/4zAn5vpghz/ZocF75Su5HgtmOQ0qIzpMZvU5JKi
 Pvz8nXuIcEP/Sw52C+9Ow/OdMMEHjqnWApZbHnJ9GmRVEzj5S8dWu72NNxWY4ZzFg4bq
 pm4pOjJFKAN+/yJGK3qiClwkHrd+94i0QBun18jBcBrBIO+Z5KWcCA0VWnXaz5p+laLB
 6Ssg==
X-Gm-Message-State: AOJu0Yx01vpxnT5gAiokZbPiAHzlW1sjm+PQsIWwJXWa1BFmYX7fF6AL
 lRYyYgdRxYjFB5GzSQpiM456vn+uu8M0FWlCkcdshvZY+FjMzSk4ManYLCOMquU=
X-Google-Smtp-Source: AGHT+IH5cQu1xy1LVdK9PUSdHoyXXpoj3l3x8HX5st0puZSlq08NTx/d1VXHsfxHoA9L7M5NJzXQBg==
X-Received: by 2002:a17:906:f0d0:b0:a44:6b6b:bae3 with SMTP id
 dk16-20020a170906f0d000b00a446b6bbae3mr6905807ejb.59.1709547115593; 
 Mon, 04 Mar 2024 02:11:55 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97]) by smtp.gmail.com with ESMTPSA id
 ef11-20020a17090697cb00b00a44bc99cd89sm2938481ejb.42.2024.03.04.02.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 02:11:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 04 Mar 2024 11:11:39 +0100
Subject: [PATCH 2/7] backlight: l4f00242t03: Simplify with dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-backlight-probe-v1-2-e5f57d0df6e6@linaro.org>
References: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
In-Reply-To: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NY6ffh05b3e06y7LUri3yhspGUFjPVtoTn9TDh5HN+Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5Z5iGhsKCRV6SnmJLcxk3l63l/2wXkWX0mqPw
 FqUYp3+MCCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZeWeYgAKCRDBN2bmhouD
 1384D/94qBZqd0L96f/YTCIfX+UGorHT6vsSGWZKBQDglVcQtd+W2q9z5FyqxQRpgTRGNrrJaJr
 4XwBT0yhzuONJj8YysOc6z01URhYjs+1rTh0qxQ+1RO8iepYCX2CIcmi5mDsnwLLmcarlNY+Bzs
 P4DnCKWECInNTkU8k5gOHSfMEwr1ZI1pF8F927yg/9LQ6cpdwhkQhj89oCzr4riJg6w32dyIMZw
 IdJzS9rHxaGQNPW22klHxPxlE5L3gz3/xpkA3wlGUrD9EtRIoyzdbKUJDuSmIlcED8A0C/ZRXpF
 gjKj29XREHEOEdWkN4TQER0kkfBpvx+FjPWrfSm+bOs48jgR4JQiB2UMZprxaUUhk8zikuRByC5
 u4lL0xzLBoqLmRqQIlybVuN8VESMlgeaw4ipEn0M7QVbvZi09KPsmeXi1RtyfgUF5nmPYDePky+
 L3vXzDlQduxOf5bn9F9oRxVOsmGCiHppov0WVudC857+DAkprPcZmFOeoSnnfmkVWJNF3VMWLAX
 cAeWwpIIonnOJyiRXcOQlAIcsbfa1qZ/0SRkdg+abAPfGLwQ/crRlY2TKxXUBLCuUAkTNyB8mvX
 0AdT2K9K8Rzu13mZQdmZ9w+xQ1EFIvkyxf/kgNnILFMpr+BC9TYRP4OF3XpkdfAr5K2b9Bkvkfp
 LP0YnjvPJA4aPdg==
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

