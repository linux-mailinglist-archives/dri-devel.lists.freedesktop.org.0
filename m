Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8410839417D
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 12:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CD86F383;
	Fri, 28 May 2021 10:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98436F493;
 Fri, 28 May 2021 10:58:10 +0000 (UTC)
IronPort-SDR: mDSeQs730E1WDtvt0fedZir1Pujxiy7aH5TGin89a1+WJToW1zF2AXpH5MW18K1/oHitsGypqw
 xBwBlnuZdWQA==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="266821833"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="266821833"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 03:58:10 -0700
IronPort-SDR: 6RK6iZEoVlhx5kBqe9s2+GDMfhOVx/LoWZ7ciKCN2eaVSqI6YIaMwyO5o9R9K8snKehUGj/Z1K
 EjjlMzkqJ5ww==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="477885233"
Received: from jdahlin-mobl1.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.92])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 03:58:08 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 08/15] drm/ttm: Use drm_memcpy_from_wc for TTM bo moves
Date: Fri, 28 May 2021 12:57:37 +0200
Message-Id: <20210528105744.58271-9-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528105744.58271-1-thomas.hellstrom@linux.intel.com>
References: <20210528105744.58271-1-thomas.hellstrom@linux.intel.com>
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
Reviewed-by: Christian König <christian.koenig@amd.com> #v4
--
v4:
- Clarify when we try drm_memcpy_from_wc_dbm (Reported by Matthew Auld)
- Be paranoid about when drm_memcpy_from_wc_dbm may fail (Reported by
  Matthew Auld)
v5:
- Rebase on change to drm_memcpy_from_wc (Suggested by Daniel Vetter)
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 6ac7744a1a5c..a46f705ba78b 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -31,6 +31,7 @@
 
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/drm_cache.h>
 #include <drm/drm_vma_manager.h>
 #include <linux/dma-buf-map.h>
 #include <linux/io.h>
@@ -118,22 +119,8 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo,
 		dst_ops->map_local(dst_iter, &dst_map, i);
 		src_ops->map_local(src_iter, &src_map, i);
 
-		if (!src_map.is_iomem && !dst_map.is_iomem) {
-			memcpy(dst_map.vaddr, src_map.vaddr, PAGE_SIZE);
-		} else if (!src_map.is_iomem) {
-			dma_buf_map_memcpy_to(&dst_map, src_map.vaddr,
-					      PAGE_SIZE);
-		} else if (!dst_map.is_iomem) {
-			memcpy_fromio(dst_map.vaddr, src_map.vaddr_iomem,
-				      PAGE_SIZE);
-		} else {
-			int j;
-			u32 __iomem *src = src_map.vaddr_iomem;
-			u32 __iomem *dst = dst_map.vaddr_iomem;
-
-			for (j = 0; j < (PAGE_SIZE / sizeof(u32)); ++j)
-				iowrite32(ioread32(src++), dst++);
-		}
+		drm_memcpy_from_wc(&dst_map, &src_map, PAGE_SIZE);
+
 		if (src_ops->unmap_local)
 			src_ops->unmap_local(src_iter, &src_map);
 		if (dst_ops->unmap_local)
-- 
2.31.1

