Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0BF9A04D0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 10:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1744F10E6BE;
	Wed, 16 Oct 2024 08:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqwVI/Mw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3BE10E05B;
 Wed, 16 Oct 2024 08:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729068978; x=1760604978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zRASrDCM/p8F69ylFqFXsgfDPvVRCri52PAFVPo2TX0=;
 b=cqwVI/Mwh1mf3jj/bq0SpFnucGE4KgoFNk/zWQ5u/uDMIjDjh0grw/Gp
 eTSREK5WPMk1Rh1Ba/1NcSc5SlIaO9UZ+M4kiNWS0eQBfUUoj1i1OwOQV
 v2iN3ENx80MmptEwLNHB5nhtLM8oN+R0+9UdFF8FCRt+DipaK7QJj41oB
 c4s2ZeF+VYoq03dHSxiIs5embjYMOPSR3o99o+furCg3i/WjftTN4B2vp
 Jdv9Xl4B515J9FSeLumh8WdyVAo5nK+sYwdsaI6Vmn4mUwO2cbDm7MI/F
 JFX1XhMI2AsodP2sFgqhcMe3th/DVE+eF7h2sn/ZTNG+tXnnABeurLfz/ A==;
X-CSE-ConnectionGUID: m0/YxHjfQyiA1EIu6PEwfw==
X-CSE-MsgGUID: tKzT9pknRfeCU/yZ0x4TMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="16122967"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="16122967"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 01:56:18 -0700
X-CSE-ConnectionGUID: tqxU+6icTl6ELU50jUpn7Q==
X-CSE-MsgGUID: uLRFxn6GTsielWezWJdfJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78184431"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.80])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 01:56:16 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v11 1/8] drm/ttm: Balance ttm_resource_cursor_init() and
 ttm_resource_cursor_fini()
Date: Wed, 16 Oct 2024 10:55:52 +0200
Message-ID: <20241016085559.11840-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241016085559.11840-1-thomas.hellstrom@linux.intel.com>
References: <20241016085559.11840-1-thomas.hellstrom@linux.intel.com>
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
2.46.0

