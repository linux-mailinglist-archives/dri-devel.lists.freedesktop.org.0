Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6248568BC3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 16:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AAE10FDE5;
	Wed,  6 Jul 2022 14:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADFF10FD2E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 14:52:29 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id j21so26399854lfe.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YGpi0SFFoJ3mrUdF5aNGfF/1+tRI0LBYVB6N+5rOpcE=;
 b=ud+8DDk6zQxQpEHyhB/JSyKIIwzFovGR4WW9/ItDk367a5uJJnQJWjRANSrhIgyESE
 1km53xbY/qlz8V7A+bxfcmQ9aCCsjfEGMlt3MvpWj0UJOu3EvNzGr8hhB6NiHfFihU9K
 CKXy/4JLoMazyQf0KjgNrll1S2qKVzqh5fW6KvmBdmsqRL7AFoPlzm/uv/zLmid5BVLq
 JVNEvnC7KiGIp3GgxtEXIro8bzdMAZT3zO6RWE5MTq1ODJRPwp7u3TPcjKZG/55312IY
 Ycaq+rs1nMg2OSRhDZJNERnnNvTRP+sJrZ9uiQF8CbHu9zOBl8K1IIeOpGmBF1ltAVST
 niGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YGpi0SFFoJ3mrUdF5aNGfF/1+tRI0LBYVB6N+5rOpcE=;
 b=4Rdbrf4LFZbwmO3BArBRWGYRy7qEjOjJrVSY2V3goUaywalN0Q3ERgyUeD/FLusMtF
 Zui/uRyh/euQ29B9tpACoyOAciFdvhlh2rkLrszGW2YbrIZraMRRPKAq1eCyfkWUiRCN
 7c3z58DZHZSVK/2jJhnicWxXIbLqSWZ400D2VxnzgiU0tVRP1Vt1dhkrMHlzTfzVZbzh
 wvmxbKTqgKkVCyLjbBhuTRU+2n2qSqzTO75GPmvwZxmwTfukDKvOOATHIKssNBtMBqnE
 2m2rORlnaTch3HEbpUXWVqUCCYhy0XKBYV83I3aLvehvd+iZsXrjLjasKz8pn8Ea6i4y
 9RhA==
X-Gm-Message-State: AJIora+5JwmWUPdcGoC2dSkq/1VEsL5iE/21PfwBxJQ2hsie7QMymEF9
 3WjHv3HOb75r74NXzKpFx5tEAw==
X-Google-Smtp-Source: AGRyM1vI6k4XLJFvekZaqNekF4y59n9LrP4o4IJNI70b4dAoY11lzc8ZBQXaxV2QO6gEJp2+Bpsoww==
X-Received: by 2002:ac2:5fa8:0:b0:481:4470:413a with SMTP id
 s8-20020ac25fa8000000b004814470413amr24354447lfe.449.1657119147993; 
 Wed, 06 Jul 2022 07:52:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 v25-20020a056512049900b004855e979abcsm556617lfq.99.2022.07.06.07.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 07:52:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 3/4] dt-bindings: display/msm/gmu: account for different GMU
 variants
Date: Wed,  6 Jul 2022 17:52:21 +0300
Message-Id: <20220706145222.1565238-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make display/msm/gmu.yaml describe all existing GMU variants rather than
just the 630.2 (SDM845) version of it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/gmu.yaml  | 166 +++++++++++++++---
 1 file changed, 146 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index fe55611d2603..67fdeeabae0c 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -20,35 +20,24 @@ description: |
 properties:
   compatible:
     items:
-      - enum:
-          - qcom,adreno-gmu-630.2
+      - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
       - const: qcom,adreno-gmu
 
   reg:
-    items:
-      - description: Core GMU registers
-      - description: GMU PDC registers
-      - description: GMU PDC sequence registers
+    minItems: 3
+    maxItems: 4
 
   reg-names:
-    items:
-      - const: gmu
-      - const: gmu_pdc
-      - const: gmu_pdc_seq
+    minItems: 3
+    maxItems: 4
 
   clocks:
-    items:
-      - description: GMU clock
-      - description: GPU CX clock
-      - description: GPU AXI clock
-      - description: GPU MEMNOC clock
+    minItems: 4
+    maxItems: 7
 
   clock-names:
-    items:
-      - const: gmu
-      - const: cxo
-      - const: axi
-      - const: memnoc
+    minItems: 4
+    maxItems: 7
 
   interrupts:
     items:
@@ -76,6 +65,9 @@ properties:
 
   operating-points-v2: true
 
+  opp-table:
+    type: object
+
 required:
   - compatible
   - reg
@@ -91,6 +83,140 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-gmu-618.0
+              - qcom,adreno-gmu-630.2
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: GMU PDC registers
+            - description: GMU PDC sequence registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: gmu_pdc
+            - const: gmu_pdc_seq
+        clocks:
+          items:
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+        clock-names:
+          items:
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-gmu-635.0
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: Resource controller registers
+            - description: GMU PDC registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: rscc
+            - const: gmu_pdc
+        clocks:
+          items:
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GPU AHB clock
+            - description: GPU HUB CX clock
+            - description: GPU SMMU vote clock
+        clock-names:
+          items:
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: ahb
+            - const: hub
+            - const: smmu_vote
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-gmu-640.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: GMU PDC registers
+            - description: GMU PDC sequence registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: gmu_pdc
+            - const: gmu_pdc_seq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-gmu-650.2
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: Resource controller registers
+            - description: GMU PDC registers
+            - description: GMU PDC sequence registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: rscc
+            - const: gmu_pdc
+            - const: gmu_pdc_seq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-gmu-640.1
+              - qcom,adreno-gmu-650.2
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
-- 
2.35.1

