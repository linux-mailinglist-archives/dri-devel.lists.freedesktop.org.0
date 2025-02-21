Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA6AA3F860
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249E110EA99;
	Fri, 21 Feb 2025 15:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sVhmpZae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FDF10EA99
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 15:25:00 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-abbb16a0565so32323966b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 07:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151499; x=1740756299; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ysi0JDUh4a5HDZVHMcgvLzjscdPZigz8vY2N2CGO+pI=;
 b=sVhmpZaeS6QZcNWDjRAKpWOH3Mq+w1aGVHkGoCoEbQ61Wn7zc53CUq4sB4k221Pcxf
 fJDeO4Hg4I9tVz+WdojexvH3T39hbY0C3mBwH7aTIqQUMnAYWCjCxqS59fzOL2xrZ/m5
 YJe5l8ph07H9EVLJUDySYSrtzyCRjbDFGcWOBDxmSC8Rik4+ZVjZfSWN4cUWYNIRkpcX
 meX1/aZ0W3xkOMofXCk/t7r1PAzFsO1zdRCrdL0V2ETmrRjhdSgB1ucU0aLTav6souoh
 A2aVq3iqcKpE+vI+nVr6zy5X8xgYU3xi+K5c77z1Ddzhb9xTx8a0KU+dT6vq76F0soZL
 /+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151499; x=1740756299;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ysi0JDUh4a5HDZVHMcgvLzjscdPZigz8vY2N2CGO+pI=;
 b=DNlzmFtDy7UuVff2D4b3HwcFz/7++oS0N1gCHXP1+adeb8Qrl5Dkz1W8XAe5yu8T5h
 7eY5hdS2sxJruV6zcKcrLU3k+3+FlV7hLQnZYh0tM0WxA96YKvOHYPThAaiaDXo8S+eh
 iiYJdpcTW6t5cEv1vdSlqJnM0/pHApXZo4Z3v3zgV2YU1+gkIyZLw6RlK4dilfCB+rin
 O3hv5PQauRLzFfijV8NVTZiJ3MXzDmAJP9knubBQuMpcSyJR+ndtGlFg6OLL/HgOVkqD
 B/d7Bl2bXrOsrPj5qR6xvNRM3/8cU8NAzd6ZcgQsMEF02K/+jO3Mh9MmG+DF6ZVX05qx
 +Yqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd60eL8WsMFOdMYql0QWOJ7IWBTrXmJ4+wTedfyAAVJjyT3tgc/PZdVqQDEv/ZreC0Ovk4aXUs/OQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxMRbS+aBg6GUAgiZjQ78gEg2ZHPyxJA0psg9HCH6zC8KHxfzI
 U3WrWdWNBWWw3itj1v5Y3MpaVGivfyrSAQzj2cp4z9/mt2DbMlRDOuE7HNFGf7c=
X-Gm-Gg: ASbGncu+1GXq1sSK677XKwIYVATu6AT2cpWhFEs5Ud/ccQmCj9YuhiphddbkL+0d3Fv
 XpyjVYsfOaMrpNvn3CVRJgDZbNtVQfaiRImjEg7hvEWECPyf6wnnRldYE2Y658/16ipgHsZcSZe
 TbXGuLwVThOWsC4tdAHyB360RTf8xUQ305m8WrF/qQC+s6KbIRMEjRSiEkQO17SGmJFr7XgzYpf
 a7f9JSFImAIxjrLYL3QjSzmPO4TBqkLODGI9BbqNDUTFRcns00FK4wCnCWZlZUmLFpTsqNXTJZ2
 9b7aFwQHid48LF43KVqbaEefoIPSrt97U3oVDfYwgEj+HNaAjzxZ8idndcdXFN4UYDUlDY/tepp
 N
X-Google-Smtp-Source: AGHT+IFKiCGs8WGJjCjTwDeH5gItqV3Z4eBJ2EseKZT54AU+egPgFTE16MYl1DUKy6/45OfK9TlWOQ==
X-Received: by 2002:a17:907:2d22:b0:ab3:8bcc:3d97 with SMTP id
 a640c23a62f3a-abc09a46c73mr147170066b.5.1740151498576; 
 Fri, 21 Feb 2025 07:24:58 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:24:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:14 +0100
Subject: [PATCH v3 04/21] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-4-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=sQUir1TiVRbtsw+Rrr4J2GdnerWUccENvKyAuylyDIY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJqvbfkL6mifLhnkJ8uZyWrdVvqdxgfUK+3Eg
 sWqITQW+uqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iarwAKCRDBN2bmhouD
 17ScD/0WhW0eY92Rf1M1qxmQ9bWlOi0q6oHKlhME2auE7BpgsJHCJtPsQFg8ZCPpnVkwDPXU7Kj
 JE45JCNTiIcbBznrQaw57ao2XQTnW2WgrpEAeFcRbvdUaeOWhZlkbQ762LGD36nlUiYAQixXTRj
 TtaVv9vO9IlnUQ2Ej4cg1r0ByY29f4pnY3z65T6kVLVFruL92YrR6btwijpiyuqJeWpXxyS2NvY
 ZtTis85EqKruB+RIwxjGmFIHytjTkUffiliCYFEcKAHRx8upuqW0NuKGCAjW5Vna2uq11Jx3hxg
 XowEPVduEhaa9+QqAJF5Ir4FK/Sh3msX4sPdUmTJ2Or1QB55OLVbyyGX9lDwS1ochXYyk1Buef3
 gtzfMmHj/fmECtg+RGU6Njb95awMv4OqzRczYUeluLUxAOyOp476LAQwcVrySnyA3jLzBt1xtI3
 ArRRs1sFbOiFfyZcyWeiMeVpD91yyCj0Vo1ewChFxFmHvF/qq3lhRoEHGTG6eyFguI1Adjsl1ok
 DJ1TIxO/JHORazEkOrtHImUUVPy/e9Zak56HRdyQa3X1jfbGtqKWhKEO2xpcvLIzSasjQ5jyMb+
 +deP5RYyfejTHOxRlHCyWcSJL9xC6KzyO/iqmVKqHdS4G+1bWitDFHeZYEXtn39FSJsnqNUK3bg
 Z/OoH8n7yIpfFeA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Add DSI controller for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

It does not allow the display clock controller clocks like "byte" and
"pixel" to be reparented to DSI PHY PLLs while the DSI PHY PLL is not
configured (not prepared, rate not set).  Therefore
assigned-clock-parents are not working here and driver is responsible
for reparenting clocks with proper procedure.  These clocks are now
inputs to the DSI controller device.

Except that SM8750 DSI comes with several differences, new blocks and
changes in registers, making it incompatible with SM8650.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml  | 54 ++++++++++++++++++++--
 1 file changed, 49 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2aab33cd0017cd4a0c915b7297bb3952e62561fa..8ecb2d8e296edf555df7380eac284b41a3f000a5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -40,6 +40,7 @@ properties:
               - qcom,sm8450-dsi-ctrl
               - qcom,sm8550-dsi-ctrl
               - qcom,sm8650-dsi-ctrl
+              - qcom,sm8750-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
@@ -68,11 +69,11 @@ properties:
        - mnoc:: MNOC clock
        - pixel:: Display pixel clock.
     minItems: 3
-    maxItems: 9
+    maxItems: 12
 
   clock-names:
     minItems: 3
-    maxItems: 9
+    maxItems: 12
 
   phys:
     maxItems: 1
@@ -107,7 +108,8 @@ properties:
     minItems: 2
     maxItems: 4
     description: |
-      Parents of "byte" and "pixel" for the given platform.
+      For DSI on SM8650 and older: parents of "byte" and "pixel" for the given
+      platform.
       For DSIv2 platforms this should contain "byte", "esc", "src" and
       "pixel_src" clocks.
 
@@ -216,8 +218,6 @@ required:
   - clocks
   - clock-names
   - phys
-  - assigned-clocks
-  - assigned-clock-parents
   - ports
 
 allOf:
@@ -242,6 +242,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -264,6 +267,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -286,6 +292,9 @@ allOf:
             - const: pixel
             - const: core
             - const: core_mmss
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -307,6 +316,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -342,6 +354,35 @@ allOf:
             - const: core
             - const: iface
             - const: bus
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8750-dsi-ctrl
+    then:
+      properties:
+        clocks:
+          minItems: 12
+          maxItems: 12
+        clock-names:
+          items:
+            - const: byte
+            - const: byte_intf
+            - const: pixel
+            - const: core
+            - const: iface
+            - const: bus
+            - const: dsi_pll_pixel
+            - const: dsi_pll_byte
+            - const: esync
+            - const: osc
+            - const: byte_src
+            - const: pixel_src
 
   - if:
       properties:
@@ -365,6 +406,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
 unevaluatedProperties: false
 

-- 
2.43.0

