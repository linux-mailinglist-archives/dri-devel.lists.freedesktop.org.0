Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F083489D681
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A313112C67;
	Tue,  9 Apr 2024 10:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TeMqbx7e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F21B112C69
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:14:08 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d8743ecebdso34503261fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 03:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657647; x=1713262447;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qhS125P+ZQHHlpX+fCGmsJ3MAcYkFtKGP8FooRfGuHY=;
 b=TeMqbx7epUBvLcwdC3RgnBYZptLP7TNGqiW7/umb1Y3vb+ny5GRantKC/OvIcqOcJq
 mTTHcrwGb4iWMPSfGkiwXylKhXVZ9WbDQMhJpvboeAEeVH9wgjR1vcymuWU900WhJaFb
 4sdERDthtVyk8alR72L/bPu5isKTNdgwN8TxW7TPaZ/vhPA814JFr0TZwY529KaGaHTt
 7AXciDxSY+PuoXTVw7hUA25WAT6aOkhmoDh+Q/LdzAGHmiz2f1rXjotI6GTSeT4JzQEv
 wPD3muEQuKZOWja2TZkDkpAFt+rbzJK3P7C9x2QBsCzZ8axZD8jHRFLMqDv7nqn/62cH
 zYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712657647; x=1713262447;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhS125P+ZQHHlpX+fCGmsJ3MAcYkFtKGP8FooRfGuHY=;
 b=UrxfGw6TW1pT90YBdItKrJO1+/ZGpai4U/qpfbVzPCUFdDwJi69vnwi4Q5+RfT16hx
 IxKGL9loE5IUXQz7UZX6Q6Mio752JduaR8U6cXLxuN1+T8BiIXndtjFdKgmOdPEMXOte
 oww23GRG8Y1MTyTC0tEJ8Wx4/ELxpTy7KhHED5GTwWbLlOW+9IQ2ef1XyXFKLe3VfK7x
 w6k89NgpYCba3bH1ktfW/VjQbTiV/l43FvaNn/ouqro1nqsDqux/Zn0rkEr21EqcKhxS
 zVJwwFyaFWi1xorjJM29Kx7ad9c4j2IhdzyXKRvIARHJW73o9LIN8q4ckzzqkENQ9Ope
 tr0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwQsI9kK1EvQ9HpC6wAaYvh6MQ1z1qF2OEUQuYgbjXzTUW9KviTCMhX509cl5mfRHX8ZvGL39Kp5euyRkoRqYHolFK3cZNLTQHJyHiXZ1e
X-Gm-Message-State: AOJu0YwUqov++Du/T10bKbMG4RceH95jwqiXwn6z51eoE/ERdIkfkKe5
 w5xc2JB7iNlPBzYL0Tgc71U5CO13sgBqKdLJHXAnaRSoeCsDsMukCwPDAk4+080=
X-Google-Smtp-Source: AGHT+IFF17tHptZ9yy6IboRmSrKnC6vMAvTQkGkS1sBkZY8PuDxFonOZnqVYYrkMq5Oo47sHNuMP1w==
X-Received: by 2002:a2e:888f:0:b0:2d6:cd05:1890 with SMTP id
 k15-20020a2e888f000000b002d6cd051890mr8048170lji.0.1712657646820; 
 Tue, 09 Apr 2024 03:14:06 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 03:14:06 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:38 +0200
Subject: [PATCH v2 17/18] arm64: dts: mediatek: add afe support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v2-17-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2480; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=OGw78hpGmJopJetuhUNzzTWlhmL6j3P+xSZHkHfTIPw=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTTEUNfu/l/RVmmFfvIfx7YUtVHj60bjRZ75BE3
 zH4QqnqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURTusEA
 CtYibBPzDz7hlWPn5zSwhUIaHtQ40nqsNB9rX8kXiBuFjqyqRdaTX4wbJqkHHUGFeEEJR4qJpOPE4s
 s1FqxsB0qzQrHAyMk4ZL5Zbs7M7n+hNutLNMbnpckX7/CNf1knNSHZ+/HO0FyXueP0/j+fvp0DOGA2
 3KFSEW84DMto/lKOKx0d4axfVmzoAwVOXBjYM2hV3R4dVnQuSD6HhkzazzXFiGC6FUZq9pEyqdfqoj
 Wwy/zAD75w/a34+bPUxNBah8QclxBSI6/49cY4mROW/i60I0VaVqhwNNFUG34tetH2lCVcd9bPEgdp
 G0ZfQDDFaFxdmma+3rgRvL8eOY+6XaB/bsS83DCgUAaXQL8dvaGn7G4VwzU1NsFeMcEwPZJwUClZRl
 tqi6Gr4zpFdzLqpSYvfp+G3rKzC4e/Aa+8JnPnRCAmTWpGvvHBlRZKuHMTB0d3hJ4Dhw7rkQ3BFYEv
 uTAsJEtd6pHT1ZT4/ib+Yu26zW6fqmbQUJuAadg+77yDN0cn8zLzkefbEHPccxQ7xfuc9knTbAVqbX
 Vo2VfjkeOfce2+Z5kOh8cpVi0QGNKKJow+sy2J0CKGevUYP4J9PSZs05Njy0DiRECnXCNiYizvMc5h
 C9ZwmafDd+g+rjVce2iRRt/FLjXkkjRlYZcm8ti8E+bZaGuMrTs2t2MUmc+A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

Add audio front end support of MT8365 SoC.
Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 46 +++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..0bb6f6388bb8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -1,10 +1,12 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * (C) 2018 MediaTek Inc.
- * Copyright (C) 2022 BayLibre SAS
- * Fabien Parent <fparent@baylibre.com>
- * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Copyright (C) 2024 BayLibre SAS
+ * Authors: Fabien Parent <fparent@baylibre.com>
+ *	    Bernhard Rosenkränzer <bero@baylibre.com>
+ *	    Alexandre Mergnat <amergnat@baylibre.com>
  */
+
 #include <dt-bindings/clock/mediatek,mt8365-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -813,6 +815,44 @@ apu: syscon@19020000 {
 			reg = <0 0x19020000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		afe: audio-controller@11220000 {
+			compatible = "mediatek,mt8365-afe-pcm";
+			reg = <0 0x11220000 0 0x1000>;
+			#sound-dai-cells = <0>;
+			clocks = <&clk26m>,
+				 <&topckgen CLK_TOP_AUDIO_SEL>,
+				 <&topckgen CLK_TOP_AUD_I2S0_M>,
+				 <&topckgen CLK_TOP_AUD_I2S1_M>,
+				 <&topckgen CLK_TOP_AUD_I2S2_M>,
+				 <&topckgen CLK_TOP_AUD_I2S3_M>,
+				 <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
+				 <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
+				 <&topckgen CLK_TOP_AUD_1_SEL>,
+				 <&topckgen CLK_TOP_AUD_2_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S0_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S1_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S2_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S3_SEL>;
+			clock-names = "top_clk26m_clk",
+				      "top_audio_sel",
+				      "audio_i2s0_m",
+				      "audio_i2s1_m",
+				      "audio_i2s2_m",
+				      "audio_i2s3_m",
+				      "engen1",
+				      "engen2",
+				      "aud1",
+				      "aud2",
+				      "i2s0_m_sel",
+				      "i2s1_m_sel",
+				      "i2s2_m_sel",
+				      "i2s3_m_sel";
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_AUDIO>;
+			mediatek,topckgen = <&topckgen>;
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.25.1

