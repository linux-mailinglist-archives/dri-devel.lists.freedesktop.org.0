Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5073A3F3F8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 13:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D531E10E21D;
	Fri, 21 Feb 2025 12:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aFgBqvpF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05F110E2C0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 12:17:08 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-abb7d5a6577so23453666b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 04:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740140227; x=1740745027; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eAeiE8ep92u5I2OEjsiUsdxt/J43hiJGD52gUZJ3zJ0=;
 b=aFgBqvpFtTJbubkstquqqA/6Ln74UG3+xgsl94gUp/XMt7dCRvMRSW6efNFSfZu8/z
 8hhnZ6h2ftrsjRRD0/YnRAaFPiwNOjQpG881EDhFXQpJ3TqOxE4y9Y2cwgGcJndf+4Qx
 jtW7P1zolZx3L4cPC3dD6XNcZWPjaJgyW2U6bVVXLrC7VuSdT2s4he4p73s8oCv2zLve
 PiQFryNZSokz2X4DYkh/QkPdQntExe92z+d0748+ji7OnHlj86YuHi1MH91ul6nKk/pY
 pRVrfFrx01EG7DT4WdzSd6mk7UV4LTsm97e3O/83lp+ccttGIfUTeFdpUTzCawKlGufl
 l27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740140227; x=1740745027;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eAeiE8ep92u5I2OEjsiUsdxt/J43hiJGD52gUZJ3zJ0=;
 b=GSGQa/8tV6w6psajZ3HhNEB4xJtQKEW5eFFhuzYS1dzGmpxxtHtvANOGdRWWXn0txo
 nqHkI8KekqJoWcc1MJN7s3eJIx6hte+5P4in6CzctJAGrGlvSUjWGuy5T7ZRoSlZzPYy
 w1sVZPa8DS4vSDoewmsaPJsHSa/IZ14NGovCf0sGQXpkWyu9Bn0JXwsG3Fv0E0y+d0wJ
 BI8zOmExMgwN5iE4thL8rF5zOnmsbQqPKZRJpQKLqRYhLto3pbXO/yndUgPPDi15+37O
 abAHZlMhiPI5Q3cQFmGwkpI07R+sAE7HnoX2ggZGOimDA0r5/Bj82lGs1Zjd92KKniLg
 LfEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeqJo7GbcsX4vRC2dQTq2k7RNh7uAH32S75BRBBPAXh+DgctTTWaiV2uQ/gXTwYoQn8oU78FHCvw4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9rsMtpnABn3LGAKoDccxLXya3zrUWEeo4+wJbTmWVEnTno3U3
 8m2X+BU5DIv25SLPeVRa7Sr/DZftmC6QTNXtyU+NEtPLl83kXB+I8vrCECIXsmo=
X-Gm-Gg: ASbGnct/i7nVsi0qJaP1mgK7ghRl7vN0J+G4Ri0m/4eFvJdaivPhlwYapZ0OzPMO4Dv
 LitHQMclqH8HN+VEeMv00OyVekAQglJIkz6SkGcn03ToqWMVq98rLUQxldFC/iZRu/zeeklyRWw
 tyBW6cmAYPX+NwbVfK71QgVFiCHBAOTrl2WDacTUhyHhNRpzS8aDXxZ76amtXujlUqsLFKZ5LR9
 sHF20Qb8BNnRzXVHGXRu2GodipC+u8Iw5BdFjMrQB9m2iaHVqP1WuBNS92WbNkSXq48/3fhjCSf
 vHEHwbVSPAAz43peTAAADop5nixqfPlaZJXOv3R6Jeg8m5l6LAagAFc+FwFx6ItYvc6qIz+rA6o
 =
X-Google-Smtp-Source: AGHT+IHuU1zR/BA+Pe2MYhCuCM+VStRQ9WlfH6VW1Kurq6t3qWN2H1iXwJJ1LKrJXNRHpLQnGQxwPA==
X-Received: by 2002:a17:907:a089:b0:aa6:9574:1728 with SMTP id
 a640c23a62f3a-abc09a0bf96mr111665666b.6.1740140227001; 
 Fri, 21 Feb 2025 04:17:07 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb916db37bsm1041690566b.165.2025.02.21.04.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 04:17:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: display/msm: qcom,
 sa8775p-mdss: Add missing eDP phy
Date: Fri, 21 Feb 2025 13:17:03 +0100
Message-ID: <20250221121703.72230-1-krzysztof.kozlowski@linaro.org>
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
 .../display/msm/qcom,sa8775p-mdss.yaml        | 32 +++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index a90a8b3f1a9e..9c5648f63901 100644
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
+            reg = <0x0 0x0aec2a00 0x0 0x200>,
+                  <0x0 0x0aec2200 0x0 0xd0>,
+                  <0x0 0x0aec2600 0x0 0xd0>,
+                  <0x0 0x0aec2000 0x0 0x1c8>;
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

