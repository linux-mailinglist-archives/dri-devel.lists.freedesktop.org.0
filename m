Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A565B9CE725
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 16:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF23110E87C;
	Fri, 15 Nov 2024 15:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jSkmzb+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B6B10E87C;
 Fri, 15 Nov 2024 15:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731682896; x=1763218896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OR+KQ5XNAYbjJzuYZQOaMBU0VhZh5t7zks2q5oVAklk=;
 b=jSkmzb+6AjXaKJFur417A+yQZhrTy5nbRFdFodpLsDTPWwtmq8bc/Xbz
 i5hKhEhFAeEh4Ji/c5YVtYq1WP0ppqClnQsux6Cwp4JNlCbHllISrETpa
 SGOBKgH6Ccyr3HM/ExL0p9htmP03ddYrIhXtHdUAwApLVQsvRJ+rgdUSA
 XR/7piIcAofLf9XzOZ5z4wRupBClhdG5oME0OJ9/uYV1aWxzfrml0+8YB
 3uBd+l8VuJ1AtTgmpa+0S7UsLM+ZVqFba+CTT/WJvfEBScaFrdJh/0i2W
 7GNYUrYPX53ZllyHo0yl5I52hIF90oN50rcFbOVLgsOK9bN0m2nGlrUSH A==;
X-CSE-ConnectionGUID: I59IH/xzSJaO71eAz6SoYw==
X-CSE-MsgGUID: VGf0DXznTWOvRL2IKTGzzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="34563294"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="34563294"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 07:01:36 -0800
X-CSE-ConnectionGUID: pUQR6z17SOicGJkcCY241w==
X-CSE-MsgGUID: XE0FoeXmQH2k05M+pnBhOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88690293"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.56])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 07:01:32 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v14 1/8] drm/ttm: Balance ttm_resource_cursor_init() and
 ttm_resource_cursor_fini()
Date: Fri, 15 Nov 2024 16:01:13 +0100
Message-ID: <20241115150120.3280-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
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

Make the interface more symmetric by providing and using a
ttm_resource_cursor_init().

v10:
- Fix a stray newline (Matthew Brost)
- Update kerneldoc (Matthew Brost)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       |  3 ++-
 drivers/gpu/drm/ttm/ttm_bo_util.c  |  3 ++-
 drivers/gpu/drm/ttm/ttm_resource.c | 35 ++++++++++++++++++++----------
 include/drm/ttm/ttm_resource.h     | 11 +++++-----
 4 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 48c5365efca1..06d6a452c4f4 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -450,7 +450,8 @@ int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man
 	int ret = 0;
 
 	spin_lock(&bdev->lru_lock);
-	res = ttm_resource_manager_first(man, &cursor);
+	ttm_resource_cursor_init(&cursor, man);
+	res = ttm_resource_manager_first(&cursor);
 	ttm_resource_cursor_fini(&cursor);
 	if (!res) {
 		ret = -ENOENT;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index d939925efa81..917096bd5f68 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -865,7 +865,8 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 	s64 lret;
 
 	spin_lock(&bdev->lru_lock);
-	ttm_resource_manager_for_each_res(man, &cursor, res) {
+	ttm_resource_cursor_init(&cursor, man);
+	ttm_resource_manager_for_each_res(&cursor, res) {
 		struct ttm_buffer_object *bo = res->bo;
 		bool bo_needs_unlock = false;
 		bool bo_locked = false;
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index a87665eb28a6..e19360cc7930 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -81,6 +81,23 @@ static void ttm_bulk_move_drop_cursors(struct ttm_lru_bulk_move *bulk)
 		ttm_resource_cursor_clear_bulk(cursor);
 }
 
+/**
+ * ttm_resource_cursor_init() - Initialize a struct ttm_resource_cursor
+ * @cursor: The cursor to initialize.
+ * @man: The resource manager.
+ *
+ * Initialize the cursor before using it for iteration.
+ */
+void ttm_resource_cursor_init(struct ttm_resource_cursor *cursor,
+			      struct ttm_resource_manager *man)
+{
+	cursor->priority = 0;
+	cursor->man = man;
+	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
+	INIT_LIST_HEAD(&cursor->bulk_link);
+	INIT_LIST_HEAD(&cursor->hitch.link);
+}
+
 /**
  * ttm_resource_cursor_fini() - Finalize the LRU list cursor usage
  * @cursor: The struct ttm_resource_cursor to finalize.
@@ -593,7 +610,6 @@ ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
 /**
  * ttm_resource_manager_first() - Start iterating over the resources
  * of a resource manager
- * @man: resource manager to iterate over
  * @cursor: cursor to record the position
  *
  * Initializes the cursor and starts iterating. When done iterating,
@@ -602,17 +618,16 @@ ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
  * Return: The first resource from the resource manager.
  */
 struct ttm_resource *
-ttm_resource_manager_first(struct ttm_resource_manager *man,
-			   struct ttm_resource_cursor *cursor)
+ttm_resource_manager_first(struct ttm_resource_cursor *cursor)
 {
-	lockdep_assert_held(&man->bdev->lru_lock);
+	struct ttm_resource_manager *man = cursor->man;
 
-	cursor->priority = 0;
-	cursor->man = man;
-	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
-	INIT_LIST_HEAD(&cursor->bulk_link);
-	list_add(&cursor->hitch.link, &man->lru[cursor->priority]);
+	if (WARN_ON_ONCE(!man))
+		return NULL;
+
+	lockdep_assert_held(&man->bdev->lru_lock);
 
+	list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
 	return ttm_resource_manager_next(cursor);
 }
 
@@ -648,8 +663,6 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 		ttm_resource_cursor_clear_bulk(cursor);
 	}
 
-	ttm_resource_cursor_fini(cursor);
-
 	return NULL;
 }
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index be034be56ba1..e1f3b95d73b6 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -325,6 +325,9 @@ struct ttm_resource_cursor {
 	unsigned int priority;
 };
 
+void ttm_resource_cursor_init(struct ttm_resource_cursor *cursor,
+			      struct ttm_resource_manager *man);
+
 void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
 
 /**
@@ -456,8 +459,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 				struct drm_printer *p);
 
 struct ttm_resource *
-ttm_resource_manager_first(struct ttm_resource_manager *man,
-			   struct ttm_resource_cursor *cursor);
+ttm_resource_manager_first(struct ttm_resource_cursor *cursor);
 struct ttm_resource *
 ttm_resource_manager_next(struct ttm_resource_cursor *cursor);
 
@@ -466,14 +468,13 @@ ttm_lru_first_res_or_null(struct list_head *head);
 
 /**
  * ttm_resource_manager_for_each_res - iterate over all resources
- * @man: the resource manager
  * @cursor: struct ttm_resource_cursor for the current position
  * @res: the current resource
  *
  * Iterate over all the evictable resources in a resource manager.
  */
-#define ttm_resource_manager_for_each_res(man, cursor, res)		\
-	for (res = ttm_resource_manager_first(man, cursor); res;	\
+#define ttm_resource_manager_for_each_res(cursor, res)	\
+	for (res = ttm_resource_manager_first(cursor); res;	\
 	     res = ttm_resource_manager_next(cursor))
 
 struct ttm_kmap_iter *
-- 
2.46.2

