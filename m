Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DF823000D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 05:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763716E145;
	Tue, 28 Jul 2020 03:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8236E145
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:25:52 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-X11200hvObiw-Fk6fDWIEQ-1; Mon, 27 Jul 2020 23:25:49 -0400
X-MC-Unique: X11200hvObiw-Fk6fDWIEQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B694D8015CE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:25:48 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA03F10013D0;
 Tue, 28 Jul 2020 03:25:47 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau: use ttm populate mapping functions. (v2)
Date: Tue, 28 Jul 2020 13:25:45 +1000
Message-Id: <20200728032545.19878-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

v2: cleanup return handling (Ben)
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 38 ++--------------------------
 1 file changed, 2 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7806278dce57..6ef5085c9a91 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1231,8 +1231,6 @@ nouveau_ttm_tt_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 	struct ttm_dma_tt *ttm_dma = (void *)ttm;
 	struct nouveau_drm *drm;
 	struct device *dev;
-	unsigned i;
-	int r;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (ttm->state != tt_unpopulated)
@@ -1260,31 +1258,7 @@ nouveau_ttm_tt_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 		return ttm_dma_populate((void *)ttm, dev, ctx);
 	}
 #endif
-
-	r = ttm_pool_populate(ttm, ctx);
-	if (r) {
-		return r;
-	}
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
-	return 0;
+	return ttm_populate_and_map_pages(dev, ttm_dma, ctx);
 }
 
 static void
@@ -1293,7 +1267,6 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt *ttm)
 	struct ttm_dma_tt *ttm_dma = (void *)ttm;
 	struct nouveau_drm *drm;
 	struct device *dev;
-	unsigned i;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (slave)
@@ -1316,14 +1289,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt *ttm)
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
