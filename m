Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F819655D0F
	for <lists+dri-devel@lfdr.de>; Sun, 25 Dec 2022 13:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B187710E0B8;
	Sun, 25 Dec 2022 11:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA80B10E0A7
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Dec 2022 11:59:30 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id o6so12892513lfi.5
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Dec 2022 03:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DpO2mOjemVEh3PAsRoqwlQ/H7YfF7zaImpMPnEr2kkE=;
 b=WQ9gIrxIlkm1Bi3dBa3sXbnKWg3Q6+9M7yX1DJuLWzwUXDr6C9w9JgzsBHC5tLnwdK
 VVWiwAxxEYutZypfXYJlwWnW8Kw/LXGV60gOlJT69vJsPjgSZpRlVB7YuuR7eCz1Jq5t
 g0urP0hgZMtbFQN9kg7S8FUuMLk4ZjSwpD0SRNiMjbpVHe67g4qlHnvgEmL7P4ZLJNYF
 omP7CeTpAL7RRSgyZ+LQDW2qHeYj1VFCiG1IlcIvSko5qiI6FoP6p3Dtwo/8Y4HUUVZt
 c/q76xmPAe0jKlu0AksRHVjkwPflv9XBTs7Zfd7x3IlFWV3nPmTF/W+3ytbV8mtqSnFL
 UVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DpO2mOjemVEh3PAsRoqwlQ/H7YfF7zaImpMPnEr2kkE=;
 b=wJaQcuYoFBD+Go4d2DLD28CFlvUjO6CeIpsrjtn/7deRO1RhHGkRa42heVg99br7L1
 qYV2FJVBXST8xdciyONKebnhTgU1o1jrbsChovVSJvLbzqTDQV3R/TNAQBve4LcckfOB
 WAhUbcZs4t2JXF0plPt01HxYM75VzvDgX7LwQXMnR0TxAiL2yUKPo93b+gMGoegOAs91
 kDXQwd9lg6CQD9NJih8nrR+bFkXQcX+0smGvYI+zUzXS59J8bhdXQ2WVQs4mvUwbKCSv
 r29PC1SQx7hJx2cIGbqgt0XOZB8TknFVErAa+jSChKHVJQht014H/GfvAp2k6UagXKvT
 hJiw==
X-Gm-Message-State: AFqh2koyMIlfczOCGGpzi5g5wiZHnkIDGal3gFnsYwfO3uTkKE/s/iqN
 0DyKSjS6qXniz5dw+c0FPboskA==
X-Google-Smtp-Source: AMrXdXuKBP7b/Q0FfTlpsV5HqeYYSwCA0PmQAWCBg3FaLBiMZtQ03yvUXAxoTp6x8h1hfEoWYwZD4A==
X-Received: by 2002:a05:6512:1111:b0:4b5:43ef:a552 with SMTP id
 l17-20020a056512111100b004b543efa552mr4951726lfg.16.1671969569066; 
 Sun, 25 Dec 2022 03:59:29 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 r4-20020ac252a4000000b004a25bb4494fsm1336911lfm.178.2022.12.25.03.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Dec 2022 03:59:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: display: msm: drop unneeded list for single
 compatible
Date: Sun, 25 Dec 2022 12:59:25 +0100
Message-Id: <20221225115925.55337-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221225115925.55337-1-krzysztof.kozlowski@linaro.org>
References: <20221225115925.55337-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With only one compatible, there is no need to define it as list (items).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml      | 3 +--
 .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml     | 3 +--
 .../devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml      | 3 +--
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml     | 3 +--
 .../devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml       | 3 +--
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml      | 3 +--
 .../devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml       | 3 +--
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml      | 3 +--
 .../devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml       | 3 +--
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml      | 3 +--
 .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml      | 3 +--
 11 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
index 727a20c4375c..943b6f017f7c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
@@ -13,8 +13,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    items:
-      - const: qcom,msm8998-dpu
+    const: qcom,msm8998-dpu
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
index cf52ff77a41a..f67632a7e8fa 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
@@ -18,8 +18,7 @@ $ref: /schemas/display/msm/mdss-common.yaml#
 
 properties:
   compatible:
-    items:
-      - const: qcom,msm8998-mdss
+    const: qcom,msm8998-mdss
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
index a2fd9f8e456c..6c234b3b2765 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
@@ -13,8 +13,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    items:
-      - const: qcom,qcm2290-dpu
+    const: qcom,qcm2290-dpu
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index 4795e13c7b59..f5b24f81f382 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -18,8 +18,7 @@ $ref: /schemas/display/msm/mdss-common.yaml#
 
 properties:
   compatible:
-    items:
-      - const: qcom,qcm2290-mdss
+    const: qcom,qcm2290-mdss
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
index 2ade94a216a8..86cfa3ddce62 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
@@ -13,8 +13,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    items:
-      - const: qcom,sc7180-dpu
+    const: qcom,sc7180-dpu
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 13e396d61a51..2a1d4510db6d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -18,8 +18,7 @@ $ref: /schemas/display/msm/mdss-common.yaml#
 
 properties:
   compatible:
-    items:
-      - const: qcom,sc7180-mdss
+    const: qcom,sc7180-mdss
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
index a2f305b04ee1..5cabb899977d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
@@ -13,8 +13,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    items:
-      - const: qcom,sdm845-dpu
+    const: qcom,sdm845-dpu
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
index 31ca6f99fc22..289d61debc38 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -18,8 +18,7 @@ $ref: /schemas/display/msm/mdss-common.yaml#
 
 properties:
   compatible:
-    items:
-      - const: qcom,sdm845-mdss
+    const: qcom,sdm845-mdss
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
index 6ad828a20332..bf62c2f5325a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
@@ -13,8 +13,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    items:
-      - const: qcom,sm6115-dpu
+    const: qcom,sm6115-dpu
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index 886858ef6700..2491cb100b33 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -18,8 +18,7 @@ $ref: /schemas/display/msm/mdss-common.yaml#
 
 properties:
   compatible:
-    items:
-      - const: qcom,sm6115-mdss
+    const: qcom,sm6115-mdss
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
index 0d3be5386b3f..753bc99c868a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
@@ -18,8 +18,7 @@ $ref: /schemas/display/msm/mdss-common.yaml#
 
 properties:
   compatible:
-    items:
-      - const: qcom,sm8250-mdss
+    const: qcom,sm8250-mdss
 
   clocks:
     items:
-- 
2.34.1

