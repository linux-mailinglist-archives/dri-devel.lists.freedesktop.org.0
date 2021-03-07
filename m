Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C8532FFEF
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 10:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE7A6E58E;
	Sun,  7 Mar 2021 09:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE146E588
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 09:45:37 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d15so8120323wrv.5
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Mar 2021 01:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RsjSwA8oB0o8PW0ry99uhxTdXQdH9BOaf5mimdTgeO0=;
 b=cEZv1N9MT1tvcp5XXBU/gC/3IF30iDxLCSKZoGWnZBDvfMPIl/dDWocdAT518rBLib
 z9GfFnD7Vw4DdcLo6XWQ69SwwDSUG75kHjUnPLaR9OU6WdnNycO7Y8roscN1sMew0W9T
 n8yaXirXJTt640L5dqM2zyhVlDKbypVDKJQaCWeDlzBGnB0Kgf9RSTU5UjKuiLHebEyY
 ks0eFoAg7C0H4/gHHMtVmELgLhiqLCw6imgeP39zDlV+mzjWx5brsNRbSimT+hhXNZbn
 eXtGNYNgtSSGjIQJgD4xKtTyeRERc0I4pQTAdASh53z2pnWyPnR0IeaLzGxLmbuU9/CF
 jyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RsjSwA8oB0o8PW0ry99uhxTdXQdH9BOaf5mimdTgeO0=;
 b=rgTpi0ku7SgDslTrlgTBWlE+a1eV2zwzaP60OZvMN2h6UWG2WK2hqXRXvmjr0NNNvs
 RtGJcWVYah3SJhExr/m2flTgDRiAPBTNsuTYtgIOf2TFo5vX4Fa8x+YBrjYby7JSZkgQ
 vD9o8mSB1+PZ3hZIy5PUk8BPs8cUT4ZGf9vZGl58b2DUNunmSglwl5tfbhg+QVdSiM9/
 ZEJQF7I5+KB4gFMxt9jaftskLMB1WHaleQL0vH3CCJ/yKJdnnlPlB3+Q4/JyMGEpyMT8
 Ck5Ano1MNxu6schHpPf3VDLVPYr2Rm+hcIDEGjmIqV5mLwVofJR3CdqacIebg4+436Br
 X9VQ==
X-Gm-Message-State: AOAM533n1tODaF/m/G53hgyMwnp7rUjVsIctjxvHMdrwtqgdV1VvJLPu
 vJ5H53SELPbeYCNdYUsfuwfFpg==
X-Google-Smtp-Source: ABdhPJwXs/r34f0ulXMj7OuQIK3/3Xk18RKjsq+HUnzr5igiGn4bAPSoScW19dqf/oqDuniL3Vtm2Q==
X-Received: by 2002:adf:a59a:: with SMTP id g26mr17670383wrc.271.1615110336310; 
 Sun, 07 Mar 2021 01:45:36 -0800 (PST)
Received: from localhost.localdomain
 (lns-bzn-59-82-252-141-80.adsl.proxad.net. [82.252.141.80])
 by smtp.gmail.com with ESMTPSA id z7sm12790737wrt.70.2021.03.07.01.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 01:45:35 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: cwchoi00@gmail.com
Subject: [PATCH v3 2/4] devfreq/drivers/msm: Use devfreq cooling device
 registration
Date: Sun,  7 Mar 2021 10:45:16 +0100
Message-Id: <20210307094519.9032-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210307094519.9032-1-daniel.lezcano@linaro.org>
References: <20210307094519.9032-1-daniel.lezcano@linaro.org>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, linux-pm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 steven.price@arm.com, Sean Paul <sean@poorly.run>, lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The devfreq core code is able to register the devfreq device as a
cooling device if the 'is_cooling_device' flag is set in the profile.

Use this flag and remove the cooling device registering code.

Tested on dragonboard 845c

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 12 +-----------
 drivers/gpu/drm/msm/msm_gpu.h |  2 --
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index ab7c167b0623..eade94271a60 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -14,7 +14,6 @@
 #include <generated/utsrelease.h>
 #include <linux/string_helpers.h>
 #include <linux/devfreq.h>
-#include <linux/devfreq_cooling.h>
 #include <linux/devcoredump.h>
 #include <linux/sched/task.h>
 
@@ -82,6 +81,7 @@ static struct devfreq_dev_profile msm_devfreq_profile = {
 	.target = msm_devfreq_target,
 	.get_dev_status = msm_devfreq_get_dev_status,
 	.get_cur_freq = msm_devfreq_get_cur_freq,
+	.is_cooling_device = true,
 };
 
 static void msm_devfreq_init(struct msm_gpu *gpu)
@@ -112,14 +112,6 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
 	}
 
 	devfreq_suspend_device(gpu->devfreq.devfreq);
-
-	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
-			gpu->devfreq.devfreq);
-	if (IS_ERR(gpu->cooling)) {
-		DRM_DEV_ERROR(&gpu->pdev->dev,
-				"Couldn't register GPU cooling device\n");
-		gpu->cooling = NULL;
-	}
 }
 
 static int enable_pwrrail(struct msm_gpu *gpu)
@@ -1056,6 +1048,4 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 	if (gpu->worker) {
 		kthread_destroy_worker(gpu->worker);
 	}
-
-	devfreq_cooling_unregister(gpu->cooling);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d7cd02cd2109..93419368bac8 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -155,8 +155,6 @@ struct msm_gpu {
 	struct msm_gpu_state *crashstate;
 	/* True if the hardware supports expanded apriv (a650 and newer) */
 	bool hw_apriv;
-
-	struct thermal_cooling_device *cooling;
 };
 
 static inline struct msm_gpu *dev_to_gpu(struct device *dev)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
