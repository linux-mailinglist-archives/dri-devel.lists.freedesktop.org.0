Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D856051D9D8
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 16:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C111710EC4F;
	Fri,  6 May 2022 14:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C79D810EC4F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 14:05:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 332DB14BF;
 Fri,  6 May 2022 07:05:51 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2DCA3F885;
 Fri,  6 May 2022 07:05:49 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 08/11] dt-bindings: display: convert PL110/PL111 to DT
 schema
Date: Fri,  6 May 2022 15:05:30 +0100
Message-Id: <20220506140533.3566431-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506140533.3566431-1-andre.przywara@arm.com>
References: <20220506140533.3566431-1-andre.przywara@arm.com>
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
 Will Deacon <will@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Arm PL110 and PL111 are IP blocks that provide a display engine with
an LCD interface, being able to drive a variety of LC panels.

Convert the binding over to DT schema, to the DTs can be automatically
checked.
This still contains the deprecated "arm,pl11x,tft-r0g0b0-pads" property,
because this is used by several DTs in the tree.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../devicetree/bindings/display/arm,pl11x.txt | 110 -----------
 .../bindings/display/arm,pl11x.yaml           | 174 ++++++++++++++++++
 2 files changed, 174 insertions(+), 110 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/arm,pl11x.txt
 create mode 100644 Documentation/devicetree/bindings/display/arm,pl11x.yaml

diff --git a/Documentation/devicetree/bindings/display/arm,pl11x.txt b/Documentation/devicetree/bindings/display/arm,pl11x.txt
deleted file mode 100644
index 3f977e72a2005..0000000000000
--- a/Documentation/devicetree/bindings/display/arm,pl11x.txt
+++ /dev/null
@@ -1,110 +0,0 @@
-* ARM PrimeCell Color LCD Controller PL110/PL111
-
-See also Documentation/devicetree/bindings/arm/primecell.yaml
-
-Required properties:
-
-- compatible: must be one of:
-	"arm,pl110", "arm,primecell"
-	"arm,pl111", "arm,primecell"
-
-- reg: base address and size of the control registers block
-
-- interrupt-names: either the single entry "combined" representing a
-	combined interrupt output (CLCDINTR), or the four entries
-	"mbe", "vcomp", "lnbu", "fuf" representing the individual
-	CLCDMBEINTR, CLCDVCOMPINTR, CLCDLNBUINTR, CLCDFUFINTR interrupts
-
-- interrupts: contains an interrupt specifier for each entry in
-	interrupt-names
-
-- clock-names: should contain "clcdclk" and "apb_pclk"
-
-- clocks: contains phandle and clock specifier pairs for the entries
-	in the clock-names property. See
-	Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Optional properties:
-
-- memory-region: phandle to a node describing memory (see
-	Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt)
-	to be used for the framebuffer; if not present, the framebuffer
-	may be located anywhere in the memory
-
-- max-memory-bandwidth: maximum bandwidth in bytes per second that the
-	cell's memory interface can handle; if not present, the memory
-	interface is fast enough to handle all possible video modes
-
-Required sub-nodes:
-
-- port: describes LCD panel signals, following the common binding
-	for video transmitter interfaces; see
-	Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Deprecated properties:
-	The port's endbpoint subnode had this, now deprecated property
-	in the past. Drivers should be able to survive without it:
-
-	- arm,pl11x,tft-r0g0b0-pads: an array of three 32-bit values,
-		defining the way CLD pads are wired up; first value
-		contains index of the "CLD" external pin (pad) used
-		as R0 (first bit of the red component), second value
-	        index of the pad used as G0, third value index of the
-		pad used as B0, see also "LCD panel signal multiplexing
-		details" paragraphs in the PL110/PL111 Technical
-		Reference Manuals; this implicitly defines available
-		color modes, for example:
-		- PL111 TFT 4:4:4 panel:
-			arm,pl11x,tft-r0g0b0-pads = <4 15 20>;
-		- PL110 TFT (1:)5:5:5 panel:
-			arm,pl11x,tft-r0g0b0-pads = <1 7 13>;
-		- PL111 TFT (1:)5:5:5 panel:
-			arm,pl11x,tft-r0g0b0-pads = <3 11 19>;
-		- PL111 TFT 5:6:5 panel:
-			arm,pl11x,tft-r0g0b0-pads = <3 10 19>;
-		- PL110 and PL111 TFT 8:8:8 panel:
-			arm,pl11x,tft-r0g0b0-pads = <0 8 16>;
-		- PL110 and PL111 TFT 8:8:8 panel, R & B components swapped:
-			arm,pl11x,tft-r0g0b0-pads = <16 8 0>;
-
-
-Example:
-
-	clcd@10020000 {
-		compatible = "arm,pl111", "arm,primecell";
-		reg = <0x10020000 0x1000>;
-		interrupt-names = "combined";
-		interrupts = <0 44 4>;
-		clocks = <&oscclk1>, <&oscclk2>;
-		clock-names = "clcdclk", "apb_pclk";
-		max-memory-bandwidth = <94371840>; /* Bps, 1024x768@60 16bpp */
-
-		port {
-			clcd_pads: endpoint {
-				remote-endpoint = <&clcd_panel>;
-			};
-		};
-
-	};
-
-	panel {
-		compatible = "panel-dpi";
-
-		port {
-			clcd_panel: endpoint {
-				remote-endpoint = <&clcd_pads>;
-			};
-		};
-
-		panel-timing {
-			clock-frequency = <25175000>;
-			hactive = <640>;
-			hback-porch = <40>;
-			hfront-porch = <24>;
-			hsync-len = <96>;
-			vactive = <480>;
-			vback-porch = <32>;
-			vfront-porch = <11>;
-			vsync-len = <2>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/arm,pl11x.yaml b/Documentation/devicetree/bindings/display/arm,pl11x.yaml
new file mode 100644
index 0000000000000..c17838c197da8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/arm,pl11x.yaml
@@ -0,0 +1,174 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/arm,pl11x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm PrimeCell Color LCD Controller PL110/PL111
+
+maintainers:
+  - Liviu Dudau <Liviu.Dudau@arm.com>
+  - Andre Przywara <andre.przywara@arm.com>
+
+description:
+  The Arm Primcell PL010/PL111 is an LCD controller IP, than scans out
+  a framebuffer region in system memory, and creates timed signals for
+  a variety of LCD panels.
+
+# We need a select here so we don't match all nodes with 'arm,primecell'
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - arm,pl110
+          - arm,pl111
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - arm,pl110
+          - arm,pl111
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  interrupt-names:
+    oneOf:
+      - const: combined
+        description:
+          The IP provides four individual interrupt lines, but also one
+          combined line. If the integration only connects this line to the
+          interrupt controller, this single interrupt is noted here.
+      - items:
+          - const: mbe        # CLCDMBEINTR
+          - const: vcomp      # CLCDVCOMPINTR
+          - const: lnbu       # CLCDLNBUINTR
+          - const: fuf        # CLCDFUFINTR
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: clcdclk
+      - const: apb_pclk
+
+  clocks:
+    items:
+      - description: The CLCDCLK reference clock for the controller.
+      - description: The HCLK AHB slave clock for the register access.
+
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a node describing memory to be used for the framebuffer.
+      If not present, the framebuffer may be located anywhere in memory.
+
+  max-memory-bandwidth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Maximum bandwidth in bytes per second that the cell's memory interface
+      can handle.
+      If not present, the memory interface is fast enough to handle all
+      possible video modes.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    description:
+      Output endpoint of the controller, connecting the LCD panel signals.
+
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/$defs/endpoint-base
+        unevaluatedProperties: false
+
+        properties:
+          arm,pl11x,tft-r0g0b0-pads:
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            items:
+              - description: index of CLD pad used for first red bit (R0)
+              - description: index of CLD pad used for first green bit (G0)
+              - description: index of CLD pad used for first blue bit (G0)
+            deprecated: true
+            description: |
+              DEPRECATED. An array of three 32-bit values, defining the way
+              CLD[23:0] pads are wired up.
+              The first value contains the index of the "CLD" external pin (pad)
+              used as R0 (first bit of the red component), the second value for
+              green, the third value for blue.
+              See also "LCD panel signal multiplexing details" paragraphs in the
+              PL110/PL111 Technical Reference Manuals.
+              This implicitly defines available color modes, for example:
+              - PL111 TFT 4:4:4 panel:
+                  arm,pl11x,tft-r0g0b0-pads = <4 15 20>;
+              - PL110 TFT (1:)5:5:5 panel:
+                  arm,pl11x,tft-r0g0b0-pads = <1 7 13>;
+              - PL111 TFT (1:)5:5:5 panel:
+                  arm,pl11x,tft-r0g0b0-pads = <3 11 19>;
+              - PL111 TFT 5:6:5 panel:
+                  arm,pl11x,tft-r0g0b0-pads = <3 10 19>;
+              - PL110 and PL111 TFT 8:8:8 panel:
+                  arm,pl11x,tft-r0g0b0-pads = <0 8 16>;
+              - PL110 and PL111 TFT 8:8:8 panel, R & B components swapped:
+                  arm,pl11x,tft-r0g0b0-pads = <16 8 0>;
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupt-names
+  - interrupts
+  - clock-names
+  - clocks
+  - port
+
+examples:
+  - |
+    clcd@10020000 {
+        compatible = "arm,pl111", "arm,primecell";
+        reg = <0x10020000 0x1000>;
+        interrupt-names = "combined";
+        interrupts = <44>;
+        clocks = <&oscclk1>, <&oscclk2>;
+        clock-names = "clcdclk", "apb_pclk";
+        max-memory-bandwidth = <94371840>; /* Bps, 1024x768@60 16bpp */
+
+        port {
+            clcd_pads: endpoint {
+                remote-endpoint = <&clcd_panel>;
+            };
+        };
+    };
+
+    panel {
+        compatible = "arm,rtsm-display", "panel-dpi";
+        power-supply = <&vcc_supply>;
+
+        port {
+            clcd_panel: endpoint {
+                remote-endpoint = <&clcd_pads>;
+            };
+        };
+
+        panel-timing {
+            clock-frequency = <25175000>;
+            hactive = <640>;
+            hback-porch = <40>;
+            hfront-porch = <24>;
+            hsync-len = <96>;
+            vactive = <480>;
+            vback-porch = <32>;
+            vfront-porch = <11>;
+            vsync-len = <2>;
+        };
+    };
+...
-- 
2.25.1

