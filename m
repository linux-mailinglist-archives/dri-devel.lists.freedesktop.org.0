Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C82C534E4A
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 13:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DB610F0AE;
	Thu, 26 May 2022 11:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2ECD10F0AE
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 11:44:09 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 x2-20020a17090a1f8200b001e07a64c461so4191357pja.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 04:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bM3evDjfiE3dprTsclqC+/G6p3TK8Ys0Oy1ZcImUYfI=;
 b=laC4QuTRCSg15JyXcb0ZD2Q4k53G7vghjfyxzv8umgfoorTsmmpQfMbYRec0NDOGhY
 ZE0ZNojePoqY3DSa/G78FdLptguqGGFfqzBBeXXMtwm/h7U7JYySMx7+JuJ2G2PWb3bF
 PeCNYJfs5DMIsiIbeRrYXdDW32Yaz4CxTKzg74MkpPCwWlM8X1FpLYNQf3pyAK8WTICf
 8TYeST48ot3aMLkvlkVrIqlqckVx0E8VRNIYFTuZMyd/flWwH0p6GgIs0sTfN2G+gAse
 HFr9P6EcchTDffeVhYQex9XhPyJ9Fh+fa8aoXzjKUaa1c3/Z2YLN8kK8lbl24keZ9tzc
 tJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bM3evDjfiE3dprTsclqC+/G6p3TK8Ys0Oy1ZcImUYfI=;
 b=wWNN3kpN5Ph5qQWQqww06+lrdUx28XCo6PIAWhUjq/Nuzj3OliozjWD0sIPM4lNhCU
 /D/c+GeiomuA/XlIDv3tcl44IX7z8+mDvsrAy2WtpzYxmXwmTao3+EhICRYLWgx7aqPu
 51W/xuP2p4dBtKkoDQ+DGKYZaUt3ZmV/Y6Ch0iOwBhTNGOUiMqyxQUJGb0bSEQUUUW/5
 qs7qXUQxYWwjqSHIk5J23+xC7NpQSnpCjLf581ovmVMAVHr9lMxkD5ziddmegBSPjnAt
 crsbP5mQlqa0gdBDnfmTfJgMYrbAjq0NzegINM/bnJIXWKzOeLKZwv2kMq+6ZVcEUZIT
 0RVQ==
X-Gm-Message-State: AOAM530HKKfytcd6v5d8B+y5g0OOQQ8XsMDYYeRR2WrpLrCL3oTp99Z8
 fTnVMlISEB4gKn2FIZ+WpkxLrQ==
X-Google-Smtp-Source: ABdhPJzFEsV7cJrNzaIFA5do0FQhIQLA3swJDrst+zf/HBD8jNqWQ/kokmEk7NyfDIO4ycChLj/aKw==
X-Received: by 2002:a17:90a:4803:b0:1dc:b4c9:1958 with SMTP id
 a3-20020a17090a480300b001dcb4c91958mr2177698pjh.61.1653565449495; 
 Thu, 26 May 2022 04:44:09 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 jb14-20020a170903258e00b00161527e1d9fsm1270109plb.294.2022.05.26.04.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 04:44:09 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 14/31] drm/msm: Migrate to dev_pm_opp_set_config()
Date: Thu, 26 May 2022 17:12:13 +0530
Message-Id: <f6a74bce04534144719ee4811a663dac85056815.1653564321.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1653564321.git.viresh.kumar@linaro.org>
References: <cover.1653564321.git.viresh.kumar@linaro.org>
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
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  5 ++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.c        |  5 ++++-
 drivers/gpu/drm/msm/dsi/dsi_host.c      |  5 ++++-
 5 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 407f50a15faa..c39fb085a762 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1728,10 +1728,14 @@ static void check_speed_bin(struct device *dev)
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
@@ -1753,7 +1757,7 @@ static void check_speed_bin(struct device *dev)
 		nvmem_cell_put(cell);
 	}
 
-	devm_pm_opp_set_supported_hw(dev, &val, 1);
+	devm_pm_opp_set_config(dev, &config);
 }
 
 struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 83c31b2ad865..ddb2812b1ff7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1805,6 +1805,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
 	u32 supp_hw = UINT_MAX;
 	u32 speedbin;
 	int ret;
+	struct dev_pm_opp_config config = {
+		.supported_hw = &supp_hw,
+		.supported_hw_count = 1,
+	};
 
 	ret = adreno_read_speedbin(dev, &speedbin);
 	/*
@@ -1823,11 +1827,7 @@ static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
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
index e29796c4f27b..43f943fdfde5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1203,12 +1203,15 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *ddev = priv->dev;
 	struct dpu_kms *dpu_kms;
 	int ret = 0;
+	struct dev_pm_opp_config config = {
+		.clk_name = "core",
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
index 53568567e05b..54bdb33eef45 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1974,6 +1974,9 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 {
 	struct dp_ctrl_private *ctrl;
 	int ret;
+	struct dev_pm_opp_config config = {
+		.clk_name = "ctrl_link",
+	};
 
 	if (!dev || !panel || !aux ||
 	    !link || !catalog) {
@@ -1987,7 +1990,7 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	ret = devm_pm_opp_set_clkname(dev, "ctrl_link");
+	ret = devm_pm_opp_set_config(dev, &config);
 	if (ret) {
 		dev_err(dev, "invalid DP OPP table in device tree\n");
 		/* caller do PTR_ERR(opp_table) */
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index d51e70fab93d..7d5b027629d2 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1801,6 +1801,9 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	struct msm_dsi_host *msm_host = NULL;
 	struct platform_device *pdev = msm_dsi->pdev;
 	int ret;
+	struct dev_pm_opp_config config = {
+		.clk_name = "byte",
+	};
 
 	msm_host = devm_kzalloc(&pdev->dev, sizeof(*msm_host), GFP_KERNEL);
 	if (!msm_host) {
@@ -1862,7 +1865,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		goto fail;
 	}
 
-	ret = devm_pm_opp_set_clkname(&pdev->dev, "byte");
+	ret = devm_pm_opp_set_config(&pdev->dev, &config);
 	if (ret)
 		return ret;
 	/* OPP table is optional */
-- 
2.31.1.272.g89b43f80a514

