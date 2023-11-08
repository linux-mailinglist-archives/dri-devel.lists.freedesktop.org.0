Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A99C7E53F4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 11:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5E810E547;
	Wed,  8 Nov 2023 10:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5535810E711
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 10:45:00 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-408382da7f0so49686065e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 02:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699440299; x=1700045099; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQ+G5s8RPHyPJsrBFGNZYZXOAO3f3klrHmjNTSjaK6I=;
 b=uJw965xpnC1kme4eTVJ8gnzKbI0H1ZWKP0MNe3IIjkzWPHltRJ7ts4adLvpAm9kD5y
 vCvpCXElmXpHqq3E1KHUNxCbxPXllvDecQ0Xq4krKjLnDGDXz5GlUlKs48H3ycUb9j0/
 mLs2zyT9hKg6pIutkk5uq2CtAw849/5d3YUWlMc5W7eG8MP42nCY7+Z44JDgdTLzXvIe
 DHxkpipLapYIwBPulw1qegHYjlltpgYPU9BGxUUH40b8Zop4XfIHPl6lWsY6FhFivzQN
 jS8P47Y0gsP2aWNn0MBswUmICdhSYPE7DrAqo7dlMpmN9PyPjecC0VsRBpSkUDG2dXiS
 DZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699440299; x=1700045099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YQ+G5s8RPHyPJsrBFGNZYZXOAO3f3klrHmjNTSjaK6I=;
 b=a1zKX2LmO7Gc1PPfcghGvks6nOVgeekKEiOEpobWnzcMo50UOP8sYHfrxrF37AD06s
 uMG8Fd4g7bJieTnakR9LeX1+CgEKo9EnDkW2DY/408bZ1ikQNaAUjnLYMWId1KYn82kG
 WFEYjEoCFiWiffdhYq/OoVtUP1A9aioHnn0qq7D5jn7/96QIrRstezvN+zBnPybChghg
 CLfLU2sAWlsTxWRpWOi5eaQ2OT/NkgoZtvOvhYWcfRTr2eFKy6wFY6y1P53OTyYpINDC
 3lggUSppCF4QWGv8Q/qHSZx090p41hFTl+b5kTXU4NiHQNbIqb1K5GgWavcXdzHKf1Gi
 waDw==
X-Gm-Message-State: AOJu0YyzBzlRNZv7isyxPV6tryaP10NFhS8ReM/CWtnebTN6g6w/JUc5
 sololyuJlXRrLnsyhUqGvD6Q/A==
X-Google-Smtp-Source: AGHT+IFp84xxfo5QRAF0wCrKdORFx4iJmSqJoRpd/lOk7txHM8S/A55ohRCToPiG6pukjYjCgaIN3w==
X-Received: by 2002:a05:600c:3b15:b0:405:95ae:4a94 with SMTP id
 m21-20020a05600c3b1500b0040595ae4a94mr1341542wms.5.1699440298865; 
 Wed, 08 Nov 2023 02:44:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126]) by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 02:44:58 -0800 (PST)
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
Subject: [PATCH 17/17] arm64: dts: exynosautov9: add specific compatibles to
 several blocks
Date: Wed,  8 Nov 2023 11:43:43 +0100
Message-Id: <20231108104343.24192-18-krzysztof.kozlowski@linaro.org>
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

ExynosAutov9 reuses several devices from older designs, thus historically
we kept the old (block's) compatible only.  This works fine and there is
no bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to ExynosAutov9 in front of all old-SoC-like
compatibles.  This will also help reviews of new code using existing
DTS as template.  No functional impact on Linux drivers behavior.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index b228cd7e351e..417aa56a81f6 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -166,7 +166,8 @@ soc: soc@0 {
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
 		chipid@10000000 {
-			compatible = "samsung,exynos850-chipid";
+			compatible = "samsung,exynosautov9-chipid",
+				     "samsung,exynos850-chipid";
 			reg = <0x10000000 0x24>;
 		};
 
@@ -349,7 +350,8 @@ pinctrl_peric1: pinctrl@10830000 {
 		};
 
 		pmu_system_controller: system-controller@10460000 {
-			compatible = "samsung,exynos7-pmu", "syscon";
+			compatible = "samsung,exynosautov9-pmu",
+				     "samsung,exynos7-pmu", "syscon";
 			reg = <0x10460000 0x10000>;
 
 			reboot: syscon-reboot {
-- 
2.34.1

