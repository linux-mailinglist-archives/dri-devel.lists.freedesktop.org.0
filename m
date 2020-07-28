Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B4322FFC9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 04:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229B489E0C;
	Tue, 28 Jul 2020 02:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBF389E0C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 02:40:28 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-NxefLA8PNL2XOe_GgvmETQ-1; Mon, 27 Jul 2020 22:40:26 -0400
X-MC-Unique: NxefLA8PNL2XOe_GgvmETQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39DD3100CCC0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 02:40:19 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BA18712D0;
 Tue, 28 Jul 2020 02:40:18 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau: use ttm populate mapping functions.
Date: Tue, 28 Jul 2020 12:40:16 +1000
Message-Id: <20200728024016.19102-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Instead of rolling driver copies of them.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 32 ++--------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7806278dce57..fe773737b662 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1231,7 +1231,6 @@ nouveau_ttm_tt_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 	struct ttm_dma_tt *ttm_dma = (void *)ttm;
 	struct nouveau_drm *drm;
 	struct device *dev;
-	unsigned i;
 	int r;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
@@ -1261,29 +1260,10 @@ nouveau_ttm_tt_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 	}
 #endif
 
-	r = ttm_pool_populate(ttm, ctx);
+	r = ttm_populate_and_map_pages(dev, ttm_dma, ctx);
 	if (r) {
 		return r;
 	}
-
-	for (i = 0; i < ttm->num_pages; i++) {
-		dma_addr_t addr;
-
-		addr = dma_map_page(dev, ttm->pages[i], 0, PAGE_SIZE,
-				    DMA_BIDIRECTIONAL);
-
-		if (dma_mapping_error(dev, addr)) {
-			while (i--) {
-				dma_unmap_page(dev, ttm_dma->dma_address[i],
-					       PAGE_SIZE, DMA_BIDIRECTIONAL);
-				ttm_dma->dma_address[i] = 0;
-			}
-			ttm_pool_unpopulate(ttm);
-			return -EFAULT;
-		}
-
-		ttm_dma->dma_address[i] = addr;
-	}
 	return 0;
 }
 
@@ -1293,7 +1273,6 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt *ttm)
 	struct ttm_dma_tt *ttm_dma = (void *)ttm;
 	struct nouveau_drm *drm;
 	struct device *dev;
-	unsigned i;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (slave)
@@ -1316,14 +1295,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt *ttm)
 	}
 #endif
 
-	for (i = 0; i < ttm->num_pages; i++) {
-		if (ttm_dma->dma_address[i]) {
-			dma_unmap_page(dev, ttm_dma->dma_address[i], PAGE_SIZE,
-				       DMA_BIDIRECTIONAL);
-		}
-	}
-
-	ttm_pool_unpopulate(ttm);
+	ttm_unmap_and_unpopulate_pages(dev, ttm_dma);
 }
 
 void
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
