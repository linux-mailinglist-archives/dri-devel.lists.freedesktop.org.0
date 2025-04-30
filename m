Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E80AA4C35
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F8F10E7B1;
	Wed, 30 Apr 2025 13:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NM3QwFVc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0A510E79B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:13 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3912387cf48so244435f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018072; x=1746622872; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iG3TpSGpl+MMSxoAQAbN0k3tmRV9VCY0AmQZEYMeWv0=;
 b=NM3QwFVc7H1D/6WnbIjjjIfO1NtQ7SitisBBJkRwYzjqtbJlUEYzRZjnIswG8AfejC
 VKc+M/2rTIxvS3RxwmZflhXM00a6nxRGGI8myRNRae2dQTN6Ij5L+JmvPgCARIK7wJjo
 F+C7mJXHax5IDUzidJ7F1k8fkB4xLIZ0QzdmE3B5higkmZt+jL+DeaC1ZuQ7QjXVbtUB
 6CWtpMQOXtSKGndtwhDKoGucaAwWnxe4qXymso5nu5WEkIrMhaAiS7HpRA1EbgdCVOu1
 vucJ6zsU5Sdn4qzIU+fe+OBs1qO1MiRGJFNgxYIxWMT0Y44I9ZGGuAEzqKuczvZ/gQit
 Olpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018072; x=1746622872;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iG3TpSGpl+MMSxoAQAbN0k3tmRV9VCY0AmQZEYMeWv0=;
 b=uWiQ7XZrMk3M9QLwRaPJhtur8NdG755lwKDZWEt3HJ4nsINVmHm14ZBj4xcJTW9klt
 sO8DKKcGUZ3hmaINr+hlttx0s7AD0SsJI70K7XUP68xwrBZOS8ztpIqCEHtBJuRVHlAL
 D+kW3fGw9RPhtyRw8yNbQRoAhcFxj9F2XTB54oz25yCTyw2612trEd/LsjJjdY52R/HD
 Ir1KIfOv+A8whzzyk6Ypp5dhXFOg8NNm1Sq6DzBj4FTIdI9BujRtIbiJN+d+RRsQGvdE
 o7spF8A3x5TUnMLGQGu5LglUMBt7D7YVWmD3L1kagoV+qL6GXWkgjIe84yDIMyCgEzl2
 ShSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWDFYP/ChNw4PpRuAvFnYt0fj6dOw/IizQJxpfNGX5NiJvtvcOpbEhlDuAF8+e5zZUq8TmzpZ2ID8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytvGFjDg7yod78GLdwIIT0HUSLVA2uuAq07rXPc35avmHtYMH2
 uRnDmQjzbnB7Y7PkWBflmQbCLt4rRecF6KAJqOAdpckWM9jKGhal6vdLMBENSL8=
X-Gm-Gg: ASbGnctiRyI+keOPCwTZubmiu2W9YcFMr0a7/iiCEwcrffi4zklYQfU4uns1owF0LDi
 mecFMz7s+yYrlyxFex5WYBA8xPYfyWY/cwTJI9trjZjnz5+VHXy53cG2b5G5YR3WF+Ah2+NLzeV
 0l4k+tQXXqSjRyNXzfgUJ2YafpAo+XGwM2rXfbJiG0nL90k3ETwobKDUSYlXaKnlT4Tv6woiT5e
 rOPh/tvd3EHvK7KlwywWAKPrJ2NTK2SH1KglPHb7FDHAPx+e1NLCSWkH8RclLFBl03om1/5k7iQ
 /p300uwYvi1nCajpVM97dSuU3rrT1TqgfxE+iU86pmtMr7PaFgMFiPcPwaw=
X-Google-Smtp-Source: AGHT+IE5WK0gG1rgTNC6d+nKzNbxlpE9Pyd/jLCiun9qFIGNupYNh+8MOg3ik3y2f/DJqFecJq490w==
X-Received: by 2002:a05:6000:1a87:b0:3a0:782e:9185 with SMTP id
 ffacd0b85a97d-3a08ff58053mr832694f8f.2.1746018071453; 
 Wed, 30 Apr 2025 06:01:11 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:32 +0200
Subject: [PATCH v5 02/24] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-2-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=c8oHQgWG8zyVpdumvYLiQEjDzxNoqCng/p9ahAFicFw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh70hgOEuQmoJX/RusdSvzlDRwLYOOCVG7rrf
 HFaqGKLi9KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe9AAKCRDBN2bmhouD
 1wx8D/0cwIVHnLhSUBzRM3ZxS64f0pzA9j2/QOnkTM5ah6P9x8iys9lwN41UBcnlh2+nIaxnvDA
 dcHL95ejULON5koCwh+e76+v6mDqrTVDQdK4wXHN8THzgmsO016oSHYSegM1s1kulB60q/esU0E
 BzIME4aieUF7X1MF5C4KpNJivW1RkPUp/kQWbE0TbPt9wOpBq5vigDv63Jmf+JeKtpk3emHhZiM
 S04VpetG42Pc/ClpyzEldyfoFEWiMqSNQthNfK0VnGWrDO9CsKdjnpkZSkYwxFZ4t+USV8+GOBg
 Ks4JotJ/8qkfoQtCM5GknH/2t06OFJ+UXTpfLYE3inlIQbMJMh66N3N/C1M48SADCtuA5C1Y0z1
 rwF7YIigmLadEDJaJc1roUfDxyPLvgogPCXf5brsoYF40Dzjy/nTGeKVJFed/f1/uJ66D+fpbhJ
 w4Hz0o5SR/JlXVF71hfpExZCmkcE99pDVSv2QdsB2NyQWaZOcjr04vlMqgWoxVdMLxxrzMYFS2C
 hYU3+q6nxRY4nXYQ96qXLFK1kagLr1pzYnKDkGZckRXsDEv0SFUTsfkvxaShExu3tX1MO4GfoAq
 BykT1gAScLErWvRzRAkePYhIflqn0JXfysmaZq5oeGCvrrS2aiDpTVAw7CtEV3gc7B0Eic05Tgp
 H6mOG031vpd8QTg==
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
2.45.2

