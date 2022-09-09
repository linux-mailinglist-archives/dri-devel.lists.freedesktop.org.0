Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 311A75B3BE0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 17:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23BA10E03F;
	Fri,  9 Sep 2022 15:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4B910ECB4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 15:29:12 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id c11so3345549wrp.11
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 08:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=x5KrfZMUqk39SoEPHLkAPrMFfPRI1D3FajlqzTwrI2w=;
 b=oSYpl/Gb1s9dRqBo3A5bgCA72v4jIqY5p2bmNk/vF4s4Z3Ej+MlZWJsUyTGVNwZ/yL
 80TFASgEwfo3yvcFMYRdBstqzyu3kpN57pNe+DqjU8T1t5aIe6g+UheTJwf4quTfGohg
 dIECs/DMEDAnA6Z/89eBhe+EPGIjU3BGLmeGSbWEHr/afbL8jo2GOosPz7te/ia1zXqc
 ViZLMeW/bckHzNGye3KqZHyv26ATnWeXHJ9RDz7Ar1pQyEhVa1XXJ98OQvOJ2T5Y8pRs
 005yXvVrRb7ofk+0Y56L42BjxJn4xzM7xbGKTY9PgS/MXHUxNbbPkdkU5aut49H1VH18
 fRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=x5KrfZMUqk39SoEPHLkAPrMFfPRI1D3FajlqzTwrI2w=;
 b=oDBtb/muWSk05p+yXhwSI+ZNoMdWRU1jNSCjQq40xyfQGRvx4Nq+yaJVRopV+K9zVH
 yYbmwJiCj3FdOz+OK9ryJ8W5WPfqJRQ5LMZ8BDcuDTd58rWSfMvEjloRamDz34atLAQB
 N7l7mNGGSs7Nr253tuOm0+ABw8DnkZ1w66OXcAtnJDLML+u9o1llCx23hRn3oxIMvO4j
 TuxPfchVaY5A2sI8n/jVizimNElxABytmFiwSq9Ao0POQTBV8aQ3DWZEQCvos4TZ2v5a
 0qUXsDab+8jiRi2xOOFL9XxjznUZHuN1PJhO7NnUEVHsDkcUIPYhm+4gely5D323gcrI
 554A==
X-Gm-Message-State: ACgBeo2WiXrW9DTYM8e5vEoiLA88HzCIpTNQY/4BZ1I6rGOgp0TV70GH
 3jwksRgCC0EFHuNOD6EDEyfaZQ==
X-Google-Smtp-Source: AA6agR6wb87riPAljaE4mS1gw1MnP9z5tVpez/1x2jPhB3Ig+9QVEo4MAY76WVxvchFw/nzKIBqD1w==
X-Received: by 2002:a5d:6481:0:b0:228:dc1f:4f95 with SMTP id
 o1-20020a5d6481000000b00228dc1f4f95mr8415352wri.298.1662737351151; 
 Fri, 09 Sep 2022 08:29:11 -0700 (PDT)
Received: from radium.lan ([88.160.162.107]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d4a8c000000b002285f73f11dsm956931wrq.81.2022.09.09.08.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 08:29:10 -0700 (PDT)
From: Fabien Parent <fabien.parent@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org
Subject: [PATCH] drm/msm/mdp5: fix kernel panic during shutdown
Date: Fri,  9 Sep 2022 17:28:56 +0200
Message-Id: <20220909152856.149291-1-fabien.parent@linaro.org>
X-Mailer: git-send-email 2.37.2
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org, Fabien Parent <fabien.parent@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kernel is panicking when rebooting on MSM8939:

	# reboot -f
	[   87.280853] Unable to handle kernel write to read-only memory at virtual address ffff800008ed5810
	...
	snip
	...
	[   87.445142] Call trace:
	[   87.452253]  mutex_lock+0x1c/0x50
	[   87.454511]  msm_drv_shutdown+0x28/0x40
	[   87.457984]  platform_shutdown+0x28/0x40
	[   87.461629]  device_shutdown+0x14c/0x240
	[   87.465796]  __do_sys_reboot+0x180/0x274
	[   87.469703]  __arm64_sys_reboot+0x28/0x3c
	[   87.473608]  invoke_syscall+0x54/0x124
	[   87.477515]  el0_svc_common.constprop.0+0x44/0xec
	[   87.481163]  do_el0_svc+0x90/0xe0
	[   87.485934]  el0_svc+0x50/0xa4
	[   87.489232]  el0t_64_sync_handler+0x11c/0x150
	[   87.492185]  el0t_64_sync+0x190/0x194
	[   87.496618] Code: f9800011 c85ffc03 ca010064 b5000064 (c8047c02)
	[   87.500264] ---[ end trace 0000000000000000 ]---
	Segmentation fault

The issue comes from the fact that mdp5_init() is calling
platform_set_drvdata() and consequently overwriting the driver data
previously set by msm_drv_probe.
msm_drv_shutdown was casting the driver data as "struct msm_drm_private"
while it was actually a "struct mdp5_kms".

This commit fixes the issue by having mdp5_init() not override the
platform driver data, and instead use a series of
to_mdp5_kms(to_mdp_kms(priv->kms)) to retrieve the mdp5_kms from the
pdata.

Fixes: 54199009958f ("drm/msm: Fix shutdown")
Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index d2a48caf9d27..17aeabeedfeb 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -634,7 +634,8 @@ static int mdp5_kms_init(struct drm_device *dev)
 
 static void mdp5_destroy(struct platform_device *pdev)
 {
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 	int i;
 
 	if (mdp5_kms->ctlm)
@@ -797,7 +798,8 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 		goto fail;
 	}
 
-	platform_set_drvdata(pdev, mdp5_kms);
+	/* set uninit-ed kms */
+	priv->kms = &mdp5_kms->base.base;
 
 	spin_lock_init(&mdp5_kms->resource_lock);
 
@@ -890,13 +892,13 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	if (ret)
 		goto fail;
 
-	/* set uninit-ed kms */
-	priv->kms = &mdp5_kms->base.base;
-
 	return 0;
 fail:
 	if (mdp5_kms)
 		mdp5_destroy(pdev);
+
+	priv->kms = NULL;
+
 	return ret;
 }
 
@@ -956,7 +958,8 @@ static int mdp5_dev_remove(struct platform_device *pdev)
 static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 
 	DBG("");
 
@@ -966,7 +969,8 @@ static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
 static __maybe_unused int mdp5_runtime_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 
 	DBG("");
 
-- 
2.37.2

