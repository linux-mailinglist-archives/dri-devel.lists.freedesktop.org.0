Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 756D7233DED
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2116E9A6;
	Fri, 31 Jul 2020 04:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C886E99F
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:06:03 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-6LuUpo3DNJecYmzLDggpyQ-1; Fri, 31 Jul 2020 00:05:58 -0400
X-MC-Unique: 6LuUpo3DNJecYmzLDggpyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5FA68015CE;
 Fri, 31 Jul 2020 04:05:57 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36BAC100238C;
 Fri, 31 Jul 2020 04:05:56 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/49] drm/ttm: purge old manager init path.
Date: Fri, 31 Jul 2020 14:04:44 +1000
Message-Id: <20200731040520.3701599-14-airlied@gmail.com>
In-Reply-To: <20200731040520.3701599-1-airlied@gmail.com>
References: <20200731040520.3701599-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: christian.koenig@amd.com, sroland@vmware.com, bskeggs@redhat.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c         | 19 -------------------
 drivers/gpu/drm/ttm/ttm_bo_manager.c | 27 +++++++++------------------
 include/drm/ttm/ttm_bo_api.h         |  2 --
 include/drm/ttm/ttm_bo_driver.h      | 14 --------------
 4 files changed, 9 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 476e768c5bd2..101a7910f9f7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1523,25 +1523,6 @@ void ttm_bo_init_mm_base(struct ttm_bo_device *bdev,
 }
 EXPORT_SYMBOL(ttm_bo_init_mm_base);
 
-int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
-			unsigned long p_size)
-{
-	int ret;
-	struct ttm_mem_type_manager *man;
-
-	BUG_ON(type >= TTM_NUM_MEM_TYPES);
-	ttm_bo_init_mm_base(bdev, &bdev->man[type], p_size);
-
-	if (type != TTM_PL_SYSTEM) {
-		ret = (*man->func->init)(man, p_size);
-		if (ret)
-			return ret;
-	}
-	ttm_bo_use_mm(man);
-	return 0;
-}
-EXPORT_SYMBOL(ttm_bo_init_mm);
-
 static void ttm_bo_global_kobj_release(struct kobject *kobj)
 {
 	struct ttm_bo_global *glob =
diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_bo_manager.c
index 64234e5caee3..1877425abdf0 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
@@ -104,11 +104,18 @@ static void ttm_bo_man_put_node(struct ttm_mem_type_manager *man,
 	}
 }
 
-static int ttm_bo_man_init_private(struct ttm_mem_type_manager *man,
+static const struct ttm_mem_type_manager_func ttm_bo_manager_func;
+
+int ttm_bo_man_init(struct ttm_bo_device *bdev,
+		    struct ttm_mem_type_manager *man,
 		    unsigned long p_size)
 {
 	struct ttm_range_manager *rman;
 
+	man->func = &ttm_bo_manager_func;
+
+	ttm_bo_init_mm_base(bdev, man, p_size);
+
 	rman = kzalloc(sizeof(*rman), GFP_KERNEL);
 	if (!rman)
 		return -ENOMEM;
@@ -116,21 +123,7 @@ static int ttm_bo_man_init_private(struct ttm_mem_type_manager *man,
 	drm_mm_init(&rman->mm, 0, p_size);
 	spin_lock_init(&rman->lock);
 	man->priv = rman;
-	return 0;
-}
 
-int ttm_bo_man_init(struct ttm_bo_device *bdev,
-		    struct ttm_mem_type_manager *man,
-		    unsigned long p_size)
-{
-	int ret;
-
-	man->func = &ttm_bo_manager_func;
-
-	ttm_bo_init_mm_base(bdev, man, p_size);
-	ret = ttm_bo_man_init_private(man, p_size);
-	if (ret)
-		return ret;
 	ttm_bo_use_mm(man);
 	return 0;
 }
@@ -163,11 +156,9 @@ static void ttm_bo_man_debug(struct ttm_mem_type_manager *man,
 	spin_unlock(&rman->lock);
 }
 
-const struct ttm_mem_type_manager_func ttm_bo_manager_func = {
-	.init = ttm_bo_man_init_private,
+static const struct ttm_mem_type_manager_func ttm_bo_manager_func = {
 	.takedown = ttm_bo_man_takedown,
 	.get_node = ttm_bo_man_get_node,
 	.put_node = ttm_bo_man_put_node,
 	.debug = ttm_bo_man_debug
 };
-EXPORT_SYMBOL(ttm_bo_manager_func);
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 0060925f507a..6562d1c5ac59 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -550,8 +550,6 @@ struct ttm_mem_type_manager;
 void ttm_bo_init_mm_base(struct ttm_bo_device *bdev,
 			 struct ttm_mem_type_manager *man,
 			 unsigned long p_size);
-int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
-		   unsigned long p_size);
 
 /**
  * ttm_bo_clean_mm
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 5c4ccefd5393..d0f1a6cdfba7 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -48,19 +48,6 @@
 struct ttm_mem_type_manager;
 
 struct ttm_mem_type_manager_func {
-	/**
-	 * struct ttm_mem_type_manager member init
-	 *
-	 * @man: Pointer to a memory type manager.
-	 * @p_size: Implementation dependent, but typically the size of the
-	 * range to be managed in pages.
-	 *
-	 * Called to initialize a private range manager. The function is
-	 * expected to initialize the man::priv member.
-	 * Returns 0 on success, negative error code on failure.
-	 */
-	int  (*init)(struct ttm_mem_type_manager *man, unsigned long p_size);
-
 	/**
 	 * struct ttm_mem_type_manager member takedown
 	 *
@@ -802,6 +789,5 @@ pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp);
 int ttm_bo_man_init(struct ttm_bo_device *bdev,
 		    struct ttm_mem_type_manager *man,
 		    unsigned long p_size);
-extern const struct ttm_mem_type_manager_func ttm_bo_manager_func;
 
 #endif
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
