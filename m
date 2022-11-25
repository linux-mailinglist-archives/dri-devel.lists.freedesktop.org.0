Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17BB63875D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 11:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD9E10E715;
	Fri, 25 Nov 2022 10:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF0610E66E;
 Fri, 25 Nov 2022 10:21:49 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id g12so6042043wrs.10;
 Fri, 25 Nov 2022 02:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=o0YPpxQ/Ip2/zYWzBSiDluBmslbFNM8kf+Iwh6rl5dU=;
 b=qvPwPI3TQq+pXriukE3ongoP8ru+5u2PtE8ILSCPLM9KaxdiMIsqGryaAx21TuSZmi
 YI/Q0mA63SIIGWF1VTQQwzs39cFpohVwJbQ6pf/kyNRM+WHK4MVAzbUAAWRbNUYgioKP
 fxVtXF1o/0E36ArfWP+muTkCL07Vo4EK888ckxt+aPprjSo0zlGwCR7URjQKuFRVZNk9
 9YD76q4z5Xkv2VZlB9q+7j1e7F57IxcdTxtLzUleiqA8QwDARM0dpdm98cDCeM1KfN8w
 r19dGN9kWL+RoqSj/+DTzDobtiGoy2Tz1/20uGKQVGVjPoGpMr6eo4iw5zp8CcoOue0t
 2Dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o0YPpxQ/Ip2/zYWzBSiDluBmslbFNM8kf+Iwh6rl5dU=;
 b=eHxD7Ji77RvLXznMPN5YKQUxcMaLay5BOFxIBfm5lAcqJf0h7NK05pTaxAOADrllAg
 mmM3ZQhMNCkItDFtBI9Lvwf5aQ4ZGTKjWVqhUjgFwk9yoI+EDGkTKYwCXafiFsxEp1VC
 tdVnv/7HHO2VR7UcqUy9vPGP0608qDwVCHZuw+3K2ZSbbUbJymX8HAIwOvjXUBjCGJZB
 EvzI8gjF/m2DQxGj8rvFAT/0T7ibChfFnOpzGG5x6vCN17r44qR7FHU/nU9u++khcwrq
 zSMRCOGM/iRcjXWFyFK8bkGcV/094I2RaPu1jfwGbVxXVk9h4W68r3QHJNNDbbCt1ajY
 6lKg==
X-Gm-Message-State: ANoB5pm5o+OZNdcaZAAqlAvEHPwaYMblRL38FxmdFuv5HSKFM/WGMbLs
 Du0/s4YZEiAARzxKtrMyzIkaCvTErZk=
X-Google-Smtp-Source: AA0mqf7FdnazNRzg6PH5Y4TfoO5Yag7tByPKY+W5qQcW7+MSFmegEOJpBQx/VaayGvfB9r9Yie1RUA==
X-Received: by 2002:a5d:604b:0:b0:236:6442:3a48 with SMTP id
 j11-20020a5d604b000000b0023664423a48mr12982207wrt.41.1669371707310; 
 Fri, 25 Nov 2022 02:21:47 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056000038200b00241cfe6e286sm3351193wrf.98.2022.11.25.02.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 02:21:46 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 9/9] drm/ttm: move ttm_bo_wait into VMWGFX
Date: Fri, 25 Nov 2022 11:21:37 +0100
Message-Id: <20221125102137.1801-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125102137.1801-1-christian.koenig@amd.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not used anymore by other drivers or TTM itself.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c        | 44 +++++++++++------------------
 drivers/gpu/drm/ttm/ttm_bo_util.c   | 19 ++++++++-----
 drivers/gpu/drm/vmwgfx/ttm_object.h | 11 ++++++++
 include/drm/ttm/ttm_bo.h            |  1 -
 4 files changed, 39 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index cd266a067773..326a3d13a829 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1087,47 +1087,35 @@ void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo)
 EXPORT_SYMBOL(ttm_bo_unmap_virtual);
 
 /**
- * ttm_bo_wait - wait for buffer idle.
+ * ttm_bo_wait_ctx - wait for buffer idle.
  *
  * @bo:  The buffer object.
- * @interruptible:  Use interruptible wait.
- * @no_wait:  Return immediately if buffer is busy.
+ * @ctx: defines how to wait
  *
- * This function must be called with the bo::mutex held, and makes
- * sure any previous rendering to the buffer is completed.
- * Note: It might be necessary to block validations before the
- * wait by reserving the buffer.
- * Returns -EBUSY if no_wait is true and the buffer is busy.
- * Returns -ERESTARTSYS if interrupted by a signal.
+ * Waits for the buffer to be idle. Used timeout depends on the context.
+ * Returns -EBUSY if wait timed outt, -ERESTARTSYS if interrupted by a signal or
+ * zero on success.
  */
-int ttm_bo_wait(struct ttm_buffer_object *bo,
-		bool interruptible, bool no_wait)
+int ttm_bo_wait_ctx(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
 {
-	long timeout = 15 * HZ;
+	long ret;
 
-	if (no_wait) {
-		if (dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP))
+	if (ctx->no_wait_gpu) {
+		if (dma_resv_test_signaled(bo->base.resv,
+					   DMA_RESV_USAGE_BOOKKEEP))
 			return 0;
 		else
 			return -EBUSY;
 	}
 
-	timeout = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
-					interruptible, timeout);
-	if (timeout < 0)
-		return timeout;
-
-	if (timeout == 0)
+	ret = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
+				    ctx->interruptible, 15 * HZ);
+	if (unlikely(ret < 0))
+		return ret;
+	if (unlikely(ret == 0))
 		return -EBUSY;
-
 	return 0;
 }
-EXPORT_SYMBOL(ttm_bo_wait);
-
-int ttm_bo_wait_ctx(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
-{
-	return ttm_bo_wait(bo, ctx->interruptible, ctx->no_wait_gpu);
-}
 EXPORT_SYMBOL(ttm_bo_wait_ctx);
 
 int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
@@ -1135,7 +1123,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 {
 	struct ttm_place place;
 	bool locked;
-	int ret;
+	long ret;
 
 	/*
 	 * While the bo may already reside in SYSTEM placement, set
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index fee7c20775c0..ed2b28734541 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -547,9 +547,13 @@ EXPORT_SYMBOL(ttm_bo_vunmap);
 static int ttm_bo_wait_free_node(struct ttm_buffer_object *bo,
 				 bool dst_use_tt)
 {
-	int ret;
-	ret = ttm_bo_wait(bo, false, false);
-	if (ret)
+	long ret;
+
+	ret = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
+				    false, 15 * HZ);
+	if (ret == 0)
+		return -EBUSY;
+	if (ret < 0)
 		return ret;
 
 	if (!dst_use_tt)
@@ -710,8 +714,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 		return ret;
 
 	/* If already idle, no need for ghost object dance. */
-	ret = ttm_bo_wait(bo, false, true);
-	if (ret != -EBUSY) {
+	if (dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP)) {
 		if (!bo->ttm) {
 			/* See comment below about clearing. */
 			ret = ttm_tt_create(bo, true);
@@ -748,8 +751,10 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 
 	ret = dma_resv_copy_fences(&ghost->base._resv, bo->base.resv);
 	/* Last resort, wait for the BO to be idle when we are OOM */
-	if (ret)
-		ttm_bo_wait(bo, false, false);
+	if (ret) {
+		dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
+				      false, MAX_SCHEDULE_TIMEOUT);
+	}
 
 	dma_resv_unlock(&ghost->base._resv);
 	ttm_bo_put(ghost);
diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.h b/drivers/gpu/drm/vmwgfx/ttm_object.h
index f0ebbe340ad6..95a9679f9d39 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.h
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.h
@@ -42,6 +42,8 @@
 #include <linux/list.h>
 #include <linux/rcupdate.h>
 
+#include <drm/ttm/ttm_bo.h>
+
 /**
  * enum ttm_object_type
  *
@@ -321,4 +323,13 @@ static inline void ttm_base_object_noref_release(void)
 	__acquire(RCU);
 	rcu_read_unlock();
 }
+
+static inline int ttm_bo_wait(struct ttm_buffer_object *bo, bool intr,
+			      bool no_wait)
+{
+	struct ttm_operation_ctx ctx = { intr, no_wait };
+
+	return ttm_bo_wait_ctx(bo, &ctx);
+}
+
 #endif
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index cfaf88e2d678..6dd8f63a5715 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -346,7 +346,6 @@ static inline void *ttm_kmap_obj_virtual(struct ttm_bo_kmap_obj *map,
 	return map->virtual;
 }
 
-int ttm_bo_wait(struct ttm_buffer_object *bo, bool interruptible, bool no_wait);
 int ttm_bo_wait_ctx(struct ttm_buffer_object *bo,
 		    struct ttm_operation_ctx *ctx);
 int ttm_bo_validate(struct ttm_buffer_object *bo,
-- 
2.34.1

