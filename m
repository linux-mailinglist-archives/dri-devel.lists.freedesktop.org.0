Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F094F86778A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 15:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CB510F1D5;
	Mon, 26 Feb 2024 14:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="c33SXV5C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D8B10F1D5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:02:33 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2d2305589a2so45017781fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 06:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956151; x=1709560951;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Fr6qUv7uphl0F7A/cjSpLzFAuez52U6vdxnRSxFG1Us=;
 b=c33SXV5CxcC9D7Pb/sip0Anj807AD5yVfPDb6XlSka3orhOuqbaHUH/nKrd6WhROUp
 fF05zxkCchJc5HEBAlQP512XMkks9cUzvmh3K8UTV72btzTC9z05p6M4qRE5/uIcIST3
 4a5otmF+DA5r+cw01VaCVQPLH8jZfQi1FOYViPGkYew7qR4RqjpHXbd+J9XJfe8Nm6Bh
 2XrXm7kyZxYZUc9RgOK+SJpImZb5HtPJk68fNnCZd9QaC/yAhprcIeTG8noDXbsG7+hT
 QivtOldH1eEREHTQRAnmbCQvhTjDKCAmegPFomLWIXYgPDLiLUO7BiIAWafHq02kEgMy
 rXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708956151; x=1709560951;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fr6qUv7uphl0F7A/cjSpLzFAuez52U6vdxnRSxFG1Us=;
 b=V72Huq52xkyRZXXqp0trytv/j2vkAwWzJtfTihAzfCCzwMKFIqfM40MStRaa55icFt
 +KObGhgCc2hENQBtxeBzB+Hk8aUGP7ElaElGTLHO9wmnvmR7cHYG+Sc0OShSubt7ehOR
 jd+2AbD5G9VJhk5HAS4+6WRyFmzOFYdIlrmm+Opc6DZ39Wy58+jxbYlf5rMIesQ5E/5/
 Dm9wdJVMpWWmtsUaLjV/054an+LPUPfYkUwxD0U1/A8eHHSiu1XT9XbL1oZuRaaYcVvw
 6meV72QIpkkqjH6/Rob2oI1gRx9m7QZQ1KlSlsgaE4jdAE8I+MB9/xJ66Do16Sut5bDf
 xOiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhJiGIr1pcdw8nEC3hq/tKe8oHDOsbhjhndX+FGArKhPvnnD1nzhU/aXPqfxY1EYq3WJM7qISPh5gclSc9c55PjpaI/PbDBebXPl6xSIFH
X-Gm-Message-State: AOJu0YxjhMK5zqyMR7c7f5pK5aOu4kkmbtpWsNy6rO5sJCLLBHqLPuWZ
 IfZGgvBs0hFKKQi6usk5rnIfE5tgowk3psWIGXKwqiklloWDEMx0QXo1fkdpeac=
X-Google-Smtp-Source: AGHT+IFoh8mPmzGM/gZj9w5NAeFQXI6f6EQmCodyO1Vvv8vUKUQrRRqnf2VVbDW26mV1+6aMSpo47A==
X-Received: by 2002:a05:651c:10d1:b0:2d2:2012:1fef with SMTP id
 l17-20020a05651c10d100b002d220121fefmr3638929ljn.47.1708956151700; 
 Mon, 26 Feb 2024 06:02:31 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 06:02:31 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:56 +0100
Subject: [PATCH 18/18] arm64: dts: mediatek: add audio support for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v1-18-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3858; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=lbgi9OL1obZblEePDIhhejeSSwFTqveCSkacaUUqnXE=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3Jnd+w8IF/0MoA24p+dI4JyZDGShEkMctxqnmZ3g
 z3OxK12JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3QAKCRArRkmdfjHURa4QD/
 95NpJWGzTF7i0U4jGIRjRkcN2D4J42NZKCYbftZ8a5Q4MTVuwCbkEMdy8eOB36kpxWTlq61VxNUsug
 lAentcdEWSrZEUsczLGt82lKlMdaKuOrVM3RBz+D/4DCgIzuNqw5RtyRK+D9US6UOjV6bAYg+VOCmr
 E2VvHOXer0VlRm/v1bpjTxH+OXtA8ztKcQFPeK4LFGLDGqSCYnMCT7v0eCZ+Mya9vw7drZY5Eibu/6
 5q8nT8GIe5kFdPwaq64D3uV9hsu59MccdcThnyJqTGqYuEn4C1DN+9rkcT22e5Bp1YS7y7juyj6C04
 DDOXMgU2bl6P9Lpe7uCpyZPOFb6y7cbRw5YzZPYxONpskn1hFV1XqaalcwBTKgeQWdSZZhU1zLosan
 j5qZDHkmN6ipbd0We4rQJg512ny8X13q9fH1AbBW85bZLMwOM2cPOA0or/BdWx0CFzyBAuhz+Yikry
 8OmWIr07732ikrI661VIF8Pj2ZLa1ryWzMjooj5Y/b8OppHDB1LidcNyTHsVKBep5fdn8yiHYYO3j6
 mk7lsczgK/oSLH5NTGz1sViSOvZoYwm2PC2HrHzMCikiFlcqL65mnGQ4Nnr1EqwRfQWlmJadgvAia+
 nixt2u4SvthnmJAfycBFbOcGNz/PTqn0gR2UBZ3nNGyog9K0HoQ5yCYLsjTg==
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

Add the sound node which is linked to the MT8365 SoC AFE and
the MT6357 audio codec.

Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 95 +++++++++++++++++++++++++++--
 1 file changed, 91 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 50cbaefa1a99..818a8d263949 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2021-2022 BayLibre, SAS.
- * Authors:
- * Fabien Parent <fparent@baylibre.com>
- * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Copyright (c) 2024 BayLibre, SAS.
+ * Authors: Fabien Parent <fparent@baylibre.com>
+ *	    Bernhard Rosenkränzer <bero@baylibre.com>
+ *	    Alexandre Mergnat <amergnat@baylibre.com>
  */
 
 /dts-v1/;
@@ -86,6 +86,25 @@ optee_reserved: optee@43200000 {
 			reg = <0 0x43200000 0 0x00c00000>;
 		};
 	};
+
+	sound: sound {
+		compatible = "mediatek,mt8365-mt6357";
+		mediatek,platform = <&afe>;
+		pinctrl-names = "aud_default",
+			"aud_dmic",
+			"aud_miso_off",
+			"aud_miso_on",
+			"aud_mosi_off",
+			"aud_mosi_on";
+		pinctrl-0 = <&aud_default_pins>;
+		pinctrl-1 = <&aud_dmic_pins>;
+		pinctrl-2 = <&aud_miso_off_pins>;
+		pinctrl-3 = <&aud_miso_on_pins>;
+		pinctrl-4 = <&aud_mosi_off_pins>;
+		pinctrl-5 = <&aud_mosi_on_pins>;
+		vaud28-supply = <&mt6357_vaud28_reg>;
+		status = "okay";
+	};
 };
 
 &cpu0 {
@@ -181,6 +200,67 @@ &mt6357_pmic {
 };
 
 &pio {
+	aud_default_pins: audiodefault-pins {
+		pins {
+		pinmux = <MT8365_PIN_72_CMDAT4__FUNC_I2S3_BCK>,
+			 <MT8365_PIN_73_CMDAT5__FUNC_I2S3_LRCK>,
+			 <MT8365_PIN_74_CMDAT6__FUNC_I2S3_MCK>,
+			 <MT8365_PIN_75_CMDAT7__FUNC_I2S3_DO>;
+		};
+	};
+
+	aud_dmic_pins: audiodmic-pins {
+		pins {
+		pinmux = <MT8365_PIN_117_DMIC0_CLK__FUNC_DMIC0_CLK>,
+			 <MT8365_PIN_118_DMIC0_DAT0__FUNC_DMIC0_DAT0>,
+			 <MT8365_PIN_119_DMIC0_DAT1__FUNC_DMIC0_DAT1>;
+		};
+	};
+
+	aud_miso_off_pins: misooff-pins {
+		pins {
+		pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_GPIO53>,
+			 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_GPIO54>,
+			 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_GPIO55>,
+			 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_GPIO56>;
+		input-enable;
+		bias-pull-down;
+		drive-strength = <MTK_DRIVE_2mA>;
+		};
+	};
+
+	aud_miso_on_pins: misoon-pins {
+		pins {
+		pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_AUD_CLK_MISO>,
+			 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_AUD_SYNC_MISO>,
+			 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_AUD_DAT_MISO0>,
+			 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_AUD_DAT_MISO1>;
+		drive-strength = <MTK_DRIVE_6mA>;
+		};
+	};
+
+	aud_mosi_off_pins: mosioff-pins {
+		pins {
+		pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_GPIO49>,
+			 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_GPIO50>,
+			 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_GPIO51>,
+			 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_GPIO52>;
+		input-enable;
+		bias-pull-down;
+		drive-strength = <MTK_DRIVE_2mA>;
+		};
+	};
+
+	aud_mosi_on_pins: mosion-pins {
+		pins {
+		pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_AUD_CLK_MOSI>,
+			 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_AUD_SYNC_MOSI>,
+			 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_AUD_DAT_MOSI0>,
+			 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_AUD_DAT_MOSI1>;
+		drive-strength = <MTK_DRIVE_6mA>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;
@@ -416,3 +496,10 @@ &uart2 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&afe {
+	mediatek,dmic-iir-on;
+	mediatek,dmic-irr-mode = <5>;
+	mediatek,dmic-two-wire-mode;
+	status = "okay";
+};

-- 
2.25.1

