Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B919690F114
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9990710ECF4;
	Wed, 19 Jun 2024 14:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NLvbqw1d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422FE10ECEA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:47:13 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a6fb696d2d8so76350166b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808431; x=1719413231;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xKdTgT3KsHBdg4+GhO78bEt6cew1IEq5DPVjepzwO8s=;
 b=NLvbqw1d7uU5Ri/eGoW3cz0M5ejXU2uCohET8lFLTkrqf3M8npfm0uU8ivlCFKsSJC
 fX1cNhK+tsGFWAjbWjaR0Dhp9cUuAfINpgGX1DMNlLyoKLfaXJTSD1Bj2/gRBaKu13KP
 65mEZktCXZjylZf7t8mj3AJJCiELM/Ht8RMe9gJPn78gzKxzZMqAMOgSFXUG9WRrI67K
 TtrTJO6ot3/G/wXGn3xODh8vdCaObI5H5795oGgfIpMQBBfqOqZUxSbIh8KRzjjJ7DSn
 Cbm+n5tKblXJv5AXS4h6UQJJgybu5fPW98PhYbeuaJ5Z7mfC3JmPyscrA68i+Q2UNikM
 aK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718808431; x=1719413231;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xKdTgT3KsHBdg4+GhO78bEt6cew1IEq5DPVjepzwO8s=;
 b=ZGqEoEZakVcGuAsh4o5WtumI2XnsGkMjzpQB48ofUCxItb8xzASgk5/GGMoNWrGYAM
 laQkObvGgKNvcUKDqNuUEu87/hVAPwii748HziYhg+5S+99fQNVFc8Zte0iAhpwXwIr2
 plj/Qm9K/la3BotgiTceWOZOVDr9QNf84V9R6b0tKGSpZD3zHjvxso3E/fmn52II17CU
 OntWEuw7FAGtJ6OEB3lyVLlpzc/EbyPhFeUKNP5U5uBwU8Xc1MY8RBZQ57pJM0ARRvvF
 lPsAOAEI+1l+IVF50u9E3puhwd1G/dbWcPvLE6QDV5LWEXrlCIIIxNaYbLIG7EWeMNZ+
 XQNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3nmTULVJ4nGcGRu+qAU/cle4EEoXp3HtPfxENht23VHkT/pAlZ4jonT4bH1eafnYxezsQA8x3hxATTM2dgyg6CN2hCfJgoJk2EE3Qw9n9
X-Gm-Message-State: AOJu0YwKQFRLAyZuM9suSjLGOlHshAyiLYD4sxxohXMDggz0Augp0FZW
 P7Xtd+jINq64FUdzla44bRHTUqmDCPQzFUPpExoUrd18WSGO2c4+Shf5t8HGwLw=
X-Google-Smtp-Source: AGHT+IGCnG2pTThkiqXcOingw3RqWOz7QhNzIa0SDzL44Gp2GhFVFafYQMJmYo6Mrn8IERzv8AqDuw==
X-Received: by 2002:a17:906:d83:b0:a65:7643:3849 with SMTP id
 a640c23a62f3a-a6fab7d6be4mr159683266b.73.1718808431514; 
 Wed, 19 Jun 2024 07:47:11 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:47:11 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:51 +0200
Subject: [PATCH v6 15/16] arm64: dts: mediatek: add afe support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v6-15-f754ec1a7634@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
In-Reply-To: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2440; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=L/X5S7kQaZX7wsv4CHwCmLD31FcTik1b6cbELb3AlwY=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9RsrsWB/A8n6NS3M+CUIPC+mnw1CAbYx2HRgfv
 OENvgSeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUQAKCRArRkmdfjHURaw8EA
 CwGU/+3mpi2Q0d7lCiclbZACS5EVpIo5IgyXdSHKCpRs+IiYvjKxgWgF/DnPc62N7OGq9430yeOgGw
 h5PYZvPfVYyOecw8V8eFqsQiEsM8TvNr3PNEAuUkhyuR2sHHMr1+cFVV85CWvBr8VzSKjZxvGAmD+U
 poWAWbKgQTAk4UIfRs00WeveAZH7lfauSf6mMlpehCSxod4uioKGnTiPe5wB8b9yH2M7b61HolsxfG
 J1a1+W0W3hMcglFE2qtKyV5HRpX0o4adOCf8HRN+nC4/GXAeFDd9b1l3vMQyCazPJk5iLBVzFcWpgk
 MbjoDMwfm4FLePT3kZcUF009fClCG6GRuTGOuCRF9WyPf1nP/xqQ7WZD5X87D0vPBE+8vgQHjDoHjD
 RrtfDTdCP0+hYoPgL/T3v8sZRSxrz6hKLc+dX3N64SR1Ymv/q/rVHUofaj99w5AhG8TiTT7ouZnOCX
 WyH0iurf7yuoiRc2fHGAcBLLAT8+1ZaCqLW75z7H+boYKXwIDhXoeP0LQjwg+ZXMzi6FmHwQy/vr91
 kPBEmog0hNFXqGQg1pDWW8BQNtnGpK26p2Mh55weXm4UZ27qkLtuVMZhpEKIbngPdsIOURwnAxOoQz
 v7SL2Hk16lcpt3XFLcRPGclHZtuCBw3WTbFycbXVtYnVp8TzF7oCjMCpaizQ==
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

