Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C012693092
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 12:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29B510E166;
	Sat, 11 Feb 2023 11:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFCF10E166
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 11:51:52 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w3so326107edc.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 03:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6d/ZVSA0QFC6MXtjamKYBGsXvhDKvXab75YapPa5sNQ=;
 b=rkpcdafCk9gxjEwIKlPV311jheyalW+L/U1VJddyjYZYeZzPJkfScGT3MrI68COmNo
 u9c/OzbbOCh59N0qCxva15f/1VY5aYUo14KMrwsWuPJ/F+BHkZTNDb7S12sHWWpIZ2EN
 cDh8F4ovZS6wSo8Pmr0Oa8jC6zMLZjFlLD2XzRjsZZmUBQsRoCi2ilB19nxqd7XUY8bj
 cjriyF+L1z7+Sqj3nbkTWtSyOQiY4FOPYJFHmPrVL4Kt8cfS2QXbd4PXjnsn6jHwCAlj
 FEN0CdN3NotV6Tx1qz7qPL/ULJ4VMCs03jem1hN5aM5d+q+uUM+bPAzqY7wY6aGG6g+V
 o91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6d/ZVSA0QFC6MXtjamKYBGsXvhDKvXab75YapPa5sNQ=;
 b=cbp3R27C0FJTHiw9HJ10lCxW7kbm8FNT/UZv24HUR5C1VbQUO+bTU5P8wTOmhjtwQR
 9cMTxNAckWW2tk32xkOyEnw7cdi00O+BKGgd8CDjPU/8N0k+Fk4yLiK25KotlPTOs4/m
 ZXXRVn9pJQOQQcGa5Uo0veePFQLAT1RX4yXm9sHPf0DzL9FZ3ounHwS+pWMb7a6PuNoW
 ElJoUMV2WPjIhu5ykfpqGbA8ZWL25XwBuFcR2Urc7I6ShTQgFe5exs0TDDmD2r0Q34fk
 ouE1JiiFuYcbZPrpwAPjl9fsSuJUrRfoKZOUS+9y0lbjd3cmJL8qJCG1/wTE3qb6SLkA
 h+kQ==
X-Gm-Message-State: AO0yUKVTV0Vg/53TlRc4V92IgTPTtEYD8P87GcZ6K4U6HReOzCqNNOz+
 iOg3nD9BEU81q4UcFs0r6PY/eQ==
X-Google-Smtp-Source: AK7set/8yGN5ifzP6nn45s7t9NiKUHu0g0SGLLP6joFvn3me6Ca2PqnuHzuLzmzygeMaIsaZe11R5Q==
X-Received: by 2002:a50:a6dc:0:b0:4ac:bd84:43d8 with SMTP id
 f28-20020a50a6dc000000b004acbd8443d8mr311825edc.8.1676116312398; 
 Sat, 11 Feb 2023 03:51:52 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 r10-20020a50d68a000000b004aabb714230sm3636070edi.35.2023.02.11.03.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 03:51:52 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 03/10] drm/msm/dsi: Zero-terminate msm_dsi_config::io_start
Date: Sat, 11 Feb 2023 12:51:03 +0100
Message-Id: <20230211115110.1462920-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for supporting multiple sets of possible base registers,
Zero-terminate the array that contains them to remove the need of
specifying num_dsi for each set.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 39 ++++++++++--------------------
 drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  4 +--
 drivers/gpu/drm/msm/dsi/dsi_host.c |  2 +-
 3 files changed, 16 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 068d45b3a8f0..5f62c563bd1c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -22,9 +22,8 @@ static const struct msm_dsi_config apq8064_dsi_cfg = {
 	.bus_clk_names = dsi_v2_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_v2_bus_clk_names),
 	.io_start = {
-		{ 0x4700000, 0x5800000 },
+		{ 0x4700000, 0x5800000, 0 },
 	},
-	.num_dsi = 2,
 };
 
 static const char * const dsi_6g_bus_clk_names[] = {
@@ -44,9 +43,8 @@ static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
 	.bus_clk_names = dsi_6g_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
 	.io_start = {
-		{ 0xfd922800, 0xfd922b00 },
+		{ 0xfd922800, 0xfd922b00, 0 },
 	},
-	.num_dsi = 2,
 };
 
 static const char * const dsi_8916_bus_clk_names[] = {
@@ -65,9 +63,8 @@ static const struct msm_dsi_config msm8916_dsi_cfg = {
 	.bus_clk_names = dsi_8916_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_8916_bus_clk_names),
 	.io_start = {
-		{ 0x1a98000 },
+		{ 0x1a98000, 0 },
 	},
-	.num_dsi = 1,
 };
 
 static const char * const dsi_8976_bus_clk_names[] = {
@@ -86,9 +83,8 @@ static const struct msm_dsi_config msm8976_dsi_cfg = {
 	.bus_clk_names = dsi_8976_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_8976_bus_clk_names),
 	.io_start = {
-		{ 0x1a94000, 0x1a96000 },
+		{ 0x1a94000, 0x1a96000, 0 },
 	},
-	.num_dsi = 2,
 };
 
 static const struct regulator_bulk_data msm8994_dsi_regulators[] = {
@@ -107,9 +103,8 @@ static const struct msm_dsi_config msm8994_dsi_cfg = {
 	.bus_clk_names = dsi_6g_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
 	.io_start = {
-		{ 0xfd998000, 0xfd9a0000 },
+		{ 0xfd998000, 0xfd9a0000, 0 },
 	},
-	.num_dsi = 2,
 };
 
 static const char * const dsi_8996_bus_clk_names[] = {
@@ -129,9 +124,8 @@ static const struct msm_dsi_config msm8996_dsi_cfg = {
 	.bus_clk_names = dsi_8996_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_8996_bus_clk_names),
 	.io_start = {
-		{ 0x994000, 0x996000 },
+		{ 0x994000, 0x996000, 0 },
 	},
-	.num_dsi = 2,
 };
 
 static const char * const dsi_msm8998_bus_clk_names[] = {
@@ -150,9 +144,8 @@ static const struct msm_dsi_config msm8998_dsi_cfg = {
 	.bus_clk_names = dsi_msm8998_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_msm8998_bus_clk_names),
 	.io_start = {
-		{ 0xc994000, 0xc996000 },
+		{ 0xc994000, 0xc996000, 0 },
 	},
-	.num_dsi = 2,
 };
 
 static const char * const dsi_sdm660_bus_clk_names[] = {
@@ -170,9 +163,8 @@ static const struct msm_dsi_config sdm660_dsi_cfg = {
 	.bus_clk_names = dsi_sdm660_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sdm660_bus_clk_names),
 	.io_start = {
-		{ 0xc994000, 0xc996000 },
+		{ 0xc994000, 0xc996000, 0 },
 	},
-	.num_dsi = 2,
 };
 
 static const char * const dsi_sdm845_bus_clk_names[] = {
@@ -194,9 +186,8 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.bus_clk_names = dsi_sdm845_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
 	.io_start = {
-		{ 0xae94000, 0xae96000 },
+		{ 0xae94000, 0xae96000, 0 },
 	},
-	.num_dsi = 2,
 };
 
 static const struct regulator_bulk_data sm8550_dsi_regulators[] = {
@@ -210,9 +201,8 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
 	.bus_clk_names = dsi_sdm845_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
 	.io_start = {
-		{ 0xae94000, 0xae96000 },
+		{ 0xae94000, 0xae96000, 0 },
 	},
-	.num_dsi = 2,
 };
 
 static const struct regulator_bulk_data sc7180_dsi_regulators[] = {
@@ -226,9 +216,8 @@ static const struct msm_dsi_config sc7180_dsi_cfg = {
 	.bus_clk_names = dsi_sc7180_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
 	.io_start = {
-		{ 0xae94000 },
+		{ 0xae94000, 0 },
 	},
-	.num_dsi = 1,
 };
 
 static const char * const dsi_sc7280_bus_clk_names[] = {
@@ -246,9 +235,8 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
 	.bus_clk_names = dsi_sc7280_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
 	.io_start = {
-		{ 0xae94000, 0xae96000 },
+		{ 0xae94000, 0xae96000, 0 },
 	},
-	.num_dsi = 2,
 };
 
 static const char * const dsi_qcm2290_bus_clk_names[] = {
@@ -266,9 +254,8 @@ static const struct msm_dsi_config qcm2290_dsi_cfg = {
 	.bus_clk_names = dsi_qcm2290_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
 	.io_start = {
-		{ 0x5e94000 },
+		{ 0x5e94000, 0 },
 	},
-	.num_dsi = 1,
 };
 
 static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index df9f09876ccb..03493cc6b772 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -41,8 +41,8 @@ struct msm_dsi_config {
 	int num_regulators;
 	const char * const *bus_clk_names;
 	const int num_bus_clks;
-	const resource_size_t io_start[VARIANTS_MAX][DSI_MAX];
-	const int num_dsi;
+	/* Allow + 1 entry for the zero-terminator */
+	const resource_size_t io_start[VARIANTS_MAX][DSI_MAX + 1];
 };
 
 struct msm_dsi_host_cfg_ops {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 22ba8726b0ea..f5092b4d0757 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1868,7 +1868,7 @@ static int dsi_host_get_id(struct msm_dsi_host *msm_host)
 	if (!res)
 		return -EINVAL;
 
-	for (i = 0; i < cfg->num_dsi; i++) {
+	for (i = 0; cfg->io_start[0][i]; i++) {
 		if (cfg->io_start[0][i] == res->start)
 			return i;
 	}
-- 
2.39.1

