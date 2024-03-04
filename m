Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09E886FE7F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8D010FF39;
	Mon,  4 Mar 2024 10:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i+mzBnNc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F9F10FF38
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:12:01 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so6401477a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709547120; x=1710151920; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LCgoEF8+45p8Lp99q3OTs1MMW8tsgAmVbVFGKP9cQEM=;
 b=i+mzBnNce1NOKg8qoOQI6wEQBFgwmNeaAEoQKwNCskO2nTlLG6evEdXsUKidm0Dpah
 h1rdUcEPAEHTe1xqdrrijT+4+UPCb99bUYbGb7NpEZQ6QN5KTvAegPiHi46VTbvTHYbU
 Cz2V1oDuN7j/fDLgucJ/9LfmHNS3f8BfmJAJ3DVsFEL+V6DPnNMjtBuGDEdhUje4OGvx
 bIAroDHN79EsLSlH4s9RWkAyMlk/NbHT+n6q6v9blq7YCjTY4XfLgjppegckBwCTN06G
 CL31qDrRAro5bJciAPSokd4fLdfaNVywZmwbh2UkVgGCKh5s2wTvoygKs2TgKAd+aKK9
 x3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709547120; x=1710151920;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LCgoEF8+45p8Lp99q3OTs1MMW8tsgAmVbVFGKP9cQEM=;
 b=n858a1s2d9ghMI5wYXFGD0gZ2/cC94FQPkjvLWTV7kE9gVXdCR6agmFvyYuPy6enMP
 lbMI2LuEo14Oab7D/SKie8xqYz4KRd8gBJZ2l3jK3o6PDJTs9bne3O9V3pKewbKxdCEN
 4tXdZz16aMfpWjvv9LdOmznkXzSe3T5A2rP5GnCXShOwGLgVc0nmc9meFqRfhz8tTR3j
 IDZ0256NucyGYtTYA7RfhUf/p4xwhtTIDyFVPZowXFEvkeP3fB4YBMJbvPszfNzYo6tB
 W2SOUP3O5404FUMEUf2GV4rPuoA6jlgeq/k7gE1Eg3hQ7VDjiVzcB8EZ7Arz2XaneQi5
 6JXw==
X-Gm-Message-State: AOJu0Yyn7PCywSpSYGlxYdLrzyzTfiaS8bPFPwapxSsOIJbt8yEroamS
 QHKDyGYMrzWHgnctK23ZSxtDBmeoW87yMrB5gNGrU4liPEE0hEbFK1p6Bp81J5E=
X-Google-Smtp-Source: AGHT+IHMXps/Sdsau2lL4BC5kTEGautlKze0rWGzpZvXGJF/HaAiRzHSpujG/+PG5cV0scGrNC4GgQ==
X-Received: by 2002:a17:906:c318:b0:a45:2b2c:8968 with SMTP id
 s24-20020a170906c31800b00a452b2c8968mr1743474ejz.20.1709547120032; 
 Mon, 04 Mar 2024 02:12:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97]) by smtp.gmail.com with ESMTPSA id
 ef11-20020a17090697cb00b00a44bc99cd89sm2938481ejb.42.2024.03.04.02.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 02:11:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 04 Mar 2024 11:11:42 +0100
Subject: [PATCH 5/7] backlight: lm3630a_bl: Handle deferred probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-backlight-probe-v1-5-e5f57d0df6e6@linaro.org>
References: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
In-Reply-To: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=l2zBfccz8Tq6SqYayq64DiM3PIARxZs9iJsKbpWBrMU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5Z5k1b8EW68f6XfirNTSL7SEI9ygTM0istLZw
 TdhuvuJzgCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZeWeZAAKCRDBN2bmhouD
 13BKEACHkxYLvnrmNqz2S2EAVq1squYd3iDN3nmrgGmHzpunYRmnlsYHaCQP1Ne+LT3Rzk/0DT5
 2kPItHRavwLGtfzXlkwLcdWIJ4O1tCilY9lQb6KQJG1N9EjK6+Vipl/8WV+iF6plMs25+pTlU/b
 0nf9uT/r5IL5cC3Rf+Sg3s7hDFKjeEh0aH78KMaIeMolZlM+QX36Ud6sxRYH4lQcrewimowQ37F
 BIWqy+6khodGvB7Q+qGPFYLcXGHewXmq2xJjqhlop6PNPMNCwi00HZEodZCENGKrOnSTKLKyd7j
 kr1Y0UwfHgcnT8G4v+VJum0+eWAnptHxA/FwqhO4AQZTofuq66Y4gDPQTF+OqXheDd2ZFwDJ7JU
 78vL843x5VMZVe7AEfJSkfOKhHTOXFr6HyP1klsJ5lY29G454mNYhNyMDN/erwKwx3w7/On3XMQ
 5c1r0t7sXFMBBdRJpi+0/JjnEttDlF7acH7BflLiltf6atwGJWjBHKQf55RFYLRofb4Pq2WB24U
 Wymjysgg61HAlduM+RW7/OFURHUF0JWU81CR/GKmWfT21lmhjUsYGtbkS/qVftIpVhVpBW+xuCy
 FrdNSxjgUhfOPA9/yU645iXlG+RRMoc4CYG/aWlJyTaAo7Wu0meTzCE7rM+06ZSRWJY/FevD3M/
 XJeQstxrm5vdEtA==
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

Don't pollute dmesg on deferred probe and simplify the code with
dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/video/backlight/lm3630a_bl.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index a3412c936ca2..93fd6dbccc28 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -563,10 +563,9 @@ static int lm3630a_probe(struct i2c_client *client)
 	/* pwm */
 	if (pdata->pwm_ctrl != LM3630A_PWM_DISABLE) {
 		pchip->pwmd = devm_pwm_get(pchip->dev, "lm3630a-pwm");
-		if (IS_ERR(pchip->pwmd)) {
-			dev_err(&client->dev, "fail : get pwm device\n");
-			return PTR_ERR(pchip->pwmd);
-		}
+		if (IS_ERR(pchip->pwmd))
+			return dev_err_probe(&client->dev, PTR_ERR(pchip->pwmd),
+					     "fail : get pwm device\n");
 
 		pwm_init_state(pchip->pwmd, &pchip->pwmd_state);
 	}

-- 
2.34.1

