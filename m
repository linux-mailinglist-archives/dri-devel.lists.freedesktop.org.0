Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C8C59C71C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 20:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B397518A926;
	Mon, 22 Aug 2022 18:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2D08B106
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 18:49:05 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id d8so4160031lfq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 11:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yW/zgiGRRkDA/MVfrxBInFrDTIC51LYTWBpp0NQEfD8=;
 b=IUnejPUHT5pQ9Q9W6PN2D8zRlcRNalnLnHpLk7EYa3s9uyLKfkYvgLOZHNeSath3UM
 HX3pqVzzrlE8CGFIZ9OnddBYRflwJqJa6txIC9HB8nzSenXY3CTj3cxZvR0HDcymGa+M
 DrSObuNl44pUMzg/NOla/4NKIuoD+5uOz6gNumiy1yZKWfm3UN2/RcuKELvDD7f/0cns
 OqJdto02v6mXreeV+mOC122jL8U2Q+RnJw2IBeYACWm9DLg5wNZiB/yGTex0Q70J1MdL
 b43ryCnHpncWUO3K2SiAVdtGEercz+LgjyD0bJnSsygLu/MSHmJ+xVdsZKPyinZDahFK
 caOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yW/zgiGRRkDA/MVfrxBInFrDTIC51LYTWBpp0NQEfD8=;
 b=iyJ7v2WfmoZxwAxytyMFdxe/EtsKq1IBibnGgxry1qeJEa0yYNxKjWRyuNSUXGKt16
 cy8elWbYv6I/A/kLnS2ZKrLKHP+xM5FYfGv9Esz7VFJ8SXOFsVOujUdnU8jtWqp2IPL6
 RIH1yHMyJAKZ2E6KGMcA/LZdrAHCP7J69oBv5ytro8TIRNF8ZMGLlDynNJrm4CjBcn6p
 YP6BITlHY89NmU/UBoMm9/4fB58rbOuLohSYMpMz7+J+ue1qVvfC8OPd9I7tMwEWWkup
 13/N4qDqsTlAvSYH7EwUdKfkwyILBn+nBIlaZJ/FhTUpZMuxPVToqm/269E3DeZgxlHO
 g0Nw==
X-Gm-Message-State: ACgBeo0s2cFqiUk6deT4YBIS3CLTeshwCjkgthjtZLvilUM3CHM7nwbQ
 u82tyEjRTIWCRpkF9y4uxXe/Rw==
X-Google-Smtp-Source: AA6agR4H9k+jzeo4Ilk656p8IX03a6Pbvbfm7v6M3aPwbIQTa0dLaOINaxVU527PebB6Fc6qPsxflw==
X-Received: by 2002:a05:6512:3086:b0:492:c1e7:f5be with SMTP id
 z6-20020a056512308600b00492c1e7f5bemr7024827lfd.454.1661194144173; 
 Mon, 22 Aug 2022 11:49:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 w11-20020a05651c118b00b00261bc05c461sm1672599ljo.50.2022.08.22.11.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 11:49:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 3/3] dt-bindings: msm/dp: handle DP vs eDP difference
Date: Mon, 22 Aug 2022 21:49:00 +0300
Message-Id: <20220822184900.307160-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220822184900.307160-1-dmitry.baryshkov@linaro.org>
References: <20220822184900.307160-1-dmitry.baryshkov@linaro.org>
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

The #sound-dai-cells property should be used only for DP controllers. It
doesn't make sense for eDP, there is no support for audio output. The
aux-bus should not be used for DP controllers. Also p1 MMIO region
should be used only for DP controllers.

Take care of these differences.

Reviewed-by: Rob Herring <robh@kernel.org>
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

