Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0C8B2E322
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 19:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7141C10E7AA;
	Wed, 20 Aug 2025 17:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="SJM1kBiO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A7910E7A7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 17:15:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755710101; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RSDA9vX91pfS8xhsuAJ9jQZ7oEw1TLd3MDAb04DbIdploYze9OwWkcELTjL9jQHvCprYCvzy2+L8x3oWXZDYkF7LRINPBGRhSL+ieIgKYM7JU1yHA5Yz/T6HIcPhQTEI+o1Wea4iIpt1zj50xYxN61KSqYLjTCSysu5TB4h05w4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755710101;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2QZKUiKO5lovXcillJao8ulAS5I79dfCerJQtCsOaUA=; 
 b=aEdGhgmDJ2+E459cl46l+ED1hwOCezkCro/k2D3eJQ3XM5lc2eXo1mNXW/EteJvSKdcLPnuyy+WUJoHZLTIt1zSmWZ14OO73CcSLIaJMxi5mYU6TTOwjfQXaKKvg/XzBIM8z8LwL5QR9ZG0Kl6JtZdrIJyvpBac8MNs0+4pgjEg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710101; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=2QZKUiKO5lovXcillJao8ulAS5I79dfCerJQtCsOaUA=;
 b=SJM1kBiOU+oEdIBUrRU5ZHbpTcW1kOu7nkkb/4VFvcsZQXp+LQE76Xxb0/cEc+Jo
 iUbGMmt67rxINraw9wUbhUC7BCyZ8FUtIlEWRwo3gwGViU+FB8LlKuEp9oKwi8WPDWd
 DczidVtSSPnmsX4vn2Jw7X1Pt9Y/RI+TQiwYDKmY=
Received: by mx.zohomail.com with SMTPS id 1755710098815670.5252480182933;
 Wed, 20 Aug 2025 10:14:58 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 ariel.dalessandro@collabora.com, broonie@kernel.org,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
 jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
 kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v1 04/14] net: dt-bindings: Convert Marvell 8897/8997 bindings
 to YAML
Date: Wed, 20 Aug 2025 14:12:52 -0300
Message-ID: <20250820171302.324142-5-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
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
(sd8897/sd8997) bluetooth devices controller to a YAML schema.

While here, bindings for "usb1286,204e" (USB interface) are dropped from
the YAML definition as these are currently documented in file:

- Documentation/devicetree/bindings/net/btusb.txt

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../bindings/net/marvell,sd8897-bt.yaml       | 91 +++++++++++++++++++
 .../bindings/net/marvell-bt-8xxx.txt          | 83 -----------------
 2 files changed, 91 insertions(+), 83 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt

diff --git a/Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml b/Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml
new file mode 100644
index 0000000000000..6539868c08b8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/marvell,sd8897-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell 8897/8997 (sd8897/sd8997) bluetooth devices (SDIO)
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
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
+    minItems: 28
+
+  marvell,wakeup-pin:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Wakeup pin number of the bluetooth chip. Used by firmware to wakeup host
+      system.
+
+  marvell,wakeup-gap-ms:
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
+    #include <dt-bindings/pinctrl/rockchip.h>
+
+    sdio0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        btmrvl: btmrvl@2 {
+            compatible = "marvell,sd8897-bt";
+            reg = <2>;
+            interrupt-parent = <&gpio4>;
+            interrupts = <RK_PD7 IRQ_TYPE_LEVEL_LOW>;
+            marvell,wakeup-pin = /bits/ 16 <13>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&bt_host_wake_l>;
+        };
+    };
+
+    mmc3 {
+        vmmc-supply = <&wlan_en_reg>;
+        bus-width = <4>;
+        cap-power-off-card;
+        keep-power-in-suspend;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bluetooth: bluetooth@2 {
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
-- 
2.50.1

