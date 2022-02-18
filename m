Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3B94BBBED
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 16:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3620F10F0ED;
	Fri, 18 Feb 2022 15:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav22.altibox.net (asav22.altibox.net [109.247.116.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BC910F0EF
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 15:11:26 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id A97BB2360A;
 Fri, 18 Feb 2022 16:11:23 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: robh+dt@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v4 1/3] dt-bindings: display: add bindings for MIPI DBI
 compatible SPI panels
Date: Fri, 18 Feb 2022 16:11:08 +0100
Message-Id: <20220218151110.11316-2-noralf@tronnes.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218151110.11316-1-noralf@tronnes.org>
References: <20220218151110.11316-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=KbX8TzQD c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8 a=gEfo2CItAAAA:8
 a=vgGnKq9jBRVFvr_v-DwA:9 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19
 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22 a=sptkURWiP4Gy88Gu7hUp:22
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, maxime@cerno.tech,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add binding for MIPI DBI compatible SPI panels.

v4:
- There should only be two compatible (Maxime)
- s/panel-dbi-spi/panel-mipi-dbi-spi/in compatible

v3:
- Move properties to Device Tree (Maxime)
- Use contains for compatible (Maxime)
- Add backlight property to example
- Flesh out description

v2:
- Fix path for panel-common.yaml
- Use unevaluatedProperties
- Drop properties which are in the allOf section
- Drop model property (Rob)

Acked-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 .../display/panel/panel-mipi-dbi-spi.yaml     | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
new file mode 100644
index 000000000000..748c09113168
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-mipi-dbi-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPI DBI SPI Panel
+
+maintainers:
+  - Noralf Trønnes <noralf@tronnes.org>
+
+description: |
+  This binding is for display panels using a MIPI DBI compatible controller
+  in SPI mode.
+
+  The MIPI Alliance Standard for Display Bus Interface defines the electrical
+  and logical interfaces for display controllers historically used in mobile
+  phones. The standard defines 4 display architecture types and this binding is
+  for type 1 which has full frame memory. There are 3 interface types in the
+  standard and type C is the serial interface.
+
+  The standard defines the following interface signals for type C:
+  - Power:
+    - Vdd: Power supply for display module
+    - Vddi: Logic level supply for interface signals
+    Combined into one in this binding called: power-supply
+  - Interface:
+    - CSx: Chip select
+    - SCL: Serial clock
+    - Dout: Serial out
+    - Din: Serial in
+    - SDA: Bidrectional in/out
+    - D/CX: Data/command selection, high=data, low=command
+      Called dc-gpios in this binding.
+    - RESX: Reset when low
+      Called reset-gpios in this binding.
+
+  The type C interface has 3 options:
+
+    - Option 1: 9-bit mode and D/CX as the 9th bit
+      |              Command              |  the next command or following data  |
+      |<0><D7><D6><D5><D4><D3><D2><D1><D0>|<D/CX><D7><D6><D5><D4><D3><D2><D1><D0>|
+
+    - Option 2: 16-bit mode and D/CX as a 9th bit
+      |              Command or data                              |
+      |<X><X><X><X><X><X><X><D/CX><D7><D6><D5><D4><D3><D2><D1><D0>|
+
+    - Option 3: 8-bit mode and D/CX as a separate interface line
+      |        Command or data         |
+      |<D7><D6><D5><D4><D3><D2><D1><D0>|
+
+  The panel resolution is specified using the panel-timing node properties
+  hactive (width) and vactive (height). The other mandatory panel-timing
+  properties should be set to zero except clock-frequency which can be
+  optionally set to inform about the actual pixel clock frequency.
+
+  If the panel is wired to the controller at an offset specify this using
+  hback-porch (x-offset) and vback-porch (y-offset).
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    items:
+      - {} # Panel Specific Compatible
+      - const: panel-mipi-dbi-spi
+
+  write-only:
+    type: boolean
+    description:
+      Controller is not readable (ie. MISO is not wired up).
+
+  dc-gpios:
+    maxItems: 1
+    description: |
+      Controller data/command selection (D/CX) in 4-line SPI mode.
+      If not set, the controller is in 3-line SPI mode.
+
+required:
+  - compatible
+  - reg
+  - panel-timing
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            display@0{
+                    compatible = "sainsmart18", "panel-mipi-dbi-spi";
+                    reg = <0>;
+                    spi-max-frequency = <40000000>;
+
+                    dc-gpios = <&gpio 24 GPIO_ACTIVE_HIGH>;
+                    reset-gpios = <&gpio 25 GPIO_ACTIVE_HIGH>;
+                    write-only;
+
+                    backlight = <&backlight>;
+
+                    width-mm = <35>;
+                    height-mm = <28>;
+
+                    panel-timing {
+                        hactive = <160>;
+                        vactive = <128>;
+                        hback-porch = <0>;
+                        vback-porch = <0>;
+
+                        clock-frequency = <0>;
+                        hfront-porch = <0>;
+                        hsync-len = <0>;
+                        vfront-porch = <0>;
+                        vsync-len = <0>;
+                    };
+            };
+    };
+
+...
-- 
2.33.0

