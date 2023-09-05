Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0746A792CB1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 19:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04C910E324;
	Tue,  5 Sep 2023 17:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B601810E0DE
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 17:43:58 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2bce552508fso42987221fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 10:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693935837; x=1694540637; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+yoR4D3vHBG2DQkrYz9CktRc0wLoRmNyNxYAYcHedKY=;
 b=n81AuOipFjVVofJHWT9YJ2HLSKRXknx3IpSP3V5ayzAAXA18l4+0Ir/bOmkTuTPXL3
 8Y744L0Z+6uCBKygPeGRyRAf1U0W42XmR+vFl5gICe5xTKe7caGecMwrZsBAgPeVpFgV
 gZi5iRNh6fMA+UimrcGgeWYhYpi0YUOKjgSFOuV5VDbVF5s/O1xroZdgZnKW1+bn2UgP
 EoR0X2UZOdSdWUGzu8gIB6RG+UCW0VtQU+4o+vWBIH8FTKpPJkx1cHAMeVsudPBtbMGb
 r948WkJ2AUAmsf/yEHU1k0ReKUt1wxF0wVditcO+K+Oz76rqKWuRizFba1dsukAL4Cof
 KNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693935837; x=1694540637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+yoR4D3vHBG2DQkrYz9CktRc0wLoRmNyNxYAYcHedKY=;
 b=O1+S10n1GooXP+xQU5VEhW4ryR75zVfF1kdUmHYaDvs2atca8b+6V5uJtrhFqOajpM
 pRLtVWxfUrM6DgTEemwjga2J1KM1NkdvrB76Yd+tiUTh+jL2T4AWAoaBHsOEFEvGizFs
 NDMcVxkpSUfcgrgrWm16h5NOdC8WzkcrGTpzAKOsylkIWWiPmMtZ0QERGKpnZK9xd5wp
 dS81HxjdcKU01RAReUe1GLcYruQakL2hGqtfh4oBgtQgpjhFrLiAIQgPD5b5iaPrU4iD
 XwErzka1uUHv9FZsnOmUhOE96sbEzgXK4Yo1GHC75sdhfAXkSzWx7Odl4QTnZ+DzLoQn
 G6EA==
X-Gm-Message-State: AOJu0YyaNHdBE7FXM32ryEjb2UFuoaSwloiYjh7pUOi1Cj5XPBUc4Qcd
 GAAU63jFdaM+xHYZzHRveCdJeg==
X-Google-Smtp-Source: AGHT+IGm7+DBBs6eUJlCmFekaxTP6D1h6di+Hq+Qb8/vCg1YKyy6jIAoWIR4m4sIwUH+PTmWpEoyTw==
X-Received: by 2002:a2e:8898:0:b0:2b9:e93e:65e6 with SMTP id
 k24-20020a2e8898000000b002b9e93e65e6mr346411lji.35.1693935836949; 
 Tue, 05 Sep 2023 10:43:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a2e7a0a000000b002bce8404157sm3045922ljc.12.2023.09.05.10.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 10:43:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 4/6] drm/msm: add a kernel param to select between MDP5 and
 DPU drivers
Date: Tue,  5 Sep 2023 20:43:51 +0300
Message-Id: <20230905174353.3118648-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
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

For some of the platforms (e.g. SDM660, SDM630, MSM8996, etc.) it is
possible to support this platform via the DPU driver (e.g. to provide
support for DP, multirect, etc). Add a modparam to be able to switch
between these two drivers.

All platforms supported by both drivers are by default handled by the
MDP5 driver. To let them be handled by the DPU driver pass the
`msm.prefer_mdp5=false` kernel param.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  3 +++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  3 +++
 drivers/gpu/drm/msm/msm_drv.c            | 31 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h            |  1 +
 4 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a9ba67e24e11..f3cb8c2ada5e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1351,6 +1351,9 @@ static int dpu_kms_init(struct drm_device *ddev)
 
 static int dpu_dev_probe(struct platform_device *pdev)
 {
+	if (!msm_disp_drv_should_bind(&pdev->dev, true))
+		return -ENODEV;
+
 	return msm_drv_probe(&pdev->dev, dpu_kms_init);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 92bf9d949d09..3828725683a7 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -935,6 +935,9 @@ static int mdp5_dev_probe(struct platform_device *pdev)
 
 	DBG("");
 
+	if (!msm_disp_drv_should_bind(&pdev->dev, false))
+		return -ENODEV;
+
 	ret = mdp5_setup_interconnect(pdev);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4bd028fa7500..1b8ec55704ba 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1184,6 +1184,37 @@ static int add_components_mdp(struct device *master_dev,
 	return 0;
 }
 
+#if !IS_REACHABLE(CONFIG_DRM_MSM_MDP5) || !IS_REACHABLE(CONFIG_DRM_MSM_DPU)
+bool msm_disp_drv_should_bind(struct device *dev, bool mdp5_driver)
+{
+	/* If just a single driver is enabled, use it no matter what */
+	return true;
+}
+#else
+
+static bool prefer_mdp5 = true;
+MODULE_PARM_DESC(prefer_mdp5, "Select whether MDP5 or DPU driver should be preferred");
+module_param(prefer_mdp5, bool, 0444);
+
+/* list all platforms supported by both mdp5 and dpu drivers */
+static const char *const msm_mdp5_dpu_migration[] = {
+	NULL,
+};
+
+bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver)
+{
+	/* If it is not an MDP5 device, do not try MDP5 driver */
+	if (!of_device_is_compatible(dev->of_node, "qcom,mdp5"))
+		return dpu_driver;
+
+	/* If it is not in the migration list, use MDP5 */
+	if (!of_device_compatible_match(dev->of_node, msm_mdp5_dpu_migration))
+		return !dpu_driver;
+
+	return prefer_mdp5 ? !dpu_driver : dpu_driver;
+}
+#endif
+
 /*
  * We don't know what's the best binding to link the gpu with the drm device.
  * Fow now, we just hunt for all the possible gpus that we support, and add them
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index fdcbb02fa396..05370a03fb44 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -571,5 +571,6 @@ int msm_drv_probe(struct device *dev,
 	int (*kms_init)(struct drm_device *dev));
 void msm_drv_shutdown(struct platform_device *pdev);
 
+bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
 
 #endif /* __MSM_DRV_H__ */
-- 
2.39.2

