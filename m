Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B319261C0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 15:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F94A10E108;
	Wed,  3 Jul 2024 13:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MV22/wMZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D7D10E07B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 13:26:09 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42641dec7c3so3214345e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 06:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720013168; x=1720617968; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R282shfArTU5DaZQ9AOLlIfcQVpoysK5fJHWsZYbRRU=;
 b=MV22/wMZPwuTtN8pwCFHqwY0DPdwk7ruFu8YoDGcQXIBDiZSiNNGJgWNs3QUxHleq8
 zmDEuvA9BqVo2ommnTW0dm//Vu6fPoBodC8+5UEagk2tmkF1dkpv6kjHdWNxCvLB3/aL
 SZKQt3Lul/fVgahIJpRIgYmEJjYACAUxtKfOVjhWmPxMcAonOPMAdxpdiYogDtIKnJwN
 i1Sdg07zhKBiT1I0bhuX2Ba6KcnUg/7tF3f7i/m9mssQYJStG3bDboJwpOpnLbfjl+nY
 KxS+GdrSS0JBdw+13c0AGA+Uu7Lzj5kDk1Xav0X5fqnoTpU7/aYs462JFha2yupeEp86
 GHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720013168; x=1720617968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R282shfArTU5DaZQ9AOLlIfcQVpoysK5fJHWsZYbRRU=;
 b=h8qGFVrTgh5vbdejrHyxj5W0ii1EJQl1Q3CfwOFVSArP3KQteO6C74FeExN99wtj7T
 21RImJvvWORGtdo5I3X6mk9S2pl+lg1orcBy9C+ZG+Gt6UeDcfSxh8REme1/lHUY/6J8
 zMYxUoXYW4im7Nce4flV90/HFIzhOviLSKKVQ9OIq8iI95dwu7AMSMmO1dnjrxly2S+S
 y/lRMVIbs2IizdlZ6/COifW8hHXxVmZdmwIlq2QC5QeMQr0+/2cJHS9n3Rrwakrfx51i
 R0mHj358Z0VCFMp7EkytdIt+yLuTGDy2MnWluLHCSc+9KVdZBlsK8G3Buhewv532HDZ2
 ViNg==
X-Gm-Message-State: AOJu0YzNvI1blbpWdezFBtKmkjtf1QJHGvijQaZTZGTnFNwjWDvJaGn6
 0EOHKWPGjAI6xjmaBiZzlC2kGf55KUVbEP020JnD0rtbytBlS+O6
X-Google-Smtp-Source: AGHT+IFCoszAIpfTDjnKI1bHhhQ+MMfgHHW+XrPkGkT4nAtKgAewlfn4ZsyJcMltxvOlmCemaQeheA==
X-Received: by 2002:a05:600c:1c8a:b0:424:aa64:e9a9 with SMTP id
 5b1f17b1804b1-4257a04fe59mr87542935e9.26.1720013167263; 
 Wed, 03 Jul 2024 06:26:07 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1559:9300:5f5d:6303:9414:d3d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5ba51sm237197665e9.12.2024.07.03.06.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 06:26:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/ttm: support using drm_exec during eviction
Date: Wed,  3 Jul 2024 15:26:01 +0200
Message-Id: <20240703132602.4756-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240703132602.4756-1-christian.koenig@amd.com>
References: <20240703132602.4756-1-christian.koenig@amd.com>
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

Allow specifying a drm_exec object in TTMs operation context which is
used to lock objects during eviction.

This allows to handle deadlocks much more gracefully and with that
avoid returning -ENOMEM on heavily contended domains.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 75 +++++++++++++++++++++++++++---------
 include/drm/ttm/ttm_bo.h     |  3 ++
 2 files changed, 60 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 6396dece0db1..785763405b87 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -31,6 +31,8 @@
 
 #define pr_fmt(fmt) "[TTM] " fmt
 
+#include <drm/drm_exec.h>
+
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
@@ -529,13 +531,21 @@ static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
 		return false;
 	}
 
-	if (bo->base.resv == ctx->resv) {
+	if (ctx->exec) {
+		ret = drm_exec_trylock_obj(ctx->exec, &bo->base);
+
+		*locked = false;
+		if (!ret && busy)
+			*busy = true;
+
+	} else if (bo->base.resv == ctx->resv) {
 		dma_resv_assert_held(bo->base.resv);
 		if (ctx->allow_res_evict)
 			ret = true;
 		*locked = false;
 		if (busy)
 			*busy = false;
+
 	} else {
 		ret = dma_resv_trylock(bo->base.resv);
 		*locked = ret;
@@ -545,11 +555,13 @@ static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
 
 	if (ret && place && (bo->resource->mem_type != place->mem_type ||
 		!bo->bdev->funcs->eviction_valuable(bo, place))) {
-		ret = false;
-		if (*locked) {
+
+		if (ctx->exec)
+			drm_exec_drop_trylocked_obj(ctx->exec, &bo->base);
+		else if (*locked)
 			dma_resv_unlock(bo->base.resv);
-			*locked = false;
-		}
+		ret = false;
+		*locked = false;
 	}
 
 	return ret;
@@ -573,21 +585,32 @@ static int ttm_mem_evict_wait_busy(struct ttm_buffer_object *busy_bo,
 	if (!busy_bo || !ticket)
 		return -EBUSY;
 
-	if (ctx->interruptible)
+	if (ctx->exec)
+		r = drm_exec_lock_obj(ctx->exec, &busy_bo->base);
+
+	else if (ctx->interruptible)
 		r = dma_resv_lock_interruptible(busy_bo->base.resv,
 							  ticket);
 	else
 		r = dma_resv_lock(busy_bo->base.resv, ticket);
 
+	if (!ctx->exec && r == -EDEADLK)
+		r = -EBUSY;
+
+	if (r)
+		return r;
+
 	/*
 	 * TODO: It would be better to keep the BO locked until allocation is at
 	 * least tried one more time, but that would mean a much larger rework
 	 * of TTM.
 	 */
-	if (!r)
+	if (ctx->exec)
+		drm_exec_unlock_obj(ctx->exec, &busy_bo->base);
+	else
 		dma_resv_unlock(busy_bo->base.resv);
 
-	return r == -EDEADLK ? -EBUSY : r;
+	return 0;
 }
 
 int ttm_mem_evict_first(struct ttm_device *bdev,
@@ -618,7 +641,10 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 			bo = res->bo;
 			break;
 		}
-		if (locked)
+
+		if (ctx->exec)
+			drm_exec_drop_trylocked_obj(ctx->exec, &bo->base);
+		else if (locked)
 			dma_resv_unlock(res->bo->base.resv);
 	}
 
@@ -635,18 +661,30 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 	if (bo->deleted) {
 		ret = ttm_bo_cleanup_refs(bo, ctx->interruptible,
 					  ctx->no_wait_gpu, locked);
+		if (ctx->exec)
+			drm_exec_drop_trylocked_obj(ctx->exec, &bo->base);
+
 		ttm_bo_put(bo);
 		return ret;
 	}
 
 	spin_unlock(&bdev->lru_lock);
 
+	if (ctx->exec) {
+		ret = drm_exec_keep_trylocked_obj(ctx->exec, &bo->base);
+		if (ret)
+			goto error_drop;
+	}
+
 	ret = ttm_bo_evict(bo, ctx);
-	if (locked)
+	if (ctx->exec)
+		drm_exec_unlock_obj(ctx->exec, &bo->base);
+	else if (locked)
 		ttm_bo_unreserve(bo);
 	else
 		ttm_bo_move_to_lru_tail_unlocked(bo);
 
+error_drop:
 	ttm_bo_put(bo);
 	return ret;
 }
@@ -1139,13 +1177,17 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	    bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL ||
 	    bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED ||
 	    !ttm_bo_get_unless_zero(bo)) {
-		if (locked)
+		if (ctx->exec)
+			drm_exec_drop_trylocked_obj(ctx->exec, &bo->base);
+		else if (locked)
 			dma_resv_unlock(bo->base.resv);
 		return -EBUSY;
 	}
 
 	if (bo->deleted) {
 		ret = ttm_bo_cleanup_refs(bo, false, false, locked);
+		if (ctx->exec)
+			drm_exec_drop_trylocked_obj(ctx->exec, &bo->base);
 		ttm_bo_put(bo);
 		return ret == -EBUSY ? -ENOSPC : ret;
 	}
@@ -1193,13 +1235,10 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	if (ttm_tt_is_populated(bo->ttm))
 		ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
 out:
-
-	/*
-	 * Unreserve without putting on LRU to avoid swapping out an
-	 * already swapped buffer.
-	 */
-	if (locked)
-		dma_resv_unlock(bo->base.resv);
+	if (ctx->exec)
+		drm_exec_drop_trylocked_obj(ctx->exec, &bo->base);
+	else if (locked)
+		ttm_bo_unreserve(bo);
 	ttm_bo_put(bo);
 	return ret == -EBUSY ? -ENOSPC : ret;
 }
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index ef0f52f56ebc..b9e598ee13d2 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -180,6 +180,8 @@ struct ttm_bo_kmap_obj {
  * faults. Should only be used by TTM internally.
  * @resv: Reservation object to allow reserved evictions with.
  * @bytes_moved: Statistics on how many bytes have been moved.
+ * @exec: optional drm_exec object to use for locking BOs and tracking which are
+ * locked.
  *
  * Context for TTM operations like changing buffer placement or general memory
  * allocation.
@@ -192,6 +194,7 @@ struct ttm_operation_ctx {
 	bool force_alloc;
 	struct dma_resv *resv;
 	uint64_t bytes_moved;
+	struct drm_exec *exec;
 };
 
 /**
-- 
2.34.1

