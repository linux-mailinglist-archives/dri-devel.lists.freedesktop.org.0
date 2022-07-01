Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DACAC562DC2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 10:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC31E10F4B5;
	Fri,  1 Jul 2022 08:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F3B10F4AE
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 08:21:24 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id k14so1717404plh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 01:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jb0snNKbqdGMcNSHmZUstipe/vA8ntyU7tLSAh8qCE4=;
 b=EmWdXESfxTD6CClfgXeW3XMNSv/G8xk8QvfxlF5biP6edTuTajQaVQMVDMpOdy7Fuv
 MwktxJ+WJTVnMxJhs1Gt4E6SyL9e0EQF3iWsiK/Aifv7j0qHi6OiVTmSQ1dunx/oI6ty
 bY8yGaJDED/u5I76xENmYt5NI3WaoCl+80vM3DMnJWlKurKeE2tZ6SzpuqU3dfPSRHJh
 E7NAgHUpWVjxfDsLEWGa636YIKIemPdqiFQEgVykN8HoNsjUSMcIIQPW5sDXdqkWtnmU
 8+9h5nbQKWOjn7ZdmKio1PcWeIPAzY0nvAROsypuOs3sPOZvKhBZLZLJx4jsTf4+bhcg
 sgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jb0snNKbqdGMcNSHmZUstipe/vA8ntyU7tLSAh8qCE4=;
 b=ZzNEw+DCpEqklT/ZZtWbbSv9U0840u9VaPrh8kwf2PpZs1dXmUJveUekcHqXi3y1Dx
 WoC9dq1qyJWfuHHD76OoY+SNx8vrxdnTYQzZbOH5RPnZCumS3OcOljLCMVNfrclw5X0x
 xE0eA3nM7eeu07vFrwX977WfwCvd4UvfEImVGBlE7CicJOj22Vmyt2kNLfkn8r5GpDhp
 +xCb0F1J3p+JnfebUTPeAZaAeykf16fSPVkhqR5nXXB0rqeieRBToUFuorH9zfiq7riV
 IWP0cxZamTkyN/Nzygz/u72UCf9sLoFoBn9U0Et0fjqfsKZlFqgO5yscWsMmLbs1unoM
 mZpg==
X-Gm-Message-State: AJIora+iPKycaY7VARSTFA3QREDCYV4LW+u3gd8UM2fjCHzH0V5UvkTf
 6jOdQwgbxIxJbI/DW3n3H4aYlw==
X-Google-Smtp-Source: AGRyM1u7YOcVYA6e7JC8Afc3cO0uF+FowHj00X8PP+5fdNddz6P/PTLix/S0GqoELPlK91hqfqoM/g==
X-Received: by 2002:a17:90a:e2c5:b0:1ec:ea7f:a85c with SMTP id
 fr5-20020a17090ae2c500b001ecea7fa85cmr15486494pjb.232.1656663684098; 
 Fri, 01 Jul 2022 01:21:24 -0700 (PDT)
Received: from localhost ([122.172.201.58]) by smtp.gmail.com with ESMTPSA id
 e12-20020a170902784c00b0016a35649186sm14830427pln.195.2022.07.01.01.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 01:21:23 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH V2 14/30] drm/msm: Migrate to dev_pm_opp_set_config()
Date: Fri,  1 Jul 2022 13:50:09 +0530
Message-Id: <31b74e43d3af263e1b943bca1dd3debe885521d8.1656660185.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1656660185.git.viresh.kumar@linaro.org>
References: <cover.1656660185.git.viresh.kumar@linaro.org>
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OPP core now provides a unified API for setting all configuration
types, i.e. dev_pm_opp_set_config().

Lets start using it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  8 ++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 10 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  6 +++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.c        |  6 +++++-
 drivers/gpu/drm/msm/dsi/dsi_host.c      |  6 +++++-
 5 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index c424e9a37669..6ebb5a28c501 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1723,10 +1723,14 @@ static void check_speed_bin(struct device *dev)
 {
 	struct nvmem_cell *cell;
 	u32 val;
+	struct dev_pm_opp_config config = {
+		.supported_hw = &val,
+		.supported_hw_count = 1,
+	};
 
 	/*
 	 * If the OPP table specifies a opp-supported-hw property then we have
-	 * to set something with dev_pm_opp_set_supported_hw() or the table
+	 * to set something with dev_pm_opp_set_config() or the table
 	 * doesn't get populated so pick an arbitrary value that should
 	 * ensure the default frequencies are selected but not conflict with any
 	 * actual bins
@@ -1748,7 +1752,7 @@ static void check_speed_bin(struct device *dev)
 		nvmem_cell_put(cell);
 	}
 
-	devm_pm_opp_set_supported_hw(dev, &val, 1);
+	devm_pm_opp_set_config(dev, &config);
 }
 
 struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 42ed9a3c4905..82801311f7d4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1800,6 +1800,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
 	u32 supp_hw = UINT_MAX;
 	u32 speedbin;
 	int ret;
+	struct dev_pm_opp_config config = {
+		.supported_hw = &supp_hw,
+		.supported_hw_count = 1,
+	};
 
 	ret = adreno_read_speedbin(dev, &speedbin);
 	/*
@@ -1818,11 +1822,7 @@ static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
 	supp_hw = fuse_to_supp_hw(dev, rev, speedbin);
 
 done:
-	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
-	if (ret)
-		return ret;
-
-	return 0;
+	return devm_pm_opp_set_config(dev, &config);
 }
 
 static const struct adreno_gpu_funcs funcs = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e23e2552e802..2213ce52d2fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1215,12 +1215,16 @@ static int dpu_kms_init(struct drm_device *ddev)
 	struct dev_pm_opp *opp;
 	int ret = 0;
 	unsigned long max_freq = ULONG_MAX;
+	struct dev_pm_opp_config config = {
+		.clk_names = (const char *[]){ "core" },
+		.clk_count = 1,
+	};
 
 	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
 	if (!dpu_kms)
 		return -ENOMEM;
 
-	ret = devm_pm_opp_set_clkname(dev, "core");
+	ret = devm_pm_opp_set_config(dev, &config);
 	if (ret)
 		return ret;
 	/* OPP table is optional */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index b7f5b8d3bbd6..0c8fc151b4be 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2022,6 +2022,10 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 {
 	struct dp_ctrl_private *ctrl;
 	int ret;
+	struct dev_pm_opp_config config = {
+		.clk_names = (const char *[]){ "ctrl_link" },
+		.clk_count = 1,
+	};
 
 	if (!dev || !panel || !aux ||
 	    !link || !catalog) {
@@ -2035,7 +2039,7 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	ret = devm_pm_opp_set_clkname(dev, "ctrl_link");
+	ret = devm_pm_opp_set_config(dev, &config);
 	if (ret) {
 		dev_err(dev, "invalid DP OPP table in device tree\n");
 		/* caller do PTR_ERR(opp_table) */
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a95d5df52653..35b6722d1cf9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2034,6 +2034,10 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	struct msm_dsi_host *msm_host = NULL;
 	struct platform_device *pdev = msm_dsi->pdev;
 	int ret;
+	struct dev_pm_opp_config config = {
+		.clk_names = (const char *[]){ "byte" },
+		.clk_count = 1,
+	};
 
 	msm_host = devm_kzalloc(&pdev->dev, sizeof(*msm_host), GFP_KERNEL);
 	if (!msm_host) {
@@ -2095,7 +2099,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		goto fail;
 	}
 
-	ret = devm_pm_opp_set_clkname(&pdev->dev, "byte");
+	ret = devm_pm_opp_set_config(&pdev->dev, &config);
 	if (ret)
 		return ret;
 	/* OPP table is optional */
-- 
2.31.1.272.g89b43f80a514

