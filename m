Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FCD6ADF87
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 14:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0796D10E497;
	Tue,  7 Mar 2023 13:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5A110E495
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 13:01:52 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id m6so16956908lfq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 05:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678194111;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Z5pR4WgQc9HEY23Sq27MPiR8dNOQq4AhkDDUyfnXpBY=;
 b=XYOHftSIp51QGOWt8pZnbNohm/ua6EviqPB6m4t9y82KxkeLLpu6FXhg0BMoMtOfP+
 wGeaRgJX67bGunMG7D8KDOCzu9lc0CH6yS3vnzOK6qZ8cQbG/TZAfOZonn/kaEdQqgK2
 9MKmb68hxXIYNG33hZy4OT/Jc+Y6szJ/YxDNCKxLmV9DmlFuRv2cwhwuQ7oMRfwMhhut
 TD54ZdsdgOfSP7YNk3EI8YDyYNXwYsgcgABSfh2nBjoOgMHw1J7/cVeTufSuW5dAKbP6
 RHb14Cvun18zBgcN8l3bazXC9VPVmQ7qBJhb9M+EeBTiv7CkwjGVWsnkfibZpPzvUukI
 J05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678194111;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z5pR4WgQc9HEY23Sq27MPiR8dNOQq4AhkDDUyfnXpBY=;
 b=TIFWACVR/w/dVioM/pyilqmgF8dhzNEhNB7SNnGqUfG4XnsELkAWiRIiyUjUXs8hna
 K6oMmhf0Vi8/F7mtZho1OTY0A6UdtkkWWvVc8xVhugEWn4cvFX2dkIhhCY0CrsU0rc9h
 f3Bt9lN0Il5m5lqRfybmvPV1qzQFKWShgjFUiEM/BBQEOCDb0N6UhXVo4XbROLTMCNNM
 4XqI5g3ZPi860GsADYgJits2UmmK3I3Jk/MWVZayV3hujleH+RsePdMUrgHPWNVbFJ8C
 hW0ZOIwbUIlvbmd0L6PklACy3y6g3uvjJFCUqcYaiPEk5G+Q1FFnOwIlijsNTGQAlmYl
 wNKw==
X-Gm-Message-State: AO0yUKUIDfB6Shq4MmfM/Pr17G2YYDyNp2qLTRuSdqddoAdmQaejJ8XX
 fNt0v/7VFCyXtinPlBT6VCm7RA==
X-Google-Smtp-Source: AK7set8Tfe55LLhyLRQRBQYWkb+wwuPfq7m3hjK7jkiG2ZCjWLSQParDWJpsDC2F6uq0c6EgnqLAxQ==
X-Received: by 2002:ac2:508b:0:b0:4dc:4afe:1622 with SMTP id
 f11-20020ac2508b000000b004dc4afe1622mr4328016lfm.42.1678194110798; 
 Tue, 07 Mar 2023 05:01:50 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 u2-20020ac248a2000000b004cc5e97d356sm2048265lfg.148.2023.03.07.05.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 05:01:50 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 07 Mar 2023 14:01:44 +0100
Subject: [PATCH v3 06/10] drm/msm/dsi: Switch the QCM2290-specific
 compatible to index autodetection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v3-6-8bd7e1add38a@linaro.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678194100; l=2792;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=tOEY+naDG6ZngTYbV5QlUfaQyGkhOYqaG0FLMZ1065Y=;
 b=7jAUGQvPullBMwXQ4AJI84UFe2g79Mwjf6UICr6eBwcWViJdA3EVgmN0zMVGHhzYo//BQAq/Zfhm
 bJxtNnOhBXFWLwYm0jrEYOJY1Y2yTQz06FI1GGIAhqU27ujHOUd4
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
 Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the logic can handle multiple sets of registers, move
the QCM2290 to the common logic and mark it deprecated. This allows us
to remove a couple of structs, saving some memory.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c     |  4 +++-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 28 ++--------------------------
 2 files changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 31fdee2052be..90d43628b22b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -174,7 +174,9 @@ static int dsi_dev_remove(struct platform_device *pdev)
 
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
-	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = &qcm2290_dsi_cfg_handler },
+
+	/* Deprecated, don't use */
+	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = NULL },
 	{}
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 6d4b2ce4b918..29ccd755cc2e 100644
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
 
@@ -203,25 +204,6 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
 	},
 };
 
-static const char * const dsi_qcm2290_bus_clk_names[] = {
-	"iface", "bus",
-};
-
-static const struct regulator_bulk_data qcm2290_dsi_cfg_regulators[] = {
-	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
-};
-
-static const struct msm_dsi_config qcm2290_dsi_cfg = {
-	.io_offset = DSI_6G_REG_SHIFT,
-	.regulator_data = qcm2290_dsi_cfg_regulators,
-	.num_regulators = ARRAY_SIZE(qcm2290_dsi_cfg_regulators),
-	.bus_clk_names = dsi_qcm2290_bus_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
-	.io_start = {
-		{ 0x5e94000 },
-	},
-};
-
 static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
 	.link_clk_set_rate = dsi_link_clk_set_rate_v2,
 	.link_clk_enable = dsi_link_clk_enable_v2,
@@ -312,9 +294,3 @@ const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
 
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

