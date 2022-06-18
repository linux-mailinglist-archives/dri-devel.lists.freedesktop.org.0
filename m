Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E47B550606
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 18:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A8A11B8EF;
	Sat, 18 Jun 2022 16:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7165511B8ED;
 Sat, 18 Jun 2022 16:11:12 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 y13-20020a17090a154d00b001eaaa3b9b8dso6637997pja.2; 
 Sat, 18 Jun 2022 09:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oFb7npL4PD4+dNt9TMTKGSDFvw0QWZrqS2iKTnt24Qw=;
 b=hLhs6nAB8Hj6nYs4Z6utsnyy8MWbills7fP/TW/3nHVEFwGxZE3uILPVG//7PAsoOP
 FDKau/L/oPiGMdtJtfANdKCEO6NoYggtAVDcwXYJEXIgzN9pduWhELjUYPN+MqIs1Yf0
 ubIEOvHM12hoGS1qxraVPSqWzUiuz7MJ88epzc1IsaCwrc3e54pbCV/WNWWqgAj7qUW6
 MkOnlfaVMcLyEr9BZYblqPp9hRM//8OJMGKv/Uhd+V1Cpap3Nw9HXf/F1Fcu1IWLT3SG
 JL3EAeNqZgoMU2/qn5M2muSUxr4nfBxROPYv731sZnMSRCSjgh5Nt++VCfRSqx9LnEip
 JkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oFb7npL4PD4+dNt9TMTKGSDFvw0QWZrqS2iKTnt24Qw=;
 b=O7cBL/QTPIE8gkEtP64Oo3vy6ILKlVHe/r6Oh8OdGBAz4HjUwz0xU0Y+slBrvyk70j
 +QpFhhxJiPALK81NscjOX/MTc2qOI3OG+qe7mA/L1ux/Yj/bzn3G2rxOAup4IvrUFyP7
 LezfTD8Mlvq5bS0dc1B5HzVMspAVqHx5Jd6ummfJ4l0bM6uIuEvo3YO7hE+bNnYUFjYX
 xDd25CO/pfrMVC0ftUYDS/RgF7/eVWLoqaGkBU54OztRMtH/N8AcEX9t6CMIzVsBHnMq
 tlNXLrXqF2X4veWR0IGdAioX/BDxauTByORTVrzNpQ0nyqOaXqyDS6+Po7vrZFwfBt2V
 MHtg==
X-Gm-Message-State: AJIora87xuiig2P/J7UNiLIN+FV8BOnjaoDJ5eXuONaTkDg3ImRQFRyU
 UrQuu8nRhQ0hFlsnA6YDOiMLct8TOA0=
X-Google-Smtp-Source: AGRyM1tQp1nTafx9dq2YTmnYdD/C7xbKbhSjuD5YDOyAYVynK+I6eyhgcjMjerVikMi2TnQ78p5YAA==
X-Received: by 2002:a17:902:e54b:b0:166:50b6:a0a0 with SMTP id
 n11-20020a170902e54b00b0016650b6a0a0mr15169227plf.30.1655568671225; 
 Sat, 18 Jun 2022 09:11:11 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a170902654a00b0015e8d4eb29csm5490525pln.230.2022.06.18.09.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 09:11:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/msm: Drop update_fences()
Date: Sat, 18 Jun 2022 09:11:18 -0700
Message-Id: <20220618161120.3451993-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Steev Klimaszewski <steev@kali.org>, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

I noticed while looking at some traces, that we could miss calls to
msm_update_fence(), as the irq could have raced with retire_submits()
which could have already popped the last submit on a ring out of the
queue of in-flight submits.  But walking the list of submits in the
irq handler isn't really needed, as dma_fence_is_signaled() will dtrt.
So lets just drop it entirely.

v2: use spin_lock_irqsave/restore as we are no longer protected by the
    spin_lock_irqsave/restore() in update_fences()

Reported-by: Steev Klimaszewski <steev@kali.org>
Fixes: 95d1deb02a9c ("drm/msm/gem: Add fenced vma unpin")
Signed-off-by: Rob Clark <robdclark@chromium.org>
Tested-by: Steev Klimaszewski <steev@kali.org>
---
 drivers/gpu/drm/msm/msm_fence.c |  8 +++++---
 drivers/gpu/drm/msm/msm_gpu.c   | 22 ++--------------------
 2 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index 3df255402a33..38e3323bc232 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -46,12 +46,14 @@ bool msm_fence_completed(struct msm_fence_context *fctx, uint32_t fence)
 		(int32_t)(*fctx->fenceptr - fence) >= 0;
 }
 
-/* called from workqueue */
+/* called from irq handler and workqueue (in recover path) */
 void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
 {
-	spin_lock(&fctx->spinlock);
+	unsigned long flags;
+
+	spin_lock_irqsave(&fctx->spinlock, flags);
 	fctx->completed_fence = max(fence, fctx->completed_fence);
-	spin_unlock(&fctx->spinlock);
+	spin_unlock_irqrestore(&fctx->spinlock, flags);
 }
 
 struct msm_fence {
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 244511f85044..cedc88cf8083 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -164,24 +164,6 @@ int msm_gpu_hw_init(struct msm_gpu *gpu)
 	return ret;
 }
 
-static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
-		uint32_t fence)
-{
-	struct msm_gem_submit *submit;
-	unsigned long flags;
-
-	spin_lock_irqsave(&ring->submit_lock, flags);
-	list_for_each_entry(submit, &ring->submits, node) {
-		if (fence_after(submit->seqno, fence))
-			break;
-
-		msm_update_fence(submit->ring->fctx,
-			submit->hw_fence->seqno);
-		dma_fence_signal(submit->hw_fence);
-	}
-	spin_unlock_irqrestore(&ring->submit_lock, flags);
-}
-
 #ifdef CONFIG_DEV_COREDUMP
 static ssize_t msm_gpu_devcoredump_read(char *buffer, loff_t offset,
 		size_t count, void *data, size_t datalen)
@@ -438,7 +420,7 @@ static void recover_worker(struct kthread_work *work)
 		if (ring == cur_ring)
 			fence++;
 
-		update_fences(gpu, ring, fence);
+		msm_update_fence(ring->fctx, fence);
 	}
 
 	if (msm_gpu_active(gpu)) {
@@ -736,7 +718,7 @@ void msm_gpu_retire(struct msm_gpu *gpu)
 	int i;
 
 	for (i = 0; i < gpu->nr_rings; i++)
-		update_fences(gpu, gpu->rb[i], gpu->rb[i]->memptrs->fence);
+		msm_update_fence(gpu->rb[i]->fctx, gpu->rb[i]->memptrs->fence);
 
 	kthread_queue_work(gpu->worker, &gpu->retire_work);
 	update_sw_cntrs(gpu);
-- 
2.36.1

