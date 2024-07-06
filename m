Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED309929284
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2024 12:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6828810E171;
	Sat,  6 Jul 2024 10:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iO+Fm25s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4064210E154
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2024 10:24:25 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-75c3afd7a50so1332147a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jul 2024 03:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720261465; x=1720866265; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fYJee/mcRebgA7l1n5NmrVNKbMvZcgWZcmI7aolZVm8=;
 b=iO+Fm25sUn8tv0b3hFD19YFoZlSR+sNUJ5UASA8Kg6Z2yoJz1EqHzwNwRA8ioPyC7b
 THPA/rMwPOvRvuOtrGTBRNJQx2aWQgc/ZLDha09SAp+ZYFOdsJbt5RkL8lqmO1GTiv9U
 MmCFKjT39XXSeoo8cNAbFhcHp9vkKh/1YtUEN+bcaFciSJdpLDPqqtM805tUozjKYkG8
 uwQQwIKSLSaHdRgZ4Pm+EDta+Y8fFCEbhwFY5z1y7WrMU71hf8wl5YlWR3piFJqCk1da
 QqXpx214LvZgQRUKq39Bb0DX4cBl1Ys3YHt0rfcW6jdAj9dwUlrmyQMJ4EfeJIcRmPvF
 N9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720261465; x=1720866265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fYJee/mcRebgA7l1n5NmrVNKbMvZcgWZcmI7aolZVm8=;
 b=J7zps36ATiIdwlxPePw4PCzOlesSolKlV7qoYn7wo3QNWkZYGBocOZzhYXEcLsWKXP
 lz5I1TBb9HDT6KN8EAF/K/+CEN3G7rzFOlqDW3MEyQjkPAN8wNr0vM6gOR9NLoP/MzA4
 8By/I+ZBbB4mDIkTJYFfbNXS5r1gyHtyxLfkFyJdkhSfWd0ZOd4aG/LymbIYpZ6xS+TT
 E0i1012mhnRWWmi65KfPhrC9x33kLeVtXBHZ0IVJHiAwAjBzpFQr6kHuoVcCJ6DEQ0tX
 cqyNoo5STwIFuQ3OQv9MrN6YpBtOaBQb1yC5w6fxi+kJZMuwq+71nl0vZjfJQGhD6vky
 U0WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWSZNKe7lK838iZ10+7xu6qefJqer21d0NAlqBjHRU6aQa6K9V9WxW3ZSZKsFbfwTxDuRmq1AbypLnZqrC0sDP2xWQXd1a5loiTavUZEky
X-Gm-Message-State: AOJu0YxsjrBxY3Y9L8F3d/vWwHZuuva2Qy53aI79ztGxlV5OBAq8uRBQ
 VDnCvGtGdiFeulKGVO1U4GXDtfucaqJ7o8RA0pFGlE/YfzFMIhAv
X-Google-Smtp-Source: AGHT+IEebQtUDk0CnigbaUezXTxoX65nCAEIxGoc697y/n0gqBCZILJ4/CciYoJMfiPEoGcSa5gX0Q==
X-Received: by 2002:a05:6a20:7f8d:b0:1be:ffe4:b2a2 with SMTP id
 adf61e73a8af0-1c0cc737349mr6960162637.7.1720261464567; 
 Sat, 06 Jul 2024 03:24:24 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fb67e04f64sm9126625ad.214.2024.07.06.03.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jul 2024 03:24:24 -0700 (PDT)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 3/5] dt-bindings: display: st7701: Add Anbernic RG28XX panel
Date: Sat,  6 Jul 2024 19:23:34 +0900
Message-ID: <20240706102338.99231-4-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240706102338.99231-1-kikuchan98@gmail.com>
References: <20240706102338.99231-1-kikuchan98@gmail.com>
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

The RG28XX panel is a display panel of the Anbernic RG28XX, a handheld
gaming device from Anbernic. It is 2.8 inches in size (diagonally) with
a resolution of 480x640.

This panel is driven by a variant of the ST7701 driver IC internally,
confirmed by dumping and analyzing its BSP initialization sequence
by using a logic analyzer. It is very similar to the existing
densitron,dmt028vghmcmi-1a panel, but differs in some unknown
register values, so add a new entry for the panel to distinguish them.

Additionally, the panel only has an SPI instead of MIPI DSI.
So add and modify for SPI as well.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 .../display/panel/sitronix,st7701.yaml        | 69 +++++++++++++++++--
 1 file changed, 64 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
index b348f5bf0a9..b07f3eca669 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -20,21 +20,19 @@ description: |
   Densitron DMT028VGHMCMI-1A is 480x640, 2-lane MIPI DSI LCD panel
   which has built-in ST7701 chip.
 
-allOf:
-  - $ref: panel-common.yaml#
-
 properties:
   compatible:
     items:
       - enum:
           - anbernic,rg-arc-panel
+          - anbernic,rg28xx-panel
           - densitron,dmt028vghmcmi-1a
           - elida,kd50t048a
           - techstar,ts8550b
       - const: sitronix,st7701
 
   reg:
-    description: DSI virtual channel used by that screen
+    description: DSI / SPI channel used by that screen
     maxItems: 1
 
   VCC-supply:
@@ -43,6 +41,13 @@ properties:
   IOVCC-supply:
     description: I/O system regulator
 
+  dc-gpios:
+    maxItems: 1
+    description:
+      Controller data/command selection (D/CX) in 4-line SPI mode.
+      If not set, the controller is in 3-line SPI mode.
+      Disallowed for DSI.
+
   port: true
   reset-gpios: true
   rotation: true
@@ -57,7 +62,38 @@ required:
   - port
   - reset-gpios
 
-additionalProperties: false
+allOf:
+  - $ref: panel-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            # SPI connected panels
+            enum:
+              - anbernic,rg28xx-panel
+    then:
+      $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              # DSI or SPI without D/CX pin
+              enum:
+                - anbernic,rg-arc-panel
+                - anbernic,rg28xx-panel
+                - densitron,dmt028vghmcmi-1a
+                - elida,kd50t048a
+                - techstar,ts8550b
+    then:
+      required:
+        - dc-gpios
+    else:
+      properties:
+        dc-gpios: false
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -82,3 +118,26 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "anbernic,rg28xx-panel", "sitronix,st7701";
+            reg = <0>;
+            spi-max-frequency = <3125000>;
+            VCC-supply = <&reg_lcd>;
+            IOVCC-supply = <&reg_lcd>;
+            reset-gpios = <&pio 8 14 GPIO_ACTIVE_HIGH>; /* LCD-RST: PI14 */
+            backlight = <&backlight>;
+
+            port {
+                panel_in_rgb: endpoint {
+                    remote-endpoint = <&tcon_lcd0_out_lcd>;
+                };
+            };
+        };
+    };
-- 
2.45.2

