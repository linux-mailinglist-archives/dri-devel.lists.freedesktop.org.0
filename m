Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D904054CC0C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 17:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D7B10F084;
	Wed, 15 Jun 2022 15:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1669E10F770;
 Wed, 15 Jun 2022 15:00:59 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id f9so10680771plg.0;
 Wed, 15 Jun 2022 08:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fftyusq14pygoE98VFvLknKqjgDHop8Kgx2bJEg9loM=;
 b=Dd3Vk1PDo0eKWLfXky6AqmbKiDsQNoKnePr1CSH3382YVX+2aZufcgim47ivxwg5DE
 kDiDg+sLDTkhcTEfkvirUrkkwoJ+ppkuaGzEBuat0jMexCMf+Jx+iDGyqqRz7gu1/JVl
 TartlMlP+t2GHtOzP4IMWy7ny70JiJ+z+iUe4YZ9GSyjIqLVo3UEWUfZe83dMJ4AmYyX
 k5TVD4eemocFf9bWC+ljn8+B8cjvobhfXBee9TTDIZSCXc6jikLOjKbu6Q4R4gH53UtV
 fet3ZKzxp7koEjzXrQqmm1lGxJLAGUvF24OY6Ov89HA1mF/zLkYITI7e5H8yq1BOqU4a
 OQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fftyusq14pygoE98VFvLknKqjgDHop8Kgx2bJEg9loM=;
 b=IbsGmoI/Y2YXDUnZr8ctDOLFlX9P3ky7igKTulWnuEZ7jruJBFK3XiEg5Cq2GA+QzX
 x3GFPqal4K05lyfHmZkvaUqlxYr+ZdoIgc/q5AL7h1ABsKvGWm28eDxcQwT8n1vEi949
 93ANcj3+FXGd/w9e2jPgsvoD/0JBRo2AvAXPT/pItjPQEhJcJJT3+V1o/Ean7tHDMxZQ
 7beEn2ml1vI7Ed3Dgg27DHUJZYdd9N4YUMl9H3nwdFlgP5YhT2I9I1qeDM4t4rB8dwwL
 e5GKanZ3NiAE7/+ZZPTHahHrZdQOR+0ipn3xZ05dS9N0jjPFYnGV8cURviF8zkYky9xg
 Ng6A==
X-Gm-Message-State: AJIora/g2FZKcol9KoRrGKLcQQbSC9DeC1L+A+glm1ZX8KiEFt+ow+Hx
 ydrHwiGKP2grwZ5PhXuhpL+NcxgPYm8=
X-Google-Smtp-Source: AGRyM1t6iYGPtiNKJylInJeuhNBnTKe4fKmcXmlacbZLF5hj1JNSIvXkPggEUHpPxBOzLLO8qeRYTA==
X-Received: by 2002:a17:90a:b284:b0:1e3:826b:d11d with SMTP id
 c4-20020a17090ab28400b001e3826bd11dmr10881434pjr.79.1655305257874; 
 Wed, 15 Jun 2022 08:00:57 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a1709027e8600b0015e8e7db067sm9485101pla.4.2022.06.15.08.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 08:00:56 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm: Drop update_fences()
Date: Wed, 15 Jun 2022 08:01:06 -0700
Message-Id: <20220615150107.2969593-1-robdclark@gmail.com>
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

Reported-by: Steev Klimaszewski <steev@kali.org>
Fixes: 95d1deb02a9c ("drm/msm/gem: Add fenced vma unpin")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index e59a757578df..b61078f0cd0f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -176,24 +176,6 @@ int msm_gpu_hw_init(struct msm_gpu *gpu)
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
@@ -450,7 +432,7 @@ static void recover_worker(struct kthread_work *work)
 		if (ring == cur_ring)
 			fence++;
 
-		update_fences(gpu, ring, fence);
+		msm_update_fence(ring->fctx, fence);
 	}
 
 	if (msm_gpu_active(gpu)) {
@@ -753,7 +735,7 @@ void msm_gpu_retire(struct msm_gpu *gpu)
 	int i;
 
 	for (i = 0; i < gpu->nr_rings; i++)
-		update_fences(gpu, gpu->rb[i], gpu->rb[i]->memptrs->fence);
+		msm_update_fence(gpu->rb[i]->fctx, gpu->rb[i]->memptrs->fence);
 
 	kthread_queue_work(gpu->worker, &gpu->retire_work);
 	update_sw_cntrs(gpu);
-- 
2.36.1

