Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7677698058
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61DB10EAFE;
	Wed, 15 Feb 2023 16:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651C310EAE2;
 Wed, 15 Feb 2023 16:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676477701; x=1708013701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6/IPmi7YTji8TNgTR+ciw3L6Y9HiGiLfBZFPL4xWuE4=;
 b=KxTfYbT7QsDFIR/gxuxbkzjvu9PV6liTvVQHNxsmfs/naowOziL61ZHC
 RY60VhzWtzC00w475gzgcHArNzIomgXhzzANqf8rmT9epWrtfZzkvlhBY
 c/ozcIdeDClepWbo3IDL4VXy73NEPa5BfXnZk7e+vT2mC6sHNKNoEfrrV
 Yzr2qhSyIJ/QML9vwzUaDkPBWnhVB8+maffWArDROhRMsW2Kd9xuy8sUY
 KK+PSD7i0qS6MjQ/g2QZMnQgyvdP6IUutba/KB01icXEFAIaerSyIGahd
 THtuVIlPLRYyNuNTHEbGHe1Sc/tV+nNCpel/NAPmB9Lwge3y85oqwkQXe w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="393870850"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="393870850"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758472313"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="758472313"
Received: from auliel-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.14])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:14:55 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 06/16] drm/ttm: Don't use watermark accounting on
 shrinkable pools
Date: Wed, 15 Feb 2023 17:13:55 +0100
Message-Id: <20230215161405.187368-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, NeilBrown <neilb@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mm@kvack.org,
 Dave Hansen <dave.hansen@intel.com>, linux-graphics-maintainer@vmware.com,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clarify the meaning of the ttm_tt pages_limit watermarks as the max
number of pages not accessible by shrinkers, and update accordingly so that
memory allocated by TTM devices that support shrinking is not
accounted against those limits. In particular this means that devices
using the dma_alloc pool will still be using the watermark method.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_device.c |  3 ++-
 drivers/gpu/drm/ttm/ttm_tt.c     | 43 +++++++++++++++++++-------------
 include/drm/ttm/ttm_pool.h       | 15 +++++++++++
 3 files changed, 42 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index a3cac42bb456..e0a2be3ed13d 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -168,7 +168,8 @@ long ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 	unsigned i;
 	long ret;
 
-	if (reason != TTM_SHRINK_WATERMARK && !bdev->funcs->bo_shrink)
+	if (reason != TTM_SHRINK_WATERMARK &&
+	    (!bdev->funcs->bo_shrink || !ttm_pool_can_shrink(&bdev->pool)))
 		return 0;
 
 	spin_lock(&bdev->lru_lock);
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index a68c14de0161..771e5f3c2fee 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -54,6 +54,21 @@ module_param_named(dma32_pages_limit, ttm_dma32_pages_limit, ulong, 0644);
 static atomic_long_t ttm_pages_allocated;
 static atomic_long_t ttm_dma32_pages_allocated;
 
+static bool ttm_tt_shrinkable(const struct ttm_device *bdev,
+			      const struct ttm_tt *tt)
+{
+	return !!bdev->funcs->bo_shrink &&
+		ttm_pool_can_shrink(&bdev->pool) &&
+		!(tt->page_flags & TTM_TT_FLAG_EXTERNAL);
+}
+
+static void ttm_tt_mod_allocated(bool dma32, long value)
+{
+	atomic_long_add(value, &ttm_pages_allocated);
+	if (dma32)
+		atomic_long_add(value, &ttm_dma32_pages_allocated);
+}
+
 /*
  * Allocates a ttm structure for the given BO.
  */
@@ -304,12 +319,9 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	if (ttm_tt_is_populated(ttm))
 		return 0;
 
-	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
-		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
-		if (bdev->pool.use_dma32)
-			atomic_long_add(ttm->num_pages,
-					&ttm_dma32_pages_allocated);
-	}
+	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL) &&
+	    !ttm_tt_shrinkable(bdev, ttm))
+		ttm_tt_mod_allocated(bdev->pool.use_dma32, ttm->num_pages);
 
 	while (atomic_long_read(&ttm_pages_allocated) > ttm_pages_limit ||
 	       atomic_long_read(&ttm_dma32_pages_allocated) >
@@ -343,12 +355,10 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	return 0;
 
 error:
-	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
-		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
-		if (bdev->pool.use_dma32)
-			atomic_long_sub(ttm->num_pages,
-					&ttm_dma32_pages_allocated);
-	}
+	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL) &&
+	    !ttm_tt_shrinkable(bdev, ttm))
+		ttm_tt_mod_allocated(bdev->pool.use_dma32, -(long)ttm->num_pages);
+
 	return ret;
 }
 EXPORT_SYMBOL(ttm_tt_populate);
@@ -363,12 +373,9 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 	else
 		ttm_pool_free(&bdev->pool, ttm);
 
-	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
-		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
-		if (bdev->pool.use_dma32)
-			atomic_long_sub(ttm->num_pages,
-					&ttm_dma32_pages_allocated);
-	}
+	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL) &&
+	    !ttm_tt_shrinkable(bdev, ttm))
+		ttm_tt_mod_allocated(bdev->pool.use_dma32, -(long)ttm->num_pages);
 
 	ttm->page_flags &= ~TTM_TT_FLAG_PRIV_POPULATED;
 }
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index ef09b23d29e3..c1200552892e 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -89,4 +89,19 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
 int ttm_pool_mgr_init(unsigned long num_pages);
 void ttm_pool_mgr_fini(void);
 
+/**
+ * ttm_pool_can_shrink - Whether page allocations from this pool are shrinkable
+ * @pool: The pool.
+ *
+ * Return: true if shrinkable, false if not.
+ */
+static inline bool ttm_pool_can_shrink(const struct ttm_pool *pool)
+{
+	/*
+	 * The dma_alloc pool pages can't be inserted into the
+	 * swap cache. Nor can they be split.
+	 */
+	return !pool->use_dma_alloc;
+}
+
 #endif
-- 
2.34.1

