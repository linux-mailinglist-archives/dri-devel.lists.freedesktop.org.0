Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759C423E468
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 01:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A316E935;
	Thu,  6 Aug 2020 23:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AED6E935
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 23:35:23 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-yc1dyVk8PhS6Vt4qKOEjkA-1; Thu, 06 Aug 2020 19:35:17 -0400
X-MC-Unique: yc1dyVk8PhS6Vt4qKOEjkA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0815518C63D7;
 Thu,  6 Aug 2020 23:35:17 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-227.bne.redhat.com
 [10.64.54.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F29985FC36;
 Thu,  6 Aug 2020 23:35:15 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/ttm/nouveau: move io_lru storage into driver.
Date: Fri,  7 Aug 2020 09:34:59 +1000
Message-Id: <20200806233459.4057784-5-airlied@gmail.com>
In-Reply-To: <20200806233459.4057784-1-airlied@gmail.com>
References: <20200806233459.4057784-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: bskeggs@redhat.com, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This moves the io lru tracking into the driver allocated structure.

Probably need to consider if we can move more stuff in there around the
nouveau only io_lru functionality.
---
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 24 +++++++++++++++++++++---
 drivers/gpu/drm/ttm/ttm_bo.c          | 11 ++++++++---
 drivers/gpu/drm/ttm/ttm_bo_util.c     | 24 +++++++++++++++---------
 include/drm/ttm/ttm_bo_api.h          |  3 +++
 include/drm/ttm/ttm_bo_driver.h       | 19 +++++++++++--------
 5 files changed, 58 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 93685a376a50..86d74e590359 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -31,6 +31,16 @@
 
 #include <core/tegra.h>
 
+struct nouveau_resource_manager {
+	struct ttm_resource_manager manager;
+	struct ttm_resource_manager_io_lru io_lru;
+};
+
+static inline struct nouveau_resource_manager *to_mgr(struct ttm_resource_manager *man)
+{
+	return container_of(man, struct nouveau_resource_manager, manager);
+}
+
 static void
 nouveau_manager_del(struct ttm_resource_manager *man, struct ttm_resource *reg)
 {
@@ -63,9 +73,15 @@ nouveau_vram_manager_new(struct ttm_resource_manager *man,
 	return 0;
 }
 
+static struct ttm_resource_manager_io_lru *nouveau_resource_io_lru(struct ttm_resource_manager *man)
+{
+	return &to_mgr(man)->io_lru;
+}
+
 const struct ttm_resource_manager_func nouveau_vram_manager = {
 	.get_node = nouveau_vram_manager_new,
 	.put_node = nouveau_manager_del,
+	.io_lru = nouveau_resource_io_lru,
 };
 
 static int
@@ -160,7 +176,8 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
 		/* Some BARs do not support being ioremapped WC */
 		const u8 type = mmu->type[drm->ttm.type_vram].type;
-		struct ttm_resource_manager *man = kzalloc(sizeof(*man), GFP_KERNEL);
+		struct nouveau_resource_manager *nman = kzalloc(sizeof(*nman), GFP_KERNEL);
+		struct ttm_resource_manager *man = &nman->manager;
 		if (!man)
 			return -ENOMEM;
 
@@ -173,9 +190,9 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 		}
 
 		man->func = &nouveau_vram_manager;
-		man->use_io_reserve_lru = true;
 
 		ttm_resource_manager_init(man);
+		ttm_resource_manager_io_lru_init(&nman->io_lru);
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, man);
 		ttm_resource_manager_set_used(man, true);
 		return 0;
@@ -193,11 +210,12 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
 	struct ttm_resource_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
 
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
+		struct nouveau_resource_manager *nman = to_mgr(man);
 		ttm_resource_manager_set_used(man, false);
 		ttm_resource_manager_force_list_clean(&drm->ttm.bdev, man);
 		ttm_resource_manager_cleanup(man);
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, NULL);
-		kfree(man);
+		kfree(nman);
 	} else
 		ttm_range_man_fini(&drm->ttm.bdev, TTM_PL_VRAM);
 }
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index cf8176bce4f6..1ed67842370e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1467,14 +1467,19 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 }
 EXPORT_SYMBOL(ttm_bo_evict_mm);
 
+void ttm_resource_manager_io_lru_init(struct ttm_resource_manager_io_lru *io_lru)
+{
+	mutex_init(&io_lru->io_reserve_mutex);
+	INIT_LIST_HEAD(&io_lru->io_reserve_lru);
+}
+EXPORT_SYMBOL(ttm_resource_manager_io_lru_init);
+
 void ttm_resource_manager_init(struct ttm_resource_manager *man)
 {
 	unsigned i;
 
-	man->use_io_reserve_lru = false;
-	mutex_init(&man->io_reserve_mutex);
+
 	spin_lock_init(&man->move_lock);
-	INIT_LIST_HEAD(&man->io_reserve_lru);
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		INIT_LIST_HEAD(&man->lru[i]);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 496158acd5b9..137aab6c53ae 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -93,29 +93,33 @@ EXPORT_SYMBOL(ttm_bo_move_ttm);
 
 int ttm_mem_io_lock(struct ttm_resource_manager *man, bool interruptible)
 {
-	if (likely(!man->use_io_reserve_lru))
+	struct ttm_resource_manager_io_lru *io_lru;
+	if (!man->func && !man->func->io_lru)
 		return 0;
 
+	io_lru = man->func->io_lru(man);
 	if (interruptible)
-		return mutex_lock_interruptible(&man->io_reserve_mutex);
+		return mutex_lock_interruptible(&io_lru->io_reserve_mutex);
 
-	mutex_lock(&man->io_reserve_mutex);
+	mutex_lock(&io_lru->io_reserve_mutex);
 	return 0;
 }
 
 void ttm_mem_io_unlock(struct ttm_resource_manager *man)
 {
-	if (likely(!man->use_io_reserve_lru))
+	struct ttm_resource_manager_io_lru *io_lru;
+	if (!man->func && !man->func->io_lru)
 		return;
 
-	mutex_unlock(&man->io_reserve_mutex);
+	io_lru = man->func->io_lru(man);
+	mutex_unlock(&io_lru->io_reserve_mutex);
 }
 
 static int ttm_mem_io_evict(struct ttm_resource_manager *man)
 {
 	struct ttm_buffer_object *bo;
-
-	bo = list_first_entry_or_null(&man->io_reserve_lru,
+	struct ttm_resource_manager_io_lru *io_lru = man->func->io_lru(man);
+	bo = list_first_entry_or_null(&io_lru->io_reserve_lru,
 				      struct ttm_buffer_object,
 				      io_reserve_lru);
 	if (!bo)
@@ -173,9 +177,11 @@ int ttm_mem_io_reserve_vm(struct ttm_buffer_object *bo)
 	if (unlikely(ret != 0))
 		return ret;
 	mem->bus.io_reserved_vm = true;
-	if (man->use_io_reserve_lru)
+	if (man->func && man->func->io_lru) {
+		struct ttm_resource_manager_io_lru *io_lru = man->func->io_lru(man);
 		list_add_tail(&bo->io_reserve_lru,
-			      &man->io_reserve_lru);
+			      &io_lru->io_reserve_lru);
+	}
 	return 0;
 }
 
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index e4bf93482b59..fd34ca32ca66 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -56,6 +56,8 @@ struct ttm_lru_bulk_move;
 
 struct ttm_resource_manager;
 
+struct ttm_resource_manager_io_lru;
+
 /**
  * struct ttm_bus_placement
  *
@@ -542,6 +544,7 @@ int ttm_bo_create(struct ttm_bo_device *bdev, unsigned long size,
  */
 void ttm_resource_manager_init(struct ttm_resource_manager *man);
 
+void ttm_resource_manager_io_lru_init(struct ttm_resource_manager_io_lru *io_lru);
 /**
  * ttm_bo_evict_mm
  *
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index c719b4aa3793..d6e77f1d0183 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -46,6 +46,7 @@
 #define TTM_MAX_BO_PRIORITY	4U
 
 struct ttm_resource_manager;
+struct ttm_resource_manager_io_lru;
 
 struct ttm_resource_manager_func {
 	/**
@@ -106,6 +107,8 @@ struct ttm_resource_manager_func {
 	 */
 	void (*debug)(struct ttm_resource_manager *man,
 		      struct drm_printer *printer);
+
+	struct ttm_resource_manager_io_lru *(*io_lru)(struct ttm_resource_manager *man);
 };
 
 /**
@@ -133,7 +136,14 @@ struct ttm_resource_manager_func {
  * This structure is used to identify and manage memory types for a device.
  */
 
+struct ttm_resource_manager_io_lru {
+	/*
+	 * Protected by @io_reserve_mutex:
+	 */
 
+	struct list_head io_reserve_lru;
+	struct mutex io_reserve_mutex;
+};
 
 struct ttm_resource_manager {
 	/*
@@ -144,15 +154,8 @@ struct ttm_resource_manager {
 	uint32_t available_caching;
 	uint32_t default_caching;
 	const struct ttm_resource_manager_func *func;
-	struct mutex io_reserve_mutex;
-	bool use_io_reserve_lru;
-	spinlock_t move_lock;
 
-	/*
-	 * Protected by @io_reserve_mutex:
-	 */
-
-	struct list_head io_reserve_lru;
+	spinlock_t move_lock;
 
 	/*
 	 * Protected by the global->lru_lock.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
