Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76601745353
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 02:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4BA10E181;
	Mon,  3 Jul 2023 00:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F3C10E160
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 00:37:54 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b699a2fe86so63351741fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 17:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344672; x=1690936672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dWhFZIVk6jmTe7cLijy1h6IIQ5YlvCfQh9mJf+Vzxo4=;
 b=SH7IrH68+0rT6/+5nwk7nTj/U4K3RXLgJ+aOZfE81WOp/sITptOIOs2a9tArBO2Qrt
 YxA3Y8n5ffJ8LLaIi4u82eg3nuPZVN4nmHBQn4Sl+vQIHgyJdRM0aozSFG+CH0xAFVq2
 Gih+U2ubtXLUBFeXDqEf8to/jAqMot+JSHf3HHJYN2zUWESwCsKOW54w/MiBZ+P4tJXN
 uXbMXE27r0zjdSYrYbmfLhB/VzvpruW9CqPdJ1mNqkybeQhOCPXBZAZK3lO5RdCSqAjb
 FKmQ+c08CUbe563llyszZaJOk+GtX1p/8JHlGOOUYEXuK4qT9wXlpjG7MJMwLKaeluck
 unjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344672; x=1690936672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dWhFZIVk6jmTe7cLijy1h6IIQ5YlvCfQh9mJf+Vzxo4=;
 b=O6djw5wEr3NVUJpLc6IBRwT5Vi3WBan+bc8Fl6rLIGbpOx6nSxnRpAe2PdM5N/PY0O
 8V7kYOzWFHf2LYw88gwQDAecbEi+4F9GTeZyIJvHsEcSxjuRHuC2cNLgLRmPk2KMDfAO
 UfihCZYgGpWJN87/mDk4bjqZ/dH0A6azG6aKHICVjB/xudWmKEN3l9rAw+863Y0X+xgM
 hV/DVNnoRr8EisL0Wuw+MDyFqHhhF8RAkwq9mRSr9NC2ScewrGZvTkk8udDZAbsrkLyJ
 ml1KiKTDUEE/PmkV1LCoQY7d0vS2JapBkc5zxGhF8EjoVRvuq1AfT2frlk4sY7BPQUPa
 Ut/g==
X-Gm-Message-State: ABy/qLYcD69guOTT6CaGwO9ih/m818YmR5SGwVX//CDNsOwVCbdWoi5v
 H67oMwGgfdI5uHlhSOQj+HITIw==
X-Google-Smtp-Source: APBJJlFaaeQC2D2v8hBgCFpbEqDjXpmZt8jdpr9h6CMFCCqDXLMkuRww3PL89GeZo/qLsVSYlEILhw==
X-Received: by 2002:a2e:6e18:0:b0:2b6:dc3a:a99f with SMTP id
 j24-20020a2e6e18000000b002b6dc3aa99fmr3021975ljc.17.1688344672582; 
 Sun, 02 Jul 2023 17:37:52 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:37:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 07/13] drm/msm: rename msm_pm_prepare/complete to note the KMS
 nature
Date: Mon,  3 Jul 2023 03:37:39 +0300
Message-Id: <20230703003745.34239-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
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

Rename the msm_pm_prepare() and msm_pm_complete() to
msm_kms_pm_prepare() and msm_kms_pm_complete() consequently.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 4 ++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 4 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 4 ++--
 drivers/gpu/drm/msm/msm_drv.c            | 4 ++--
 drivers/gpu/drm/msm/msm_drv.h            | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5b04c37c102f..8a5249907f53 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1293,8 +1293,8 @@ static const struct dev_pm_ops dpu_pm_ops = {
 	SET_RUNTIME_PM_OPS(dpu_runtime_suspend, dpu_runtime_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
-	.prepare = msm_pm_prepare,
-	.complete = msm_pm_complete,
+	.prepare = msm_kms_pm_prepare,
+	.complete = msm_kms_pm_complete,
 };
 
 static const struct of_device_id dpu_dt_match[] = {
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index a3f1da3382e8..302f3d10a464 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -501,8 +501,8 @@ static int mdp4_kms_init(struct drm_device *dev)
 }
 
 static const struct dev_pm_ops mdp4_pm_ops = {
-	.prepare = msm_pm_prepare,
-	.complete = msm_pm_complete,
+	.prepare = msm_kms_pm_prepare,
+	.complete = msm_kms_pm_complete,
 };
 
 static int mdp4_probe(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 52f176e08690..7572e8616961 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -961,8 +961,8 @@ static __maybe_unused int mdp5_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops mdp5_pm_ops = {
 	SET_RUNTIME_PM_OPS(mdp5_runtime_suspend, mdp5_runtime_resume, NULL)
-	.prepare = msm_pm_prepare,
-	.complete = msm_pm_complete,
+	.prepare = msm_kms_pm_prepare,
+	.complete = msm_kms_pm_complete,
 };
 
 static const struct of_device_id mdp5_dt_match[] = {
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index a85eb7b21061..ee27837516fc 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1101,7 +1101,7 @@ static const struct drm_driver msm_driver = {
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
-int msm_pm_prepare(struct device *dev)
+int msm_kms_pm_prepare(struct device *dev)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev = priv ? priv->dev : NULL;
@@ -1112,7 +1112,7 @@ int msm_pm_prepare(struct device *dev)
 	return drm_mode_config_helper_suspend(ddev);
 }
 
-void msm_pm_complete(struct device *dev)
+void msm_kms_pm_complete(struct device *dev)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev = priv ? priv->dev : NULL;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index deb5ee236a2a..67450dccc5a6 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -555,8 +555,8 @@ static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
 
 extern const struct component_master_ops msm_drm_ops;
 
-int msm_pm_prepare(struct device *dev);
-void msm_pm_complete(struct device *dev);
+int msm_kms_pm_prepare(struct device *dev);
+void msm_kms_pm_complete(struct device *dev);
 
 int msm_drv_probe(struct device *dev,
 	int (*kms_init)(struct drm_device *dev),
-- 
2.39.2

