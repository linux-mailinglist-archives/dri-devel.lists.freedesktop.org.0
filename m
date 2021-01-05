Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE5E2EBB66
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 09:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B55289DA5;
	Wed,  6 Jan 2021 08:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC5196E094
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 08:34:24 +0000 (UTC)
X-UUID: 54bd9f9568d3495296cee087c743be7f-20210105
X-UUID: 54bd9f9568d3495296cee087c743be7f-20210105
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <nick.fan@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 634163058; Tue, 05 Jan 2021 16:34:18 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 16:34:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 16:34:16 +0800
From: Nick Fan <Nick.Fan@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: Add DT schema for Arm Mali Valhall GPU
Date: Tue, 5 Jan 2021 16:34:05 +0800
Message-ID: <20210105083406.14025-1-Nick.Fan@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 06 Jan 2021 08:52:53 +0000
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Nick Fan <Nick.Fan@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add devicetree schema for Arm Mali Valhall GPU

Define a compatible string for the Mali Valhall GPU
for Mediatek's SoC platform.

Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
---
 .../bindings/gpu/arm,mali-valhall.yaml        | 252 ++++++++++++++++++
 1 file changed, 252 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
new file mode 100644
index 000000000000..ecf249a58435
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
@@ -0,0 +1,252 @@
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
+      - description: GPU interrupt
+      - description: MMU interrupt
+      - description: Job interrupt
+
+  interrupt-names:
+    items:
+      - const: gpu
+      - const: mmu
+      - const: job
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
+        sram-supply: true
+        power-domains:
+          description:
+            List of phandle and PM domain specifier as documented in
+            Documentation/devicetree/bindings/power/power_domain.txt
+          minItems: 5
+          maxItems: 5
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
+           compatible = "mediatek,mt8192-mali", "arm,mali-valhall";
+           reg = <0x13000000 0x4000>;
+           interrupts =
+                   <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
+                   <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
+                   <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>;
+           interrupt-names =
+                   "gpu",
+                   "mmu",
+                   "job";
+
+           clocks = <&mfgcfg 0>;
+
+           power-domains =
+                   <&spm 4>,
+                   <&spm 5>,
+                   <&spm 6>,
+                   <&spm 7>,
+                   <&spm 8>;
+
+           operating-points-v2 = <&gpu_opp_table>;
+           mali-supply = <&mt6315_7_vbuck1>;
+           sram-supply = <&mt6359_vsram_others_ldo_reg>;
+    };
+
+    gpu_opp_table: opp_table0 {
+      compatible = "operating-points-v2";
+      opp-shared;
+
+      opp-358000000 {
+              opp-hz = /bits/ 64 <358000000>;
+              opp-hz-real = /bits/ 64 <358000000>,
+                            /bits/ 64 <358000000>;
+              opp-microvolt = <606250>,
+                              <750000>;
+      };
+
+      opp-399000000 {
+              opp-hz = /bits/ 64 <399000000>;
+              opp-hz-real = /bits/ 64 <399000000>,
+                            /bits/ 64 <399000000>;
+              opp-microvolt = <618750>,
+                              <750000>;
+      };
+
+      opp-440000000 {
+              opp-hz = /bits/ 64 <440000000>;
+              opp-hz-real = /bits/ 64 <440000000>,
+                            /bits/ 64 <440000000>;
+              opp-microvolt = <631250>,
+                              <750000>;
+      };
+
+      opp-482000000 {
+              opp-hz = /bits/ 64 <482000000>;
+              opp-hz-real = /bits/ 64 <482000000>,
+                            /bits/ 64 <482000000>;
+              opp-microvolt = <643750>,
+                              <750000>;
+      };
+
+      opp-523000000 {
+              opp-hz = /bits/ 64 <523000000>;
+              opp-hz-real = /bits/ 64 <523000000>,
+                            /bits/ 64 <523000000>;
+              opp-microvolt = <656250>,
+                              <750000>;
+      };
+
+      opp-564000000 {
+              opp-hz = /bits/ 64 <564000000>;
+              opp-hz-real = /bits/ 64 <564000000>,
+                            /bits/ 64 <564000000>;
+              opp-microvolt = <668750>,
+                              <750000>;
+      };
+
+      opp-605000000 {
+              opp-hz = /bits/ 64 <605000000>;
+              opp-hz-real = /bits/ 64 <605000000>,
+                            /bits/ 64 <605000000>;
+              opp-microvolt = <681250>,
+                              <750000>;
+      };
+
+      opp-647000000 {
+              opp-hz = /bits/ 64 <647000000>;
+              opp-hz-real = /bits/ 64 <647000000>,
+                            /bits/ 64 <647000000>;
+              opp-microvolt = <693750>,
+                              <750000>;
+      };
+
+      opp-688000000 {
+              opp-hz = /bits/ 64 <688000000>;
+              opp-hz-real = /bits/ 64 <688000000>,
+                            /bits/ 64 <688000000>;
+              opp-microvolt = <706250>,
+                              <750000>;
+      };
+
+      opp-724000000 {
+              opp-hz = /bits/ 64 <724000000>;
+              opp-hz-real = /bits/ 64 <724000000>,
+                            /bits/ 64 <724000000>;
+              opp-microvolt = <725000>,
+                              <750000>;
+      };
+
+      opp-760000000 {
+              opp-hz = /bits/ 64 <760000000>;
+              opp-hz-real = /bits/ 64 <760000000>,
+                            /bits/ 64 <760000000>;
+              opp-microvolt = <743750>,
+                              <750000>;
+      };
+
+      opp-795000000 {
+              opp-hz = /bits/ 64 <795000000>;
+              opp-hz-real = /bits/ 64 <795000000>,
+                            /bits/ 64 <795000000>;
+              opp-microvolt = <762500>,
+                              <762500>;
+      };
+
+      opp-831000000 {
+              opp-hz = /bits/ 64 <831000000>;
+              opp-hz-real = /bits/ 64 <831000000>,
+                            /bits/ 64 <831000000>;
+              opp-microvolt = <781250>,
+                              <781250>;
+      };
+
+      opp-855000000 {
+              opp-hz = /bits/ 64 <855000000>;
+              opp-hz-real = /bits/ 64 <855000000>,
+                            /bits/ 64 <855000000>;
+              opp-microvolt = <793750>,
+                              <793750>;
+      };
+
+      opp-902000000 {
+              opp-hz = /bits/ 64 <902000000>;
+              opp-hz-real = /bits/ 64 <902000000>,
+                            /bits/ 64 <902000000>;
+              opp-microvolt = <818750>,
+                              <818750>;
+      };
+
+      opp-950000000 {
+              opp-hz = /bits/ 64 <950000000>;
+              opp-hz-real = /bits/ 64 <950000000>,
+                            /bits/ 64 <950000000>;
+              opp-microvolt = <843750>,
+                              <843750>;
+      };
+    };
+...
-- 
2.18.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
