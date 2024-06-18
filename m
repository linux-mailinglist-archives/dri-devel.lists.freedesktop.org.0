Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD8990C4C8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 10:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3521A10E5C9;
	Tue, 18 Jun 2024 08:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HQQxEEzz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1530910E5CA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 08:15:50 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-652fd0bb5e6so4094523a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 01:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718698549; x=1719303349; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J1NVDaPXa6D4F2sbo9R4akJ/9kWJg22tXMUc7cYS2HM=;
 b=HQQxEEzzHfcC47IC+H3vgXjThOX6BzTnDGhv0mupTajY0qvce0oCrk1XJhSJBqv8wx
 k4zaTf4rruofjclJPOjnXqkRfbBzOr/loMcStOmp/k5yFPMNjU5wMHrU2b+aSmDHg2YI
 6P3BldBd9IaxVj/AzVBHUBydjn6i30Q0QCLrxWmta2bhNA2BD5v7kAvzD9y7N3egbN9Z
 FDs0MwPoIklmz/Y1OhjYoptoAQDDJc1UwjKKEmi6YObKNpQE88KqNRZvOUiqtpizzqIC
 gPeEnXTv43Ybj5r5XEjnF1CpVbh0Ubl7n+wG8JPNRAERQJao9JJ453B2hplCto7DgbXX
 E8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718698549; x=1719303349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J1NVDaPXa6D4F2sbo9R4akJ/9kWJg22tXMUc7cYS2HM=;
 b=nBBCBuCxm2i7XUVUJFuWCBbCHxodDyj6JTpQvXXzkRTLCkso1MrPtNwJ/Y4v3Q1+QR
 OANyH3B0Yo2AYsKarW/400JkaNu1lxm4hL5AvS+V26xQEtXl2sCOAOAW+8LP1xFAC52l
 7FP1UXYm67ZPcsHs9Yn8CBtBJmJBY0tK0ETkpIXZn8UNvtsB46NHz5aBldSKdcd+PXIK
 puikDJ/SEZ4c3E8dC5Q+AsWWubAxsvOQU4AqW/jbkId+EJdbm1cGLkMSXX1dUbGGmYi9
 XmQqqX2FRl3cyJrfwJH7xbDR9fhvG6f9ckJwGoa+gUjBSf8+W9YZTOg18+vHMVpeR9tY
 52Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbGjJlwAkoV4uf4uAEijjtvCewoLdKNX9+V+WKYrs1acTmX9w8sz7C33JY3v0L/1MxLoh3lcnrdxfsT7YI1Toqr/LlpRtwENeHJ7hwE9Vg
X-Gm-Message-State: AOJu0YxZC90pLXsobXst8XFI3ur6Vd8YR8JGW7nyw5in0eMMb7ZCX6FN
 3MQY6saFQC4i22qHzPA62OT+LXvns7dhvWHch2cAVb5/sUd9q7Xs
X-Google-Smtp-Source: AGHT+IGzYUM3GnISel4DD57OKPNCWzNF0T1Fd0b4gLUiKppMSD2hu6qFDU9hmvCWOlG2Ky/D3Xd3lw==
X-Received: by 2002:a05:6a20:2447:b0:1b8:5c3c:794f with SMTP id
 adf61e73a8af0-1bae7e1133emr13429201637.10.1718698549371; 
 Tue, 18 Jun 2024 01:15:49 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f1a1ebsm91883575ad.238.2024.06.18.01.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 01:15:49 -0700 (PDT)
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
Subject: [PATCH v1 1/3] dt-bindings: display: st7701: Add Anbernic RG28XX panel
Date: Tue, 18 Jun 2024 17:15:12 +0900
Message-ID: <20240618081515.1215552-2-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618081515.1215552-1-kikuchan98@gmail.com>
References: <20240618081515.1215552-1-kikuchan98@gmail.com>
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

The RG28XX panel is a panel specific to the Anbernic RG28XX.
It is 2.8 inches in size (diagonally) with a resolution of 480x640.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 .../display/panel/sitronix,st7701.yaml        | 36 +++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
index b348f5bf0a9..04f6751ccca 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -22,19 +22,21 @@ description: |
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
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
@@ -43,6 +45,13 @@ properties:
   IOVCC-supply:
     description: I/O system regulator
 
+  dc-gpios:
+    maxItems: 1
+    description: |
+      Controller data/command selection (D/CX) in 4-line SPI mode.
+      If not set, the controller is in 3-line SPI mode.
+      No effect for DSI.
+
   port: true
   reset-gpios: true
   rotation: true
@@ -57,7 +66,7 @@ required:
   - port
   - reset-gpios
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -82,3 +91,26 @@ examples:
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

