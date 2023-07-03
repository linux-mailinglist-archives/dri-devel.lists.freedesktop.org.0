Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3B274532A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 02:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED2C10E031;
	Mon,  3 Jul 2023 00:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1062610E052
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 00:30:56 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fbb281eec6so598005e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 17:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344254; x=1690936254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0n5FtC+50bNsy4SKzGEQxGG7e1PPeSIPc20pAD3cUxA=;
 b=TKRz2NNKPzKQmvjlvpt4busNxd9VJWOHPnwEk3AJEdpDcDZdi/yEZoGW99+G6v9teT
 uiz4jQ6qbNUmZazILA1GhNHBiob24OSNnOxNybHMwitQwGSNzKuONcswQXBb5gWotI/5
 nX0ltIkS3yJKu4gppc0AZptr6ORlv7QCEBOdzCwGysgok7OhKVMqUbDnFbGTnw26Aczy
 VfUROrSq9LmtgEThO4Kj75k6bLSCD1ezcQixmtFzqIFhFE4xu8g1UwBs8kfMI5nXS/yC
 p36EWcWumYf9zsz/Sq+2K/23b9TSfSDEW76YmkypjTIj+I8xiannUPQt8O547/c+2nw+
 XCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344254; x=1690936254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0n5FtC+50bNsy4SKzGEQxGG7e1PPeSIPc20pAD3cUxA=;
 b=P1uBIj1bVI5hNamJmAaoMCKLQkVbLQ29mFXncMegA2bavpMQg1MWbIBsdeexZOYLvi
 QjyrIIjCYwJh1ZxsLZ+ig20V6MGS3UGPoOBsk8ipNqqTvJjJG3HRRZWyqhR9faqEkdQ9
 XmpWLIOTTmU5XpXxb+lZLt2yEDwQfJk4SWmkh5O69Yt9yaPkUqSUYqrOBnB2zKTqafMN
 0JSOguj//bRddIFQcTzUfq7wQu3QzEq6R+Z2FGxs/x+ptt97ceuvkSGtA0Ov3vABu3CH
 +gwj/me1Lu4/+hy9xtnSzbgIpemuqVnvIAmIWVXJW7UYBv06E7C7a987zs68X2VF4k8U
 ZEBg==
X-Gm-Message-State: ABy/qLY2eP2jRGUAdn4vbeVvYcgMIa1FBL3aQUzWzC9mCdcZ+m8OhRnK
 KfSi3jPqCtmGlpB02b+FHJRsXQ==
X-Google-Smtp-Source: APBJJlGFRq2p2K9TPaFrx9totr556c2v7SQbLqaUwVckm4zEs7DjiLVlfLjMdMAQI1ALbKT6NFrDzA==
X-Received: by 2002:a05:6512:2397:b0:4fb:a0ec:983f with SMTP id
 c23-20020a056512239700b004fba0ec983fmr7466543lfv.14.1688344254064; 
 Sun, 02 Jul 2023 17:30:54 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 n2-20020ac24902000000b004fbb1bc1ae0sm558842lfi.163.2023.07.02.17.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:30:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 1/4] drm/msm: allow passing struct msm_kms to
 msm_drv_probe()
Date: Mon,  3 Jul 2023 03:30:48 +0300
Message-Id: <20230703003051.33361-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003051.33361-1-dmitry.baryshkov@linaro.org>
References: <20230703003051.33361-1-dmitry.baryshkov@linaro.org>
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
index aa8499de1b9f..61716625c172 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1236,7 +1236,7 @@ static int dpu_kms_init(struct drm_device *ddev)
 
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

