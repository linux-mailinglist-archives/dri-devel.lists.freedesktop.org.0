Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9987AE273
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 01:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE4C10E341;
	Mon, 25 Sep 2023 23:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D6E10E33C;
 Mon, 25 Sep 2023 23:37:15 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-59f82ad1e09so31826427b3.0; 
 Mon, 25 Sep 2023 16:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695685034; x=1696289834; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vr0k7lEx47CbWkSjN9jo/N618Kr1MJPmmWsGVOz1DDs=;
 b=GEKrmZAvsEcoPzopDVib6tXBkLRnLR0h8Z+PDzQIfOUoVvc2QOeADuxMQl9hXjVHsw
 vlL5gnxLwMn3oUroTsYjgZjdXN6q6G0gB+QwAClOdrle5mFlH/L6L12W6wVorR4lWMGJ
 OQbko4qK+8RXZPDawBocfnZy+oKr+yNS6yFOEjJgR6JzdoEyZhygw3bWpyjL0cf+OCHA
 SjOmmj5932iIFM1vmgfDIXjZ58eHvur09uwh4WtYbvQDiO11YTlPLgRbHtF9yxDPpgLx
 mirx06HHvO0gxXqUDuB23pjqoj8H5uv5U81c1rnbgsslSrhqmUuPjC3blDmm82TIL9tu
 hmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695685034; x=1696289834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vr0k7lEx47CbWkSjN9jo/N618Kr1MJPmmWsGVOz1DDs=;
 b=hZv2tzR2kQ9cWB0ia2UqzOBzdpLCh8474vZCxQIlkU/TNdPgvo+pA2OQsdTvdBhSmA
 c6nFnd5AKZD4QDya2M/WgLyPcNZSzgvDi7XOPs6yFr5eIsfNAI0uv4NNlbYfE3Rsl8a+
 9rzkDeacYaQcvu44xPFJTOPCQgSM3MtZLNwPPyE66Yj2K0tVBBl47XV3egFLpBO/LED+
 j5JGxJh8I66N6L+HIlXx3vEVIFV84I1CVKmFSQlU8ZXUXLpXPFySTQ+2mCqxql8pjUKm
 g/8kpWAgQAa6dAa+HDwLysOczUlir+2pFcRR2vJgMSg1OuPZn/A3FO2Mc1N5LWb3/vkp
 VrtQ==
X-Gm-Message-State: AOJu0Yz6Cr+RbSZpikJbh6DaMFLI692rcdYqWSdm3X62xZG8unK08cU4
 9jSUHEFLsgArdZ3yStUxdg4=
X-Google-Smtp-Source: AGHT+IHRio6ekS8UQ4S4yKF/DX3yMmncgTHTK+rPvw8sao5gRtWxRA1N6cAht/s2dc5KXEunvj87/A==
X-Received: by 2002:a0d:d993:0:b0:573:30c8:6e1d with SMTP id
 b141-20020a0dd993000000b0057330c86e1dmr8468607ywe.44.1695685034522; 
 Mon, 25 Sep 2023 16:37:14 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
 by smtp.gmail.com with ESMTPSA id
 c64-20020a0dc143000000b0059a34cfa2a5sm2638864ywd.67.2023.09.25.16.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 16:37:14 -0700 (PDT)
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
Subject: [PATCH 4/6] drm/msm: mdss: add support for SDM670
Date: Mon, 25 Sep 2023 19:26:31 -0400
Message-ID: <20230925232625.846666-13-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925232625.846666-9-mailingradian@gmail.com>
References: <20230925232625.846666-9-mailingradian@gmail.com>
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

