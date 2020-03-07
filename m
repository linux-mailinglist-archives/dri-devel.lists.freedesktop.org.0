Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2AF17F1A7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1AE6E82C;
	Tue, 10 Mar 2020 08:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from v6.sk (v6.sk [167.172.42.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6656E35F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 08:40:50 +0000 (UTC)
Received: from localhost (v6.sk [IPv6:::1])
 by v6.sk (Postfix) with ESMTP id D65DC60FF8;
 Mon,  9 Mar 2020 08:32:35 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RESEND PATCH v2 2/3] dt-bindings: display: Add Chrontel CH7033 Video
 Encoder binding
Date: Sat,  7 Mar 2020 20:07:59 +0100
Message-Id: <20200307190800.142658-3-lkundrak@v3.sk>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200307190800.142658-1-lkundrak@v3.sk>
References: <20200307190800.142658-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add binding document for the Chrontel CH7033 VGA/DVI/HDMI Encoder.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Reviewed-by: Rob Herring <robh@kernel.org>

---
Changes since v1:
- Dual licensed with BSD-2-Clause
- Collected Rob's reviewed-by tag

 .../display/bridge/chrontel,ch7033.yaml       | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
new file mode 100644
index 0000000000000..dc97f34fbfe0f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2019 Lubomir Rintel <lkundrak@v3.sk>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/chrontel,ch7033.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chrontel CH7033 Video Encoder Device Tree Bindings
+
+maintainers:
+  - Lubomir Rintel <lkundrak@v3.sk>
+
+properties:
+  compatible:
+    const: chrontel,ch7033
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device
+
+  ports:
+    type: object
+
+    properties:
+      port@0:
+        type: object
+        description: |
+          Video port for RGB input.
+
+      port@1:
+        type: object
+        description: |
+          DVI port, should be connected to a node compatible with the
+          dvi-connector binding.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    dvi-connector {
+        compatible = "dvi-connector";
+        ddc-i2c-bus = <&twsi5>;
+        hpd-gpios = <&gpio 62 GPIO_ACTIVE_LOW>;
+        digital;
+        analog;
+
+        port {
+            dvi_in: endpoint {
+                remote-endpoint = <&encoder_out>;
+            };
+        };
+    };
+
+    vga-dvi-encoder@76 {
+        compatible = "chrontel,ch7033";
+        reg = <0x76>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                endpoint {
+                    remote-endpoint = <&lcd0_rgb_out>;
+                };
+            };
+
+            encoder_out: port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&dvi_in>;
+                };
+            };
+
+        };
+    };
-- 
2.24.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
