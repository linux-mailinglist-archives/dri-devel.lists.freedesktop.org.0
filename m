Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC9D8CBF81
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 12:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F4510F4BB;
	Wed, 22 May 2024 10:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vCZMw2PX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7E610F4B5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 10:51:01 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-51f0602bc58so821989e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 03:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716375060; x=1716979860; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/4mDJNdY3BQpBxyPjIYj4R7zW531FPYbhtqPnKZkd9k=;
 b=vCZMw2PXvKfg8KrfALLPE9Cy5iI+nKSeAxunUPt4aQyakPZ5mN7OcMtAFFuMdjwbgS
 qv/gbd7r1iqVzIfbT+B1+E39PwVAQwGuagno2qFbI5HXIrUHPm/KVdkL80Qyqw2UlcXy
 gPEbT/qtvZju78CGY6RtzEgZBMEpkPeRxk/lWkb9kzzmVoWLapDRsKDwtlGXrOhbXClT
 JQUVl47JwU9xXrLU+MQxh2r6NzZ71ry3TQF9uURgoaAvXfused8EyrG21we9ValVP3PK
 ziKOxLMRSCG17zFx2T7soG/itVu0oq0eupDJQVhiks4mzKZZLTUbd04MxMk6drR6Ygk0
 UkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716375060; x=1716979860;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/4mDJNdY3BQpBxyPjIYj4R7zW531FPYbhtqPnKZkd9k=;
 b=egf0v4Cm2W/AkYQdDOXgcj1IphGXlObBO4nRAjMaU91JLcGVhr34a3HS0rSGNAiI+0
 tX+ykLgfA4sXdTFC+Zko8yaeai2wNo7XukhM3PwADdZEs9zBg7WEaOxnwrA0V04hep9m
 ck49grpCevtrbOGNhSWQXfMocyWmKLVvKrlUzzSU+Of8VIbd6AOm/HOA3h6jsn/ID0eA
 41befNQB+/ZOB+TOB5o/PrjO1EaVgj2JI2+/Rlxx/vqsK2E6lYAkHwvwIUVcigkoOvFQ
 FSnl2N5op72wAqr39/4uR0H9v46p0MnYLK9SZn7zH1anx3qgfY65Y2R1M8jHbpDyiNp/
 LDNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8BniLxsHUl18sGnf/wY+pF+HlRlwEz2yidR2N2kK/9F05xQzVEzL/Nu4zAoJYfcIp22aFN5wbKN1gPMQWYrEfVFSoO6rpqB0P2v3eyrfg
X-Gm-Message-State: AOJu0YyPtrttqmwZr+G+o0UXCQtzLUwyTECCGo3Zcgq5jT0ec+Qf9IM3
 D6HLSsVqtgtEfMLJudIew4W1bKy+iR9Nry4VzzZ6YQGkDKpEREpg43FBlOYzwhc=
X-Google-Smtp-Source: AGHT+IEYXIMyl3eSxKpjBCG9L21f/R2Dl2+wh1OnVS2XyqdyNDi1cNFgpQEiZv9NXyXWYkFmbpjYuw==
X-Received: by 2002:ac2:46ef:0:b0:51c:b0c9:ea54 with SMTP id
 2adb3069b0e04-5269b8a9c36mr552508e87.16.1716375059959; 
 Wed, 22 May 2024 03:50:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:50:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:50:54 +0300
Subject: [PATCH v2 02/14] drm/msm/hdmi: simplify extp clock handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-2-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5848;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OqWVWP2+AiuB0eZmmX6BVNibFfmd2vfn14lHJu5N/wM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4PbIhSU16AXMkzZZcytwIW6PZ12zsiXOYod
 IBQ5PyaSMeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3ODwAKCRCLPIo+Aiko
 1V5oB/4mjXL6dJ/5q/obF0HXfl/AQP265nycil27dxSNjaftozZH2WVndqjQxfgl0S3O+7/ZsZU
 dUZAtqu3NwlHnTM7EnM7Rf83GjyVCwnO7hfPmNpvrAO564o7qkvDYb7MDyf1Q3hx3fIxvIdLG1D
 JLr0ZZtuxuKmeu42xCpfS7rTYlkNuONeVlxv26khJL9CzDdf3mcr8a5lMGOrcobOrh69+fhzQD1
 bWR/pzkkecsKvpDADa5Bz7rsfXaG+6RrahLWIA8DdOrV9spB5gdkj0SRJuJggDRbfdnRMqDhLw1
 +O2y7rVVBQzartquDNj5r4b5x47nugrv7XF8NBMjjXKRhn43
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

With the extp being the only "power" clock left, remove the surrounding
loops and handle the extp clock directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 24 ++++--------------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  6 +-----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 33 +++++++++++++--------------------
 3 files changed, 18 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 108c86925780..681265e29aa0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -235,13 +235,11 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *pwr_clk_names_8x74[] = {"extp"};
 static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
 		.hpd_freq      = hpd_clk_freq_8x74,
 };
@@ -485,24 +483,10 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 		hdmi->hpd_clks[i] = clk;
 	}
 
-	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
-				      config->pwr_clk_cnt,
-				      sizeof(hdmi->pwr_clks[0]),
-				      GFP_KERNEL);
-	if (!hdmi->pwr_clks)
-		return -ENOMEM;
-
-	for (i = 0; i < config->pwr_clk_cnt; i++) {
-		struct clk *clk;
-
-		clk = msm_clk_get(pdev, config->pwr_clk_names[i]);
-		if (IS_ERR(clk))
-			return dev_err_probe(dev, PTR_ERR(clk),
-					     "failed to get pwr clk: %s\n",
-					     config->pwr_clk_names[i]);
-
-		hdmi->pwr_clks[i] = clk;
-	}
+	hdmi->extp_clk = devm_clk_get_optional(&pdev->dev, "extp");
+	if (IS_ERR(hdmi->extp_clk))
+		return dev_err_probe(dev, PTR_ERR(hdmi->extp_clk),
+				     "failed to get extp clock\n");
 
 	hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
 	/* This will catch e.g. -EPROBE_DEFER */
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 4586baf36415..abdbe4779cf9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -51,7 +51,7 @@ struct hdmi {
 	struct regulator_bulk_data *hpd_regs;
 	struct regulator_bulk_data *pwr_regs;
 	struct clk **hpd_clks;
-	struct clk **pwr_clks;
+	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
 
@@ -98,10 +98,6 @@ struct hdmi_platform_config {
 	const char **hpd_clk_names;
 	const long unsigned *hpd_freq;
 	int hpd_clk_cnt;
-
-	/* clks that need to be on for screen pwr (ie pixel clk): */
-	const char **pwr_clk_names;
-	int pwr_clk_cnt;
 };
 
 struct hdmi_bridge {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4a5b5112227f..9eb4d06bdc0e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -17,7 +17,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
-	int i, ret;
+	int ret;
 
 	pm_runtime_get_sync(&hdmi->pdev->dev);
 
@@ -25,21 +25,15 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	if (ret)
 		DRM_DEV_ERROR(dev->dev, "failed to enable pwr regulator: %d\n", ret);
 
-	if (config->pwr_clk_cnt > 0) {
+	if (hdmi->extp_clk) {
 		DBG("pixclock: %lu", hdmi->pixclock);
-		ret = clk_set_rate(hdmi->pwr_clks[0], hdmi->pixclock);
-		if (ret) {
-			DRM_DEV_ERROR(dev->dev, "failed to set pixel clk: %s (%d)\n",
-					config->pwr_clk_names[0], ret);
-		}
-	}
+		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
+		if (ret)
+			DRM_DEV_ERROR(dev->dev, "failed to set extp clk rate: %d\n", ret);
 
-	for (i = 0; i < config->pwr_clk_cnt; i++) {
-		ret = clk_prepare_enable(hdmi->pwr_clks[i]);
-		if (ret) {
-			DRM_DEV_ERROR(dev->dev, "failed to enable pwr clk: %s (%d)\n",
-					config->pwr_clk_names[i], ret);
-		}
+		ret = clk_prepare_enable(hdmi->extp_clk);
+		if (ret)
+			DRM_DEV_ERROR(dev->dev, "failed to enable extp clk: %d\n", ret);
 	}
 }
 
@@ -49,15 +43,15 @@ static void power_off(struct drm_bridge *bridge)
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
-	int i, ret;
+	int ret;
 
 	/* TODO do we need to wait for final vblank somewhere before
 	 * cutting the clocks?
 	 */
 	mdelay(16 + 4);
 
-	for (i = 0; i < config->pwr_clk_cnt; i++)
-		clk_disable_unprepare(hdmi->pwr_clks[i]);
+	if (hdmi->extp_clk)
+		clk_disable_unprepare(hdmi->extp_clk);
 
 	ret = regulator_bulk_disable(config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret)
@@ -271,7 +265,6 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
 	struct msm_drm_private *priv = bridge->dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	long actual, requested;
@@ -285,8 +278,8 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 	if (kms->funcs->round_pixclk)
 		actual = kms->funcs->round_pixclk(kms,
 			requested, hdmi_bridge->hdmi->encoder);
-	else if (config->pwr_clk_cnt > 0)
-		actual = clk_round_rate(hdmi->pwr_clks[0], requested);
+	else if (hdmi->extp_clk)
+		actual = clk_round_rate(hdmi->extp_clk, requested);
 	else
 		actual = requested;
 

-- 
2.39.2

