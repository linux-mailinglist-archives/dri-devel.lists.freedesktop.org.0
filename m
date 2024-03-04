Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C6086FE79
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA2910FF36;
	Mon,  4 Mar 2024 10:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ovC8AprL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3657310FF31
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:11:56 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso5869699a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709547114; x=1710151914; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2l7UpgtGLmRWEg57s509hO79ijY7GD7vXKq1B5m81jQ=;
 b=ovC8AprLh9waKSGzHui8ZDPYxpALYzBWigJwNNQjCg8ZbPDwIXbfZgawSEdBeqsAuL
 OHvug2G7OkYVusCqbZcxx5en5ceBwhnFyjWN4f0FwoOnsFNlI78fsp+1iFy29cKzZOml
 BRSLprLCsdUJZHE8GhlV74nqPTmKicKSWimVzAoOfwinHmyvuFi3ord//0tdHsyW3ckc
 uqjC9ME9kzrSHArqRe6NP5dGRnzJCXQSqo2xcj+mbe6IZagX8rxI5sJL3Da79BegmjxX
 BrTC+zxZTTKdR9dZE/lYykknv5ZHQNyCbgZlldk4Z1E3zZf4QYi2C7EDYT7/udU08w9O
 mJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709547114; x=1710151914;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2l7UpgtGLmRWEg57s509hO79ijY7GD7vXKq1B5m81jQ=;
 b=Z6hUUH/UFoyKf4j6D6ZG49rA1djpiwLRIwPYVTVLEw5uoaSa5TJfMoXpsMJsGmwDDH
 4gCebKTmZ/cT7/kX+Y3EoaCmNZaa+t6D+2IOc/3qqrCeQFjum6pyZFdXZfBPcSiIsDBc
 TUdQQm4uEV5uJR12Uv0Ot7FeuD1VYKzzllFCCXo4OQGDys1I6MvfEYh22QRfphMufME7
 KIycinMOHF1bvfVmA1zZCIEANWhQZNTkgWtie7b3OFJz0SW1zo6j9R4rQwy9lg8byZp5
 LQQMyKV3tjARBUZYeywFJN+jLJE0N4QwQzgdU3r+csHiCRR/APwE4ELR+3+ovKJbAXsE
 YSMg==
X-Gm-Message-State: AOJu0YywwgWJPujv7ZaCbU7CdCmWQl2EyW6xbrn7D6mQ2geUkSlS3Nh9
 Xolaceg91rvZqVaZ6tyDwYAmB1R3C6PmNVegIdtC1v12eTmyDvXTSh+pWPrfrkI=
X-Google-Smtp-Source: AGHT+IHrMdwkW1PUb9mRl/nOw9W89HypdtSeRHnOOx6YuKOHBeKBikpsljjl7tT07UnolQyMcxLIZA==
X-Received: by 2002:a17:906:f8d6:b0:a45:2e21:c78c with SMTP id
 lh22-20020a170906f8d600b00a452e21c78cmr2053919ejb.13.1709547114198; 
 Mon, 04 Mar 2024 02:11:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97]) by smtp.gmail.com with ESMTPSA id
 ef11-20020a17090697cb00b00a44bc99cd89sm2938481ejb.42.2024.03.04.02.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 02:11:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 04 Mar 2024 11:11:38 +0100
Subject: [PATCH 1/7] backlight: gpio: Simplify with dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-backlight-probe-v1-1-e5f57d0df6e6@linaro.org>
References: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
In-Reply-To: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=L1gsWac4GlPBRR3BJYIkKHgN/RCN5L6+vXyGAdt7/+A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5Z5hj0XQi7kaF+7e81MFcwlKfdVr65vaHpPDi
 MjsbG2Is3OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZeWeYQAKCRDBN2bmhouD
 1ygRD/938KcTcARGYikW/nyTzAfcX6ZC3q6UvmWTsLjqnFXltYckmIM/zt+gzWek4+bhQ9S1KS7
 Qmd2iAiCs6EU8ne7ebg+KIqQO44shqs+JFKqcyukBmdZ5f3P9ijrQk45S6KhhX0Z6PPohIoi98W
 GvTvFNX35xb/bjClwx8vtCuk8hJo6PolwiWsStWd2eenHGpk3qbOIiLVSV/NeF4TOsyVWpkNpET
 9BaDnLv0gBXAePVN6cy9mRLzD5JmzucY8gGBktV+zPhsbpNrTBDOJ/TNiydgwTxSVnJ+q24kWkl
 saS6lwMG7z2+0bfaiYCq/Aw+MicguWKUDtkyBTa2qqvmhYpP1URYMiOmjk2+aq1t/fpHJuvqrP5
 BhpZUHSlr+ck2ZbOJ2ckKXJ5SN3E1gVNVBYieebwzJ8G5m3mXZBKqOOvfQNMeSNfclN94ICR2QL
 nQIXGnO9EV/OwjRtKLapX9M5FYXsGLYvjXSpP+Af3WU6JHlkhnjGTOSnFBEWujD5yINuJJEF5/a
 qqopAv0qk5pujRsYiT85L6ZtryQOrZjznB6t3TdaO4dWZPnx8TcRSDulZLen4+WD7vcwUlw3yQl
 L+GrxwPMuZbqP03xEch1aBS3qvs+KFKTbyngpjIdSk7pFs8yUL+CTQ8q4+egzW+n9eEhvoBjZiB
 UtT5J0qdAwvwdTA==
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
 drivers/video/backlight/gpio_backlight.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index d28c30b2a35d..9f960f853b6e 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -64,13 +64,9 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	def_value = device_property_read_bool(dev, "default-on");
 
 	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
-	if (IS_ERR(gbl->gpiod)) {
-		ret = PTR_ERR(gbl->gpiod);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev,
-				"Error: The gpios parameter is missing or invalid.\n");
-		return ret;
-	}
+	if (IS_ERR(gbl->gpiod))
+		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
+				     "Error: The gpios parameter is missing or invalid.\n");
 
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;

-- 
2.34.1

