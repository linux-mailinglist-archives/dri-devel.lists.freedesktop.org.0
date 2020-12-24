Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A03F32E2ADB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC353899DB;
	Fri, 25 Dec 2020 09:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Thu, 24 Dec 2020 12:37:18 UTC
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id C709E89BCD
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 12:37:18 +0000 (UTC)
X-UUID: d85dc5df3c4a40e5bbe7db0a4d7e4642-20201224
X-UUID: d85dc5df3c4a40e5bbe7db0a4d7e4642-20201224
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <nick.fan@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1071865283; Thu, 24 Dec 2020 20:32:12 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 20:32:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Dec 2020 20:32:08 +0800
From: Nick Fan <Nick.Fan@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/2] dt-bindings: Convert Arm Mali Valhall GPU to DT schema
Date: Thu, 24 Dec 2020 20:31:18 +0800
Message-ID: <20201224123119.26504-1-Nick.Fan@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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

Convert the Arm Valhall GPU binding to DT schema format.

Define a compatible string for the Mali Valhall GPU
for Mediatek's SoC platform.

Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
---
 .../bindings/gpu/arm,mali-valhall.yaml        | 252 ++++++++++++++++++
 1 file changed, 252 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
new file mode 100644
index 000000000000..3dba202bec95
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
@@ -0,0 +1,252 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/arm,mali-vallhall.yaml#
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
+      - const: arm,mali-valhall # Mali Valhall GPU model/revision is fully discoverable
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
+                   <&scpsys 4>,
+                   <&scpsys 5>,
+                   <&scpsys 6>,
+                   <&scpsys 7>,
+                   <&scpsys 8>;
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
