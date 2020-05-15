Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C98301D421E
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 02:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DB96E3C1;
	Fri, 15 May 2020 00:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24756E3C1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 00:33:53 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3295D26A;
 Fri, 15 May 2020 02:33:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1589502832;
 bh=//lWJ/GWSbN1XdqqfqDIIONqXThNg4HFWcvGyzaU3VE=;
 h=From:To:Cc:Subject:Date:From;
 b=kZ3g+3MQIgNn2C2PsjjeynZIpUFBzB64R+m8DY1IeuCKDzFElTmswkATaABmW5uc+
 8AtINY1ap5DAM3MnuG5vUWSk3f4Fy873JL/Tz/VZuHOjek64XDWfp4jy09LvjdHvtw
 OUHIqRHMkNjrhTpyH8418VfkD6hFWTvERyn6DWno=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dt-bindings: display: renesas,du: Convert binding to YAML
Date: Fri, 15 May 2020 03:33:40 +0300
Message-Id: <20200515003340.18191-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the Renesas R-Car DU text binding to YAML.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../bindings/display/renesas,du.txt           | 139 ---
 .../bindings/display/renesas,du.yaml          | 915 ++++++++++++++++++
 2 files changed, 915 insertions(+), 139 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/renesas,du.txt
 create mode 100644 Documentation/devicetree/bindings/display/renesas,du.yaml

diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
deleted file mode 100644
index 51cd4d162770..000000000000
--- a/Documentation/devicetree/bindings/display/renesas,du.txt
+++ /dev/null
@@ -1,139 +0,0 @@
-* Renesas R-Car Display Unit (DU)
-
-Required Properties:
-
-  - compatible: must be one of the following.
-    - "renesas,du-r8a7743" for R8A7743 (RZ/G1M) compatible DU
-    - "renesas,du-r8a7744" for R8A7744 (RZ/G1N) compatible DU
-    - "renesas,du-r8a7745" for R8A7745 (RZ/G1E) compatible DU
-    - "renesas,du-r8a77470" for R8A77470 (RZ/G1C) compatible DU
-    - "renesas,du-r8a774a1" for R8A774A1 (RZ/G2M) compatible DU
-    - "renesas,du-r8a774b1" for R8A774B1 (RZ/G2N) compatible DU
-    - "renesas,du-r8a774c0" for R8A774C0 (RZ/G2E) compatible DU
-    - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
-    - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
-    - "renesas,du-r8a7791" for R8A7791 (R-Car M2-W) compatible DU
-    - "renesas,du-r8a7792" for R8A7792 (R-Car V2H) compatible DU
-    - "renesas,du-r8a7793" for R8A7793 (R-Car M2-N) compatible DU
-    - "renesas,du-r8a7794" for R8A7794 (R-Car E2) compatible DU
-    - "renesas,du-r8a7795" for R8A7795 (R-Car H3) compatible DU
-    - "renesas,du-r8a7796" for R8A7796 (R-Car M3-W) compatible DU
-    - "renesas,du-r8a77965" for R8A77965 (R-Car M3-N) compatible DU
-    - "renesas,du-r8a77970" for R8A77970 (R-Car V3M) compatible DU
-    - "renesas,du-r8a77980" for R8A77980 (R-Car V3H) compatible DU
-    - "renesas,du-r8a77990" for R8A77990 (R-Car E3) compatible DU
-    - "renesas,du-r8a77995" for R8A77995 (R-Car D3) compatible DU
-
-  - reg: the memory-mapped I/O registers base address and length
-
-  - interrupts: Interrupt specifiers for the DU interrupts.
-
-  - clocks: A list of phandles + clock-specifier pairs, one for each entry in
-    the clock-names property.
-  - clock-names: Name of the clocks. This property is model-dependent.
-    - R8A7779 uses a single functional clock. The clock doesn't need to be
-      named.
-    - All other DU instances use one functional clock per channel The
-      functional clocks must be named "du.x" with "x" being the channel
-      numerical index.
-    - In addition to the functional clocks, all DU versions also support
-      externally supplied pixel clocks. Those clocks are optional. When
-      supplied they must be named "dclkin.x" with "x" being the input clock
-      numerical index.
-
-  - renesas,cmms: A list of phandles to the CMM instances present in the SoC,
-    one for each available DU channel. The property shall not be specified for
-    SoCs that do not provide any CMM (such as V3M and V3H).
-
-  - renesas,vsps: A list of phandle and channel index tuples to the VSPs that
-    handle the memory interfaces for the DU channels. The phandle identifies the
-    VSP instance that serves the DU channel, and the channel index identifies
-    the LIF instance in that VSP.
-
-Optional properties:
-  - resets: A list of phandle + reset-specifier pairs, one for each entry in
-    the reset-names property.
-  - reset-names: Names of the resets. This property is model-dependent.
-    - All but R8A7779 use one reset for a group of one or more successive
-      channels. The resets must be named "du.x" with "x" being the numerical
-      index of the lowest channel in the group.
-
-Required nodes:
-
-The connections to the DU output video ports are modeled using the OF graph
-bindings specified in Documentation/devicetree/bindings/graph.txt.
-
-The following table lists for each supported model the port number
-corresponding to each DU output.
-
-                        Port0          Port1          Port2          Port3
------------------------------------------------------------------------------
- R8A7743 (RZ/G1M)       DPAD 0         LVDS 0         -              -
- R8A7744 (RZ/G1N)       DPAD 0         LVDS 0         -              -
- R8A7745 (RZ/G1E)       DPAD 0         DPAD 1         -              -
- R8A77470 (RZ/G1C)      DPAD 0         DPAD 1         LVDS 0         -
- R8A774A1 (RZ/G2M)      DPAD 0         HDMI 0         LVDS 0         -
- R8A774B1 (RZ/G2N)      DPAD 0         HDMI 0         LVDS 0         -
- R8A774C0 (RZ/G2E)      DPAD 0         LVDS 0         LVDS 1         -
- R8A7779 (R-Car H1)     DPAD 0         DPAD 1         -              -
- R8A7790 (R-Car H2)     DPAD 0         LVDS 0         LVDS 1         -
- R8A7791 (R-Car M2-W)   DPAD 0         LVDS 0         -              -
- R8A7792 (R-Car V2H)    DPAD 0         DPAD 1         -              -
- R8A7793 (R-Car M2-N)   DPAD 0         LVDS 0         -              -
- R8A7794 (R-Car E2)     DPAD 0         DPAD 1         -              -
- R8A7795 (R-Car H3)     DPAD 0         HDMI 0         HDMI 1         LVDS 0
- R8A7796 (R-Car M3-W)   DPAD 0         HDMI 0         LVDS 0         -
- R8A77965 (R-Car M3-N)  DPAD 0         HDMI 0         LVDS 0         -
- R8A77970 (R-Car V3M)   DPAD 0         LVDS 0         -              -
- R8A77980 (R-Car V3H)   DPAD 0         LVDS 0         -              -
- R8A77990 (R-Car E3)    DPAD 0         LVDS 0         LVDS 1         -
- R8A77995 (R-Car D3)    DPAD 0         LVDS 0         LVDS 1         -
-
-
-Example: R8A7795 (R-Car H3) ES2.0 DU
-
-	du: display@feb00000 {
-		compatible = "renesas,du-r8a7795";
-		reg = <0 0xfeb00000 0 0x80000>;
-		interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cpg CPG_MOD 724>,
-			 <&cpg CPG_MOD 723>,
-			 <&cpg CPG_MOD 722>,
-			 <&cpg CPG_MOD 721>;
-		clock-names = "du.0", "du.1", "du.2", "du.3";
-		resets = <&cpg 724>, <&cpg 722>;
-		reset-names = "du.0", "du.2";
-		renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>, <&cmm3>;
-		renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				du_out_rgb: endpoint {
-				};
-			};
-			port@1 {
-				reg = <1>;
-				du_out_hdmi0: endpoint {
-					remote-endpoint = <&dw_hdmi0_in>;
-				};
-			};
-			port@2 {
-				reg = <2>;
-				du_out_hdmi1: endpoint {
-					remote-endpoint = <&dw_hdmi1_in>;
-				};
-			};
-			port@3 {
-				reg = <3>;
-				du_out_lvds0: endpoint {
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
new file mode 100644
index 000000000000..ca48065afe1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -0,0 +1,915 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/renesas,du.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Display Unit (DU)
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description: |
+  These DT bindings describe the Display Unit embedded in the Renesas R-Car
+  Gen1, R-Car Gen2, R-Car Gen3, RZ/G1 and RZ/G2 SoCs.
+
+properties:
+  compatible:
+    enum:
+      - renesas,du-r8a7743 # for RZ/G1M compatible DU
+      - renesas,du-r8a7744 # for RZ/G1N compatible DU
+      - renesas,du-r8a7745 # for RZ/G1E compatible DU
+      - renesas,du-r8a77470 # for RZ/G1C compatible DU
+      - renesas,du-r8a774a1 # for RZ/G2M compatible DU
+      - renesas,du-r8a774b1 # for RZ/G2N compatible DU
+      - renesas,du-r8a774c0 # for RZ/G2E compatible DU
+      - renesas,du-r8a7779 # for R-Car H1 compatible DU
+      - renesas,du-r8a7790 # for R-Car H2 compatible DU
+      - renesas,du-r8a7791 # for R-Car M2-W compatible DU
+      - renesas,du-r8a7792 # for R-Car V2H compatible DU
+      - renesas,du-r8a7793 # for R-Car M2-N compatible DU
+      - renesas,du-r8a7794 # for R-Car E2 compatible DU
+      - renesas,du-r8a7795 # for R-Car H3 compatible DU
+      - renesas,du-r8a7796 # for R-Car M3-W compatible DU
+      - renesas,du-r8a77965 # for R-Car M3-N compatible DU
+      - renesas,du-r8a77970 # for R-Car V3M compatible DU
+      - renesas,du-r8a77980 # for R-Car V3H compatible DU
+      - renesas,du-r8a77990 # for R-Car E3 compatible DU
+      - renesas,du-r8a77995 # for R-Car D3 compatible DU
+
+  reg:
+    maxItems: 1
+
+  # See compatible-specific constraints below.
+  clocks: true
+  clock-names: true
+  interrupts: true
+  resets: true
+  reset-names: true
+
+  ports:
+    type: object
+    description: |
+      The connections to the DU output video ports are modeled using the OF
+      graph bindings specified in Documentation/devicetree/bindings/graph.txt.
+      The number of ports and their assignment are model-dependent. Each port
+      shall have a single endpoint.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^port@[0-3]$":
+        type: object
+
+        properties:
+          reg:
+            maxItems: 1
+
+          endpoint:
+            type: object
+
+            properties:
+              remote-endpoint:
+                $ref: /schemas/types.yaml#/definitions/phandle
+
+            required:
+              - remote-endpoint
+
+            additionalProperties: false
+
+        additionalProperties: false
+
+    required:
+      - port@0
+      - port@1
+
+    additionalProperties: false
+
+  renesas,cmms:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description:
+      A list of phandles to the CMM instances present in the SoC, one for each
+      available DU channel.
+
+  renesas,vsps:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description:
+      A list of phandle and channel index tuples to the VSPs that handle the
+      memory interfaces for the DU channels. The phandle identifies the VSP
+      instance that serves the DU channel, and the channel index identifies
+      the LIF instance in that VSP.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - resets
+  - ports
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,du-r8a7779
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 3
+          items:
+            - description: Functional clock
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+
+        clock-names:
+          minItems: 1
+          maxItems: 3
+          items:
+            - const: du.0
+            - enum:
+              - dclkin.0
+              - dclkin.1
+            - enum:
+              - dclkin.0
+              - dclkin.1
+
+        interrupts:
+          maxItems: 1
+
+        resets:
+          maxItems: 1
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: DPAD 1
+            # port@2 is TCON, not supported yet
+            port@2: false
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+
+      required:
+        - interrupts
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a7743
+              - renesas,du-r8a7744
+              - renesas,du-r8a7791
+              - renesas,du-r8a7793
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 4
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+
+        clock-names:
+          minItems: 2
+          maxItems: 4
+          items:
+            - const: du.0
+            - const: du.1
+            - enum:
+              - dclkin.0
+              - dclkin.1
+            - enum:
+              - dclkin.0
+              - dclkin.1
+
+        interrupts:
+          maxItems: 2
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: LVDS 0
+            # port@2 is TCON, not supported yet
+            port@2: false
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a7745
+              - renesas,du-r8a7792
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 4
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+
+        clock-names:
+          minItems: 2
+          maxItems: 4
+          items:
+            - const: du.0
+            - const: du.1
+            - enum:
+              - dclkin.0
+              - dclkin.1
+            - enum:
+              - dclkin.0
+              - dclkin.1
+
+        interrupts:
+          maxItems: 2
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: DPAD 1
+            port@2: false
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a7794
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 4
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+
+        clock-names:
+          minItems: 2
+          maxItems: 4
+          items:
+            - const: du.0
+            - const: du.1
+            - enum:
+              - dclkin.0
+              - dclkin.1
+            - enum:
+              - dclkin.0
+              - dclkin.1
+
+        interrupts:
+          maxItems: 2
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: DPAD 1
+            # port@2 is TCON, not supported yet
+            port@2: false
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a77470
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 4
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+
+        clock-names:
+          minItems: 2
+          maxItems: 4
+          items:
+            - const: du.0
+            - const: du.1
+            - enum:
+              - dclkin.0
+              - dclkin.1
+            - enum:
+              - dclkin.0
+              - dclkin.1
+
+        interrupts:
+          maxItems: 2
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: DPAD 1
+            port@2:
+              description: LVDS 0
+            # port@3 is DVENC, not supported yet
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a7790
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 6
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: Functional clock for DU2
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+            - description: DU_DOTCLKIN2 input clock
+
+        clock-names:
+          minItems: 3
+          maxItems: 6
+          items:
+            - const: du.0
+            - const: du.1
+            - const: du.2
+            - enum:
+              - dclkin.0
+              - dclkin.1
+              - dclkin.2
+            - enum:
+              - dclkin.0
+              - dclkin.1
+              - dclkin.2
+            - enum:
+              - dclkin.0
+              - dclkin.1
+              - dclkin.2
+
+        interrupts:
+          maxItems: 3
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: LVDS 0
+            port@2:
+              description: LVDS 1
+            # port@3 is TCON, not supported yet
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a7795
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 8
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: Functional clock for DU2
+            - description: Functional clock for DU4
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+            - description: DU_DOTCLKIN2 input clock
+            - description: DU_DOTCLKIN3 input clock
+
+        clock-names:
+          minItems: 4
+          maxItems: 8
+          items:
+            - const: du.0
+            - const: du.1
+            - const: du.2
+            - const: du.3
+            - enum:
+              - dclkin.0
+              - dclkin.1
+              - dclkin.2
+              - dclkin.3
+            - enum:
+              - dclkin.0
+              - dclkin.1
+              - dclkin.2
+              - dclkin.3
+            - enum:
+              - dclkin.0
+              - dclkin.1
+              - dclkin.2
+              - dclkin.3
+            - enum:
+              - dclkin.0
+              - dclkin.1
+              - dclkin.2
+              - dclkin.3
+
+        interrupts:
+          maxItems: 4
+
+        resets:
+          maxItems: 2
+
+        reset-names:
+          items:
+            - const: du.0
+            - const: du.2
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: HDMI 0
+            port@2:
+              description: HDMI 1
+            port@3:
+              description: LVDS 0
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+            - port@3
+
+        renesas,cmms:
+          minItems: 4
+
+        renesas,vsps:
+          minItems: 4
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+        - renesas,vsps
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a774a1
+              - renesas,du-r8a7796
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 6
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: Functional clock for DU2
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+            - description: DU_DOTCLKIN2 input clock
+
+        clock-names:
+          minItems: 3
+          maxItems: 6
+          items:
+            - const: du.0
+            - const: du.1
+            - const: du.2
+            - enum:
+              - dclkin.0
+              - dclkin.1
+              - dclkin.2
+            - enum:
+              - dclkin.0
+              - dclkin.1
+              - dclkin.2
+            - enum:
+              - dclkin.0
+              - dclkin.1
+              - dclkin.2
+
+        interrupts:
+          maxItems: 3
+
+        resets:
+          maxItems: 2
+
+        reset-names:
+          items:
+            - const: du.0
+            - const: du.2
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: HDMI 0
+            port@2:
+              description: LVDS 0
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+
+        renesas,cmms:
+          minItems: 3
+
+        renesas,vsps:
+          minItems: 3
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+        - renesas,vsps
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a774b1
+              - renesas,du-r8a77965
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 6
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: Functional clock for DU3
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+            - description: DU_DOTCLKIN3 input clock
+
+        clock-names:
+          minItems: 3
+          maxItems: 6
+          items:
+            - const: du.0
+            - const: du.1
+            - const: du.3
+            - enum:
+              - dclkin.0
+              - dclkin.1
+              - dclkin.3
+            - enum:
+              - dclkin.0
+              - dclkin.1
+              - dclkin.3
+            - enum:
+              - dclkin.0
+              - dclkin.1
+              - dclkin.3
+
+        interrupts:
+          maxItems: 3
+
+        resets:
+          maxItems: 2
+
+        reset-names:
+          items:
+            - const: du.0
+            - const: du.3
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: HDMI 0
+            port@2:
+              description: LVDS 0
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+
+        renesas,cmms:
+          minItems: 3
+
+        renesas,vsps:
+          minItems: 3
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+        - renesas,vsps
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a77970
+              - renesas,du-r8a77980
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 2
+          items:
+            - description: Functional clock for DU0
+            - description: DU_DOTCLKIN0 input clock
+
+        clock-names:
+          minItems: 1
+          maxItems: 2
+          items:
+            - const: du.0
+            - const: dclkin.0
+
+        interrupts:
+          maxItems: 1
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: LVDS 0
+            port@2: false
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+
+        renesas,vsps:
+          minItems: 1
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+        - renesas,vsps
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r8a774c0
+              - renesas,du-r8a77990
+              - renesas,du-r8a77995
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 4
+          items:
+            - description: Functional clock for DU0
+            - description: Functional clock for DU1
+            - description: DU_DOTCLKIN0 input clock
+            - description: DU_DOTCLKIN1 input clock
+
+        clock-names:
+          minItems: 2
+          maxItems: 4
+          items:
+            - const: du.0
+            - const: du.1
+            - enum:
+              - dclkin.0
+              - dclkin.1
+            - enum:
+              - dclkin.0
+              - dclkin.1
+
+        interrupts:
+          maxItems: 2
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: LVDS 0
+            port@2:
+              description: LVDS 1
+            # port@3 is TCON, not supported yet
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+
+        renesas,cmms:
+          minItems: 2
+
+        renesas,vsps:
+          minItems: 2
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+        - renesas,vsps
+
+additionalProperties: false
+
+examples:
+  # R-Car H3 ES2.0 DU
+  - |
+    #include <dt-bindings/clock/renesas-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    display@feb00000 {
+        compatible = "renesas,du-r8a7795";
+        reg = <0xfeb00000 0x80000>;
+        interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 724>,
+                 <&cpg CPG_MOD 723>,
+                 <&cpg CPG_MOD 722>,
+                 <&cpg CPG_MOD 721>;
+        clock-names = "du.0", "du.1", "du.2", "du.3";
+        resets = <&cpg 724>, <&cpg 722>;
+        reset-names = "du.0", "du.2";
+
+        renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>, <&cmm3>;
+        renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                endpoint {
+                    remote-endpoint = <&adv7123_in>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&dw_hdmi0_in>;
+                };
+            };
+            port@2 {
+                reg = <2>;
+                endpoint {
+                    remote-endpoint = <&dw_hdmi1_in>;
+                };
+            };
+            port@3 {
+                reg = <3>;
+                endpoint {
+                    remote-endpoint = <&lvds0_in>;
+                };
+            };
+        };
+    };
+
+...
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
