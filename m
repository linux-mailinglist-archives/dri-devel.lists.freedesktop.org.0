Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB4D710EF1
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 17:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F19310E17C;
	Thu, 25 May 2023 15:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46A010E17C;
 Thu, 25 May 2023 15:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685026952; x=1716562952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NyIzns0NRThBIIf3GEuwx8CnRHIDUDkqRM66OjyqyJA=;
 b=iQ2WKAdfq/JMKffrCcSfhQTx3jVW/Bou6+pM0L/bqYmlOIM5JuZlzh5d
 6Dvg20We0O4HNZalL8GlZm6vEqflCfDg2p5Q8Zfg7ITen73WGni6lhJ34
 wI/xkJ+vYrTKoWD1BHtRneVUqWSZuBx8KFyxvgogNyZi4TXz7hPz9kxqv
 WN/CWAKp9oyJO/bXyKMVioPLhu9lFbOh8STxrZ3KRtT7ERUWH1CMpfxiU
 QcdeZKbdwT4EFstYQY12bNqbPnxCUyX0//iWej8a0Ls4ENwb3DDGhfoip
 pYiUlx7TSySX/sF7Be6qOa6sQQu9ilM3DpgomiMHYKM2mAfrnx1A98NMb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="357156249"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="357156249"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 08:02:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="774696297"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="774696297"
Received: from lsilistr-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.226])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 08:02:25 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/ttm: Clear the buffer object bulk move at
 individualize time
Date: Thu, 25 May 2023 17:02:03 +0200
Message-Id: <20230525150205.194098-2-thomas.hellstrom@linux.intel.com>
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

Clearing the buffer object bulk move is closely tied to individualizing
the resv, since that is when we effectively detach the bo from a vm.

Clearing the bulk move also requires the bo resv, which we have readily
locked at individualizing time without clobbering the much wider vm
lock.

So Clear the buffer object bulk_move at individualizing time, and update
the code comments.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index bd5dae4d1624..57cc9f845adc 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -193,20 +193,33 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 	BUG_ON(!dma_resv_trylock(&bo->base._resv));
 
 	r = dma_resv_copy_fences(&bo->base._resv, bo->base.resv);
-	dma_resv_unlock(&bo->base._resv);
-	if (r)
-		return r;
 
-	if (bo->type != ttm_bo_type_sg) {
-		/* This works because the BO is about to be destroyed and nobody
-		 * reference it any more. The only tricky case is the trylock on
-		 * the resv object while holding the lru_lock.
+	if (!r && bo->type != ttm_bo_type_sg) {
+		/*
+		 * The TTM bo refcount is now zero and hence nobody will
+		 * therefore try to lock the bo at this point: the LRU
+		 * list lookups will trylock even if the refcount is zero,
+		 * but will only do that under the LRU lock and will
+		 * then immediately back off under the same LRU lock when it
+		 * sees the zero refcount.
 		 */
 		spin_lock(&bo->bdev->lru_lock);
 		bo->base.resv = &bo->base._resv;
+
+		/* Since bulk move is closely tied with the shared resv,
+		 * clear it when we have now individualized, if that was not
+		 * done by the driver already.
+		 */
+		if (bo->bulk_move) {
+			if (bo->resource)
+				ttm_resource_del_bulk_move(bo->resource, bo);
+			bo->bulk_move = NULL;
+		}
 		spin_unlock(&bo->bdev->lru_lock);
 	}
 
+	dma_resv_unlock(&bo->base._resv);
+
 	return r;
 }
 
@@ -324,7 +337,6 @@ static void ttm_bo_release(struct kref *kref)
 	int ret;
 
 	WARN_ON_ONCE(bo->pin_count);
-	WARN_ON_ONCE(bo->bulk_move);
 
 	if (!bo->deleted) {
 		ret = ttm_bo_individualize_resv(bo);
@@ -337,6 +349,8 @@ static void ttm_bo_release(struct kref *kref)
 					      30 * HZ);
 		}
 
+		WARN_ON_ONCE(bo->bulk_move);
+
 		if (bo->bdev->funcs->release_notify)
 			bo->bdev->funcs->release_notify(bo);
 
-- 
2.39.2

