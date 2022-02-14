Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8094B4657
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 10:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286AB10E26D;
	Mon, 14 Feb 2022 09:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD1110E261
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 09:34:43 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id h18so3760932edb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 01:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JcBc4Y/pdR2W2P6L5ZXP/E16wKk1rLD/x7j5S6JqlvU=;
 b=kDd9ZnXqSVEYrH5p+UKNcrq79t0/JTcgYF6Yhl8U3SMZhddrFR6EU/jYHGZ0gyy9B7
 46tOqtarYnCJe2L7EIzd7TjS7Ik7+NYA80AFEJaBAG3mb3CCUCwjlqQYyrRaq0bsPf2o
 AZLd/+W+S9w1mS9Xa8ETZqH9WFsa7+d6uRb4bQw0JS8Ja24bQpQZOZr2FiokpcwnvGw0
 xAn/gyX2jxmVPYHMku+4EvBs28tm90iyqqTWC6wL5ZRJQ62znXB1BLL8OtM8GTzAA7Od
 M9qLKqD2EftlRwFNpSJAqTNVg+uaQklvxS/VRUKmpQbY2DS37NvlGwPzIIQHNzlFj7Bz
 DBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JcBc4Y/pdR2W2P6L5ZXP/E16wKk1rLD/x7j5S6JqlvU=;
 b=27pjWZcQeLYbFXouwSeTNhBoAFTxqZD/ERKKF1udHuCnHB6ZomVTpgTLzkrc8lcJ8d
 M5BgWeB3iLAeSFXC6huItqf7/m/CWnS6IT2jSVS6RMcsZyqZgDNYYNrhJgYYx+Ckjl4T
 5OSl+iYfvPBZgjMBsKPWZ2Tkqjo8OVjhoXSo1elt6ysfcAv5mqH1PzBEN6Y/Zzc2IOvf
 ZKqWooKC9Con1HkFSSZLR/sQbpX1bKaRImX11ETWAiWx/PtJQNm1z+GeoHGtqgTJVrfA
 XOXSmQf9Z+WZxrLrujGD1TwX/MfmYGUfzUXUxIRJt5fKpBCpGQN33FnukOVvsXuhCE2T
 ma8w==
X-Gm-Message-State: AOAM531deBQ10VUQhrA+Aci/nXlI3qMH1x90x86Q0MRk7YsdFmrI+5XO
 S+7nwT09s0uUgTOy3yhdlag=
X-Google-Smtp-Source: ABdhPJzqGZEZGAZYnzHUObyjKADE3EPP0sH1VWHhIGagbHkRahUCjIWvwu2Gowm9ZF1JJ0m6XRhVKw==
X-Received: by 2002:a05:6402:2691:: with SMTP id
 w17mr14341680edd.126.1644831281593; 
 Mon, 14 Feb 2022 01:34:41 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id y8sm4257940edc.41.2022.02.14.01.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 01:34:41 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com, daniel@ffwll.ch,
 thomas.hellstrom@linux.intel.com, felix.kuehling@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 02/11] drm/ttm: add common accounting to the resource mgr v3
Date: Mon, 14 Feb 2022 10:34:30 +0100
Message-Id: <20220214093439.2989-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214093439.2989-1-christian.koenig@amd.com>
References: <20220214093439.2989-1-christian.koenig@amd.com>
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
Reviewed-by: Huang Rui <ray.huang@amd.com> (v1)
Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 30 ++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_resource.h     | 11 +++++++++--
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index ae40e144e728..bbb8a0f7aa14 100644
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
 	man->size = size;
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
index 555a11fb8a7f..323c14a30c6b 100644
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

