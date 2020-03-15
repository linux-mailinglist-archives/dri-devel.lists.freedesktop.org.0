Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8F5185CC8
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC09B6E14D;
	Sun, 15 Mar 2020 13:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0AC6E156
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:44:34 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id g12so15626464ljj.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X45tw5KJlXhhJ3R6ynp7V7JRLgh1AOjgAQ5sYiJA7gQ=;
 b=Oqq5zZmQwYobC/AnUgTbv+2yNqZC1ysfOc2s7Dq7jJeMNanIhWjon9tWa5pfztJ6Oy
 Pej2RybnxI+89G9uHBa5IkXk6CoAIE/puDgRbN4dc3gybEtjgASgzlhLXnxUkEg0N53g
 jQkIaV4mdCElNhUzuuB1FR8JWCm8miXnIcYViF/mUf+gziC95xg6kXReV9Lx4NYnRMs5
 A6OfsMYAdo36YXPL913Pb/T2v3A1vCVSEDCufLgZM8jA9Lj0wSarOW5f4eT8/GmzkkJ4
 I81/N2rLrQxHi7Ren4MnSl5o1/9CHex0yrqCyUS74kwQsglYxMu2soNbKK/M2VHfol5A
 P5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X45tw5KJlXhhJ3R6ynp7V7JRLgh1AOjgAQ5sYiJA7gQ=;
 b=nEpzZMnnHrSl9+b2zEBGF0qSI91uL3Gx+ZHR1+Ukh9cqIN/J72GaOBlURiXCcZPSWb
 gWH9iwFQ9rzuz8uybcFg0AKfCqQYY8nCzp3OtfoQ1VWYU8Vgb/4aE/I2OFlwi0vBomg8
 el8NEmZU7meXUXexQexOPiuxs/EX7MJWNqs4lh9AszOtFwyOOriDIwL2PTXq5Fm/gZwl
 0EOPqbyUWU8DoMQ8k74usVjlutI/dMUbhH9D1xzwC3/3f+8Drd7ZdBh/0yYl1WF/R8tJ
 i/mpVrgLwvLHGm0w4niASuG6KypqHjObxM4rl0dTJUhSTpdnwJtNiVi8sM+y0yvIv1jb
 udzA==
X-Gm-Message-State: ANhLgQ3QASJYstOmw4z7B40yQmke3XFWZTshC/liur5ih0AfbS/to4HJ
 0+H2HVLu2/tMSUc1PbGqnJQhXCDdmMI=
X-Google-Smtp-Source: ADFU+vvKezVrr5pKhPKFDDiDBtGVr/h70AHssvhC8VNZHgZJoJYzPcWqdWCvDfcTSWr33npk2S7GtA==
X-Received: by 2002:a2e:3002:: with SMTP id w2mr10976729ljw.82.1584279872839; 
 Sun, 15 Mar 2020 06:44:32 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:44:32 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 02/36] dt-bindings: spi: support non-spi bindings as SPI
 slaves
Date: Sun, 15 Mar 2020 14:43:42 +0100
Message-Id: <20200315134416.16527-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200315134416.16527-1-sam@ravnborg.org>
References: <20200315134416.16527-1-sam@ravnborg.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>, Paul Cercueil <paul@crapouillou.net>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 Guido Gunther <agx@sigxcpu.org>, Mark Brown <broonie@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Independent bindings can be SPI slaves which for example is
the case for several panel bindings.

Move SPI slave properties to spi-slave.yaml so the independent
SPI slave bindings can include spi-slave.yaml rather than
duplicating the properties.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org
---
 .../bindings/spi/spi-controller.yaml          | 63 +-------------
 .../devicetree/bindings/spi/spi-slave.yaml    | 83 +++++++++++++++++++
 2 files changed, 86 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-slave.yaml

diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
index 1e0ca6ccf64b..99531c8d10dd 100644
--- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
@@ -67,71 +67,14 @@ patternProperties:
   "^.*@[0-9a-f]+$":
     type: object
 
+    allOf:
+      - $ref: spi-slave.yaml#
+
     properties:
       compatible:
         description:
           Compatible of the SPI device.
 
-      reg:
-        minimum: 0
-        maximum: 256
-        description:
-          Chip select used by the device.
-
-      spi-3wire:
-        $ref: /schemas/types.yaml#/definitions/flag
-        description:
-          The device requires 3-wire mode.
-
-      spi-cpha:
-        $ref: /schemas/types.yaml#/definitions/flag
-        description:
-          The device requires shifted clock phase (CPHA) mode.
-
-      spi-cpol:
-        $ref: /schemas/types.yaml#/definitions/flag
-        description:
-          The device requires inverse clock polarity (CPOL) mode.
-
-      spi-cs-high:
-        $ref: /schemas/types.yaml#/definitions/flag
-        description:
-          The device requires the chip select active high.
-
-      spi-lsb-first:
-        $ref: /schemas/types.yaml#/definitions/flag
-        description:
-          The device requires the LSB first mode.
-
-      spi-max-frequency:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description:
-          Maximum SPI clocking speed of the device in Hz.
-
-      spi-rx-bus-width:
-        allOf:
-          - $ref: /schemas/types.yaml#/definitions/uint32
-          - enum: [ 1, 2, 4, 8 ]
-          - default: 1
-        description:
-          Bus width to the SPI bus used for MISO.
-
-      spi-rx-delay-us:
-        description:
-          Delay, in microseconds, after a read transfer.
-
-      spi-tx-bus-width:
-        allOf:
-          - $ref: /schemas/types.yaml#/definitions/uint32
-          - enum: [ 1, 2, 4, 8 ]
-          - default: 1
-        description:
-          Bus width to the SPI bus used for MOSI.
-
-      spi-tx-delay-us:
-        description:
-          Delay, in microseconds, after a write transfer.
-
     required:
       - compatible
       - reg
diff --git a/Documentation/devicetree/bindings/spi/spi-slave.yaml b/Documentation/devicetree/bindings/spi/spi-slave.yaml
new file mode 100644
index 000000000000..fa50d9dfab41
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-slave.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/spi-slave.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SPI slave generic binding
+
+maintainers:
+  - Mark Brown <broonie@kernel.org>
+
+description: |
+  This document defines device tree properties common to SPI slaves.
+  It doesn't constitue a device tree binding specification by
+  itself but is meant to be referenced by device tree bindings.
+
+  When referenced from device tree bindings the properties defined in this
+  document are defined as follows. The device tree bindings are responsible
+  for defining whether each property is required or optional.
+
+properties:
+
+  reg:
+    minimum: 0
+    maximum: 256
+    description:
+      Chip select used by the device.
+
+  spi-3wire:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The device requires 3-wire mode.
+
+  spi-cpha:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The device requires shifted clock phase (CPHA) mode.
+
+  spi-cpol:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The device requires inverse clock polarity (CPOL) mode.
+
+  spi-cs-high:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The device requires the chip select active high.
+
+  spi-lsb-first:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The device requires the LSB first mode.
+
+  spi-max-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Maximum SPI clocking speed of the device in Hz.
+
+  spi-rx-bus-width:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 1, 2, 4, 8 ]
+      - default: 1
+    description:
+      Bus width to the SPI bus used for MISO.
+
+  spi-rx-delay-us:
+    description:
+      Delay, in microseconds, after a read transfer.
+
+  spi-tx-bus-width:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 1, 2, 4, 8 ]
+      - default: 1
+    description:
+      Bus width to the SPI bus used for MOSI.
+
+  spi-tx-delay-us:
+    description:
+      Delay, in microseconds, after a write transfer.
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
