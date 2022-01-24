Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEA4497F61
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 13:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499DB10EA4F;
	Mon, 24 Jan 2022 12:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C0F10E8BC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 12:25:20 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id u15so13244294wrt.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 04:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UXn8v4gDRQLa7yCgiM90E9GBqmcF2E/H65e/pHnK8to=;
 b=efanpkRoklGuVG0ex3r+HqS+ijixFVlEIG4Ue6nYW5Gfgb0P2XxUWzlAxPSdY6VGcc
 fgVGFzp7BjmEdZnAPdk8Vv+w7TNMEY+2T53QS/Efv2iS9WQ90zCh2PDd2nCCr2sXn8hd
 kLL2KKEyq9b6g2ovf7vW+/xQGTykiXPn4PDQUxP6ztsjNVSwMfQWYRgtPH/ab8K6swAT
 6BGrWPSH7sAJQ1neCAuxwOseJ6pzbkZyb40BcAFDloAtEcKs1h/l2tLVk0pz9uzBszC+
 ViSup5F57dj+62AJPOx7qLvi0xMZRhBumMDyIOl3glzaSBm/1nhIs1EKs15jqyC1TFVP
 Or8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UXn8v4gDRQLa7yCgiM90E9GBqmcF2E/H65e/pHnK8to=;
 b=CPfgItBGGX+7HoN76Yv+wJNW3QClTv6JbuBxk7BdnyikHEmGD4cRF94hT2gdmY5aU5
 G1to8rDfCWbWsjn+DaW4Wc4QxT1oJ+XbjECpVtR6qVbtPRVUvW8RnDl3kCvzehQ2N8HB
 nP0jruu/P+L9JXYdeZPBoW5Wo/4VlwwwswvMmWwITdm5Ls55ZB1WIXp/4LWS3l8MIbjW
 FdvJz5NYfScANcWcylUFmTFdGpblgy++dA+PTjl6vtXy2Xau4Uh/nqYakMGxekLs7KM4
 /8FFmGzNgqTAZecP78FOn54kRwB/bBDDLjxBaQzg9LvpcR2O6tFDJg8841r3s8H/iad8
 21GA==
X-Gm-Message-State: AOAM530tOCxH5RxqrQ0RNeNJVM2nCImK5YZrvxl4hk1twQTU983CfB/i
 8BeaZLfKZkDmU9uvP5JayoE=
X-Google-Smtp-Source: ABdhPJzOT3SH+PaAeaS1Z/8yDvkoqVOevxa3CC8zAcTsHGNH1kV78HDjdzvZTK/wv3bJ9OxGzZggeQ==
X-Received: by 2002:adf:a141:: with SMTP id r1mr13536285wrr.124.1643027119470; 
 Mon, 24 Jan 2022 04:25:19 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id 1sm12830516wmo.37.2022.01.24.04.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 04:25:19 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ray.huang@amd.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, bas@basnieuwenhuizen.nl
Subject: [PATCH 04/12] drm/ttm: add common accounting to the resource mgr v2
Date: Mon, 24 Jan 2022 13:25:06 +0100
Message-Id: <20220124122514.1832-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124122514.1832-1-christian.koenig@amd.com>
References: <20220124122514.1832-1-christian.koenig@amd.com>
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
Reviewed-by: Huang Rui <ray.huang@amd.com>
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

