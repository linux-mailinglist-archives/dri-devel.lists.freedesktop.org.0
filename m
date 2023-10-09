Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 882B17BE903
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F4210E2B5;
	Mon,  9 Oct 2023 18:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E2410E2B6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:50 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50585357903so6358555e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875049; x=1697479849; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D0cKqSV9NbSgEqSOU6qXa8xSoVPQYmAEiFyAsqDd81w=;
 b=ABfIiiEgNXfzSPFN8UcRuSGYNEMn9VhhAlp9b/Q16FwXUfQKDYKgF6WfYt3YADem7S
 PZO+plyJffeyLdKc+pRq1tShBouGBluZc+OlSI6gaufqZF0dr+ZAu7Jv2vX+hExCb/xM
 Ckxf8dPix2mntiPc8bKxZpTf2SmyE2zQiRjGcVmXKmMhOPHGYmh6DZ0wW7nvM9VwnlWh
 I4Ki6q7zgC6qsLeMg+gpTWVCHbgWGQdM/DxAdk8FMokLPI6q1F9tfOBJLuLRzia0aihP
 fqhROjb13g98peWWPzpqHaQfeezZ4G7cndpGJv//FzBewf/HdXaTobz+TmBRSbR2RL/R
 TB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875049; x=1697479849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D0cKqSV9NbSgEqSOU6qXa8xSoVPQYmAEiFyAsqDd81w=;
 b=FwAXAiAvCpQndbSBV5oyoxTQvIoi8NUetX/hRR1/2i7e/su3GRE+5ZZlhSAzGInILE
 NdAx1rXMu44gyohlqEgPNzxZZdY5mQOhpH8+DO4KrFL27GwMvsQdQrNmBn8HtmfAvxjB
 HQAEJ/LaHBQWSyve4oSMVOkRNcUuNdKH7Y2rze2ZsSXgFeFmA7Qfb+kMNsrIGUc5scoL
 l+r7MKCez/09CE4xldBGfStmKnmTPdmJoDIl5F7KstU3DiFnNPQbKFDyU60T7LG8CJMa
 WRs+vtT2RHrTylrevpQuaeRGRuPphR7anj+EZeTdAA0yZ7HCSPs5csLHlKzoNqRbF5N8
 xvJA==
X-Gm-Message-State: AOJu0YxA9S4Gli38WybUA82U21O/NIniq17N81dO8K2HgQjUYU3Y8bLW
 fd6yUu/6r5MnLQGvCn/6MrU92A==
X-Google-Smtp-Source: AGHT+IGjsZpPnq1qFxWqGVR/Mczr22fdRGnVqbtgHDPrubrJj1BfM24m7lxX3TfFDZBnuN9hSztSOA==
X-Received: by 2002:a19:a414:0:b0:502:a55b:c2d7 with SMTP id
 q20-20020a19a414000000b00502a55bc2d7mr13573712lfc.60.1696875049054; 
 Mon, 09 Oct 2023 11:10:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 09/13] drm/msm: rename msm_drv_shutdown() to
 msm_kms_shutdown()
Date: Mon,  9 Oct 2023 21:10:36 +0300
Message-Id: <20231009181040.2743847-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
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

The msm_drv_shutdown function should only be used in the KMS case.
Rename it accordingly.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 2 +-
 drivers/gpu/drm/msm/msm_drv.h            | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1f06c0c36533..fe7267b3bff5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1370,7 +1370,7 @@ MODULE_DEVICE_TABLE(of, dpu_dt_match);
 static struct platform_driver dpu_driver = {
 	.probe = dpu_dev_probe,
 	.remove_new = dpu_dev_remove,
-	.shutdown = msm_drv_shutdown,
+	.shutdown = msm_kms_shutdown,
 	.driver = {
 		.name = "msm_dpu",
 		.of_match_table = dpu_dt_match,
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 386f61556789..4ba1cb74ad76 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -570,7 +570,7 @@ MODULE_DEVICE_TABLE(of, mdp4_dt_match);
 static struct platform_driver mdp4_platform_driver = {
 	.probe      = mdp4_probe,
 	.remove_new = mdp4_remove,
-	.shutdown   = msm_drv_shutdown,
+	.shutdown   = msm_kms_shutdown,
 	.driver     = {
 		.name   = "mdp4",
 		.of_match_table = mdp4_dt_match,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index d936b6b958d1..11d9fc2c6bf5 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -975,7 +975,7 @@ MODULE_DEVICE_TABLE(of, mdp5_dt_match);
 static struct platform_driver mdp5_driver = {
 	.probe = mdp5_dev_probe,
 	.remove_new = mdp5_dev_remove,
-	.shutdown = msm_drv_shutdown,
+	.shutdown = msm_kms_shutdown,
 	.driver = {
 		.name = "msm_mdp",
 		.of_match_table = mdp5_dt_match,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c2f989d1ff42..8079f408c9ed 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1278,7 +1278,7 @@ static void msm_pdev_remove(struct platform_device *pdev)
 	component_master_del(&pdev->dev, &msm_drm_ops);
 }
 
-void msm_drv_shutdown(struct platform_device *pdev)
+void msm_kms_shutdown(struct platform_device *pdev)
 {
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *drm = priv ? priv->dev : NULL;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index a28d93c09492..cd5bf658df66 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -569,7 +569,7 @@ void msm_kms_pm_complete(struct device *dev);
 int msm_drv_probe(struct device *dev,
 	int (*kms_init)(struct drm_device *dev),
 	struct msm_kms *kms);
-void msm_drv_shutdown(struct platform_device *pdev);
+void msm_kms_shutdown(struct platform_device *pdev);
 
 
 #endif /* __MSM_DRV_H__ */
-- 
2.39.2

