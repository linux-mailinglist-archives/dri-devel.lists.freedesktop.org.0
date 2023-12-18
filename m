Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD838817A61
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FB810E398;
	Mon, 18 Dec 2023 18:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760A310E398;
 Mon, 18 Dec 2023 18:58:48 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-77f8308616eso322019585a.2; 
 Mon, 18 Dec 2023 10:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702925924; x=1703530724; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X5RGGPLxL7RmqDldU4zVC+vRt1k5TON9j6VLsGbzQWQ=;
 b=itab5J4X4shaZzSXoG9Ihjg7+EAXpMPuvE/drTP18TziPGBjtd57/H+H3OyCc6rCTN
 56OGVyrcAfrSEP3UDlnvcDtVXEFtd/3Z5T45wNTNSaJ8vZqK0wut25oAOFcTk6AgmaVf
 ccQq4qrxx9TBQDY2LJH6EHQbij+txBfwMXdCPb4TmvHV9u29i+2qEDPHWqLX0RuF/tpo
 tyCaVhVOl5244AknEbhdRkgEKaP4WybnSndIlU+RMjGw3sHAj5JqHyXHrWlX9/rthbpU
 ZUwUnP+3wdrRsr7wvfxeV8kfgC65vLLBwySf/P9thOZf6brtym0QvzykxHMSvxhILwDg
 PJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925924; x=1703530724;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X5RGGPLxL7RmqDldU4zVC+vRt1k5TON9j6VLsGbzQWQ=;
 b=OTTGjJexhwtbaU7z9nloDPCg0exmUs5FsQWjFBqSrNsf5Jqz83is+15vOVOCvOg3e2
 7tUDXx947qIvLxztlI7uDIr1u3e5sUoDcBmmZEgk2saTsF49FEDcZnT/vofIwsmrMcNR
 PuOAUDcNm+s7aWFKDPcphDbuy43COzceY3VLBUg2GUkEL7cNiDT1Hu2yglo0gKorEOMb
 1XkIaqWHGI3TpXnl0moipN6lbuffxiQjQ4dvhHIPu+Cwh+nvZxp7BCX3YERn20mAVpv3
 1+HUrv7F/+lsY2kRuceCGn60KF7is5tpeEjtgu3rq2llL0p7HR3DRTXo4HoGgO08OmzD
 UB/w==
X-Gm-Message-State: AOJu0YyOW0j/X4UIKXoXGpD5yMJq754hqujR4wEWz86/IyiP5Kbr+4bv
 LcpxdXBBJQGmvtDBIMUH9790houzE/4=
X-Google-Smtp-Source: AGHT+IE7d7GDHTHnS8E5/AboMKPlZPnuoc6gcsADQrBLRGPYI2JmLd8QBiWoJ/biThaG/8vYNNumhg==
X-Received: by 2002:a17:90a:bb04:b0:280:cd7b:1fa5 with SMTP id
 u4-20020a17090abb0400b00280cd7b1fa5mr6789760pjr.4.1702915175541; 
 Mon, 18 Dec 2023 07:59:35 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 pb7-20020a17090b3c0700b0028aea6c24bcsm6535129pjb.53.2023.12.18.07.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:59:34 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: Fix recovery vs runpm race
Date: Mon, 18 Dec 2023 07:59:24 -0800
Message-ID: <20231218155927.368881-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Danylo Piliaiev <dpiliaiev@igalia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 David Heidelberg <david.heidelberg@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

a6xx_recover() is relying on the gpu lock to serialize against incoming
submits doing a runpm get, as it tries to temporarily balance out the
runpm gets with puts in order to power off the GPU.  Unfortunately this
gets worse when we (in a later patch) will move the runpm get out of the
scheduler thread/work to move it out of the fence signaling path.

Instead we can just simplify the whole thing by using force_suspend() /
force_resume() instead of trying to be clever.

Reported-by: David Heidelberg <david.heidelberg@collabora.com>
Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/10272
Fixes: abe2023b4cea ("drm/msm/gpu: Push gpu lock down past runpm")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 268737e59131..a5660d63535b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1244,12 +1244,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	dev_pm_genpd_add_notifier(gmu->cxpd, &gmu->pd_nb);
 	dev_pm_genpd_synced_poweroff(gmu->cxpd);
 
-	/* Drop the rpm refcount from active submits */
-	if (active_submits)
-		pm_runtime_put(&gpu->pdev->dev);
-
-	/* And the final one from recover worker */
-	pm_runtime_put_sync(&gpu->pdev->dev);
+	pm_runtime_force_suspend(&gpu->pdev->dev);
 
 	if (!wait_for_completion_timeout(&gmu->pd_gate, msecs_to_jiffies(1000)))
 		DRM_DEV_ERROR(&gpu->pdev->dev, "cx gdsc didn't collapse\n");
@@ -1258,10 +1253,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	pm_runtime_use_autosuspend(&gpu->pdev->dev);
 
-	if (active_submits)
-		pm_runtime_get(&gpu->pdev->dev);
-
-	pm_runtime_get_sync(&gpu->pdev->dev);
+	pm_runtime_force_resume(&gpu->pdev->dev);
 
 	gpu->active_submits = active_submits;
 	mutex_unlock(&gpu->active_lock);
-- 
2.43.0

