Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2D6A3F827
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5172710EA85;
	Fri, 21 Feb 2025 15:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rix8RGQr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650E310EA89
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 15:13:20 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5dc050e6a9dso449536a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 07:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740150799; x=1740755599; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Kffi9mM57RBxjp4z5FLBrRuQy7GA5fKXeHplvEZGGf4=;
 b=rix8RGQrGDtkyjesyvBhwZpHaR55mwciXJZaeiAdn991fd6Ir5aPqHIv329qfjyqGj
 DjWQZqMezLiWUZe/7M3ya1I4aff6mB9Qi4b7t+S1ulQlyAOpKsL7LyIH+GrTvYLNCmSH
 cOwjuIaCP7aYTioTEiUX2HgzZmjp4JCVPMWHpUCD2xNKSqKryBriJJdH11HP3wNxCaV5
 YkAtpIk6mG8CabQq6XkLmGkil9Mt6XAoxwU78020B75nomV8Km3/fUpQnKqRZTVdJLJy
 An7HTe0BiUG7DLkyTf6OTLyaPVqjwTJvsgNtDo+32OxRLPoNs1TCzSImvK3rcIXRPqA+
 +V/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740150799; x=1740755599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kffi9mM57RBxjp4z5FLBrRuQy7GA5fKXeHplvEZGGf4=;
 b=sfRR49hiZrZZqC+08Tk44cVz3B9dEqYa7Aw+8MSBBXz7+38+WpMwu8pPdNNOR7MdLB
 +JSgsqULg/5VO/Z8fKYsBYhjSWAaWsec9sLwY6gOYG1k8yYoNoVEKnOvVnE0/XdVaFtj
 FGDnMaiqSVwIqiuqzmDe4JWdvzVbK1Y03O+VsqjxCWw2w0h6nkUJKCq5DDXdJpHiJ2WT
 Krq5bfdX61dPNPgT/EXM3K1S3AI0aSwFIO3ID8d4ko2l734bQB8DxKAw6D48spfMhccD
 sUj6cl9GTDu5gfzaUNuLigC+RwMrr1/sEMYiGlzbRILrc2TIiw9S7ZHmFliWt+V9f7e3
 1NLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKSbNwjrvE9lFAh0K8KdokFabSt7z41ftJoucrFFoWhiV3hhYvUxt0aMGvUncDSkl8ZXxYGV9Pi8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+CIKffx3Vt041Ge+TFiZZKR2jzoIXBkYxdtp0xGzUFRogXn8w
 zG8ld0usPoAQgyiPbMVnlH+k1A2xv9Oy8DiLN7pN7h/2A2FhiCuYBDRMl2R25Hs=
X-Gm-Gg: ASbGncs40aPtn62gHfokoZtYEqH/sGtIhUPRFiCext6iE7F4bt3a03vRCILLSZNyOBr
 jTNxc20kp/vt+4WOfwIjmdx/eqNrfGhTnzfFmO1IHGLzLWdauDJqRSGcCn9UjK4jKWIWDkDG2Ib
 iIGa6I1LhnODMYwBMMkqn4kwsYhMyWCQ7+Y91xZe2srVBt/KPVci8DO5YYIbXDp7lhoSQaJuCdz
 NGldK2WYPlQmb9RHsvEdk++3iCENYQ5KYs0G3PTyFwGrCswJs/lZryL2ym3uCW8v5jg+cylI9yE
 VJa0emXOn1KYGV6vAoJ0rKXM2KBRloPohmA7eB9ye8PfFrLXEgzg0O7EaLSeAt4Ozqa9duGv0Ik
 =
X-Google-Smtp-Source: AGHT+IE2efORy+XnFq6iGRbNUJ79O3DLiV+WA47UQiAkKow39HzZeGH66x8Isz/Apww6BksdMEVRpw==
X-Received: by 2002:a17:907:a089:b0:aa6:9574:1728 with SMTP id
 a640c23a62f3a-abc09a0bf96mr141099466b.6.1740150798792; 
 Fri, 21 Feb 2025 07:13:18 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb8ab30726sm1110640166b.153.2025.02.21.07.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:13:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: display/msm: qcom,
 sa8775p-mdss: Add missing eDP phy
Date: Fri, 21 Feb 2025 16:13:11 +0100
Message-ID: <20250221151311.138755-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Qualcomm SA8775p MDSS display block comes with eDP phy, already used
in DTS and already documented in phy/qcom,edp-phy.yaml binding.  Add the
missing device node in the binding and extend example to silence
dtbs_check warnings like:

  sa8775p-ride.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00', 'phy@aec5a00' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Fix reg size (address/size cells =1) in the example (Rob)
---
 .../display/msm/qcom,sa8775p-mdss.yaml        | 32 +++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index a90a8b3f1a9e..5fac3e266703 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -52,6 +52,13 @@ patternProperties:
         items:
           - const: qcom,sa8775p-dp
 
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,sa8775p-edp-phy
+
 required:
   - compatible
 
@@ -61,6 +68,7 @@ examples:
   - |
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
     #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
     #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
     #include <dt-bindings/power/qcom,rpmhpd.h>
@@ -158,6 +166,26 @@ examples:
             };
         };
 
+        mdss0_dp0_phy: phy@aec2a00 {
+            compatible = "qcom,sa8775p-edp-phy";
+
+            reg = <0x0aec2a00 0x200>,
+                  <0x0aec2200 0xd0>,
+                  <0x0aec2600 0xd0>,
+                  <0x0aec2000 0x1c8>;
+
+            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
+            clock-names = "aux",
+                          "cfg_ahb";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            vdda-phy-supply = <&vreg_l1c>;
+            vdda-pll-supply = <&vreg_l4a>;
+        };
+
         displayport-controller@af54000 {
             compatible = "qcom,sa8775p-dp";
 
@@ -186,9 +214,9 @@ examples:
 
             assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
                               <&dispcc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>;
+            assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
 
-            phys = <&mdss0_edp_phy>;
+            phys = <&mdss0_dp0_phy>;
             phy-names = "dp";
 
             operating-points-v2 = <&dp_opp_table>;
-- 
2.43.0

