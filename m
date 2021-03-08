Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F09330A17
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 10:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FAD6E839;
	Mon,  8 Mar 2021 09:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F376E83A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 09:16:55 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso3322595wma.4
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Mar 2021 01:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RsjSwA8oB0o8PW0ry99uhxTdXQdH9BOaf5mimdTgeO0=;
 b=bmwiWxXQpx0aH8Y1JRfU8sVz6lNXkdW+JYsyQlgEy0bY+Nx1Y22jgkg4FuOS24lhxP
 Yv1qvhP0veJ0owMDf0OKjWw/tpAAd6Tnll4Gq6wd4f8ClVzRx7AD3x2ugGbYrLDaqXUH
 h6+0vDlChooXIjty/kPzBjmRgCj1+rEgoA+rBL8b4sCoF2E8CBdt0efAT1EYcBeRQ0jP
 jMxwwZOSiMIEpkoiK983ccXCgTWdR5nts2w6ebWOKSlmM+XvgGfILljcDBU8L7iOuxTq
 D+ZQlnIjJJ3GZh1roccD5vjQ8U9/zZx73/HUYMtPSiqB2fsLM0NbtekxiDOT1JlQlxP3
 pzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RsjSwA8oB0o8PW0ry99uhxTdXQdH9BOaf5mimdTgeO0=;
 b=RVH9At1Wg0W4lP+wvwPq+qrGvvr96zMBYILhplsIAAwh3oLIlBguZRZ5oiTD1h1EmG
 NfU/hImV7O0x/8nDMQgGBVZptRwrnpiyT2dJr/YMQAUjd8w6nd4PYwJtazSbMRobbXvV
 dLUf/kljeTZw6dcnMPIcbYrHIqLfOPn6YJkdd7WCv9nuzxd6jENn1zCCTGlV/wrMelGs
 VQqyp/J5A0JRLptOhUB6PPEmHzdiflGlY3vCLUefX59kKN6/tgrm85vok0xc7UgfdbcG
 zvp+e6nmkUueGlqCcj30pSUmHlayZD2kfKIir+zXrx9GwCKShpZu/Ynq58h0OpyTQXCV
 o0dQ==
X-Gm-Message-State: AOAM530nQgJn0IZsU4yXAoPRy0Hp3ii7WuV9f7rDI+1XCWOtcKc3bhDr
 brIWp+G9SkO9eGy5F3uBSt1EAQ==
X-Google-Smtp-Source: ABdhPJyXmk/GrvY73uxMs03lrK95AjRrd1DPNUVnKDEIlv4aPEsJZUVLsh7710m12FbolStrlOiCvg==
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr21400665wmq.143.1615195014041; 
 Mon, 08 Mar 2021 01:16:54 -0800 (PST)
Received: from localhost.localdomain
 (lns-bzn-59-82-252-141-80.adsl.proxad.net. [82.252.141.80])
 by smtp.gmail.com with ESMTPSA id i17sm6068135wrp.77.2021.03.08.01.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 01:16:53 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: cwchoi00@gmail.com
Subject: [PATCH v5 2/4] PM / devfreq: msm: Use devfreq cooling device
 registration
Date: Mon,  8 Mar 2021 10:16:43 +0100
Message-Id: <20210308091646.28096-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210308091646.28096-1-daniel.lezcano@linaro.org>
References: <20210308091646.28096-1-daniel.lezcano@linaro.org>
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
