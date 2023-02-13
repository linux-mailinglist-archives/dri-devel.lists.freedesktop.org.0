Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE33569455C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 13:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44E310E590;
	Mon, 13 Feb 2023 12:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8327610E59B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 12:10:34 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qw12so31327845ejc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 04:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/ijGdXUpk/bOx95tYb/G/O+ZlxWtjcaYyWfUGg3pEc=;
 b=DQNyvOFFReWgBK1ik8krxhrLtoU4RC3T3FNeQZM+IOH5fE25SpEsOmynkFIcOly4zE
 5vTQcN9tsmTUaOxhE1XWjX74cAr31Fv7gx3dNDnI4FAuIj6/MPPIE6+p1riWKtProoEl
 5XUuTj1eTuMnNnoe60nTOsz/Dq8xyj0q4Wrenh8d+E0c9ab8VekE77Ym6zG3GyOn8+VG
 fONx6Tn4uDY7rfUVo+d3EW8+id9Qbsfz4k6SdlUeaL4r2mjYVq3QdSFB4ioj1xc1ARZt
 U6uWRirFXGKLwXkxc926LYP8ixrmsL7OqcJw64yMqxPd4UdwE9e2GrOQkyGEA1zlRqqy
 x27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/ijGdXUpk/bOx95tYb/G/O+ZlxWtjcaYyWfUGg3pEc=;
 b=DXuFTifI4MpnZ+m1S40Moc/+f6snJ+1z4uNE+NUzoITkrJrwr2Hpbi63LqhZYhNHvF
 55CZ/1ymzdDdS6+ywTTjyhvIexxYzSGxC47/dWJk1YDOHOx3XB2aS43M4RWXudyVvDS3
 6uHGfPBaqwjYBxVn/opXvV4qrcgQnHW2gBsgLTQxnLaa1ZPEFF25OdBYfvYxbGRe1SPJ
 Sjl3YfreOuQt8jCPgxuRk69IqYxe0I3EhUeVrPjIB+T0QtUyhVKxfUiG8Nz870MtcEPq
 3FuqTaNNHAHpLDU7xRl3DDmR4XXMp3tNrsh8c0x56AO7H2b88neHTTZ6/AfoaXLtYRlx
 3+qQ==
X-Gm-Message-State: AO0yUKUw8oCeOkq9jh5uRr4C5UMs7PVCItCRwS42x7DsjmTw5W05GwAa
 0PL9wEttYA0YaSlXVQLkPvRB/w==
X-Google-Smtp-Source: AK7set8VRfGa+KfnQjVhfn3F5v7L1J78Hco7aKsO/3w9H+E1cGLytKoet1JVeXmFGI7XmTc+P8cJiQ==
X-Received: by 2002:a17:907:1ddc:b0:886:221b:44e5 with SMTP id
 og28-20020a1709071ddc00b00886221b44e5mr24043584ejc.62.1676290234028; 
 Mon, 13 Feb 2023 04:10:34 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 dt19-20020a170906b79300b0088ed7de4821sm6651586ejb.158.2023.02.13.04.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 04:10:33 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH v2 6/9] drm/msm/dsi: Switch the QCM2290-specific compatible to
 index autodetection
Date: Mon, 13 Feb 2023 13:10:09 +0100
Message-Id: <20230213121012.1768296-7-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the logic can handle multiple sets of registers, move
the QCM2290 to the common logic and mark it deprecated. This allows us
to remove a couple of structs, saving some memory.

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
2.39.1

