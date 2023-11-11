Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E74CE7E8B2F
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 15:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA0910E0A2;
	Sat, 11 Nov 2023 14:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C1310E28F
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 14:20:22 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9e4675c7a5fso443955966b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 06:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699712421; x=1700317221; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D+rGHu4+hJGBcXxtLJ4Rwqvl52gGeDFd9pbxtP6MGM4=;
 b=oohAEha369MBHuQvh7J6mUK855D+y2NJAQMcIdd2rNrwQ/zNwntNbcRm/M4fhfgBE0
 YPT5mjxNZ/kEJ2HE7pGoSfckpwelKnClHzHJ6Q49vVm4lySlzVWCaDOCdY3T/sXJl8Xm
 ukzcVD4PoqFcBFj375vmG1cA8YSD8ATRYBCVs9bsu/LKUGHj809SjWs7Bz93CFW3zYTq
 GdY57/NA7ftfjgj+bs5Xho4Pi2QSNgEvjcu9HrZEp114rqqErJFPnxhqjWwlS78Fjovh
 8mCdAPgA2Che0ruTlF1BeovvTLKxaATAdHZt+ZJkqS3D96DYdIPc9Uxg2NIYHbhccxL0
 VsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699712421; x=1700317221;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D+rGHu4+hJGBcXxtLJ4Rwqvl52gGeDFd9pbxtP6MGM4=;
 b=HrovuLR6yoEquSJxfcxl64fdd7UQZCSUoNfVZM9Oef8U6RbdDkpZCPszhoCGamhCKM
 Q7rVjLIWsVwkCL780OaWISFFQjDyut/pFp7VCQsIjixzyWPKu4nxWuB/EMLozmoPB00p
 BnExWkFu9aPN+KNA9Y3ku/yOIriUGv0sPVMeoKF7Z2hBPhqHK1lzyecvGHR9LoYUi+nH
 WBESnBkT+gvhm9sFkRjyd77Iy8CauXvNNQDgajpSneiOxSC9Tt8jH7eCuqctDx3ZQ31c
 AoQBjreZLt8KDi+9nyVBGJHSpIHf1VvrEvU6IO4W57/PZHF8nBogCblYzDFcJBGsrRPf
 m93g==
X-Gm-Message-State: AOJu0YwuZmADyv8U36Asao66THeS/37pkH2Zm0F8ZcGGUgWs/qHAa+PI
 JrWU48T14two8nNs0juzUg8CTg==
X-Google-Smtp-Source: AGHT+IECfXbaxOyC0p84OSUFRchWp6f0l4rtPfq/72J6ycLCYhXwSvjyroaayvZVZLq2Q1VBC7meaw==
X-Received: by 2002:a17:906:b30d:b0:9bf:4915:22c4 with SMTP id
 n13-20020a170906b30d00b009bf491522c4mr1123508ejz.67.1699712420937; 
 Sat, 11 Nov 2023 06:20:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126]) by smtp.gmail.com with ESMTPSA id
 gl11-20020a170906e0cb00b009b9aa8fffdasm1136125ejb.131.2023.11.11.06.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 06:20:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display/msm: qcom,
 sm8150-mdss: correct DSI PHY compatible
Date: Sat, 11 Nov 2023 15:20:17 +0100
Message-Id: <20231111142017.51922-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Qualcomm SM8150 MDSS comes with a bit different 7nm DSI PHY with its own
compatible.  DTS already use it:

  sa8155p-adp.dtb: display-subsystem@ae00000: phy@ae94400:compatible:0: 'qcom,dsi-phy-7nm' was expected

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
index a2a8be7f64a9..c0d6a4fdff97 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
@@ -69,7 +69,7 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,dsi-phy-7nm
+        const: qcom,dsi-phy-7nm-8150
 
 unevaluatedProperties: false
 
@@ -247,7 +247,7 @@ examples:
         };
 
         dsi0_phy: phy@ae94400 {
-            compatible = "qcom,dsi-phy-7nm";
+            compatible = "qcom,dsi-phy-7nm-8150";
             reg = <0x0ae94400 0x200>,
                   <0x0ae94600 0x280>,
                   <0x0ae94900 0x260>;
@@ -318,7 +318,7 @@ examples:
         };
 
         dsi1_phy: phy@ae96400 {
-            compatible = "qcom,dsi-phy-7nm";
+            compatible = "qcom,dsi-phy-7nm-8150";
             reg = <0x0ae96400 0x200>,
                   <0x0ae96600 0x280>,
                   <0x0ae96900 0x260>;
-- 
2.34.1

