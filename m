Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C98F45A9461
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D6D10E6A1;
	Thu,  1 Sep 2022 10:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C37110E69E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 10:23:18 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id w19so14413052ljj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 03:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=gHw35hCInqQhuDYl7ZZa1qf6fa7wiZH9XT+GfWRFFMc=;
 b=rFB9/u4T8YvCl32MoibWldYrtApWUE2Mwc3abtCfGjSKZe5TERbmeA/TeP7TaH/Xk6
 3lbvJPDfMz58BulZbM9mBiLT7dcmeUgJgR7+o0H0M+VrXUz0C8zfDdT5k6OYmEuZ6FjI
 F3O1YR+WwHVhUWhIwGalHCOnDCHlEgbEfCTZXO09NYSAGx0ztqcxNBKUmruHaQG7svBf
 PkJ7PxWpP8cSY/Zxf0bNLjuFxfsTj7xyFNdkPtAoY+idBHwYKRxmKQlHN56W3GldOHYs
 ztdCSt5hp6Mc4aVZit0CzYcNVd7PkPf//hb/VfYhRA4ycBSKUmJ9jth57xHFTxKubZdi
 HPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gHw35hCInqQhuDYl7ZZa1qf6fa7wiZH9XT+GfWRFFMc=;
 b=oqr3Dibb8XkeAbYUeqDekN5v4ADaSBRstbz5umploXF+CxgyNcE+D9itP7bTo/efqD
 YzeZ3gIkH231IddKsIBErRoD2Xj66YEejG9J6RILElbCs7KhV6EStgj5Fa3RRkDH0m79
 57kMDrjRIP2Rx19iIisQgsnQieu7u5OaXhsZq0IRbKeObIqAKqS/MrMRuyVnf35WU8fF
 eb4GDSaJCL9Euq8GqyHyhiN5Oa1NEgbCCXtPEpw+s6Ffr0EWmAw9PjtE/S4kTvF7/U79
 DVYsWj14gPuYgy6765KC4frY0wLd5DnmHT+u4PWsvdwEWEnjILepKRWFfBtdVhCqDzpJ
 wyVw==
X-Gm-Message-State: ACgBeo1PaQ7YtQAT6+YcuHUwX85I4Kb7OsQHFgRZgPySzHovQnZcFYSa
 WlLqWkxjA3tE1W48kNN+q9OLlQ==
X-Google-Smtp-Source: AA6agR4gytM8sG5Cdwi+tanY8MLQ8kDkTvqfVr/BW4fEhYGQZ6oOgajiBYV3dnWiX+CAm8JI4s5DKw==
X-Received: by 2002:a2e:92ce:0:b0:261:e39e:2c1d with SMTP id
 k14-20020a2e92ce000000b00261e39e2c1dmr9275777ljh.273.1662027796776; 
 Thu, 01 Sep 2022 03:23:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a056512371300b004949ea5480fsm123453lfr.97.2022.09.01.03.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 03:23:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 03/12] dt-bindings: display/msm: add interconnects property
 to qcom, mdss-smd845
Date: Thu,  1 Sep 2022 13:23:03 +0300
Message-Id: <20220901102312.2005553-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
index 3cb2ae336996..ff19555d04e2 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -57,6 +57,16 @@ properties:
 
   ranges: true
 
+  interconnects:
+    items:
+      - description: Interconnect path specifying the port ids for data bus
+      - description: Interconnect path specifying the port ids for data bus
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

