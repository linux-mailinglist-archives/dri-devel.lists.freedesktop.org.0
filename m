Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3D556AD84
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 23:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2CA11B05E;
	Thu,  7 Jul 2022 21:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F5411AC6F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 21:32:09 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id y18so12958183ljj.6
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 14:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f332h430XPLujzbnB28D655qOD0xftQe2GUMxOaYHEE=;
 b=vD8jwtSVMM/mdnUH1BdycUkk5hOIjujpy8d5BecrgwAj+8TPU9rVVtHkMAmkRTxhxx
 0KqlOsuqqhWUYhkoKxhkwbJg6L5YA9nF93IvRKRiPaBzGdrNxs/H+OJuum727PQl97NK
 AvhzA+f2+8ZoihCqKTDRs7undVxbsfEpLgXgCDIyGaT3qEhUvjflrF6A1aU9C30FSrJ7
 z8agQE8yY7LObd9J9ssWbFVI71FsDzXGd970M6i0kRrNCRAROna+fpvo0aJWSFiC7cm2
 OP/qeHqs1oCd9eWUGkemU0fcd0BCGQkf+mci2HFZz8jmFDfHAVfdlCNj7LVYQRaUkJCw
 XeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f332h430XPLujzbnB28D655qOD0xftQe2GUMxOaYHEE=;
 b=EAs9PdF276mMXo6EmNN5lqO4S28m4GUB77pCZ5g21fnYs8C+90t0uTnb4t+bpcArl2
 UYeDxt11aCzwU8tRE5S+MdTgMzga3OzGKBMWF+augpIcYLFbcIDuyccTbGJ0TvIxdSMJ
 tziAlihmcXfhUwk0DWS7Ouq2s64Y2tVRS4+0RbkNC9LvqHmLDSpThSaZRTg33X5R92ey
 ZfeMnZcLsnzH8PXq0lDD+vQFtLeBtJZD9/5vpJilQ4TyIOxz0gvMo2/FY82hbSCfD4ys
 1CLMh+OHPN5Ov/duvPUjo3eytfrCjKn+lL4W6cyVIG33xbOAiL69bxAUTBoOzJUx/R5W
 F9NA==
X-Gm-Message-State: AJIora95IT7IfPMv4OfGWCN/nCsIxQjbi2Kfpc5CIBVzFInhBvV8iDlw
 ORLSL0TJYGYtT2oIfaAN9kAcRg==
X-Google-Smtp-Source: AGRyM1tPOhQoRZlBs5GK3iTsOL1N01Bqd8BlBXjJFeIqnAoL/BBF8qFhZsLjhmLbeD8bH2pdElo8mw==
X-Received: by 2002:a2e:3015:0:b0:25d:51a1:25ea with SMTP id
 w21-20020a2e3015000000b0025d51a125eamr24534ljw.320.1657229527614; 
 Thu, 07 Jul 2022 14:32:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:32:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/9] dt-bindings: msm/dp: bring back support for legacy DP reg
 property
Date: Fri,  8 Jul 2022 00:31:57 +0300
Message-Id: <20220707213204.2605816-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
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

The commit 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
changed reg property to list separate register blocks, which broke
validation of DT files using single register block. Restore
compatibility with older (single register block) DT files by declaring
it as a deprecated alternative.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dp-controller.yaml        | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index d6bbe58ef9e8..dde82d5f6610 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -24,11 +24,15 @@ properties:
       - qcom,sm8350-dp
 
   reg:
-    items:
-      - description: ahb register block
-      - description: aux register block
-      - description: link register block
-      - description: p0 register block
+    oneOf:
+      - items:
+          - description: ahb register block
+          - description: aux register block
+          - description: link register block
+          - description: p0 register block
+      - items:
+          - description: DP register block
+            deprecated: true
 
   interrupts:
     maxItems: 1
-- 
2.35.1

