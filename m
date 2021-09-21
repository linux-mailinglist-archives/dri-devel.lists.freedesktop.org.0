Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BD041321F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 13:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5733B6E94B;
	Tue, 21 Sep 2021 11:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5006E949;
 Tue, 21 Sep 2021 11:01:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="284344111"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="284344111"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 04:01:35 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="484141739"
Received: from agallagh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.17.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 04:01:33 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v4 01/14] drm/ttm: stop calling tt_swapin in vm_access
Date: Tue, 21 Sep 2021 12:01:08 +0100
Message-Id: <20210921110121.3783395-1-matthew.auld@intel.com>
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

