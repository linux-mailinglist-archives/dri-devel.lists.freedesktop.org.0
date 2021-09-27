Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FF1419372
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 13:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0574F6E846;
	Mon, 27 Sep 2021 11:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB27289FD3;
 Mon, 27 Sep 2021 11:42:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="204610612"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="204610612"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:42:12 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="553159040"
Received: from ajhome-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.222])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:42:10 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 07/13] drm/ttm: add TTM_TT_FLAG_EXTERNAL_MAPPABLE
Date: Mon, 27 Sep 2021 12:41:08 +0100
Message-Id: <20210927114114.152310-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210927114114.152310-1-matthew.auld@intel.com>
References: <20210927114114.152310-1-matthew.auld@intel.com>
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

In commit:

commit 667a50db0477d47fdff01c666f5ee1ce26b5264c
Author: Thomas Hellstrom <thellstrom@vmware.com>
Date:   Fri Jan 3 11:17:18 2014 +0100

    drm/ttm: Refuse to fault (prime-) imported pages

we introduced the restriction that imported pages should not be directly
mappable through TTM(this also extends to userptr). In the next patch we
want to introduce a shmem_tt backend, which should follow all the
existing rules with TTM_PAGE_FLAG_EXTERNAL, since it will need to handle
swapping itself, but with the above mapping restriction lifted.

v2(Christian):
  - Don't OR together EXTERNAL and EXTERNAL_MAPPABLE in the definition
    of EXTERNAL_MAPPABLE, just leave it the caller to handle this
    correctly, otherwise we might encounter subtle issues.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c |  6 ++++--
 drivers/gpu/drm/ttm/ttm_tt.c    |  3 +++
 include/drm/ttm/ttm_tt.h        | 19 ++++++++++++++++---
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 950f4f132802..33680c94127c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -163,8 +163,10 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 	 * (if at all) by redirecting mmap to the exporter.
 	 */
 	if (bo->ttm && (bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
-		dma_resv_unlock(bo->base.resv);
-		return VM_FAULT_SIGBUS;
+		if (!(bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE)) {
+			dma_resv_unlock(bo->base.resv);
+			return VM_FAULT_SIGBUS;
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 86f31fde6e35..7e83c00a3f48 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -84,6 +84,9 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
 	if (unlikely(bo->ttm == NULL))
 		return -ENOMEM;
 
+	WARN_ON(bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE &&
+		!(bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL));
+
 	return 0;
 }
 
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 86d74069be3e..f20832139815 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -67,13 +67,26 @@ struct ttm_tt {
 	 * Note that enum ttm_bo_type.ttm_bo_type_sg objects will always enable
 	 * this flag.
 	 *
+	 * TTM_TT_FLAG_EXTERNAL_MAPPABLE: Same behaviour as
+	 * TTM_TT_FLAG_EXTERNAL, but with the reduced restriction that it is
+	 * still valid to use TTM to map the pages directly. This is useful when
+	 * implementing a ttm_tt backend which still allocates driver owned
+	 * pages underneath(say with shmem).
+	 *
+	 * Note that since this also implies TTM_TT_FLAG_EXTERNAL, the usage
+	 * here should always be:
+	 *
+	 *   page_flags = TTM_TT_FLAG_EXTERNAL |
+	 *		  TTM_TT_FLAG_EXTERNAL_MAPPABLE;
+	 *
 	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
 	 * set by TTM after ttm_tt_populate() has successfully returned, and is
 	 * then unset when TTM calls ttm_tt_unpopulate().
 	 */
-#define TTM_TT_FLAG_SWAPPED	(1 << 0)
-#define TTM_TT_FLAG_ZERO_ALLOC	(1 << 1)
-#define TTM_TT_FLAG_EXTERNAL	(1 << 2)
+#define TTM_TT_FLAG_SWAPPED		(1 << 0)
+#define TTM_TT_FLAG_ZERO_ALLOC		(1 << 1)
+#define TTM_TT_FLAG_EXTERNAL		(1 << 2)
+#define TTM_TT_FLAG_EXTERNAL_MAPPABLE	(1 << 3)
 
 #define TTM_TT_FLAG_PRIV_POPULATED  (1 << 31)
 	uint32_t page_flags;
-- 
2.26.3

