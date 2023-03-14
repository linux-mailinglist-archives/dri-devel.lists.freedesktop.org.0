Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A526B9301
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 13:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A415410E7A9;
	Tue, 14 Mar 2023 12:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C906510E7A1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 12:14:16 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id f18so19753616lfa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 05:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678796056;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FyfU1KJpQXcUs5jhogFBaoFTlgPH63DY/U4xjNHTWjQ=;
 b=pdn4SeDIFby6ImJU/zRU79g8OAJJqEZxUN3MkvHIVGImPYJ9wsKs3u9VMOaAr9qV77
 +3P8JP2YgAUlgtKjCXpDOm6T9MNdJx1YGj8cCwvt0m9asErPxg6UtELTb5vkpj6+qpd7
 OVUxDCKwtJf9MECXA+H1fkwo0y57I4m1/MCqe0kcaubQmmRydS0lkEDHh+YMtoTSq0HZ
 K7RtVe9maQc6YVfZ7MmrryNyQGIzhVO09QtpBq8OZb4HJfi4ZaLdX3E+jgZQnkV/6Q3e
 LMig87LVRaU7LLAPeyNFFPEUJDRKXLv6mPuJjgNb8xyMLYkaLCsb2eb0OH9Yk42X7frJ
 fnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678796056;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FyfU1KJpQXcUs5jhogFBaoFTlgPH63DY/U4xjNHTWjQ=;
 b=7/G/abvwUfKQXTpKmn5UyzJ4IslW7FdjD3rjSddIEIIbdTD3Y+L043Ockh0nbPQ9nj
 fGpwe2yprFr6qdRXysZyiOKeazYJIfHwTNLWViY5F4za16tuAjUgv8+dT7OVZ7NsLimU
 NpwwaN4s9wWXLy7ivc3tUlxecnNs98YyLR765BvG24h5fqymiKiwiiJh3FEvghOq7d83
 TYQfCVVi4FsTHPx7Wn2LvXQzEddIlR3d6pOV76RKTjr6NfQfWQAlapdEPbTGMrdtT/ai
 AXOroP+5pe+NTssvrTexJOfre9Q5VXUS1EEEIt+idvUqY7wfEGEqp0Uk49RkX2WX+Yiv
 sg4A==
X-Gm-Message-State: AO0yUKXlWhV9AjkYUgupn/8Cc335bj2F0x4bbW02KwEeqVWnlzmdDlY8
 xjczdtTQI+lHzmQtsgTpddn31A==
X-Google-Smtp-Source: AK7set97BIKyOmgPMyTYdA0l4yjeWWk+bmz8OCuglWbZShnRbGJgihDqtpNQvu8wI4oPqiBiEfT/zQ==
X-Received: by 2002:a05:6512:11e1:b0:4db:2cdf:4c12 with SMTP id
 p1-20020a05651211e100b004db2cdf4c12mr574193lfs.43.1678796056346; 
 Tue, 14 Mar 2023 05:14:16 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a19ad44000000b004dda87ecae3sm379058lfd.246.2023.03.14.05.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 05:14:15 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 13:13:43 +0100
Subject: [PATCH v4 05/10] drm/msm/dsi: dsi_cfg: Merge SC7180 config into SDM845
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v4-5-54b4898189cb@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678796043; l=2206;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+ePdH/Gl1hrkxIW7hm63Vg7SPtBJUhhLLi5EVaR0ltI=;
 b=6qaalpt6trqBL9lpfNbfElg+UaFZCgOIrVJIg4XC74C8ALx5+2CrAwZmGw17FlnbZ0bAMRADXbBA
 9frNKRM/BXGnZlhK5OrA/+mUVrGsmf8FXYy0AFBZ1RPeaHMrREgz
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

The configs are identical, other than the number of *maximum* DSI
hosts allowed. This isn't an issue, unless somebody deliberately
tries to access the inexistent host by adding a dt node for it.

Remove the SC7180 struct and point the hw revision match to the
SDM845's one. On a note, this could have been done back when
7180 support was introduced.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 039f503233d7..03d98cbcc978 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -169,7 +169,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.bus_clk_names = dsi_v2_4_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
 	.io_start = {
-		{ 0xae94000, 0xae96000 },
+		{ 0xae94000, 0xae96000 }, /* SDM845 / SDM670 / SC7180 */
 	},
 };
 
@@ -188,17 +188,6 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
 	},
 };
 
-static const struct msm_dsi_config sc7180_dsi_cfg = {
-	.io_offset = DSI_6G_REG_SHIFT,
-	.regulator_data = dsi_v2_4_regulators,
-	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
-	.bus_clk_names = dsi_v2_4_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
-	.io_start = {
-		{ 0xae94000 },
-	},
-};
-
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 };
@@ -291,7 +280,7 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
-		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
 		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,

-- 
2.39.2

