Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0FE7E53AB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 11:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBCF10E714;
	Wed,  8 Nov 2023 10:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D0F10E084
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 10:44:08 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c5629fdbf8so83574361fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 02:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699440246; x=1700045046; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rrZs4emLFc9OjGPQr8NhVrDcx8agcy43Q5wHxC/jdF8=;
 b=R8oqAnzh1hr1M2RMqT0ncnSOhpLpSu9OI1RB7n5chS/e4rWpuXzlWFM4lqEII9ieO/
 fErSh0JtT98lQcZjQjuMg2ySs8YHZ1wlWTthKKLBMP1lleOe0Qb2XjenlRtiG+9Zpei8
 KLbzMiUfVcMEc29PmmmSLrpirLWt9/TLk142VqmBeDnaAeph7FvnaftVAdvCVUl/9qSX
 m6yROGnmMZOlxR7qjacervtslm/ObTjRxv4HHjQxPrIOj9ms6rhcSUxQ9JA4sg/lfiNV
 v5AHy55aRWwdV89xGD9AIz8TqDLyvl07anotmLEZK/7zKtHrM/VDg4YPtWriRQMXjz5e
 dAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699440246; x=1700045046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rrZs4emLFc9OjGPQr8NhVrDcx8agcy43Q5wHxC/jdF8=;
 b=tv12T/+uFKmXUlBZ8LW7ZitNynr8t76azjandF+r1M2Asm8+Ew7ZonNl90EstMVlqc
 8yrBvdCr3oPZURCErtF45CYS/XIpD3TMA0j0TIjPVFIO2x8dFCldenzVctv1GDiV2e0g
 pWwePrEuJpvqVNzUY+tGQbelsQHsasTOSj38sa1UECanBxkoRZtXZ+hgsdvygiGzQyWj
 D7MokKdMsqt1tCsMn/WJRODLALSjGrOpO/doCP5EjCOO5uQ/rmCEoB6GlIlJWY2rwkMz
 J8VBlcunRZBv1u8PYkxn6G8HqxJwlrKLCUQYbn+aBTPhY+FvI4k+1p1LxjKqXobg/Cym
 SeHQ==
X-Gm-Message-State: AOJu0Yz9KPcCwpRkfUu1aBYPezfxgeUM7XjnzSAuXyiZHFBCnm8FxyfM
 245Cw4dfbOJGUpBfIg0wVCziXg==
X-Google-Smtp-Source: AGHT+IGa+2sMFPnXDCg+/Kp94WpmPGqJxAqZSoI9EBPYbrrl77NmQH95hc0MBEym2E6Wk3ngRYzA3Q==
X-Received: by 2002:a05:651c:19ab:b0:2b6:fa3f:9230 with SMTP id
 bx43-20020a05651c19ab00b002b6fa3f9230mr1578553ljb.46.1699440246534; 
 Wed, 08 Nov 2023 02:44:06 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126]) by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 02:44:06 -0800 (PST)
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
Subject: [PATCH 03/17] dt-bindings: i2c: samsung,
 s3c2410-i2c: add specific compatibles for existing SoC
Date: Wed,  8 Nov 2023 11:43:29 +0100
Message-Id: <20231108104343.24192-4-krzysztof.kozlowski@linaro.org>
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
 .../bindings/i2c/samsung,s3c2410-i2c.yaml     | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
index b204e35e4f8d..1303502cf265 100644
--- a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
@@ -11,14 +11,20 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - samsung,s3c2410-i2c
-      - samsung,s3c2440-i2c
-        # For s3c2440-like I2C used inside HDMIPHY block found on several SoCs:
-      - samsung,s3c2440-hdmiphy-i2c
-        # For s3c2440-like I2C used as a host to SATA PHY controller on an
-        # internal bus:
-      - samsung,exynos5-sata-phy-i2c
+    oneOf:
+      - enum:
+          - samsung,s3c2410-i2c
+          - samsung,s3c2440-i2c
+            # For s3c2440-like I2C used inside HDMIPHY block found on several SoCs:
+          - samsung,s3c2440-hdmiphy-i2c
+            # For s3c2440-like I2C used as a host to SATA PHY controller on an
+            # internal bus:
+          - samsung,exynos5-sata-phy-i2c
+      - items:
+          - enum:
+              - samsung,exynos7885-i2c
+              - samsung,exynos850-i2c
+          - const: samsung,s3c2440-i2c
 
   '#address-cells':
     const: 1
-- 
2.34.1

