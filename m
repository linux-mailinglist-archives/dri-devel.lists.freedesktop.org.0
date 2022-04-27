Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEBA511544
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 13:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A6510EF82;
	Wed, 27 Apr 2022 11:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3F93610EF75
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 11:26:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D46FCED1;
 Wed, 27 Apr 2022 04:26:02 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3994D3F7D8;
 Wed, 27 Apr 2022 04:26:01 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 11/11] dt-bindings: display: convert Arm Komeda to DT schema
Date: Wed, 27 Apr 2022 12:25:28 +0100
Message-Id: <20220427112528.4097815-12-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427112528.4097815-1-andre.przywara@arm.com>
References: <20220427112528.4097815-1-andre.przywara@arm.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Arm Komeda (aka Mali-D71) is a display controller that scans out a
framebuffer and hands a signal to a digital encoder to generate a DVI
or HDMI signal. It supports up to two pipelines, each frame can be
composed of up to four layers.

Convert the existing DT binding to DT schema.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../bindings/display/arm,komeda.txt           |  78 -----------
 .../bindings/display/arm,komeda.yaml          | 130 ++++++++++++++++++
 2 files changed, 130 insertions(+), 78 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/arm,komeda.txt
 create mode 100644 Documentation/devicetree/bindings/display/arm,komeda.yaml

diff --git a/Documentation/devicetree/bindings/display/arm,komeda.txt b/Documentation/devicetree/bindings/display/arm,komeda.txt
deleted file mode 100644
index 8513695ee47fe..0000000000000
--- a/Documentation/devicetree/bindings/display/arm,komeda.txt
+++ /dev/null
@@ -1,78 +0,0 @@
-Device Tree bindings for Arm Komeda display driver
-
-Required properties:
-- compatible: Should be "arm,mali-d71"
-- reg: Physical base address and length of the registers in the system
-- interrupts: the interrupt line number of the device in the system
-- clocks: A list of phandle + clock-specifier pairs, one for each entry
-    in 'clock-names'
-- clock-names: A list of clock names. It should contain:
-      - "aclk": for the main processor clock
-- #address-cells: Must be 1
-- #size-cells: Must be 0
-- iommus: configure the stream id to IOMMU, Must be configured if want to
-    enable iommu in display. for how to configure this node please reference
-        devicetree/bindings/iommu/arm,smmu-v3.txt,
-        devicetree/bindings/iommu/iommu.txt
-
-Required properties for sub-node: pipeline@nq
-Each device contains one or two pipeline sub-nodes (at least one), each
-pipeline node should provide properties:
-- reg: Zero-indexed identifier for the pipeline
-- clocks: A list of phandle + clock-specifier pairs, one for each entry
-    in 'clock-names'
-- clock-names: should contain:
-      - "pxclk": pixel clock
-
-- port: each pipeline connect to an encoder input port. The connection is
-    modeled using the OF graph bindings specified in
-    Documentation/devicetree/bindings/graph.txt
-
-Optional properties:
-  - memory-region: phandle to a node describing memory (see
-    Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt)
-    to be used for the framebuffer; if not present, the framebuffer may
-    be located anywhere in memory.
-
-Example:
-/ {
-	...
-
-	dp0: display@c00000 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "arm,mali-d71";
-		reg = <0xc00000 0x20000>;
-		interrupts = <0 168 4>;
-		clocks = <&dpu_aclk>;
-		clock-names = "aclk";
-		iommus = <&smmu 0>, <&smmu 1>, <&smmu 2>, <&smmu 3>,
-			<&smmu 4>, <&smmu 5>, <&smmu 6>, <&smmu 7>,
-			<&smmu 8>, <&smmu 9>;
-
-		dp0_pipe0: pipeline@0 {
-			clocks = <&fpgaosc2>;
-			clock-names = "pxclk";
-			reg = <0>;
-
-			port {
-				dp0_pipe0_out: endpoint {
-					remote-endpoint = <&db_dvi0_in>;
-				};
-			};
-		};
-
-		dp0_pipe1: pipeline@1 {
-			clocks = <&fpgaosc2>;
-			clock-names = "pxclk";
-			reg = <1>;
-
-			port {
-				dp0_pipe1_out: endpoint {
-					remote-endpoint = <&db_dvi1_in>;
-				};
-			};
-		};
-	};
-	...
-};
diff --git a/Documentation/devicetree/bindings/display/arm,komeda.yaml b/Documentation/devicetree/bindings/display/arm,komeda.yaml
new file mode 100644
index 0000000000000..c619a0acfb307
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/arm,komeda.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/arm,komeda.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Komeda display processor
+
+maintainers:
+  - Liviu Dudau <Liviu.Dudau@arm.com>
+  - Andre Przywara <andre.przywara@arm.com>
+
+description: |+
+  The Arm Mali D71 display processor supports up to two displays with up
+  to a 4K resolution each. Each pipeline can be composed of up to four
+  layers. It is typically connected to a digital display connector like HDMI.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: arm,mali-d32
+          - const: arm,mali-d71
+      - const: arm,mali-d71
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-names:
+    const: aclk
+
+  clocks:
+    maxItems: 1
+    description: The main DPU processor clock
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a node describing memory to be used for the framebuffer.
+      If not present, the framebuffer may be located anywhere in memory.
+
+  iommus:
+    description:
+      The stream IDs for each of the used pipelines, each four IDs for the
+      four layers, plus one for the write-back stream.
+    minItems: 5
+    maxItems: 10
+
+patternProperties:
+  '^pipeline@[01]$':
+    type: object
+    description:
+      clocks
+
+    properties:
+      reg:
+        enum: [ 0, 1 ]
+
+      clock-names:
+        const: pxclk
+
+      clocks:
+        maxItems: 1
+        description: The input reference for the pixel clock.
+
+      port:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+additionalProperties: false
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+  - compatible
+  - reg
+  - interrupts
+  - clock-names
+  - clocks
+  - pipeline@0
+
+examples:
+  - |
+    display@c00000 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "arm,mali-d71";
+            reg = <0xc00000 0x20000>;
+            interrupts = <168>;
+            clocks = <&dpu_aclk>;
+            clock-names = "aclk";
+            iommus = <&smmu 0>, <&smmu 1>, <&smmu 2>, <&smmu 3>,
+                     <&smmu 8>,
+                     <&smmu 4>, <&smmu 5>, <&smmu 6>, <&smmu 7>,
+                     <&smmu 9>;
+
+            dp0_pipe0: pipeline@0 {
+                    clocks = <&fpgaosc2>;
+                    clock-names = "pxclk";
+                    reg = <0>;
+
+                    port {
+                            dp0_pipe0_out: endpoint {
+                                    remote-endpoint = <&db_dvi0_in>;
+                            };
+                    };
+            };
+
+            dp0_pipe1: pipeline@1 {
+                    clocks = <&fpgaosc2>;
+                    clock-names = "pxclk";
+                    reg = <1>;
+
+                    port {
+                            dp0_pipe1_out: endpoint {
+                                    remote-endpoint = <&db_dvi1_in>;
+                            };
+                    };
+            };
+    };
+...
-- 
2.25.1

