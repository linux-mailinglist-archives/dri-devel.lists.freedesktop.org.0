Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75540391645
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 13:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC5A6EC9D;
	Wed, 26 May 2021 11:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCAC6ECA6;
 Wed, 26 May 2021 11:33:29 +0000 (UTC)
IronPort-SDR: DkiTDG/I2L7ijkhR0jsMSjyNbe2u258gWhf4rvawCZ08/79KXqvoUkZwbos50yrlEhrJB9e9+V
 l7gfrctYYn8A==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="223627298"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="223627298"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 04:33:29 -0700
IronPort-SDR: CLYGnvNrj3mxpJFW5YJMnNvBUhdEXSrodcVDGv10AzYS7HHyG1cc2IpnMxGVORBcsc+0t+JCHa
 yOicJfLaVO5g==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="633457900"
Received: from pegilssx-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.205])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 04:33:27 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 08/15] drm/ttm: Use drm_memcpy_from_wc_dbm for TTM bo moves
Date: Wed, 26 May 2021 13:32:52 +0200
Message-Id: <20210526113259.1661914-9-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526113259.1661914-1-thomas.hellstrom@linux.intel.com>
References: <20210526113259.1661914-1-thomas.hellstrom@linux.intel.com>
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
--
v4:
- Clarify when we try drm_memcpy_from_wc_dbm (Reported by Matthew Auld)
- Be paranoid about when drm_memcpy_from_wc_dbm may fail (Reported by
  Matthew Auld)
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 6ac7744a1a5c..ebff603a97f4 100644
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
@@ -114,11 +116,21 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo,
 		return;
 	}
 
+	/*
+	 * Condition this on src being WC if needed. However i915 perf
+	 * selftest indicates that for PAGE_SIZE chunks, wc_memcpy
+	 * outperforms memcpy() on all cases except WB->WB where results
+	 * are similar.
+	 */
+	wc_memcpy = drm_has_memcpy_from_wc();
+
 	for (i = 0; i < num_pages; ++i) {
 		dst_ops->map_local(dst_iter, &dst_map, i);
 		src_ops->map_local(src_iter, &src_map, i);
 
-		if (!src_map.is_iomem && !dst_map.is_iomem) {
+		if (wc_memcpy && drm_memcpy_from_wc_dbm(&dst_map, &src_map, PAGE_SIZE)) {
+			;
+		} else if (!src_map.is_iomem && !dst_map.is_iomem) {
 			memcpy(dst_map.vaddr, src_map.vaddr, PAGE_SIZE);
 		} else if (!src_map.is_iomem) {
 			dma_buf_map_memcpy_to(&dst_map, src_map.vaddr,
-- 
2.31.1

