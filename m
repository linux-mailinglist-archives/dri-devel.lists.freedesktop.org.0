Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D663A2DF03
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 17:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6F310E357;
	Sun,  9 Feb 2025 16:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="azTnjC2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com
 [95.215.58.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF5110E357
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 16:09:45 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1739117384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cGPrWYiaszc/hGbqTndeBLFv8gf9jtKw7BwTzHjws2o=;
 b=azTnjC2JWQVYhsa2WiylyvgJOZg+8Ew+oHxOCH36d5+/CAs2WKJztwsW6I71mVm4+5i5Xm
 sMmYD5KcyO8CyLeBdpTv3KX7nRYhzeMbjO01KbtVIamUCYBzrxxW92C0k54qDu/VNCIWVA
 T1SnvLXaHCwnz4kQxafj3ik7c/5wbkk=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v5 2/3] dt-bindings: display: ti: Add schema for AM625 OLDI
 Transmitter
Date: Sun,  9 Feb 2025 21:39:24 +0530
Message-Id: <20250209160925.380348-3-aradhya.bhatia@linux.dev>
In-Reply-To: <20250209160925.380348-1-aradhya.bhatia@linux.dev>
References: <20250209160925.380348-1-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

From: Aradhya Bhatia <a-bhatia1@ti.com>

The OLDI transmitters (TXes) do not have registers of their own, and are
dependent on the source video-ports (VPs) from the DSS to provide
configuration data. This hardware doesn't directly sit on the internal
bus of the SoC, but does so via the DSS. Hence, the OLDI TXes are
supposed to be child nodes under the DSS, and not independent devices.

Two of the OLDI TXes can function in tandem to output dual-link OLDI
output, or cloned single-link outputs. In these cases, one OLDI will be
the primary OLDI, and the other one, a companion. The following diagram
represents such a configuration.

+-----+-----+         +-------+
|     |     |         |       |
|     | VP1 +----+--->+ OLDI0 |  (Primary - may need companion)
|     |     |    |    |       |
| DSS +-----+    |    +-------+
|     |     |    |
|     | VP2 |    |    +-------+
|     |     |    |    |       |
+-----+-----+    +--->+ OLDI1 |  (Companion OLDI)
                      |       |
                      +-------+

The DSS in AM625 SoC has a configuration like the one above. The AM625
DSS VP1 (port@0) can connect and control 2 OLDI TXes, to use them in
dual-link or cloned single-link OLDI modes. It is only the VP1 that can
connect to either OLDI TXes for the AM625 DSS, and not the VP2.

Alternatively, on some future TI SoCs, along with the above
configuration, the OLDI TX can _also_ connect to separate video sources,
making them work entirely independent of each other. In this case,
neither of the OLDIs are "companion" or "secondary" OLDIs, and nor do
they require one. They both are independent and primary OLDIs. The
following diagram represents such a configuration.

+-----+-----+               +-------+
|     |     |               |       |
|     | VP1 +--+----------->+ OLDI0 |  (Primary - may need companion)
|     |     |  |            |       |
|     +-----+  |            +-------+
|     |     |  |
|     | VP2 |  |
|     |     |  |
| DSS +-----+  |   +---+    +-------+
|     |     |  +-->+ M |    |       |
|     | VP3 +----->+ U +--->+ OLDI1 |  (Companion or Primary)
|     |     |      | X |    |       |
|     +-----+      +---+    +-------+
|     |     |
|     | VP4 |
|     |     |
+-----+-----+

Note that depending on the mux configuration, the OLDIs can either be
working together in tandem - sourced by VP1, OR, they could be working
independently sourced by VP1 and VP3 respectively.
The idea is to support all the configurations with this OLDI TX schema.

The OLDI functionality is further supported by a system-control module,
which contains a few registers to control OLDI IO power and other
electrical characteristics of the IO lanes.

Add devicetree binding schema for the OLDI TXes to support various
configurations, and extend their support to the AM625 DSS.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 .../bindings/display/ti/ti,am625-oldi.yaml    |  88 ++++++++++
 .../bindings/display/ti/ti,am65x-dss.yaml     | 154 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 3 files changed, 243 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
new file mode 100644
index 000000000000..42a80a512660
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ti/ti,am625-oldi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments AM625 OLDI Transmitter
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+  - Aradhya Bhatia <aradhya.bhatia@linux.dev>
+
+description:
+  The AM625 TI Keystone OpenLDI transmitter (OLDI TX) supports serialized RGB
+  pixel data transmission between host and flat panel display over LVDS (Low
+  Voltage Differential Sampling) interface. The OLDI TX consists of 7-to-1 data
+  serializers, and 4-data and 1-clock LVDS outputs. It supports the LVDS output
+  formats "jeida-18", "jeida-24" and "vesa-18", and can accept 24-bit RGB or
+  padded and un-padded 18-bit RGB bus formats as input.
+
+properties:
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: serial clock input for the OLDI transmitters
+
+  clock-names:
+    const: serial
+
+  ti,companion-oldi:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to companion OLDI transmitter. This property is mandatory for the
+      primarty OLDI TX if the OLDI TXes are expected to work either in dual-lvds
+      mode or in clone mode. This property should point to the secondary OLDI
+      TX.
+
+  ti,secondary-oldi:
+    type: boolean
+    description:
+      Boolean property to mark the OLDI transmitter as the secondary one, when the
+      OLDI hardware is expected to run as a companion HW, in cases of dual-lvds
+      mode or clone mode. The primary OLDI hardware is responsible for all the
+      hardware configuration.
+
+  ti,oldi-io-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to syscon device node mapping OLDI IO_CTRL registers found in the
+      control MMR region. These registers are required to toggle the I/O lane
+      power, and control its electrical characteristics.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Parallel RGB input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: LVDS output port
+
+    required:
+      - port@0
+      - port@1
+
+allOf:
+  - if:
+      required:
+        - ti,secondary-oldi
+    then:
+      properties:
+        ti,companion-oldi: false
+
+required:
+  - reg
+  - clocks
+  - clock-names
+  - ti,oldi-io-ctrl
+  - ports
+
+additionalProperties: false
+
+...
diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 399d68986326..a82c525631ea 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -91,6 +91,24 @@ properties:
           For AM625 DSS, the internal DPI output port node from video
           port 1.
           For AM62A7 DSS, the port is tied off inside the SoC.
+        properties:
+          endpoint@0:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description:
+              For AM625 DSS, VP Connection to OLDI0.
+              For AM65X DSS, OLDI output from the SoC.
+
+          endpoint@1:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description:
+              For AM625 DSS, VP Connection to OLDI1.
+
+        anyOf:
+          - required:
+              - endpoint
+          - required:
+              - endpoint@0
+              - endpoint@1
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
@@ -112,6 +130,25 @@ properties:
       Input memory (from main memory to dispc) bandwidth limit in
       bytes per second
 
+  oldi-transmitters:
+    description:
+      Child node under the DSS, to describe all the OLDI transmitters connected
+      to the DSS videoports.
+    type: object
+    additionalProperties: false
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      '^oldi@[0-1]$':
+        $ref: ti,am625-oldi.yaml#
+        description: OLDI transmitters connected to the DSS VPs
+
 allOf:
   - if:
       properties:
@@ -120,10 +157,25 @@ allOf:
             const: ti,am62a7-dss
     then:
       properties:
+        oldi-transmitters: false
         ports:
           properties:
             port@0: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am65x-dss
+    then:
+      properties:
+        oldi-transmitters: false
+        ports:
+          properties:
+            port@0:
+              properties:
+                endpoint@1: false
+
 required:
   - compatible
   - reg
@@ -171,3 +223,105 @@ examples:
             };
         };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        dss1: dss@30200000 {
+            compatible = "ti,am625-dss";
+            reg = <0x00 0x30200000 0x00 0x1000>, /* common */
+                  <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
+                  <0x00 0x30206000 0x00 0x1000>, /* vid */
+                  <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
+                  <0x00 0x30208000 0x00 0x1000>, /* ovr2 */
+                  <0x00 0x3020a000 0x00 0x1000>, /* vp1 */
+                  <0x00 0x3020b000 0x00 0x1000>, /* vp2 */
+                  <0x00 0x30201000 0x00 0x1000>; /* common1 */
+            reg-names = "common", "vidl1", "vid",
+                        "ovr1", "ovr2", "vp1", "vp2", "common1";
+            power-domains = <&k3_pds 186 TI_SCI_PD_EXCLUSIVE>;
+            clocks =        <&k3_clks 186 6>,
+                            <&vp1_clock>,
+                            <&k3_clks 186 2>;
+            clock-names = "fck", "vp1", "vp2";
+            interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+            oldi-transmitters {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                oldi0: oldi@0 {
+                    reg = <0>;
+                    clocks = <&k3_clks 186 0>;
+                    clock-names = "serial";
+                    ti,companion-oldi = <&oldi1>;
+                    ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+                        port@0 {
+                            reg = <0>;
+                            oldi0_in: endpoint {
+                                remote-endpoint = <&dpi0_out0>;
+                            };
+                        };
+                        port@1 {
+                            reg = <1>;
+                            oldi0_out: endpoint {
+                                remote-endpoint = <&panel_in0>;
+                            };
+                        };
+                    };
+                };
+                oldi1: oldi@1 {
+                    reg = <1>;
+                    clocks = <&k3_clks 186 0>;
+                    clock-names = "serial";
+                    ti,secondary-oldi;
+                    ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+                        port@0 {
+                            reg = <0>;
+                            oldi1_in: endpoint {
+                                remote-endpoint = <&dpi0_out1>;
+                            };
+                        };
+                        port@1 {
+                            reg = <1>;
+                            oldi1_out: endpoint {
+                                remote-endpoint = <&panel_in1>;
+                            };
+                        };
+                    };
+                };
+            };
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <0>;
+                    dpi0_out0: endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&oldi0_in>;
+                    };
+                    dpi0_out1: endpoint@1 {
+                        reg = <1>;
+                        remote-endpoint = <&oldi1_in>;
+                    };
+                };
+                port@1 {
+                    reg = <1>;
+                    dpi1_out: endpoint {
+                        remote-endpoint = <&hdmi_bridge>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0fa7c5728f1e..88fa2d9435b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7816,6 +7816,7 @@ M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
 F:	Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
 F:	Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
 F:	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
-- 
2.34.1

