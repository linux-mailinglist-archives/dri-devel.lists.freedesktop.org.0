Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2529643E1FE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 15:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C839B6E969;
	Thu, 28 Oct 2021 13:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEF66E961;
 Thu, 28 Oct 2021 13:26:34 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id i5so2525323wrb.2;
 Thu, 28 Oct 2021 06:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c0/V9MX2CWjAIfztk9lQHqRb20K2jfbph5MPtHNbg44=;
 b=N9N/hZD3xSeVnPH2DcmlMtwEWHqwTpBikGSV08ByPigtIdm44uCd2jvGMcG86b0+f0
 Xso2S2du7yltn6YeQXwN+ya17RVgf9inhol9CBFVzgBOp700iSQmzsoL+stwpFEF+eKc
 3Dtdlm5ZVDSkKzvdmMsu4m7V4W0oBqse6uKSAjLwJzWvqJTmi5ARB1UZspNefbv9Z2GW
 zYt65uUjvpHTGoq3ioji6aOjLR1rxBbi4xuWN/OYZkVhlwYPdPRmr5390eaNWFkkj+7G
 JEcJpDjHVldeyPKsyZLX905vkoifjWsE8cWiyZoTwvYqOsZOa+DoqRhLkTXH/tEz68re
 t7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c0/V9MX2CWjAIfztk9lQHqRb20K2jfbph5MPtHNbg44=;
 b=Gv3Af/5Xv3XrtdMrxhg3i3TIXzGnYlXphz3eYNHxRpanyYyWPh76RpP7EcY9oEV3Xh
 ZRTGvFn1/1g5Pw55rep4FmUbVzv12MKDyKF8z3CNi3y5lB7Z7IhcoAWHW1LTgGx6U3cJ
 qMjxgwSlBpuYUEgwn1akzY+qKrpH1obc7zzYkHX0eEbx2V6bX3WnKxWK4JyoD0LOYeUW
 2G21ANJamvHnsHfaXQjE5/iJ89oWcJqazZDtlGiN7TlSJnnqcv0IOaZoO9gBGs3ZOU3F
 DelIAFs/iTCyU0DqD0GnW2pfw4VW9ABueqPbXkUjZZLZEwg/mr1cgsTXMk2o/WTevNHZ
 oFyQ==
X-Gm-Message-State: AOAM530pcra51FSeLSzIoiPHk9TGhBpJdFACbDjXAM2GYACZyCDNbCDx
 kYPKPKYKuE/M+Jzu+YkrokEEkv7t/kI=
X-Google-Smtp-Source: ABdhPJyN2MGWslATcLlPRDx7wTnmw/AQjSygmNv/6mJVmC/aO4jjiZa8ruoWViZgoH2yfuxRLZ4Unw==
X-Received: by 2002:a5d:6e8d:: with SMTP id k13mr5734588wrz.295.1635427592655; 
 Thu, 28 Oct 2021 06:26:32 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l11sm2935695wrt.49.2021.10.28.06.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 06:26:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/6] dma-buf: move dma_resv_prune_unlocked into dma_resv.c
Date: Thu, 28 Oct 2021 15:26:25 +0200
Message-Id: <20211028132630.2330-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

The i915 driver implements a prune function which is called when it is very
likely that the fences inside the dma_resv object can be removed because they
are all signaled.

Move that function into the dma-resv.c code since the behavior of pruning
fences is something internal to the object.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c                   | 18 ++++++++++++++++++
 drivers/gpu/drm/i915/Makefile                |  1 -
 drivers/gpu/drm/i915/dma_resv_utils.c        | 17 -----------------
 drivers/gpu/drm/i915/dma_resv_utils.h        | 13 -------------
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c |  3 +--
 drivers/gpu/drm/i915/gem/i915_gem_wait.c     |  3 +--
 include/linux/dma-resv.h                     |  1 +
 7 files changed, 21 insertions(+), 35 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.c
 delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.h

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index ff3c0558b3b8..64d4f95778c4 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -324,6 +324,24 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
 
+/**
+ * dma_resv_prune_unlocked - try to remove signaled fences
+ * @obj: The dma_resv object to prune
+ *
+ * Try to lock the object, test if it is signaled and if yes then remove all the
+ * signaled fences.
+ */
+void dma_resv_prune_unlocked(struct dma_resv *obj)
+{
+	if (!dma_resv_trylock(obj))
+		return;
+
+	if (dma_resv_test_signaled(obj, true))
+		dma_resv_add_excl_fence(obj, NULL);
+	dma_resv_unlock(obj);
+}
+EXPORT_SYMBOL(dma_resv_prune_unlocked);
+
 /**
  * dma_resv_iter_restart_unlocked - restart the unlocked iterator
  * @cursor: The dma_resv_iter object to restart
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 660bb03de6fc..5c1af130cb6d 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -60,7 +60,6 @@ i915-y += i915_drv.o \
 
 # core library code
 i915-y += \
-	dma_resv_utils.o \
 	i915_memcpy.o \
 	i915_mm.o \
 	i915_sw_fence.o \
diff --git a/drivers/gpu/drm/i915/dma_resv_utils.c b/drivers/gpu/drm/i915/dma_resv_utils.c
deleted file mode 100644
index 7df91b7e4ca8..000000000000
--- a/drivers/gpu/drm/i915/dma_resv_utils.c
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2020 Intel Corporation
- */
-
-#include <linux/dma-resv.h>
-
-#include "dma_resv_utils.h"
-
-void dma_resv_prune(struct dma_resv *resv)
-{
-	if (dma_resv_trylock(resv)) {
-		if (dma_resv_test_signaled(resv, true))
-			dma_resv_add_excl_fence(resv, NULL);
-		dma_resv_unlock(resv);
-	}
-}
diff --git a/drivers/gpu/drm/i915/dma_resv_utils.h b/drivers/gpu/drm/i915/dma_resv_utils.h
deleted file mode 100644
index b9d8fb5f8367..000000000000
--- a/drivers/gpu/drm/i915/dma_resv_utils.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2020 Intel Corporation
- */
-
-#ifndef DMA_RESV_UTILS_H
-#define DMA_RESV_UTILS_H
-
-struct dma_resv;
-
-void dma_resv_prune(struct dma_resv *resv);
-
-#endif /* DMA_RESV_UTILS_H */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 5ab136ffdeb2..48029bbda682 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -15,7 +15,6 @@
 
 #include "gt/intel_gt_requests.h"
 
-#include "dma_resv_utils.h"
 #include "i915_trace.h"
 
 static bool swap_available(void)
@@ -229,7 +228,7 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 					i915_gem_object_unlock(obj);
 			}
 
-			dma_resv_prune(obj->base.resv);
+			dma_resv_prune_unlocked(obj->base.resv);
 
 			scanned += obj->base.size >> PAGE_SHIFT;
 skip:
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index 569658c7859c..1915d203a72d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -10,7 +10,6 @@
 
 #include "gt/intel_engine.h"
 
-#include "dma_resv_utils.h"
 #include "i915_gem_ioctls.h"
 #include "i915_gem_object.h"
 
@@ -53,7 +52,7 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
 	 * signaled.
 	 */
 	if (timeout > 0)
-		dma_resv_prune(resv);
+		dma_resv_prune_unlocked(resv);
 
 	return timeout;
 }
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index eebf04325b34..e0558429a5ee 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -458,6 +458,7 @@ void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
+void dma_resv_prune_unlocked(struct dma_resv *obj);
 int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
 			unsigned *pshared_count, struct dma_fence ***pshared);
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
-- 
2.25.1

