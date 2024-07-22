Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84A8938922
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 08:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F51D10E380;
	Mon, 22 Jul 2024 06:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="n4sqpTj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF67010E37D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 06:53:40 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5a1337cfbb5so3279980a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2024 23:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721631219; x=1722236019;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oFgfVYXqfttnG8T9cixZ5XkV74OKDwZYpy7meDYMP0M=;
 b=n4sqpTj/VjjRfvDYvX45Iyh64xv1ei+mgJ6prkNKcGR+T7yuFQzdnIkArSy9SRC2sq
 KvEFnfHqO5bn6VdpjY4T/D6gkpkavW6ePs2KA23bN/m8m97yQY/0YTj0CbXCIpEiCLmL
 4IREq4MmBw7JTaZPwGvPwlqrr5KXV424HyFF4ovUdKzDoraxZMP10wrqGCKg+GZJ0bQd
 DBh6qUZL8r/pxRiW+OzFwkamqJqCgXpUv7jmY+JQNS9I0dahAQYhskDbmW1fud1hV3mE
 NXo5q2O06oakdSMdK5Cw4Jh/w878n5wGGGY0eq1OEKzMpOFby/+lNY+NT+0Z6AmDidTe
 9vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721631219; x=1722236019;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oFgfVYXqfttnG8T9cixZ5XkV74OKDwZYpy7meDYMP0M=;
 b=cGE+8D6S8n8d/qJxZ6AD+DxDETV0kTB1ZhUqy69QxHBfxZd91uRZBWE/UCY+Iz4rAA
 1MQAA5nIdTAwzHEh5UujT0K60r7ARYdM1PmTEBi2+jZ91iE3U5GzqtFzy8MEj/rg+aGS
 tYRQ9HcW9dEhalnsjH02L8tuq1NNt1IAMjpOfz0CREB9E51HscAXwcIldfLDQG0g6LKf
 vXUbZhN7Mlfj68gH002kEhw+YYk1n+GXGl9nggGGCT2Tb2WWapumxsXp6+jMYwUUvsX0
 BPizG+AMDt802nkn9gKRIdnIumnG4PoLTu4iEUSL0yvUgfcRySA+zoVunqY891vk7Lrg
 OizA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeadOuL3odFdnjFw/PQ0UCGeC3m3JIEwd86/6C0vc7ULcc1ZR7/XCNvtCEONjTVMSjWhJio7CIvHkOpisfLk1kCP5iodsSohhA5v3YbNhV
X-Gm-Message-State: AOJu0YzQfbVvCR30whwcgiFNPUO7ctp2ZN+BBOMwRB07Cb9fV7d7+eut
 H9Gyxb8Qhr+UHliBtpvMX0QxMri6qe8uuMwHkzTCCWBFhFMNrmVcCh8+FeOornU=
X-Google-Smtp-Source: AGHT+IEHhb46ND7/HhCRLyD1pbb5Rh9Z6wHgmKMjc9iBHjznZYxhxWAQKWtm5tYoeiTXtFRODEMTHQ==
X-Received: by 2002:a50:8d5d:0:b0:57c:aab2:7311 with SMTP id
 4fb4d7f45d1cf-5a47afeeba0mr3651422a12.29.1721631219073; 
 Sun, 21 Jul 2024 23:53:39 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5a69c1f56a0sm1982126a12.64.2024.07.21.23.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 23:53:38 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 22 Jul 2024 08:53:30 +0200
Subject: [PATCH v7 01/16] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v7-1-6518d953a141@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
In-Reply-To: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4718; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=WVoFkdQ/0FpyCHJrAYCh9k+mXMPqgGmWwmumiaugOMk=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmngHwLFngyxrL87eubthRMEqrtmcE1ra3B84beWYU
 Eri93AGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZp4B8AAKCRArRkmdfjHURS/CD/
 oDx9+6WwfdVuAjAhMk9XEl5/6hq57sC3wCa8K21WCsz3j0Bn5g1p20Imc2X8RFLTqj7h1ejQFuKKOD
 5WINTAUzzVO6+n16PxA1zplZ3NczbUGNydCHr+tcfFFqueKMcB+sZUSlOyOSS5yI4ZWFZVUmu9hnT4
 ilG3dMrRal8FnM5i9BiT7450UmAiKczmqFP6HenNMdO4LzmpU9cNVbO1uOIzwHUvdMMo9qg2jH8Xcd
 z/ELx2LTV9/oNJBRlUnLGEe56LXgdKSspAKCIN1esDRLF3tppTjyiKh+92xr95hf9Z2R/PfzK7jAUb
 m+6lW1QSE0Kbh8GXQCwUN29Qmt1QB/mx/5R5mscTnPlnILOXkVbNjTWKjYdfMP5nZI69Kc5WYy6igB
 Q/CunFmsGxll1xLdJrzHHHc4MmPVCgzgJb1oJfcG9M4fBjUeKbYUbt6I3cWAzx9KKKMx3BhilGhfhK
 6nAnYvz7+nJsV86dZorH0GwkHhWCoivHVji3mjQ4rTwsp9C2HshZaSZ/QdH+eXL4wuROoTIGbjGReP
 gVIT9JiHerwKGyJdixa30ZotEJKq6UjUJnyhP7yvHTz60qGXGX2xBCraJo2yvAoZ0sTtYfgbBMp4uG
 AfZjWRpbXY/FlAR8k/h4+yPpSmRwkK49LBFcCvTQVE+dfp2RlDZXkZCGD4oA==
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

