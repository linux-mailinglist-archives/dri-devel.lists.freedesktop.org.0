Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133659D1BE6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56D610E56E;
	Mon, 18 Nov 2024 23:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C3PzzUD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB6410E568;
 Mon, 18 Nov 2024 23:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973045; x=1763509045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FQxvSEd01/OxTgGjN+9eaO1d4HXqMPyPwKn7zGm1XOU=;
 b=C3PzzUD8IDMSz6BtiwuujaqdB+qesEr7XpmlonfH3LlpYEyQnt9+l9pz
 ZMVZMSds8BNir4rWs9L1uGpzZuF/93ajomj6l8WLi2D7FwkEqpheN60da
 xtWZ7Mbw/SHFSPAP37C1CzBeiSlktf6wg+52OCKTKtzGMdw+0c7QMutMd
 49G0xu/hyC87ZcICESo+tVziZo44yBYk40sCrKcqWRp7AfglsHktqCOQ3
 twHaXryjUOKtB43We3Akz/ZVlrzWFGykhVzA5z4/u35EFMABGXdXUYPZ9
 fyQuVI567YeNwihH3L9+lBVDL1do2gNsqUtz4LoRL+28AzC29/JDoDoO9 Q==;
X-CSE-ConnectionGUID: Ik0KT47hTxSN0bDIJeuGQw==
X-CSE-MsgGUID: ZxPHoLFWSASgFVVs/Kew8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878897"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878897"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:25 -0800
X-CSE-ConnectionGUID: oxIahCEPQ4eIRrn66HhuBw==
X-CSE-MsgGUID: 4I+LFVZCRmSL9zHA6s/IoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521696"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 08/29] drm/xe: Clear GGTT in xe_bo_restore_kernel
Date: Mon, 18 Nov 2024 15:37:36 -0800
Message-Id: <20241118233757.2374041-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
MIME-Version: 1.0
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

Part of what xe_bo_restore_kernel does, is restore BO's GGTT mappings
which may have been lost during a power state change. Missing is
restoring the GGTT entries without BO mappings to a known state (e.g.,
scratch pages). Update xe_bo_restore_kernel to clear the entire GGTT
before restoring BO's GGTT mappings.

v2:
 - Include missing local change of tile and id variable (CI)
v3:
 - Fixed kernel doc (CI)
v4:
 - Only clear holes (CI)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_bo_evict.c |  8 +++++++-
 drivers/gpu/drm/xe/xe_ggtt.c     | 19 ++++++++++++++++---
 drivers/gpu/drm/xe/xe_ggtt.h     |  2 ++
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 8fb2be061003..d7bb3dbb41d6 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -123,7 +123,8 @@ int xe_bo_evict_all(struct xe_device *xe)
  * @xe: xe device
  *
  * Move kernel BOs from temporary (typically system) memory to VRAM via CPU. All
- * moves done via TTM calls.
+ * moves done via TTM calls. All GGTT are restored too, first by clearing GGTT
+ * to known state and then restoring individual BO's GGTT mappings.
  *
  * This function should be called early, before trying to init the GT, on device
  * resume.
@@ -131,8 +132,13 @@ int xe_bo_evict_all(struct xe_device *xe)
 int xe_bo_restore_kernel(struct xe_device *xe)
 {
 	struct xe_bo *bo;
+	struct xe_tile *tile;
+	u8 id;
 	int ret;
 
+	for_each_tile(tile, xe, id)
+		xe_ggtt_clear(tile->mem.ggtt);
+
 	spin_lock(&xe->pinned.lock);
 	for (;;) {
 		bo = list_first_entry_or_null(&xe->pinned.evicted,
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 558fac8bb6fb..2fc498b89878 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -140,7 +140,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 	ggtt_update_access_counter(ggtt);
 }
 
-static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
+static void __xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
 	u64 end = start + size - 1;
@@ -160,6 +160,19 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 	}
 }
 
+static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt);
+
+/**
+ * xe_ggtt_clear() - GGTT clear
+ * @ggtt: the &xe_ggtt to be cleared
+ *
+ * Clear all GGTT to a known state
+ */
+void xe_ggtt_clear(struct xe_ggtt *ggtt)
+{
+	xe_ggtt_initial_clear(ggtt);
+}
+
 static void ggtt_fini_early(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
@@ -277,7 +290,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	/* Display may have allocated inside ggtt, so be careful with clearing here */
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
-		xe_ggtt_clear(ggtt, start, end - start);
+		__xe_ggtt_clear(ggtt, start, end - start);
 
 	xe_ggtt_invalidate(ggtt);
 	mutex_unlock(&ggtt->lock);
@@ -294,7 +307,7 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
 
 	mutex_lock(&ggtt->lock);
 	if (bound)
-		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
+		__xe_ggtt_clear(ggtt, node->base.start, node->base.size);
 	drm_mm_remove_node(&node->base);
 	node->base.size = 0;
 	mutex_unlock(&ggtt->lock);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 27e7d67de004..b7ae440cdebf 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -13,6 +13,8 @@ struct drm_printer;
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
+void xe_ggtt_clear(struct xe_ggtt *ggtt);
+
 struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
 void xe_ggtt_node_fini(struct xe_ggtt_node *node);
 int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
-- 
2.34.1

