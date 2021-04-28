Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA5B36DF92
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 21:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5DE6E171;
	Wed, 28 Apr 2021 19:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A696E171;
 Wed, 28 Apr 2021 19:33:33 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso9698396pjn.0; 
 Wed, 28 Apr 2021 12:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tHyKA/c627E+DwGyeUfIZ1QItPIfz0VDyJzjzlVcfiM=;
 b=pID33Lw/tKPo6F7e2OUh0qUiAHOKaPkeMJJBqyKac+TpqtuROmy6A+2Cn4i7xmNuHo
 11gZvwbHI9mcQqgMqQiVt/gzsTmk77n+grXj0DZvvVIiaN2pTNohh8uJKj4VF19YtgWK
 SavFQPTQXlF2MEOzCoKZZ4Kb2ep2jIVnQczHSstnYgQUu84jcFbnVK/TsC9A1SzVkh8W
 0zV2uDyKv0WZOzWVvln0/fAf3ZnK1L3EQe17k8l1C+6zObJDrdKLZWqykSO/qn2E96Al
 pELUG+S3eUIsIN8WHWl+cbPNV2D+N2ld/f1wGwIWUPbxj35BQwFzNJatW8pEFhavki49
 AXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tHyKA/c627E+DwGyeUfIZ1QItPIfz0VDyJzjzlVcfiM=;
 b=rQiDtEGO8fGtHLhSaAbVd+J9EzRhgLCMiDCs95LNxpFauknBl7Q7WP+pyjBYvKdJ65
 h7BcnobYSIuNrUrjUcbkbsn/HwmZinwkXHOhZ/5RpY2CHuOuL2kQf6bnTfXcaBWQhrq7
 KgE8ePLMxsiU+ssk1XW58t6yv9JBYBq8FoNdgrZtvtx8jFO2QSt218blln5gy+QAmfM9
 viqHC6pFNclnJpOKxzi7p/5XEIgu352P2yt0wEszlKk4y33ZNSXSFn07/38/O6k2kAko
 L/gs45/zFWlY70K16+CZPK1HHXdduSOdl3HZBWGNu5W4Q+C6o9YrYYebsP5DF5zbFWM7
 s6Qw==
X-Gm-Message-State: AOAM533+rvEVSTuCmAvY4FPvhlVwYB2LOs3H54vmlyRDSYMKDDxoYzIv
 RMBmZPxDD5mwUsGY5Yq6TMdJrDGM0R8=
X-Google-Smtp-Source: ABdhPJxaQuJh3H+yrpkJC7lrVgzdxfKzMBDfOSlK7PNpjK0FjYtIdAYiv9DBO7Mzm9706DDfVRLATg==
X-Received: by 2002:a17:903:248e:b029:ec:b399:7d75 with SMTP id
 p14-20020a170903248eb02900ecb3997d75mr30868529plw.35.1619638412162; 
 Wed, 28 Apr 2021 12:33:32 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 r3sm414934pfl.159.2021.04.28.12.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:33:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm: Handle ringbuffer overflow
Date: Wed, 28 Apr 2021 12:36:48 -0700
Message-Id: <20210428193654.1498482-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210428193654.1498482-1-robdclark@gmail.com>
References: <20210428193654.1498482-1-robdclark@gmail.com>
MIME-Version: 1.0
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, Dave Airlie <airlied@redhat.com>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Currently if userspace manages to fill up the ring faster than the GPU
can consume we (a) spin for up to 1sec, and then (b) overwrite the
ringbuffer contents from previous submits that the GPU is still busy
executing.  Which predictably goes rather badly.

Instead, just skip flushing (updating WPTR) and reset ring->next back to
where it was before we tried writing the submit into the ringbuffer, and
return an error to userspace (which can then try again).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  3 +++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 24 +++++++++++++++++-
 drivers/gpu/drm/msm/msm_gem_submit.c    |  7 +++++-
 drivers/gpu/drm/msm/msm_gpu.c           | 33 +++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.h           |  2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h    |  5 ++++
 7 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index ce13d49e615b..0c8faad3b328 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -36,6 +36,9 @@ void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 		OUT_RING(ring, upper_32_bits(shadowptr(a5xx_gpu, ring)));
 	}
 
+	if (unlikely(ring->overflow))
+		return;
+
 	spin_lock_irqsave(&ring->preempt_lock, flags);
 
 	/* Copy the shadow to the actual register */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d553f62f4eeb..4a4728a774c0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -68,6 +68,9 @@ static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 		OUT_RING(ring, upper_32_bits(shadowptr(a6xx_gpu, ring)));
 	}
 
+	if (unlikely(ring->overflow))
+		return;
+
 	spin_lock_irqsave(&ring->preempt_lock, flags);
 
 	/* Copy the shadow to the actual register */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 0f184c3dd9d9..a658777e07b1 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -467,6 +467,9 @@ void adreno_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring, u32 reg)
 {
 	uint32_t wptr;
 
+	if (unlikely(ring->overflow))
+		return;
+
 	/* Copy the shadow to the actual register */
 	ring->cur = ring->next;
 
@@ -788,12 +791,31 @@ static uint32_t ring_freewords(struct msm_ringbuffer *ring)
 	return (rptr + (size - 1) - wptr) % size;
 }
 
+static bool space_avail(struct msm_ringbuffer *ring, uint32_t ndwords)
+{
+	if (ring_freewords(ring) >= ndwords)
+		return true;
+
+	/* We don't have a good way to know in general when the RPTR has
+	 * advanced.. newer things that use CP_WHERE_AM_I to update the
+	 * shadow rptr could possibly insert a packet to generate an irq.
+	 * But that doesn't cover older GPUs.  But if the ringbuffer is
+	 * full, it could take a while before it is empty again, so just
+	 * insert a blind sleep to avoid a busy loop.
+	 */
+	msleep(1);
+
+	return false;
+}
+
 void adreno_wait_ring(struct msm_ringbuffer *ring, uint32_t ndwords)
 {
-	if (spin_until(ring_freewords(ring) >= ndwords))
+	if (spin_until(space_avail(ring, ndwords))) {
 		DRM_DEV_ERROR(ring->gpu->dev->dev,
 			"timeout waiting for space in ringbuffer %d\n",
 			ring->id);
+		ring->overflow = true;
+	}
 }
 
 /* Get legacy powerlevels from qcom,gpu-pwrlevels and populate the opp table */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 5480852bdeda..4bc669460fda 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -683,6 +683,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	submitid = atomic_inc_return(&ident) - 1;
 
 	ring = gpu->rb[queue->prio];
+
+	GEM_WARN_ON(ring->overflow);
+
 	trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
 		args->nr_bos, args->nr_cmds);
 
@@ -829,7 +832,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		}
 	}
 
-	msm_gpu_submit(gpu, submit);
+	ret = msm_gpu_submit(gpu, submit);
+	if (ret)
+		goto out;
 
 	args->fence = submit->fence->seqno;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index ab7c167b0623..7655ad9108c8 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -787,7 +787,7 @@ void msm_gpu_retire(struct msm_gpu *gpu)
 }
 
 /* add bo's to gpu's ring, and kick gpu: */
-void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
+int msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
 	struct drm_device *dev = gpu->dev;
 	struct msm_drm_private *priv = dev->dev_private;
@@ -834,9 +834,38 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	spin_unlock(&ring->submit_lock);
 
 	gpu->funcs->submit(gpu, submit);
-	priv->lastctx = submit->queue->ctx;
 
 	hangcheck_timer_reset(gpu);
+
+	if (unlikely(ring->overflow)) {
+		/*
+		 * Reset the ptr back to before the submit, so the GPU
+		 * doesn't see a partial submit:
+		 */
+		ring->next = ring->cur;
+
+		/*
+		 * Clear the overflow flag, hopefully the next submit on
+		 * the ring actually fits
+		 */
+		ring->overflow = false;
+
+		/*
+		 * One might be tempted to remove the submit from the
+		 * submits list, and drop it's reference (and drop the
+		 * active reference for all the bos).  But we can't
+		 * really signal the fence attached to obj->resv without
+		 * disturbing other fences on the timeline.  So instead
+		 * just leave it and let it retire normally when a
+		 * later submit completes.
+		 */
+
+		return -ENOSPC;
+	}
+
+	priv->lastctx = submit->queue->ctx;
+
+	return 0;
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d7cd02cd2109..2dd2ef1f8328 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -302,7 +302,7 @@ int msm_gpu_perfcntr_sample(struct msm_gpu *gpu, uint32_t *activetime,
 		uint32_t *totaltime, uint32_t ncntrs, uint32_t *cntrs);
 
 void msm_gpu_retire(struct msm_gpu *gpu);
-void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit);
+int msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit);
 
 int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index fe55d4a1aa16..d8ad9818c389 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -40,6 +40,8 @@ struct msm_ringbuffer {
 	struct drm_gem_object *bo;
 	uint32_t *start, *end, *cur, *next;
 
+	bool overflow;
+
 	/*
 	 * List of in-flight submits on this ring.  Protected by submit_lock.
 	 */
@@ -69,6 +71,9 @@ void msm_ringbuffer_destroy(struct msm_ringbuffer *ring);
 static inline void
 OUT_RING(struct msm_ringbuffer *ring, uint32_t data)
 {
+	if (ring->overflow)
+		return;
+
 	/*
 	 * ring->next points to the current command being written - it won't be
 	 * committed as ring->cur until the flush
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
