Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF8A669136
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCF110E9B9;
	Fri, 13 Jan 2023 08:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB8210E9AF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:37:28 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bq39so32153147lfb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8TVxtJdg2h5XhTVxxFJGPtkt+HMuIyEWNXdD88o9m4=;
 b=WfLmaKYQeSGM9P6tgCLJkezq5ShsNyq9wnzM+A2likM44ed+GQUTQYYEBBoIu0t5P6
 uY8ochmFRZy29qcuZsochkJkS9vHL+BnKXA6FO35ossjWLEDrM7/dtVmIf94epwLlu0W
 X52Fj2LdxeMD00uBC+c0TxFMdA/i+eGac9D8GQKLaGWILayk9VzMclTF3Sn7yHeW04F1
 NafYhdiwGHm76sW2tdMk+77uDhjwCnIHgu4TcD3gnsJv9Dg0//+VfHpjEZB/c/NbT0QU
 ZT88012E52zl3ZQ7n/1wfuuwcekcFmeCtXwoNdP62AU/1tmcfOaPY0wxUTtU2DkMWzIV
 A1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8TVxtJdg2h5XhTVxxFJGPtkt+HMuIyEWNXdD88o9m4=;
 b=U3YFXafTDTWDZ8WrpTC3wH+AmVH1EhEJFoJ8mski9b1WBY5RLksQFKvfEq+lQiNOB6
 u57C+0bi5EgtIK2WF0DeKmVZvefrSkTJsFTzfo+s3MgqwMOsACjyFloCe85M50QmaQKH
 aActOqYO674lPcggNwfUIqxCA4wdh53g+47q602Gdn5+5UOwX5vFsmvIkIKraxvQvXhE
 16BZ0X9bpxalpybPw20h+MabqGsLBsgN5bs8cqsTeEoKqyPgtzgNdoadLst1Uj2Uhfj0
 c9gBtlUX/STMFPOo2PNDyDghfJonEXKjUug1FvoiX4VEG/OX6E6deRv+435i6VTEtPuB
 iACA==
X-Gm-Message-State: AFqh2kqR3Ubt9yHRIuBVwxpME2M2dpZ9wxlCq7NVM0U01wxajeFUSK4c
 VBjevSrBsD8cQG0dOQ2sCuRvXg==
X-Google-Smtp-Source: AMrXdXtB2YEHCAdS50P4fV1zUDlLyBdhXucLwdD3JaKYcIdl+ECMK511wK8DblpGZs+KW/iRZpeBJg==
X-Received: by 2002:a19:f514:0:b0:4b5:61e8:8934 with SMTP id
 j20-20020a19f514000000b004b561e88934mr20438626lfb.64.1673599047061; 
 Fri, 13 Jan 2023 00:37:27 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 00:37:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 03/11] dt-bindings: display/msm: add core clock to the mdss
 bindings
Date: Fri, 13 Jan 2023 10:37:12 +0200
Message-Id: <20230113083720.39224-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add (optional) core clock to the mdss bindings to let the MDSS driver
access harware registers before MDP driver probes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/qcom,mdss.yaml       | 34 ++++++++++++++-----
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index dcde34ffc8d0..6948ae3ac7bc 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -45,17 +45,11 @@ properties:
 
   clocks:
     minItems: 1
-    items:
-      - description: Display abh clock
-      - description: Display axi clock
-      - description: Display vsync clock
+    maxItems: 4
 
   clock-names:
     minItems: 1
-    items:
-      - const: iface
-      - const: bus
-      - const: vsync
+    maxItems: 4
 
   "#address-cells":
     const: 1
@@ -69,6 +63,30 @@ properties:
     items:
       - description: MDSS_CORE reset
 
+oneOf:
+  - properties:
+      clocks:
+        minItems: 3
+        maxItems: 4
+
+      clock-names:
+        minItems: 3
+        items:
+          - const: iface
+          - const: bus
+          - const: vsync
+          - const: core
+  - properties:
+      clocks:
+        minItems: 1
+        maxItems: 2
+
+      clock-names:
+        minItems: 1
+        items:
+          - const: iface
+          - const: core
+
 required:
   - compatible
   - reg
-- 
2.39.0

