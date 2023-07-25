Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE579761069
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 12:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EE710E0C5;
	Tue, 25 Jul 2023 10:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26F810E0B1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 10:16:17 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51e429e1eabso7908484a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 03:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690280176; x=1690884976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kgjzM14QEiL69p/YLX8lqgzuetXlnguUNrcPLd50K6I=;
 b=C4czm/+Xz2UutJXlca3VkY/5VlywrDLHuMNp4CGjo7VZ0TpqzJjydvmrSDzTVSgAEt
 +K3IZtgfB7epGyj4hbxX3wdBDlHFLyGYF8k87sMiH+G1gcqAMx40aZLy7MF9s5xeQP5x
 fhnbmSwYWkAVdLsXKHBG7KQami1/9ue4beRYmJdyrSe/ka3umBmFTIAsEMhYhkmED0+n
 h/tD+XzOhnhPcv7zRtsI2fsZdxpvyQNcwnEGlJZJJczCbDOtfM40WLASHHbA4aiLIfjA
 D/rEU4Og78VLM9QbuzZ0XS+STA60ygyZjzHaQn79vehoGSKmUMX5h5wYMfmhLuvrMwXR
 vuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690280176; x=1690884976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kgjzM14QEiL69p/YLX8lqgzuetXlnguUNrcPLd50K6I=;
 b=M/lHzeEgEKNigG7LIqhaDAHhaHyJQlikHFouLOt195bdwYdMRU6IvdXqiU8VdXdngz
 r0BzZIPh8vtyO48gRjsL6J5dfH1dR3kCMou2Ah8IroUjrEhWbiENwEOb6xo8QjCJ8mRK
 X+WdBz0T+e/OO62nfcmVkeweV3d5Kf5CskZOjD5zkPbRvmmgtXY6UDcFQr6mKRZ/Jy4+
 TtvRNiYBuu4sYg8rmVDQcNKOePNcuvuzP+dLNbVPBG5aMHkst/tGnYbvInZ4D/sXcLO8
 HcykMpAucT52qrfSB+zqakOTOGDhuPu6lrYlWyZUl73zPj11G8MmmWdcrZ8FLvFey0jt
 34Wg==
X-Gm-Message-State: ABy/qLbe7rdtnHoAEUiN4+bzcU5ILhvjzHLIODyXoeK116TXtPbw2u7I
 LQfe5QbeXVHkYONEiJkONwot4w==
X-Google-Smtp-Source: APBJJlGBMU5DGuFGwk0qtfh0c2aQo1t0zRXQTiXXDi0POVtlnNNbgD2TyBllza9yPhuzHMFnWRx1Kg==
X-Received: by 2002:aa7:d410:0:b0:522:3a0d:38c2 with SMTP id
 z16-20020aa7d410000000b005223a0d38c2mr3214909edq.9.1690280176127; 
 Tue, 25 Jul 2023 03:16:16 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104]) by smtp.gmail.com with ESMTPSA id
 f23-20020a05640214d700b005224ec27dd7sm544171edx.66.2023.07.25.03.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 03:16:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: msm: sm6125-mdss: drop unneeded status
 from examples
Date: Tue, 25 Jul 2023 12:16:10 +0200
Message-Id: <20230725101610.75122-1-krzysztof.kozlowski@linaro.org>
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

Example DTS should not have 'status' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml   | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
index 2525482424cb..479c82e6a0d8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
@@ -95,8 +95,6 @@ examples:
         #size-cells = <1>;
         ranges;
 
-        status = "disabled";
-
         display-controller@5e01000 {
             compatible = "qcom,sm6125-dpu";
             reg = <0x05e01000 0x83208>,
@@ -170,8 +168,6 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
-            status = "disabled";
-
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;
@@ -210,8 +206,6 @@ examples:
 
             required-opps = <&rpmpd_opp_svs>;
             power-domains = <&rpmpd SM6125_VDDMX>;
-
-            status = "disabled";
         };
     };
 ...
-- 
2.34.1

