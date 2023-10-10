Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6817BF283
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 07:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3814510E21E;
	Tue, 10 Oct 2023 05:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C1F10E21E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 05:54:28 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-503065c4b25so7025355e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 22:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696917266; x=1697522066; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QEUI7WElxyrFqo5uc28jvvLJFsc02bWiPPqj3cviB+U=;
 b=sSM3RybzMb5kpbyxds/N++WpiwE+00M3H42N2h9WeY6E99D6GcAFKRqIhYv8MHM+wK
 gxxQOzylph2BDgYesDOkv0buSRTLRmSiubbUvI1RzqA5dLPC0fETTlw93d2/TEC+YAPH
 diyQQYcQvFPxUHr1eobYKEdKO1OyYRYhzsccJQ4fjU73ryVUoliVsyyT4eJZBagDWUBT
 IDXQZcoM7+mjVSTNGia9ZFair1XXGUqW1rG2lvR+Ngx/Zrb51LqQAiWay/p0gdEbqwgx
 m5oG8kYw6jNJ901BowlmXJkVLtWBnT5mUXu56INOgOkFQ5qsHQhuTGhhMSCzWhvHX7va
 Q2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696917266; x=1697522066;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QEUI7WElxyrFqo5uc28jvvLJFsc02bWiPPqj3cviB+U=;
 b=g3hmmVdJHrMbon+qYsHQtSS+9e3GabTS1kIZLhiRfQcvuHZYfsK8XjrB6yZSvuSgFj
 +wi3gcecn4UlN54D9lJXFs0p84J093cmvwAEuTiI8HIIVy+sI+VxiDh9POrgIK4EFjgo
 EG25CZGA2dG2Sq7xiyN4Z9nakqG29JbV1o7QfHAUuX4XkvqiDC///C1DonO30wPZXDiT
 YS4kFoORq3isALpFbV94bVfrfR2rpjCYq3aQViqw/uSQys+QyceW5LdstfZE6vLNbGvg
 NzL/E+0FSioL+D9nnFTcNL/X0/5BjPNz3LpvKFiKr1GN7Dci8is86mouZZuAKt+5d4EU
 yLrQ==
X-Gm-Message-State: AOJu0YwtISyyDCdSWw86pgjFYnMYhgVpmbVuYy4pzImkMLKwsfD5JalN
 PsrkzQFynrZcRmRWa3i5RHjD/A==
X-Google-Smtp-Source: AGHT+IGieqVKjLlnVHtcDymyKdRInCVinttJ4Uwo0Ld2tiGJ7uOdN5rtYPVDF6+cDspnRVciNuzVWg==
X-Received: by 2002:a05:6512:758:b0:503:59d:fbff with SMTP id
 c24-20020a056512075800b00503059dfbffmr6273168lfs.2.1696917266417; 
 Mon, 09 Oct 2023 22:54:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v2-20020ac25582000000b004fe1f1c0ee4sm1668371lfg.82.2023.10.09.22.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 22:54:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm: don't create GPU-related debugfs files with no GPU
 present
Date: Tue, 10 Oct 2023 08:54:25 +0300
Message-Id: <20231010055425.2851776-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

If there is no GPU present, skip creation of the GPU-related debugfs
files, making the MSM's debugfs more usable.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 41 +++++++++++++++++++------------
 drivers/gpu/drm/msm/msm_rd.c      |  3 +++
 2 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 04d304eed223..4494f6d1c7cb 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -304,36 +304,21 @@ int msm_debugfs_late_init(struct drm_device *dev)
 	return ret;
 }
 
-void msm_debugfs_init(struct drm_minor *minor)
+static void msm_debugfs_gpu_init(struct drm_minor *minor)
 {
 	struct drm_device *dev = minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dentry *gpu_devfreq;
 
-	drm_debugfs_create_files(msm_debugfs_list,
-				 ARRAY_SIZE(msm_debugfs_list),
-				 minor->debugfs_root, minor);
-
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
-	if (priv->kms) {
-		drm_debugfs_create_files(msm_kms_debugfs_list,
-					 ARRAY_SIZE(msm_kms_debugfs_list),
-					 minor->debugfs_root, minor);
-		debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
-				    dev, &msm_kms_fops);
-	}
-
 	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
 		&priv->hangcheck_period);
 
 	debugfs_create_bool("disable_err_irq", 0600, minor->debugfs_root,
 		&priv->disable_err_irq);
 
-	debugfs_create_file("shrink", S_IRWXU, minor->debugfs_root,
-		dev, &shrink_fops);
-
 	gpu_devfreq = debugfs_create_dir("devfreq", minor->debugfs_root);
 
 	debugfs_create_bool("idle_clamp",0600, gpu_devfreq,
@@ -344,6 +329,30 @@ void msm_debugfs_init(struct drm_minor *minor)
 
 	debugfs_create_u32("downdifferential",0600, gpu_devfreq,
 			   &priv->gpu_devfreq_config.downdifferential);
+}
+
+void msm_debugfs_init(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+
+	drm_debugfs_create_files(msm_debugfs_list,
+				 ARRAY_SIZE(msm_debugfs_list),
+				 minor->debugfs_root, minor);
+
+	if (priv->gpu_pdev)
+		msm_debugfs_gpu_init(minor);
+
+	if (priv->kms) {
+		drm_debugfs_create_files(msm_kms_debugfs_list,
+					 ARRAY_SIZE(msm_kms_debugfs_list),
+					 minor->debugfs_root, minor);
+		debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
+				    dev, &msm_kms_fops);
+	}
+
+	debugfs_create_file("shrink", S_IRWXU, minor->debugfs_root,
+		dev, &shrink_fops);
 
 	if (priv->kms && priv->kms->funcs->debugfs_init)
 		priv->kms->funcs->debugfs_init(priv->kms, minor);
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 5adc51f7ab59..ca44fd291c5b 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -270,6 +270,9 @@ int msm_rd_debugfs_init(struct drm_minor *minor)
 	struct msm_rd_state *rd;
 	int ret;
 
+	if (!priv->gpu_pdev)
+		return 0;
+
 	/* only create on first minor: */
 	if (priv->rd)
 		return 0;
-- 
2.39.2

