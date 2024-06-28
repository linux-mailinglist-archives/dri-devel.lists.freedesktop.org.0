Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FD091B5E8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 07:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0619210EBAD;
	Fri, 28 Jun 2024 05:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nxp0jfD4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D4810E1CF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 05:11:03 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-3d561d685e7so158742b6e.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 22:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719551462; x=1720156262; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JpenRVGjM2ZSkUQ2dBUpd49BSbf2cRRpi0pJzb2v/wA=;
 b=Nxp0jfD4Rr13s2cEbVdVrhEgvH7mXFyMhMy2KJskJR+q8dUA9Z2kvcK9uT33g9JhPx
 pcwSE/wao/37dYI6KnA7HlehYOiIm0X0NZ8hxPgxtrsvoBtaooAdHv8zQuF/QKQecYzo
 OTlKWX1uYnfWkXc/04Q8vyrtaFsMNrxKE8O+8pLxARL7vsmrkWGk56weFSVLy8MHsMjK
 2Ne/2YyAqwj96gVb5PX8zDGDzmaTu0+4WruGJTOmdxqm5z9VRN7MWil2TqnwZPtUGDEi
 4N53D/hzAaYceaYYre7M6PgUE4Ro0EWQe+bXElCKJ7zP2n6xpbljVDYqmvSOCwalqXBE
 y8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719551462; x=1720156262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JpenRVGjM2ZSkUQ2dBUpd49BSbf2cRRpi0pJzb2v/wA=;
 b=OVl9fBq8uYS2I6DRL3e/YxU/h+P9mxD3a/irozMF1xZ7h78xU2y+ZpBIZKti/z/Bug
 U5Jk7SVQSd1reAaEdCcJpONI2Jmp+ZvZv9ymvWbxy31UWmypD3A1BW9WFoUk0jqhhQjk
 xWIdfW8q1M7eNxBr9yPDsV/30zkFcb3pKNau7/ZVQgusB6lCEiYaQqGg46qlMFHq+kwa
 Hkx692vzPCKjuTzhz3fpADQdggytPOYcfhLuHgqWKBtfmNXXodZd/IqP9RDG5IV8uhPE
 gCmrqYDDhqXysdrCjjXE7lBgOkKb1nYZYabDP8Ueqh+iflUGTwyhkM5ZypFCTLk+XdTn
 CLlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkP8JHFK0u38aWesgwNDWDbkPlY6+qY5XUx/5CRth3ILQcAqVEVxcUW5nnQ9eRynOBdftWerTQ0w9AWt3Yo8UvAt3fR/RmYCDzF51uHRDG
X-Gm-Message-State: AOJu0YxkOQc5mkNPuBpbzftwe5fB4s+Ek16+VngPJ5AjdXmT78AJ2gCK
 0JEuN8nrJPRFrkRcaNCCIJ2ILSi5Z8fYGKJjFRNuV3XqMKttGjNL
X-Google-Smtp-Source: AGHT+IEx8bqjf6+huD46hE7EYOhNRkSCa7gQ7/NJzyrFgBjzYsCqxdHOWw/F7oJT2+64neV07mk8Tg==
X-Received: by 2002:a05:6808:1b26:b0:3d2:1759:7db1 with SMTP id
 5614622812f47-3d54594bcbamr18842835b6e.10.1719551462153; 
 Thu, 27 Jun 2024 22:11:02 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70804893e4bsm624716b3a.184.2024.06.27.22.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 22:11:01 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: display: st7701: Add Anbernic RG28XX panel
Date: Fri, 28 Jun 2024 14:10:15 +0900
Message-ID: <20240628051019.975172-2-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628051019.975172-1-kikuchan98@gmail.com>
References: <20240628051019.975172-1-kikuchan98@gmail.com>
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

Additionally, the panel is connected via SPI instead of MIPI DSI.
So add and modify for SPI as well.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 .../display/panel/sitronix,st7701.yaml        | 69 +++++++++++++++++--
 1 file changed, 64 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
index b348f5bf0a9..835ea436531 100644
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
+      $ref: /schemas/spi/spi-peripheral-props.yaml
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

