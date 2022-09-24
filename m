Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6948F5E8C85
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 14:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EE010EC04;
	Sat, 24 Sep 2022 12:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8470810E610
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 12:36:17 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id q17so2737896lji.11
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 05:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+VYxtSYA5OyiLl7gExkakIULMtqhutc086nOHC83lPk=;
 b=Pk42gobi31Pm88gcWY0dliXVdoXZB1oWlCvEO8Nz4ebyNe4xlnzz4xgJ+0I/DrrVZK
 4P5L+rY4aP24dF7TFUvHDbH/cNECmIkbpy5vPFLttoTVEEOwvAo6eLvM/s1HTa/Fl96S
 2A7Bx0K5/XWZr19eYlE9tM0NjLcvBKdUz1rur+l3EpccsCsHjvEYG0ZYflsul1sk20iA
 S5hNnxBIXJsfZNFPmKlwxrdGCo92MBP5VOwdX7p/95L9WIsRPj5nD56BX5BGUeijlEDn
 ZyzXOutODty+Y2E2zTPEfRZHy080nsIVrXa6L57aXmtw4cg2dd8Pd4EFbaiqim13T+ds
 5hLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+VYxtSYA5OyiLl7gExkakIULMtqhutc086nOHC83lPk=;
 b=mqbQ82d1P/uWw7P0mgXg7vmgAw5a5pM8Qz4N4bZB18F7ZOJMJLTdfx3MDVrXsXY52B
 kk/5tjHxSkaGnm7rWhgZEeXY6JJTVD4QUeA08JtqFc6WnuYUWLLO5IqCHW8MzTcw3KJA
 h/ChYgOk0VoDhSuRc96dxPtOK0ftYQR3Fj7FJfJfldGvkvtYFTyIhymtBa1ypabeQtqo
 dNSMxYAUFkZSGIH6QtfT/nYyi/WboTV676M451gG+gR33HQPys+ZfQngwWNV+TKlJQJ+
 9DLeP0+REvxcQ2Ql6GISzTrM1LxVT71hwc7uMx4cBAOutqeW6720beExbzbnnhn/tCdx
 WWoQ==
X-Gm-Message-State: ACrzQf3Bp/drZTSLJwcaw+f1vTyNdzGKGZGvwE5sVuh2MtRBLWsSXW8V
 6gMGj6bfZhLHyvRc7mpdL2QgzA==
X-Google-Smtp-Source: AMsMyM51NES3RCACwNbkEyT0lYAlozhLRWFpnLns2BDFA5C0F1f9eA/hhnH/8ncrW25blwnsjWzGMA==
X-Received: by 2002:a2e:bc28:0:b0:26b:d979:fc72 with SMTP id
 b40-20020a2ebc28000000b0026bd979fc72mr4757161ljf.292.1664022975566; 
 Sat, 24 Sep 2022 05:36:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u18-20020a2eb812000000b0026c4113c160sm1707269ljo.109.2022.09.24.05.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 05:36:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v8 03/12] dt-bindings: display/msm: add interconnects property
 to qcom, mdss-smd845
Date: Sat, 24 Sep 2022 15:36:02 +0300
Message-Id: <20220924123611.225520-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add interconnects required for the SDM845 MDSS device tree node. This
change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
Add interconnects property for display"), but was not reflected in the
schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-sdm845.yaml    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 3cb2ae336996..a87deea8e9bc 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -57,6 +57,16 @@ properties:
 
   ranges: true
 
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from mdp1 port to the data bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: mdp1-mem
+
   resets:
     items:
       - description: MDSS_CORE reset
-- 
2.35.1

