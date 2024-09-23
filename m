Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A26983FC9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB5810E298;
	Tue, 24 Sep 2024 07:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="Pghwibwy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 548 seconds by postgrey-1.36 at gabe;
 Mon, 23 Sep 2024 14:07:08 UTC
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB2310E188
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 14:07:08 +0000 (UTC)
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl
 [85.222.111.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: lukma@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D803288AD7;
 Mon, 23 Sep 2024 15:57:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727099878;
 bh=L2NnDMl4BqxEyLz16GjGxVE+3eLoWwP7TkmLSj4ceLk=;
 h=From:To:Cc:Subject:Date:From;
 b=Pghwibwy9M+HwnP+9bt13d2G0/1BWvP9ybmFSiXz/mpt+XqCPfnl+XqvPdrCULF7p
 6BC4tQHOZfx0+SxMZICkceABisnf8HgMj3OFddcKBU1994wtMBNWG8vaz9T0or1Qzf
 lP2ou7QOICgJnI1Z2qp7XnFrJNAg/eNRhxeKqkGruvr44b+wre1vdpYHhYTo5+rSCY
 w65K960ex4AF/bSf7X5c/eFs7R9Uv/2b14yz9M3raLq6qJHUKMSPUUQ3wQHkfJCuc1
 dKesJMApjY8hO0KT8lRnajZCiyYRTDi3iKIoa4nL1Mzxjsdj9kdIzBeD/DmWX8fFNO
 VEqENEQvZVQ4w==
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukasz Majewski <lukma@denx.de>
Subject: [PATCH] dt-bindings: lcdif: Add support for specifying display with
 timings
Date: Mon, 23 Sep 2024 15:57:44 +0200
Message-Id: <20240923135744.2813712-1-lukma@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Mailman-Approved-At: Tue, 24 Sep 2024 07:59:31 +0000
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

Up till now the fsl,lcdif.yaml was requiring the "port" property as a
must have to specify the display interface on iMX devices.

However, it shall also be possible to specify the display only with
passing its timing parameters (h* and v* ones) via "display" property:
(as in
Documentation/devicetree/bindings/display/panel/display-timings.yaml).

Such approach has already been used (also in the mainline) with several
imx28, imx5x and imx6q devices.

This change allows them to pass the DT_SCHEMA check without issues.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 .../bindings/display/fsl,lcdif.yaml           | 51 ++++++++++++++++++-
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 8e3a98aeec32..14bb64b5b72d 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -50,6 +50,10 @@ properties:
       - const: disp_axi
     minItems: 1
 
+  display:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle for display timing information
+
   dmas:
     items:
       - description: DMA specifier for the RX DMA channel.
@@ -64,6 +68,9 @@ properties:
       - description: LCDIF Error interrupt
     minItems: 1
 
+  lcd-supply:
+    description: Regulator for LCD supply voltage.
+
   power-domains:
     maxItems: 1
 
@@ -76,7 +83,10 @@ required:
   - reg
   - clocks
   - interrupts
-  - port
+
+patternProperties:
+  'display([0-9])':
+    description: Node with display timing parameters
 
 additionalProperties: false
 
@@ -197,5 +207,42 @@ examples:
             };
         };
     };
-
+  - |
+    lcdif: lcdif@80030000 {
+        compatible = "fsl,imx28-lcdif";
+        reg = <0x80030000 0x2000>;
+        interrupts = <38>;
+        clocks = <&clks 55>;
+        dmas = <&dma_apbh 13>;
+        dma-names = "rx";
+        pinctrl-names = "default";
+        pinctrl-0 = <&lcdif_24bit_pins_a>, <&lcdif_sync_pins_bttc>,
+                 <&lcdif_reset_pins_bttc>;
+        lcd-supply = <&reg_3v3>;
+        display = <&display0>;
+        status = "okay";
+
+        display0: display0 {
+                bits-per-pixel = <32>;
+                bus-width = <24>;
+                display-timings {
+                        native-mode = <&timing0>;
+                        timing0: timing0 {
+                                clock-frequency = <6500000>;
+                                hactive = <320>;
+                                vactive = <240>;
+                                hfront-porch = <20>;
+                                hback-porch = <38>;
+                                hsync-len = <30>;
+                                vfront-porch = <4>;
+                                vback-porch = <14>;
+                                vsync-len = <4>;
+                                hsync-active = <0>;
+                                vsync-active = <0>;
+                                de-active = <0>;
+                                pixelclk-active = <1>;
+                        };
+                };
+        };
+    };
 ...
-- 
2.39.2

