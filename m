Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 212B888CDC5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 21:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3277D10F262;
	Tue, 26 Mar 2024 20:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ecJOkXp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02DF10F250
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 20:03:00 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-512ed314881so4427822e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 13:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711483378; x=1712088178; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cZpZgbhnKjDxoRCVD7RJmrRTBtp0NQTmTQyoZiGgGHk=;
 b=ecJOkXp/sr/0/K19UsVIKjG0bKJXR2YuSjR+dWKkJsQTanlYJojPkXkbsSR85E8zqT
 hd7DUGOiENaANzKlB86Q1WJh5xkML44bYug1wvz815dlXVDYLZ/kqYnkWDynHsH5gM9Q
 m4MZPquqlccjCJXDxOC87qtI1GCrb54bQkDjOCQR/7QORBb/nVdLyMDjfHeU8Cq3p27S
 ChcfjxmDRBfoWMnzhc8wAORDfdDdM+AheNzlld0hE6m9p8q+9tLwFvGc0PsIvl9gUBvF
 MoHio/L5u16Pg1aWsMP0F/6CijVoxWu/xKNsvnElZYXSdAsA1U2snN0VcQKqTxzy9Q+j
 WjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711483378; x=1712088178;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cZpZgbhnKjDxoRCVD7RJmrRTBtp0NQTmTQyoZiGgGHk=;
 b=V0mTOxfT5a+bDml+yxdtDSdEQez5N5rncr0J+mnECWYke2u+Q0qlAAUwKsM1622fha
 MELzIG4tkl29VW6p5Cb0QGw2oT/M5p0PUL6vtPMaUzEioGw5X74S7fsobcm4DtsArPZ4
 heo2qdMqeJ97wV2fZdH+d0e/PRE6ll4v4/OSRxWhoqbRkHVx5jM7eCr7Z9BHrtbuh9uC
 fayVO7mg8YTzPE6TfwLumQ3NSXyQcODiVG+4sf8kGrXoTaiqJ2ZCnJ+YDxl5kK3teBbK
 dCL4qPUKma0oFRZHtcaujHfUmJsRP0ZuyToFE5P57Xtb/yodP+yzffxO1HP9SGzCy6O3
 fqzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCuaxZ2XPrUDJaSnxGXK5SS0wF3DGuDJlKhQX+tfT9ItR9UI3CgN/nxp7ZyeWLUbXZqY2g8H/EsOKtZpvv64wRcUXlqmGmj97c2ZJBnEGz
X-Gm-Message-State: AOJu0Yw9H5gHXJzagAXstwdjHpRsaSqH9QClfGpfbE8UOpB47GNE7NNy
 agBkXJxGuvk4X2toqYjg5+0UW0hu/hHg4xOCTwdpVDELRvQlSth6SACyyWe2GKI4GeK1m0yKb2Q
 I
X-Google-Smtp-Source: AGHT+IFJIWkD8qST8EmgHk64osYCFfBh68OndpHc8LY5ea2/W91VBb/AesVupv8gudP1E4KzOQkXcw==
X-Received: by 2002:a05:6512:3257:b0:512:fab6:6df6 with SMTP id
 c23-20020a056512325700b00512fab66df6mr7891279lfr.4.1711483378226; 
 Tue, 26 Mar 2024 13:02:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 a21-20020ac25e75000000b00515a7984acbsm1279408lfr.94.2024.03.26.13.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:02:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 22:02:54 +0200
Subject: [PATCH 1/4] dt-bindings: display/msm: sm8150-mdss: add DP node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-fd-fix-schema-v1-1-4475d6d6d633@linaro.org>
References: <20240326-fd-fix-schema-v1-0-4475d6d6d633@linaro.org>
In-Reply-To: <20240326-fd-fix-schema-v1-0-4475d6d6d633@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Yxw1Nf8Avp2s52yyWZ4p/8fEi0IOMXGLbA98Q78P5v4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmAynwrCrjByBwo8U5zkvbJ0T/jqqx6piO9hn9U
 o0tORI3PweJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgMp8AAKCRCLPIo+Aiko
 1bfWB/sHyAxPiOFUC2TfvTyAq4fQYgso+8/eLvFjpsJMMKWdMT1N69pLWgniPib8sJmTSJBqsRK
 dqL6MjaP4VJ9LpqoH9fKndAe5unn558/SlgRTvo7YR/PlDOmJpdWjUXgW6Mhl86bERffk1ZsH8Q
 idjesQNGi0QUFLRhfNErgXusMU78SbTllJhZjatA3N4Z6nt1wmTHLD3EtTPY6V6Ttg5xJrRNRcL
 0DhyRGIYGwR/U4vtUbAvTDNtvBDC8DUOihz/KX30/ZpV085zzc5F3WPiUp9wcF6yy1ngj+WZJ+o
 D+SQtf/L8BOsLocNRnP9uPOXevB5QcXGmdDj9o1luE46arPE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

As Qualcomm SM8150 got support for the DisplayPort, add displayport@
node as a valid child to the MDSS node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
index c0d6a4fdff97..40b077fb20aa 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
@@ -53,6 +53,16 @@ patternProperties:
       compatible:
         const: qcom,sm8150-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        items:
+          - const: qcom,sm8150-dp
+          - const: qcom,sm8350-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     additionalProperties: true

-- 
2.39.2

