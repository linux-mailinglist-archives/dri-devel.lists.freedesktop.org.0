Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD99282D0C
	for <lists+dri-devel@lfdr.de>; Sun,  4 Oct 2020 21:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F14089F2D;
	Sun,  4 Oct 2020 19:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D1489F33;
 Sun,  4 Oct 2020 19:21:25 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id b26so1739545pff.3;
 Sun, 04 Oct 2020 12:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8RonTZKV7nIutYPycO/AUjmVxTm8X/O252euLFCDy8g=;
 b=FGIyIVUbmv+JYYmPLDse5d6Al0XpfX0TkT0I0BCASHeusLqq/KNUVs4spRHJ642TbC
 Uu0C/gR2L2IrGb4YBWGvf1VGxRC/sDDojNdxFtyDoxJn5o9mPGXIMTrQ9ZL8v3s7ZG2e
 0noRTxg1xfWov0XrQMGCb3tcbEVpRTUQNIMdIU0M+9eHnQu6UTp4xwMO36BmoDWDfhMD
 bHffDBk6BJTEwBaFOHgA/0OO15HEhvg4a0qUPrmUdezCoIAznxwEbM4M4Srl/RYrT29D
 iJbkSFe1eVo0tERO8SEcUA2/jN+QR/+i77Es+AL4U2X0m0dt2tXODEhssYJyULcBtaLt
 HGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8RonTZKV7nIutYPycO/AUjmVxTm8X/O252euLFCDy8g=;
 b=dkg+CfOxz/XzEXK+pp3pGmtWD/spz3VgL9fExmb+9m1hzNeYWTGGxMVOeSb/qwPW/n
 kL+4BB361U3FYrfrRoyToNXAMzMvYYHSyEKO8+4LtknkRbmI4uVTKOcmFBMvQErBIuxl
 34/iv1E3+Q1hX+g3GzSxUqlzPDywiTbd1bttw3SxP0Haqm2FFRMeTpNiZh6CVKM1JzOf
 xZdDi2HM13lAes9DsGfMaysBnPexHa/pqbOsjv7NNWLd1Yqvg+zkrtl2hsNXg/Yp8bKY
 jTwEI6FuU3+bKZuREeg6PpXsVlYW+MEZ1UY8VFSYSkc+dqpF2lmeE62keLMsRvDckloP
 Mirw==
X-Gm-Message-State: AOAM530NCGtd/+QeTkKgIfe4/7qugZYwNZ4hfx2l2vrTibFcScyS6pCF
 MayCmDZluNl0hJkVuCg8i7b672GGFpY/cJWJ
X-Google-Smtp-Source: ABdhPJzwhHz6PJU0sNZCTex9teqsgD1GUxASnYadyTjhVMRfVtSBaLn/hFZ/mUV8+1f+TPVkXVXadA==
X-Received: by 2002:aa7:8ad8:0:b029:150:7d36:cddf with SMTP id
 b24-20020aa78ad80000b02901507d36cddfmr3904428pfd.55.1601839284512; 
 Sun, 04 Oct 2020 12:21:24 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 t12sm8138825pgk.32.2020.10.04.12.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 12:21:23 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/14] drm/msm: Refcount submits
Date: Sun,  4 Oct 2020 12:21:39 -0700
Message-Id: <20201004192152.3298573-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
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
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Before we remove dev->struct_mutex from the retire path, we have to deal
with the situation of a submit retiring before the submit ioctl returns.

To deal with this, ring->submits will hold a reference to the submit,
which is dropped when the submit is retired.  And the submit ioctl path
holds it's own ref, which it drops when it is done with the submit.

Also, add to submit list *after* getting/pinning bo's, to prevent badness
in case the completed fence is corrupted, and retire_worker mistakenly
believes the submit is done too early.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.h        |  1 -
 drivers/gpu/drm/msm/msm_gem.h        | 13 +++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c | 12 ++++++------
 drivers/gpu/drm/msm/msm_gpu.c        | 21 ++++++++++++++++-----
 4 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 50978e5db376..535f9e718e2d 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -277,7 +277,6 @@ void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
 
 bool msm_use_mmu(struct drm_device *dev);
 
-void msm_gem_submit_free(struct msm_gem_submit *submit);
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index a1bf741b9b89..e05b1530aca6 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -136,6 +136,7 @@ void msm_gem_free_work(struct work_struct *work);
  * lasts for the duration of the submit-ioctl.
  */
 struct msm_gem_submit {
+	struct kref ref;
 	struct drm_device *dev;
 	struct msm_gpu *gpu;
 	struct msm_gem_address_space *aspace;
@@ -169,6 +170,18 @@ struct msm_gem_submit {
 	} bos[];
 };
 
+void __msm_gem_submit_destroy(struct kref *kref);
+
+static inline void msm_gem_submit_get(struct msm_gem_submit *submit)
+{
+	kref_get(&submit->ref);
+}
+
+static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
+{
+	kref_put(&submit->ref, __msm_gem_submit_destroy);
+}
+
 /* helper to determine of a buffer in submit should be dumped, used for both
  * devcoredump and debugfs cmdstream dumping:
  */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index e1d1f005b3d4..7d653bdc92dc 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -42,6 +42,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	if (!submit)
 		return NULL;
 
+	kref_init(&submit->ref);
 	submit->dev = dev;
 	submit->aspace = queue->ctx->aspace;
 	submit->gpu = gpu;
@@ -60,12 +61,12 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	return submit;
 }
 
-void msm_gem_submit_free(struct msm_gem_submit *submit)
+void __msm_gem_submit_destroy(struct kref *kref)
 {
+	struct msm_gem_submit *submit =
+			container_of(kref, struct msm_gem_submit, ref);
+
 	dma_fence_put(submit->fence);
-	spin_lock(&submit->ring->submit_lock);
-	list_del(&submit->node);
-	spin_unlock(&submit->ring->submit_lock);
 	put_pid(submit->pid);
 	msm_submitqueue_put(submit->queue);
 
@@ -805,8 +806,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	submit_cleanup(submit);
 	if (has_ww_ticket)
 		ww_acquire_fini(&submit->ticket);
-	if (ret)
-		msm_gem_submit_free(submit);
+	msm_gem_submit_put(submit);
 out_unlock:
 	if (ret && (out_fence_fd >= 0))
 		put_unused_fd(out_fence_fd);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 8d1e254f964a..fd3fc6f36ab1 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -712,7 +712,12 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 	pm_runtime_mark_last_busy(&gpu->pdev->dev);
 	pm_runtime_put_autosuspend(&gpu->pdev->dev);
-	msm_gem_submit_free(submit);
+
+	spin_lock(&ring->submit_lock);
+	list_del(&submit->node);
+	spin_unlock(&ring->submit_lock);
+
+	msm_gem_submit_put(submit);
 }
 
 static void retire_submits(struct msm_gpu *gpu)
@@ -786,10 +791,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	submit->seqno = ++ring->seqno;
 
-	spin_lock(&ring->submit_lock);
-	list_add_tail(&submit->node, &ring->submits);
-	spin_unlock(&ring->submit_lock);
-
 	msm_rd_dump_submit(priv->rd, submit, NULL);
 
 	update_sw_cntrs(gpu);
@@ -816,6 +817,16 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		msm_gem_active_get(drm_obj, gpu);
 	}
 
+	/*
+	 * ring->submits holds a ref to the submit, to deal with the case
+	 * that a submit completes before msm_ioctl_gem_submit() returns.
+	 */
+	msm_gem_submit_get(submit);
+
+	spin_lock(&ring->submit_lock);
+	list_add_tail(&submit->node, &ring->submits);
+	spin_unlock(&ring->submit_lock);
+
 	gpu->funcs->submit(gpu, submit);
 	priv->lastctx = submit->queue->ctx;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
