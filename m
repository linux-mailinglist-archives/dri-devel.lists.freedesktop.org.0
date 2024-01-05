Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E88825D2C
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 00:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EF710E6C5;
	Fri,  5 Jan 2024 23:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849F710E6B1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 23:34:21 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50ea9daac4cso66353e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 15:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704497660; x=1705102460; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ca8QpilXW9nIueljtJCFA85v0Hen2fQTmG6mJOfT0Tg=;
 b=YGXhVR7+GiKEKq38BXLeDYQ1frr2ASWY1OfdaLuNuxa976hQIhiV6p2o+dvRYmSLW/
 sJyD0zr+jIWJPTInQC2FmcyoiCbef5vxB53XaDmodqOD5Rh/FGFpPxtOnHowiXhAkSOm
 knOeoN/G8MOogyv+OGk+KfvO/0SXLSs+M9jIjDZHRBGDB7tEb7WuTTkU5hjWAHH5b36d
 fu1J7l/pCji3n8X1kZRru2+GkdDog9ery1TNHH8ATv1oi+Cl0ptuqfxXcNaGOF+nOMVb
 GoYRe4kK6j4mKGfQCLd5zXkIA9CAeJxeQjR2O6jHWGZUlmmFJXqCdylC2u2LYG1Js7nC
 ZWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704497660; x=1705102460;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ca8QpilXW9nIueljtJCFA85v0Hen2fQTmG6mJOfT0Tg=;
 b=giZFWHl+a93AyeodHXA1mWyeEKF6RJvmOVnWs1UdS1npEo/+Cxupgk09G/KsM30dTP
 lX8AP8oYqoSiVLgvVQchSRVu65ScOJLiUrMK9cJpZeDWFePiRJc0dwmjabBc+TnAJORH
 x1cWzv1UZRv5oL5x0XT/5BVlNtGmSdL4Ki6EGfb631dRs8QQ5DSwSyLNpH7FyaW1wF/C
 GKOMcgzHW+oz/yQBmZVpb4x67OJUE/yUwJOxHL7e5lcbPIT+ZrrjA8DHBbCKb0TfonEX
 iBr8jknYdxqJdTcTjN0iUmdTozYJIqzX7Lt3ut9OXP70hdcRrroo0W2TQHgnrUQNAN6M
 CHTg==
X-Gm-Message-State: AOJu0Ywvnj4gu7uW+nkpwZhGfJMl5SdeJf8NocGYSOMsvZvI8C8ilH2U
 OMqKV5eXGxmvlajF4/lpDraWH5DC366nVw==
X-Google-Smtp-Source: AGHT+IGMR+uDBBj+HxtcIk41GnXMSBMW/eQumehmT4kFqTC7BOPEvc4PDEeLuhIoW+vhS10c4S2r/w==
X-Received: by 2002:ac2:4a8a:0:b0:50e:7f70:a08b with SMTP id
 l10-20020ac24a8a000000b0050e7f70a08bmr65774lfp.112.1704497659755; 
 Fri, 05 Jan 2024 15:34:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 k4-20020ac24f04000000b0050e74d04c8asm362211lfr.132.2024.01.05.15.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 15:34:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 06 Jan 2024 01:34:17 +0200
Subject: [PATCH v3 3/4] drm/msm: add a kernel param to select between MDP5
 and DPU drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240106-fd-migrate-mdp5-v3-3-3d2750378063@linaro.org>
References: <20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org>
In-Reply-To: <20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3741;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=abAC+lw4hjGPuNmxpktM2ndFdh6eRFn95EvCwJH6BVI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlmJH35H1Sc7wsyEAR8ndmd1/uurtz+VgYXO7iI
 IlnDLKn032JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZiR9wAKCRCLPIo+Aiko
 1T5fB/9F0oTDVX6dnOnu/guTRuyY9cAlZrxxzwIIsUIrwdacCBuuOfH/xvwArLOr2mTEQv0OQ+b
 u0VpTuKpvASKrm0ZPG38DHXndlKgr//GhnQZCkZT0i5tAgfkrf7d6XAWhE7VzEskg1U7dxtYmYR
 SnIDBmvA68Iug8QPrM2KsauOF+B0SMKhm3bBhN4lfmEibQctGSZU+29Hdhdr4zKs6A71WzY3ZG6
 2yMLYUTbeqg5WuVr1hPaoLFf47FvIfF6zoKl+vUlxlE0+BnSR8EmpWP/Pj4OJIBTdaX0D09JhCe
 IVIK1RxDQ65a+gtqO5VUMmC5VtxpklfgMvjnyG+mevMstM6S
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
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

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  3 +++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  3 +++
 drivers/gpu/drm/msm/msm_drv.c            | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h            |  1 +
 4 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aa9e0ad33ebb..8f11a98491a1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1276,6 +1276,9 @@ static int dpu_dev_probe(struct platform_device *pdev)
 	int irq;
 	int ret = 0;
 
+	if (!msm_disp_drv_should_bind(&pdev->dev, true))
+		return -ENODEV;
+
 	dpu_kms = devm_kzalloc(dev, sizeof(*dpu_kms), GFP_KERNEL);
 	if (!dpu_kms)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 0827634664ae..43d05851c54d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -866,6 +866,9 @@ static int mdp5_dev_probe(struct platform_device *pdev)
 
 	DBG("");
 
+	if (!msm_disp_drv_should_bind(&pdev->dev, false))
+		return -ENODEV;
+
 	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
 	if (!mdp5_kms)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 50b65ffc24b1..ef57586fbeca 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -969,6 +969,37 @@ static int add_components_mdp(struct device *master_dev,
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
index 01e783130054..762e13e2df74 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -563,5 +563,6 @@ int msm_drv_probe(struct device *dev,
 	struct msm_kms *kms);
 void msm_kms_shutdown(struct platform_device *pdev);
 
+bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
 
 #endif /* __MSM_DRV_H__ */

-- 
2.39.2

