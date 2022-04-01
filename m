Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B344EF7D1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 18:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1743810E291;
	Fri,  1 Apr 2022 16:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id E17BB10E291
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 16:23:47 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:38814.38631177
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 9DB341002BE;
 Sat,  2 Apr 2022 00:23:34 +0800 (CST)
Received: from  ([172.27.8.53])
 by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id
 6b485cd9e9394bbcb407268e4a23729a for mripard@kernel.org; 
 Sat, 02 Apr 2022 00:23:46 CST
X-Transaction-ID: 6b485cd9e9394bbcb407268e4a23729a
X-Real-From: 15330273260@189.cn
X-Receive-IP: 172.27.8.53
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 suijingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v14 3/6] dt-bindings: display: Add Loongson display controller
Date: Sat,  2 Apr 2022 00:22:48 +0800
Message-Id: <20220401162251.1665081-4-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401162251.1665081-1-15330273260@189.cn>
References: <20220401162251.1665081-1-15330273260@189.cn>
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DT bindings and simple usages for Loongson display controller
found in LS7A1000 bridge chip and LS2k1000 SoC.

Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 .../loongson/loongson,display-controller.yaml | 295 ++++++++++++++++++
 1 file changed, 295 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml

diff --git a/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
new file mode 100644
index 000000000000..61f317d006ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
@@ -0,0 +1,295 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/loongson/loongson,display-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson LS7A1000/LS2K1000/LS2K0500 Display Controller Device Tree Bindings
+
+maintainers:
+  - Sui Jingfeng <suijingfeng@loongson.cn>
+
+description: |+
+
+  Loongson display controllers are simple which require scanout buffers
+  to be physically contiguous. LS2K1000/LS2K0500 is a SOC, only system
+  memory is available. LS7A1000/LS7A2000 is bridge chip which is equipped
+  with a dedicated video RAM which is 64MB or more, precise size can be
+  read from the PCI BAR 2 of the GPU device(0x0014:0x7A15) in the bridge
+  chip.
+
+  LSDC has two display pipes, each way has a DVO interface which provide
+  RGB888 signals, vertical & horizontal synchronisations, data enable and
+  the pixel clock. LSDC has two CRTC, each CRTC is able to scanout from
+  1920x1080 resolution at 60Hz. Each CRTC has two FB address registers.
+
+  For LS7A1000, there are 4 dedicated GPIOs whose control register is
+  located at the DC register space. They are used to emulate two way i2c,
+  One for DVO0, another for DVO1.
+
+  LS2K1000 and LS2K0500 SoC grab i2c adapter from other module, either
+  general purpose GPIO emulated i2c or hardware i2c in the SoC.
+
+  LSDC's display pipeline have several components as below description,
+
+  The display controller in LS7A1000:
+     ___________________                                     _________
+    |            -------|                                   |         |
+    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
+    |  _   _     -------|        ^             ^            |_________|
+    | | | | |    -------|        |             |
+    | |_| |_|    | i2c0 <--------+-------------+
+    |            -------|
+    |   DC IN LS7A1000  |
+    |  _   _     -------|
+    | | | | |    | i2c1 <--------+-------------+
+    | |_| |_|    -------|        |             |             _________
+    |            -------|        |             |            |         |
+    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
+    |            -------|                                   |_________|
+    |___________________|
+
+  Simple usage of LS7A1000 with LS3A4000 CPU:
+
+    +------+            +------------------------------------+
+    | DDR4 |            |  +-------------------+             |
+    +------+            |  | PCIe Root complex |   LS7A1000  |
+       || MC0           |  +--++---------++----+             |
+  +----------+  HT 3.0  |     ||         ||                  |
+  | LS3A4000 |<-------->| +---++---+  +--++--+     +---------+   +------+
+  |   CPU    |<-------->| | GC1000 |  | LSDC |<--->| DDR3 MC |<->| VRAM |
+  +----------+          | +--------+  +-+--+-+     +---------+   +------+
+       || MC1           +---------------|--|-----------------+
+    +------+                            |  |
+    | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
+    +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DVI/HDMI
+                      +-------+                      +------+
+
+  The display controller in LS2K1000/LS2K0500:
+     ___________________                                     _________
+    |            -------|                                   |         |
+    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
+    |  _   _     -------|        ^              ^           |_________|
+    | | | | |           |        |              |
+    | |_| |_|           |     +------+          |
+    |                   <---->| i2c0 |<---------+
+    |   DC IN LS2K1000  |     +------+
+    |  _   _            |     +------+
+    | | | | |           <---->| i2c1 |----------+
+    | |_| |_|           |     +------+          |            _________
+    |            -------|        |              |           |         |
+    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
+    |            -------|                                   |_________|
+    |___________________|
+
+properties:
+  $nodename:
+    pattern: "^display-controller@[0-9a-f],[0-9a-f]$"
+
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - loongson,ls7a1000-dc
+              - loongson,ls2k1000-dc
+              - loongson,ls2k0500-dc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  i2c@6:
+    $ref: /schemas/i2c/i2c-controller.yaml#
+    description: |
+      Built-in GPIO emulate i2c exported for display bridge configuration,
+      monitor detection and edid read back etc, for ls7a1000 only.
+
+    properties:
+      $nodename:
+        const: i2c
+
+      compatible:
+        const: loongson,gpio-i2c
+
+      reg:
+        minItems: 1
+        description: address offset and range
+
+      loongson,sda:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: gpio pin used for the sda signal
+
+      loongson,scl:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: gpio pin used for the scl signal
+
+    required:
+      - compatible
+      - loongson,sda
+      - loongson,scl
+
+  i2c@7:
+    $ref: /schemas/i2c/i2c-controller.yaml#
+    description: |
+      Built-in GPIO emulate i2c exported for display bridge configuration,
+      monitor detection and edid read back etc, for ls7a1000 only.
+    properties:
+      $nodename:
+        const: i2c
+
+      compatible:
+        const: loongson,gpio-i2c
+
+      reg:
+        minItems: 1
+        description: address offset and range
+
+      loongson,sda:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: gpio pin used for the sda signal
+
+      loongson,scl:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: gpio pin used for the scl signal
+
+    required:
+      - compatible
+      - loongson,sda
+      - loongson,scl
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: output port node connected with DPI panels or external encoders, with only one endpoint.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: output port node connected with DPI panels or external encoders, with only one endpoint.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    bus {
+
+        #address-cells = <3>;
+        #size-cells = <2>;
+        #interrupt-cells = <2>;
+
+        display-controller@6,1 {
+            compatible = "loongson,ls7a1000-dc";
+            reg = <0x3100 0x0 0x0 0x0 0x0>;
+            interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    bus {
+
+        #address-cells = <3>;
+        #size-cells = <2>;
+        #interrupt-cells = <2>;
+
+        display-controller@6,1 {
+            compatible = "loongson,ls7a1000-dc";
+            reg = <0x3100 0x0 0x0 0x0 0x0>;
+            interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            i2c@6 {
+                compatible = "loongson,gpio-i2c";
+                reg = <0x00001650 0x00000020>;
+                loongson,nr = <6>;
+                loongson,sda = <0>;
+                loongson,scl = <1>;
+                loongson,udelay = <5>;
+                loongson,timeout = <2200>;
+            };
+
+            i2c@7 {
+                compatible = "loongson,gpio-i2c";
+                reg = <0x00001650 0x00000020>;
+                loongson,nr = <7>;
+                loongson,sda = <2>;
+                loongson,scl = <3>;
+                loongson,udelay = <5>;
+                loongson,timeout = <2200>;
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                            remote-endpoint = <&vga_encoder_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    endpoint {
+                            remote-endpoint = <&dvi_encoder_in>;
+                    };
+                };
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    bus {
+
+        #address-cells = <3>;
+        #size-cells = <2>;
+        #interrupt-cells = <2>;
+
+        display-controller@6,0 {
+            compatible = "loongson,ls2k1000-dc";
+            reg = <0x3100 0x0 0x0 0x0 0x0>;
+            interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                            remote-endpoint = <&panel_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    endpoint {
+                            remote-endpoint = <&hdmi_encoder_in>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.25.1

