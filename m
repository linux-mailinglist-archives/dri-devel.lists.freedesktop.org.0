Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F19E4ADF34
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 18:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585C110E8F3;
	Tue,  8 Feb 2022 17:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A9110E8F3
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:22 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D273240053
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644340760;
 bh=zKv8gauits5ukYdt+GlkU4SbbWKxjDr1UeNqiIb9Zls=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=hDLNF/Qxf1b2cK1gs+NRh4m0ckWJ7gPbb0eedZoLJd/wQKZ2aKP0uqab4SkRPTBxm
 zi7QAVcVRyDD0STYBxcNU1hsH6z6yLlDqs3l14DN24HF/EHKUpcRb+OvVTOyFwBRjg
 B1pYCfWlPZlaERtjn41rtpodoLq//nA4ucA+x8/etMOfuDv8S/6krW9/qHEvsyJF6w
 DbAGnK2NEj4gB3vOyIYTt+00+nK7lUkI3qiVg1jooyzdtQaK7gJrywrC1CAM+AI3Zt
 X/Cgf8Mi1uwA0pdag51FoNypkOArmv+MzlU3D55wegmCMwn4kUEEUSlv+u4rZawIlz
 rqkwoT9jKoqBg==
Received: by mail-ej1-f69.google.com with SMTP id
 ky6-20020a170907778600b0068e4bd99fd1so6042702ejc.15
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 09:19:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zKv8gauits5ukYdt+GlkU4SbbWKxjDr1UeNqiIb9Zls=;
 b=APhmOkoy+texbAzdqBXqaK/KETFjNq/CVar2fOAN1uneWAios2y3bARlt1XKNNDbf5
 2zDAwVXTUmEYaF8oD8LHg00c40LDo5K4v8N0jL4kEHVmDt6yrOyvfHpDEnPHKoA4s4th
 mXfUhP+ON93qfvOU+Y6An1Aylub7jACHx9qNhDDxkUHWBfNkLsSDqCbGadqRvTvtCoTK
 FLLA2Nn+Ep2YvboKHOdTS4iLAAqZ+qUnYEVEOTaU5eHxD1iA8kk4fbCZeIkiMERdsYno
 kAjnGJuAHGCSNccGOkWUw9/JdeB683rPevbPT5ATpPILqq+pQOJ7/2bYAfM/vnye+CuC
 kCrQ==
X-Gm-Message-State: AOAM531AiXSg9qvCwhhMt9vIILcjSM0wAhL+iJL5vdumw9aDI0Ip1ZU6
 801v8jukSa272+e4KlH4QP1AaulA57KAvWyFH/yHW1aTwC0UNtryROLft54kJdDx5KF11NXcpzv
 YY4TWd+Lmmm6i7rBHdG/TQivc3nnwR7BnyM9EkVp9sSN0Iw==
X-Received: by 2002:aa7:dc05:: with SMTP id b5mr5584298edu.197.1644340760490; 
 Tue, 08 Feb 2022 09:19:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5U/k25/8s1sueBd00X1rkGthbT4Ef9V6gRU6yCaSFNfPA93thayxH5pRQbpTCyNtcFU9hqQ==
X-Received: by 2002:aa7:dc05:: with SMTP id b5mr5584269edu.197.1644340760289; 
 Tue, 08 Feb 2022 09:19:20 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id r10sm5125550ejy.148.2022.02.08.09.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 09:19:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 07/10] dt-bindings: display: samsung,
 exynos-mixer: convert to dtschema
Date: Tue,  8 Feb 2022 18:18:20 +0100
Message-Id: <20220208171823.226211-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
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
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the Exynos Mixer bindings to DT schema format.

The conversion includes also updates to the bindings, matching the
current DTS and Linux driver:
1. Add clocks required on Exynos4210 and Exynos4212 types of Mixer.
2. Add second memory range on Exynos4210 and Exynos4212.
3. Add interconnects, iommus and power-domains.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/display/exynos/exynos_mixer.txt  |  26 ----
 .../display/samsung/samsung,exynos-mixer.yaml | 143 ++++++++++++++++++
 2 files changed, 143 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_mixer.txt
 create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.yaml

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_mixer.txt b/Documentation/devicetree/bindings/display/exynos/exynos_mixer.txt
deleted file mode 100644
index 3e38128f866b..000000000000
--- a/Documentation/devicetree/bindings/display/exynos/exynos_mixer.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Device-Tree bindings for mixer driver
-
-Required properties:
-- compatible: value should be one of the following:
-	1) "samsung,exynos5-mixer" <DEPRECATED>
-	2) "samsung,exynos4210-mixer"
-	3) "samsung,exynos4212-mixer"
-	4) "samsung,exynos5250-mixer"
-	5) "samsung,exynos5420-mixer"
-
-- reg: physical base address of the mixer and length of memory mapped
-	region.
-- interrupts: interrupt number to the cpu.
-- clocks: list of clock IDs from SoC clock driver.
-	a) mixer: Gate of Mixer IP bus clock.
-	b) sclk_hdmi: HDMI Special clock, one of the two possible inputs of
-               mixer mux.
-	c) hdmi: Gate of HDMI IP bus clock, needed together with sclk_hdmi.
-
-Example:
-
-	mixer {
-		compatible = "samsung,exynos5250-mixer";
-		reg = <0x14450000 0x10000>;
-		interrupts = <0 94 0>;
-	};
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.yaml
new file mode 100644
index 000000000000..ba40284ac66f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.yaml
@@ -0,0 +1,143 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/samsung/samsung,exynos-mixer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC Mixer
+
+maintainers:
+  - Inki Dae <inki.dae@samsung.com>
+  - Joonyoung Shim <jy0922.shim@samsung.com>
+  - Seung-Woo Kim <sw0312.kim@samsung.com>
+  - Kyungmin Park <kyungmin.park@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description:
+  Samsung Exynos SoC Mixer is responsible for mixing and blending multiple data
+  inputs before passing it to an output device.  The output is passed to HDMI.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - samsung,exynos4210-mixer
+          - samsung,exynos4212-mixer
+          - samsung,exynos5250-mixer
+          - samsung,exynos5420-mixer
+      - const: samsung,exynos5-mixer
+        deprecated: true
+
+  clocks:
+    minItems: 3
+    items:
+      - description: Gate of Mixer IP bus clock.
+      - description: Gate of HDMI IP bus clock, needed together with sclk_hdmi.
+      - description: HDMI Special clock, one of the two possible inputs of
+          mixer mux.
+      - description: Video Processor clock.
+      - description: Mixer mux clock.
+      - description: Mixer Special clock.
+
+  clock-names:
+    minItems: 3
+    items:
+      - const: mixer
+      - const: hdmi
+      - const: sclk_hdmi
+      - const: vp
+      - const: mout_mixer
+      - const: sclk_mixer
+
+  interconnects:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  reg:
+    minItems: 1
+    items:
+      - description: Mixer memory region.
+      - description: Video Processor memory region.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - interrupts
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos4210-mixer
+              - samsung,exynos4212-mixer
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        regs:
+          minItems: 2
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos4212-mixer
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        regs:
+          minItems: 2
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos5-mixer
+              - samsung,exynos5250-mixer
+              - samsung,exynos5420-mixer
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        regs:
+          minItems: 1
+          maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mixer@14450000 {
+        compatible = "samsung,exynos5250-mixer";
+        reg = <0x14450000 0x10000>;
+        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock CLK_MIXER>,
+                 <&clock CLK_HDMI>,
+                 <&clock CLK_SCLK_HDMI>;
+        clock-names = "mixer",
+                      "hdmi",
+                      "sclk_hdmi";
+        iommus = <&sysmmu_tv>;
+        power-domains = <&pd_disp1>;
+    };
-- 
2.32.0

