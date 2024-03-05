Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCDD8717AB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 09:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06645112914;
	Tue,  5 Mar 2024 08:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gc9/q3Wv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480B2112912
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 08:12:17 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a4417fa396fso659380266b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 00:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709626335; x=1710231135; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qZhcPKgdyjL8bhk28jJde1fP1o5dZ8nODM9Ogpw/oLw=;
 b=gc9/q3WvDL4fYTFjCmJNjQskMMC5ZcmxffpoXAPX9wdk7MXz5N06KB96lxE1msfMfz
 UC73vAmnRU3ob1EJ3AmTfJiaKUfzuSUY8EExCD96lC8jsiGtw6nHvU0u0yz7BdG72sYU
 Nfrv7JqDpP0oecewHh6D0Vs5KvkKZCj1cwJqGlLD2NFiGNDx6xZkIlNI4lVV4X/XK2zS
 n0qP/1+ga5VnUDVxsEw6jBo248JyV8GXxP5lg5/0E7b/Met6cuusoI6BpdjsUTBJqaMx
 1m3dKbN7GqX71MSfNIp/N7HC0NNIJK71YhicNBDdQMSaCZYYPPc8u8yvDELF94CBbvoK
 1e6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709626335; x=1710231135;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qZhcPKgdyjL8bhk28jJde1fP1o5dZ8nODM9Ogpw/oLw=;
 b=t//o6t+yGmi9c4QW03RDYjOsrvVe/e+oQfOLWTUSphNawzC4Y99NxDDjGibz/+O28w
 iCICQUP78m1D7Rrry66R5JWNPMk/GqE6rnMb3cRDCYs4xgblmc7Hc5uppbvsJOqzLHOf
 tqN7v5nXFKQcstxnhJz40J6vansyHJzYljvYD7dMNb3oCP7+GeRJfW5Kfgqr6QsgCeYC
 0nzEmdPR0Y+XhqPNTtehnxxkNMPR6pXCYdnH5V4MABFDyVTjhN6gU+03PdkxdmymISIW
 HLipK3oa1vsLKxt8L7CK++yT6IPq8R2uhHhIBVmX0HlHccaRaLqTL4+7yNGN3uRiQQ5V
 xv/A==
X-Gm-Message-State: AOJu0YySxSCD7v+bLKNPYAyHuQ6wpJj14mVxCql7wcMt1zeukuJ5kJ6R
 U9V2ntjbo3Q9sqAqfarihSQ0d7QElLiIaoVTn5jrqvVhizjGT2+rtkqAYk6SEx8=
X-Google-Smtp-Source: AGHT+IEuX6cKf625yCSFdJGJles12Fo1Zc/Eyc8YTMuYE42QgS4ym9vrzIj3xWMG/qe66D6f3pwLmg==
X-Received: by 2002:a17:906:cc93:b0:a43:e46b:7a80 with SMTP id
 oq19-20020a170906cc9300b00a43e46b7a80mr7105432ejb.43.1709626335333; 
 Tue, 05 Mar 2024 00:12:15 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056402221000b005672a346a8fsm2761557edb.57.2024.03.05.00.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 00:12:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 05 Mar 2024 09:11:56 +0100
Subject: [PATCH v2 1/7] backlight: gpio: Simplify with dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-backlight-probe-v2-1-609b0cf24bde@linaro.org>
References: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
In-Reply-To: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=opt8++1g0VChwtIB/Fz1GiYx24pMTFMe80pujvPzm0s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5tPWa6sw7b/TOSWZwZZYFLYG0BNvTG0TlbZoC
 8bMfcQFWxqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZebT1gAKCRDBN2bmhouD
 14vBD/9cqYKdrTAFMz6KcpOJxJ61CvuYnUPyihjwAG5ODNJ/TVWyi23DB4xZuL9d5a1Ff1xPt0K
 xenDTpvWcGV4PuNDjXe+sLUd0VWaBr/u/qSnQgDEhzYBbP095TSe7svObyzpsA6qK3c6YpxWv4J
 jRHXI5HShKxxPH2EqrqgzFx+xQOhmJAcBuWDyOCQDkJwGjvNShtjm/Bucp04ehxnXM2pmmdSTKV
 uH20IKKiZvxuOfnllFf117Iet3e0cK7KCMmcAy4CNi8N4Fyyo8+KcX1o2jwaYEJBzGqjSZJfHEc
 vRjVzwLQg2mBtty/lc4PwvvKabGqaIqiW9nDsqg7s8StjZZ2C1Xj6tWBgvGJiPJrOPscB0anvRo
 //2hXe/fq7N4168QtWlzL4qnPMBVMP7xjIFwwXCFasHOgBBuaYcWRYSmydbuT+8E+Ca5g7LWTSx
 Yt+0Nk5JLCTQ2cRZVdB7GYf93YoNlJ3mm2LS/bSDlBWQWuR5RMeuGTY680tY+ZGlCfbWp+mZxyX
 brBg1fFJMyxwb2hPg8YaH8BWgaqQHz2M/jMeap2g8W3xYqSJcrwk82QrnNzfw95/w0o5ejrpADE
 KKV05pkeESvkDdw0gNi+Jl++3PUHsLFtdS/Zt0LRqULopfstN3o6duCsIifq2E558izCkBczLjg
 m6Eh1t0XIs2hpyA==
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
index d28c30b2a35d..e0c8c2a3f5dc 100644
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
+				     "The gpios parameter is missing or invalid\n");
 
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;

-- 
2.34.1

