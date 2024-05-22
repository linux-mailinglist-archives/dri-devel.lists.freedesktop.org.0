Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF4E8CBF9D
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 12:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D9310F4D4;
	Wed, 22 May 2024 10:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hYyZjm86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B36810F4BE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 10:51:04 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5238b5c080cso7888138e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 03:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716375063; x=1716979863; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Thx5VEVIdtS5W6YUF2PWAi/DMOAy+79Zm1AEBWpV7cY=;
 b=hYyZjm86gTjIXQrI6ngKVPfwy+BHofmRGcI76DJk22cVznwLzfBbawSd5mNdRJ/2WW
 M6TmbXtBptMJJKAsib207kWYIryQc2wOtHnd+zkYEedZ4I2f6L0SbDJ8hDZG6JdBpapy
 VovPjkXC93aKtIZ5SyBZmpK/2CQO0Pyq22S4nWWsKXKoRsSXqJoVNI6OfeXesuKfk8yd
 rzSbxHw6v6RGzzuL0o4t8L9LXvhTFDx/iDDlluxRwEx43rIbXWgWu6sWbBukd47Efe9u
 A7Ht0z18I8doMsvyqQg2KZfgiyIVa8aySRpsEOZllUBzgEbuYR+hEt7708vJhJw5wp75
 8TlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716375063; x=1716979863;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Thx5VEVIdtS5W6YUF2PWAi/DMOAy+79Zm1AEBWpV7cY=;
 b=lNyGdn4wEhMDbLySNDYWLUwHiZ5776bAdPJeGit5xtFoHXy99WtL4SH/9nZ+IwgEip
 G+ZefbyWvRsnNhEy2C5K9hA+nf9yr2inh9i5CnMDWuzkZXvz/YEo9K91uz1iq+HqpEW8
 Ajh8h7kH31D9yGzQvKGkjLhoa6RWSv0VZ2fo3hye8OSMuz/eECK8FYEJplM8t8j8d58d
 3qMlGw5hUlZA6xfrt1K3+0+W3TIxz4CJ6Fy7gvsEybr7pFQaxc095R9beqYbE0aONvOc
 GKWAkRbcreizYZexUR0xRgf27Fr4PgQAL0UVDcGHXvOZDVJSjxnGBKyE9PVqTqdzfP3Z
 RR0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJD3fFFgTFh9QA4mKI0EoItCPZECeVvMsU7XLyQ7GtnYdydkcawnM1oIqh+VGAybxQVjzlXk+xhnmnQ++mGGUk9IHC15QZsz5+sTQs0/La
X-Gm-Message-State: AOJu0Yz/VlxFhnvGP0ECPLaugPVSgXiTNtQDD7jN/fBVwx7yj9GRjHMI
 pZOTQwGkrWDwxUm3X08y0VMX3j8lwaImrWk0YCFlQVvxSZchmPVuz6f3egfGib0=
X-Google-Smtp-Source: AGHT+IFN/5I+WfK1fn5/Y5SqzUG4dzDQSqWg9365wTwasAYWN8c53SqYLJBZM4tHc7Y7GU7QdS8teQ==
X-Received: by 2002:a05:6512:3607:b0:523:48f2:e3fd with SMTP id
 2adb3069b0e04-526bdc53aa0mr840925e87.16.1716375062796; 
 Wed, 22 May 2024 03:51:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:51:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:50:58 +0300
Subject: [PATCH v2 06/14] drm/msm/hdmi: switch to clk_bulk API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-6-c30bdb7c5c7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4258;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qWoWxaBIT57QfQL/H3b3qamuy/KWc1sBIdaw/+EtJuE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4QhcbTNU1xZ4zo5pb7Is97xUeXSclmnMHPO
 dnPqXumZJeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3OEAAKCRCLPIo+Aiko
 1QLEB/4gFS6pepNvbhCKqUq2k20uwDwdS+34Dhukn30EerccF8nXVS1JtS5x0be0enjckgxW4H5
 gZi+UPdUoUsRQlDev5eALmLY3uubG6EJoWGHbV6MwyiLk3YuFSrbi0bmJe8EID0OkJ2qRKqDNAH
 ASO2yJquay9eV8KQPaqYUESX66/2JVxFShOuBjNWPmUgyE4ve8eUkYGLY1/CybiIly4pP71Z7JZ
 3PC92joqtA8NlIZucUqNWgdn1jUSGvRaUWkQ9mwVE657TFH2i9cMJ5P1rTWJMcYK9pIyIyYUAio
 c2aB8t9VYo/RHkhfXOpAZGS286LncX3QMmj+KpV1K2gtELpH
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

The last platform using legacy clock names for HDMI block (APQ8064)
switched to new clock names in 5.16. It's time to stop caring about old
DT, drop hand-coded helpers and switch to clk_bulk_* API.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 15 +++++---------
 drivers/gpu/drm/msm/hdmi/hdmi.h     |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 39 +++++++++++++------------------------
 3 files changed, 19 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index c14e009f38b1..7ec4ca3b7597 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -469,17 +469,12 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (!hdmi->hpd_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < config->hpd_clk_cnt; i++) {
-		struct clk *clk;
+	for (i = 0; i < config->hpd_clk_cnt; i++)
+		hdmi->hpd_clks[i].id = config->hpd_clk_names[i];
 
-		clk = msm_clk_get(pdev, config->hpd_clk_names[i]);
-		if (IS_ERR(clk))
-			return dev_err_probe(dev, PTR_ERR(clk),
-					     "failed to get hpd clk: %s\n",
-					     config->hpd_clk_names[i]);
-
-		hdmi->hpd_clks[i] = clk;
-	}
+	ret = devm_clk_bulk_get(&pdev->dev, config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		return ret;
 
 	hdmi->extp_clk = devm_clk_get_optional(&pdev->dev, "extp");
 	if (IS_ERR(hdmi->extp_clk))
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index c0d60ed23b75..eeba85ffef09 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -50,7 +50,7 @@ struct hdmi {
 
 	struct regulator_bulk_data *hpd_regs;
 	struct regulator_bulk_data *pwr_regs;
-	struct clk **hpd_clks;
+	struct clk_bulk_data *hpd_clks;
 	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 7ae69b14e953..36266aa626dc 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -60,27 +60,6 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)
 	}
 }
 
-static void enable_hpd_clocks(struct hdmi *hdmi, bool enable)
-{
-	const struct hdmi_platform_config *config = hdmi->config;
-	struct device *dev = &hdmi->pdev->dev;
-	int i, ret;
-
-	if (enable) {
-		for (i = 0; i < config->hpd_clk_cnt; i++) {
-			ret = clk_prepare_enable(hdmi->hpd_clks[i]);
-			if (ret) {
-				DRM_DEV_ERROR(dev,
-					"failed to enable hpd clk: %s (%d)\n",
-					config->hpd_clk_names[i], ret);
-			}
-		}
-	} else {
-		for (i = config->hpd_clk_cnt - 1; i >= 0; i--)
-			clk_disable_unprepare(hdmi->hpd_clks[i]);
-	}
-}
-
 int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
@@ -107,7 +86,9 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
 	pm_runtime_get_sync(dev);
-	enable_hpd_clocks(hdmi, true);
+	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		goto fail;
 
 	msm_hdmi_set_mode(hdmi, false);
 	msm_hdmi_phy_reset(hdmi);
@@ -149,7 +130,7 @@ void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 
 	msm_hdmi_set_mode(hdmi, false);
 
-	enable_hpd_clocks(hdmi, false);
+	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
 	pm_runtime_put(dev);
 
 	ret = pinctrl_pm_select_sleep_state(dev);
@@ -193,14 +174,20 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
 
 static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 {
-	uint32_t hpd_int_status;
+	const struct hdmi_platform_config *config = hdmi->config;
+	uint32_t hpd_int_status = 0;
+	int ret;
 
 	pm_runtime_get_sync(&hdmi->pdev->dev);
-	enable_hpd_clocks(hdmi, true);
+	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	if (ret)
+		goto out;
 
 	hpd_int_status = hdmi_read(hdmi, REG_HDMI_HPD_INT_STATUS);
 
-	enable_hpd_clocks(hdmi, false);
+	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+
+out:
 	pm_runtime_put(&hdmi->pdev->dev);
 
 	return (hpd_int_status & HDMI_HPD_INT_STATUS_CABLE_DETECTED) ?

-- 
2.39.2

