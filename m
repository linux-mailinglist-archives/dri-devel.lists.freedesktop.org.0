Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E920581B381
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 11:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B05410E698;
	Thu, 21 Dec 2023 10:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C747010E68C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 10:25:10 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50e270639d9so796348e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 02:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703154309; x=1703759109; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7t0InnVEdoaDLd0slt0Nn4Ib7Hih+u/LAlcmfNafhqE=;
 b=gnmFJ/C3PTvuJVmoet2ueI8AJSkNwTEW+ICNDcT0/7M3reWDkxDxMhmDTTX4+AtQmF
 ebQyL7rfxM6AIN6gSGelAjEGLEKQVtlpxHa2euUyGj8ko6/Y8S/OhIraFUhCV9RnHAcu
 ApVWPNAUQPv78G9dvdcmgipw12h1xMbf40ounr5sBQ23oAEuJD/qvkWQCGCIjiJFj9kQ
 /1FQGWKTuC5u0w73BSb2o1W+aNuC4ZaEKjL9qK9nXYu1xIq8Sn+Xs1j6php2nWZ7TZfo
 asQfckIK9uSX+cXu+psKbyRJFFkxmHvFe8gVNiQslCAhkvq4DZM5htlhOegrPATv2OU8
 ZnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703154309; x=1703759109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7t0InnVEdoaDLd0slt0Nn4Ib7Hih+u/LAlcmfNafhqE=;
 b=L40rwDysPaTJ9CDYYPX0HJa6PUvy/LZGTwLFGNQV6BnyaCoZJtlixY/sTjuBEexhZ6
 iYDaOeX212iuROkUYunjkQNkQM6WD0MHEH1YFoljJ6EC9FjKhuOsFenEgA05YgmWXsYp
 V/oyhCMqK8+7qYRVf3qxle7qqPfBlix3MY2W2UPbaHDigacGXRbR6l0K8TI22xuZA0lS
 PV86Aqi8gZz1jRVL22tRcRH9PNMhrfYQdzwpM0eyosuwkWHbM3hfWrA/DC6oKzrK2Lr3
 VvLLJ8Cbsy+xouLqMZPCWvRrv3bjwlNAZ6EeGCZVJDygnx12Fw+G3NfUd2j5qE7XuGI5
 RkRw==
X-Gm-Message-State: AOJu0Yx3BXKHKe5h8OD0fByqwqhitALYCXENZ9fA3aKOGswBPeT0GBI7
 PwB1vR4LsHupDzRVKOysmhyyyg==
X-Google-Smtp-Source: AGHT+IHsypJK5zmnFF8uxikLuOs/DapVoexa1CtYrg0iXQF5DIPiyEwsd93WTa+aqhMeVusC0+eOQA==
X-Received: by 2002:a05:6512:285:b0:50e:60eb:255e with SMTP id
 j5-20020a056512028500b0050e60eb255emr275172lfp.23.1703154309104; 
 Thu, 21 Dec 2023 02:25:09 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a056512359a00b0050aaae62dbdsm231671lfr.62.2023.12.21.02.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:25:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [RFC PATCH 2/2] dt-bindings: display: msm: mass-rename files
Date: Thu, 21 Dec 2023 12:25:06 +0200
Message-Id: <20231221102506.18320-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221102506.18320-1-dmitry.baryshkov@linaro.org>
References: <20231221102506.18320-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm@vger.kernel.org, Aiqun Yu <quic_aiquny@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-phy@lists.infradead.org,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename the Qualcomm MSM Display schemas to follow the main compatible
string instead of just using the block type. This follows the
established practice for YAML file names.

Cc: Aiqun Yu (Maria) <quic_aiquny@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/{gmu.yaml => qcom,adreno-gmu.yaml}     | 2 +-
 .../bindings/display/msm/{gpu.yaml => qcom,adreno.yaml}         | 2 +-
 .../bindings/display/msm/{hdmi.yaml => qcom,hdmi-tx.yaml}       | 2 +-
 .../bindings/display/msm/{mdp4.yaml => qcom,mdp4.yaml}          | 2 +-
 .../msm/{dsi-controller-main.yaml => qcom,mdss-dsi-ctrl.yaml}   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename Documentation/devicetree/bindings/display/msm/{gmu.yaml => qcom,adreno-gmu.yaml} (99%)
 rename Documentation/devicetree/bindings/display/msm/{gpu.yaml => qcom,adreno.yaml} (99%)
 rename Documentation/devicetree/bindings/display/msm/{hdmi.yaml => qcom,hdmi-tx.yaml} (98%)
 rename Documentation/devicetree/bindings/display/msm/{mdp4.yaml => qcom,mdp4.yaml} (97%)
 rename Documentation/devicetree/bindings/display/msm/{dsi-controller-main.yaml => qcom,mdss-dsi-ctrl.yaml} (99%)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,adreno-gmu.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/display/msm/gmu.yaml
rename to Documentation/devicetree/bindings/display/msm/qcom,adreno-gmu.yaml
index 4e1c25b42908..0678cead56bf 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,adreno-gmu.yaml
@@ -3,7 +3,7 @@
 %YAML 1.2
 ---
 
-$id: http://devicetree.org/schemas/display/msm/gmu.yaml#
+$id: http://devicetree.org/schemas/display/msm/qcom,adreno-gmu.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: GMU attached to certain Adreno GPUs
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,adreno.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/display/msm/gpu.yaml
rename to Documentation/devicetree/bindings/display/msm/qcom,adreno.yaml
index b019db954793..ad15f0a6ead7 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,adreno.yaml
@@ -2,7 +2,7 @@
 %YAML 1.2
 ---
 
-$id: http://devicetree.org/schemas/display/msm/gpu.yaml#
+$id: http://devicetree.org/schemas/display/msm/qcom,adreno.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Adreno or Snapdragon GPUs
diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,hdmi-tx.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/display/msm/hdmi.yaml
rename to Documentation/devicetree/bindings/display/msm/qcom,hdmi-tx.yaml
index 47e97669821c..a137ca0b734c 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,hdmi-tx.yaml
@@ -2,7 +2,7 @@
 %YAML 1.2
 ---
 
-$id: http://devicetree.org/schemas/display/msm/hdmi.yaml#
+$id: http://devicetree.org/schemas/display/msm/qcom,hdmi-tx.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Adreno/Snapdragon HDMI output
diff --git a/Documentation/devicetree/bindings/display/msm/mdp4.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp4.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/display/msm/mdp4.yaml
rename to Documentation/devicetree/bindings/display/msm/qcom,mdp4.yaml
index 35204a287579..40c31602affd 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp4.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp4.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/mdp4.yaml#
+$id: http://devicetree.org/schemas/display/msm/qcom,mdp4.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Adreno/Snapdragon MDP4 display controller
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss-dsi-ctrl.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
rename to Documentation/devicetree/bindings/display/msm/qcom,mdss-dsi-ctrl.yaml
index 4219936eda5a..35f4facc2fdd 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss-dsi-ctrl.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
+$id: http://devicetree.org/schemas/display/msm/qcom,mdss-dsi-ctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI controller
-- 
2.39.2

