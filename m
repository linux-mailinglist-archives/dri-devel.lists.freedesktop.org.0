Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2303930A7
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 16:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7F86ED24;
	Thu, 27 May 2021 14:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C6D6F3B3;
 Thu, 27 May 2021 14:19:46 +0000 (UTC)
IronPort-SDR: QDufQpH8ot7oay176T8vHuH9w2Q5oe8YrAXpU2Y54yra4+FoG9XW55VMNkCVYO99mTMJApjY4I
 B2IcmrEvUmnA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202749609"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="202749609"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 07:19:44 -0700
IronPort-SDR: 9cJukFaMBKcAi67jtp/7G4AvLvUtXRLT58+DufG0abwDFXN4yHk/nSiuK/jwMXmS1AY40xBtdd
 jDrXNmOdik4Q==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="547823262"
Received: from ibanaga-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.58])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 07:19:42 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Subject: [RFC PATCH] drm/ttm: Fix swapping dereferences of freed memory
Date: Thu, 27 May 2021 16:19:23 +0200
Message-Id: <20210527141923.1962350-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The swapping code was dereference bo->ttm pointers without having the
dma-resv lock held. Also it might try to swap out unpopulated bos.

Fix this by moving the bo->ttm dereference until we have the reservation
lock. Check that the ttm_tt is populated after the swap_notify callback.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c     | 16 +++++++++++++++-
 drivers/gpu/drm/ttm/ttm_device.c |  8 +++-----
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 9f53506a82fc..86213d37657b 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1163,6 +1163,16 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place, &locked, NULL))
 		return -EBUSY;
 
+	dma_resv_assert_held(bo->base.resv);
+
+	if (!bo->ttm ||
+	    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
+	    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) {
+		if (locked)
+			dma_resv_unlock(bo->base.resv);
+		return -EBUSY;
+	}
+
 	if (!ttm_bo_get_unless_zero(bo)) {
 		if (locked)
 			dma_resv_unlock(bo->base.resv);
@@ -1215,7 +1225,8 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	if (bo->bdev->funcs->swap_notify)
 		bo->bdev->funcs->swap_notify(bo);
 
-	ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
+	if (ttm_tt_is_populated(bo->ttm))
+		ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
 out:
 
 	/*
@@ -1225,6 +1236,9 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	if (locked)
 		dma_resv_unlock(bo->base.resv);
 	ttm_bo_put(bo);
+
+	/* Don't break locking rules. */
+	WARN_ON(ret == -EBUSY);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 460953dcad11..eaa7487ae404 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -143,14 +143,12 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 
 		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
 			list_for_each_entry(bo, &man->lru[j], lru) {
-				uint32_t num_pages;
+				pgoff_t num_pages;
 
-				if (!bo->ttm ||
-				    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
-				    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
+				if (!READ_ONCE(bo->ttm))
 					continue;
 
-				num_pages = bo->ttm->num_pages;
+				num_pages = bo->base.size >> PAGE_SHIFT;
 				ret = ttm_bo_swapout(bo, ctx, gfp_flags);
 				/* ttm_bo_swapout has dropped the lru_lock */
 				if (!ret)
-- 
2.31.1

