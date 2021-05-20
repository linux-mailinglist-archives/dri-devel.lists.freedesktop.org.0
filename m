Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 904A738B2B0
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 17:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6DB6F483;
	Thu, 20 May 2021 15:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F7A6F476;
 Thu, 20 May 2021 15:10:38 +0000 (UTC)
IronPort-SDR: soodJrzJrGB2H3JHvLrO4VoE/mbQFtgYRJRpAjbeiI+VmQu6BU5RTlnwvKmO3vD43qE/TxHePD
 3xsePCamKJDw==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="222341204"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="222341204"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:10:04 -0700
IronPort-SDR: sWL1XLZ6gJ82jJQCMa9OAbhu+4UAbec+tsXQVHEYidVGiZ7eko4VIQbkixvId+o+XhOP7mnqS2
 Vvw0HCh3IkiQ==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="395728192"
Received: from cbjoerns-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.247])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:10:03 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 3/5] drm/ttm: Use drm_memcpy_from_wc for TTM bo moves
Date: Thu, 20 May 2021 17:09:45 +0200
Message-Id: <20210520150947.803891-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520150947.803891-1-thomas.hellstrom@linux.intel.com>
References: <20210520150947.803891-1-thomas.hellstrom@linux.intel.com>
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
 drivers/gpu/drm/ttm/ttm_bo_util.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index bad9b16e96ba..919ee03f7eb3 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -31,6 +31,7 @@
 
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/drm_memcpy.h>
 #include <drm/drm_vma_manager.h>
 #include <linux/dma-buf-map.h>
 #include <linux/io.h>
@@ -185,6 +186,7 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo,
 	struct ttm_resource *old_mem = &bo->mem;
 	struct ttm_resource_manager *old_man = ttm_manager_type(bdev, old_mem->mem_type);
 	struct dma_buf_map old_map, new_map;
+	bool wc_memcpy;
 	pgoff_t i;
 
 	/* Single TTM move. NOP */
@@ -208,11 +210,25 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo,
 		return;
 	}
 
+	wc_memcpy = ((!old_man->use_tt || bo->ttm->caching != ttm_cached) &&
+		     drm_has_memcpy_from_wc());
+
+	/*
+	 * We use some nasty aliasing for drm_memcpy_from_wc, but assuming
+	 * that we can move to memremapping in the not too distant future,
+	 * reduce the fragility for now with a build assert.
+	 */
+	BUILD_BUG_ON(offsetof(typeof(old_map), vaddr) !=
+		     offsetof(typeof(old_map), vaddr_iomem));
+
 	for (i = 0; i < new_mem->num_pages; ++i) {
 		new_iter->ops->kmap_local(new_iter, &new_map, i);
 		old_iter->ops->kmap_local(old_iter, &old_map, i);
 
-		if (!old_map.is_iomem && !new_map.is_iomem) {
+		if (wc_memcpy) {
+			drm_memcpy_from_wc(new_map.vaddr, old_map.vaddr,
+					   PAGE_SIZE);
+		} else if (!old_map.is_iomem && !new_map.is_iomem) {
 			memcpy(new_map.vaddr, old_map.vaddr, PAGE_SIZE);
 		} else if (!old_map.is_iomem) {
 			dma_buf_map_memcpy_to(&new_map, old_map.vaddr,
-- 
2.31.1

