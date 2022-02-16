Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 444964B8FFF
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 19:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A0B10E6F0;
	Wed, 16 Feb 2022 18:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 256C710E6F0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 18:17:22 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:34238.983927469
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 72B63100238;
 Thu, 17 Feb 2022 02:17:20 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 33b944c8734e48b5907f9ba382168b44 for mripard@kernel.org; 
 Thu, 17 Feb 2022 02:17:21 CST
X-Transaction-ID: 33b944c8734e48b5907f9ba382168b44
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
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
 Li Yi <liyi@loongson.cn>, suijingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v8 2/3] MIPS: Loongson64: dts: update the display controller
 device node
Date: Thu, 17 Feb 2022 02:17:11 +0800
Message-Id: <20220216181712.1493400-3-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216181712.1493400-1-15330273260@189.cn>
References: <20220216181712.1493400-1-15330273260@189.cn>
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

From: suijingfeng <suijingfeng@loongson.cn>

The display controller is a pci device, its PCI vendor id is 0x0014
its PCI device id is 0x7a06.

1) In order to let the lsdc kms driver to know which chip the DC is
   contained in, we add different compatible for different chip.

2) Add display controller device node for ls2k1000 SoC

Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 .../loongson/loongson,display-controller.yaml | 114 ++++++++++++++++++
 .../display/loongson/loongson-drm.txt         |  16 +++
 .../boot/dts/loongson/loongson64-2k1000.dtsi  |   8 ++
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +-
 4 files changed, 140 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
 create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson-drm.txt

diff --git a/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
new file mode 100644
index 000000000000..64d8364b50ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/pci0014,7a06.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson LS7A2000/LS7A1000/LS2K1000/LS2K0500 Display Controller Device Tree Bindings
+
+maintainers:
+  - Sui Jingfeng <suijingfeng@loongson.cn>
+
+description: |+
+
+  Loongson display controllers are simple which require scanout buffers
+  to be physically contiguous. LS2K1000/LS2K0500 is a SOC, only system
+  memory is available. LS7A1000/LS7A2000 is bridge chip which is equipped
+  with a dedicated video ram which is 64MB or more.
+
+  For LS7A1000, there are 4 dedicated GPIOs whose control register is
+  located at the DC register space. They are used to emulate two way i2c,
+  One for DVO0, another for DVO1.
+
+  LS2K1000 and LS2K0500 SoC grab i2c adapter from other module, either
+  general purpose GPIO emulated i2c or hardware i2c in the SoC.
+
+  LSDC has two display pipes, each way has a DVO interface which provide
+  RGB888 signals, vertical & horizontal synchronisations, data enable and
+  the pixel clock. LSDC has two CRTC, each CRTC is able to scanout from
+  1920x1080 resolution at 60Hz. Each CRTC has two FB address registers.
+
+  LSDC's display pipeline have several components as below description,
+
+  The display controller in LS7A1000:
+    ___________________                                     _________
+    |            -------|                                   |         |
+    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monotor |
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
+    +------+            +-----------------------------------+
+    | DDR4 |            |  +-------------------+            |
+    +------+            |  | PCIe Root complex |   LS7A1000 |
+       || MC0           |  +--++---------++----+            |
+  +----------+  HT 3.0  |     ||         ||                 |
+  | LS3A4000 |<-------->| +---++---+  +--++--+    +---------+   +------+
+  |   CPU    |<-------->| | GC1000 |  | LSDC |<-->| DDR3 MC |<->| VRAM |
+  +----------+          | +--------+  +-+--+-+    +---------+   +------+
+       || MC1           +---------------|--|----------------+
+    +------+                            |  |
+    | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
+    +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DVI/HDMI
+                      +-------+                      +------+
+
+  The display controller in LS2K1000/LS2K0500:
+     ___________________                                     _________
+    |            -------|                                   |         |
+    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monotor |
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
+  compatible:
+    enum:
+      - loongson,ls7a2000-dc
+      - loongson,ls7a1000-dc
+      - loongson,ls2k1000-dc
+      - loongson,ls2k0500-dc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
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
+    lsdc: dc@6,1 {
+        compatible = "loongson,ls7a1000-dc";
+        reg = <0x3100 0x0 0x0 0x0 0x0>;
+        interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-parent = <&pic>;
+    };
+
+...
+
diff --git a/Documentation/devicetree/bindings/display/loongson/loongson-drm.txt b/Documentation/devicetree/bindings/display/loongson/loongson-drm.txt
new file mode 100644
index 000000000000..46417e0e34ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/loongson/loongson-drm.txt
@@ -0,0 +1,16 @@
+Loongson display controller
+===========================
+
+Required properties:
+- compatible: Should be "loongson,display-subsystem" or "loongson,ls-fb"
+- reg: should be register base and length
+- interrupts: Should contain the cores interrupt line
+
+example:
+
+lsdc: dc@0x400c0000 {
+	compatible = "loongson,display-subsystem", "loongson,ls-fb";
+	reg = <0x400c0000 0x00010000>;
+	interrupt-parent = <&icu>;
+	interrupts = <36>;
+};
diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index 768cf2abcea3..47f6ff4c3e8a 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -209,6 +209,14 @@ gpu@5,0 {
 				interrupt-parent = <&liointc0>;
 			};
 
+			lsdc: dc@6,0 {
+				compatible = "loongson,ls2k1000-dc";
+
+				reg = <0x3000 0x0 0x0 0x0 0x0>;
+				interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-parent = <&liointc0>;
+			};
+
 			pci_bridge@9,0 {
 				compatible = "pci0014,7a19.0",
 						   "pci0014,7a19",
diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index 2f45fce2cdc4..b34426142453 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -160,11 +160,8 @@ gpu@6,0 {
 				interrupt-parent = <&pic>;
 			};
 
-			dc@6,1 {
-				compatible = "pci0014,7a06.0",
-						   "pci0014,7a06",
-						   "pciclass030000",
-						   "pciclass0300";
+			lsdc: dc@6,1 {
+				compatible = "loongson,ls7a1000-dc";
 
 				reg = <0x3100 0x0 0x0 0x0 0x0>;
 				interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.25.1

