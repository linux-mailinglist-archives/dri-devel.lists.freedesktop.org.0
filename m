Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8182E220D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 22:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA6A89875;
	Wed, 23 Dec 2020 21:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319B089861
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 21:30:01 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net
 [93.29.109.196])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id DA85320007;
 Wed, 23 Dec 2020 21:29:58 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/4] dt-bindings: display: Document the Xylon LogiCVC
 display controller
Date: Wed, 23 Dec 2020 22:29:44 +0100
Message-Id: <20201223212947.160565-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201223212947.160565-1-paul.kocialkowski@bootlin.com>
References: <20201223212947.160565-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Xylon LogiCVC is a display controller implemented as programmable
logic in Xilinx FPGAs.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../display/xylon,logicvc-display.yaml        | 313 ++++++++++++++++++
 1 file changed, 313 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml

diff --git a/Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml b/Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml
new file mode 100644
index 000000000000..aca78334ad2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml
@@ -0,0 +1,313 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Bootlin
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/xylon,logicvc-display.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Xylon LogiCVC display controller
+
+maintainers:
+  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+
+description: |
+  The Xylon LogiCVC is a display controller that supports multiple layers.
+  It is usually implemented as programmable logic and was optimized for use
+  with Xilinx Zynq-7000 SoCs and Xilinx FPGAs.
+
+  Because the controller is intended for use in a FPGA, most of the
+  configuration of the controller takes place at logic configuration bitstream
+  synthesis time. As a result, many of the device-tree bindings are meant to
+  reflect the synthesis configuration and must not be configured differently.
+  Matching synthesis parameters are provided when applicable.
+
+  Layers are declared in the "layers" sub-node and have dedicated configuration.
+  In version 3 of the controller, each layer has fixed memory offset and address
+  starting from the video memory base address for its framebuffer. In version 4,
+  framebuffers are configured with a direct memory address instead.
+
+properties:
+  compatible:
+    enum:
+      - xylon,logicvc-3.02.a-display
+      - xylon,logicvc-4.01.a-display
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      # vclk is required and must be provided as first item.
+      - const: vclk
+      # Other clocks are optional and can be provided in any order.
+      - enum:
+          - vclk2
+          - lvdsclk
+          - lvdsclkn
+      - enum:
+          - vclk2
+          - lvdsclk
+          - lvdsclkn
+      - enum:
+          - vclk2
+          - lvdsclk
+          - lvdsclkn
+
+  interrupts:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  xylon,display-interface:
+    enum:
+      # Parallel RGB interface (C_DISPLAY_INTERFACE == 0)
+      - parallel-rgb
+      # ITU-T BR656 interface (C_DISPLAY_INTERFACE == 1)
+      - bt656
+      # 4-bit LVDS interface (C_DISPLAY_INTERFACE == 2)
+      - lvds-4bits
+      # 3-bit LVDS interface (C_DISPLAY_INTERFACE == 4)
+      - lvds-3bits
+      # DVI interface (C_DISPLAY_INTERFACE == 5)
+      - dvi
+    description: Display output interface (C_DISPLAY_INTERFACE).
+
+  xylon,display-colorspace:
+    enum:
+      # RGB colorspace (C_DISPLAY_COLOR_SPACE == 0)
+      - rgb
+      # YUV 4:2:2 colorspace (C_DISPLAY_COLOR_SPACE == 1)
+      - yuv422
+      # YUV 4:4:4 colorspace (C_DISPLAY_COLOR_SPACE == 2)
+      - yuv444
+    description: Display output colorspace (C_DISPLAY_COLOR_SPACE).
+
+  xylon,display-depth:
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    description: Display output depth (C_PIXEL_DATA_WIDTH).
+
+  xylon,row-stride:
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    description: Fixed number of pixels in a framebuffer row (C_ROW_STRIDE).
+
+  xylon,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Syscon phandle representing the top-level logicvc instance, useful when
+      the parent node is not the top-level logicvc instance.
+
+  xylon,dithering:
+    $ref: "/schemas/types.yaml#/definitions/flag"
+    description: Dithering module is enabled (C_XCOLOR)
+
+  xylon,background-layer:
+    $ref: "/schemas/types.yaml#/definitions/flag"
+    description: |
+      The last layer is used to display a black background (C_USE_BACKGROUND).
+      The layer must still be registered.
+
+  xylon,layers-configurable:
+    $ref: "/schemas/types.yaml#/definitions/flag"
+    description: |
+      Configuration of layers' size, position and offset is enabled
+      (C_USE_SIZE_POSITION).
+
+  layers:
+    type: object
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^layer@[0-9]+$":
+        type: object
+
+        properties:
+          reg:
+            maxItems: 1
+
+          xylon,layer-depth:
+            $ref: "/schemas/types.yaml#/definitions/uint32"
+            description: Layer depth (C_LAYER_X_DATA_WIDTH).
+
+          xylon,layer-colorspace:
+            enum:
+              # RGB colorspace (C_LAYER_X_TYPE == 0)
+              - rgb
+              # YUV packed colorspace (C_LAYER_X_TYPE == 0)
+              - yuv
+            description: Layer colorspace (C_LAYER_X_TYPE).
+
+          xylon,layer-alpha-mode:
+            enum:
+              # Alpha is configured layer-wide (C_LAYER_X_ALPHA_MODE == 0)
+              - layer
+              # Alpha is configured per-pixel (C_LAYER_X_ALPHA_MODE == 1)
+              - pixel
+            description: Alpha mode for the layer (C_LAYER_X_ALPHA_MODE).
+
+          xylon,layer-base-offset:
+            $ref: "/schemas/types.yaml#/definitions/uint32"
+            description: |
+              Offset in number of lines (C_LAYER_X_OFFSET) starting from the
+              video RAM base (C_VMEM_BASEADDR), only for version 3.
+
+          xylon,layer-buffer-offset:
+            $ref: "/schemas/types.yaml#/definitions/uint32"
+            description: |
+              Offset in number of lines (C_BUFFER_*_OFFSET) starting from the
+              layer base offset for the second buffer used in double-buffering.
+
+          xylon,layer-primary:
+            $ref: "/schemas/types.yaml#/definitions/flag"
+            description: |
+              Layer should be registered as a primary plane (exactly one is
+              required).
+
+        additionalProperties: false
+
+        required:
+          - reg
+          - xylon,layer-depth
+          - xylon,layer-colorspace
+          - xylon,layer-alpha-mode
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - layer@0
+
+    additionalProperties: false
+
+    description: |
+      The description of the display controller layers, containing layer
+      sub-nodes that each describe a registered layer.
+
+  ports:
+    type: object
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - xylon,display-interface
+  - xylon,display-colorspace
+  - xylon,display-depth
+  - xylon,row-stride
+  - layers
+  - ports
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    logicvc: logicvc@43c00000 {
+      compatible = "xylon,logicvc-3.02.a", "syscon", "simple-mfd";
+      reg = <0x43c00000 0x6000>;
+
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      logicvc_display: display@0 {
+        compatible = "xylon,logicvc-3.02.a-display";
+        reg = <0x0 0x6000>;
+
+        memory-region = <&logicvc_cma>;
+
+        clocks = <&logicvc_vclk 0>, <&logicvc_lvdsclk 0>;
+        clock-names = "vclk", "lvdsclk";
+
+        interrupt-parent = <&intc>;
+        interrupts = <0 34 IRQ_TYPE_LEVEL_HIGH>;
+
+        xylon,display-interface = "lvds-4bits";
+        xylon,display-colorspace = "rgb";
+        xylon,display-depth = <16>;
+        xylon,row-stride = <1024>;
+
+        xylon,layers-configurable;
+
+        layers {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          layer@0 {
+            reg = <0>;
+            xylon,layer-depth = <16>;
+            xylon,layer-colorspace = "rgb";
+            xylon,layer-alpha-mode = "layer";
+            xylon,layer-base-offset = <0>;
+            xylon,layer-buffer-offset = <480>;
+            xylon,layer-primary;
+          };
+
+          layer@1 {
+            reg = <1>;
+            xylon,layer-depth = <16>;
+            xylon,layer-colorspace = "rgb";
+            xylon,layer-alpha-mode = "layer";
+            xylon,layer-base-offset = <2400>;
+            xylon,layer-buffer-offset = <480>;
+          };
+
+          layer@2 {
+            reg = <2>;
+            xylon,layer-depth = <16>;
+            xylon,layer-colorspace = "rgb";
+            xylon,layer-alpha-mode = "layer";
+            xylon,layer-base-offset = <960>;
+            xylon,layer-buffer-offset = <480>;
+          };
+
+          layer@3 {
+            reg = <3>;
+            xylon,layer-depth = <16>;
+            xylon,layer-colorspace = "rgb";
+            xylon,layer-alpha-mode = "layer";
+            xylon,layer-base-offset = <480>;
+            xylon,layer-buffer-offset = <480>;
+          };
+
+          layer@4 {
+            reg = <4>;
+            xylon,layer-depth = <16>;
+            xylon,layer-colorspace = "rgb";
+            xylon,layer-alpha-mode = "layer";
+            xylon,layer-base-offset = <8192>;
+            xylon,layer-buffer-offset = <480>;
+          };
+        };
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          logicvc_out: port@1 {
+            reg = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            logicvc_output: endpoint@0 {
+              reg = <0>;
+              remote-endpoint = <&panel_input>;
+            };
+          };
+        };
+      };
+    };
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
