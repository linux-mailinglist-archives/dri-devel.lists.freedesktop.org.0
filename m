Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAC15B9C05
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 15:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD74110EB20;
	Thu, 15 Sep 2022 13:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E076610EB1B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 13:37:47 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id c7so10865286ljm.12
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 06:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=QnLPNe+iKM00cshOq1HEgR2lwUHyezV+b5qRTjwgLIw=;
 b=tV6z3grq1vzzmNrhOtUiZd9uwgE0I0J/+LPx/Z46mh1AZc0+yRFiy1ygnMIZIgDSWb
 MGI1/mq77N56Agc5mhTYWGuoGDcRivTEujMPmAHOvh1DjROrIyAAZ4us5ZY3r2TDCzn2
 tIsGG4jm31Js6rpS2CO5h0CwaagM/BUg1ZCKWXG06VnmwSwEfmzGF7MhG02CTS/Ns9bL
 2WyvryUvChMZJ5L9OCQ4L4uMkTs6GxIU1XSOUoPoLD+rVTVq3vC4b6uguJAIWszqbreG
 QHCQ4mQ7uM74Zn8VcEUv/IuZj5fK+l5oj6rMXeSBdwb1QcT7EIttJIfXUeRv0G2NkNrM
 Z2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QnLPNe+iKM00cshOq1HEgR2lwUHyezV+b5qRTjwgLIw=;
 b=vlwiiYZV1hD7Ufja3C42khpaZjz1zGlbFoLIDibYEmEd6T6xuRAJy9ImwfihzrIVi9
 IpoYkKcq/dWoU86psR2cZgSFvMlEUK7UxnJjpazOFzBxwr0Et/32iZOWqHijRKwEV12X
 Pk4tWMRg1o9s2FPXRCU4GfYASUp2Nf7d/Fmupjw6B4yr9UlAHS+VhBCOmfZXWE4nbUBe
 W9KYoYn5sAJLUsEgyZJ3+fbtouiTokeP5Dyr7e7iEqk4jw8B40VkJFVJaSXm9SG7Wf8r
 WQgPEa0d+bXpFGwQbCC8hWKskd5ZRAe3GgOoRMVw471Iq0LXFEALl2LvyZVU74AtBDp6
 OxhQ==
X-Gm-Message-State: ACrzQf1d1qS9tdgQXDdGswjoM4FCSbx/dI/eoDL8fMV1ooMKCm9/Bp1B
 u2RkkbFI9tW3unOM7m57UZdSUQ==
X-Google-Smtp-Source: AMsMyM4UD05VNVSpuNUyec7dDFdrKjwlOjPBwXubUGJVv/SN05yO8Ib1mfwD0wEoOmZeTs5yvTV8LQ==
X-Received: by 2002:a2e:a589:0:b0:26c:2a8a:4179 with SMTP id
 m9-20020a2ea589000000b0026c2a8a4179mr2013169ljp.288.1663249065931; 
 Thu, 15 Sep 2022 06:37:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 2-20020a2e0902000000b0026ad753448fsm3142634ljj.85.2022.09.15.06.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 06:37:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 03/12] dt-bindings: display/msm: add interconnects property
 to qcom, mdss-smd845
Date: Thu, 15 Sep 2022 16:37:33 +0300
Message-Id: <20220915133742.115218-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
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

Add interconnects required for the SDM845 MDSS device tree node. This
change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
Add interconnects property for display"), but was not reflected in the
schema.

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

