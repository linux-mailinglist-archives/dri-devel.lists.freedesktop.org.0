Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C99D7E53C4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 11:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC0410E4E4;
	Wed,  8 Nov 2023 10:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EC310E4F9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 10:44:23 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c501bd6ff1so94533601fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 02:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699440262; x=1700045062; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=932+POzuiCpVd1FMO8emES7304xq1CZHsFhbsNym7D8=;
 b=N/9XkL3nAYzwF25x9JPKRbo1I9XXIUsD+S3zBQkR0S+guB65WPZ6b1l3OJ5y2rwC5/
 4FkoLMfZgOdpm8VfTy+ZietskJtwtZBQxheV/byUL+Sie670vMOBT3iPANZGp/w7S3GL
 KC09fhx9mGZj9doccBn565c79Z6elw5TgiYRA0i2LhZGcGkVj2iyJUa7J4e1gSnSC5EP
 ZI23f5FX8Af+m/Ob/SwNw/C+POTnly53rZ7KoeqVpnPpqDVvzyi4ztfrzomdwUt6DXm3
 AwaM6/wfwFv8JgCHu6mqn05S2egAr8KkAX6oNuTDO3l0cvAC3ySEjVSU3vMz+cIFsJIq
 MSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699440262; x=1700045062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=932+POzuiCpVd1FMO8emES7304xq1CZHsFhbsNym7D8=;
 b=J7XPMC3FbfZq7QlMr+01s0AEHO+HEMdFX4pIIPMy7ezke6UpzafTWaafkqPEpv2KjC
 Gmnru6650tXI6wWTst3bB+Bz+3hcIzGE+CPn+dHhENvRxqW493JcZNNkse474ZU19W9v
 Cy+H/TouPatSqehLWCKLj0SEVLMtvMJrtZTtB5fPR7q06sqjtGbml0TXZqBhP/HhwSbp
 nNZbkZAk8Gep2zZ2EVtsnV8cVkAu90avjHTJYDOG6az0Tyx3sklsyEXU+cTSfakc8p9K
 mMBGu0/0w+jHPYbtLwBYjv46fNwUWZoKaLZb3+emVp+H4FsOR2vy9CaYh6ws6N6/71gs
 rtnw==
X-Gm-Message-State: AOJu0YxuHbgvRKbTRXAK79zh2vZ/uu5pjf3U/v/PcQtirBXHI8GuO7MN
 od3rkCYn/e/Zrxjr62+vPrclYA==
X-Google-Smtp-Source: AGHT+IGCpSGI0CR0667rdoPAw+/9BwGIOQ5vf5WLNiqXBsw+h3xPKE36aRvV/bSi7NnLY3zOJHYzOg==
X-Received: by 2002:a05:651c:504:b0:2c5:14e3:f1b8 with SMTP id
 o4-20020a05651c050400b002c514e3f1b8mr1507701ljp.7.1699440261813; 
 Wed, 08 Nov 2023 02:44:21 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126]) by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 02:44:21 -0800 (PST)
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
Subject: [PATCH 07/17] dt-bindings: serial: samsung: add specific compatibles
 for existing SoC
Date: Wed,  8 Nov 2023 11:43:33 +0100
Message-Id: <20231108104343.24192-8-krzysztof.kozlowski@linaro.org>
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

Re-shuffle also the entries in compatibles, so the one-compatible-enum
is the first.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I propose to take the patch through Samsung SoC (me). See cover letter
for explanation.
---
 .../devicetree/bindings/serial/samsung_uart.yaml   | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index ac60ab1e35e3..0d0215b23ab7 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -18,9 +18,6 @@ description: |+
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: samsung,exynosautov9-uart
-          - const: samsung,exynos850-uart
       - enum:
           - apple,s5l-uart
           - axis,artpec8-uart
@@ -29,6 +26,17 @@ properties:
           - samsung,exynos4210-uart
           - samsung,exynos5433-uart
           - samsung,exynos850-uart
+      - items:
+          - enum:
+              - samsung,exynos7-uart
+          - const: samsung,exynos4210-uart
+      - items:
+          - enum:
+              - samsung,exynos7885-uart
+          - const: samsung,exynos5433-uart
+      - items:
+          - const: samsung,exynosautov9-uart
+          - const: samsung,exynos850-uart
 
   reg:
     maxItems: 1
-- 
2.34.1

