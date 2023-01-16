Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5196B66BD0C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 12:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADE410E3D2;
	Mon, 16 Jan 2023 11:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F52F10E3DF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 11:41:09 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id g13so42334890lfv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 03:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3dGHe77W5+el0IE6FbRdtVCcIAo/MBAj9RuLYV7h71Y=;
 b=OLnkeMwg+dH2A4GCcRVev9FtOtnLh0ZS1dw8p+g9sULNPcwEUSEaOqQTAGm+G+vHEO
 VLWmuZjGrbobtrWwYfQmyib4Z941yVjBRLSvjWWSIRZQZ+fEzyU7licMbG3x+VqSKFft
 SeH950EQ1wCK1eJxgpT+VJOKpKYLUGud5mCE/UlDJ/Df5oOJWs5xeTxepQkW4EnEaMA6
 VKiwTV5ammFo33j6naCN5HD+N6tITn5CIQKjN69IWFDNKQyYJ3AUEFxrTFk+YcYrJtuf
 wtjM96VfP+ze/kDz0kuD/QNYBXvvd2XPIVW8hAiu++fUjp1k+FLAMFJiRok3RIEwvp8x
 143w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3dGHe77W5+el0IE6FbRdtVCcIAo/MBAj9RuLYV7h71Y=;
 b=7qEehAf1k5K19t69+x9UNB93J9fmTLbY6enQ3v97f5il0g2UOi/WNcL35jKxyuJH9C
 nPeMq5NdRmkAN46FO1Qa//Wu+9u5ULQZuDomqsfDKmBRJeWLfP9w06Gjou+hvkxw8nat
 1Wl4SOrW0rUBoesd7IjMwlJtx9UsPAWiFftsvIa7i+jmnV0K/+1qukOouutg0pcQExwO
 /UHUHXJhb5yeCld4JzdE7pcBeF7iAgiUQXTVydaZO07hoKhWb6eGnxa/RH512NbcUmBa
 OQdho7Dmyrh3iwJaQi8MyFDgRrife6sFBEoOHl3O1R2Y5NidgXpG4U1Gv/EqAqMdmZ0E
 DT5w==
X-Gm-Message-State: AFqh2ko0fO8Gsr1Xx4KIRFYBBvtAhAy3Z6lYEwXLI6LvGFSaYhGQWS+B
 1M4kUKheC8jlezU4EMy0uS2ZXA==
X-Google-Smtp-Source: AMrXdXveFQwM64kphTdh9VvJyOYqmqjJIcGg0+MVAT2K8ZYQnBqUWMZSnBMwW92nMB6jcRu72BtVNw==
X-Received: by 2002:a05:6512:3e10:b0:4b5:c489:8cf8 with SMTP id
 i16-20020a0565123e1000b004b5c4898cf8mr29527596lfv.61.1673869267773; 
 Mon, 16 Jan 2023 03:41:07 -0800 (PST)
Received: from localhost.localdomain (abym53.neoplus.adsl.tpnet.pl.
 [83.9.32.53]) by smtp.gmail.com with ESMTPSA id
 k10-20020a05651c10aa00b0027fb9e64bd0sm918946ljn.86.2023.01.16.03.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 03:41:07 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 2/2] drm/msm/dsi: Add phy configuration for SM6375
Date: Mon, 16 Jan 2023 12:40:59 +0100
Message-Id: <20230116114059.346327-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116114059.346327-1-konrad.dybcio@linaro.org>
References: <20230116114059.346327-1-konrad.dybcio@linaro.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 marijn.suijten@somainline.org, Jonathan Marek <jonathan@marek.ca>,
 devicetree@vger.kernel.org, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konrad.dybcio@somainline.org>

SM6375 uses a boring standard 7nm PHY. Add a configuration entry for it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Depends on [1] to work properly, but won't hurt for it to land
separately..

[1] https://patchwork.kernel.org/project/linux-arm-msm/patch/1642586079-12472-1-git-send-email-loic.poulain@linaro.org/

 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 20 ++++++++++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index cbe669fca26d..57445a5dc816 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -569,6 +569,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_7nm_8150_cfgs },
 	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
 	  .data = &dsi_phy_7nm_7280_cfgs },
+	{ .compatible = "qcom,sm6375-dsi-phy-7nm",
+	  .data = &dsi_phy_7nm_6375_cfgs },
 	{ .compatible = "qcom,sm8350-dsi-phy-5nm",
 	  .data = &dsi_phy_5nm_8350_cfgs },
 	{ .compatible = "qcom,sm8450-dsi-phy-5nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 5f0b1c9b09ef..c849bfd7494e 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -55,6 +55,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_7nm_6375_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index af5c952c6ad0..3b1ed02f644d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1152,6 +1152,26 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
 };
 
+const struct msm_dsi_phy_cfg dsi_phy_7nm_6375_cfgs = {
+	.has_phy_lane = true,
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000ULL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0x5e94400 },
+	.num_dsi_phy = 1,
+	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
+};
+
 const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 	.has_phy_lane = true,
 	.regulator_data = dsi_phy_7nm_36mA_regulators,
-- 
2.39.0

