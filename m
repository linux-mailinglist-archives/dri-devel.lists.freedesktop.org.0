Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D225B693099
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 12:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE00310E178;
	Sat, 11 Feb 2023 11:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAE310E178
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 11:52:03 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w3so326458edc.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 03:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xu29OnoYbs7XlgjQ7eQ5Uic7usShH1dqxj/7r0Nr9hA=;
 b=Azhb35xQfIkRkppUDbGElCHDXkOGIHdkj1Wv+qJ9Ee16d9Isac9HTm6yCOEXSMRLCI
 xtpA8d+cpYU/ZIYscQwv9uDWxWMpLgT1wl/6JirdYNKfZ/Jz9Tx7N22uGIBi/qZLhsed
 RTNgmdvFI/iWwkiySU9bWbkOtdvmIl/64w3c8qECr+fV/bkKxIoyjqvH6qofhw2pV+/B
 d/ul1NoifWxFv0E7kVA46uZOfWZLjGr8VHGUPlZFSY/h4XAnI7beO+Yw9V/3U5p/AP+q
 cF4JXHsznSlH+gNl632wsRfoqbsJu6QflbMJrhF8itMclgsZYKxRQ1sa1ht4EPSJccRM
 KL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xu29OnoYbs7XlgjQ7eQ5Uic7usShH1dqxj/7r0Nr9hA=;
 b=Px1EYZrKgW2uVdtCcbcTxAN+3Ks/T34JOEq/SX60/iiO5tMykfR/YQfkT5AbUa3QeI
 g9Rzvi99ablduO93c6D2poEbqNObAi0NbZl48n5QYnT5IsEjTrLaRm8CRWV20d2BipDt
 PDe4Ac8bpnAx4FxjcZLtHQEv6nhxY3bHwUn/kggJOTviAAyKy91wHskRP0inCQehH6Vq
 vMhbrwE4WPrLwMOvHkDNFcoQbm2hoFjiwFzg2ojILDBiqzD9oqUv8BvCUJvyF4Zh8hZp
 fp3NFmOBUAbp0aj+3Aye6mN4RkRsIRJHcmhcE7o1AagcBW2gKlVVKZkks/n9Hnc4ba7h
 0JDQ==
X-Gm-Message-State: AO0yUKVl3TCWgc8eJl8MYYRb+TOXhUphGcPjtBWIt1O6xj+d4rGrIs4x
 7ghDC30glvaGKp/pPZrxCCtwsA==
X-Google-Smtp-Source: AK7set+zlTzVfecZAmxXHXbYPcxJi6BLvT4chUPZUZHzMJWd+/2Pm9Csni4qi7rylweFb3x30/UkDg==
X-Received: by 2002:a50:9f28:0:b0:4ab:b0d5:6bb0 with SMTP id
 b37-20020a509f28000000b004abb0d56bb0mr4200948edf.18.1676116322880; 
 Sat, 11 Feb 2023 03:52:02 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 r10-20020a50d68a000000b004aabb714230sm3636070edi.35.2023.02.11.03.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 03:52:02 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 06/10] drm/msm/dsi: dsi_cfg: Merge SC7180 config into SDM845
Date: Sat, 11 Feb 2023 12:51:06 +0100
Message-Id: <20230211115110.1462920-7-konrad.dybcio@linaro.org>
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
 Loic Poulain <loic.poulain@linaro.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The configs are identical, other than the number of *maximum* DSI
hosts allowed. This isn't an issue, unless somebody deliberately
tries to access the inexistent host by adding a dt node for it.

Remove the SC7180 struct and point the hw revision match to the
SDM845's one. On a note, this could have been done back when
7180 support was introduced.

Fixes: 6125bd327e16 ("drm/msm: add DSI support for sc7180")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 860681bfc084..142a0f1e2576 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -169,7 +169,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.bus_clk_names = dsi_v2_4_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
 	.io_start = {
-		{ 0xae94000, 0xae96000, 0 },
+		{ 0xae94000, 0xae96000, 0 }, /* SDM845 / SDM670 / SC7180 */
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
-		{ 0xae94000, 0 },
-	},
-};
-
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 };
@@ -299,7 +288,7 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
-		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
 		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,
-- 
2.39.1

