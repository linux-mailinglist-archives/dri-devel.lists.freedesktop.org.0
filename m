Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04407505A52
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 16:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E8110E32D;
	Mon, 18 Apr 2022 14:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD1410E32D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 14:51:26 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CB04883868;
 Mon, 18 Apr 2022 16:51:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650293483;
 bh=G+o0RqVFvwCiOOOZ40z294e9IGfoIibVB7CZ/vAAsnQ=;
 h=From:To:Cc:Subject:Date:From;
 b=HPoD2EZaBNxZhvHpJ//UoI8areAfrHBOHxyoDRP5bwBi87OVoAGz49NoI1DpWH5f4
 bJuo0w81ZHaJJC7QuPbOHvrSEypKuDkHcZopXxI2p7C2T/L/AyvV5cr/dfVBASJyDe
 vt5HnfkcdE18Bzy6SQs3dGqHXhl2cqYZS7Yn8WkZH02iDdZYYoISrtLLd3y4LX4lWA
 9gmnVnp0w8bikvNc76IsCTmgt38MGlDHdZB+IkdSq97SCMz3KtHMpJgwi81N9nmh8U
 LchuQkLEYvO6eBMU6mig7usFe3HuYClgOM25yi/ofxPEuchoTrRYC4HrMf/PY3HE5c
 itAFseV8yUQTA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] dt-bindings: display: bridge: ldb: Implement simple
 NXP i.MX8M LDB bridge
Date: Mon, 18 Apr 2022 16:51:04 +0200
Message-Id: <20220418145105.76986-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Robert Foss <robert.foss@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robby Cai <robby.cai@nxp.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The i.MX8MP contains two syscon registers which are responsible
for configuring the on-SoC DPI-to-LVDS serializer. Add DT binding
which represents this serializer as a bridge.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
V2: - Consistently use fsl,imx8mp-ldb as compatible
    - Drop items: from compatible:
    - Replace minItems with maxItems in clocks:
    - Drop quotes from clock-names const: ldb
    - Rename syscon to fsl,syscon
    - Use generic name of ldb-lvds in example
---
 .../bindings/display/bridge/nxp,ldb.yaml      | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml
new file mode 100644
index 0000000000000..f3182566eb316
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/nxp,ldb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8M DPI to LVDS bridge chip
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+description: |
+  The i.MX8MP contains two syscon registers which are responsible
+  for configuring the on-SoC DPI-to-LVDS serializer. This describes
+  those registers as bridge within the DT.
+
+properties:
+  compatible:
+    const: fsl,imx8mp-ldb
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: ldb
+
+  fsl,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: A phandle to media block controller.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for DPI input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for LVDS Channel-A output (panel or bridge).
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for LVDS Channel-B output (panel or bridge).
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - clocks
+  - fsl,syscon
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+
+    bridge {
+        compatible = "fsl,imx8mp-ldb";
+        clocks = <&clk IMX8MP_CLK_MEDIA_LDB>;
+        clock-names = "ldb";
+        fsl,syscon = <&media_blk_ctrl>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                ldb_from_lcdif2: endpoint {
+                    remote-endpoint = <&lcdif2_to_ldb>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                ldb_lvds_ch0: endpoint {
+                    remote-endpoint = <&ldb_to_lvdsx4panel>;
+                };
+            };
+
+            port@2 {
+                reg = <2>;
+
+                ldb_lvds_ch1: endpoint {
+                };
+            };
+        };
+    };
-- 
2.35.1

