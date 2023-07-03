Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 994A7745356
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 02:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7BB10E194;
	Mon,  3 Jul 2023 00:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559F510E188
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 00:37:58 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b6a1fe5845so58383121fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 17:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344676; x=1690936676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QKBTuSmWc6m/vBhUXH7Ge8kqDNa4v+VkPqYeWVoQJxE=;
 b=D2KKaR54BK7dLTNQL+gPJYFHqB2bXzAxJo0VXg5ldZk8aDJu5TD5HO31aH8PjbaP7F
 VEFhSwNTxKFGyfq+6yu18fIWmq7Xr4DPYaLvNZ2euPW/BwjalfU8fItSeyrgwOIppQZx
 nCu3I7AG6J7LVVHy+cYAhaSyGt+KGAVfeSQe7vwiLwUaWBal9vy+s3Uhim92zVeN/dO0
 k6YZSy2HdM3PvJZKganTMI74ywq4EMJP07Vc5rVlCAuQwjvPqjYe8XCiMqn7VRFQAE8L
 lnuNtbFXdXoEJUOHQe3BYIJNernXz1oFnMY95ltWjnRqnEMxOTTVlNo6IcX+SH+oxx2M
 41yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344676; x=1690936676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QKBTuSmWc6m/vBhUXH7Ge8kqDNa4v+VkPqYeWVoQJxE=;
 b=k2k3qofOL9FAxip6aintzOhcgGqOvO2fzvfN0wFsnYD6uaYWjnZswo5Z9owHb28Qm8
 Sp5MiGSUfqYufQ+vUXYvKBLjjbS04P1jmAo5o8/uHRe0KmHy7+YNpkXTx1T+P7UggMql
 f8A/ZXojYmf+035e/GL1kAwLRIHkgwgOILo67/z1PIcq4tvphuQhcIskiooy46fCgYEw
 0NBASfQdXwXoP2uGqsD3kT8o9v9JtAyHKrPUAgn7Lr0GGm7ZhBs2uK2dohD604dwhvvN
 VaAL2R+Tzv7Xl8siTtFuLdLKZBf+YOcfZBIgp5XAc/o7eP3bBqp583evm6sFqPscmOFL
 uBnQ==
X-Gm-Message-State: ABy/qLZ6cf1GfYSD1Z5groZ4ByvwOg5V30Pe/4I3UWHCGcl1Ara88StE
 M5YRiqgUP2ecEZ1fBhETuMFLow==
X-Google-Smtp-Source: APBJJlE6U0fecDvP6B4B/j7NsX8K79v1J/m+hXQSir44s2OaIGnsJVjeEfunwHF45FXBM+kmeDs58g==
X-Received: by 2002:a2e:3508:0:b0:2b6:98c3:7a70 with SMTP id
 z8-20020a2e3508000000b002b698c37a70mr5451330ljz.41.1688344676723; 
 Sun, 02 Jul 2023 17:37:56 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:37:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 12/13] drm/msm: make fb debugfs file available only in KMS case
Date: Mon,  3 Jul 2023 03:37:44 +0300
Message-Id: <20230703003745.34239-13-dmitry.baryshkov@linaro.org>
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

Don't register the 'fb' debugfs file, if there is no KMS (and so no
framebuffers).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 06fc632fd6f9..04d304eed223 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -266,6 +266,9 @@ static int msm_fb_show(struct seq_file *m, void *arg)
 static struct drm_info_list msm_debugfs_list[] = {
 		{"gem", msm_gem_show},
 		{ "mm", msm_mm_show },
+};
+
+static struct drm_info_list msm_kms_debugfs_list[] = {
 		{ "fb", msm_fb_show },
 };
 
@@ -314,9 +317,13 @@ void msm_debugfs_init(struct drm_minor *minor)
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
-	if (priv->kms)
+	if (priv->kms) {
+		drm_debugfs_create_files(msm_kms_debugfs_list,
+					 ARRAY_SIZE(msm_kms_debugfs_list),
+					 minor->debugfs_root, minor);
 		debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
 				    dev, &msm_kms_fops);
+	}
 
 	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
 		&priv->hangcheck_period);
-- 
2.39.2

