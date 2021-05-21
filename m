Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8354638CA33
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 17:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECD96EE2B;
	Fri, 21 May 2021 15:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FD86EDA1;
 Fri, 21 May 2021 15:33:22 +0000 (UTC)
IronPort-SDR: QfhUVtw6p9WBlMHYUoInLD66TMdkawaaHtk0BTbvxr0wR/FHgpboraNAvx/3jqy5wqQmf/alLq
 xzAvfxCBA+fA==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="265415722"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="265415722"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 08:33:21 -0700
IronPort-SDR: FVM8KAiRZ/YMbi9YST1FBuZVKnZOds1jTectzHRrXkJNY2ZxAOSxIJlw4yBkyC36xPuAWthx6n
 5b7nW4W733SA==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="441125461"
Received: from imarinmo-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.34])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 08:33:19 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 08/12] drm/ttm: Use drm_memcpy_from_wc_dbm for TTM bo moves
Date: Fri, 21 May 2021 17:32:49 +0200
Message-Id: <20210521153253.518037-9-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521153253.518037-1-thomas.hellstrom@linux.intel.com>
References: <20210521153253.518037-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use fast wc memcpy for reading out of wc memory for TTM bo moves.

Cc: Dave Airlie <airlied@gmail.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 912cbe8e60a2..4a7d3d672f9a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -31,6 +31,7 @@
 
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/drm_memcpy.h>
 #include <drm/drm_vma_manager.h>
 #include <linux/dma-buf-map.h>
 #include <linux/io.h>
@@ -91,6 +92,7 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo,
 	const struct ttm_kmap_iter_ops *src_ops = src_iter->ops;
 	struct ttm_tt *ttm = bo->ttm;
 	struct dma_buf_map src_map, dst_map;
+	bool wc_memcpy;
 	pgoff_t i;
 
 	/* Single TTM move. NOP */
@@ -114,11 +116,16 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo,
 		return;
 	}
 
+	wc_memcpy = ((!src_ops->maps_tt || ttm->caching != ttm_cached) &&
+		     drm_has_memcpy_from_wc());
+
 	for (i = 0; i < dst_mem->num_pages; ++i) {
 		dst_ops->map_local(dst_iter, &dst_map, i);
 		src_ops->map_local(src_iter, &src_map, i);
 
-		if (!src_map.is_iomem && !dst_map.is_iomem) {
+		if (wc_memcpy) {
+			drm_memcpy_from_wc_dbm(&dst_map, &src_map, PAGE_SIZE);
+		} else if (!src_map.is_iomem && !dst_map.is_iomem) {
 			memcpy(dst_map.vaddr, src_map.vaddr, PAGE_SIZE);
 		} else if (!src_map.is_iomem) {
 			dma_buf_map_memcpy_to(&dst_map, src_map.vaddr,
-- 
2.31.1

