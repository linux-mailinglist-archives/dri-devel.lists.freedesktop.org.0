Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E3792D1D7
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 14:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8CE10E78D;
	Wed, 10 Jul 2024 12:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jkNgdLNJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56F610E787
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:43:10 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-58be2b8b6b2so7950749a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 05:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720615389; x=1721220189; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3IudXMkmOGnBAKAh9aEHKOVaR8ZFNG/6gQf1mC18+Yo=;
 b=jkNgdLNJ5a0JGrFpbWrBiRIeZzbxcA6P7rcj+2ciRBJ0DJgBgibCBC4gFy0TUvRLU3
 tHXj7vB54o/FFbqbWYqJwwH+4n1DC6beqhnaEV5TwNTycMkINdspB883sgAJYBaUQudZ
 loazwlyMoDN1U4+qnndt/70tmWK1DCMO4PD028dwvALiNkkQAeYicPCyYAqzYhJyiXuA
 JOhYGRu+tnt5q0bUdXpUt8BHgtDPfxfzhfzRva0CytEmnspdDxABaiUCw18cEM4nVeQ7
 jHvzjpk+VMKDQV2p0Efp8os1tGfaA8IvBp/t4FN1YiuMQ21ET/mNOFCLza8GfHcP+ljK
 V6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720615389; x=1721220189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3IudXMkmOGnBAKAh9aEHKOVaR8ZFNG/6gQf1mC18+Yo=;
 b=cCTEj6I0wyd+DfpXlg8OezWVLgsjq6yxF1JMaEFvnwcI2LRPgwfd6WzmTE7qwkfSB6
 Q99D7TcQcI6kbkhG13e6DRwA1aOVGU9l3Ak9sv5M+Fz1q3+at+JESca/79B7kyUAR6NJ
 gfzlGY9lW7lvcT2hKhqT84LngLNvd/wIIfT+Mbn/Dd/7M4S9dZpZg7NJpvnPWYhB9K86
 q1qMCKySv7ywUG3dW0DUSGFyskb5uFK8jA6m6q1uGaI1O8h97SQcuPU4xp3wm88U2+UG
 7230jx7i9W3zmHV/fqiPp2UISXHf7iwcKLucsvOEEpFXp3dL4zP6MZuJph69klmlrMKg
 Kxng==
X-Forwarded-Encrypted: i=1;
 AJvYcCV56WGR+09djsLrJiVhX1JC5dL5FiaRtFsRkBB+Vusn9rvhz9aXwmpp6oapG1AeafMKITGoem7tU+fuGLjQ1sGWOzeTggd3iuaRrK13tkMR
X-Gm-Message-State: AOJu0YybjLY4h0Iwj8wJOFSdVQtVT4UqsmGq1u2AhZvx+CUPZxMDFPe2
 0wumggrkGUNk22FVHOKQvpXc7oPLkoliSVVfXsgozHBN4eH9of8k6fM4CoylfX4=
X-Google-Smtp-Source: AGHT+IE3UVenv0a09ve8iTEwAtYZ0/8SIcRXOoG1MT2xdezugAc9QE8reTPFy0jTVJNuQTLOfUsi/Q==
X-Received: by 2002:a05:6402:5cd:b0:57c:fd20:352c with SMTP id
 4fb4d7f45d1cf-594bc7c8337mr4106938a12.34.1720615388666; 
 Wed, 10 Jul 2024 05:43:08 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1504:6f00:b310:1e44:6e5e:7646])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bb9604f7sm2171868a12.15.2024.07.10.05.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 05:43:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/ttm: support using drm_exec during eviction v2
Date: Wed, 10 Jul 2024 14:43:00 +0200
Message-Id: <20240710124301.1628-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710124301.1628-1-christian.koenig@amd.com>
References: <20240710124301.1628-1-christian.koenig@amd.com>
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

v2: rebased on top of Thomas work

TODO: This still doesn't handle BOs which are about to be torn down
correctly.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 45 +++++++++++++++++++++++++------
 drivers/gpu/drm/ttm/ttm_bo_util.h |  2 ++
 include/drm/ttm/ttm_bo.h          |  3 +++
 3 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 7a4bc7e9950b..850e329ab5a5 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -36,6 +36,7 @@
 #include <drm/ttm/ttm_tt.h>
 
 #include <drm/drm_cache.h>
+#include <drm/drm_exec.h>
 
 #include "ttm_bo_util.h"
 
@@ -776,15 +777,22 @@ static bool ttm_lru_walk_trylock(struct ttm_lru_walk *walk,
 {
 	struct ttm_operation_ctx *ctx = walk->ctx;
 
+	walk->needs_drop = false;
 	walk->needs_unlock = false;
 
-	if (dma_resv_trylock(bo->base.resv)) {
-		walk->needs_unlock = true;
+	if (bo->base.resv == ctx->resv && ctx->allow_res_evict) {
+		dma_resv_assert_held(bo->base.resv);
 		return true;
 	}
 
-	if (bo->base.resv == ctx->resv && ctx->allow_res_evict) {
-		dma_resv_assert_held(bo->base.resv);
+	if (walk->ctx->exec) {
+		if (drm_exec_trylock_obj(walk->ctx->exec, &bo->base)) {
+			walk->needs_drop = true;
+			return true;
+		}
+
+	} else if (dma_resv_trylock(bo->base.resv)) {
+		walk->needs_unlock = true;
 		return true;
 	}
 
@@ -797,7 +805,9 @@ static int ttm_lru_walk_ticketlock(struct ttm_lru_walk *walk,
 	struct dma_resv *resv = bo->base.resv;
 	int ret;
 
-	if (walk->ctx->interruptible)
+	if (walk->ctx->exec)
+		ret = drm_exec_lock_obj(walk->ctx->exec, &bo->base);
+	else if (walk->ctx->interruptible)
 		ret = dma_resv_lock_interruptible(resv, walk->ticket);
 	else
 		ret = dma_resv_lock(resv, walk->ticket);
@@ -811,7 +821,8 @@ static int ttm_lru_walk_ticketlock(struct ttm_lru_walk *walk,
 		 * trylocking for this walk.
 		 */
 		walk->ticket = NULL;
-	} else if (ret == -EDEADLK) {
+
+	} else if (!walk->ctx->exec && ret == -EDEADLK) {
 		/* Caller needs to exit the ww transaction. */
 		ret = -ENOSPC;
 	}
@@ -822,7 +833,15 @@ static int ttm_lru_walk_ticketlock(struct ttm_lru_walk *walk,
 static void ttm_lru_walk_unlock(struct ttm_lru_walk *walk,
 				struct ttm_buffer_object *bo)
 {
-	if (walk->needs_unlock)
+	if (walk->needs_drop)
+		drm_exec_drop_trylocked_obj(walk->ctx->exec, &bo->base);
+
+	if (!walk->needs_unlock)
+		return;
+
+	if (walk->ctx->exec)
+		drm_exec_unlock_obj(walk->ctx->exec, &bo->base);
+	else
 		dma_resv_unlock(bo->base.resv);
 }
 
@@ -891,8 +910,18 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 		spin_unlock(&bdev->lru_lock);
 
 		lret = 0;
-		if (!bo_locked)
+		if (!bo_locked) {
 			lret = ttm_lru_walk_ticketlock(walk, bo);
+		} else if (walk->ctx->exec && !bo->deleted) {
+			lret = drm_exec_keep_trylocked_obj(walk->ctx->exec,
+							   &bo->base);
+			if (!lret) {
+				walk->needs_drop = false;
+				walk->needs_unlock = true;
+			}
+		} else {
+			lret = 0;
+		}
 
 		/*
 		 * Note that in between the release of the lru lock and the
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.h b/drivers/gpu/drm/ttm/ttm_bo_util.h
index c653e16ccb76..5e1bb156837f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.h
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.h
@@ -59,6 +59,8 @@ struct ttm_lru_walk {
 	struct ww_acquire_ctx *ticket;
 	/** @tryock_only: Only use trylock for locking. */
 	bool trylock_only;
+	/** @needs_drop: If the current BO needs a drm_exec trylock drop */
+	bool needs_drop;
 	/** @needs_unlock: If the current BO needs unlocking */
 	bool needs_unlock;
 };
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 5f7c967222a2..5bee917e01e2 100644
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

