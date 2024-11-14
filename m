Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4331F9C8E10
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 16:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307D610E80E;
	Thu, 14 Nov 2024 15:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SrbjcJet";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A98210E80C;
 Thu, 14 Nov 2024 15:30:29 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a9acafdb745so151300166b.0; 
 Thu, 14 Nov 2024 07:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731598227; x=1732203027; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5FnZ9AMjiL+5LBp0zOTics7Ga5/djcimKqH32qBiMpo=;
 b=SrbjcJet+bnVKyPsxO7yO6q5OdbAVfn7kpaYtD6J/fAZ6W5XVO+EsTB2s1fyAZ7RYB
 SmVA4qVxpGRpmEG3ugQiGjaxxF3Nlt3YFsur+gX+4gcI1EGftBpe2RlWW1TbSVcFDXp+
 7mIwcpmCQH8igvPpv+heFoho5i/qBK0brCc2BHldkzNxXrFj9Bpj2bjGLorAi9X428vA
 +Jn4fSRf6XSWY8cwtFggMrLVpi77ejKTaRrj9nkqk3xtyzFSseR7AV/unp/4PdX2A+4N
 KedCior1ubXDv8tV+gx6BUW+RBv5Pms7X0qb29FtQGZe98NXTWf740bVQRewsaJ8pjk5
 OJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731598227; x=1732203027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5FnZ9AMjiL+5LBp0zOTics7Ga5/djcimKqH32qBiMpo=;
 b=Ti58NUJPo206JmFkYGuoZWtaTs0IpUCytKw9HwLIYR3EP983SN0VZV5fQIous0rk7w
 IB7G9alhVnIJ7fnKbGVjo+8GZTSnVN9tfS/3L04ongHkyRVTFgPMh9Rj5XeW2M73e6PZ
 8AwzQ+WC3PvtUnCBgodpQ8puBK4Cx5XKf+/NowKkZf48aEOKgqEoD0yqZNShupkTIRfU
 zgXK6Rqg7PlFYEEzg0Thq0wG59NKIrUeYwcgTl4KXuRyxNxWeGziUiRtkshsIMlB+84K
 Yb6AZ+nyBnJIBgGgzwDzMdHVun/Puw+lZJKC66ewp/+Ouo3g1tDw0+TSTwgeEfrJYz7L
 FONA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDzYllhUpNx4yHY9fJDuF0taMbbOqiGb/Hefk5M/NOCFOEPGIs76P4t1f3aWMHtECBg+ca+pU52bfD@lists.freedesktop.org,
 AJvYcCWYOQCqRBcJxuFDMN4hKw0LyJ8jDw7zVENP3Gukc+84tkfSpHkNPf7PqRsufu/D7cU6JaLYRprPdZQ=@lists.freedesktop.org,
 AJvYcCXws/wFmH9bOydRyLroLcyU0BxUMdEdNy2gFu2IIYaZgM9wbcjXunEVoXL+1VMernVCbbbYu+7D@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3Vmt7MnjaOWbhdY16Y8ECVc/8kfHuoQciQ/sC73cUwkg6w+ns
 soCWvlcwllKNXt5AdfH8slyknOf9/NT9naS/75t3tDfanLCrjASn
X-Google-Smtp-Source: AGHT+IG0MhpL2bfsjO7oFhiu1DPNn8UYJ1U5jKc9Ladp8n5xy/VQpNkMetFUYhpz4NXL0lkdlF24CQ==
X-Received: by 2002:a17:906:c9ce:b0:a99:facf:cfc with SMTP id
 a640c23a62f3a-aa20775759bmr308768466b.17.1731598227138; 
 Thu, 14 Nov 2024 07:30:27 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15c9:2500:bb23:40f5:fe29:201])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e046919sm74063266b.156.2024.11.14.07.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 07:30:26 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: kraxel@redhat.com, airlied@redhat.com, alexander.deucher@amd.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 4/7] drm/vmwgfx: use the new drm_exec object
Date: Thu, 14 Nov 2024 16:30:17 +0100
Message-Id: <20241114153020.6209-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114153020.6209-1-christian.koenig@amd.com>
References: <20241114153020.6209-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c | 56 +++++++++++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h | 41 ++--------------
 2 files changed, 59 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
index e7625b3f71e0..34436504fcdb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
@@ -817,6 +817,59 @@ int vmw_validation_preload_res(struct vmw_validation_context *ctx,
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
@@ -842,6 +895,5 @@ void vmw_validation_bo_backoff(struct vmw_validation_context *ctx)
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

