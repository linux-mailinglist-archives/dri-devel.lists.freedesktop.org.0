Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 592C83FB2C0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 10:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0BA89CCB;
	Mon, 30 Aug 2021 08:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1DD89C2C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 08:57:13 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i6so21384827wrv.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 01:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CFIHiLqPmAtc6Sndl6tUBZNtdb689DpmnvoJeq/bOKI=;
 b=PJE8uaF9SYE01nEfj4ueKxeaSDsTFhrbYwECyjkzRiOFAKlseSzGM9HuAMfHUhwWIg
 DApbODlU/03ceymUPyhOgiNem0bYVfiwBMVEvpTvBRkZIGRAg2nG20y+45VSzKTmlgLT
 Fzdn33mWxwFcqIfug46OFgH2yCs2Svk++6rRWWUQuRQyIVq9Hv0Wha5MXFrKME32VLia
 SsIN8AKLTpesBO48l9ykmoXEz8+ii0feNgUgHjsT2HzlONNCSX+3GOE7DgUSQsZ2ABdi
 CvUKZzZ0ho8zBjLMtUNG1oBkJfivDOS1aTVm+2jIqOUYJVOut9y0S4+WtazcEC4dwG5l
 DR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CFIHiLqPmAtc6Sndl6tUBZNtdb689DpmnvoJeq/bOKI=;
 b=VC4+uEdr0EZP4pa/vnlhZVDMN3NXrPZCAbljzXNXVj5oZlB/1lsvwohI9f5X150Onl
 D5fLWDgIwXT19cMfrkLWJ25Q4BkBMLE6XKoUqAMrF/2wWrgaj5HjBThTZiYjzeK+h4yv
 HCowXD04ixvGigYTjwi0jLai9F6cZSfyH9GYRk0qQKHqyp3VgCRjkF6tHzU9UeIUpSd+
 pOTltuz1gZ7jEvnYvuIinCx2YvwvJI3pv0qDS0k/HqCi7kO6AK9MgLQljukTw/Q/osFo
 pig6027/5GrMN4LpV1C/dKPf82aRb3XUqVpVo9luoG8T2nmJ6Ll3UmFnX1fE+oVN1lXK
 g6Lg==
X-Gm-Message-State: AOAM530TGZ2b32rEjjm6hL20Tp3Vfozk72rTrgl1+g+kN+x6kJH3Ur+t
 +sEYYVTiyXCflZbv0KhdDTDHZY7xmAhlJBhV
X-Google-Smtp-Source: ABdhPJwnl2NaV8Uxs0r8Cq6Ll3rb1oo7k9aI/zqa+3DlglUXAUpgomrr2WecToS58YDQjTdOEZ/1bw==
X-Received: by 2002:a5d:538e:: with SMTP id d14mr24817860wrv.192.1630313831811; 
 Mon, 30 Aug 2021 01:57:11 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u2sm8843245wmj.29.2021.08.30.01.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:57:11 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org,
 andrey.grodzovsky@amd.com
Subject: [PATCH 04/12] drm/ttm: add common accounting to the resource mgr
Date: Mon, 30 Aug 2021 10:56:59 +0200
Message-Id: <20210830085707.209508-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830085707.209508-1-christian.koenig@amd.com>
References: <20210830085707.209508-1-christian.koenig@amd.com>
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
index a4c495da0040..426e6841fc89 100644
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
 
@@ -100,6 +106,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
 	spin_lock_init(&man->move_lock);
 	man->bdev = bdev;
 	man->size = p_size;
+	atomic64_set(&man->usage, 0);
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		INIT_LIST_HEAD(&man->lru[i]);
@@ -172,6 +179,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 	drm_printf(p, "  use_type: %d\n", man->use_type);
 	drm_printf(p, "  use_tt: %d\n", man->use_tt);
 	drm_printf(p, "  size: %llu\n", man->size);
+	drm_printf(p, "  usage: %llu\n", atomic64_read(&man->usage));
 	if (man->func->debug)
 		man->func->debug(man, p);
 }
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index e8080192cae4..526fe359c603 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -27,6 +27,7 @@
 
 #include <linux/types.h>
 #include <linux/mutex.h>
+#include <linux/atomic.h>
 #include <linux/dma-buf-map.h>
 #include <linux/dma-fence.h>
 #include <drm/drm_print.h>
@@ -110,6 +111,7 @@ struct ttm_resource_manager_func {
  * static information. bdev::driver::io_mem_free is never used.
  * @lru: The lru list for this memory type.
  * @move: The fence of the last pipelined move operation.
+ * @usage: How much of the region is used.
  *
  * This structure is used to identify and manage memory types for a device.
  */
@@ -134,6 +136,9 @@ struct ttm_resource_manager {
 	 * Protected by @move_lock.
 	 */
 	struct dma_fence *move;
+
+	/* Own protection */
+	atomic64_t usage;
 };
 
 /**
@@ -260,6 +265,19 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
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

