Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC75F698060
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FB010EB09;
	Wed, 15 Feb 2023 16:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D2210EB07;
 Wed, 15 Feb 2023 16:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676477720; x=1708013720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+J9Q8IYoZ1+1On4d1sDlco0YPYtSi+y9zkG53x3D21Y=;
 b=jBbsypqT1kYJ93s/K0e2PAYMWNW5wQ+AFUt73L84PxBN2FPb7S8B3VXw
 iYSBcwE7lPjE6xBuDsqUtWuIFVFx/jbxpyOw3efgDn3ExOvXtiFTkQhow
 7w6VyCDr7e9KZb7t+pd3FAjs+fZXjUEn2x7rDzZ8j7lQ0mm2YpT2y8fLk
 F1V9PyDGWVLGMJg0UaI3/+EB9Tz5w5RZYpTOBCH+ax/jyUTP9dXNhmN8Z
 VjUKb7BzJOgbvnNIjRiLJou2e2D8na2dJaHia5pbW0wi3YWVgNilkJc9u
 XGaYGb/Kg+YwvMrvNuKivYBqqED+eXAzQ3m3suEISgGCKt5fP5JvDaiKY A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="393871016"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="393871016"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758472532"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="758472532"
Received: from auliel-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.14])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:15 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 10/16] drm/ttm: Remove pinned bos from shrinkable
 accounting
Date: Wed, 15 Feb 2023 17:13:59 +0100
Message-Id: <20230215161405.187368-11-thomas.hellstrom@linux.intel.com>
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

Pinned bos aren't shinkable and needs to be removed from the shrinkable
accounting. Do that, and in the process constify the tt argument to
ttm_tt_is_populated.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c |  7 +++++++
 drivers/gpu/drm/ttm/ttm_tt.c | 22 ++++++++++++++++++++++
 include/drm/ttm/ttm_tt.h     |  6 +++++-
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e5c0970564c0..e59e2a4605d0 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -650,6 +650,10 @@ void ttm_bo_pin(struct ttm_buffer_object *bo)
 {
 	dma_resv_assert_held(bo->base.resv);
 	WARN_ON_ONCE(!kref_read(&bo->kref));
+
+	if (!bo->pin_count && bo->ttm)
+		ttm_tt_set_pinned(bo->bdev, bo->ttm);
+
 	spin_lock(&bo->bdev->lru_lock);
 	if (bo->resource)
 		ttm_resource_del_bulk_move(bo->resource, bo);
@@ -671,6 +675,9 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo)
 	if (WARN_ON_ONCE(!bo->pin_count))
 		return;
 
+	if (bo->pin_count == 1 && bo->ttm)
+		ttm_tt_set_unpinned(bo->bdev, bo->ttm);
+
 	spin_lock(&bo->bdev->lru_lock);
 	--bo->pin_count;
 	if (bo->resource)
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 848adf2a623e..a39c617c7a8e 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -83,6 +83,28 @@ static void ttm_tt_mod_shrinkable_pages(long shrinkable, long purgeable)
 	write_unlock(&shrinkable_lock);
 }
 
+/**
+ * ttm_tt_set_pinned() - Modify the shinkable accounting when pinning a bo.
+ * @bdev: The TTM device.
+ * @tt: The struct tt_tt used by the pinned bo.
+ */
+void ttm_tt_set_pinned(const struct ttm_device *bdev, const struct ttm_tt *tt)
+{
+	if (ttm_tt_shrinkable(bdev, tt) && ttm_tt_is_populated(tt))
+		ttm_tt_mod_shrinkable_pages(-(long)tt->num_pages, 0);
+}
+
+/**
+ * ttm_tt_set_unpinned() - Modify the shinkable accounting when unpinning a bo.
+ * @bdev: The TTM device.
+ * @tt: The struct tt_tt used by the no longer pinned bo.
+ */
+void ttm_tt_set_unpinned(const struct ttm_device *bdev, const struct ttm_tt *tt)
+{
+	if (ttm_tt_shrinkable(bdev, tt) && ttm_tt_is_populated(tt))
+		ttm_tt_mod_shrinkable_pages(tt->num_pages, 0);
+}
+
 /*
  * Allocates a ttm structure for the given BO.
  */
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 3f99787e2b93..69467671c2dd 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -118,7 +118,7 @@ struct ttm_kmap_iter_tt {
 	pgprot_t prot;
 };
 
-static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
+static inline bool ttm_tt_is_populated(const struct ttm_tt *tt)
 {
 	return tt->page_flags & TTM_TT_FLAG_PRIV_POPULATED;
 }
@@ -238,6 +238,10 @@ static inline bool ttm_tt_purgeable(struct ttm_tt *tt)
 	return tt->page_flags & TTM_TT_FLAG_DONTNEED;
 }
 
+void ttm_tt_set_pinned(const struct ttm_device *bdev, const struct ttm_tt *tt);
+
+void ttm_tt_set_unpinned(const struct ttm_device *bdev, const struct ttm_tt *tt);
+
 #if IS_ENABLED(CONFIG_AGP)
 #include <linux/agp_backend.h>
 
-- 
2.34.1

