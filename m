Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B71CA913E1F
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 22:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD3710E316;
	Sun, 23 Jun 2024 20:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OUhFtakV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB05F10E011;
 Sun, 23 Jun 2024 20:30:48 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-362f62ae4c5so2048318f8f.1; 
 Sun, 23 Jun 2024 13:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719174647; x=1719779447; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5IThLSZxCkprktvpOp0R1xO5qT7TqcAXcmsbOx04wBw=;
 b=OUhFtakVuQq64xlki5bAT9HAZYAfvSjUlbnqc62YPEo7DO7au9nDfGSJjJWN7EnJa6
 uBqphvtIVsztiyeOGbmp2LZU2byLXv08Um+NZTIgUbjiwEa2foGKJCSwKCbVO+/BsD6b
 v9bGQBlT9fzGS1EqglU47NQKcbPASQrdHqyO4OYSY+/bb3MYazzHWDfd8iJLYSi9yNlC
 t2b3gzJhuHfx4NThv8u/0oszX2RkfsQiLD1bRB2NfOXF5GYV+HPfzi9TVffUAKFp/CGw
 LuNMH76PonBVhk0z1ML+qPMExRqzfa6sRzuJmRz+kLOaKXpiDzXlH7zaXxXqP8lORkQ5
 79Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719174647; x=1719779447;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5IThLSZxCkprktvpOp0R1xO5qT7TqcAXcmsbOx04wBw=;
 b=jnxq9bL2Ddf93MNYHhcxHjQkcWQO27/DgaN/vrCSpanW7cvQcAngff7q6gt47QPUN0
 M9K+hHnnDYVJQZ7KQIlz4s82lYY2ViQREospIgUYzx4ODk4a5iYg3P4XuepmuC2AyJcR
 1j5BdQ61Y7w0EilKw5vyVe7FesUdBsbEuKj2aXbx7cmDdC610+E0sF5f3edo0D/i0wXX
 AU/L+tQGoIc6o1kFwY/AL/Oj7hWOhFeDa3985C+6x9qHuFWNRmdOB+k9jZDG8gvmNmPd
 A3DP7pzf9pTpII3k26Ai0vXhA1GFN7SCPwaYMRj6Y8z3KqdJr2gWaddGIkCx15O0kvqJ
 CWUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBWJbNfFQ44Y1ZiRGJ5z3pbOhwiHL+sDj00YuCbUNZWTzjAu5xYQUV62vr77dbQTXDosGceXTd/eI1j/WwcYuaz1529rorKZhrRScBcpUK4hlC9fT7iGOb2BAR7+ssumOiCw70NCuek85uHDiIFPA0
X-Gm-Message-State: AOJu0YyZOolQ7Xgk7V+R89cFkwjG9StWbftmmiKlp9Ew39B4tMlYwQm7
 d9zyB3Z7ASSJi3be2APffRwa3Qb0fH/zOc+agZNBmLeIIYnIKDsw4yt3kAdUMxE=
X-Google-Smtp-Source: AGHT+IEtxSf0FqRKKf6O5su5WO1aK1An8BcYpxm9JuMgBzotWwroMshjUUv72Y3gADnWy0VLBDhhqg==
X-Received: by 2002:adf:efcf:0:b0:360:7c76:dd5 with SMTP id
 ffacd0b85a97d-366e3677026mr3662823f8f.14.1719174647089; 
 Sun, 23 Jun 2024 13:30:47 -0700 (PDT)
Received: from [192.168.1.130] (BC2492F3.dsl.pool.telekom.hu. [188.36.146.243])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366389b8ad2sm8088599f8f.33.2024.06.23.13.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 13:30:46 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 22:30:39 +0200
Subject: [PATCH v2 4/4] drm/msm/dsi: Add phy configuration for MSM8937
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-dsi-v2-4-a0ca70fb4846@gmail.com>
References: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
In-Reply-To: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>, 
 phone-devel@vger.kernel.org, Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniil Titov <daniilt971@gmail.com>

Add phy configuration for 28nm dsi phy found on MSM8937 SoC. Only
difference from existing msm8916 configuration is number of phy
and io_start addresses.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 18 ++++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 24a347fe2998..dd58bc0a49eb 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -545,6 +545,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_28nm_lp_cfgs },
 	{ .compatible = "qcom,dsi-phy-28nm-8226",
 	  .data = &dsi_phy_28nm_8226_cfgs },
+	{ .compatible = "qcom,dsi-phy-28nm-8937",
+	  .data = &dsi_phy_28nm_8937_cfgs },
 #endif
 #ifdef CONFIG_DRM_MSM_DSI_20NM_PHY
 	{ .compatible = "qcom,dsi-phy-20nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 5a5dc3faa971..a9b4eb2c0e8c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -47,6 +47,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8226_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8937_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index ceec7bb87bf1..3afc8b1c9bdf 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -917,3 +917,21 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8226_cfgs = {
 	.num_dsi_phy = 1,
 	.quirks = DSI_PHY_28NM_QUIRK_PHY_8226,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_28nm_8937_cfgs = {
+	.has_phy_regulator = true,
+	.regulator_data = dsi_phy_28nm_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_28nm_regulators),
+	.ops = {
+		.enable = dsi_28nm_phy_enable,
+		.disable = dsi_28nm_phy_disable,
+		.pll_init = dsi_pll_28nm_init,
+		.save_pll_state = dsi_28nm_pll_save_state,
+		.restore_pll_state = dsi_28nm_pll_restore_state,
+	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
+	.io_start = { 0x1a94400, 0x1a96400 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_28NM_QUIRK_PHY_LP,
+};

-- 
2.45.2

