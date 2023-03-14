Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF056B92FC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 13:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC4E10E79D;
	Tue, 14 Mar 2023 12:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C32E10E799
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 12:14:12 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id d36so19718767lfv.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 05:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678796050;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ja37xKiglxJ/lPrUpuyUvSbThkrJV11m94PBRXq1WhI=;
 b=tAFGIb2nZ9WwZKAl0rcXm3E/b5KCbUoojtV+PDmfJxX7PyRePs/gdTA3JR6DqI43Jk
 AYejSzPLenTcpxdICHIx7kpGeYdHRGPkPgilCCpAIYCbyy+A8YpaDgH/fqnh0BpydopI
 flasDj8X2xIaP80r+z4rwLAUd+B4HOJp7sGGklJZd9d62fauVUhtiA8GQ/iqYHRiQI3+
 Qf2e2phrbqq9sHrM/hTijY934fBnjehER7VfTutJKCNZuO7Fq+d/2obUGxilU5P5tyeM
 ygbHqKeZPE0rV25AaVzPpykFUiZ3D32WjPW9V8a5/YMjuTfXJ+q2s9ArJlM62woV9uS8
 dA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678796050;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ja37xKiglxJ/lPrUpuyUvSbThkrJV11m94PBRXq1WhI=;
 b=sE55toFBelyqfmOKxTW00k+qf2wfd8qJqcyMTiAuoh6hjeyHLBdw9anUHN4SFW4W95
 7OEFrUo6vdYoEqN2JAssqll9bcPFQLFzt+wzi8F2tBLaWRz5yVqwt29swF/Gpq4GZZEs
 wXvjZBqkkBaoc2AhgKwyFOB6zTbJp32DA0mSuOxSnVlPxuRuBdlmpuiu60K4QG+6yXLt
 +8VtA3L1Cgndm+UYkfmXb8PE7gWfxN9cdP3HI0ovGPeya+ktRpa12tohI+YjxBc2G0EH
 G8qUXbHQ4Wi8g+BVmT7SVus4fxI5ul2YzzWG2Fa3StMP497HKtozB8p3lDLZkq5gHWGS
 tyug==
X-Gm-Message-State: AO0yUKXiRpXNxpbHI65gY7KehrOuGr+tR6pBq1qIO6okDpnTcS9bwg8M
 0bQB+dsCfZFu4vNR4bK6+NJvIw==
X-Google-Smtp-Source: AK7set8/DWUg2biOeLCpnQTNUDSGmQIIir579wZ1y8gEiKQizApwNot58/Tk837uJQlfUMb2qQ+gsA==
X-Received: by 2002:a05:6512:961:b0:4df:830d:4a3a with SMTP id
 v1-20020a056512096100b004df830d4a3amr608954lft.23.1678796050307; 
 Tue, 14 Mar 2023 05:14:10 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a19ad44000000b004dda87ecae3sm379058lfd.246.2023.03.14.05.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 05:14:09 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 13:13:40 +0100
Subject: [PATCH v4 02/10] drm/msm/dsi: Get rid of msm_dsi_config::num_dsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v4-2-54b4898189cb@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678796043; l=5720;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=nAK7VhpEOKQPVDoVxGmSH//l3jkm1AocrDNJW7zWKno=;
 b=VpM31BLq1jEywlgGpV5SjZd1zxKT75yYscC+ni0PHOpwRxoc66QKU/L3V3sdGveq78udj1bafY0N
 OBgb+BzJAEFnvB2b+NKyrRkTOyvBobUCPwBFZiNxMLuHRILUZEaq
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

In preparation for supporting multiple sets of possible base registers,
remove the num_dsi variable. We're comparing the io_start array contents
with the reg value from the DTS, so it will either match one of the
expected values or don't match against a zero (which we get from partial
array initialization).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 13 -------------
 drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  1 -
 drivers/gpu/drm/msm/dsi/dsi_host.c |  2 +-
 3 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 6d21f0b33411..4515f52b407a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -22,7 +22,6 @@ static const struct msm_dsi_config apq8064_dsi_cfg = {
 	.bus_clk_names = dsi_v2_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_v2_bus_clk_names),
 	.io_start = { 0x4700000, 0x5800000 },
-	.num_dsi = 2,
 };
 
 static const char * const dsi_6g_bus_clk_names[] = {
@@ -42,7 +41,6 @@ static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
 	.bus_clk_names = dsi_6g_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
 	.io_start = { 0xfd922800, 0xfd922b00 },
-	.num_dsi = 2,
 };
 
 static const char * const dsi_8916_bus_clk_names[] = {
@@ -61,7 +59,6 @@ static const struct msm_dsi_config msm8916_dsi_cfg = {
 	.bus_clk_names = dsi_8916_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_8916_bus_clk_names),
 	.io_start = { 0x1a98000 },
-	.num_dsi = 1,
 };
 
 static const char * const dsi_8976_bus_clk_names[] = {
@@ -80,7 +77,6 @@ static const struct msm_dsi_config msm8976_dsi_cfg = {
 	.bus_clk_names = dsi_8976_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_8976_bus_clk_names),
 	.io_start = { 0x1a94000, 0x1a96000 },
-	.num_dsi = 2,
 };
 
 static const struct regulator_bulk_data msm8994_dsi_regulators[] = {
@@ -99,7 +95,6 @@ static const struct msm_dsi_config msm8994_dsi_cfg = {
 	.bus_clk_names = dsi_6g_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
 	.io_start = { 0xfd998000, 0xfd9a0000 },
-	.num_dsi = 2,
 };
 
 static const char * const dsi_8996_bus_clk_names[] = {
@@ -119,7 +114,6 @@ static const struct msm_dsi_config msm8996_dsi_cfg = {
 	.bus_clk_names = dsi_8996_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_8996_bus_clk_names),
 	.io_start = { 0x994000, 0x996000 },
-	.num_dsi = 2,
 };
 
 static const char * const dsi_msm8998_bus_clk_names[] = {
@@ -138,7 +132,6 @@ static const struct msm_dsi_config msm8998_dsi_cfg = {
 	.bus_clk_names = dsi_msm8998_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_msm8998_bus_clk_names),
 	.io_start = { 0xc994000, 0xc996000 },
-	.num_dsi = 2,
 };
 
 static const char * const dsi_sdm660_bus_clk_names[] = {
@@ -156,7 +149,6 @@ static const struct msm_dsi_config sdm660_dsi_cfg = {
 	.bus_clk_names = dsi_sdm660_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sdm660_bus_clk_names),
 	.io_start = { 0xc994000, 0xc996000 },
-	.num_dsi = 2,
 };
 
 static const char * const dsi_sdm845_bus_clk_names[] = {
@@ -178,7 +170,6 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.bus_clk_names = dsi_sdm845_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
 	.io_start = { 0xae94000, 0xae96000 },
-	.num_dsi = 2,
 };
 
 static const struct regulator_bulk_data sm8550_dsi_regulators[] = {
@@ -192,7 +183,6 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
 	.bus_clk_names = dsi_sdm845_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
 	.io_start = { 0xae94000, 0xae96000 },
-	.num_dsi = 2,
 };
 
 static const struct regulator_bulk_data sc7180_dsi_regulators[] = {
@@ -206,7 +196,6 @@ static const struct msm_dsi_config sc7180_dsi_cfg = {
 	.bus_clk_names = dsi_sc7180_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
 	.io_start = { 0xae94000 },
-	.num_dsi = 1,
 };
 
 static const char * const dsi_sc7280_bus_clk_names[] = {
@@ -224,7 +213,6 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
 	.bus_clk_names = dsi_sc7280_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
 	.io_start = { 0xae94000, 0xae96000 },
-	.num_dsi = 2,
 };
 
 static const char * const dsi_qcm2290_bus_clk_names[] = {
@@ -242,7 +230,6 @@ static const struct msm_dsi_config qcm2290_dsi_cfg = {
 	.bus_clk_names = dsi_qcm2290_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
 	.io_start = { 0x5e94000 },
-	.num_dsi = 1,
 };
 
 static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 44be4a88aa83..6b6b16c5fd25 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -39,7 +39,6 @@ struct msm_dsi_config {
 	const char * const *bus_clk_names;
 	const int num_bus_clks;
 	const resource_size_t io_start[DSI_MAX];
-	const int num_dsi;
 };
 
 struct msm_dsi_host_cfg_ops {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 18fa30e1e858..9021f0d65515 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1868,7 +1868,7 @@ static int dsi_host_get_id(struct msm_dsi_host *msm_host)
 	if (!res)
 		return -EINVAL;
 
-	for (i = 0; i < cfg->num_dsi; i++) {
+	for (i = 0; i < DSI_MAX; i++) {
 		if (cfg->io_start[i] == res->start)
 			return i;
 	}

-- 
2.39.2

