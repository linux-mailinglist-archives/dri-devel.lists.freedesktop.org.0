Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F34777404B3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 22:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC33B10E32F;
	Tue, 27 Jun 2023 20:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD1110E31E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 20:14:31 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3E1AA3F767;
 Tue, 27 Jun 2023 22:14:29 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue, 27 Jun 2023 22:14:21 +0200
Subject: [PATCH v2 06/15] dt-bindings: display/msm: sc7180-dpu: Describe SM6125
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-sm6125-dpu-v2-6-03e430a2078c@somainline.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
In-Reply-To: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.12.3
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SM6125 is identical to SM6375 except that while downstream also defines
a throttle clock, its presence results in timeouts whereas SM6375
requires it to not observe any timeouts.  This is represented by
reducing the clock array length to 6 so that it cannot be passed.  Note
that any SoC other than SM6375 (currently SC7180 and SM6350) are
unconstrained and could either pass or leave out this "throttle" clock.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
index 630b11480496..37f66940c5e3 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
@@ -15,6 +15,7 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-dpu
+      - qcom,sm6125-dpu
       - qcom,sm6350-dpu
       - qcom,sm6375-dpu
 
@@ -73,6 +74,19 @@ allOf:
         clock-names:
           minItems: 7
 
+  - if:
+      properties:
+        compatible:
+          const: qcom,sm6125-dpu
+
+    then:
+      properties:
+        clocks:
+          maxItems: 6
+
+        clock-names:
+          maxItems: 6
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,dispcc-sc7180.h>

-- 
2.41.0

