Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131374AECC4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D39710E546;
	Wed,  9 Feb 2022 08:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88F710E4FE;
 Wed,  9 Feb 2022 08:41:04 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id j14so5150881ejy.6;
 Wed, 09 Feb 2022 00:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QKS7y+9kX4aX1kpgqOhQf3iTSaDJRFdOq/M9veAHL+E=;
 b=QJZQ2K0V5RHuqeifVSJuUWrNKbLDuULkMgOBdUNQ8MuHbXz+g4hE4DYqhKGcokCG9I
 sgsDgwRcKYE8GBTH2w/S0FuYqNOLkMPiDV0p0nIqO5BnmFoUqWogETAVN8k/g5z8TQ93
 jBse68GrFk9Fxwio+a12tCf7fjADNPEvOiMLFnpJE3TsvLlxSuQe0NXO5WcfbF/cDJat
 MeKhpaUojs9Ay52ab5JBFuc5OPwW1ugT/3RNAhjGHKV48xj1mas3U16kSA2NUw3p4lVH
 iRX9I6zahFgStjKLtvbnB0oj0dbhChY5jF3HmSte8ogw8RD/DEqIOyPRLOzhM2R7WFb1
 8Qhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QKS7y+9kX4aX1kpgqOhQf3iTSaDJRFdOq/M9veAHL+E=;
 b=fgA/fLCG+lOqKBiioUbRfh1hbgsYyWdxbiKVTchvtv5fYXBkvZ3lMuhwlIE69Lv1nQ
 vWVXOLZ/TubbvFhQcmt6YlCfShxaKNKsyWrxR7WEJGTxlro/liuUmnSEWTLRvPomQQGk
 JncGbS3efTuheIqVmZNpSViyQrVeCH4gVWJNVZLCtIduYaK2SqNFfnZBFq017S3mKxU3
 S+PVEYotNnbVD8LUT4j0Y2plRmSvOSXNA4TSMNNPwwrsujYgieBvuMMPQIRG5MMWB5YK
 sRL2VudVQgXcMSsDEBqaMTT4jAkiVKDmARlsfSO8qJQeYVkeKAw+5mQ0gsggpy3aGAkO
 qKLQ==
X-Gm-Message-State: AOAM532FHebx6zQnn4k23ghmwjoy6La+93O2mO6Arj/PDc0w/Db6PBWG
 +X2qRWDCdDNFc/hTcCqh+aw=
X-Google-Smtp-Source: ABdhPJya8LPRm1HabJ62fOvrgrMBxuHBVgbNrnMJZhEArhMMCvODat7VfZM8dti8JNpZFrSqWcL5JA==
X-Received: by 2002:a17:907:2da5:: with SMTP id
 gt37mr961443ejc.529.1644396063138; 
 Wed, 09 Feb 2022 00:41:03 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id u6sm3807958eje.101.2022.02.09.00.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 00:41:02 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ray.huang@amd.com,
	daniel@ffwll.ch,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH 1/9] drm/ttm: add common accounting to the resource mgr v3
Date: Wed,  9 Feb 2022 09:40:51 +0100
Message-Id: <20220209084059.1042345-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209084059.1042345-1-christian.koenig@amd.com>
References: <20220209084059.1042345-1-christian.koenig@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

