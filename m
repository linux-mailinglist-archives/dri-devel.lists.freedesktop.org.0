Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566862744CD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 16:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F1E6E8A3;
	Tue, 22 Sep 2020 14:55:50 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C626E8A3
 for <dri-devel@freedesktop.org>; Tue, 22 Sep 2020 14:55:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600786547; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=aZmhklz8kBZUWwYwyWUzb5UI2+wP25dBHo9a0RD1jRo=;
 b=r1T19N7VpGANW1vHAYh2/rGj9tV6TIgjBKxeVHPyP1qFjxa2CMRbjmNTWy0oEoXIo26NDbu9
 zd6Pxu3xtA5nAK42ZOaW1nWJqP2Y8sokejzIzyLpKmc9ejqJj5rj6dUlmvd35k7XYucywLSx
 5VjcfzDbuVQwxLyl1eB1jU7O6D8=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f6a1069244d44dc65ab18ab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Sep 2020 14:55:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DCAA8C43385; Tue, 22 Sep 2020 14:55:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A316C433FE;
 Tue, 22 Sep 2020 14:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9A316C433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/msm: Fix premature purging of BO
Date: Tue, 22 Sep 2020 20:25:26 +0530
Message-Id: <1600786527-7343-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
Cc: jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org, mka@chromium.org,
 dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the case where we have a back-to-back submission that shares the same
BO, this BO will be prematurely moved to inactive_list while retiring the
first submit. But it will be still part of the second submit which is
being processed by the GPU. Now, if the shrinker happens to be triggered at
this point, it will result in a premature purging of this BO.

To fix this, we need to refcount BO while doing submit and retire. Then,
it should be moved to inactive list when this refcount becomes 0.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
Changes in v2:
	1. Keep Active List around
	2. Put back the deleted WARN_ON

 drivers/gpu/drm/msm/msm_drv.h |  5 ++---
 drivers/gpu/drm/msm/msm_gem.c | 32 ++++++++++++++++----------------
 drivers/gpu/drm/msm/msm_gem.h |  4 +++-
 drivers/gpu/drm/msm/msm_gpu.c | 11 +++++++----
 4 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 3193274..28e3c8d 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -309,9 +309,8 @@ void msm_gem_put_vaddr(struct drm_gem_object *obj);
 int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv);
 int msm_gem_sync_object(struct drm_gem_object *obj,
 		struct msm_fence_context *fctx, bool exclusive);
-void msm_gem_move_to_active(struct drm_gem_object *obj,
-		struct msm_gpu *gpu, bool exclusive, struct dma_fence *fence);
-void msm_gem_move_to_inactive(struct drm_gem_object *obj);
+void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
+void msm_gem_active_put(struct drm_gem_object *obj);
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
 int msm_gem_cpu_fini(struct drm_gem_object *obj);
 void msm_gem_free_object(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 76a6c52..14e14ca 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -743,31 +743,31 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
 	return 0;
 }
 
-void msm_gem_move_to_active(struct drm_gem_object *obj,
-		struct msm_gpu *gpu, bool exclusive, struct dma_fence *fence)
+void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
 	WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
-	msm_obj->gpu = gpu;
-	if (exclusive)
-		dma_resv_add_excl_fence(obj->resv, fence);
-	else
-		dma_resv_add_shared_fence(obj->resv, fence);
-	list_del_init(&msm_obj->mm_list);
-	list_add_tail(&msm_obj->mm_list, &gpu->active_list);
+
+	if (!atomic_fetch_inc(&msm_obj->active_count)) {
+		msm_obj->gpu = gpu;
+		list_del_init(&msm_obj->mm_list);
+		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
+	}
 }
 
-void msm_gem_move_to_inactive(struct drm_gem_object *obj)
+void msm_gem_active_put(struct drm_gem_object *obj)
 {
-	struct drm_device *dev = obj->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	struct msm_drm_private *priv = obj->dev->dev_private;
 
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
+	WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
 
-	msm_obj->gpu = NULL;
-	list_del_init(&msm_obj->mm_list);
-	list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
+	if (!atomic_dec_return(&msm_obj->active_count)) {
+		msm_obj->gpu = NULL;
+		list_del_init(&msm_obj->mm_list);
+		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
+	}
 }
 
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 7b1c7a5..a1bf741 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -88,12 +88,14 @@ struct msm_gem_object {
 	struct mutex lock; /* Protects resources associated with bo */
 
 	char name[32]; /* Identifier to print for the debugfs files */
+
+	atomic_t active_count;
 };
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
 static inline bool is_active(struct msm_gem_object *msm_obj)
 {
-	return msm_obj->gpu != NULL;
+	return atomic_read(&msm_obj->active_count);
 }
 
 static inline bool is_purgeable(struct msm_gem_object *msm_obj)
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 29c8d73c..55d1648 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -698,8 +698,8 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
-		/* move to inactive: */
-		msm_gem_move_to_inactive(&msm_obj->base);
+
+		msm_gem_active_put(&msm_obj->base);
 		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
 		drm_gem_object_put_locked(&msm_obj->base);
 	}
@@ -774,6 +774,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
+		struct drm_gem_object *drm_obj = &msm_obj->base;
 		uint64_t iova;
 
 		/* can't happen yet.. but when we add 2d support we'll have
@@ -786,9 +787,11 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		msm_gem_get_and_pin_iova(&msm_obj->base, submit->aspace, &iova);
 
 		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
-			msm_gem_move_to_active(&msm_obj->base, gpu, true, submit->fence);
+			dma_resv_add_excl_fence(drm_obj->resv, submit->fence);
 		else if (submit->bos[i].flags & MSM_SUBMIT_BO_READ)
-			msm_gem_move_to_active(&msm_obj->base, gpu, false, submit->fence);
+			dma_resv_add_shared_fence(drm_obj->resv, submit->fence);
+
+		msm_gem_active_get(drm_obj, gpu);
 	}
 
 	gpu->funcs->submit(gpu, submit);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
