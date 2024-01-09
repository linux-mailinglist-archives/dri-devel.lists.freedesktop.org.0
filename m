Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27003828C79
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 19:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FA310E4C0;
	Tue,  9 Jan 2024 18:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE4A10E4C0;
 Tue,  9 Jan 2024 18:22:22 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d3f2985425so15398665ad.3; 
 Tue, 09 Jan 2024 10:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704824541; x=1705429341; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k4A842bIbNaLxIo03lzXt0/VhyZzfulbNd4Jc/GgvJg=;
 b=OB5sHQtLqM8i59XnerunOH83SlKcJkEd7dctDQrMyuMAVcQ+0ovoKtGjnSUoN41KHc
 tpiRLZSgYRFhd91vq5DQZWQGqVNYb6wdKbRI/OUafwh3XigJVLnnN7p0+HPSvN6u/9yS
 CW4m6P+e5MwyDoQFEX/F/EkKTS1TCP4DfkFQItQIzYpa9oCeyAYKCdRQ2dMvBLzMqrO6
 d+vI7ytFynZLa/oWXa68XuN5YCEbjcuu3NsNwaf1ryf0st1PdLkibdDMaU3KNihvME8/
 /iST5Cd8RFMUNCnmn5dqHTQNg1IqHD+EwIYP51lrh7e8UOfrxOLDAbrmGne1Sv+WNeIq
 GVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704824541; x=1705429341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k4A842bIbNaLxIo03lzXt0/VhyZzfulbNd4Jc/GgvJg=;
 b=eiugq47vfH/NOoiKB1YiJCfGkObbvx23My4yHNZavyVeuKxjhkfy6V5eXYdOiWuIb/
 lHboT8F9XxO0mRlUMBcWU0Q25oEJcMhqdCEn1bnFP8D81UDAhzvbCu9E9HoEYv0ZFro8
 gOeq/FkJcY81D+nhVgGat0kl7pxvYhnk3QIvqkCDL64K7mBT4xRsiMCzXaEDC0+0cT2n
 E6lmzDSP56V1w9J1jd7Z5BWvOWS4OL+pSZkQBX5jQ7GdiFyXd5YPCDmOpCy6+xZ0qBQb
 Zx4gfVyeUv3qUYDmMIOkJvtiVHXYUw7QYl69pJDw6jv80jxmBYunr6BbaQCoGITgXp6l
 O3ow==
X-Gm-Message-State: AOJu0YxoEobrLtPFA9V8akeTTP8nc5cQDjgQYPyno/SBThLA9xPzfb+a
 Fg0YVN8c73HCTtFvNCWFOs7yDxGvL04=
X-Google-Smtp-Source: AGHT+IHnNJgT4Frcmf+mu0NObp6XPVh7FkAVBM9nfEuBx/+VqBzGvs5E5OOVp4iBa8sQu9sssKuqoA==
X-Received: by 2002:a17:903:32c3:b0:1d4:1a55:6e70 with SMTP id
 i3-20020a17090332c300b001d41a556e70mr3390318plr.113.1704824540985; 
 Tue, 09 Jan 2024 10:22:20 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 jf15-20020a170903268f00b001d3e6f58e5esm2104217plb.6.2024.01.09.10.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 10:22:20 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Revert "drm/msm/gpu: Push gpu lock down past runpm"
Date: Tue,  9 Jan 2024 10:22:17 -0800
Message-ID: <20240109182218.193804-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This reverts commit abe2023b4cea192ab266b351fd38dc9dbd846df0.

Changing the locking order means that scheduler/msm_job_run() can race
with the recovery kthread worker, with the result that the GPU gets an
extra runpm get when we are trying to power it off.  Leaving the GPU in
an unrecovered state.

I'll need to come up with a different scheme for appeasing lockdep.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c        | 11 +++++------
 drivers/gpu/drm/msm/msm_ringbuffer.c |  7 +++++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 095390774f22..655002b21b0d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -751,12 +751,14 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned long flags;
 
-	pm_runtime_get_sync(&gpu->pdev->dev);
+	WARN_ON(!mutex_is_locked(&gpu->lock));
 
-	mutex_lock(&gpu->lock);
+	pm_runtime_get_sync(&gpu->pdev->dev);
 
 	msm_gpu_hw_init(gpu);
 
+	submit->seqno = submit->hw_fence->seqno;
+
 	update_sw_cntrs(gpu);
 
 	/*
@@ -781,11 +783,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	gpu->funcs->submit(gpu, submit);
 	gpu->cur_ctx_seqno = submit->queue->ctx->seqno;
 
-	hangcheck_timer_reset(gpu);
-
-	mutex_unlock(&gpu->lock);
-
 	pm_runtime_put(&gpu->pdev->dev);
+	hangcheck_timer_reset(gpu);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index e0ed27739449..548f5266a7d3 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -21,8 +21,6 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 
 	msm_fence_init(submit->hw_fence, fctx);
 
-	submit->seqno = submit->hw_fence->seqno;
-
 	mutex_lock(&priv->lru.lock);
 
 	for (i = 0; i < submit->nr_bos; i++) {
@@ -35,8 +33,13 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 
 	mutex_unlock(&priv->lru.lock);
 
+	/* TODO move submit path over to using a per-ring lock.. */
+	mutex_lock(&gpu->lock);
+
 	msm_gpu_submit(gpu, submit);
 
+	mutex_unlock(&gpu->lock);
+
 	return dma_fence_get(submit->hw_fence);
 }
 
-- 
2.43.0

