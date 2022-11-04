Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECFE619C27
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 16:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2D310E8B7;
	Fri,  4 Nov 2022 15:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF1310E8B5;
 Fri,  4 Nov 2022 15:52:08 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so8597134pjk.2; 
 Fri, 04 Nov 2022 08:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h91PY4kE003Fzt7Dp6s2LtF8+Ku5gtgrJGFgjbiXW0Y=;
 b=fZfNmpLbARw2htsWecPLMgqjYPXVCha4yMS8ZDbD2ibFKN0J+n0z1donudEwT68czq
 a0Napturob7ia7xuzL1aB8P2BRUnsbBoS56zzlP4bsMwS3v0iD1ekMG6/YiSja5OdMBh
 ZCp/Zuw4eFXMl/9YJFXMK7h0CS5Ws0Jx7n+Kbc3sXjDM8Lu7Vg6FRDU0RqK/bDLQCZOi
 obao476g+hOwqCoByP4oL/i2QR58pWgfSbrhdrn5d0YF+Ifeqb2RFpTqn99sjrMwzQva
 xg2F99kYPErdBIQAkV2v+HdMxcyQ923U6Dvjb8E1W3FPlEvL4id57fFAJYKXEcJuUpNa
 SVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h91PY4kE003Fzt7Dp6s2LtF8+Ku5gtgrJGFgjbiXW0Y=;
 b=mqsJGN0P7OZbcCZypkvZBCqXHN1PrGNvY1zwUfaZr/rZwzCSoj0IlzXmzGDlzaOF5u
 9tpbqxW17vVurU4jGuycBDlY2KnP2AqZ9TGkNTjoKx+Wt/uQCkX0INCtu1ymOTxFjH1w
 YnIMpsyK3Pehtp54a+EhpuhX2jMdrSlazK09ix0hyUCx/PYvYJpsztSGjw4ETJQwGIzw
 q59eL467nY0V/9RZ93VoKVZjGUpZkViSKiJMgZEKF9GCelt5ss76gMTomEOCBiB2mRJt
 gkySYJIJPFGBw7LDWKzEWOE9OKGdaRYrkv5qa6y+a1i1sf+yV2iH2pmXMs1JHUhZ5bqQ
 7u0w==
X-Gm-Message-State: ACrzQf0ptAccD70s7KLVNq/TQqZ7c6E3Gpn8xZuXqxz9HYs6LehCsr/E
 krhqpRcNYyQTVw3w3Ul5Y7xfiRaqfRo=
X-Google-Smtp-Source: AMsMyM6zNFvjaDiCUgUsJtKWxaFpLMuqPLYgtr1mX1+M2ATzrBZKD/U5nCh1sXRpFzk8ueJiv0U/Yg==
X-Received: by 2002:a17:90b:152:b0:213:dfd6:3e5e with SMTP id
 em18-20020a17090b015200b00213dfd63e5emr27484666pjb.229.1667577127429; 
 Fri, 04 Nov 2022 08:52:07 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a17090ac48400b002130c269b6fsm1868454pjt.1.2022.11.04.08.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 08:52:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC] drm/msm: Boost on waits
Date: Fri,  4 Nov 2022 08:52:29 -0700
Message-Id: <20221104155229.528193-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Minimize interactive latency by boosting frequency when userspace is
waiting on the GPU to finish.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
I did contemplate also boosting on dma_fence_wait(), but (a) that would
require some extra plumbing thru gpu-sched, (b) that only captures a
sub-set of wait-on-dma-fence patterns, and (c) waiting on a dma-fence
doesn't always imply urgency (for ex, virglrenderer poll()ing on a dma-
fence to know when to send a fence irq to VM guest).  But the driver
WAIT_FENCE and CPU_PREP ioctls map to things like glFinish() where it
is pretty clear that there is something wishing the GPU would finish
sooner.

 drivers/gpu/drm/msm/msm_drv.c         | 7 +++++--
 drivers/gpu/drm/msm/msm_gem.c         | 6 ++++++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 +-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c3b77b44b2aa..017a512982a2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -894,7 +894,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 }
 
 static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_id,
-		      ktime_t timeout)
+		      ktime_t timeout, struct msm_gpu *gpu)
 {
 	struct dma_fence *fence;
 	int ret;
@@ -924,6 +924,9 @@ static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_id,
 	if (!fence)
 		return 0;
 
+	if (!dma_fence_is_signaled(fence))
+		msm_devfreq_boost(gpu, 2);
+
 	ret = dma_fence_wait_timeout(fence, true, timeout_to_jiffies(&timeout));
 	if (ret == 0) {
 		ret = -ETIMEDOUT;
@@ -956,7 +959,7 @@ static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
 	if (!queue)
 		return -ENOENT;
 
-	ret = wait_fence(queue, args->fence, to_ktime(args->timeout));
+	ret = wait_fence(queue, args->fence, to_ktime(args->timeout), priv->gpu);
 
 	msm_submitqueue_put(queue);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 1dee0d18abbb..fbda0e3a94f8 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -846,6 +846,12 @@ int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
 		op & MSM_PREP_NOSYNC ? 0 : timeout_to_jiffies(timeout);
 	long ret;
 
+	if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(write))) {
+		struct msm_drm_private *priv = obj->dev->dev_private;
+
+		msm_devfreq_boost(priv->gpu, 2);
+	}
+
 	ret = dma_resv_wait_timeout(obj->resv, dma_resv_usage_rw(write),
 				    true,  remain);
 	if (ret == 0)
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 85c443a37e4e..025940eb08d1 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -305,7 +305,7 @@ void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 	uint64_t freq;
 
-	if (!has_devfreq(gpu))
+	if (!gpu || !has_devfreq(gpu))
 		return;
 
 	freq = get_freq(gpu);
-- 
2.38.1

