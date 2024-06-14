Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5E79084CA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B653B10EC68;
	Fri, 14 Jun 2024 07:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PePynt8U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF5C10EC6A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 07:28:26 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52bc3130ae6so2104887e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 00:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350104; x=1718954904;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=;
 b=PePynt8UFkyA4yiIH/tZnQiOZhv7Uz0ycnc8cQfTNrk9twwOGAQbTYBjkKoRSIzrj7
 bKw7mvlXvIciDJkLCnKT0lEEDX1XvEevMOkNnz/QaNpOb7KbaY1BT8YvVkvK4C55AFsc
 KQZWcMvec7quGQIwwowvPM8NpFwvMwSr98tVwm+aoIhW4pTWIIHTO9GuXIf60CSEU7rX
 Zv3KqHP4/58HtmC0XnzDdTNClEhddIKcmkZjGMRrJwvGXvoCqY6Y/nLObOGs1Qnqrh6x
 ckh6ZXZ6bvhY4tfGWiRu8lWGJgLLrIsVi93AdD06wmCWMsqMR0imK4EpDFuJIVy1IIcp
 RFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718350104; x=1718954904;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=;
 b=CDmKB6VP+cFUgk/VPWd9yPWfA+P3BfNPcRnRBpqKxwkFBMDvgrpY8QKraus1UBWisZ
 7ZoexuR1wgdGh6ZujkwvM+loG15n2ERnWBR0v2P24pnoLKB7/UhgIr3MFDL8dK/Fk2aR
 MsQcgAAtGOJgXPHWd4ShD4oevDdNxfzJ/7x8pKBlxSgtWMl5V7rj+aXsNIW0gHbH0bi3
 49UXmA5VE5hNbapuRHb+WibvaSiuBtYNRx6IsLu6HDjq8I5TCWkZCwPpsVAZrRATom7D
 hNvhXWpI6AcUuUyJtsZC55c1eBdU+30VWBhkBc1kLFD0+UvpOhDIXZUcaqiYinlzlyW5
 tf9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsDraYsNb1ciJxwYK/Ll1Ml2+ADTvo8oBkDsIcZbnn27h6GUSGKMxJDwXgyvL8lXJaJlyPxXZPTBYdgU9yjEjiSYEmoL/Ypc6WlrDpN83j
X-Gm-Message-State: AOJu0Yz2qlIAG8nScF+koB7r9S7KIk8x+jxw3rt20qobSI3OfdHZvu2C
 s5Mm/bLFMPWIyUVbBJFDE8eH6x0AtUMBUQGMM1BLtauCuN83htcyKAwS1DG5b0g=
X-Google-Smtp-Source: AGHT+IGnyuTyl004zNEknsuOkKnFWyFDczGzzd63f7Ew8B3WBH5+1B0Z8HM3W/isRBTFc2QhVm2A2A==
X-Received: by 2002:ac2:5613:0:b0:52b:c0af:6876 with SMTP id
 2adb3069b0e04-52ca6e987c7mr985960e87.60.1718350104243; 
 Fri, 14 Jun 2024 00:28:24 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 00:28:23 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:58 +0200
Subject: [PATCH RESEND v5 15/16] arm64: dts: mediatek: add afe support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v5-15-54827318b453@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
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
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=t0tf5ggyvEv3KEhg9dzpup8fwcOHLyJsYbfkqMonRjM=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D/A8g4JQKGf/bpZClCZkdFBg2gy1TwJe3EHB0N
 zfIyizqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/wAKCRArRkmdfjHURZMZD/
 0U4U3mFaqelf8+oXtjqp6va1E/hhZpK7ad8wAzeSFAimNE5m6rjbrFIu7WQxmMtYUVuFDL6tC5lkfn
 hfHWunT2Pm55GneefMiXpOuK5Zv+9UZfUrkfxXq2nav0GXUpR5J8cI4WM0p4nG/SWpSLXHEOicKOh6
 QCCocL43vKiNyk42G4exPFaShPNfylM8iMhD/c6iH93CcLR3eLYVtnV+UiVKWpPtoIxrpkUxyEpOPm
 Lfa0xZFWClVCEqz+9fH3rIQBGLnwk1qqtd3gYlnk9trSO/bZ5vtluK05KEFkynYi0/zU031UkDZkhI
 K9nGooP7It3JfUaSCCd2V8igTMoHyW4h0QvDYMcWrPu4/7xJoZh3lCtP4vO2sZrbv/mPHIwIeXC2Tv
 Lhha9ERXxtTlkNgPvARVW3MV5JEwYkrqm/J4yuWeqp9mtdUcr51CdbPkxXiGRRRBsksaz9ps0oclPk
 pY8i6w1QN2Q/a8wJntO6vDsRpd2I5evI+GIzzFc5p1dJmNK8hUCublsqjnDt/Gm7kZphssf1MDW4ej
 LtGVuS2jPtGoZPdM6rS0UTZRdqvV7SKdAuf/WDh9uRQ6Gmym3KDz09L3XzXSssFNsB1kPW9q/DnYWf
 Aeln75CpqX3eUtieL8n1LurXJjbM8MNkX6h1qMEA0lEw8JtRQUF4kZSwTVVQ==
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
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 43 ++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..0051d5613bcb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -2,9 +2,11 @@
 /*
  * (C) 2018 MediaTek Inc.
  * Copyright (C) 2022 BayLibre SAS
- * Fabien Parent <fparent@baylibre.com>
- * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Authors: Fabien Parent <fparent@baylibre.com>
+ *	    Bernhard Rosenkränzer <bero@baylibre.com>
+ *	    Alexandre Mergnat <amergnat@baylibre.com>
  */
+
 #include <dt-bindings/clock/mediatek,mt8365-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -813,6 +815,43 @@ apu: syscon@19020000 {
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
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.25.1

