Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50A27BEF3B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 01:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FC610E301;
	Mon,  9 Oct 2023 23:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F1B10E2FE;
 Mon,  9 Oct 2023 23:34:07 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-7741c2fae49so334499085a.0; 
 Mon, 09 Oct 2023 16:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696894447; x=1697499247; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2bo5wp4VPacPQ/YFv1ka6i/IWIDKPlu3gu5ElNSMims=;
 b=Zgnuj0654t5e7MKMIZ+KtE34uAHk95+HctVzsjSU46azD8G6lHogQOS3CL6vZUGsny
 g1pNfdIeX3w0PfoUhL4ca3nBRENJUAoGailgyf/F+cvj4Kdg8Kbeya/7fNMbVb3mFybV
 OrWw0wlNmiTb6SFroTKAVQBfyzal4v+5kcpNcX5FkneehCto3FXdglsLbR6oPIBK4sNt
 fwaQ0V2uB2rg0NgBJCFUle8Wmhwy8s9ifvEED+w0rJmYpML45p1sle5OCUax1++IGhYg
 Bxls75NvNUZQgSTfsgRA1sxGq2G6J/WR7zxB5RxI+nxdbkX52M8r3k/VLRVYCDCEEG70
 6CaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696894447; x=1697499247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2bo5wp4VPacPQ/YFv1ka6i/IWIDKPlu3gu5ElNSMims=;
 b=gPv2yIFnf+20ElpVWo8zhARGw2qgI+YkJYFMTPb07Fp7NHdDIKPK/5fGovC7EtFTkH
 UYfyVnVcYidrEd4s7jGzxGwFlSAnfIltjEt5olvuHSS4/3LhnjfBL5Gto9+wz8+a3ZIm
 L09Un/lYFDFak/utMKnj6LX6Xhr34/yJjx24A5HAYyIV5Fa87M/AW+K86lzWwzUD+4fV
 Zzr6uHgRgj3wmcpgoYgHO69wgm+/24f/x+ztV9sMX41wB4F9TJdu2g+Um51lg69UM8xI
 doC1artj1WVzTXrfF5LRLNbic+uZf49czwDLaFZqzDZgzkJptRFHV/VzsWLCBOlt+MXK
 WoUg==
X-Gm-Message-State: AOJu0Yxs7BTeBgz8KMVWLqXuY6E5PGLh5dKzpY9EoEZ2fV3gREjqsM9l
 yh2b79Biy3QQ+CxjNOoN82M=
X-Google-Smtp-Source: AGHT+IG8nbPSkPWBdiU9Re/rG7GGdaGIqwh/sp5gmoPGcCmdyPJxgBNb9RE6oeXEACOhSM/7nJCNrw==
X-Received: by 2002:a05:620a:2118:b0:774:2ab6:9cba with SMTP id
 l24-20020a05620a211800b007742ab69cbamr15869048qkl.78.1696894446897; 
 Mon, 09 Oct 2023 16:34:06 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::1d3d])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a05620a149300b0076eee688a95sm3893908qkj.0.2023.10.09.16.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 16:34:06 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v3 4/6] drm/msm: mdss: add support for SDM670
Date: Mon,  9 Oct 2023 19:33:42 -0400
Message-ID: <20231009233337.485054-12-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009233337.485054-8-mailingradian@gmail.com>
References: <20231009233337.485054-8-mailingradian@gmail.com>
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
Cc: Richard Acayan <mailingradian@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the MDSS block on the SDM670 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2e87dd6cb17b..2afb843271aa 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -551,6 +551,12 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.macrotile_mode = 1,
 };
 
+static const struct msm_mdss_data sdm670_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.highest_bank_bit = 1,
+};
+
 static const struct msm_mdss_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
@@ -609,6 +615,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
+	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
-- 
2.42.0

