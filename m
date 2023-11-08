Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996E87E53B1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 11:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A37310E4E1;
	Wed,  8 Nov 2023 10:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1886210E4E1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 10:44:12 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4084de32db5so57278965e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 02:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699440250; x=1700045050; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XAqMvg09lZkovg+Zu0r4p30xWSnUqCaJm0pKp8M4YOY=;
 b=mvPl2lVN3VNcKe9bITfm9lj/Gdq0nQB9xhQsMFDpuI+cDEyhys9lu2k7px6aslQ484
 geuQtTva270JObjAIHBBIPVmBF+LBZwI6cdTs/gP6el/hGHet2k2Phm6UB2NL5F3aTr+
 vcqkkoxSJUGYTst0n8Yh38YYEE/JKEwW0MPn7WXfEz2oNMPKqGofvvlx2IqUNG3we/Vh
 qXhvDhDKJ0zx4JxxYANGBI/xBapfLdCCjEefgu54XTCxUaVr3maetwjDRxL1zjijcmTZ
 ohuOliimpOZN+Znfh1F7219XqjMZfHB+1rDaB8GrkO1eDrbsbiP9HFy8bndqFGg/widq
 TFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699440250; x=1700045050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XAqMvg09lZkovg+Zu0r4p30xWSnUqCaJm0pKp8M4YOY=;
 b=lMTOJFp+/XCGCxLgoivczFQc1I3deWV4AwCVsngLChwWs7yG9UAYavvtau2a1gzUOS
 YJBvXFC//Rc6s0toT9xFXdzjsL0k9VZhGJIAKfnzkoiq559VaTyrgaQuBuDk8AaZcxoA
 45OGAsrDpcykgYSKfkxscHCV4sbCv7BcUApbajDys9PXIsL8woEBGpOBBQsuWHEArL0Z
 IX15aKFD7uhhYXj5tGZevLmsEEmRVMfoyzqSELjoskXH4RhX/fSoELHp7YhoelE39UY9
 GvqA0FgPCX77h3u8Ot8bbSHJOEkxSYsvMYssOiMWMokDzaolnyzMHQW66HSi2CFNLfFR
 +aLw==
X-Gm-Message-State: AOJu0YyLYHCSkwWuuHQ0PDNRDUPOPzQA/mj+DtjAh49WmKOVpP4xhdgu
 h6+CNB2cYdla3Ojcy8MyVAGb3g==
X-Google-Smtp-Source: AGHT+IFviUW0LhnhTYkLsi418du0JsS+pSDR7WBQ3E2YbqFPxwTGmVG55ROJ8WQ2QG79sMX8+5JXdw==
X-Received: by 2002:a05:600c:a49:b0:409:5d7d:b26d with SMTP id
 c9-20020a05600c0a4900b004095d7db26dmr1253167wmq.15.1699440250466; 
 Wed, 08 Nov 2023 02:44:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126]) by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 02:44:09 -0800 (PST)
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
Subject: [PATCH 04/17] dt-bindings: mmc: samsung,
 exynos-dw-mshc: add specific compatibles for existing SoC
Date: Wed,  8 Nov 2023 11:43:30 +0100
Message-Id: <20231108104343.24192-5-krzysztof.kozlowski@linaro.org>
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

While re-indenting the first enum, put also axis,artpec8-dw-mshc in
alphabetical order.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I propose to take the patch through Samsung SoC (me). See cover letter
for explanation.
---
 .../bindings/mmc/samsung,exynos-dw-mshc.yaml  | 25 ++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
index 6ee78a38bd74..5fe65795f796 100644
--- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
@@ -14,15 +14,22 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - samsung,exynos4210-dw-mshc
-      - samsung,exynos4412-dw-mshc
-      - samsung,exynos5250-dw-mshc
-      - samsung,exynos5420-dw-mshc
-      - samsung,exynos5420-dw-mshc-smu
-      - samsung,exynos7-dw-mshc
-      - samsung,exynos7-dw-mshc-smu
-      - axis,artpec8-dw-mshc
+    oneOf:
+      - enum:
+          - axis,artpec8-dw-mshc
+          - samsung,exynos4210-dw-mshc
+          - samsung,exynos4412-dw-mshc
+          - samsung,exynos5250-dw-mshc
+          - samsung,exynos5420-dw-mshc
+          - samsung,exynos5420-dw-mshc-smu
+          - samsung,exynos7-dw-mshc
+          - samsung,exynos7-dw-mshc-smu
+      - items:
+          - enum:
+              - samsung,exynos5433-dw-mshc-smu
+              - samsung,exynos7885-dw-mshc-smu
+              - samsung,exynos850-dw-mshc-smu
+          - const: samsung,exynos7-dw-mshc-smu
 
   reg:
     maxItems: 1
-- 
2.34.1

