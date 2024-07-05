Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033C7928BA7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 17:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798ED10EBFF;
	Fri,  5 Jul 2024 15:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TiJMAL1j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93CC10EBFF;
 Fri,  5 Jul 2024 15:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720193541; x=1751729541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ackiwV0EiPeLoSLiRrLKoHhXfDnOs8cLhB97eDmf504=;
 b=TiJMAL1jgCCUHcttvZ07YzlcTQudqOQiMJdVTFJSSdxJI+qinj6/+ZPs
 cwcBeGEniwCCam3ddyO19EEtsByCz6v4ByBrCOTatUSYJE1+CZly/2vF1
 AAK99JagsM/Ivy+td4ZABXnxcySh8Rq9En+DKDr4CoNA8WFyvShpFnHZf
 U/ko5KDUW9G981IAVCWWBHSFywidvGM6HruSClHjXDZDxcayBGcs9FIln
 zZ3cy9Ckpuai/45IZBNTWjBFpxXJQDzLxZAjyIccuX2VuMRs94cAK8t7Q
 JR55FQv1llX3p2EGWvh7G6uwRwhpnp8BkYLp1ZDsC9QoHSQrpsm0TOqim A==;
X-CSE-ConnectionGUID: +xLnuv2XTJO7B6meJBHWSA==
X-CSE-MsgGUID: 0wAVYH34QISCZ7kwPVl0/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17622916"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="17622916"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 08:32:20 -0700
X-CSE-ConnectionGUID: OQDHFYW3SwajmIoxymHkjA==
X-CSE-MsgGUID: TNhWCcUOTkC0HW9HynKQdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="46844943"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.166])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 08:32:19 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v7 2/8] drm/ttm: Slightly clean up LRU list iteration
Date: Fri,  5 Jul 2024 17:32:00 +0200
Message-ID: <20240705153206.68526-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240705153206.68526-1-thomas.hellstrom@linux.intel.com>
References: <20240705153206.68526-1-thomas.hellstrom@linux.intel.com>
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

To make the transition to using lru hitches easier,
simplify the ttm_resource_manager_next() interface to only take
the cursor and reuse ttm_resource_manager_next() functionality
from ttm_resource_manager_first().

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 48 +++++++++++++-----------------
 include/drm/ttm/ttm_resource.h     | 10 ++++---
 2 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index db9a7a3717c4..8bfbddddc0e8 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -496,50 +496,44 @@ struct ttm_resource *
 ttm_resource_manager_first(struct ttm_resource_manager *man,
 			   struct ttm_resource_cursor *cursor)
 {
-	struct ttm_lru_item *lru;
-
 	lockdep_assert_held(&man->bdev->lru_lock);
 
-	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
-	     ++cursor->priority)
-		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
-			if (ttm_lru_item_is_res(lru))
-				return ttm_lru_item_to_res(lru);
-		}
-
-	return NULL;
+	cursor->priority = 0;
+	cursor->man = man;
+	cursor->cur = &man->lru[cursor->priority];
+	return ttm_resource_manager_next(cursor);
 }
 
 /**
  * ttm_resource_manager_next
  *
- * @man: resource manager to iterate over
  * @cursor: cursor to record the position
- * @res: the current resource pointer
  *
- * Returns the next resource from the resource manager.
+ * Return: the next resource from the resource manager.
  */
 struct ttm_resource *
-ttm_resource_manager_next(struct ttm_resource_manager *man,
-			  struct ttm_resource_cursor *cursor,
-			  struct ttm_resource *res)
+ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 {
-	struct ttm_lru_item *lru = &res->lru;
+	struct ttm_resource_manager *man = cursor->man;
+	struct ttm_lru_item *lru;
 
 	lockdep_assert_held(&man->bdev->lru_lock);
 
-	list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
-		if (ttm_lru_item_is_res(lru))
-			return ttm_lru_item_to_res(lru);
-	}
-
-	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
-	     ++cursor->priority)
-		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
-			if (ttm_lru_item_is_res(lru))
-				ttm_lru_item_to_res(lru);
+	for (;;) {
+		lru = list_entry(cursor->cur, typeof(*lru), link);
+		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
+			if (ttm_lru_item_is_res(lru)) {
+				cursor->cur = &lru->link;
+				return ttm_lru_item_to_res(lru);
+			}
 		}
 
+		if (++cursor->priority >= TTM_MAX_BO_PRIORITY)
+			break;
+
+		cursor->cur = &man->lru[cursor->priority];
+	}
+
 	return NULL;
 }
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 1511d91e290d..7d81fd5b5b83 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -272,11 +272,15 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
 /**
  * struct ttm_resource_cursor
  *
+ * @man: The resource manager currently being iterated over.
+ * @cur: The list head the cursor currently points to.
  * @priority: the current priority
  *
  * Cursor to iterate over the resources in a manager.
  */
 struct ttm_resource_cursor {
+	struct ttm_resource_manager *man;
+	struct list_head *cur;
 	unsigned int priority;
 };
 
@@ -438,9 +442,7 @@ struct ttm_resource *
 ttm_resource_manager_first(struct ttm_resource_manager *man,
 			   struct ttm_resource_cursor *cursor);
 struct ttm_resource *
-ttm_resource_manager_next(struct ttm_resource_manager *man,
-			  struct ttm_resource_cursor *cursor,
-			  struct ttm_resource *res);
+ttm_resource_manager_next(struct ttm_resource_cursor *cursor);
 
 struct ttm_resource *
 ttm_lru_first_res_or_null(struct list_head *head);
@@ -455,7 +457,7 @@ ttm_lru_first_res_or_null(struct list_head *head);
  */
 #define ttm_resource_manager_for_each_res(man, cursor, res)		\
 	for (res = ttm_resource_manager_first(man, cursor); res;	\
-	     res = ttm_resource_manager_next(man, cursor, res))
+	     res = ttm_resource_manager_next(cursor))
 
 struct ttm_kmap_iter *
 ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
-- 
2.44.0

