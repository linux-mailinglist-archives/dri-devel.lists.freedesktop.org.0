Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3177AADEF75
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E1910E894;
	Wed, 18 Jun 2025 14:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BYIIsc35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B4310E887
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 14:33:20 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ad89c10dfabso200209866b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750257199; x=1750861999; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QjftRN79TvWO6QuKUy67aBlRYEHheVO5KyEXzVb5XhU=;
 b=BYIIsc35uyYfKsFqsZxd62Q1RG8yYhMO4j+y6tymWvKC6AMcQCI3ws16/jhx9laiLt
 Sv7HEF0USreLvr/3hiL7o5z3oypbAGuFa8XLsmL4F5CbSYblQwz26YeNo+7IDpj+al9k
 mCRGV5VygAbZ0kHhVBun+jfYWRI8MzHMp+XDsP39xi8MpCOnK7q51LHVUKsJXtgEaecj
 rSwlMo5zPxYTEgUxCsMPlkHg1TsfaTkL5N9vFvaSTkQPkIJAMWaKxyHMKOn9wVQecJCj
 4apY0nIqjBQ8GLKnjakbguLkDorctG+tfkE51/jwz8R7pFP7SdBjYEbNSiXrgJNIEAi5
 ZEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750257199; x=1750861999;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QjftRN79TvWO6QuKUy67aBlRYEHheVO5KyEXzVb5XhU=;
 b=xMFq6UT8HdQ6fPmMcc6yfpDV6D8ZKQh00ZXBoklf5q6uhxF/OVwoGZJBnHcpEpitSZ
 TFc39rQT8eTzusQreyu1o0uQcVrWoI43H0U7zehiXsy2z+Uen3pDQF0dsrxjz/enlhsJ
 QFUJHdWXd34RKAi6PQSkJNmiXwweh1eiNglqqj3kJLV+KY7nK71n/NpXtSi6XLWlxffC
 wCtPzP2bMGSLg+urhO5Aq6RZFql0ANnVaOd7CjVdqyBk/B+NCF7BE/r6hkwqctnHg9Ad
 Pnk4CrdHhFVmiKC0BDmLzkD3Q/RRvsDs9TRnyExTNr0YR6AhuMWFD6lcNYr9g2aFtLBI
 j8gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/PEltTWmbO7LSScbLGDc2SpeKj21O8TUhjNrb9me4NODLL740qB1lx465CtSQbA+gr4mv8tDost8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcuBMU7/sn6vRATDWjSlll43uFEsGNkm9yZhFesA6e1lddtB4k
 DS8krwvR1KIupsCDMG7J4BpoxsmfwF148+pivlz9mCab8nArr1OkWhDAtJR7k5V+T2M=
X-Gm-Gg: ASbGncvboggpUgWLxwLA2I4tmmtvMnX9i+6zWjTLahdq5PUAFms7gCUllA6nNfagGz2
 WFVr5rPfOAFtkD+VnTOmwbxuTJpjfuoNj/AROmAYSAzhY8ttvG5h7ngW79OElb5H+FV6b1YkVsr
 uNcF4xykt3k2LEg4d3rbMi7EHva1u5bTYS9C/ImZIdtzQ9hRzKbE4vKjaLr4Xb1tZS0rohQH2H/
 Fz0xF0F0YdG919Gb5BY/mbz3vm5rJFhF2LHBfopC23h+vVGgo+7cvjAu3kHZcBxpEco3jdDFWls
 uxcjdgQ5XGIo8bbmwRkzxwtK4j68p8ruLCC6at95QQfv+95AKpmCxCT6fKCm80lSSLmY4fwn/Gf
 SIz60LAw=
X-Google-Smtp-Source: AGHT+IGnO4AeGX0v+xlGD2WvBUnNlaLV8qfrgbqsidl2MAahvBa3dYReqfHNCI7spPo1T7GtkiXpYg==
X-Received: by 2002:a17:907:d29:b0:ad8:a2b3:66fb with SMTP id
 a640c23a62f3a-adfad3748bfmr559881066b.3.1750257199028; 
 Wed, 18 Jun 2025 07:33:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec81c0135sm1052257566b.47.2025.06.18.07.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 07:33:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 18 Jun 2025 16:32:31 +0200
Subject: [PATCH v7 02/13] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-b4-sm8750-display-v7-2-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=yhNmcVev6YviCoPWMe9VUWm+x64YmaIBhLXpEPpZ7Gk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUs4bib0TEGjh6PRC3ElS2V34P5xI8OZ4+ka/N
 sivMV7mbICJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFLOGwAKCRDBN2bmhouD
 14NhEACDDmu3EbTY6hDUY95YqoiGg3PZANS7q++04+7UPtSdj0ys1bAuZidDqDqhVFaA3Zmlz7y
 QZ4TCxzra/I7YX3fhJeQLhRxT+R/Cfmt8+cb3vJxMEz6r1cd5m3dIwLHL6kngjuTNIvNY3gCMaA
 NMOCzYcgyf73U6Yz7a68S2CmJM+ZjXMjZLb4RG5WWOfHmbGtfn3kM5i8KIFjSV0sfGsbpFPrBnu
 hkTN0bVYhu0TG3EZfrPOAa1V89etmpwA9r7Y6KVLkk1g4S/lKWu1voKp5T8Mb5P1qfH5lwWyDn6
 vfT6iU6HsGS1KrvyT3hpD+YG1ZYcMY9CIhO3HryqTLEeIoRS6VBGvMjHhKLy2MNr6t9FwDdAjtt
 RPqfaxnXJBKTpylwR469a+/0PGndp7cd4kcy4rQp+BGcnP7SGGFXr45ejv3fTh+AIlPBEnf1P4o
 zM8A4XVW8hJINDJJtDsIgIUgctAlJdwIC2J+q1MuzStRCVM/djebQL8tpftqKSgvb1feH/dN57f
 nJ6x2WiB7CS974UPU0p5QxHpcxWcZa5Q789njnS5KYGOifRcTHH/X1oEoE/XTYJGFytM2Q92Y4+
 3MXVYF24f/7pYMz9Of7lIJSsbA5f5tKqgacRWgx0eMBPIaJ57ob9Hc6a70dDGoHsk6HRtkzaT4Y
 mgZsli/RbyL8hhA==
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
index 82fe95a6d9599b5799549356451278564dc070de..d4bb65c660af8ce8a6bda129a8275c579a705871 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -42,6 +42,7 @@ properties:
               - qcom,sm8450-dsi-ctrl
               - qcom,sm8550-dsi-ctrl
               - qcom,sm8650-dsi-ctrl
+              - qcom,sm8750-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
@@ -70,11 +71,11 @@ properties:
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
@@ -109,7 +110,8 @@ properties:
     minItems: 2
     maxItems: 4
     description: |
-      Parents of "byte" and "pixel" for the given platform.
+      For DSI on SM8650 and older: parents of "byte" and "pixel" for the given
+      platform.
       For DSIv2 platforms this should contain "byte", "esc", "src" and
       "pixel_src" clocks.
 
@@ -218,8 +220,6 @@ required:
   - clocks
   - clock-names
   - phys
-  - assigned-clocks
-  - assigned-clock-parents
   - ports
 
 allOf:
@@ -244,6 +244,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -266,6 +269,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -288,6 +294,9 @@ allOf:
             - const: pixel
             - const: core
             - const: core_mmss
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -309,6 +318,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -346,6 +358,35 @@ allOf:
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
@@ -369,6 +410,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
 unevaluatedProperties: false
 

-- 
2.45.2

