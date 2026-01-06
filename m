Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8E7CF9231
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 16:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2074310E3C1;
	Tue,  6 Jan 2026 15:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="duJlNAof";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A28910E0EC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 15:45:08 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-64ba74e6892so1786895a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 07:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1767714307; x=1768319107;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SUqd8zwvUyTysDgnHLfVeULZAfl79gEI4Fn/LX5yuDs=;
 b=duJlNAofjmhFV7D3W/0UP9v/X+cqKpuVJEbvdF3AOHfojcVHkEu27JdMoIw496EwT/
 davlW0Mv1KIolctSuCcmD6OLI212byC2f5twcYRWg1t82PasFQoBFrQXFS7IHbLYMIXj
 86NZp9CFfwgpGWs2a81bASIBn0dHXmL1Xp+OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767714307; x=1768319107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SUqd8zwvUyTysDgnHLfVeULZAfl79gEI4Fn/LX5yuDs=;
 b=dJtd3CCKURFtbxK8JwdZxoPoaadnGh7KKxGSAC1LJFKwwkcSomMzoJvZ+0RjffasdR
 RkwQa/o9VPOogUcTBJ813Z3S5e0zXNvPIJumYgN7BGxDGQ3uejeROC/thF2T7aCmthiB
 6YN8JhAlJtQ7QebTnMG3d9KliDUDkWcqQNFiR9U7OX4y+o+HkkTfqj9DrXVGCvcVZ129
 32+a+6w6PLYitCNgwv03nNcRrpW5w95YcTcUlkjfviTPfmII0LhMeZo1sRJHjEcHOUtq
 yaCjPr8bOTIbAyjU0C4bGmLjAJIZhCgEH8rSocm3//n3qSDAK6cL61uE3v3y0UsVT/Pq
 xPvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXryc3J7Ic+lPVXV0WKvvIf/yxWBZvKdiJZgf6PVPB7GOdAKFdrSdlQLdNTLEJYdHb8NWxFYfCTGdo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS7S/83DcowdEnwur811SsBBCcw3SSsL6pfshDDfSiDRXF5fZg
 wm9koGtHyTvZY+xzvXdFUJ9s9YThi2nypIhv6GE3ohm7PoYuWbc5pDef2UF/ILfKVaU=
X-Gm-Gg: AY/fxX52ODye/iuo8YVS3q//m6xlMlKktgKyG+5gmI5sBRPNS3oSPP1dcpYt51r2wTh
 V46lxJHDi9RcMd8CChvnaaSXQJNeAto9X3WM9pPV7GEB/RCEBDF3gmLxVICil2+k5d0Ru+Ojmn3
 uJl5b4A9UpSO0UZjsIoAEaPzz4hLpdWukaqWo5V7yo8kHU2Qe94Lw/IRjhKELEJdV6xtVC+15eD
 gFtMyHVWORXKDaiL2XmIrAjh1S+/6hA1A/Os1kkWdsYIGy5LVhFCPQ3D6WaS7tReJ8hweBexfcE
 v/hytXibZxp9sLEpUZv2LeVCZNpNVvVfvp0FnzcrYTEW/O2EVjlZL5HJJU7xiFHjYpVeYCMEo9O
 K6IT6VJKSeS0OK/+Vsl0U35MV72+BynH7pDOSZ4VQfB0VupLVHjWPvN+m5pFtnTeOFlsvD0zdlC
 06ycbrCagmHMUb7lAIy+CsKv+ddDziK6hVTBriX91OtcsmAsboi1/msMIfSDFAOBMa+I+oJ9EvX
 MTNmVAEJy2uu9tS7mljmSwzuVDoATZsB1OFC6Wc0Dj4qALBxewYVALsDacy2lAXENkxthrOeyeZ
 0M9wy1MkORA=
X-Google-Smtp-Source: AGHT+IGrVItVM6BcSqra8HjonvfKxfn/bFxw+ItzUUs2ixDuM6Fu7oEkOvvelQp+Xzgp9Nlh1+6vzQ==
X-Received: by 2002:a17:907:a03:b0:b83:95d7:9d50 with SMTP id
 a640c23a62f3a-b8426bb9409mr308850266b.38.1767714306604; 
 Tue, 06 Jan 2026 07:45:06 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507be64efasm2349767a12.21.2026.01.06.07.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 07:45:06 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] dt-bindings: ili9806e: add Rocktech RK050HR345-CT106A
 display
Date: Tue,  6 Jan 2026 16:43:15 +0100
Message-ID: <20260106154446.2735701-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106154446.2735701-1-dario.binacchi@amarulasolutions.com>
References: <20260106154446.2735701-1-dario.binacchi@amarulasolutions.com>
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

Document the Rocktech 5" 480x854 panel based on the Ilitek ILI9806E
controller.

This panel uses SPI for control and an RGB interface for display
data, so adjust the binding requirements accordingly.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../display/panel/ilitek,ili9806e.yaml        | 43 +++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index f80307579485..61d035419126 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/panel/ilitek,ili9806e.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Ilitek ILI9806E based MIPI-DSI panels
+title: Ilitek ILI9806E based panels
 
 maintainers:
   - Michael Walle <mwalle@kernel.org>
@@ -18,6 +18,7 @@ properties:
       - enum:
           - densitron,dmt028vghmcmi-1d
           - ortustech,com35h3p70ulc
+          - rocktech,rk050hr345-ct106a
       - const: ilitek,ili9806e
 
   reg:
@@ -29,12 +30,29 @@ properties:
 required:
   - compatible
   - reg
-  - vdd-supply
-  - vccio-supply
   - reset-gpios
   - backlight
   - port
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - rocktech,rk050hr345-ct106a
+then:
+  $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+  properties:
+    spi-max-frequency: true
+
+  required:
+    - spi-max-frequency
+else:
+  required:
+    - vdd-supply
+    - vccio-supply
+
 unevaluatedProperties: false
 
 examples:
@@ -60,5 +78,24 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
 
+        panel@0 {
+            compatible = "rocktech,rk050hr345-ct106a", "ilitek,ili9806e";
+            reg = <0>;
+            spi-max-frequency = <10000000>;
+            reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+            port {
+                panel_in_rgb: endpoint {
+                    remote-endpoint = <&ltdc_out_rgb>;
+                };
+            };
+        };
+    };
 ...
-- 
2.43.0

