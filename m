Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09B8500711
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 09:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B96F10E273;
	Thu, 14 Apr 2022 07:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2ED110E142
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 02:53:06 +0000 (UTC)
X-UUID: 67c29a9b4f0b4390a3e9127464c07b58-20220414
X-UUID: 67c29a9b4f0b4390a3e9127464c07b58-20220414
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <nick.fan@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1246117363; Thu, 14 Apr 2022 10:53:02 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 14 Apr 2022 10:53:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Apr 2022 10:53:00 +0800
From: Nick Fan <Nick.Fan@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 1/2] dt-bindings: Add DT schema for Arm Mali Valhall GPU
Date: Thu, 14 Apr 2022 10:50:22 +0800
Message-ID: <20220414025023.11516-1-Nick.Fan@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Thu, 14 Apr 2022 07:38:34 +0000
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 wenst@chromium.org, Nick Fan <Nick.Fan@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add devicetree schema for Arm Mali Valhall GPU

Define a compatible string for the Mali Valhall GPU
for MediaTek's SoC platform.

Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
---
 .../bindings/gpu/arm,mali-valhall.yaml        | 201 ++++++++++++++++++
 1 file changed, 201 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
new file mode 100644
index 000000000000..526384d1e3ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
@@ -0,0 +1,201 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/arm,mali-valhall.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Mali Valhall GPU
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  $nodename:
+    pattern: '^gpu@[a-f0-9]+$'
+
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt8192-mali
+      - const: arm,mali-valhall
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Job interrupt
+      - description: MMU interrupt
+      - description: GPU interrupt
+
+  interrupt-names:
+    items:
+      - const: job
+      - const: mmu
+      - const: gpu
+
+  clocks:
+    minItems: 1
+
+  power-domains:
+    minItems: 1
+    maxItems: 5
+
+  mali-supply: true
+  sram-supply: true
+
+  operating-points-v2: true
+  opp-table: true
+
+  "#cooling-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8192-mali
+    then:
+      properties:
+        power-domains:
+          minItems: 5
+          maxItems: 5
+
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+            - const: core2
+            - const: core3
+            - const: core4
+
+      required:
+        - sram-supply
+        - power-domains
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu@13000000 {
+        compatible = "mediatek,mt8192-mali", "arm,mali-valhall";
+        reg = <0x13000000 0x4000>;
+        interrupts =
+            <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
+            <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
+            <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>;
+        interrupt-names =
+            "gpu",
+            "mmu",
+            "job";
+
+        clocks = <&mfgcfg 0>;
+
+        power-domains =
+            <&spm 4>,
+            <&spm 5>,
+            <&spm 6>,
+            <&spm 7>,
+            <&spm 8>;
+
+        operating-points-v2 = <&gpu_opp_table>;
+        mali-supply = <&mt6315_7_vbuck1>;
+        sram-supply = <&mt6359_vsram_others_ldo_reg>;
+        gpu_opp_table: opp_table {
+            compatible = "operating-points-v2";
+            opp-shared;
+
+            opp-358000000 {
+                opp-hz = /bits/ 64 <358000000>;
+                opp-microvolt = <606250>, <750000>;
+            };
+
+            opp-399000000 {
+                opp-hz = /bits/ 64 <399000000>;
+                opp-microvolt = <618750>, <750000>;
+            };
+
+            opp-440000000 {
+                opp-hz = /bits/ 64 <440000000>;
+                opp-microvolt = <631250>, <750000>;
+            };
+
+            opp-482000000 {
+                opp-hz = /bits/ 64 <482000000>;
+                opp-microvolt = <643750>, <750000>;
+            };
+
+            opp-523000000 {
+                opp-hz = /bits/ 64 <523000000>;
+                opp-microvolt = <656250>, <750000>;
+            };
+
+            opp-564000000 {
+                opp-hz = /bits/ 64 <564000000>;
+                opp-microvolt = <668750>, <750000>;
+            };
+
+            opp-605000000 {
+                opp-hz = /bits/ 64 <605000000>;
+                opp-microvolt = <681250>, <750000>;
+            };
+
+            opp-647000000 {
+                opp-hz = /bits/ 64 <647000000>;
+                opp-microvolt = <693750>, <750000>;
+            };
+
+            opp-688000000 {
+                opp-hz = /bits/ 64 <688000000>;
+                opp-microvolt = <706250>, <750000>;
+            };
+
+            opp-724000000 {
+                opp-hz = /bits/ 64 <724000000>;
+                opp-microvolt = <725000>, <750000>;
+            };
+
+            opp-748000000 {
+                opp-hz = /bits/ 64 <748000000>;
+                opp-microvolt = <737500>, <750000>;
+            };
+
+            opp-772000000 {
+                opp-hz = /bits/ 64 <772000000>;
+                opp-microvolt = <750000>, <750000>;
+            };
+
+            opp-795000000 {
+                opp-hz = /bits/ 64 <795000000>;
+                opp-microvolt = <762500>, <762500>;
+            };
+
+            opp-819000000 {
+                opp-hz = /bits/ 64 <819000000>;
+                opp-microvolt = <775000>, <775000>;
+            };
+
+            opp-843000000 {
+                opp-hz = /bits/ 64 <843000000>;
+                opp-microvolt = <787500>, <787500>;
+            };
+
+            opp-866000000 {
+                opp-hz = /bits/ 64 <866000000>;
+                opp-microvolt = <800000>, <800000>;
+            };
+        };
+    };
+...
-- 
2.18.0

