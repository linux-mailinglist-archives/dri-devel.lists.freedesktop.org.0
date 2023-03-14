Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F1C6B9308
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 13:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B681C10E7B0;
	Tue, 14 Mar 2023 12:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C488810E7A4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 12:14:18 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id j11so19695413lfg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 05:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678796058;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gUbEpe2io7l6AXuODwhJVPxizEFzWfqe6F+dWQoo9fY=;
 b=JIbj3RheMwYk8qThubwperBe1IZ9o88lpjIQ49SE+Qu8HAXj9u+/2dBCnLavnnsWXy
 o3WhoGWax9bQbKltYQ+ZpIs/MjPUdpOrHv7c9uRzEf2ADJh/stNcUQbzDXRsEMoj52Vx
 DsiUxcgFiGWxY312W9+GIsOu2sBKU+EYprb8mAzUAdp7TRShyxrmlkbNeIgi9AxnWu43
 jbZgpd0hEwQ8uSguvcER3DANTr4c9F0lCF4KOLZMcf8C/AhVUhU6GT6GBwn2TwmPMQqm
 4Z3SolMaynxDCuvxKvLXM7EDLzBRH2U+tVU3aEYreFi8MsZR+RKG6fThBMjZXxb8W/mO
 v3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678796058;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gUbEpe2io7l6AXuODwhJVPxizEFzWfqe6F+dWQoo9fY=;
 b=03xguCEk9aTkiEWZuvQ+ySncw0hHy1FTrj4fTXsz+DgB8p11/1WPfejTJSzqRTzrdA
 xNaR1xrJYFr9wao7hGsAYKgL4azW/RnZnnEwaVqSlzASDUA5vdhjwVIVNrg2PvJRX41f
 tddvVPJe8LHSjGqe0KuN+kztuK8zIwpfshgbqNfJiFJf/A+ynWyIi9QXd4KeewemBUKj
 JK0ND9NlDYh75Evd7wPwgh01FRXtAOBc2niNNqrmcq/A1FmO9lEgcfsfvfhq277G/gDI
 EYTdWE0hWOP+L7evSNa2Dh8+eejg40KtoKSIdNGXmIZib/bGY8YzNn2zspc9GTm08DpZ
 azuw==
X-Gm-Message-State: AO0yUKW+W641DugmO8wHvH82AEaXGm9YBua7BfsAzIQM6DZslEbobKJt
 uCnYhL6V6wC5e1QjCC91fVnevA==
X-Google-Smtp-Source: AK7set+5P6vjq1SBHqBansG06J22IDugsin6QQRWTffVFfaMyWlTvRi4VZYLpjpbWkvJvUePc09LSg==
X-Received: by 2002:a05:6512:4cc:b0:4a4:68b8:c2e4 with SMTP id
 w12-20020a05651204cc00b004a468b8c2e4mr634836lfq.59.1678796058338; 
 Tue, 14 Mar 2023 05:14:18 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a19ad44000000b004dda87ecae3sm379058lfd.246.2023.03.14.05.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 05:14:18 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 13:13:44 +0100
Subject: [PATCH v4 06/10] drm/msm/dsi: Switch the QCM2290-specific
 compatible to index autodetection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v4-6-54b4898189cb@linaro.org>
References: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678796043; l=2654;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=XlklCU0Bm1/3LNZplT2epg3iipbpHP7NoPAo99TDW0s=;
 b=PlK3eC/4gdexHFVgKpaJ2/qDm8skkomACDMObeK8OIEVlLOKWUPraJQqVcIoVVAtUCZu8HjYErLv
 gazZMQTDDr46kBH/S9oniqWqeJhpuhHOOnkMiRw6jMo6dhIwsMrR
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the logic can handle multiple sets of registers, move
the QCM2290 to the common logic and mark it deprecated. This allows us
to remove a couple of structs, saving some memory.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c     |  5 +++--
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 20 ++------------------
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 31fdee2052be..f761973e4cba 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -4,7 +4,6 @@
  */
 
 #include "dsi.h"
-#include "dsi_cfg.h"
 
 bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
 {
@@ -174,7 +173,9 @@ static int dsi_dev_remove(struct platform_device *pdev)
 
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
-	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = &qcm2290_dsi_cfg_handler },
+
+	/* Deprecated, don't use */
+	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = NULL },
 	{}
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 03d98cbcc978..29ccd755cc2e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -169,7 +169,8 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.bus_clk_names = dsi_v2_4_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
 	.io_start = {
-		{ 0xae94000, 0xae96000 }, /* SDM845 / SDM670 / SC7180 */
+		{ 0xae94000, 0xae96000 }, /* SDM845 / SDM670 */
+		{ 0x5e94000 }, /* QCM2290 / SM6115 / SM6125 / SM6375 */
 	},
 };
 
@@ -203,17 +204,6 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
 	},
 };
 
-static const struct msm_dsi_config qcm2290_dsi_cfg = {
-	.io_offset = DSI_6G_REG_SHIFT,
-	.regulator_data = dsi_v2_4_regulators,
-	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
-	.bus_clk_names = dsi_v2_4_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
-	.io_start = {
-		{ 0x5e94000 },
-	},
-};
-
 static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
 	.link_clk_set_rate = dsi_link_clk_set_rate_v2,
 	.link_clk_enable = dsi_link_clk_enable_v2,
@@ -304,9 +294,3 @@ const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
 
 	return cfg_hnd;
 }
-
-/*  Non autodetect configs */
-const struct msm_dsi_cfg_handler qcm2290_dsi_cfg_handler = {
-	.cfg = &qcm2290_dsi_cfg,
-	.ops = &msm_dsi_6g_v2_host_ops,
-};

-- 
2.39.2

