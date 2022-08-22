Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9CA59C9DD
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 22:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE18A1A67;
	Mon, 22 Aug 2022 20:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB67A1A2A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 20:18:11 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id s6so5597201lfo.11
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=NR5Sms6sG1p7x6GaSvxGcxAu0Rk0o2U7p29fsROBKKA=;
 b=Fc9nfBUmcMjZ7iEPxRfiRu6t8YWkighq+81zv4mg1fv0A+6Ey3gzEMldpdqVWG9leg
 xA5Ya8t+FYOc9Xn7eoEKuUuGgBELECBuAC18oUoRwkE+GdJWG7Yin6NGslUxnHlSwQak
 s1JuQqvMwMWSTdtynbv8K5aUmbhYHNPytVqbqzt543ZerhX6IXWn9VoMoOVbky9zvZAq
 Zh7hZivxHpUNI9Qbk0uBfvVAnwtUDw68y8fRjviXqEMxFd9W4aLXul1bz4jxyOuLUgyu
 qMk33ORWCt8ilaKhe40uOeevK44NYUrAe/p2aJjbEkXrSxgvUAyorETHsOqjBvCVMUUf
 z1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=NR5Sms6sG1p7x6GaSvxGcxAu0Rk0o2U7p29fsROBKKA=;
 b=QvKoyONloX2dDbSnNrqhjK5nEr1Iag9BDnJk9hMxS9Uk9S16PsU24udt6DgxJtSH6f
 greQ05KgYej9wejbksBz6YHHso0gW2zsdkXrfDUGhU4M4lZ2ih2tBP4lFhihslIKssnm
 PR9tWrxRQIyAACsap57yVCVGLY0Dd/5hqnlVqBc1IvhJKQ8y+pB9M2l8UwlfN5OASZLt
 g4E+uxC2LDy6aqEzOVZnsf8RYzuNPFioGb9kBLMYrJ1um27BlsppMk3VqFeI1lSUHPOD
 uoVCUouFPC0mGTEln5LdD9s/IKg+8GdsJv3Nub3BSZ/fdgjQiEZlW9s3pz42o3y6Kk3Z
 8wxQ==
X-Gm-Message-State: ACgBeo213YQkJYYfUcXZai6ruhJRRiAGe2shKCjZhUIJ0Nh7hbhJsxGx
 LuIDpopCK/fdF+/xQ8DVrCa9zQ==
X-Google-Smtp-Source: AA6agR7CTo6COBZ12nIbdfek3TUn8EoHkUm6N7gK7wR1HgHYnm/AMO3ng/rF7MY206MmvGdzbpNclg==
X-Received: by 2002:a05:6512:3b91:b0:492:e174:60d0 with SMTP id
 g17-20020a0565123b9100b00492e17460d0mr2859322lfv.576.1661199489727; 
 Mon, 22 Aug 2022 13:18:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h16-20020a2e5310000000b0025e5cd1620fsm2000429ljb.57.2022.08.22.13.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 13:18:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 0/9] dt-bindings: display/msm: rework MDSS and DPU bindings
Date: Mon, 22 Aug 2022 23:17:59 +0300
Message-Id: <20220822201808.347783-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Create separate YAML schema for MDSS devicesd$ (both for MDP5 and DPU
devices). Cleanup DPU schema files, so that they do not contain schema
for both MDSS and DPU nodes. Apply misc small fixes to the DPU schema
afterwards.

Changes since v2:
 - Added a patch to allow opp-table under the dpu* nodes.
 - Removed the c&p issue which allowed the @0 nodes under the MDSS
   device node.

Changes since v1:
 - Renamed DPU device nodes from mdp@ to display-controller@
 - Described removal of mistakenly mentioned "lut" clock
 - Switched mdss.yaml to use $ref instead of fixing compatible strings
 - Dropped mdp-opp-table description (renamed by Krzysztof in his
   patchset)
 - Reworked DPU's ports definitions. Dropped description of individual
   ports, left only /ports $ref and description in dpu-common.yaml.

Dmitry Baryshkov (9):
  dt-bindings: display/msm: split qcom,mdss bindings
  dt-bindings: display/msm: move qcom,sdm845-mdss schema to mdss.yaml
  dt-bindings: display/msm: move qcom,sc7180-mdss schema to mdss.yaml
  dt-bindings: display/msm: move qcom,sc7280-mdss schema to mdss.yaml
  dt-bindings: display/msm: move qcom,qcm2290-mdss schema to mdss.yaml
  dt-bindings: display/msm: move qcom,msm8998-mdss schema to mdss.yaml
  dt-bindings: display/mdm: add gcc-bus clock to dpu-smd845
  dt-bindings: display/msm: move common DPU properties to
    dpu-common.yaml
  dt-bindings: display/msm/dpu-common: add opp-table property

 .../bindings/display/msm/dpu-common.yaml      |  45 +++
 .../bindings/display/msm/dpu-msm8998.yaml     | 139 +------
 .../bindings/display/msm/dpu-qcm2290.yaml     | 143 +------
 .../bindings/display/msm/dpu-sc7180.yaml      | 148 +------
 .../bindings/display/msm/dpu-sc7280.yaml      | 147 +------
 .../bindings/display/msm/dpu-sdm845.yaml      | 139 +------
 .../devicetree/bindings/display/msm/mdp5.txt  |  30 +-
 .../devicetree/bindings/display/msm/mdss.yaml | 361 ++++++++++++++++++
 8 files changed, 508 insertions(+), 644 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml

-- 
2.35.1

