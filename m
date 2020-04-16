Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0001AC1CB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 14:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336D36E0FB;
	Thu, 16 Apr 2020 12:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3E66E05F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 12:51:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 5340D2A00AE
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: display: dw_mipi_dsi.txt: convert to yaml
Date: Thu, 16 Apr 2020 15:52:07 +0300
Message-Id: <20200416125207.425271-1-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.26.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This converts the Synopsis MIPI DSI binding documentation to yaml and
should be quite straightforward. I've added a missing ref clk and also
added Mark and Rob as maintainers based on 'get_maintainer.pl' results.

Cc: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 .../bindings/display/bridge/dw_mipi_dsi.txt   | 32 ---------
 .../display/bridge/snps,dw-mipi-dsi.yaml      | 66 +++++++++++++++++++
 2 files changed, 66 insertions(+), 32 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt b/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
deleted file mode 100644
index b13adf30b8d3..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Synopsys DesignWare MIPI DSI host controller
-============================================
-
-This document defines device tree properties for the Synopsys DesignWare MIPI
-DSI host controller. It doesn't constitue a device tree binding specification
-by itself but is meant to be referenced by platform-specific device tree
-bindings.
-
-When referenced from platform device tree bindings the properties defined in
-this document are defined as follows. The platform device tree bindings are
-responsible for defining whether each optional property is used or not.
-
-- reg: Memory mapped base address and length of the DesignWare MIPI DSI
-  host controller registers. (mandatory)
-
-- clocks: References to all the clocks specified in the clock-names property
-  as specified in [1]. (mandatory)
-
-- clock-names:
-  - "pclk" is the peripheral clock for either AHB and APB. (mandatory)
-  - "px_clk" is the pixel clock for the DPI/RGB input. (optional)
-
-- resets: References to all the resets specified in the reset-names property
-  as specified in [2]. (optional)
-
-- reset-names: string reset name, must be "apb" if used. (optional)
-
-- panel or bridge node: see [3]. (mandatory)
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Documentation/devicetree/bindings/reset/reset.txt
-[3] Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
diff --git a/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
new file mode 100644
index 000000000000..0ab4125eee30
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/snps,dw-mipi-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare MIPI DSI host controller
+
+maintainers:
+  - Rob Herring <robh+dt@kernel.org>
+  - Mark Rutland <mark.rutland@arm.com>
+
+description: |
+  This document defines device tree properties for the Synopsys DesignWare MIPI
+  DSI host controller. It doesn't constitue a device tree binding specification
+  by itself but is meant to be referenced by platform-specific device tree
+  bindings.
+
+  When referenced from platform device tree bindings the properties defined in
+  this document are defined as follows. The platform device tree bindings are
+  responsible for defining whether each property is required or optional.
+
+properties:
+  reg:
+    description: |
+      Memory mapped base address and length of the DesignWare MIPI DSI host
+      controller registers.
+
+  clocks:
+    description: |
+      References to all the clocks specified in the clock-names property as
+      specified in Documentation/devicetree/bindings/clock/clock-bindings.txt
+    items:
+      - description: Module clock
+      - description: DSI bus colck for either AHB and APB
+      - description: Pixel clock for the DPI/RGB input
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: ref
+      - const: pclk
+      - const: px_clk
+    minItems: 2
+    maxItems: 3
+
+  resets:
+    description: |
+      References to all the resets specified in the reset-names property as
+      specified in Documentation/devicetree/bindings/reset/reset.txt
+
+  reset-names:
+    const: apb
+
+patternProperties:
+  "^panel@[0-3]$":
+    type: object
+    description: |
+      A node containing the panel or bridge description as documented in
+      Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
+
+required:
+  - reg
+  - clocks
+  - clock-names
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
