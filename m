Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD43394254
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 14:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2BB6F59F;
	Fri, 28 May 2021 12:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4916F59F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 12:13:12 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7839:f444:cb37:3ebc])
 by baptiste.telenet-ops.be with bizsmtp
 id ACD92500J3gF9cb01CD9rJ; Fri, 28 May 2021 14:13:09 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lmbMS-00AFAw-UV; Fri, 28 May 2021 14:13:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lmbMS-007ga2-5l; Fri, 28 May 2021 14:13:08 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] dt-bindings: display: ssd1307fb: Convert to json-schema
Date: Fri, 28 May 2021 14:13:06 +0200
Message-Id: <20210528121306.1831931-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the Solomon SSD1307 Framebuffer Device Tree binding
documentation to json-schema.

Fix the spelling of the "pwms" property.
Document default values.
Make properties with default values not required.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2:
  - Add Reviewed-by,
  - Document solomon,dclk-{div,freq} defaults.
---
 .../bindings/display/solomon,ssd1307fb.yaml   | 208 ++++++++++++++++++
 .../devicetree/bindings/display/ssd1307fb.txt |  60 -----
 2 files changed, 208 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/ssd1307fb.txt

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
new file mode 100644
index 0000000000000000..2ed2a7d0ca2fa23e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -0,0 +1,208 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/solomon,ssd1307fb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Solomon SSD1307 OLED Controller Framebuffer
+
+maintainers:
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - solomon,ssd1305fb-i2c
+      - solomon,ssd1306fb-i2c
+      - solomon,ssd1307fb-i2c
+      - solomon,ssd1309fb-i2c
+
+  reg:
+    maxItems: 1
+
+  pwms:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vbat-supply:
+    description: The supply for VBAT
+
+  solomon,height:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 16
+    description:
+      Height in pixel of the screen driven by the controller
+
+  solomon,width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 96
+    description:
+      Width in pixel of the screen driven by the controller
+
+  solomon,page-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 1
+    description:
+      Offset of pages (band of 8 pixels) that the screen is mapped to
+
+  solomon,segment-no-remap:
+    type: boolean
+    description:
+      Display needs normal (non-inverted) data column to segment mapping
+
+  solomon,col-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    description:
+      Offset of columns (COL/SEG) that the screen is mapped to
+
+  solomon,com-seq:
+    type: boolean
+    description:
+      Display uses sequential COM pin configuration
+
+  solomon,com-lrremap:
+    type: boolean
+    description:
+      Display uses left-right COM pin remap
+
+  solomon,com-invdir:
+    type: boolean
+    description:
+      Display uses inverted COM pin scan direction
+
+  solomon,com-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    description:
+      Number of the COM pin wired to the first display line
+
+  solomon,prechargep1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 2
+    description:
+      Length of deselect period (phase 1) in clock cycles
+
+  solomon,prechargep2:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 2
+    description:
+      Length of precharge period (phase 2) in clock cycles.  This needs to be
+      the higher, the higher the capacitance of the OLED's pixels is.
+
+  solomon,dclk-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 16
+    description:
+      Clock divisor. The default value is controller-dependent.
+
+  solomon,dclk-frq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    description:
+      Clock frequency, higher value means higher frequency.
+      The default value is controller-dependent.
+
+  solomon,lookup-table:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 4
+    description:
+      8 bit value array of current drive pulse widths for BANK0, and colors A,
+      B, and C. Each value in range of 31 to 63 for pulse widths of 32 to 64.
+      Color D is always width 64.
+
+  solomon,area-color-enable:
+    type: boolean
+    description:
+      Display uses color mode
+
+  solomon,low-power:
+    type: boolean
+    description:
+      Display runs in low power mode
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: solomon,ssd1305fb-i2c
+    then:
+      properties:
+        solomon,dclk-div:
+          default: 1
+        solomon,dclk-frq:
+          default: 7
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: solomon,ssd1306fb-i2c
+    then:
+      properties:
+        solomon,dclk-div:
+          default: 1
+        solomon,dclk-frq:
+          default: 8
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: solomon,ssd1307fb-i2c
+    then:
+      properties:
+        solomon,dclk-div:
+          default: 2
+        solomon,dclk-frq:
+          default: 12
+      required:
+        - pwms
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: solomon,ssd1309fb-i2c
+    then:
+      properties:
+        solomon,dclk-div:
+          default: 1
+        solomon,dclk-frq:
+          default: 10
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c1 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ssd1307: oled@3c {
+                    compatible = "solomon,ssd1307fb-i2c";
+                    reg = <0x3c>;
+                    pwms = <&pwm 4 3000>;
+                    reset-gpios = <&gpio2 7>;
+            };
+
+            ssd1306: oled@3d {
+                    compatible = "solomon,ssd1306fb-i2c";
+                    reg = <0x3c>;
+                    pwms = <&pwm 4 3000>;
+                    reset-gpios = <&gpio2 7>;
+                    solomon,com-lrremap;
+                    solomon,com-invdir;
+                    solomon,com-offset = <32>;
+                    solomon,lookup-table = /bits/ 8 <0x3f 0x3f 0x3f 0x3f>;
+            };
+    };
diff --git a/Documentation/devicetree/bindings/display/ssd1307fb.txt b/Documentation/devicetree/bindings/display/ssd1307fb.txt
deleted file mode 100644
index 2dcb6d12d1371536..0000000000000000
--- a/Documentation/devicetree/bindings/display/ssd1307fb.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-* Solomon SSD1307 Framebuffer Driver
-
-Required properties:
-  - compatible: Should be "solomon,<chip>fb-<bus>". The only supported bus for
-    now is i2c, and the supported chips are ssd1305, ssd1306, ssd1307 and
-    ssd1309.
-  - reg: Should contain address of the controller on the I2C bus. Most likely
-         0x3c or 0x3d
-  - pwm: Should contain the pwm to use according to the OF device tree PWM
-         specification [0]. Only required for the ssd1307.
-  - solomon,height: Height in pixel of the screen driven by the controller
-  - solomon,width: Width in pixel of the screen driven by the controller
-  - solomon,page-offset: Offset of pages (band of 8 pixels) that the screen is
-    mapped to.
-
-Optional properties:
-  - reset-gpios: The GPIO used to reset the OLED display, if available. See
-                 Documentation/devicetree/bindings/gpio/gpio.txt for details.
-  - vbat-supply: The supply for VBAT
-  - solomon,segment-no-remap: Display needs normal (non-inverted) data column
-                              to segment mapping
-  - solomon,col-offset: Offset of columns (COL/SEG) that the screen is mapped to.
-  - solomon,com-seq: Display uses sequential COM pin configuration
-  - solomon,com-lrremap: Display uses left-right COM pin remap
-  - solomon,com-invdir: Display uses inverted COM pin scan direction
-  - solomon,com-offset: Number of the COM pin wired to the first display line
-  - solomon,prechargep1: Length of deselect period (phase 1) in clock cycles.
-  - solomon,prechargep2: Length of precharge period (phase 2) in clock cycles.
-                         This needs to be the higher, the higher the capacitance
-                         of the OLED's pixels is
-  - solomon,dclk-div: Clock divisor 1 to 16
-  - solomon,dclk-frq: Clock frequency 0 to 15, higher value means higher
-                      frequency
-  - solomon,lookup-table: 8 bit value array of current drive pulse widths for
-                          BANK0, and colors A, B, and C. Each value in range
-                          of 31 to 63 for pulse widths of 32 to 64. Color D
-                          is always width 64.
-  - solomon,area-color-enable: Display uses color mode
-  - solomon,low-power. Display runs in low power mode
-
-[0]: Documentation/devicetree/bindings/pwm/pwm.txt
-
-Examples:
-ssd1307: oled@3c {
-        compatible = "solomon,ssd1307fb-i2c";
-        reg = <0x3c>;
-        pwms = <&pwm 4 3000>;
-        reset-gpios = <&gpio2 7>;
-};
-
-ssd1306: oled@3c {
-        compatible = "solomon,ssd1306fb-i2c";
-        reg = <0x3c>;
-        pwms = <&pwm 4 3000>;
-        reset-gpios = <&gpio2 7>;
-        solomon,com-lrremap;
-        solomon,com-invdir;
-        solomon,com-offset = <32>;
-        solomon,lookup-table = /bits/ 8 <0x3f 0x3f 0x3f 0x3f>;
-};
-- 
2.25.1

