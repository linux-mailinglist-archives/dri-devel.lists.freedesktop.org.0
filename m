Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59480752923
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CB710E712;
	Thu, 13 Jul 2023 16:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AFD10E70E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 16:52:48 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1b0156a1c49so713380fac.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689267167; x=1691859167;
 h=content-transfer-encoding:author:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/TQQu9i4zVTx/pAbl1XLa7p043pJkUqA0em0AaQVe1Q=;
 b=EOJTZVfBLXbJ+tgLJUJRaAhYQO95hGodf9yyM3ZyJmDrHCRlhC2xTABoIUd+3Cl1Yo
 XO6MFz+wN+mKMs6tq2jcRQ64XxumnSH7k9awmG8P4d7raV506yyFNuk+QzDmoxlG7chk
 Xm8c4ZN86UiZ92TA62A3E7CqOGXkzsg58hlso09jztugiWJsrZlajfgdFEImk3AudVEl
 cx4jXLpbjX+rbI6inQvzyxatK+J3NV0dtyEMl2rdalG0LM16oQKztrzu1e9wqiv4IAZx
 OywlZGqh1gyC+BOajdMLtm5QuJcdzMOffKpKItqBLM8fiPpYEPx/vCTS+0PA28sPaCRn
 hNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689267167; x=1691859167;
 h=content-transfer-encoding:author:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/TQQu9i4zVTx/pAbl1XLa7p043pJkUqA0em0AaQVe1Q=;
 b=YvOQjnXDWYCe2yX0fjNFbgqWuKWQ91CWUHEOWeMghcjZij+EG+U+ppszvPyU+OtLR1
 tk5C97JATdGA4yEffvBtwVLbhYGchEWDZ6AnwjVt4c4KkXtS0JfYtQuautE8k/mTD/xe
 L6HtsmSaI433q10KWlAQfNvxPrPKaZ93+bKZoPjHV6QjQAQb7csVNaF5WNZw3MWUES0v
 ZLPm6skT7RNykUYsk4jKzhhsEolklFVNObJAV2CKbHFjLbn0MBd4sLhLWjZtFtQJkMUY
 1DETKFXz7kv5TIaYgqjICuwpTLzyPiF0N3oi9Ifmw8WIk8qDGUMgvIETH5WynZxRlrgC
 HJXA==
X-Gm-Message-State: ABy/qLbiKNyxL/jsurF0pVQY7dQwW1sfCaKM8zjZLTQ8e79JuFfrk3nX
 Qp0pgKahNW2aN3WIMaX7S+TmXw==
X-Google-Smtp-Source: APBJJlECN8Pkf5oJl1wriKAi9i7oMviETr74ANXnYL6u7bXmI8D7Lz2S54OFWvuw32qLmK8Qci/xoA==
X-Received: by 2002:a05:6870:c188:b0:19f:5c37:abb9 with SMTP id
 h8-20020a056870c18800b0019f5c37abb9mr2495348oad.12.1689267167408; 
 Thu, 13 Jul 2023 09:52:47 -0700 (PDT)
Received: from x-wing.lan ([49.207.50.231]) by smtp.gmail.com with ESMTPSA id
 d3-20020a17090abf8300b002633fa95ac2sm12009150pjs.13.2023.07.13.09.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:52:46 -0700 (PDT)
From: Amit Pundir <amit.pundir@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Subject: [PATCH v5 1/2] dt-bindings: display/msm: mdss-common: add
 memory-region property
Date: Thu, 13 Jul 2023 22:22:37 +0530
Message-Id: <20230713165238.2814849-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Author: Amit Pundir <amit.pundir@linaro.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, dt <devicetree@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add and document the reserved memory region property in the
mdss-common schema.

For now (sdm845-db845c), it points to a framebuffer memory
region reserved by the bootloader for splash screen.

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
v5: Moving the dt-binding to mdss-common schema with
    updated commit message and property description.

v4: Adding this new dt-binding patch, in qcom,sdm845-mdss
    schema, in the v4 of the follow-up patch for
    sdm845-db845c.
    https://lore.kernel.org/lkml/20230712130215.666924-2-amit.pundir@linaro.org/

 .../devicetree/bindings/display/msm/mdss-common.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index ccd7d6417523..84ed2757ded5 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -77,6 +77,12 @@ properties:
     items:
       - description: MDSS_CORE reset
 
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a node describing a reserved framebuffer memory region.
+      For example, the splash memory region set up by the bootloader.
+
 required:
   - reg
   - reg-names
-- 
2.25.1

