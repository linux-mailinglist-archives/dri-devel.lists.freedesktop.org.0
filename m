Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5282F419356
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 13:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0F389EAE;
	Mon, 27 Sep 2021 11:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B1089EAC;
 Mon, 27 Sep 2021 11:42:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="204610588"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="204610588"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:42:04 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="553158952"
Received: from ajhome-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.222])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:42:01 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 01/13] drm/ttm: stop calling tt_swapin in vm_access
Date: Mon, 27 Sep 2021 12:41:02 +0100
Message-Id: <20210927114114.152310-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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

commit 09ac4fcb3f255e9225967c75f5893325c116cdbe
Author: Felix Kuehling <Felix.Kuehling@amd.com>
Date:   Thu Jul 13 17:01:16 2017 -0400

    drm/ttm: Implement vm_operations_struct.access v2

we added the vm_access hook, where we also directly call tt_swapin for
some reason. If something is swapped-out then the ttm_tt must also be
unpopulated, and since access_kmap should also call tt_populate, if
needed, then swapping-in will already be handled there.

If anything, calling tt_swapin directly here would likely always fail
since the tt->pages won't yet be populated, or worse since the tt->pages
array is never actually cleared in unpopulate this might lead to a nasty
uaf.

Fixes: 09ac4fcb3f25 ("drm/ttm: Implement vm_operations_struct.access v2")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index f56be5bc0861..5b9b7fd01a69 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -519,11 +519,6 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 
 	switch (bo->resource->mem_type) {
 	case TTM_PL_SYSTEM:
-		if (unlikely(bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
-			ret = ttm_tt_swapin(bo->ttm);
-			if (unlikely(ret != 0))
-				return ret;
-		}
 		fallthrough;
 	case TTM_PL_TT:
 		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
-- 
2.26.3

