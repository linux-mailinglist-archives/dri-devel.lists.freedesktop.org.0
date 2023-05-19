Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EB2709B9A
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 17:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34DB10E123;
	Fri, 19 May 2023 15:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F32E10E112
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 15:49:42 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ac7462d9f1so39215811fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 08:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684511380; x=1687103380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZH+xIBGRFydG8VrF7CTkUuT849ThU7IR5DwJqTeGGlA=;
 b=RSpFoRRlhzOBQzGPQ6TGHNuGCmB8p762QhRJxbXGpZHu01SRRIk8tUN5tF4gRWm5X2
 itmZqdurbcgStQVkNFA5lsjjO6ypziKWD5hYIdCwh0C9wsV2H9NRieoxLShbg3uoZ2as
 EG2afUwPw57NXkv1x32D8B6tldVhC5Rz+xmM747AD7lG8imcbcbLMqT7S1B0KbIyXZC9
 5tKLHTjx16StbpDp+RfzLfm1kvD+5dhwL20JRiMzUrAOMp3iGWGc3tCpcLWVSExDkFLb
 9ro5rsc3aqYCZWk8A394wbfS2QeF5beqlhtnS+apJV7heo//Xf3JHH+OlaR35udiMZn5
 bgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684511380; x=1687103380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZH+xIBGRFydG8VrF7CTkUuT849ThU7IR5DwJqTeGGlA=;
 b=hr2zOuXXkyWn2TQfVEbm0QrptWteGVDg08R6r4cxUbDis3DbsiV1qQGZE+uJz+11BW
 Np/Y906gWtOtibTHnks6FmYeGoMBqVG5MY2j+ySM6nvW2QsA/F04ugsrao4HYJRVebMD
 +SOQZikazisfFT31j1t/Xv225ZG3qFAfjUGgBbJOeLzIPrNIXdspKRYVUpe1+HfEF+dO
 q5vewJBd2MRLAZ7DQsb9KNvZVASkwU+f3Jv+EzJlU2em0OpPgsKWX/lQ/pM2/hK7eBlB
 8qPmk42PP6z66hACpYCInHeX/VhZb2dkND3q2utODSedQsNyJUFAXdHOzu9l6yH1qc8d
 LHKA==
X-Gm-Message-State: AC+VfDzrjv6TKno8LnuaDhVLus8dULW8tgExJyLR9/MuD7LJsO+8YLCa
 FVJcMTJsjBj67mTIta3/nwDNCQ==
X-Google-Smtp-Source: ACHHUZ64Pcb/JekoQT4SE65mTQYsCAV7YbPuMV/NrOrePtdT8wB8DJ5IhBVWP38S8jGAEiWfD9ECeA==
X-Received: by 2002:a2e:9cc6:0:b0:2ab:19a0:667b with SMTP id
 g6-20020a2e9cc6000000b002ab19a0667bmr1100421ljj.0.1684511380648; 
 Fri, 19 May 2023 08:49:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a2e96d6000000b002ab59a09d75sm873333ljj.120.2023.05.19.08.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 08:49:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 2/4] drm/msm/dpu: move resource allocation to the _probe
 function
Date: Fri, 19 May 2023 18:49:36 +0300
Message-Id: <20230519154938.3929839-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519154938.3929839-1-dmitry.baryshkov@linaro.org>
References: <20230519154938.3929839-1-dmitry.baryshkov@linaro.org>
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

To let the probe function bail early if any of the resources is
unavailable, move resource allocattion from kms_init directly to the
probe callback. While we are at it, replace irq_of_parse_and_map() with
platform_get_irq().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 64 ++++++++++++-------------
 1 file changed, 31 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ec6fb8634196..23f0dbd2dfa1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1159,33 +1159,11 @@ static int dpu_kms_init(struct drm_device *ddev)
 	struct msm_drm_private *priv = ddev->dev_private;
 	struct device *dev = ddev->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct dpu_kms *dpu_kms;
-	int irq;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct dev_pm_opp *opp;
 	int ret = 0;
 	unsigned long max_freq = ULONG_MAX;
 
-	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
-	if (!dpu_kms)
-		return -ENOMEM;
-
-	ret = devm_pm_opp_set_clkname(dev, "core");
-	if (ret)
-		return ret;
-	/* OPP table is optional */
-	ret = devm_pm_opp_of_add_table(dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(dev, "invalid OPP table in device tree\n");
-		return ret;
-	}
-
-	ret = devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
-	if (ret < 0) {
-		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
-		return ret;
-	}
-	dpu_kms->num_clocks = ret;
-
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
@@ -1203,21 +1181,41 @@ static int dpu_kms_init(struct drm_device *ddev)
 	pm_runtime_enable(&pdev->dev);
 	dpu_kms->rpm_enabled = true;
 
-	priv->kms = &dpu_kms->base;
-
-	irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
-	if (!irq) {
-		DPU_ERROR("failed to get irq\n");
-		return -EINVAL;
-	}
-	dpu_kms->base.irq = irq;
-
 	return 0;
 }
 
 static int dpu_dev_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, dpu_kms_init, NULL);
+	struct device *dev = &pdev->dev;
+	struct dpu_kms *dpu_kms;
+	int irq;
+	int ret = 0;
+
+	dpu_kms = devm_kzalloc(dev, sizeof(*dpu_kms), GFP_KERNEL);
+	if (!dpu_kms)
+		return -ENOMEM;
+
+	ret = devm_pm_opp_set_clkname(dev, "core");
+	if (ret)
+		return ret;
+	/* OPP table is optional */
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to parse clocks\n");
+
+	dpu_kms->num_clocks = ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "failed to get irq\n");
+
+	dpu_kms->base.irq = irq;
+
+	return msm_drv_probe(&pdev->dev, dpu_kms_init, &dpu_kms->base);
 }
 
 static int dpu_dev_remove(struct platform_device *pdev)
-- 
2.39.2

