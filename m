Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9556F9D4ADD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 11:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5136310E1CB;
	Thu, 21 Nov 2024 10:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eIvKTCam";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A774410E1CB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 10:27:31 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4315eeb2601so8279735e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 02:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732184850; x=1732789650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EZ/cIfolAF1OSxz3JXwuu00xR6Yoj7sjsdHRk9DJb3o=;
 b=eIvKTCamNX7CmDngQPeioQjpR8eNIXawt2nsS3eJQmNYwizFu0syvXrcqG8/J05bvk
 PJWZeb5eRyno2qEqy54YHyZeIFhWQKHkvuIRhwzUdPsuPJPlCZ8zyvVe9G2w0wk8l8Mt
 qNt7JUQNOHrgP4GlOS4BUCbRO9YNfDkCXJsdynpDIHJ0oORW8MzmX0baMnx6uPUcMDZi
 okUZhuNfmnyNk4F3tfWinBohMIxQi1xUsimTYpnGdqRCjB94bY3rcGQd56ep50930V2x
 Gpqrf31O5mmy0CAV72L69pg2yiBzV7nwRbkxbeWpfS30iphNTc/7RzTHZSYDbwcnA5/B
 PDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732184850; x=1732789650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EZ/cIfolAF1OSxz3JXwuu00xR6Yoj7sjsdHRk9DJb3o=;
 b=KhV2UYZrBkJaWu+9QzJPUnoKKCwFRuGjZs4t4ovZD9sNkseU8qQHqzxd1WJ6nnw8ew
 w2KJm4fMJkSe+S8t8LJ2src9PoLLHQH7z105PHKLMMmhzp8vXJKx4mli50NAuQN8ACxE
 RhyCCn7lKqnE24hN3bJ5B8reUpy2irW4unUKh/dI+SAg2cO02KSJa+7J1mmhdvG7EJdF
 vG5p1kO89w4G/svhE4dw2Zj/c4ZbpoYDBkomgM3BIkeqSqvULZsfbdKXoTH0h2z3clYi
 qZAjnBqK9J2DGetJw1svr5vzEdWTngH9ushJIjqFqMwrKLgxSsAqH2gv2yDvoOnXAmIw
 ss1g==
X-Gm-Message-State: AOJu0Yytih6fazIisYIGOWyd0z1htVD/jfBPmbPm8LcDD5UXKqMPZwkA
 WCB7xPKehKGcqpKPS+T/ejKkca7saAL0KFMDSwOzCDop/IfHtW17WTzY8iZGC5k=
X-Google-Smtp-Source: AGHT+IGD3nzLwMr4cVx4DHQo4Xsm8HnwkLrEAQP35W4RGmoJtKXdugqcdYJ/PeLix/l1m65NmLQ8SQ==
X-Received: by 2002:a05:600c:5013:b0:431:54f3:11ab with SMTP id
 5b1f17b1804b1-4334f01e2a7mr57152485e9.33.1732184849816; 
 Thu, 21 Nov 2024 02:27:29 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1564:d000:2ed:2997:a6e4:61cb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b45d17ccsm52533165e9.6.2024.11.21.02.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 02:27:29 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: zack.rusin@broadcom.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/vmwgfx: use the new drm_exec object v2
Date: Thu, 21 Nov 2024 11:27:23 +0100
Message-Id: <20241121102725.4195-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121102725.4195-1-christian.koenig@amd.com>
References: <20241121102725.4195-1-christian.koenig@amd.com>
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

Basically just switching over to the new infrastructure like we did for
other drivers as well.

No intentional functional change, but only compile tested.

v2: fix kerneldoc issues

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c | 57 +++++++++++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h | 41 ++--------------
 2 files changed, 60 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
index e7625b3f71e0..fdcc45cd4f57 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
@@ -817,6 +817,60 @@ int vmw_validation_preload_res(struct vmw_validation_context *ctx,
 	return 0;
 }
 
+/**
+ * vmw_validation_bo_reserve - Reserve buffer objects registered with a
+ * validation context
+ * @ctx: The validation context
+ * @intr: Perform waits interruptible
+ *
+ * Return: Zero on success, -ERESTARTSYS when interrupted, negative error
+ * code on failure
+ */
+int vmw_validation_bo_reserve(struct vmw_validation_context *ctx, bool intr)
+{
+	struct vmw_validation_bo_node *entry;
+	int ret;
+
+	drm_exec_init(&ctx->exec, intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0, 0);
+	drm_exec_until_all_locked(&ctx->exec) {
+		list_for_each_entry(entry, &ctx->bo_list, base.head) {
+			ret = drm_exec_prepare_obj(&ctx->exec,
+						   &entry->base.bo->base, 1);
+			drm_exec_retry_on_contention(&ctx->exec);
+			if (ret)
+				goto error;
+		}
+	}
+	return 0;
+
+error:
+	drm_exec_fini(&ctx->exec);
+	return ret;
+}
+
+/**
+ * vmw_validation_bo_fence - Unreserve and fence buffer objects registered
+ * with a validation context
+ * @ctx: The validation context
+ * @fence: The fence to add
+ *
+ * This function unreserves the buffer objects previously reserved using
+ * vmw_validation_bo_reserve, and fences them with a fence object.
+ */
+void vmw_validation_bo_fence(struct vmw_validation_context *ctx,
+			     struct vmw_fence_obj *fence)
+{
+	struct vmw_validation_bo_node *entry;
+
+	list_for_each_entry(entry, &ctx->bo_list, base.head) {
+		dma_resv_add_fence(entry->base.bo->base.resv, &fence->base,
+				   DMA_RESV_USAGE_READ);
+	}
+	drm_exec_fini(&ctx->exec);
+}
+
+
+
 /**
  * vmw_validation_bo_backoff - Unreserve buffer objects registered with a
  * validation context
@@ -842,6 +896,5 @@ void vmw_validation_bo_backoff(struct vmw_validation_context *ctx)
 				vmw_bo_dirty_release(vbo);
 		}
 	}
-
-	ttm_eu_backoff_reservation(&ctx->ticket, &ctx->bo_list);
+	drm_exec_fini(&ctx->exec);
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
index 353d837907d8..55a7d8b68d5c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
@@ -31,8 +31,7 @@
 #include <linux/list.h>
 #include <linux/hashtable.h>
 #include <linux/ww_mutex.h>
-
-#include <drm/ttm/ttm_execbuf_util.h>
+#include <drm/drm_exec.h>
 
 #define VMW_RES_DIRTY_NONE 0
 #define VMW_RES_DIRTY_SET BIT(0)
@@ -59,7 +58,7 @@ struct vmw_validation_context {
 	struct list_head resource_ctx_list;
 	struct list_head bo_list;
 	struct list_head page_list;
-	struct ww_acquire_ctx ticket;
+	struct drm_exec exec;
 	struct mutex *res_mutex;
 	unsigned int merge_dups;
 	unsigned int mem_size_left;
@@ -106,39 +105,6 @@ vmw_validation_has_bos(struct vmw_validation_context *ctx)
 	return !list_empty(&ctx->bo_list);
 }
 
-/**
- * vmw_validation_bo_reserve - Reserve buffer objects registered with a
- * validation context
- * @ctx: The validation context
- * @intr: Perform waits interruptible
- *
- * Return: Zero on success, -ERESTARTSYS when interrupted, negative error
- * code on failure
- */
-static inline int
-vmw_validation_bo_reserve(struct vmw_validation_context *ctx,
-			  bool intr)
-{
-	return ttm_eu_reserve_buffers(&ctx->ticket, &ctx->bo_list, intr,
-				      NULL);
-}
-
-/**
- * vmw_validation_bo_fence - Unreserve and fence buffer objects registered
- * with a validation context
- * @ctx: The validation context
- *
- * This function unreserves the buffer objects previously reserved using
- * vmw_validation_bo_reserve, and fences them with a fence object.
- */
-static inline void
-vmw_validation_bo_fence(struct vmw_validation_context *ctx,
-			struct vmw_fence_obj *fence)
-{
-	ttm_eu_fence_buffer_objects(&ctx->ticket, &ctx->bo_list,
-				    (void *) fence);
-}
-
 /**
  * vmw_validation_align - Align a validation memory allocation
  * @val: The size to be aligned
@@ -185,6 +151,9 @@ int vmw_validation_preload_res(struct vmw_validation_context *ctx,
 			       unsigned int size);
 void vmw_validation_res_set_dirty(struct vmw_validation_context *ctx,
 				  void *val_private, u32 dirty);
+int vmw_validation_bo_reserve(struct vmw_validation_context *ctx, bool intr);
+void vmw_validation_bo_fence(struct vmw_validation_context *ctx,
+			     struct vmw_fence_obj *fence);
 void vmw_validation_bo_backoff(struct vmw_validation_context *ctx);
 
 #endif
-- 
2.34.1

