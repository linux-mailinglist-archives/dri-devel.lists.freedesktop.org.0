Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A06233E13
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E74D6E9CB;
	Fri, 31 Jul 2020 04:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470326E9BD
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:07:20 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-c0xHUuuNMLK3N-S1FNsWyQ-1; Fri, 31 Jul 2020 00:07:14 -0400
X-MC-Unique: c0xHUuuNMLK3N-S1FNsWyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA4AB8015CE;
 Fri, 31 Jul 2020 04:07:13 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D8B7100238C;
 Fri, 31 Jul 2020 04:07:12 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 48/49] drm/ttm: drop type manager has_type
Date: Fri, 31 Jul 2020 14:05:19 +1000
Message-Id: <20200731040520.3701599-49-airlied@gmail.com>
In-Reply-To: <20200731040520.3701599-1-airlied@gmail.com>
References: <20200731040520.3701599-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

under driver control, this flag isn't needed anymore

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    | 6 ++----
 include/drm/ttm/ttm_bo_driver.h | 5 -----
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f35548ff17e8..bfc20cb27ed6 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -82,7 +82,6 @@ static void ttm_mem_type_debug(struct ttm_bo_device *bdev, struct drm_printer *p
 {
 	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, mem_type);
 
-	drm_printf(p, "    has_type: %d\n", man->has_type);
 	drm_printf(p, "    use_type: %d\n", man->use_type);
 	drm_printf(p, "    use_tt: %d\n", man->use_tt);
 	drm_printf(p, "    size: %llu\n", man->size);
@@ -997,7 +996,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
 		return ret;
 
 	man = ttm_manager_type(bdev, mem_type);
-	if (!man->has_type || !man->use_type)
+	if (!man || !man->use_type)
 		return -EBUSY;
 
 	if (!ttm_bo_mt_compatible(man, mem_type, place, &cur_flags))
@@ -1455,7 +1454,7 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 		return -EINVAL;
 	}
 
-	if (!man->has_type) {
+	if (!man) {
 		pr_err("Memory type %u has not been initialized\n", mem_type);
 		return 0;
 	}
@@ -1469,7 +1468,6 @@ void ttm_bo_init_mm_base(struct ttm_mem_type_manager *man,
 {
 	unsigned i;
 
-	BUG_ON(man->has_type);
 	man->use_io_reserve_lru = false;
 	mutex_init(&man->io_reserve_mutex);
 	spin_lock_init(&man->move_lock);
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index b2ffeaed94e7..702b3b056eda 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -111,7 +111,6 @@ struct ttm_mem_type_manager_func {
 /**
  * struct ttm_mem_type_manager
  *
- * @has_type: The memory type has been initialized.
  * @use_type: The memory type is enabled.
  * @flags: TTM_MEMTYPE_XX flags identifying the traits of the memory
  * managed by this memory type.
@@ -141,8 +140,6 @@ struct ttm_mem_type_manager {
 	/*
 	 * No protection. Constant from start.
 	 */
-
-	bool has_type;
 	bool use_type;
 	bool use_tt;
 	uint64_t size;
@@ -673,13 +670,11 @@ static inline void ttm_bo_unreserve(struct ttm_buffer_object *bo)
 
 static inline void ttm_bo_use_mm(struct ttm_mem_type_manager *man)
 {
-	man->has_type = true;
 	man->use_type = true;
 }
 
 static inline void ttm_bo_disable_mm(struct ttm_mem_type_manager *man)
 {
-	man->has_type = false;
 	man->use_type = false;
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
