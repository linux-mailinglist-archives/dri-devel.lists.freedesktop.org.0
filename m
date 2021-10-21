Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D56484360EB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 14:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91876EC4A;
	Thu, 21 Oct 2021 12:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E6C6EC4A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 12:01:27 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2c41:c2bf:5c8f:53c5])
 by laurent.telenet-ops.be with bizsmtp
 id 8c1R260021Z5S4H01c1Rhs; Thu, 21 Oct 2021 14:01:25 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mdWlA-006Y6m-Pe; Thu, 21 Oct 2021 14:01:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mdWlA-00GCux-18; Thu, 21 Oct 2021 14:01:24 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [RFC] dt-bindings: display: bridge: sil,
 sii9022: Convert to json-schema
Date: Thu, 21 Oct 2021 14:01:22 +0200
Message-Id: <1ad70333148a473c1344a87993e795be90f355e4.1634817622.git.geert+renesas@glider.be>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the Silicon Image sii902x HDMI bridge Device Tree binding
documentation to json-schema.

Add missing sil,sii9022-cpi and sil,sii9022-tpi compatible values.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
RFC as I do not know the meaning of the various ports subnodes.
---
 .../bindings/display/bridge/sii902x.txt       |  78 ----------
 .../bindings/display/bridge/sil,sii9022.yaml  | 133 ++++++++++++++++++
 2 files changed, 133 insertions(+), 78 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/sii902x.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/sii902x.txt b/Documentation/devicetree/bindings/display/bridge/sii902x.txt
deleted file mode 100644
index 3bc760cc31cbbeee..0000000000000000
--- a/Documentation/devicetree/bindings/display/bridge/sii902x.txt
+++ /dev/null
@@ -1,78 +0,0 @@
-sii902x HDMI bridge bindings
-
-Required properties:
-	- compatible: "sil,sii9022"
-	- reg: i2c address of the bridge
-
-Optional properties:
-	- interrupts: describe the interrupt line used to inform the host
-	  about hotplug events.
-	- reset-gpios: OF device-tree gpio specification for RST_N pin.
-	- iovcc-supply: I/O Supply Voltage (1.8V or 3.3V)
-	- cvcc12-supply: Digital Core Supply Voltage (1.2V)
-
-	HDMI audio properties:
-	- #sound-dai-cells: <0> or <1>. <0> if only i2s or spdif pin
-	   is wired, <1> if the both are wired. HDMI audio is
-	   configured only if this property is found.
-	- sil,i2s-data-lanes: Array of up to 4 integers with values of 0-3
-	   Each integer indicates which i2s pin is connected to which
-	   audio fifo. The first integer selects i2s audio pin for the
-	   first audio fifo#0 (HDMI channels 1&2), second for fifo#1
-	   (HDMI channels 3&4), and so on. There is 4 fifos and 4 i2s
-	   pins (SD0 - SD3). Any i2s pin can be connected to any fifo,
-	   but there can be no gaps. E.g. an i2s pin must be mapped to
-	   fifo#0 and fifo#1 before mapping a channel to fifo#2. Default
-	   value is <0>, describing SD0 pin beiging routed to hdmi audio
-	   fifo #0.
-	- clocks: phandle and clock specifier for each clock listed in
-           the clock-names property
-	- clock-names: "mclk"
-	   Describes SII902x MCLK input. MCLK can be used to produce
-	   HDMI audio CTS values. This property follows
-	   Documentation/devicetree/bindings/clock/clock-bindings.txt
-	   consumer binding.
-
-	If HDMI audio is configured the sii902x device becomes an I2S
-	and/or spdif audio codec component (e.g a digital audio sink),
-	that can be used in configuring a full audio devices with
-	simple-card or audio-graph-card binding. See their binding
-	documents on how to describe the way the sii902x device is
-	connected to the rest of the audio system:
-	Documentation/devicetree/bindings/sound/simple-card.yaml
-	Documentation/devicetree/bindings/sound/audio-graph-card.yaml
-	Note: In case of the audio-graph-card binding the used port
-	index should be 3.
-
-Optional subnodes:
-	- video input: this subnode can contain a video input port node
-	  to connect the bridge to a display controller output (See this
-	  documentation [1]).
-
-[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-	hdmi-bridge@39 {
-		compatible = "sil,sii9022";
-		reg = <0x39>;
-		reset-gpios = <&pioA 1 0>;
-		iovcc-supply = <&v3v3_hdmi>;
-		cvcc12-supply = <&v1v2_hdmi>;
-
-		#sound-dai-cells = <0>;
-		sil,i2s-data-lanes = < 0 1 2 >;
-		clocks = <&mclk>;
-		clock-names = "mclk";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				bridge_in: endpoint {
-					remote-endpoint = <&dc_out>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml b/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
new file mode 100644
index 0000000000000000..4e5a8ecf87647e8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/sil,sii9022.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silicon Image sii902x HDMI bridge
+
+maintainers:
+  - Boris Brezillon <bbrezillon@kernel.org>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - sil,sii9022-cpi
+              - sil,sii9022-tpi
+          - const: sil,sii9022
+      - const: sil,sii9022
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: Interrupt line used to inform the host about hotplug events.
+
+  reset-gpios:
+    maxItems: 1
+
+  iovcc-supply:
+    description: I/O Supply Voltage (1.8V or 3.3V)
+
+  cvcc12-supply:
+    description: Digital Core Supply Voltage (1.2V)
+
+  '#sound-dai-cells':
+    enum: [ 0, 1 ]
+    description: |
+      <0> if only i2s or spdif pin is wired,
+      <1> if both are wired.
+      HDMI audio is configured only if this property is found.
+      If HDMI audio is configured the sii902x device becomes an I2S and/or
+      spdif audio codec component (e.g. a digital audio sink), that can be used
+      in configuring a full audio devices with simple-card or audio-graph-card
+      binding. See their binding documents on how to describe the way the
+      sii902x device is connected to the rest of the audio system:
+      Documentation/devicetree/bindings/sound/simple-card.yaml
+      Documentation/devicetree/bindings/sound/audio-graph-card.yaml
+      Note: In case of the audio-graph-card binding the used port index should
+      be 3.
+
+  sil,i2s-data-lanes:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    items:
+      - enum: [ 0, 1, 2, 3 ]
+      - enum: [ 0, 1, 2, 3 ]
+      - enum: [ 0, 1, 2, 3 ]
+      - enum: [ 0, 1, 2, 3 ]
+    description:
+      Each integer indicates which i2s pin is connected to which audio fifo.
+      The first integer selects i2s audio pin for the first audio fifo#0 (HDMI
+      channels 1&2), second for fifo#1 (HDMI channels 3&4), and so on. There
+      are 4 fifos and 4 i2s pins (SD0 - SD3). Any i2s pin can be connected to
+      any fifo, but there can be no gaps. E.g. an i2s pin must be mapped to
+      fifo#0 and fifo#1 before mapping a channel to fifo#2. Default value is
+      <0>, describing SD0 pin being routed to hdmi audio fifo #0.
+
+  clocks:
+    maxItems: 1
+    description: MCLK input. MCLK can be used to produce HDMI audio CTS values.
+
+  clock-names:
+    const: mclk
+
+  ports:
+    type: object
+    properties:
+      port@0:
+        type: object
+        description: FIXME
+
+      port@1:
+        type: object
+        description: FIXME
+
+      port@2:
+        type: object
+        description: FIXME
+
+      port@3:
+        type: object
+        description: FIXME
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hdmi-bridge@39 {
+            compatible = "sil,sii9022";
+            reg = <0x39>;
+            reset-gpios = <&pioA 1 0>;
+            iovcc-supply = <&v3v3_hdmi>;
+            cvcc12-supply = <&v1v2_hdmi>;
+
+            #sound-dai-cells = <0>;
+            sil,i2s-data-lanes = < 0 1 2 >;
+            clocks = <&mclk>;
+            clock-names = "mclk";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    bridge_in: endpoint {
+                        remote-endpoint = <&dc_out>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.25.1

