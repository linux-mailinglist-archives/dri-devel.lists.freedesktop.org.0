Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E29F7E53C8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 11:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7664F10E4F9;
	Wed,  8 Nov 2023 10:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D3C10E4F9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 10:44:27 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-407c3adef8eso57051635e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 02:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699440265; x=1700045065; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PV5diolHzkDYNZO8WufyA3F1OzLH/Kn/j0r7E3RxmpI=;
 b=QMSRr0MrZ3n/lmmj4neX421u7UrCUMNoxa+RPr/xCVyDJkiaie/AuUWqzCulEGwae7
 daKELGkSBFLn7+r9+Y7Qi0IV3PSK8pewd0CNoS/Lf03Cn0UMKMEcbgL4YwX/YBlsFrM9
 4KggHAbx2HZ33kUqq6bmYQwv/l9LYj08ZYCNweIlyRiiZm2shfdV4uBEIxh1kU+EKE8f
 6EKxteZDHgkndFbACDVPK/yqjjrU01Gmmm68T2AdtZAzH0KmnqZBdhSoD7S4VqixD23U
 2Fl+w0eabJmjhiZfY41Ro107K/eKgAlx3dnY/tE/xYh9kRMt/3fiAiqaYGLcXosezrt5
 6nnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699440265; x=1700045065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PV5diolHzkDYNZO8WufyA3F1OzLH/Kn/j0r7E3RxmpI=;
 b=vNSJoRdOtZB+bmU1K3ItiC9leyrHSEviD3+UD7jGPDKefZk0/XMmHRNrqi6YH5hs04
 EO5WxmO2o4X184NfTnK+m31qlYIs6/V71M4b6f7xrbdCw7KrAhtDdPfxCb1qvNGH3HaP
 jv19lz2Zx9giqlTYa4zYkV1BrE1Yx/6tHzYRKQM1gB0nOAKIY1svv1ADyngIGH4nMX+x
 NN/fN70esftNbTCRbBy7pHuENGDth5tz/9ihVvUN6RcMq6rZPD1fokg+wcK+8aIknYZq
 Ob0+DhgWM9iuWjqgZycGXrQ/aigG3I8yai85ZXey7QK1NzlGfvnKoa/MhRNA9+dIG0U0
 /yYg==
X-Gm-Message-State: AOJu0YxmtmR7CW5oBajAMTcbqDrphWNp1s/q8DvBpXCrdU/ZfJ4DVFiO
 7fV7Hs0x+AEvLy4TDlW/Cw//Uw==
X-Google-Smtp-Source: AGHT+IE6LA57XGwizIDEYldEFclmufoWGtfeboQZQs5v6tX5jMVi5UnfB4CCXBaPubn6aW9Tzqj6ag==
X-Received: by 2002:a05:600c:1f8f:b0:406:81e9:ad0c with SMTP id
 je15-20020a05600c1f8f00b0040681e9ad0cmr1347385wmb.41.1699440265563; 
 Wed, 08 Nov 2023 02:44:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126]) by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 02:44:25 -0800 (PST)
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
Subject: [PATCH 08/17] dt-bindings: samsung: exynos-pmu: add specific
 compatibles for existing SoC
Date: Wed,  8 Nov 2023 11:43:34 +0100
Message-Id: <20231108104343.24192-9-krzysztof.kozlowski@linaro.org>
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
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index e1d716df5dfa..6492e92586d9 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -48,6 +48,12 @@ properties:
               - samsung,exynos850-pmu
               - samsung-s5pv210-pmu
           - const: syscon
+      - items:
+          - enum:
+              - samsung,exynos7885-pmu
+              - samsung,exynosautov9-pmu
+          - const: samsung,exynos7-pmu
+          - const: syscon
       - items:
           - enum:
               - samsung,exynos3250-pmu
-- 
2.34.1

