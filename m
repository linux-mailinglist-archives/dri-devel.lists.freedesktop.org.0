Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6791A48698E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 19:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E343410E7D5;
	Thu,  6 Jan 2022 18:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B70710E7EF;
 Thu,  6 Jan 2022 18:15:09 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id iy13so3134699pjb.5;
 Thu, 06 Jan 2022 10:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9aRT+BKtfoUra9B8cP6tf0Fs3h6BVFB+BuyDyjwYyis=;
 b=Umg7a1l870g0diH/9R9A4xgzQInP7pCMmNMxws7RaWkbkeqIBLknKWpyw1kthFU6s3
 1GJNrDSkmI1kxrbt/Y+4ettK5mu56e84+6V9mCf2cmZEt1Kn5wm7rqor9n9IkAGeksHd
 Y0/HcNp2EkY1YoA3VryJrjgbbriRvjrzpIpkxS2VGInWxz5lijvuxK3tK57nlCay4l6h
 khwcnI5k2hWNIqd1p+zuWneFmfv4EfkCbmrSyJdwBl4BHbIPMtAEwRdYPIIMaIsD0DdE
 wdbKI/RriL2uViUiNbIPIVWDHjFDsAL3hQ1lKC4nf7YwdF+e9yepOaiSR3RwwDktr7s3
 2A7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9aRT+BKtfoUra9B8cP6tf0Fs3h6BVFB+BuyDyjwYyis=;
 b=bSzbSxs0yKXhzq+vjE+EkrKQhkHyNxPycgBE8vfjkAGwV3Jxbn+MIl8OZFmbLTOnvx
 ZJWRSQ95DdGlwDGU6m0LtokUBLan4pg0neNzIu5cMLUXNsMTiJtDqYGBiZSjDVOVnZVe
 F93B1Atv1rFi1yRsLDDNC8oHGbon3ULjqjh6pkRGTgC0sc5q15Oy/LGe5p8Zy80X5iZQ
 sQJbIOvyI+TZwGWeCCopMdCYjF2YM3ShjAeV9u0DIfClcLfzUFOFUJGuDpRQDOLSN6Y1
 M1E5csKAG66lFwUTP/RpkGK1uw+V1LGhSHTYAeLWWjgMgv49D7fQzfYlLyFsoYXhabZv
 gBhw==
X-Gm-Message-State: AOAM533jJpXTdZES0OQnt+Hlptlx/+eU1pvR7/S4H4QPo+ktzHteLjFk
 m08d+9LqY/B2R2NeDx7P2wgHtl/xR90=
X-Google-Smtp-Source: ABdhPJw0rL4+omUtSR47k3TXWKN/FskQ6U50lGHp2Fvucua0WK/BEfsE68Leus4rIk9/IMmCJN+fBQ==
X-Received: by 2002:a17:90b:4b0c:: with SMTP id
 lx12mr11581984pjb.146.1641492908127; 
 Thu, 06 Jan 2022 10:15:08 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id i4sm3025524pjj.30.2022.01.06.10.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 10:15:07 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/gpu: Wait for idle before suspending
Date: Thu,  6 Jan 2022 10:14:46 -0800
Message-Id: <20220106181449.696988-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106181449.696988-1-robdclark@gmail.com>
References: <20220106181449.696988-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

System suspend uses pm_runtime_force_suspend(), which cheekily bypasses
the runpm reference counts.  This doesn't actually work so well when the
GPU is active.  So add a reasonable delay waiting for the GPU to become
idle.

Alternatively we could just return -EBUSY in this case, but that has the
disadvantage of causing system suspend to fail.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 9 +++++++++
 drivers/gpu/drm/msm/msm_gpu.c              | 3 +++
 drivers/gpu/drm/msm/msm_gpu.h              | 3 +++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 93005839b5da..b677ca3fd75e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -611,6 +611,15 @@ static int adreno_resume(struct device *dev)
 static int adreno_suspend(struct device *dev)
 {
 	struct msm_gpu *gpu = dev_to_gpu(dev);
+	int ret = 0;
+
+	ret = wait_event_timeout(gpu->retire_event,
+				 !msm_gpu_active(gpu),
+				 msecs_to_jiffies(1000));
+	if (ret == 0) {
+		dev_err(dev, "Timeout waiting for GPU to suspend\n");
+		return -EBUSY;
+	}
 
 	return gpu->funcs->pm_suspend(gpu);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0f78c2615272..2c1049c0ea14 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -703,6 +703,8 @@ static void retire_submits(struct msm_gpu *gpu)
 			}
 		}
 	}
+
+	wake_up_all(&gpu->retire_event);
 }
 
 static void retire_worker(struct kthread_work *work)
@@ -848,6 +850,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	INIT_LIST_HEAD(&gpu->active_list);
 	mutex_init(&gpu->active_lock);
 	mutex_init(&gpu->lock);
+	init_waitqueue_head(&gpu->retire_event);
 	kthread_init_work(&gpu->retire_work, retire_worker);
 	kthread_init_work(&gpu->recover_work, recover_worker);
 	kthread_init_work(&gpu->fault_work, fault_worker);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 445c6bfd4b6b..92aa1e9196c6 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -230,6 +230,9 @@ struct msm_gpu {
 	/* work for handling GPU recovery: */
 	struct kthread_work recover_work;
 
+	/** retire_event: notified when submits are retired: */
+	wait_queue_head_t retire_event;
+
 	/* work for handling active-list retiring: */
 	struct kthread_work retire_work;
 
-- 
2.33.1

