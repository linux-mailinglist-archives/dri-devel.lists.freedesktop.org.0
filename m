Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 689AB7443AA
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 22:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CD710E4F1;
	Fri, 30 Jun 2023 20:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F1810E4F8
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 20:55:32 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb7acaa7a5so3721000e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 13:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688158530; x=1690750530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fNVmU8HfJzAhSkmsEVuTAg9GbpLxTciOPnh3vvstVXw=;
 b=f//wGEaqZBaUvbk42MTt5ilcOlle2/2QUHaUEk1m/L98MhZWXbU6u/88C7T1pVLtSj
 6v852L+asxRXX7zt4JWLao6PzRzhe/FNqWduuUWnj2glpHZYJ9qGZL8BQbXwx3tw5ZqS
 XeMfJlkG431lDFMW+VvZQhIa+kIJVFZgpzwuxj8fwpk8mMc9OxoBqGXF73eYHkfjpiwZ
 0gVHS1VQnT2cGBvQ/2EnNaeMSxKp8cFGW5DjJs5tP949UGKYrAi2zfGhjBXimjzdUw2R
 gZhN7CjudmzgvzmQaCYqDTsJVXNrnJevhW1DHC7t6ah3uEACxtG6ExYpWw+RVVEX48NJ
 YZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688158530; x=1690750530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fNVmU8HfJzAhSkmsEVuTAg9GbpLxTciOPnh3vvstVXw=;
 b=SDSHV0gAOmsv7GZlWJof5jQAjHL/xfbo6kVwuwVliVRNcgvonwISjume1AlACoH+J4
 k6mHTj8RrUzRpBJ0P0nBNBQ7lm23cENVXKcTHGZIu4lMZ+7rsK1wDg1Rvqe4R053629o
 MO9rCRMhCXs3vjYo0snZTeTV0R3nv4kCj8Jm55VCYt3b7cXO/FH8GQvFhvF0BpmKLuAR
 za+YqEi7LYUQnPPmsQVGErO7jfjbxmfVsHAtUSBIwrEy5IrQJfVNRih6olIxE3W4MmG8
 vWj0TTurLSYcIMFLXbturW9tV5ZBpmP9KhSUreZ/Bhh2yb1GbgiVeosxfDJ1VbJTuOTA
 FNtw==
X-Gm-Message-State: ABy/qLah8m9b03562z75pYbTbsluL81zxyUV0VzVfgnaUBJUNv/cnhJV
 AdVMU6YSv3qSHUbQUu+VxSe27A==
X-Google-Smtp-Source: APBJJlExHsyRDH6kMi2+38aJrM34jptdomKRUlQ6QzHz46r0gnHStPNiGOd6yd259I1hO4NsQCtOvQ==
X-Received: by 2002:a05:6512:31d6:b0:4f8:46e9:9f19 with SMTP id
 j22-20020a05651231d600b004f846e99f19mr3757977lfe.1.1688158530458; 
 Fri, 30 Jun 2023 13:55:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 13:55:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 08/15] drm/msm/hdmi: switch to pm_runtime_resume_and_get()
Date: Fri, 30 Jun 2023 23:55:16 +0300
Message-Id: <20230630205523.76823-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pm_runtime_get_sync() function is a bad choise for runtime power
management. Switch HDMI driver to pm_runtime_resume_and_get() and add
proper error handling, while we are at it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++++++--
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |  6 +++++-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index bb10b35194ff..4aa11eabbf2a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -27,7 +27,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	const struct hdmi_platform_config *config = hdmi->config;
 	int ret;
 
-	pm_runtime_get_sync(&hdmi->pdev->dev);
+	pm_runtime_resume_and_get(&hdmi->pdev->dev);
 
 	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 3d3d72ff6a83..7de538046a52 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -85,7 +85,12 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	if (hdmi->hpd_gpiod)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
+		goto fail;
+	}
+
 	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
 		goto fail;
@@ -179,7 +184,10 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	uint32_t hpd_int_status = 0;
 	int ret;
 
-	pm_runtime_get_sync(&hdmi->pdev->dev);
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		goto out;
+
 	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 9780107e1cc9..d1f6b53c3109 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -57,7 +57,11 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
 	struct device *dev = &phy->pdev->dev;
 	int i, ret = 0;
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
+		return ret;
+	}
 
 	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
 	if (ret) {
-- 
2.39.2

