Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E8644DC1C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 20:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC146EA41;
	Thu, 11 Nov 2021 19:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97D36E916;
 Thu, 11 Nov 2021 19:19:56 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id r132so3844419pgr.9;
 Thu, 11 Nov 2021 11:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gll+pgQtBYECeJn/RU0NsPRmZk9ALD2l3W41Hro7yLE=;
 b=AtiOD3Rcv6buPs1m+tSPfQKVgnN8eBsb6zxBDTpFTJiTJa1rOCDgBu2nBWCV69MtAP
 sJtFzHofUFf9nnVgS3EmRlb9Dw6DxhyBWHFO14tzbnh6bm6AP8i0hnpdShokxj2CIt4u
 TVJ/w7J3RniL9Cn4w3vFshZFd6otTyw2Ia2k0Uh8BzIr5g21HmuAdQaGS8b+yFAxE0XZ
 VpwAkoKqEIhWvWsuG/8yDKwbSkmrWaSQzz9iuZ7dV42x86dxdXKlQJgd68O/AE9eF3bw
 gACUE9IDKAVj2nimLwRUE8+KClA8AYb6CW/o0F+rJpwSz1VNsbgRPYjTUlEEKNZ6C4Na
 +ZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gll+pgQtBYECeJn/RU0NsPRmZk9ALD2l3W41Hro7yLE=;
 b=zx5eVzV1wFMC+U4pTxrZi3Y8YkpaBZDR8XM3JjkaidD2abDzkXBedCL67H8w4zfhvt
 akH/7JTPtGvXOquAX/2amSItIlHHcz2/PvdupM6WMtlc6QZYT46tn6xqCqENz3cCjUwD
 HCrrtH81DGsWc1xgVajrMqeQ1i/RjiDXrXYEYuqr4ROUiHou+ZnmOP1XTe5/4phjVuJE
 tW+6QMWkYaiIJzny4r3ds7VR1bwh6XnEo2fTps1FKKdt2XpqoMuh8/fxi7TvBjtlKOhZ
 Er/+1G5oOLnxniAccz4JDg5S4K+ClXT1mY/VoX9DKDEJaeVS/ylQpxpCv7sHNGJ3CQHz
 1/HA==
X-Gm-Message-State: AOAM530MoOXF2UmaK5JsZYuYNeCwnvxhDb7twhbl5PsyoMzzwthvLp+W
 j3kONOTSd8OI2iJ2x8N4/EUm6S4v/Ac=
X-Google-Smtp-Source: ABdhPJx+lfYqAWYFGx0tk1yaXqVXH2LpwuOrESzXjHIuYrmwylZZLkLUOPKxleNWssUAHd9SngzmYw==
X-Received: by 2002:a63:5a63:: with SMTP id k35mr6119632pgm.230.1636658395706; 
 Thu, 11 Nov 2021 11:19:55 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 m9sm3588886pff.43.2021.11.11.11.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 11:19:54 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm: Restore error return on invalid fence
Date: Thu, 11 Nov 2021 11:24:56 -0800
Message-Id: <20211111192457.747899-3-robdclark@gmail.com>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

When converting to use an idr to map userspace fence seqno values back
to a dma_fence, we lost the error return when userspace passes seqno
that is larger than the last submitted fence.  Restore this check.

Reported-by: Akhil P Oommen <akhilpo@codeaurora.org>
Fixes: a61acbbe9cf8 ("drm/msm: Track "seqno" fences by idr")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Note: I will rebase "drm/msm: Handle fence rollover" on top of this,
to simplify backporting this patch to stable kernels

 drivers/gpu/drm/msm/msm_drv.c        | 6 ++++++
 drivers/gpu/drm/msm/msm_gem_submit.c | 1 +
 drivers/gpu/drm/msm/msm_gpu.h        | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index cb14d997c174..56500eb5219e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -967,6 +967,12 @@ static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_id,
 	struct dma_fence *fence;
 	int ret;
 
+	if (fence_id > queue->last_fence) {
+		DRM_ERROR_RATELIMITED("waiting on invalid fence: %u (of %u)\n",
+				      fence_id, queue->last_fence);
+		return -EINVAL;
+	}
+
 	/*
 	 * Map submitqueue scoped "seqno" (which is actually an idr key)
 	 * back to underlying dma-fence
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 151d19e4453c..a38f23be497d 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -911,6 +911,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	drm_sched_entity_push_job(&submit->base, queue->entity);
 
 	args->fence = submit->fence_id;
+	queue->last_fence = submit->fence_id;
 
 	msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
 	msm_process_post_deps(post_deps, args->nr_out_syncobjs,
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index bd4e0024033e..e73a5bb03544 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -376,6 +376,8 @@ static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
  * @ring_nr:   the ringbuffer used by this submitqueue, which is determined
  *             by the submitqueue's priority
  * @faults:    the number of GPU hangs associated with this submitqueue
+ * @last_fence: the sequence number of the last allocated fence (for error
+ *             checking)
  * @ctx:       the per-drm_file context associated with the submitqueue (ie.
  *             which set of pgtables do submits jobs associated with the
  *             submitqueue use)
@@ -391,6 +393,7 @@ struct msm_gpu_submitqueue {
 	u32 flags;
 	u32 ring_nr;
 	int faults;
+	uint32_t last_fence;
 	struct msm_file_private *ctx;
 	struct list_head node;
 	struct idr fence_idr;
-- 
2.31.1

