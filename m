Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A5B3CD42B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 13:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55646E112;
	Mon, 19 Jul 2021 11:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916966E082
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 11:51:49 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 m11-20020a05600c3b0bb0290228f19cb433so12669218wms.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 04:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=G2vHN+bTUYSQ2US4i5PYvuofuUrn3gnahlp/cTTw8xI=;
 b=hQpVn0FwOktOGsvVBEX70otokKDhf27KFNDIskMB5IuHfGSSQ1kpnNYYRXUOVzFzx2
 NomG9hA4xmyYcvoR+2sEdabDzNN0/Fyt0jPzD5sftDzgJvkRgTUjd8zVq2vTXCjaaGc5
 UDn2sddQwxwAFXrvU2qpJB7RKpC0batqSldNx7gPdDXXaqB5rDT4BdCscigZS39gt5mc
 gqXhDt136ipyq4Lxrqgdo6iwGl5HPyAVfmW/aWzVkCgR07D8E+dRaG3j12s9Wq+WBu2k
 Do3xv6jCaVvixZZhZmtv4st0iwen3an2yQ8h/uXN1Y0WzyqYPkE+McDgNdJegnMaJj4b
 euJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G2vHN+bTUYSQ2US4i5PYvuofuUrn3gnahlp/cTTw8xI=;
 b=c0bNqZ0JWsOlynai3ZTbV0QFxC/VGjoEsWBxw5f8rvzkzy16/JKH0oDgiOrbbh7jdS
 QFDY7GsKWtm+pPqF6u8nAh345ALzo1zkm/TJYdGjeu2OSpLmRXJ7g1LujLEk4VSJdF1o
 pR71spxL5OG53+4z3UkLsO2M/BL23/g4/D/oaTfJAvWcrCGXlGW9kPeAMPUTre+O7Jbc
 BkRfUvWV2PsIk2AxOCbPLSctpJwPMZ+6hnJnY0pA96iBmqQfHqDqAvVsBPeNBgDzq9K3
 3dRxNHAqC9XtGrDMCm77GyqJKD4I9/09gqJZFhrkOqode3eOFGoOfEdqy/f4xOiTHOLs
 Sfvw==
X-Gm-Message-State: AOAM530p/m9pmFDyV8DBFO8XHTbKKEniqwy4vjEqs664C0DG+vX5unKD
 N8uto1jlZiEcOFrqCgRyxg9AU5H/ktY=
X-Google-Smtp-Source: ABdhPJyARNnngSYMfe5MULyzuPaCBvO647jqwpjKYoafSvmkRceFxXjzLLFL4JTJGCmOry1FKk4VEQ==
X-Received: by 2002:a05:600c:ad6:: with SMTP id
 c22mr31922596wmr.149.1626695508119; 
 Mon, 19 Jul 2021 04:51:48 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:bb37:8df9:3c3c:217f])
 by smtp.gmail.com with ESMTPSA id p5sm16034104wme.2.2021.07.19.04.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 04:51:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/ttm: add common accounting to the resource mgr
Date: Mon, 19 Jul 2021 13:51:43 +0200
Message-Id: <20210719115145.1260-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719115145.1260-1-christian.koenig@amd.com>
References: <20210719115145.1260-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c |  8 ++++++++
 include/drm/ttm/ttm_resource.h     | 18 ++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 8e890de9af7e..5f1ff1354fba 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -33,6 +33,8 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
                        const struct ttm_place *place,
                        struct ttm_resource *res)
 {
+	struct ttm_resource_manager *man;
+
 	res->start = 0;
 	res->num_pages = PFN_UP(bo->base.size);
 	res->mem_type = place->mem_type;
@@ -42,12 +44,16 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	res->bus.is_iomem = false;
 	res->bus.caching = ttm_cached;
 	res->bo = bo;
+
+	man = ttm_manager_type(bo->bdev, place->mem_type);
+	atomic64_add(bo->base.size, &man->usage);
 }
 EXPORT_SYMBOL(ttm_resource_init);
 
 void ttm_resource_fini(struct ttm_resource_manager *man,
 		       struct ttm_resource *res)
 {
+	atomic64_sub(res->bo->base.size, &man->usage);
 }
 EXPORT_SYMBOL(ttm_resource_fini);
 
@@ -89,6 +95,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
 
 	spin_lock_init(&man->move_lock);
 	man->size = p_size;
+	atomic64_set(&man->usage, 0);
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		INIT_LIST_HEAD(&man->lru[i]);
@@ -161,6 +168,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 	drm_printf(p, "  use_type: %d\n", man->use_type);
 	drm_printf(p, "  use_tt: %d\n", man->use_tt);
 	drm_printf(p, "  size: %llu\n", man->size);
+	drm_printf(p, "  usage: %llu\n", atomic64_read(&man->usage));
 	if (man->func->debug)
 		man->func->debug(man, p);
 }
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 8e116c0a276d..b133997f55ce 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -27,6 +27,7 @@
 
 #include <linux/types.h>
 #include <linux/mutex.h>
+#include <linux/atomic.h>
 #include <linux/dma-buf-map.h>
 #include <linux/dma-fence.h>
 #include <drm/drm_print.h>
@@ -112,6 +113,7 @@ struct ttm_resource_manager_func {
  * static information. bdev::driver::io_mem_free is never used.
  * @lru: The lru list for this memory type.
  * @move: The fence of the last pipelined move operation.
+ * @usage: How much of the region is used.
  *
  * This structure is used to identify and manage memory types for a device.
  */
@@ -135,6 +137,9 @@ struct ttm_resource_manager {
 	 * Protected by @move_lock.
 	 */
 	struct dma_fence *move;
+
+	/* Own protection */
+	atomic64_t usage;
 };
 
 /**
@@ -261,6 +266,19 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
 	man->move = NULL;
 }
 
+/**
+ * ttm_resource_manager_usage
+ *
+ * @man: A memory manager object.
+ *
+ * Return how many resources are currently used.
+ */
+static inline uint64_t
+ttm_resource_manager_usage(struct ttm_resource_manager *man)
+{
+	return atomic64_read(&man->usage);
+}
+
 void ttm_resource_init(struct ttm_buffer_object *bo,
                        const struct ttm_place *place,
                        struct ttm_resource *res);
-- 
2.25.1

