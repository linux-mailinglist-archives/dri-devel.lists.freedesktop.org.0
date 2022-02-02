Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6944A71DD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 14:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDD910E5C2;
	Wed,  2 Feb 2022 13:46:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F04210E480
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 13:46:55 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so4659675wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 05:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pQSqxloN4xZytT0YdL+2AdRflcFWQy2/SSgIscTA5yA=;
 b=Iv5KB4dHB/86+nZneAAeILIRIlyCbIE5SZ6/XCiaBcnlCOMJABQy+z5gf/a9i8CZpJ
 Sn6LiUeE8Q/mfX7EzmRdQD+hk5nbytyjna9YEeqPRoWTjPhOierFqV2FP9I3nW/0J0DE
 mDpNkQQhbKFNNYJpVOm0mEXg2mwN6Zei/LjMcXvO+xcxTnQnId0xWJuiFUKnP5RYWuag
 xPdXgZg40nfvpRXIE2qvarHOMMlYE5L4BahLN0cwMjT4p/Pv9Hkfpyc6SEUxE4eSpsxW
 x7/Dq2OGWKYBKKscNOhowBk0UlifAE6gUwT+peRUUc+xX9CoLFiyz13IXT5+2+iNAX/C
 Fz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pQSqxloN4xZytT0YdL+2AdRflcFWQy2/SSgIscTA5yA=;
 b=KGXZ7E4S6MS/HmJRNGNm5A6NmSG5gBoAw6p94bwaNuxz8soBS5tOgqld687AaSaHa1
 ivWaowKDqhTuPNd5vXsCOwq2ODGfIvfS8KQJ959xpFEQxbC4OMYIHW/q6Tgy7kLaEeH/
 b5ouCfs2bCXVIQ7Xv3kTEKUA9YK5BBmkME4Ph7OQpCpHyfj+ViNEzr6iKszE5RrKg0fG
 HrFWUwQQIWh8A0sfxlZMRnAKmogrS03Tu9LwdBL4MnCppSXCNYTOpj1ef4PreH+1XDi6
 goIlbu6nkwyacVJLUToDlBcJXXvTJE5tds0HY+RZPGNbxWb9q00MviQRlJGGElm8o0WX
 Dlig==
X-Gm-Message-State: AOAM530I+DueOrtFAXZ0JReoR5nyZ8blE4vNenccpvRxSRZEwCaQloJg
 38bBYXhceNMoSyXfCxoBnObDb3dNbJE=
X-Google-Smtp-Source: ABdhPJyOmA0uJ73sxtGg/mI6Io4O+xyWUwrj/tiW0qAwVpEUC7wN6AcsM8ft9Cg7rKq1RnEfrDOBiw==
X-Received: by 2002:a05:600c:19ce:: with SMTP id
 u14mr6152369wmq.92.1643809613565; 
 Wed, 02 Feb 2022 05:46:53 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id c13sm17471876wrv.24.2022.02.02.05.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:46:52 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch
Subject: [PATCH 1/9] drm/ttm: add common accounting to the resource mgr v3
Date: Wed,  2 Feb 2022 14:46:43 +0100
Message-Id: <20220202134651.296584-1-christian.koenig@amd.com>
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

It makes sense to have this in the common manager for debugging and
accounting of how much resources are used.

v2: cleanup kerneldoc a bit
v3: drop the atomic, update counter under lock instead

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Huang Rui <ray.huang@amd.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 30 ++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_resource.h     | 11 +++++++++--
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 68344c90549b..7f9ec64ebaba 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -41,6 +41,8 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
                        const struct ttm_place *place,
                        struct ttm_resource *res)
 {
+	struct ttm_resource_manager *man;
+
 	res->start = 0;
 	res->num_pages = PFN_UP(bo->base.size);
 	res->mem_type = place->mem_type;
@@ -50,6 +52,11 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	res->bus.is_iomem = false;
 	res->bus.caching = ttm_cached;
 	res->bo = bo;
+
+	man = ttm_manager_type(bo->bdev, place->mem_type);
+	spin_lock(&bo->bdev->lru_lock);
+	man->usage += bo->base.size;
+	spin_unlock(&bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_resource_init);
 
@@ -65,6 +72,9 @@ EXPORT_SYMBOL(ttm_resource_init);
 void ttm_resource_fini(struct ttm_resource_manager *man,
 		       struct ttm_resource *res)
 {
+	spin_lock(&man->bdev->lru_lock);
+	man->usage -= res->bo->base.size;
+	spin_unlock(&man->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_resource_fini);
 
@@ -166,6 +176,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
 	spin_lock_init(&man->move_lock);
 	man->bdev = bdev;
 	man->size = p_size;
+	man->usage = 0;
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		INIT_LIST_HEAD(&man->lru[i]);
@@ -226,6 +237,24 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
 }
 EXPORT_SYMBOL(ttm_resource_manager_evict_all);
 
+/**
+ * ttm_resource_manager_usage
+ *
+ * @man: A memory manager object.
+ *
+ * Return how many resources are currently used.
+ */
+uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man)
+{
+	uint64_t usage;
+
+	spin_lock(&man->bdev->lru_lock);
+	usage = man->usage;
+	spin_unlock(&man->bdev->lru_lock);
+	return usage;
+}
+EXPORT_SYMBOL(ttm_resource_manager_usage);
+
 /**
  * ttm_resource_manager_debug
  *
@@ -238,6 +267,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 	drm_printf(p, "  use_type: %d\n", man->use_type);
 	drm_printf(p, "  use_tt: %d\n", man->use_tt);
 	drm_printf(p, "  size: %llu\n", man->size);
+	drm_printf(p, "  usage: %llu\n", ttm_resource_manager_usage(man));
 	if (man->func->debug)
 		man->func->debug(man, p);
 }
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 69eea9d6399b..5516d6340aa7 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -27,6 +27,7 @@
 
 #include <linux/types.h>
 #include <linux/mutex.h>
+#include <linux/atomic.h>
 #include <linux/dma-buf-map.h>
 #include <linux/dma-fence.h>
 #include <drm/drm_print.h>
@@ -130,10 +131,15 @@ struct ttm_resource_manager {
 	struct dma_fence *move;
 
 	/*
-	 * Protected by the global->lru_lock.
+	 * Protected by the bdev->lru_lock.
 	 */
-
 	struct list_head lru[TTM_MAX_BO_PRIORITY];
+
+	/**
+	 * @usage: How much of the resources are used, protected by the
+	 * bdev->lru_lock.
+	 */
+	uint64_t usage;
 };
 
 /**
@@ -283,6 +289,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
 int ttm_resource_manager_evict_all(struct ttm_device *bdev,
 				   struct ttm_resource_manager *man);
 
+uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man);
 void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 				struct drm_printer *p);
 
-- 
2.25.1

