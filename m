Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA08C7E53BD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 11:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F4F10E4F7;
	Wed,  8 Nov 2023 10:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D7710E084
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 10:44:15 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40859c46447so42265975e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 02:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699440254; x=1700045054; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jaIBx0Az35AgmK0hmQ6KD07E3PCcuw+SeUDmsLqHS7Q=;
 b=daNTE/gnejf6rKrbAzJAUw4sHd86tmCJhMCh+Wmk+owvszcq6ky1yu+1GfLB9UF/FL
 F4okcIJ7o9BWRSezOL8cvlHWQ+64zwseXJMLlWvyuxF71+tIRs0JO6N3bCmugxJFO7rh
 RbtvEt5GtatASNFKSPDsP2tkFZP+5uejexmHYG+rK5z2DuAgi0P1V+4r1rP6ke5GQAi6
 IedVAvsNNkFN6beXVbXVzTheqdGQPTGMLaSx2uncQ5Np64OAYZyPsefhSZufU0eFOFpE
 eR70AxT7OV6/11aetmsvbbrBi4zqXJAtk1uKFy2bbWAsSQiqtovTcv/U8M2I3197FIWr
 KDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699440254; x=1700045054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jaIBx0Az35AgmK0hmQ6KD07E3PCcuw+SeUDmsLqHS7Q=;
 b=X45wMVNI7Hf0nisaYqpI1tD/jb/os/TA25ExLIuqYrExfujiDp5aNgrZefgU8+JMZt
 PB779cyQU7YrNK89dsSVByh9tLxc6SnXL5mQ17bRh/HAJTJI52GtVCh5N7LwO8WjJDrz
 7HaF8AEzd1eACsZ60b5O2ngcEqb5sDj7TO620PRAftbfNmCBW8Zis/GHZoi1ADyxDDuA
 /GFFSgVVXRWi6gIftaDM6YVU6lcgbJOxHwATlr43BTkYDUsvQtQIYgD7W6938iomknvg
 rHsiTJqa5D2McntEF5MoI2bHuYDXZf6kWfwCKQFZR3I/JRTGtOSM3BsKxZSMuQJSSCMX
 uCxQ==
X-Gm-Message-State: AOJu0YwFkZsl4LgcYOojiv1bO2msFGjD98yjYuiKyBFEGadhs2PTcjhi
 bKeE1Vyu1LlbF1QiL/Sz61t4Gw==
X-Google-Smtp-Source: AGHT+IGJlG/0ZP5DkScPVOMejPSATBvkrEgkimXiOn6arKw3sdBhLlR3KhZAKEWBPjharUEFMBueGw==
X-Received: by 2002:a05:600c:4f11:b0:406:5344:4212 with SMTP id
 l17-20020a05600c4f1100b0040653444212mr1447121wmq.41.1699440254278; 
 Wed, 08 Nov 2023 02:44:14 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126]) by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 02:44:13 -0800 (PST)
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
Subject: [PATCH 05/17] dt-bindings: pinctrl: samsung: add specific compatibles
 for existing SoC
Date: Wed,  8 Nov 2023 11:43:31 +0100
Message-Id: <20231108104343.24192-6-krzysztof.kozlowski@linaro.org>
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
 .../samsung,pinctrl-wakeup-interrupt.yaml     | 24 ++++++++++++-------
 .../bindings/pinctrl/samsung,pinctrl.yaml     |  3 ++-
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 1de91a51234d..1c07af24d6cf 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -28,15 +28,21 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - samsung,s3c2410-wakeup-eint
-      - samsung,s3c2412-wakeup-eint
-      - samsung,s3c64xx-wakeup-eint
-      - samsung,s5pv210-wakeup-eint
-      - samsung,exynos4210-wakeup-eint
-      - samsung,exynos7-wakeup-eint
-      - samsung,exynos850-wakeup-eint
-      - samsung,exynosautov9-wakeup-eint
+    oneOf:
+      - enum:
+          - samsung,s3c2410-wakeup-eint
+          - samsung,s3c2412-wakeup-eint
+          - samsung,s3c64xx-wakeup-eint
+          - samsung,s5pv210-wakeup-eint
+          - samsung,exynos4210-wakeup-eint
+          - samsung,exynos7-wakeup-eint
+          - samsung,exynos850-wakeup-eint
+          - samsung,exynosautov9-wakeup-eint
+      - items:
+          - enum:
+              - samsung,exynos5433-wakeup-eint
+              - samsung,exynos7885-wakeup-eint
+          - const: samsung,exynos7-wakeup-eint
 
   interrupts:
     description:
diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 26614621774a..7509dc36af93 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -313,7 +313,8 @@ examples:
         pinctrl-0 = <&initial_alive>;
 
         wakeup-interrupt-controller {
-            compatible = "samsung,exynos7-wakeup-eint";
+            compatible = "samsung,exynos5433-wakeup-eint",
+                         "samsung,exynos7-wakeup-eint";
             interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
         };
 
-- 
2.34.1

