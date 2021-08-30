Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0EE3FB211
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 09:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A553D89C27;
	Mon, 30 Aug 2021 07:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CC189C27;
 Mon, 30 Aug 2021 07:48:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="198466071"
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; d="scan'208";a="198466071"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 00:48:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; d="scan'208";a="427756585"
Received: from ahashmi-mobl.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.89])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 00:48:52 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Ben Skeggs <skeggsb@gmail.com>, Dave Airlie <airlied@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/ttm: Fix ttm_bo_move_memcpy() for subclassed struct
 ttm_resource
Date: Mon, 30 Aug 2021 09:48:35 +0200
Message-Id: <20210830074835.16596-1-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code was making a copy of a struct ttm_resource. However,
recently the struct ttm_resources were allowed to be subclassed and
also were allowed to be malloced, hence the driver could end up assuming
the copy we handed it was subclassed and worse, the original could have
been freed at this point.

Fix this by using the original struct ttm_resource before it is
potentially freed in ttm_bo_move_sync_cleanup()

Reported-by: Ben Skeggs <skeggsb@gmail.com>
Reported-by: Dave Airlie <airlied@gmail.com>
Cc: Christian König <christian.koenig@amd.com>
Fixes: 3bf3710e3718 ("drm/ttm: Add a generic TTM memcpy move for page-based iomem")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 5c20d0541cc3..c893c3db2623 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -139,7 +139,6 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	struct ttm_resource *src_mem = bo->resource;
 	struct ttm_resource_manager *src_man =
 		ttm_manager_type(bdev, src_mem->mem_type);
-	struct ttm_resource src_copy = *src_mem;
 	union {
 		struct ttm_kmap_iter_tt tt;
 		struct ttm_kmap_iter_linear_io io;
@@ -173,11 +172,10 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	if (!(clear && ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC)))
 		ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_iter);
 
-	src_copy = *src_mem;
+	if (!src_iter->ops->maps_tt)
+		ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, src_mem);
 	ttm_bo_move_sync_cleanup(bo, dst_mem);
 
-	if (!src_iter->ops->maps_tt)
-		ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, &src_copy);
 out_src_iter:
 	if (!dst_iter->ops->maps_tt)
 		ttm_kmap_iter_linear_io_fini(&_dst_iter.io, bdev, dst_mem);
-- 
2.31.1

