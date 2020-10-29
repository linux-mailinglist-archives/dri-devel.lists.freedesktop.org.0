Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BB229F6D3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 22:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AB76E905;
	Thu, 29 Oct 2020 21:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B176E905
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 21:28:50 +0000 (UTC)
IronPort-SDR: mEGB1sAYduTHNiQJyizvYOeNZ0b8hEI1DM3BllKIaRxzKpleD4JmOu/rS31Wv1NPoHHAaw6t0j
 +7GiHHaJVBgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="165928991"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="165928991"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 14:28:50 -0700
IronPort-SDR: EmZZy+M3eVuQLuxT90YdqJ9zGg+14i9HbufKAb3Jtun7znia0J3F758EstE1cQjljV6hg4bMnS
 /VyJTDFTr6+g==
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="469282821"
Received: from nschweme-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.34.96])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 29 Oct 2020 14:28:49 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org,
	anitha.chrisanthus@intel.com
Subject: [PATCH v10 1/6] dt-bindings: display: Add support for Intel KeemBay
 Display
Date: Thu, 29 Oct 2020 14:27:52 -0700
Message-Id: <1604006877-20092-2-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604006877-20092-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1604006877-20092-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: edmund.j.dea@intel.com, sam@ravnborg.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for Intel KeemBay Display

v2: review changes from Rob Herring
v3: review changes from Sam Ravnborg (removed mipi dsi entries, and
    encoder entry, connect port to dsi)
    MSSCAM is part of the display submodule and its used to reset LCD
    and MIPI DSI clocks, so its best to be on this device tree.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 .../bindings/display/intel,keembay-display.yaml    | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/intel,keembay-display.yaml

diff --git a/Documentation/devicetree/bindings/display/intel,keembay-display.yaml b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
new file mode 100644
index 0000000..8a8effe
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/intel,keembay-display.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Devicetree bindings for Intel Keem Bay display controller
+
+maintainers:
+  - Anitha Chrisanthus <anitha.chrisanthus@intel.com>
+  - Edmond J Dea <edmund.j.dea@intel.com>
+
+properties:
+  compatible:
+    const: intel,keembay-display
+
+  reg:
+    items:
+      - description: LCD registers range
+      - description: Msscam registers range
+
+  reg-names:
+    items:
+      - const: lcd
+      - const: msscam
+
+  clocks:
+    items:
+      - description: LCD controller clock
+      - description: pll0 clock
+
+  clock-names:
+    items:
+      - const: clk_lcd
+      - const: clk_pll0
+
+  interrupts:
+    maxItems: 1
+
+  port:
+    type: object
+    description: Display output node to DSI.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    display@20930000 {
+        compatible = "intel,keembay-display";
+        reg = <0x20930000 0x3000>,
+              <0x20910000 0x30>;
+        reg-names = "lcd", "msscam";
+        interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&scmi_clk 0x83>,
+                 <&scmi_clk 0x0>;
+        clock-names = "clk_lcd", "clk_pll0";
+
+        port {
+            disp_out: endpoint {
+                remote-endpoint = <&dsi_in>;
+            };
+        };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
