Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E174DB142C7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 22:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61AB10E588;
	Mon, 28 Jul 2025 20:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aLkpV2nr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84B610E582
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:14:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4563cfac19cso51539735e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753733684; x=1754338484; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xsKr9U/Lsla7ASXIDbg0RnYrGFWyhEYxMUb3V5AUIYU=;
 b=aLkpV2nrwLDmPubSK2RRfxrxLZUf981qXHdaPudUvyZs6pfMKL2kqU5WpP4jdX9E8w
 yikh5WVfWPt12L7gjRXmQlPItYcyz9NXBWrzA2r92gmuzS0lYKdbLwWK1WQum6LQHAvN
 852xHAyFlSet4wdmsDmr/dqkHF+pEE6oJgTRq8AqbILc2b7fdb6s9NSqQPQvQD5a0T6b
 83vbVhUxz5PjdszM8HF4u1YR1xWAxvHWFOkT/w2Q45FMKoDFSXkgYH+KhI6f9SkPxZsl
 GCK4BCNEsQkZR1SKQsi4Ai0hwIDAIj7AtZUNr17avLmVt8Yp74ShFCPFrvo6tCsakkan
 n6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753733684; x=1754338484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xsKr9U/Lsla7ASXIDbg0RnYrGFWyhEYxMUb3V5AUIYU=;
 b=oUpsCzbRPLCoQLV1q8Rb5MbRTuC1YBPyF/x0psc0imw3+X7hqewa9hxnVaVhyCyF+g
 x2O7t0lUsXUiavkLD9Lci18HZYZSKtxPv6fEqjXz/UO0z9Lxmecx1wfpNSKKGd6V9pvb
 69d3yWuJ7iVI3tHmwEqRTEyjFn8o4gGWMeBIImPmyONv7W84yjDNpj0rDtHmGr+heRQx
 hWRmGViw/CIXJTzsy00lQ/pm4Q0xvv1Oq12a/f3xoshl9m5ThexDbSrRK3MkZSadKaPv
 dumS+tDDo3WwR3pvcs+fCUYVnaw0BHg3T2enk4TdJjk36xkvJQ6nSYOOyeR/Qhkkcw+9
 fl3g==
X-Gm-Message-State: AOJu0YzujnEdGtXvDDINTHVsmA3HLSllxTa0WMdEAhpdDu/UM0FL6C9l
 YGjB5s+slyqQ9Cjlra7uLIA8XpohjQ/PzDX6Wddtx2Ba/5sIf5ZoNMTo
X-Gm-Gg: ASbGncvb6x6AAU00xgl8LI/CCD7v6/xnVUVGZFLfqYVt8F/RPiMp15vVvXLLPSGbJFb
 4TKpOXPRzLjKKg9dbhjXoAk59UiTQ3Z/+dejTK9S2TGqNgkE1w5A5ATlCV2SScs4usjXIN84gje
 KVOVx8LFbN4dvtHpWx62lAtGsKXNYj3Q+rd3zkolN+Z2VoyF88AohYUsyGE3QjPB5zeU1obBGV8
 n/ZynZ8d9HPKOeiSf7V2Oza+G+B1uFsYvR2Z4joLpsSwRcwJIBgAVuJlEAd8JVszojsjJJsApjN
 6BfnVEQB2E9OTKlwHOuXPevqdRCLEGMHoPZMmaJVzWj5zXsA4Ie+qMrXQZmPEoF8SgyTnWPSsnB
 F2N102V4g9qNx68MY6GNI6E/To39w94C3YGBlVYiU1V+ce12GxJr+2sU0gjZnpFUTjhFdtNwIL1
 QOk6XMSJo=
X-Google-Smtp-Source: AGHT+IEUuNcHOeAWdj0gIvB3GRqBx2ONsSi3vaEA4s1TNTEmWl2Fj7ZlUH8VSVsaLrvW0IJwWOHZwg==
X-Received: by 2002:a05:600c:529a:b0:453:2433:1c5b with SMTP id
 5b1f17b1804b1-45876307420mr106740915e9.5.1753733684061; 
 Mon, 28 Jul 2025 13:14:44 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b78889682bsm4317760f8f.77.2025.07.28.13.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 13:14:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 4/6] dt-bindings: display: bridge: renesas,
 dsi: Document RZ/V2H(P) and RZ/V2N
Date: Mon, 28 Jul 2025 21:14:33 +0100
Message-ID: <20250728201435.3505594-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the compatible string "renesas,r9a09g057-mipi-dsi" for the Renesas
RZ/V2H(P) (R9A09G057) SoC. While the MIPI DSI LINK registers are shared
with the RZ/G2L SoC, the D-PHY register layout differs. Additionally, the
RZ/V2H(P) uses only two resets compared to three on RZ/G2L, and requires
five clocks instead of six.

To reflect these hardware differences, update the binding schema to
support the reduced clock and reset requirements for RZ/V2H(P).

Since the RZ/V2N (R9A09G056) SoC integrates an identical DSI IP to
RZ/V2H(P), the same "renesas,r9a09g057-mipi-dsi" compatible string is
reused for RZ/V2N.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v6->v7:
- Renamed pllclk to pllrefclk
- Preserved the reviewed by tag from Geert and Krzysztof

v5->v6:
- Preserved the sort order (by part number).
- Added reviewed tag from Geert.

v4->v5:
- No changes

v3->v4:
- No changes

v2->v3:
- Collected reviewed tag from Krzysztof

v1->v2:
- Kept the sort order for schema validation
- Added  `port@1: false` for RZ/V2H(P) SoC
---
 .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++++++++++++-----
 1 file changed, 91 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index 5a99d9b9635e..c20625b8425e 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -14,16 +14,21 @@ description: |
   RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, with
   up to four data lanes.
 
-allOf:
-  - $ref: /schemas/display/dsi-controller.yaml#
-
 properties:
   compatible:
-    items:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
+              - renesas,r9a07g054-mipi-dsi # RZ/V2L
+          - const: renesas,rzg2l-mipi-dsi
+
+      - items:
+          - const: renesas,r9a09g056-mipi-dsi # RZ/V2N
+          - const: renesas,r9a09g057-mipi-dsi
+
       - enum:
-          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
-          - renesas,r9a07g054-mipi-dsi # RZ/V2L
-      - const: renesas,rzg2l-mipi-dsi
+          - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
 
   reg:
     maxItems: 1
@@ -49,34 +54,56 @@ properties:
       - const: debug
 
   clocks:
-    items:
-      - description: DSI D-PHY PLL multiplied clock
-      - description: DSI D-PHY system clock
-      - description: DSI AXI bus clock
-      - description: DSI Register access clock
-      - description: DSI Video clock
-      - description: DSI D-PHY Escape mode transmit clock
+    oneOf:
+      - items:
+          - description: DSI D-PHY PLL multiplied clock
+          - description: DSI D-PHY system clock
+          - description: DSI AXI bus clock
+          - description: DSI Register access clock
+          - description: DSI Video clock
+          - description: DSI D-PHY Escape mode transmit clock
+      - items:
+          - description: DSI D-PHY PLL reference clock
+          - description: DSI AXI bus clock
+          - description: DSI Register access clock
+          - description: DSI Video clock
+          - description: DSI D-PHY Escape mode transmit clock
 
   clock-names:
-    items:
-      - const: pllclk
-      - const: sysclk
-      - const: aclk
-      - const: pclk
-      - const: vclk
-      - const: lpclk
+    oneOf:
+      - items:
+          - const: pllclk
+          - const: sysclk
+          - const: aclk
+          - const: pclk
+          - const: vclk
+          - const: lpclk
+      - items:
+          - const: pllrefclk
+          - const: aclk
+          - const: pclk
+          - const: vclk
+          - const: lpclk
 
   resets:
-    items:
-      - description: MIPI_DSI_CMN_RSTB
-      - description: MIPI_DSI_ARESET_N
-      - description: MIPI_DSI_PRESET_N
+    oneOf:
+      - items:
+          - description: MIPI_DSI_CMN_RSTB
+          - description: MIPI_DSI_ARESET_N
+          - description: MIPI_DSI_PRESET_N
+      - items:
+          - description: MIPI_DSI_ARESET_N
+          - description: MIPI_DSI_PRESET_N
 
   reset-names:
-    items:
-      - const: rst
-      - const: arst
-      - const: prst
+    oneOf:
+      - items:
+          - const: rst
+          - const: arst
+          - const: prst
+      - items:
+          - const: arst
+          - const: prst
 
   power-domains:
     maxItems: 1
@@ -130,6 +157,41 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: ../dsi-controller.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-mipi-dsi
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+
+        clock-names:
+          maxItems: 5
+
+        resets:
+          maxItems: 2
+
+        reset-names:
+          maxItems: 2
+    else:
+      properties:
+        clocks:
+          minItems: 6
+
+        clock-names:
+          minItems: 6
+
+        resets:
+          minItems: 3
+
+        reset-names:
+          minItems: 3
+
 examples:
   - |
     #include <dt-bindings/clock/r9a07g044-cpg.h>
-- 
2.50.1

