Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1369084BB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DD310EC5D;
	Fri, 14 Jun 2024 07:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FlDfqOTo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F43D10EC5D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 07:28:04 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-354b722fe81so1707502f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 00:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350082; x=1718954882;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oRRchkIC57qyetE79hyrVGiSg7IXb/wKWZgHcEASk/8=;
 b=FlDfqOToqH4PpcpJC5oMB1i3XAneTqzr/1dj5ozwx1gPhRgBr0hJ2ooxJu92o9O8f2
 sfvqnTKurWIxBL1qUg3A2M5j9JGAu6PZfR1fMUgi9IL+sUGa0zinwShK78MouNHwoo7P
 EDaKZiqvz64LquXzteq5lSAgsj7Npi7tk4Vdb0chSvPr93BYOXYbWBrrRNpDYj2fsjz0
 9p+lWWja0y19aBpLiZm+bN590Rgrq1CpuOadEXq4TQ2N/o6pdgepitoURwMNEDFHp60k
 ZLrE1a42Uk1VWYWtaSZ1XqtcQR2lwx297gvz7ABAZTMnrTBz0JO/lp9LWYaYOOutNT9J
 KyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718350082; x=1718954882;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oRRchkIC57qyetE79hyrVGiSg7IXb/wKWZgHcEASk/8=;
 b=EmQbZFE0gQW0J4t3gVt9nZwcdmARMWUAOJKwhE2LkKYKAQ6FnaR6+Dtx3TuuHWh/j1
 IbAPooDVHnJfThv1vaWsmRR7AXxrviyUJIU0VBNPazRJoVSIWPQ8KGViRhRylmiVmdhn
 0zVWYsuSGCnT9puqNTtECNmAohcCCE36wHfXVSmS/rNjDhKpTbSELF2sWdB2K0tSszZ0
 +2fxu17LUkyVjywDUhm72bgTcPsVds/z2AWrjyDGhQ4BGEqJ7Q+eyHvJGaF70XuUh30+
 ULtXAamyhhG/cdaNhrt+HLPtFj5xZtkm+4dn4/bL3PPp8s3AToS36PF1xE7pqXlxdZi+
 6oOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCViDPqwKch1pMeEkITfUImcQtKgs2+X3dZHjwwSW/+wzrUWDEqjuXKld6e1Botyma6rfL8AQ9Fl4/H3F4nd3C6JqRZFSXwgPJM2LRBt+rJJ
X-Gm-Message-State: AOJu0Yyx7gYukWyRzMyBidVfBseMXkAxqT+OkMq7aw68uDhEX/XCWXGZ
 /cgS/dVKjT21HvZK+aJFBpQDqcYXfd24gjDbYlvPGS3fDEbJ7nCRB6/sW1OZSCU=
X-Google-Smtp-Source: AGHT+IHQjcQoHjXlNLsKpWPr6mfqI+yT8cy4ddzNpJPAn64e9KFwbXVFkynWSZPbAcSrR/N0H6r0cw==
X-Received: by 2002:adf:fc82:0:b0:360:79d4:b098 with SMTP id
 ffacd0b85a97d-3607a76609emr1053423f8f.29.1718350082416; 
 Fri, 14 Jun 2024 00:28:02 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 00:28:01 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:44 +0200
Subject: [PATCH RESEND v5 01/16] ASoC: dt-bindings: mediatek,mt8365-afe:
 Add audio afe document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-1-54827318b453@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4635; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=wGHr7LXYjI0zdZuoQSWBZeA6hdla39Tj9ahiPZjJ+yQ=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D+teoDf8J1wcv/7bJFtF7tuUz64CToYXRQnC6s
 1UNQx0WJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/gAKCRArRkmdfjHURSB6D/
 9rd52WnsoveOv2MK12j+IPradJM041eRc76MBEKty5aWjTxVHDzohmEPTJ/xT3SBxufuEbZ9rvrJnx
 XhSFitkx5+O3OlOEBno2HEvjUSZnFD0SC05Ks9gfNeZ3ugLtrJGteH39GPcJ63es8KG4aQpVim25cB
 CTLbWeLXZi99x6cxXYxp2HwUYNyddkJIPyKCl49u5nIGQTXFqHl/lw/BIjqRPZyvzLhIixGJWsnXnJ
 XngMUpiIl5X3SiESdH+Sd1CmPYZCZtpdj9PS5BCXO61Qte8ES0DPxfLYT+pMspK+EBZwosK/hZdew1
 s4EXTDRTIUvWVk+MBLybwbeHQJ4itgm8inPtIYVx1QN36q/eOFWhc1WVq+GXuuYQRoK0He7ekWC1Bk
 fHHiPaHu0LPT8Klkm6gY6IgrC78PXbKzaTXdcdfP5/qPyoDLeaR2XiVo6vImAi/lAMrQK8fW9374za
 EsCupuWgrqY6yUcgf4/4ZTwqDDXi24EFsfxYt1z9v8TEUcop0NMzn3RuPkIrFEOiRzaLcpgkboVsEx
 meuHXgpNgq3NGF+D/ypko8aQQCKmIY65iFNXZhbeMgsH1ZXAO6evA1HRMSlX4PEHGLw6b9odP1LlkA
 2GVUrbM5KYpL36kuamSVQWuWsfjPHcm1BP62x770/vwr7CIwzMsWJukAzrjg==
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

Add MT8365 audio front-end bindings

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/sound/mediatek,mt8365-afe.yaml        | 130 +++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
new file mode 100644
index 000000000000..45ad56d37234
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8365-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Audio Front End PCM controller for MT8365
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8365-afe-pcm
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: 26M clock
+      - description: mux for audio clock
+      - description: audio i2s0 mck
+      - description: audio i2s1 mck
+      - description: audio i2s2 mck
+      - description: audio i2s3 mck
+      - description: engen 1 clock
+      - description: engen 2 clock
+      - description: audio 1 clock
+      - description: audio 2 clock
+      - description: mux for i2s0
+      - description: mux for i2s1
+      - description: mux for i2s2
+      - description: mux for i2s3
+
+  clock-names:
+    items:
+      - const: top_clk26m_clk
+      - const: top_audio_sel
+      - const: audio_i2s0_m
+      - const: audio_i2s1_m
+      - const: audio_i2s2_m
+      - const: audio_i2s3_m
+      - const: engen1
+      - const: engen2
+      - const: aud1
+      - const: aud2
+      - const: i2s0_m_sel
+      - const: i2s1_m_sel
+      - const: i2s2_m_sel
+      - const: i2s3_m_sel
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  mediatek,dmic-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Indicates how many data pins are used to transmit two channels of PDM
+      signal. 1 means two wires, 0 means one wire. Default value is 0.
+    enum:
+      - 0 # one wire
+      - 1 # two wires
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mediatek,mt8365-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        audio-controller@11220000 {
+            compatible = "mediatek,mt8365-afe-pcm";
+            reg = <0 0x11220000 0 0x1000>;
+            #sound-dai-cells = <0>;
+            clocks = <&clk26m>,
+                     <&topckgen CLK_TOP_AUDIO_SEL>,
+                     <&topckgen CLK_TOP_AUD_I2S0_M>,
+                     <&topckgen CLK_TOP_AUD_I2S1_M>,
+                     <&topckgen CLK_TOP_AUD_I2S2_M>,
+                     <&topckgen CLK_TOP_AUD_I2S3_M>,
+                     <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
+                     <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
+                     <&topckgen CLK_TOP_AUD_1_SEL>,
+                     <&topckgen CLK_TOP_AUD_2_SEL>,
+                     <&topckgen CLK_TOP_APLL_I2S0_SEL>,
+                     <&topckgen CLK_TOP_APLL_I2S1_SEL>,
+                     <&topckgen CLK_TOP_APLL_I2S2_SEL>,
+                     <&topckgen CLK_TOP_APLL_I2S3_SEL>;
+            clock-names = "top_clk26m_clk",
+                          "top_audio_sel",
+                          "audio_i2s0_m",
+                          "audio_i2s1_m",
+                          "audio_i2s2_m",
+                          "audio_i2s3_m",
+                          "engen1",
+                          "engen2",
+                          "aud1",
+                          "aud2",
+                          "i2s0_m_sel",
+                          "i2s1_m_sel",
+                          "i2s2_m_sel",
+                          "i2s3_m_sel";
+            interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8365_POWER_DOMAIN_AUDIO>;
+            mediatek,dmic-mode = <1>;
+        };
+    };
+
+...

-- 
2.25.1

