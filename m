Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E478E44DC1B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 20:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FE46E911;
	Thu, 11 Nov 2021 19:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD9C6E8F3;
 Thu, 11 Nov 2021 19:19:54 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so5190007pjb.5; 
 Thu, 11 Nov 2021 11:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JmBLUrJ1pjWQ4c27cD0iWXnDGV3xPRlcSYls26QLyvM=;
 b=SFYqejm6GHXh73rIi8sp5NbmZZ3W339y3vnR/UWO+Jo8FFki88Vptu7yo08uDxeORl
 jrR1wf7rtOOAPSV7gsXIxcwdY2uOQn8ULunE1lgPmgqWt1+xbk4uJ8g20ajVoVVXHvTh
 SlA8XqRMoWaKnvIIz5bPYa97IhT5Kl8y+395Fna9MHkXn3/Oh7DizRDknkpiSdxR04DM
 2SrtmFdrsaf07sGdza6bMWcAzXspNnF+gpf13RjguY/dyIOCSORWeGaCZ/V5IYf1XPNu
 CHa9NB5z0f2XueMxFQ6Z3b3CGErWBnoYu7Zz3pifXLSRRygMNZonyPpjN3l6YJKEOsh/
 kbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JmBLUrJ1pjWQ4c27cD0iWXnDGV3xPRlcSYls26QLyvM=;
 b=HOJ6reLQ/L4eYjtsrH1NJxCRznx8aEIpnDQbEP1G14g6OTqM36vjdvUfA85VC1wEcK
 zJyzKnUREMWDbHsg8utlbFXm3kFBvqPLMCQ6LQy7u5ymJPrC3Z/TKeb4ABvzQTrYRg1D
 ZpuX9PnHt2NjjhyJl/EE7IIjorLM5oThH068EDRVnsoBIWPrVza8LgN8M01oEkHMJRA7
 ZaFh4PmfbEG2qfjI+pnxeEIDTTx2y7lcyUo2sxJ1um9Fq9Y30VAvvVw0CBlESqYHDL59
 6xfzruNkr+Xo4ONr54i5vXmNp+gZTFB4rgEMsFN/3Kz1zfbZayZGpFTs2tHF4MNyznNa
 STEA==
X-Gm-Message-State: AOAM531QGdO6JTlswgE8OrsOPo0eW6EB469D5gdNiUy7f9PSpiFproTa
 Ii2ana/6UQV+5p0H6mVlltyN8fd1sBw=
X-Google-Smtp-Source: ABdhPJwUDT3B3FYu1EtS/05ERDv63SGfgPigtC2o1eHKy2r6IRLrQnTx/ASkxfHvaAdLa0zev4uyww==
X-Received: by 2002:a17:90b:3e8c:: with SMTP id
 rj12mr11006957pjb.152.1636658393183; 
 Thu, 11 Nov 2021 11:19:53 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 j6sm2855418pgf.60.2021.11.11.11.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 11:19:52 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm: Fix wait_fence submitqueue leak
Date: Thu, 11 Nov 2021 11:24:55 -0800
Message-Id: <20211111192457.747899-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211111192457.747899-1-robdclark@gmail.com>
References: <20211111192457.747899-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We weren't dropping the submitqueue reference in all paths.  In
particular, when the fence has already been signalled. Split out
a helper to simplify handling this in the various different return
paths.

Fixes: a61acbbe9cf8 ("drm/msm: Track "seqno" fences by idr")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 49 +++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 73e827641024..cb14d997c174 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -961,29 +961,12 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 	return ret;
 }
 
-static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
-		struct drm_file *file)
+static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_id,
+		      ktime_t timeout)
 {
-	struct msm_drm_private *priv = dev->dev_private;
-	struct drm_msm_wait_fence *args = data;
-	ktime_t timeout = to_ktime(args->timeout);
-	struct msm_gpu_submitqueue *queue;
-	struct msm_gpu *gpu = priv->gpu;
 	struct dma_fence *fence;
 	int ret;
 
-	if (args->pad) {
-		DRM_ERROR("invalid pad: %08x\n", args->pad);
-		return -EINVAL;
-	}
-
-	if (!gpu)
-		return 0;
-
-	queue = msm_submitqueue_get(file->driver_priv, args->queueid);
-	if (!queue)
-		return -ENOENT;
-
 	/*
 	 * Map submitqueue scoped "seqno" (which is actually an idr key)
 	 * back to underlying dma-fence
@@ -995,7 +978,7 @@ static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
 	ret = mutex_lock_interruptible(&queue->lock);
 	if (ret)
 		return ret;
-	fence = idr_find(&queue->fence_idr, args->fence);
+	fence = idr_find(&queue->fence_idr, fence_id);
 	if (fence)
 		fence = dma_fence_get_rcu(fence);
 	mutex_unlock(&queue->lock);
@@ -1011,6 +994,32 @@ static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
 	}
 
 	dma_fence_put(fence);
+
+	return ret;
+}
+
+static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
+		struct drm_file *file)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_msm_wait_fence *args = data;
+	struct msm_gpu_submitqueue *queue;
+	int ret;
+
+	if (args->pad) {
+		DRM_ERROR("invalid pad: %08x\n", args->pad);
+		return -EINVAL;
+	}
+
+	if (!priv->gpu)
+		return 0;
+
+	queue = msm_submitqueue_get(file->driver_priv, args->queueid);
+	if (!queue)
+		return -ENOENT;
+
+	ret = wait_fence(queue, args->fence, to_ktime(args->timeout));
+
 	msm_submitqueue_put(queue);
 
 	return ret;
-- 
2.31.1

