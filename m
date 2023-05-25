Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DE5710EF2
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 17:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDB710E17F;
	Thu, 25 May 2023 15:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CAA10E16E;
 Thu, 25 May 2023 15:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685026965; x=1716562965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4BupBN0f+pJGaMQkknAyTYeM8ud8JmWKpIVXF9p7WnQ=;
 b=FdjqccrsAQCoCd9bscUXpih+4kcfYkc6+w8fYb2bTRx3FX8fmQdSV8dN
 ykhpa4kkLqiUgNSqm3Rm5ijsSjkjQHl0AVQnO/PV7ONd/9LWwVp0wvRGC
 TiQ4rGejPJkl1bVZ6XXZjzupak3w3kT24wdkvPpTznCuvRc+8wX+Lu8gS
 IOa49VxTpQBKMRUFxZplV9eehDot1JTbugfAhGUq9BAV0TYPMtUmUC3cw
 6sKplEv5I+T1HyoDsygymbX69H36CEjiYmUee56Yzxgaw7TKupxnGTv6i
 0GOSHmEhH9VurZcQy3qaZyR+bdn7fkCNwfFX687QPDHFmhwWaFR9eMKPB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="357156388"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="357156388"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 08:02:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="774696475"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="774696475"
Received: from lsilistr-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.226])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 08:02:36 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/ttm: Clean up bo individualizing somewhat
Date: Thu, 25 May 2023 17:02:04 +0200
Message-Id: <20230525150205.194098-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525150205.194098-1-thomas.hellstrom@linux.intel.com>
References: <20230525150205.194098-1-thomas.hellstrom@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Christian Koenig <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even if fence copying fails, individualize the resv after the wait.

If fence copying does fail, opportunistically trylock the vm's resv
to attempt to limit the chance of starvation.

Exit individdulizing earlier if the bo type is ttm_bo_type_sg.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 74 +++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 57cc9f845adc..84a512538e45 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -183,44 +183,48 @@ static void ttm_bo_cleanup_memtype_use(struct ttm_buffer_object *bo)
 	ttm_resource_free(bo, &bo->resource);
 }
 
-static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
+static void ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 {
-	int r;
-
-	if (bo->base.resv == &bo->base._resv)
-		return 0;
+	if (bo->base.resv == &bo->base._resv || bo->type == ttm_bo_type_sg)
+		return;
 
 	BUG_ON(!dma_resv_trylock(&bo->base._resv));
 
-	r = dma_resv_copy_fences(&bo->base._resv, bo->base.resv);
+	if (dma_resv_copy_fences(&bo->base._resv, bo->base.resv)) {
+		/* Opportunistic trylock to block new fence additions */
+		bool locked = dma_resv_trylock(bo->base.resv);
 
-	if (!r && bo->type != ttm_bo_type_sg) {
-		/*
-		 * The TTM bo refcount is now zero and hence nobody will
-		 * therefore try to lock the bo at this point: the LRU
-		 * list lookups will trylock even if the refcount is zero,
-		 * but will only do that under the LRU lock and will
-		 * then immediately back off under the same LRU lock when it
-		 * sees the zero refcount.
-		 */
-		spin_lock(&bo->bdev->lru_lock);
-		bo->base.resv = &bo->base._resv;
+		/* Last resort if memory allocation failed for fence copying */
+		dma_resv_wait_timeout(bo->base.resv,
+				      DMA_RESV_USAGE_BOOKKEEP, false,
+				      30 * HZ);
+		if (locked)
+			dma_resv_unlock(bo->base.resv);
+	}
 
-		/* Since bulk move is closely tied with the shared resv,
-		 * clear it when we have now individualized, if that was not
-		 * done by the driver already.
-		 */
-		if (bo->bulk_move) {
-			if (bo->resource)
-				ttm_resource_del_bulk_move(bo->resource, bo);
-			bo->bulk_move = NULL;
-		}
-		spin_unlock(&bo->bdev->lru_lock);
+	/*
+	 * The TTM bo refcount is now zero and hence nobody will
+	 * therefore try to lock the bo at this point: the LRU
+	 * list lookups will trylock even if the refcount is zero,
+	 * but will only do that under the LRU lock and will
+	 * then immediately back off under the same LRU lock when it
+	 * sees the zero refcount.
+	 */
+	spin_lock(&bo->bdev->lru_lock);
+	bo->base.resv = &bo->base._resv;
+
+	/* Since bulk move is closely tied with the shared resv,
+	 * clear it when we have now individualized, if that was not
+	 * done by the driver already.
+	 */
+	if (bo->bulk_move) {
+		if (bo->resource)
+			ttm_resource_del_bulk_move(bo->resource, bo);
+		bo->bulk_move = NULL;
 	}
+	spin_unlock(&bo->bdev->lru_lock);
 
 	dma_resv_unlock(&bo->base._resv);
-
-	return r;
 }
 
 static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
@@ -334,21 +338,11 @@ static void ttm_bo_release(struct kref *kref)
 	struct ttm_buffer_object *bo =
 	    container_of(kref, struct ttm_buffer_object, kref);
 	struct ttm_device *bdev = bo->bdev;
-	int ret;
 
 	WARN_ON_ONCE(bo->pin_count);
 
 	if (!bo->deleted) {
-		ret = ttm_bo_individualize_resv(bo);
-		if (ret) {
-			/* Last resort, if we fail to allocate memory for the
-			 * fences block for the BO to become idle
-			 */
-			dma_resv_wait_timeout(bo->base.resv,
-					      DMA_RESV_USAGE_BOOKKEEP, false,
-					      30 * HZ);
-		}
-
+		ttm_bo_individualize_resv(bo);
 		WARN_ON_ONCE(bo->bulk_move);
 
 		if (bo->bdev->funcs->release_notify)
-- 
2.39.2

