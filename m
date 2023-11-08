Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 276697E53DD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 11:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DDE10E538;
	Wed,  8 Nov 2023 10:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6225B10E538
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 10:44:41 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c5028e5b88so92447771fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 02:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699440279; x=1700045079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eLncO1ADQq/KYbPV1LBS+813XGTk7ajEpj3gEwbCXmE=;
 b=iTr5w34mXq3Pn2iWZeflA+4iKnHbYQIQwZkgYpVd+56TIqtik8qGV5I1I4px3+nXX+
 8hQXZYJutxgkGSsiltCZbsGAiKBXOIzrmdfL4BBpX+zBZTcDJFqGnaqqm33fI2elepIf
 pRTm8uiNL9FuHbvSoQT+QeJFYb1DIAxqU5YXWue4ySqYgfs2Xa8QWaZK9OEzKie5oAgG
 +vuIfql0tjofPeVaNSFpjBHOECllp3cxjodXBg6kKhg6/X2gxfWm+ph8wvqjGSvkTUeF
 fZIb6IUlQmbMvTdUKP9CpXzDY8kOefGtzOJ1bv2ktdzqgT+MzUhhgLKIglWcpt+peJFE
 FRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699440279; x=1700045079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eLncO1ADQq/KYbPV1LBS+813XGTk7ajEpj3gEwbCXmE=;
 b=oeO67eTsIhBv+NJhDbm3hsXB/oVXH8eFXTlTUE0Ig7vdLskXEK9IjfI7i0hK2JM5W2
 byyM38uPaK2qrIit55I+yJYs1K5dZlZfbVLfzVmCG4gLCZ+q/Hr3dgqin8WiG0QC2GZj
 6QLB9voi/2qXr32atc0nNDd1HJMCL+Es+xbAUknWCkKgNmk9jPVUu2CPtERU4d7uUGr5
 aQbZhj0dbURG08fIRawWkG2mdSmX8uWe66V3N/C4juQ05RTD3EQreqRDwwkeL+7p1mLF
 SZgiyiXDFxwuBo8ygsu3nJzuJfF8kFNfdyhrmhNwaPyl9CSBDuPozORIi9EyNPC4FXta
 Aa0Q==
X-Gm-Message-State: AOJu0YzVkUTXvxARqVFukPCK6s5q8fMG6wQ1tCLU/MMVJSdZAcnbaamA
 4iki8EovDpjr5D/0QRX5WrgKRw==
X-Google-Smtp-Source: AGHT+IE9e7WdZJcWzB5Gf22P43YL/3qsWhZ9UWDtVmtmQ2zCC7QEZqOnQRFgEbbvc33FYHTz/Q1w1g==
X-Received: by 2002:a2e:81a:0:b0:2c5:7afd:75a1 with SMTP id
 26-20020a2e081a000000b002c57afd75a1mr1229802lji.44.1699440279685; 
 Wed, 08 Nov 2023 02:44:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126]) by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 02:44:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 12/17] dt-bindings: pwm: samsung: add specific compatibles for
 existing SoC
Date: Wed,  8 Nov 2023 11:43:38 +0100
Message-Id: <20231108104343.24192-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samsung Exynos SoC reuses several devices from older designs, thus
historically we kept the old (block's) compatible only.  This works fine
and there is no bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to each SoC in front of all old-SoC-like
compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I propose to take the patch through Samsung SoC (me). See cover letter
for explanation.
---
 Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
index 2162f661ed5a..89a3875cb50a 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
@@ -29,6 +29,8 @@ properties:
           - samsung,exynos4210-pwm          # 32-bit, Exynos
       - items:
           - enum:
+              - samsung,exynos5433-pwm
+              - samsung,exynos7-pwm
               - samsung,exynosautov9-pwm
           - const: samsung,exynos4210-pwm
 
-- 
2.34.1

