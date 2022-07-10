Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8E756CE00
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 10:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473B312AB44;
	Sun, 10 Jul 2022 08:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570E411BFE6
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 08:41:45 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id f39so4254474lfv.3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 01:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N4gY91CPZ/PGGuxbinA0CxZ2MaeVa3+8PjzZmiOKRO8=;
 b=jYr6pCfUPS/qJhudBzz24iWmIWajwKLSIUSXcwgZoSAgfH3r89LPoQ3BwV4cMMyBYj
 3rh2nBvU7quqA+uvde8cqW54OV9G3ZjbXeVkwGoPCsAN80wX7DwZcE5XCb5oR08KJhxx
 wEI6TLGhZr+VghQ4UzcTizoOH4JIdRLq69gJm52Mqbxlz36nwklgM32iDeWHsElcYEqR
 17ceEjhAPVcwlMMyvluN6OqWx8ga7An6zrYNsgQb6SrX5LyMpwjWJTu5dtpXKprRwZi0
 Ne0iYsKkitKHCaMf7nyjC8h8/iyDLCE1hYKLfmOPoZyLnffxrinIzPB8X147915GZ5dE
 93HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N4gY91CPZ/PGGuxbinA0CxZ2MaeVa3+8PjzZmiOKRO8=;
 b=GOMiXLo/qXzU2CtDub4SIgbzXR0PlX+hl4mbkq3D3fUcjUwX11mzYrg66hFnKVOey+
 thmfAC2yFBgDKHpO+IGDEcUcQuiNXA0pE4BA+BrN4qYz98qF28hNRGCc2b+80hJ4BqbM
 yic4doSHV0yYlDlw0ZQ81S01NFmzgGsq/35QS9YTcplhIaaMGdl5/GAYE94aQL7CtESl
 AfltqnCjXcO3onNXpoL2ifyhAdaL+UpuCJaG5A5ezqZZnApADDXAYiU70D9WxCZSWQUN
 rO+eFJHk9ZgvrxbUCcOd8KhroPj+9Wry5ewsQI7AiHQnY8h/aIlebWRNKNgYwUvVc7Ed
 KHwQ==
X-Gm-Message-State: AJIora/hDsnvLnIsLZ1nBfG4v6gqgJyRf9Dsr6NW4Y2dS6wwcjzOZclH
 jy11C3a5SqwdtfZ33a/dFxxvMA==
X-Google-Smtp-Source: AGRyM1vKaySEQME7bXBJfZqWkklO83eim1cErMgSEEh2MVcu134scwwIFDyR7zNIYHpefhUh8tmmnQ==
X-Received: by 2002:a05:6512:398b:b0:489:d94b:f56 with SMTP id
 j11-20020a056512398b00b00489d94b0f56mr1468043lfu.199.1657442504882; 
 Sun, 10 Jul 2022 01:41:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 01:41:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 9/9] dt-bindings: msm/dp: handle DP vs eDP difference
Date: Sun, 10 Jul 2022 11:41:33 +0300
Message-Id: <20220710084133.30976-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The #sound-dai-cells property should be used only for DP controllers. It
doesn't make sense for eDP, there is no support for audio output. The
aux-bus should not be used for DP controllers. Also p1 MMIO region
should be used only for DP controllers.

Take care of these differences.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dp-controller.yaml   | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 52cbf00df0ba..f2515af8256f 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -24,6 +24,7 @@ properties:
       - qcom,sm8350-dp
 
   reg:
+    minItems: 4
     items:
       - description: ahb register block
       - description: aux register block
@@ -112,10 +113,33 @@ required:
   - clock-names
   - phys
   - phy-names
-  - "#sound-dai-cells"
   - power-domains
   - ports
 
+allOf:
+  # AUX BUS does not exist on DP controllers
+  # Audio output also is present only on DP output
+  # p1 regions is present on DP, but not on eDP
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7280-edp
+              - qcom,sc8180x-edp
+    then:
+      properties:
+        "#sound-dai-cells": false
+        reg:
+          maxItems: 4
+    else:
+      properties:
+        aux-bus: false
+        reg:
+          minItems: 5
+      required:
+        - "#sound-dai-cells"
+
 additionalProperties: false
 
 examples:
-- 
2.35.1

