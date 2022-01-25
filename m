Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAFF49BAB9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 18:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0199C10E31C;
	Tue, 25 Jan 2022 17:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav22.altibox.net (asav22.altibox.net [109.247.116.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F73710E3C1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 17:57:24 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id 5151620C6C;
 Tue, 25 Jan 2022 18:57:22 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: robh+dt@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v2 1/3] dt-bindings: display: add bindings for MIPI DBI
 compatible SPI panels
Date: Tue, 25 Jan 2022 18:56:58 +0100
Message-Id: <20220125175700.37408-2-noralf@tronnes.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220125175700.37408-1-noralf@tronnes.org>
References: <20220125175700.37408-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f6Fm+t6M c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8 a=gEfo2CItAAAA:8
 a=_-IPm86n_tWj2rs9gvkA:9 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19
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

v2:
- Fix path for panel-common.yaml
- Use unevaluatedProperties
- Drop properties which are in the allOf section
- Drop model property (Rob)

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 .../display/panel/panel-mipi-dbi-spi.yaml     | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
new file mode 100644
index 000000000000..b7cbeea0f8aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-mipi-dbi-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPI DBI SPI Panels Device Tree Bindings
+
+maintainers:
+  - Noralf Trønnes <noralf@tronnes.org>
+
+description:
+  This binding is for display panels using a MIPI DBI controller
+  in SPI mode.
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: panel-mipi-dbi-spi
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
+                    compatible = "panel-mipi-dbi-spi";
+                    reg = <0>;
+                    spi-max-frequency = <40000000>;
+                    dc-gpios = <&gpio 24 GPIO_ACTIVE_HIGH>;
+                    reset-gpios = <&gpio 25 GPIO_ACTIVE_HIGH>;
+                    write-only;
+            };
+    };
+
+...
-- 
2.33.0

