Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16EB8CBF98
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 12:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B021F10F4D1;
	Wed, 22 May 2024 10:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Jg1xKgGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C3710F4C9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 10:51:07 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52192578b95so7497967e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 03:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716375066; x=1716979866; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cKuE+Md2+CJZ4ooxLw6IM33pLF9pqRQyKVYsC0dlBR4=;
 b=Jg1xKgGCTVtD7ZGdRIPKXdvoebVKY1felg5IlL3Vciu0dhT2I0ICbNcZPgsBEYP35p
 g7MrhvtwDQn6lwQV8RdO8S8Ny6XwZwH7w/nUwk3T5CD8R1T1RZjqqKxgFBPM6VR02Di/
 1hEMWaoXy5Qp7jBp+HQrM50TfUJsLBDqKWcdlY9AOSU8mTI9rGLKb+NG4ytu30NE4gsk
 vxxm93EC5I3GCZZI0gAEy94IrytB+wSjR0HD6fbcBiaUoVrKevVYjwjmuThcivcC9WLM
 51PJBys3NRAqOWShNudxTCOwZm3FxW+ZNWuAKJm85I9fljlsaSRTctImjoRqpSI6TUyh
 KGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716375066; x=1716979866;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cKuE+Md2+CJZ4ooxLw6IM33pLF9pqRQyKVYsC0dlBR4=;
 b=ufRqRxo8QIda6NCyD6xIf2oZAXrTI5gmcbytmTYgJPI49E3G9K2hp2weapKDl6J2/i
 BLGA5uP6AMiORjrJrniiyAPEZq/cOTg1WMHw19QYZch1VHW1aa7hVfyVcr9gn8G2BhmV
 9IJEVByKs+AWjBxKKraMWKJFJEM0zlNhI4psK6CzAwpxoj874mXeU4QV6cgADbi3Rbql
 v05/1ygI5jb52mvMHwgBT0i/rcgA7+cDk/lGVmjJw7XFiEBBSuuum0E4HvTxi8970eeJ
 EWS3u5+1uhY6BOFlMC4T1eTWnCGlLeOLIR5maUWrg39utyfN+/AZ0ZEhuJGx+3JeZ7Eb
 YPNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgHRsIdaMJXOPNIzbZj+FnVWpJljWeEvDPcq1ORNXKto8CoWLaSeBCvxVFQSHWioivJBnef+4Ay/nTKF2LA4hylXOKnrHTmOiYkdsVonDx
X-Gm-Message-State: AOJu0YwLBPNChvM++crASyvU32VEWn1jK99Nm6br5YgL3odLLy+ihP7p
 Ld/7ZemjlN8QHmOcg750Yv8nSCxpuDgDYecbGIdgBl6fmYxQdfKK0u6Lk/d9/uHqxO6TCfRYuuE
 I
X-Google-Smtp-Source: AGHT+IHJeHTfHyWHVmMD+/FJkx5/LYCOdgdKbvGKBtmAdB4VaETozRkOXBbdUDLL9rrVCMVWowSddA==
X-Received: by 2002:ac2:58cc:0:b0:51e:150e:2c45 with SMTP id
 2adb3069b0e04-526c0d496c5mr830356e87.63.1716375066002; 
 Wed, 22 May 2024 03:51:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:51:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:51:02 +0300
Subject: [PATCH v2 10/14] drm/msm/hdmi: rename hpd_clks to pwr_clks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-10-c30bdb7c5c7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3783;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=u0XwnOVdGXgfRiv18KJvoggCPFhhyJzYE8jnecSwHG0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4QVCgxWG7MQkwYIO2fZmquhIl4W6mSsgcqw
 QAYfxikpzaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3OEAAKCRCLPIo+Aiko
 1UkvB/0QXhbzvu2Qi7WDnyqqjv7fCAiOPkjQFZ982cDkBIbjU3x1gUpa/ChxkJ+kgfp8UguLOKW
 Urr3FuY5QKNOH7upYyMF7MilONK8M6VzNEuIRhiO3Oe6k6zpxZQmoKbb9pizEqB1Sv4MGnhh7gC
 bnW59QObIlD2aXrOnMfsdCQHXsK/T1GB82W9UyUek7nwaEGFCrUIsOzgEaU/gTCpj0XoejKsgqj
 AsCm3jQdJmcyyaU4gfXFBVE0PMZ0PsCuidADxkTPfL7gtgWMeZJHsfphPLh1BbWu6/QTHLR9tS2
 03S0gc01vvsSCpUzwYIYtSlMeoOHmuJwmcTD5PLi71Exy7TZ
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

As these clocks are now used in the runtime PM callbacks, they have no
connection to 'HPD'. Rename corresponding fields to follow clocks
purpose, to power up the HDMI controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 26 +++++++++++++-------------
 drivers/gpu/drm/msm/hdmi/hdmi.h |  6 +++---
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index cc671baad87b..c39a1f3a7505 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -228,19 +228,19 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
 static const char *pwr_reg_names_8960[] = {"core-vdda"};
-static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
+static const char *pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
 		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(hpd_clk, 8960),
+		HDMI_CFG(pwr_clk, 8960),
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static const char *pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
+		HDMI_CFG(pwr_clk, 8x74),
 };
 
 /*
@@ -449,17 +449,17 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get pwr regulators\n");
 
-	hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
-				      config->hpd_clk_cnt,
-				      sizeof(hdmi->hpd_clks[0]),
+	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
+				      config->pwr_clk_cnt,
+				      sizeof(hdmi->pwr_clks[0]),
 				      GFP_KERNEL);
-	if (!hdmi->hpd_clks)
+	if (!hdmi->pwr_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < config->hpd_clk_cnt; i++)
-		hdmi->hpd_clks[i].id = config->hpd_clk_names[i];
+	for (i = 0; i < config->pwr_clk_cnt; i++)
+		hdmi->pwr_clks[i].id = config->pwr_clk_names[i];
 
-	ret = devm_clk_bulk_get(&pdev->dev, config->hpd_clk_cnt, hdmi->hpd_clks);
+	ret = devm_clk_bulk_get(&pdev->dev, config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		return ret;
 
@@ -517,7 +517,7 @@ static int msm_hdmi_runtime_suspend(struct device *dev)
 	struct hdmi *hdmi = dev_get_drvdata(dev);
 	const struct hdmi_platform_config *config = hdmi->config;
 
-	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+	clk_bulk_disable_unprepare(config->pwr_clk_cnt, hdmi->pwr_clks);
 
 	pinctrl_pm_select_sleep_state(dev);
 
@@ -540,7 +540,7 @@ static int msm_hdmi_runtime_resume(struct device *dev)
 	if (ret)
 		goto fail;
 
-	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	ret = clk_bulk_prepare_enable(config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index ee5463eb41b6..1e346e697f8e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -49,7 +49,7 @@ struct hdmi {
 	phys_addr_t mmio_phy_addr;
 
 	struct regulator_bulk_data *pwr_regs;
-	struct clk_bulk_data *hpd_clks;
+	struct clk_bulk_data *pwr_clks;
 	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
@@ -90,8 +90,8 @@ struct hdmi_platform_config {
 	int pwr_reg_cnt;
 
 	/* clks that need to be on for hpd: */
-	const char **hpd_clk_names;
-	int hpd_clk_cnt;
+	const char **pwr_clk_names;
+	int pwr_clk_cnt;
 };
 
 struct hdmi_bridge {

-- 
2.39.2

