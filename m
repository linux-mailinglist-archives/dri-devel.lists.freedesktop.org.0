Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E49F25E8C3C
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 14:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3F310E606;
	Sat, 24 Sep 2022 12:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C0F10E604
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 12:19:03 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id g20so2727860ljg.7
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 05:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cF05yDaRT5/jiUw2Qee8ED5ZHeJzCzuJb8hAnhlWOHs=;
 b=FGMDVNmTTCwzuEQjUbzFokaGuVVrEbe4XLVOqB9alqagctg7M38iNl0oL2Ti5KCchv
 6HElc8Z4/fdQ7vJhOxoTYWOxKTAqX4fFmYefb8Ln9Dk8rKvLUhAofvsh/BT/lOcBOXlv
 GBk9dfAEzifNpD77lgecOZuTZmDB4dz7wRxvR2vTiiZWEb3psvpsxY9tRx2DqVv+LZyz
 aABSt52FVB0xXGFANFwPxzMBp2mriJ9AKVhfwayY1h7aiHACSRIlh/1VIX2uD7cYolyw
 X+U2pkbRRSFxWrLEHtCmDbhMf3Ib/c5WdochVWTWeWm8s+jMQ+ZA1Ts4mDE+58tqhhit
 jGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cF05yDaRT5/jiUw2Qee8ED5ZHeJzCzuJb8hAnhlWOHs=;
 b=rl6zUcLq7fMo9EKR4wUzFt7bGIABFtRZeOpXujJ6iXA0Pl3TkhGn/KP7CePpBpZCof
 dEbGOxz3WRQu0PeaU/rO6bLAcu7pI8aihKe9m12qqDkGxSodke7fGq66IHPmPR7xK+bN
 zBD+oAaGaiF9A9TMmgP8E/8A12PhH8TJPoQ10Huyv7A1hsDLrcwc9sCZvEZoTbXKckCh
 RGPLR4GqYUJRKwyPDrTQJrP4iSaJ8rHVkUrjY2oZ1EI6Q68L7ZeI0GJ7b/9akloBZCsn
 f1apApR11qZNoQ7JqKkKHW2rao6aVty83NAALsqMqSMm9l9N1lkKZyaEqf9Hk/YhMJxp
 +/wA==
X-Gm-Message-State: ACrzQf39MBNgJnH1NMBNcYuPCrynbJEgqO4bZqFkc+N8WF0mS5WS0HW6
 9Aiw/aZe7wyZ1JyCJWd1CntMhw==
X-Google-Smtp-Source: AMsMyM7wuGdhR667gNoEFZoGT2hzAMfPUNRUSpEarxRy811LKEsZt70ebnjb7JfmVC4EKOwStJ+Lvg==
X-Received: by 2002:a05:651c:514:b0:26c:5815:551d with SMTP id
 o20-20020a05651c051400b0026c5815551dmr4279508ljp.28.1664021943200; 
 Sat, 24 Sep 2022 05:19:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 v12-20020a19740c000000b00497a2815d8dsm1870113lfe.195.2022.09.24.05.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 05:19:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 2/2] drm/msm/dsi: Add phy configuration for QCM2290
Date: Sat, 24 Sep 2022 15:19:00 +0300
Message-Id: <20220924121900.222711-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924121900.222711-1-dmitry.baryshkov@linaro.org>
References: <20220924121900.222711-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Loic Poulain <loic.poulain@linaro.org>

The QCM2290 SoC a the 14nm (V2.0) single DSI phy. The platform is not
fully compatible with the standard 14nm PHY, so it requires a separate
compatible and config entry.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
[DB: rebased and updated commit msg]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 17 +++++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 7fc0975cb869..ee6051367679 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -549,6 +549,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 #ifdef CONFIG_DRM_MSM_DSI_14NM_PHY
 	{ .compatible = "qcom,dsi-phy-14nm",
 	  .data = &dsi_phy_14nm_cfgs },
+	{ .compatible = "qcom,dsi-phy-14nm-2290",
+	  .data = &dsi_phy_14nm_2290_cfgs },
 	{ .compatible = "qcom,dsi-phy-14nm-660",
 	  .data = &dsi_phy_14nm_660_cfgs },
 	{ .compatible = "qcom,dsi-phy-14nm-8953",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 60a99c6525b2..1096afedd616 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -50,6 +50,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 0f8f4ca46429..9f488adea7f5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1081,3 +1081,20 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs = {
 	.io_start = { 0x1a94400, 0x1a96400 },
 	.num_dsi_phy = 2,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_14nm_17mA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_14nm_17mA_regulators),
+	.ops = {
+		.enable = dsi_14nm_phy_enable,
+		.disable = dsi_14nm_phy_disable,
+		.pll_init = dsi_pll_14nm_init,
+		.save_pll_state = dsi_14nm_pll_save_state,
+		.restore_pll_state = dsi_14nm_pll_restore_state,
+	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
+	.io_start = { 0x5e94400 },
+	.num_dsi_phy = 1,
+};
-- 
2.35.1

