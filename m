Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 187B4B5370D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 17:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D56A10EB63;
	Thu, 11 Sep 2025 15:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="LZihF5uG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E352110EB5B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 15:13:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757603580; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Lhx1XET7Lt1uBWs35LXuwmH7qPudZKMYB9yD5Bf6yxYPiSLiSFxOkhbVyvqsWLCbwVjthmLjFQk5jmnB99aZYV/fE71O7SG6xZQ65gQUlG2oAxg/ACydPv2uTZtzZLY2n56sPOuX/HcZ7iT1vISwMwEtcgWa71XCkc6po7B/Oa4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757603580;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=MVrjlDn407qFZPFUd8CthBAbQWkhNNZNW+JL13PY5oA=; 
 b=h77OHf2Q6v8wZo3ZJRmDIdzBGvvE2iEylmEYF0nouArjE61dfpg+UjTaGhPYO5FNgZmYIEvvHzrkisbBse9EKM0NvKZJLXFurBKoYqO+SVDAakZKHUF5QKLO5sV/9lWiZsC6ZP1pB139i8J8whZkIWjh/4zDSJz/Ot8S+5J9yig=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603580; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=MVrjlDn407qFZPFUd8CthBAbQWkhNNZNW+JL13PY5oA=;
 b=LZihF5uG1JlwRYqKE4D/Y0sd188sB16uNBbDjCZqULO5J0S4fLO36Q+hJR8M4trt
 RlGrysezYaylD9hkgZeO8w0jtck8Z9lvvCXnclyGFzyxEN4nSnYBZVbaDtLYg8vAr2W
 /NYtZ0GHS7MyjV2vown6/+yW7waXzeYKeF1YMuW8=
Received: by mx.zohomail.com with SMTPS id 1757603577978371.3605345857824;
 Thu, 11 Sep 2025 08:12:57 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 ariel.dalessandro@collabora.com, broonie@kernel.org,
 chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net,
 dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com,
 heiko@sntech.de, houlong.wei@mediatek.com, jeesw@melfas.com,
 kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v2 03/12] dt-bindings: net: Convert Marvell 8897/8997 bindings
 to DT schema
Date: Thu, 11 Sep 2025 12:09:52 -0300
Message-ID: <20250911151001.108744-4-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Convert the existing text-based DT bindings for Marvell 8897/8997
(sd8897/sd8997) bluetooth devices controller to a DT schema.

While here:

* bindings for "usb1286,204e" (USB interface) are dropped from the DT
  schema definition as these are currently documented in file [0].
* DT binding users are updated to use bluetooth generic name
  recommendation.

[0] Documentation/devicetree/bindings/net/btusb.txt

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../net/bluetooth/marvell,sd8897-bt.yaml      | 79 ++++++++++++++++++
 .../devicetree/bindings/net/btusb.txt         |  2 +-
 .../bindings/net/marvell-bt-8xxx.txt          | 83 -------------------
 .../dts/rockchip/rk3288-veyron-fievel.dts     |  2 +-
 .../boot/dts/rockchip/rk3288-veyron-jaq.dts   |  2 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  2 +-
 6 files changed, 83 insertions(+), 87 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/marvell,sd8897-bt.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt

diff --git a/Documentation/devicetree/bindings/net/bluetooth/marvell,sd8897-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/marvell,sd8897-bt.yaml
new file mode 100644
index 0000000000000..a307c64cfa4d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/marvell,sd8897-bt.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/marvell,sd8897-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell 8897/8997 (sd8897/sd8997) bluetooth devices (SDIO)
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
+
+allOf:
+  - $ref: /schemas/net/bluetooth/bluetooth-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - marvell,sd8897-bt
+      - marvell,sd8997-bt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  marvell,cal-data:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      Calibration data downloaded to the device during initialization.
+    maxItems: 28
+
+  marvell,wakeup-pin:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Wakeup pin number of the bluetooth chip. Used by firmware to wakeup host
+      system.
+
+  marvell,wakeup-gap-ms:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Wakeup latency of the host platform. Required by the chip sleep feature.
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
+
+    mmc {
+        vmmc-supply = <&wlan_en_reg>;
+        bus-width = <4>;
+        cap-power-off-card;
+        keep-power-in-suspend;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bluetooth@2 {
+            compatible = "marvell,sd8897-bt";
+            reg = <2>;
+            interrupt-parent = <&pio>;
+            interrupts = <119 IRQ_TYPE_LEVEL_LOW>;
+
+            marvell,cal-data = /bits/ 8 <
+                0x37 0x01 0x1c 0x00 0xff 0xff 0xff 0xff 0x01 0x7f 0x04 0x02
+                0x00 0x00 0xba 0xce 0xc0 0xc6 0x2d 0x00 0x00 0x00 0x00 0x00
+                0x00 0x00 0xf0 0x00>;
+            marvell,wakeup-pin = /bits/ 16 <0x0d>;
+            marvell,wakeup-gap-ms = /bits/ 16 <0x64>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/net/btusb.txt b/Documentation/devicetree/bindings/net/btusb.txt
index f546b1f7dd6d2..a68022a57c51e 100644
--- a/Documentation/devicetree/bindings/net/btusb.txt
+++ b/Documentation/devicetree/bindings/net/btusb.txt
@@ -14,7 +14,7 @@ Required properties:
 
 
 Also, vendors that use btusb may have device additional properties, e.g:
-Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
+Documentation/devicetree/bindings/net/bluetooth/marvell,sd8897-bt.yaml
 
 Optional properties:
 
diff --git a/Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt b/Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
deleted file mode 100644
index 957e5e5c2927c..0000000000000
--- a/Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
+++ /dev/null
@@ -1,83 +0,0 @@
-Marvell 8897/8997 (sd8897/sd8997) bluetooth devices (SDIO or USB based)
-------
-The 8997 devices supports multiple interfaces. When used on SDIO interfaces,
-the btmrvl driver is used and when used on USB interface, the btusb driver is
-used.
-
-Required properties:
-
-  - compatible : should be one of the following:
-	* "marvell,sd8897-bt" (for SDIO)
-	* "marvell,sd8997-bt" (for SDIO)
-	* "usb1286,204e"      (for USB)
-
-Optional properties:
-
-  - marvell,cal-data: Calibration data downloaded to the device during
-		      initialization. This is an array of 28 values(u8).
-		      This is only applicable to SDIO devices.
-
-  - marvell,wakeup-pin: It represents wakeup pin number of the bluetooth chip.
-		        firmware will use the pin to wakeup host system (u16).
-  - marvell,wakeup-gap-ms: wakeup gap represents wakeup latency of the host
-		      platform. The value will be configured to firmware. This
-		      is needed to work chip's sleep feature as expected (u16).
-  - interrupt-names: Used only for USB based devices (See below)
-  - interrupts : specifies the interrupt pin number to the cpu. For SDIO, the
-		 driver will use the first interrupt specified in the interrupt
-		 array. For USB based devices, the driver will use the interrupt
-		 named "wakeup" from the interrupt-names and interrupt arrays.
-		 The driver will request an irq based on this interrupt number.
-		 During system suspend, the irq will be enabled so that the
-		 bluetooth chip can wakeup host platform under certain
-		 conditions. During system resume, the irq will be disabled
-		 to make sure unnecessary interrupt is not received.
-
-Example:
-
-IRQ pin 119 is used as system wakeup source interrupt.
-wakeup pin 13 and gap 100ms are configured so that firmware can wakeup host
-using this device side pin and wakeup latency.
-
-Example for SDIO device follows (calibration data is also available in
-below example).
-
-&mmc3 {
-	vmmc-supply = <&wlan_en_reg>;
-	bus-width = <4>;
-	cap-power-off-card;
-	keep-power-in-suspend;
-
-	#address-cells = <1>;
-	#size-cells = <0>;
-	btmrvl: bluetooth@2 {
-		compatible = "marvell,sd8897-bt";
-		reg = <2>;
-		interrupt-parent = <&pio>;
-		interrupts = <119 IRQ_TYPE_LEVEL_LOW>;
-
-		marvell,cal-data = /bits/ 8 <
-			0x37 0x01 0x1c 0x00 0xff 0xff 0xff 0xff 0x01 0x7f 0x04 0x02
-			0x00 0x00 0xba 0xce 0xc0 0xc6 0x2d 0x00 0x00 0x00 0x00 0x00
-			0x00 0x00 0xf0 0x00>;
-		marvell,wakeup-pin = /bits/ 16 <0x0d>;
-		marvell,wakeup-gap-ms = /bits/ 16 <0x64>;
-	};
-};
-
-Example for USB device:
-
-&usb_host1_ohci {
-    #address-cells = <1>;
-    #size-cells = <0>;
-
-    mvl_bt1: bt@1 {
-	compatible = "usb1286,204e";
-	reg = <1>;
-	interrupt-parent = <&gpio0>;
-	interrupt-names = "wakeup";
-	interrupts = <119 IRQ_TYPE_LEVEL_LOW>;
-	marvell,wakeup-pin = /bits/ 16 <0x0d>;
-	marvell,wakeup-gap-ms = /bits/ 16 <0x64>;
-    };
-};
diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts b/arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts
index 6a0844e162793..26817848c1541 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts
@@ -177,7 +177,7 @@ &sdio0 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	btmrvl: btmrvl@2 {
+	btmrvl: bluetooth@2 {
 		compatible = "marvell,sd8897-bt";
 		reg = <2>;
 		interrupt-parent = <&gpio4>;
diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts b/arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts
index 0d4c50e055587..cba2898f8b7df 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts
@@ -48,7 +48,7 @@ &sdio0 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	btmrvl: btmrvl@2 {
+	btmrvl: bluetooth@2 {
 		compatible = "marvell,sd8897-bt";
 		reg = <2>;
 		interrupt-parent = <&gpio4>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 0d995b342d463..8d1f40077a5e5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -432,7 +432,7 @@ &mmc3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	btmrvl: btmrvl@2 {
+	btmrvl: bluetooth@2 {
 		compatible = "marvell,sd8897-bt";
 		reg = <2>;
 		interrupts-extended = <&pio 119 IRQ_TYPE_LEVEL_LOW>;
-- 
2.50.1

