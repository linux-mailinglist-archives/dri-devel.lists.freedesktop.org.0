Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483446BC9E6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 09:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE1910EC60;
	Thu, 16 Mar 2023 08:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBB910EA68
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 08:51:20 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id t14so849111ljd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 01:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678956680;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4ybpWSBp4lClKqhK/g5tZCNekBaDds3KID0LOYjNmjg=;
 b=zouSvFH1v/9SmuQivtr2cUC78XlCmCieUzZwqnfbhZ3jftbLu0iT90FS6zllJ8VdSC
 27HwGoOYGSWhRVAz1ZAzhRp9Bxb6WCJX0jWWn4Co8ChAO9EVgfYwQ3eCpYyScpTNzB/p
 xgKIjAhhZmTy5MVczMdsBx9MhfksaqAPaYk3iDuTBjhyL8mppXKr8GOqgOR1G6SIvjHr
 rzg1ViFPC6edhwxhDuWlAdR1kvJv/Gueqc6LidyEmStzGEUpMc/9bj8j57ZZJI9TBzzE
 ULYxsIB0okR1hTQNUAsAN++HTZmf/eQQDQNk+OURE2HYgEHeMmvisFhWR6kaIOca3/yw
 ORBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678956680;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ybpWSBp4lClKqhK/g5tZCNekBaDds3KID0LOYjNmjg=;
 b=UoKMXRuSuP3Rv9ZdF3BGVKWUlvrMs9IMAI2pWE+F5BicQIrtDI1Kj0g7muR5mlsIia
 rWMnHDAR4DpHOco1CD8MuA7sQIp/cBAyJu2EUJmho15em6wvE4O12/4c3NTCrRWwtzqQ
 Vae+Su/DeAkI8/kHKIGltQbgBkYY94OCCLUaaeJELWo5QpdW9X3ggsVpuVMdoajyf0MD
 B59J9ms8cBxyjr+1KHnz9NXKu9FG2DYU4pyRX/gNd2+q7bkdYLWcE9Vk1K69d8mSh6JX
 3utSjfaY73eWbiYUQONGJC667ZKH7wahW+AFOMR4nqpXgURUOMGS8T6+32In9gfkLV3L
 P/Yw==
X-Gm-Message-State: AO0yUKWSwcIdbW8twCeD5hKvMBRIxY2DKCaXDJ0ioRueMICO0KC/YJUI
 3BUq9t/Emdsrm70wkQpLXPqRnQ==
X-Google-Smtp-Source: AK7set92YKItNUiB2mDFP0GuhQVCTqEiACYYmeQWLkBO9sO5XU+ACgEmmSx1OSxwER09dcaT9BaGFA==
X-Received: by 2002:a2e:97da:0:b0:298:7018:e2e7 with SMTP id
 m26-20020a2e97da000000b002987018e2e7mr1791452ljj.22.1678956680108; 
 Thu, 16 Mar 2023 01:51:20 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a2e730b000000b002991baef49bsm251566ljc.12.2023.03.16.01.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:51:19 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 16 Mar 2023 09:51:12 +0100
Subject: [PATCH v5 06/10] drm/msm/dsi: Switch the QCM2290-specific
 compatible to index autodetection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v5-6-9d4235b77f4f@linaro.org>
References: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678956668; l=3233;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=e/ZDvN1pmXEVddNSmMJ2iSlA9sSO8FBakW2FjAcs2pg=;
 b=8OFXVaPb/ToMkkmzsNU09aSl0aeWkDVN7OG+mFMgcET+hNQVHVpGr8xWjapYvsUapZkbZfXQuztK
 PtFBo8ZlBBPuRZWr6Si4F9qWzgVMCkfdWW7i2Y82KiQK58tJvAA8
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
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c     |  5 +++--
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 20 ++------------------
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  3 ---
 3 files changed, 5 insertions(+), 23 deletions(-)

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
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 8772a3631ac1..91bdaf50bb1a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -65,8 +65,5 @@ struct msm_dsi_cfg_handler {
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor);
 
-/* Non autodetect configs */
-extern const struct msm_dsi_cfg_handler qcm2290_dsi_cfg_handler;
-
 #endif /* __MSM_DSI_CFG_H__ */
 

-- 
2.39.2

