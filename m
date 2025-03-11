Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551E4A5CE77
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 20:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D8510E66D;
	Tue, 11 Mar 2025 19:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jf8xhtpz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7682110E65A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 19:02:23 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-39123d2eb7fso440079f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 12:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741719742; x=1742324542; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ysi0JDUh4a5HDZVHMcgvLzjscdPZigz8vY2N2CGO+pI=;
 b=jf8xhtpz2kFIVrrDnjdJ4nBIvX6Irm6Lg1kvi5FixNXu0bUUKXfz9eX2v8UNHPYzmv
 s9JFeJT99CXU8VhCD2o1oMdpe4wCVApRlAzr2M7DctCTvgOD+w33zl+pBPpEYrY1+oV1
 N+tR+mMwMZbQ+IStrbIRotMGg2SLOqWv4/PvcsIleVtmOX4h/Uy9FRqhZ+xb3vs58jVD
 qAIDNdUPSVPhFBE8/YVpnHGn+IzAdP0s9NiuIuUJzRb8Sr4N0mRmcFdkFg4aroyk9Q/l
 7Wy1mj+KMgRFsTfM2FtsHK/iT2Pu9/jyqozaAx3RgckWF2NuAuhH2APRIhsHTV8oM7zp
 ufUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719742; x=1742324542;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ysi0JDUh4a5HDZVHMcgvLzjscdPZigz8vY2N2CGO+pI=;
 b=b3UgFFOOSlWFvq6kEOwpY396ytKZMa8Q0SpVzBpqd2e5jYiZ4R7ryWQUF1xgOBZgGL
 z7kyLIuWqC8GynMnk8ywcvbeAw9XSCKraSbtSB968XVYEL5yeV1/GbZRNo8tn86m3JOX
 yx7y+H26tBbgvXaKPKQI9HceLizLWW0sYyPjz+ClC8uTgZD4Dqp2gCd3K9YTiABl72Hi
 xNJ6Qc77G5s8F5Iy8EkRYLmFz9k21rp3XDdiDXL8zOSlFfRk2nEHiqkJGt1N1bhChdo2
 I3q0BNiCkxc7eJWTfkhFceuK4ddwxMVTB+Cpy/Gvx3xLa6kt/ibVynRpT3Uw8kuSAlKg
 fnSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlEuvH1DCDTWu1wdhOGYeS/++L4eA6SI9UicNmjhQzqXrdMLoJVwYpgT4pxGBdgmGPVxpT6Djy8r4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuSfzyvM0ioG5hVC5ApggYoSL1WG9vay6Xarc/Uo0IohEh7Y05
 GUPkIb/0av0NAPYFtmqhXQzC9rWKmF1utxOOfJwfrAMYJhZBFEFncNms6i5hVog=
X-Gm-Gg: ASbGncskHBsTYkkc1FvHyUi4hjU+phXXXwHpomwW0HJ4jukbWTFNHcqdUkoGu76n/Hu
 PVV95oAe6ECTe3bLQAnm0tTTqeMPnB7Nke2EwE/KCoAaEr9A80mmo0wTn3yRxIMOht2osmpa0uF
 Pr0jrRBO1GPnimh/D2Jd45EStIQNzY5QIX6Aj7eaSFB0mZsbjTWYTpKahsNK5koaeZbxmTZ/zn5
 LpaeLJGU5WSs5DO717R6Qytexc9BpMcoY/w+4XuFm2MHmegfTQYTXYan5CyflSrvcIBbZ3XOhke
 Ez5A/OnKahpBNEKWYiVnpLaWI0fWDpngzIQWB5zT2WEs10xq0ZTNvyevhq0=
X-Google-Smtp-Source: AGHT+IF417WVwkhv/4kEj5mDmA48euPvIfgAetNKZ077oeDcX29A47ICgyJbHG2WlP6N8LBlrOLfhg==
X-Received: by 2002:a5d:598d:0:b0:38f:2833:2c87 with SMTP id
 ffacd0b85a97d-3913bbd0d34mr4867195f8f.11.1741719741888; 
 Tue, 11 Mar 2025 12:02:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:02:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:01:52 +0100
Subject: [PATCH v4 02/19] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-2-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0Iim/DeJggisQZOiWbGTSOucZf+5Z6lD9UY2b
 NR1mQALSr2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIpgAKCRDBN2bmhouD
 12NOD/0eVzZaD4fQjBBYiBAOPxLRo/Sm7deaZtAXBdyL9/HYJb8xLV4oZoAja8KYgQOXorIMPoj
 bX9BybGjnXaJgxcDLXaEu9BL+IZMMEHqhtb54jnFzyK/p4CWCEgCUgSC0UFsKZjEXpeBmOZkJFc
 6vk6IRa6wj9LedgNYdo6qWNZyfnAs8COTojDU7wDE5YkD+76CDVjSfbOmXaA3k+gEdNfFl/DED5
 ukw3aVk91nRCYY+iETIqzuCbRDy9OO9Xp/VaTM3Aa17PCluZD7UtAnlPqwjt6wNG2l9Oi0iYSlW
 FqcqPf3T1Qzl8IBUe+n3AJV81TIykkQh8pYa+iLvlcsiIP8C1NxV6lVZMvmFNT/5Y9kS5G7Nqbb
 EOdxKVbmwxIpXb7xlvmnXcN+eP0NeKg4R1zgjeQkrwaEu6M1JpujbWQ8Qxhk1iyIxz5XJSwDR5C
 BR6S1SlWFxYzP80fGuT4EBTXCV/K4f2fc1ri3xKR+rn2xrij3zfwjFSQeI7YFodC/AQgmQtSVhR
 wm4lYoOFWMACJPDy/tgpZbnlDeKz03cK3t5efJVsRJFXkjA+czVHYiDWtU+WmcroMFJmZU1h+yr
 aZWAXQEfgC+hr9ySFX/xx4Y5YDh3diWXwfX1c81a7vYzhilb8V8kfvgVlAIQ41ZRia9mVMc6VX/
 y36CkiidRFk69Hw==
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

