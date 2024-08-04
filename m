Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC05946C9B
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 08:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5CC10E083;
	Sun,  4 Aug 2024 06:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vn7IJJqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F65D10E080
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 06:16:12 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1fd66cddd4dso86707685ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Aug 2024 23:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722752172; x=1723356972; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+cz+seGpILxawIlaSSD47XDWHvw876gqL+2G/I4oXFk=;
 b=Vn7IJJqFfPDjRi8Z7IzZWY4lbVS5h0rMBJflyqoJAUPDeuLxpLwWfIqw0tfDBckzI4
 4cmKu/nIbHcxag+H6dhiSNvd/Rd357gFuW0524Tl8IcpYD6fSfVwaSG9rSlPJMYpnvLN
 WBRA4QHxMYBYjgRdGCZ+0HKSLd4s9WXqDTvDsNPd5DRcz9ml/uaDsqBW/ggRFD2WDrBo
 e1IrZTsKyPd6vwj4KEVcUIZSfDTyuWS3VPqfHhNcNVzjvcxN4Jhfq5BvD+ZFhT0az55F
 21wSX4hLW+D1ZU67KumahP2lO480NXfNE+RInGDuIly8281rGqeWCtnzhkCVfxKXEDQ/
 74fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722752172; x=1723356972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+cz+seGpILxawIlaSSD47XDWHvw876gqL+2G/I4oXFk=;
 b=eY5GqIg5fOvTK66N7PpO7FRmKPUHQ8HZIXlNWKZ6Rexlv4q17qnZ/mpsBabUlahiH/
 zNHIn1LNt2BRRD0dg5CJMunaZluP4znewQPbmPqxAqMIxVIUgkMlwTtAkAeEWI2Ux9jG
 87xidS5MpWuRJ72OGbddRVjZNryoKwJcEcFAsrUtkGgdOvWCSZzAiFw0r6guqqNlt3G3
 4TmRnERVfeX8FyTJZQGh12KRMypUIz6vqACBgPNdN3kGnolRTiKBgoGWoexuMKdXnGn1
 Ua/StLb6bqRIb2nINJLiVljOHaiXIwgBG8un3oN+SsUYR12wrOu9Tlcs7BF/DXM0rtUI
 gCDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO09tL2nh5q8TtgJ34clDt2VmC+dhi76H/oyTtP5flAwvweL5GSXQcLE3uDEH5t7R3i21j+Hr3Lk02uR+a1EIPZeljdnF0HHcNvi7c/34S
X-Gm-Message-State: AOJu0YxFuJECWhuQdWDvQUvPwYGnvpmb7YYFGmv7BDVzWz09TnewuXK2
 8QBdMouUtsKpuvfHNPtyAWsVLK+Ytqdlb12HkLQJupUfVubwXoTQ
X-Google-Smtp-Source: AGHT+IEFqt86zqX8dMZiR7DKDz3o2UunpKDibmO7X4MHgtYm5K2Ia4Um+0fJFjOJPsqOAfrG8pmQqQ==
X-Received: by 2002:a17:902:c405:b0:1fb:8620:c0bd with SMTP id
 d9443c01a7336-1ff5725870bmr127684215ad.15.1722752171673; 
 Sat, 03 Aug 2024 23:16:11 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff58f29ef4sm44194195ad.14.2024.08.03.23.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 23:16:11 -0700 (PDT)
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
 devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 3/5] dt-bindings: display: st7701: Add Anbernic RG28XX panel
Date: Sun,  4 Aug 2024 15:14:47 +0900
Message-ID: <20240804061503.881283-4-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240804061503.881283-1-kikuchan98@gmail.com>
References: <20240804061503.881283-1-kikuchan98@gmail.com>
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

Although a panel connected via SPI with a D/CX pin theoretically exists,
no such panels have been found for this driver yet. Therefore, disable
the use of the dc-gpios property for all currently known devices.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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

