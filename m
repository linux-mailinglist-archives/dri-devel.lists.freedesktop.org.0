Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5191BBDF6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9BB6E3BB;
	Tue, 28 Apr 2020 12:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0F7216E0CB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:27:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.73,323,1583161200"; d="scan'208";a="45602852"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 27 Apr 2020 17:22:37 +0900
Received: from renesas-VirtualBox.ree.adwin.renesas.com (unknown
 [172.29.51.26])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 22F4A41D9F73;
 Mon, 27 Apr 2020 17:22:32 +0900 (JST)
From: Gareth Williams <gareth.williams.jx@renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Icenowy Zheng <icenowy@aosc.io>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Vivek Unune <npcomplete13@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 2/3] drm/db9000: Add bindings documentation for LCD controller
Date: Mon, 27 Apr 2020 09:21:48 +0100
Message-Id: <1587975709-2092-3-git-send-email-gareth.williams.jx@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587975709-2092-1-git-send-email-gareth.williams.jx@renesas.com>
References: <1587975709-2092-1-git-send-email-gareth.williams.jx@renesas.com>
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: devicetree@vger.kernel.org, Phil Edworthy <phil.edworthy@renesas.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gareth Williams <gareth.williams.jx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the DT bindings information for the Digital Blocks DB9000 LCD
controller. Also include documentation for the Renesas RZN1 specific
compatible string.

Signed-off-by: Gareth Williams <gareth.williams.jx@renesas.com>
---
 .../devicetree/bindings/display/db9000,du.yaml     | 87 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 2 files changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/db9000,du.yaml

diff --git a/Documentation/devicetree/bindings/display/db9000,du.yaml b/Documentation/devicetree/bindings/display/db9000,du.yaml
new file mode 100644
index 0000000..73a9311
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/db9000,du.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/db9000,du.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DB9000 LCD Controller
+
+maintainers:
+    - Gareth Williams <gareth.williams.jx@renesas.com>
+
+description: |
+  This is an LCD controller by Digital Blocks available for SoCs. The DB9000
+  controller reads from the framebuffer to display on a single RGB interface.
+  Output may be formatted in RGB or BGR. The driver also supports the PWM
+  logic that is included with the controller.
+
+properties:
+
+  compatible:
+    oneOf:
+      - const: digital-blocks,drm-db9000
+      - const: digital-blocks,drm-rzn1
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: |
+          A phandle and clock-specifier pair to be used as a pixel clock.
+
+  clock-names:
+   items:
+      - const: lcd_eclk
+
+  port:
+    type: object
+    description: The panel endpoint connection.
+
+  bits-per-pixel:
+    description: |
+            Default is 24. This selects the number of bits used to represent
+            a single pixel within the controller.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    enum: [8, 16, 24, 32]
+
+  bus-width:
+    description: |
+       The width of the interface to the LCD panel. This is needed
+       if the bits-per-pixel property is set to 16 or less, but the board
+       connects to a 24-bit panel. In which case, the controller will shift the
+       16-bit data to the most significant bits of the device. Default is 24.
+
+  "#pwm-cells":
+    const: 2
+
+required:
+  - compatible
+  - "#pwm-cells"
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+examples:
+  - |+
+    drm@53004000 {
+      compatible = "digital-blocks,drm-db9000";
+      reg = <0x53004000 0x1000>;
+      interrupts = <10 97 120>;
+      clocks = <&sysctrl 26>;
+      clock-names = "clk_slcd";
+      bus-width = <24>;
+      pinctrl-0 = <&pins_lcd>;
+      #pwm-cells = <2>;
+
+      port {
+        drm_point: endpoint@0 {
+          remote-endpoint = <&display_in>;
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6992bbb..138f76e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -235,6 +235,8 @@ patternProperties:
     description: Shenzhen Yagu Electronic Technology Co., Ltd.
   "^digi,.*":
     description: Digi International Inc.
+  "^digital-blocks,.*":
+    description: Digital Blocks, Inc.
   "^digilent,.*":
     description: Diglent, Inc.
   "^dioo,.*":
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
