Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE1A747804
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 19:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF66510E30E;
	Tue,  4 Jul 2023 17:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735D610E16B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 17:45:57 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fba8f2197bso6085976e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 10:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688492755; x=1691084755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y62jOGwoLkRx2s8sLUVgr34ikoHyPLMwXSSE5xWIknI=;
 b=TzUDS4NIWLhl82RJllpN7bNhIQfbbewvB9BnnPSJSh6j6kC268hgdUxSjOr2cBr1NS
 kL1Y7IrSyuNTVhYOU8EJOqZ5Q5s6W8/OnQfPK3FdWkQ3cnqJ32hstOMNBtQsGW9i+b6H
 KSf0WBXxavQScz9MWkXKbUsq5Ily6k+9dmxFtkROCaS9dHBBkXJYZ9MxCZ7lMmjhzqQn
 Xxl2CDlxbfplITulEq8PbpPfIqWmgAMY98/3AbFeaNTJ8GUpw8GKdgkX6vdbECAGs/nq
 2NEOfm6UjrF3GgiYlTDgEGBKbv8Sgnm4OFl/a7/uara+tA28qsof/p9BpTWKRb6RmdU1
 MBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688492755; x=1691084755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y62jOGwoLkRx2s8sLUVgr34ikoHyPLMwXSSE5xWIknI=;
 b=cMjhp+T0oBxri64AS5kRTuLIz6oXSoATbJFx+PNbmgWM3M5bn/df4MMAA1XJm53jyV
 M74Go8jBvt3eeyfaGArWe6gvA0EyR1iA5Vvvz0E+SVX13gG5HB3nBS1v5Bg1G4SQ3qMi
 Ju21aleFHWye3lsYOl/pnuhMv4KYBJ+CmoGqqAEaoRa160LtEwlZXgMdpOEKFODoRZA9
 CRexqiHDbYwbqSCRb5vacFDbWW4Vy9jI+eGtMOupqxAAvcOLKBjtp1lLAo7nEjRAlH5o
 usxFaaup2+AhdViZCbBU28t8ABvK2Vm8YsbN0pxi7QIRYwK4YGhr4Fo8Sm+O7Mzjsetu
 WYqg==
X-Gm-Message-State: ABy/qLaOLdY6qivjr7GMh+1g82FT1HCK0efmqMb7RzpsbKT5UMZI4pgs
 vy+D5NsLyY9VWqo+eWepe0tYNg==
X-Google-Smtp-Source: APBJJlHl2m3O9Fnv7tb/dTtAFgub1GypmSBUjcod6x0kEY0TXWJrS6A9DSMeCkYlCzs89du3buKWCQ==
X-Received: by 2002:ac2:5e2c:0:b0:4fb:81f2:4228 with SMTP id
 o12-20020ac25e2c000000b004fb81f24228mr8458767lfg.31.1688492755392; 
 Tue, 04 Jul 2023 10:45:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a195519000000b004fb6c61e79bsm4709779lfe.117.2023.07.04.10.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 10:45:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 1/4] drm/msm: allow passing struct msm_kms to
 msm_drv_probe()
Date: Tue,  4 Jul 2023 20:45:50 +0300
Message-Id: <20230704174553.216248-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704174553.216248-1-dmitry.baryshkov@linaro.org>
References: <20230704174553.216248-1-dmitry.baryshkov@linaro.org>
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

In preparation of moving resource allocation to the probe time, allow
MSM KMS drivers to pass struct msm_kms pointer via msm_drv_probe().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 6 ++++--
 drivers/gpu/drm/msm/msm_drv.h            | 3 ++-
 5 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 44b0daf70c4e..22e5b430770e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1244,7 +1244,7 @@ static int dpu_kms_init(struct drm_device *ddev)
 
 static int dpu_dev_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, dpu_kms_init);
+	return msm_drv_probe(&pdev->dev, dpu_kms_init, NULL);
 }
 
 static int dpu_dev_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 6e37072ed302..e57a1e5f9da0 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -558,7 +558,7 @@ static const struct dev_pm_ops mdp4_pm_ops = {
 
 static int mdp4_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, mdp4_kms_init);
+	return msm_drv_probe(&pdev->dev, mdp4_kms_init, NULL);
 }
 
 static int mdp4_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 323079cfd698..83a5b3bd09d9 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -939,7 +939,7 @@ static int mdp5_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return msm_drv_probe(&pdev->dev, mdp5_kms_init);
+	return msm_drv_probe(&pdev->dev, mdp5_kms_init, NULL);
 }
 
 static int mdp5_dev_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 891eff8433a9..f06a06ab26fa 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1233,7 +1233,8 @@ const struct component_master_ops msm_drm_ops = {
 };
 
 int msm_drv_probe(struct device *master_dev,
-	int (*kms_init)(struct drm_device *dev))
+	int (*kms_init)(struct drm_device *dev),
+	struct msm_kms *kms)
 {
 	struct msm_drm_private *priv;
 	struct component_match *match = NULL;
@@ -1243,6 +1244,7 @@ int msm_drv_probe(struct device *master_dev,
 	if (!priv)
 		return -ENOMEM;
 
+	priv->kms = kms;
 	priv->kms_init = kms_init;
 	dev_set_drvdata(master_dev, priv);
 
@@ -1278,7 +1280,7 @@ int msm_drv_probe(struct device *master_dev,
 
 static int msm_pdev_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, NULL);
+	return msm_drv_probe(&pdev->dev, NULL, NULL);
 }
 
 static int msm_pdev_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e13a8cbd61c9..6787bd302dfa 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -562,7 +562,8 @@ int msm_pm_prepare(struct device *dev);
 void msm_pm_complete(struct device *dev);
 
 int msm_drv_probe(struct device *dev,
-	int (*kms_init)(struct drm_device *dev));
+	int (*kms_init)(struct drm_device *dev),
+	struct msm_kms *kms);
 void msm_drv_shutdown(struct platform_device *pdev);
 
 
-- 
2.39.2

