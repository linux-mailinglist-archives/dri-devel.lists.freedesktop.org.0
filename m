Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 693A845BE6A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 13:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AE16E459;
	Wed, 24 Nov 2021 12:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFC96E48C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 12:44:38 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d24so4071124wra.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 04:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UPwvbufE5twqhItBxmuc7heP3lxzDn2qerUEZDXnAe8=;
 b=U0fzDDfEEIiKfbL4qNIQaVHDfW9YbEU4nRVxlkyz3Qzw5S2jNMGsYNM3NrQLqezydr
 wmMco3wF0l+9SrZFUKGmxdSNRUJsVbP1pmmGQyK31hhgXtCEwqDOJM4R8wvCxLlOe+X3
 ZywdOrlMlMSbjqsFSzzmiyfJKfNEe5IgFT+JQMtM1iHIFo1/WiM3VtwRo/FhhRRDNV4U
 7EpA0z/CeiBjCm/C+P/89+T5A9AYjxtSAtoWiND43Z8TpIHVZX72baNGYj7rd4hd2Qn0
 Gs9PimVjoWJuN0IbM1fZYupOhprUiebmNf0PnjrXR1VhcKq1tEohi0ZoULdD29d1kgv2
 jv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UPwvbufE5twqhItBxmuc7heP3lxzDn2qerUEZDXnAe8=;
 b=U7ofcQt3fobcNTqJb74+1EdCY/E/LkXWa2FSZrH4DfrchNRfoc95pdsI019RXz4/E6
 OBtV900/Xc7FkK2opoX4lojnbPOgz+DqDJIwI7kkCKe8p1tQGaJJeacNHvXYGjsVW28I
 mWfIQmP3vIj6Z/W0nIRqlXLhVblR7LbDvjEGVlHO+9P50fVMACcWZ28PFkKh+m/zNejp
 +Ct8yjKdJIXwyS2OtpVXGn5PqqXuHOlGvMNRqQ3WKaMdpkhFOQA0XMTZd2pl+kjpCqJl
 JTT8qWsoDWb3JOgKT/9fvnST56iQ5B27rdlRjiNkvOvVU8Izjvks7E4SwVIRSXUXlzmP
 VwhQ==
X-Gm-Message-State: AOAM530YnlhvJqj6m/pSuHRSJcYFLyVt5PuX0ZiB+j3HIRsunvD/ojSt
 JpcYrSsKNJfWDeU4B7IVf94=
X-Google-Smtp-Source: ABdhPJy+e4UOji328fNtAGwQqqn3uBRh7qnJltveFcBANWptDm/OsHaTOR0pt3eYNB9c2z4PhC7T5g==
X-Received: by 2002:a05:6000:1c2:: with SMTP id
 t2mr18724425wrx.378.1637757876469; 
 Wed, 24 Nov 2021 04:44:36 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id 38sm15583145wrc.1.2021.11.24.04.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 04:44:36 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, thomas.hellstrom@linux.intel.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 04/12] drm/ttm: add common accounting to the resource mgr v2
Date: Wed, 24 Nov 2021 13:44:22 +0100
Message-Id: <20211124124430.20859-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124124430.20859-1-christian.koenig@amd.com>
References: <20211124124430.20859-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c |  8 ++++++++
 include/drm/ttm/ttm_resource.h     | 20 +++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 7fdd58b53c61..b8362492980d 100644
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
 
@@ -149,6 +155,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
 	spin_lock_init(&man->move_lock);
 	man->bdev = bdev;
 	man->size = p_size;
+	atomic64_set(&man->usage, 0);
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		INIT_LIST_HEAD(&man->lru[i]);
@@ -221,6 +228,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 	drm_printf(p, "  use_type: %d\n", man->use_type);
 	drm_printf(p, "  use_tt: %d\n", man->use_tt);
 	drm_printf(p, "  size: %llu\n", man->size);
+	drm_printf(p, "  usage: %llu\n", atomic64_read(&man->usage));
 	if (man->func->debug)
 		man->func->debug(man, p);
 }
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 69eea9d6399b..3d391279b33f 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -27,6 +27,7 @@
 
 #include <linux/types.h>
 #include <linux/mutex.h>
+#include <linux/atomic.h>
 #include <linux/dma-buf-map.h>
 #include <linux/dma-fence.h>
 #include <drm/drm_print.h>
@@ -132,8 +133,12 @@ struct ttm_resource_manager {
 	/*
 	 * Protected by the global->lru_lock.
 	 */
-
 	struct list_head lru[TTM_MAX_BO_PRIORITY];
+
+	/**
+	 * @usage: How much of the region is used, has its own protection.
+	 */
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

