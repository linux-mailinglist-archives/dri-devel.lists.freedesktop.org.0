Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2554117CD97
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED756E1B3;
	Sat,  7 Mar 2020 10:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4B96ED2A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 14:12:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id D7F48296C97
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: Add ANX7688 HDMI to DP bridge binding
Date: Fri,  6 Mar 2020 15:12:15 +0100
Message-Id: <20200306141217.423914-3-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200306141217.423914-1-enric.balletbo@collabora.com>
References: <20200306141217.423914-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 07 Mar 2020 10:14:46 +0000
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
Cc: megous@megous.com, devicetree@vger.kernel.org, drinkcat@chromium.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, anarsoul@gmail.com,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Mark Rutland <mark.rutland@arm.com>,
 Collabora Kernel ML <kernel@collabora.com>, icenowy@aosc.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicolas Boichat <drinkcat@chromium.org>

Add documentation for DT properties supported by the ANX7688 HDMI-DP
converter.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v3:
- Adapt the bridge bindings for the multi-function device.

Changes in v2:
- Improve a bit the descriptions using the info from the datasheet.
- Convert binding to yaml.
- Use dual licensing.

 .../bridge/analogix,anx7688-bridge.yaml       | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7688-bridge.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7688-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7688-bridge.yaml
new file mode 100644
index 000000000000..c56da3f39dd8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7688-bridge.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/analogix,anx7688-bridge.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analogix ANX7688 HDMI to DisplayPort Bridge
+
+maintainers:
+  - Nicolas Boichat <drinkcat@chromium.org>
+  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
+
+description: |
+  The ANX7688 bridge describes the HDMI 2.0 to DisplayPort 1.3 bridge block
+  included in the ANX7688 chip controller. These are meant to be used for
+  controlling display-related signals.
+
+  The node of this device should be under an analogix,anx7866 node. Please refer
+  to Documentation/devicetree/bindings/mfd/analogix,anx7688.yaml for the ANX7688
+  core bindings.
+
+properties:
+  compatible:
+    const: analogix,anx7688-bridge
+
+  ports:
+    type: object
+
+    properties:
+      port@0:
+        type: object
+        description: |
+          Video port for HDMI input
+
+      port@1:
+        type: object
+        description: |
+          Video port for DP output
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - ports
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        anx7688: anx7688@2c {
+            compatible = "analogix,anx7688";
+            reg = <0x2c>;
+
+            bridge {
+                compatible = "analogix,anx7688-bridge";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        anx7688_in: endpoint {
+                            remote-endpoint = <&hdmi0_out>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        anx7688_out: endpoint {
+                            remote-endpoint = <&typec0_connector>;
+                       };
+                    };
+                };
+            };
+        };
+    };
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
