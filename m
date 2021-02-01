Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 402A6309FD6
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 02:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F286E2A3;
	Mon,  1 Feb 2021 01:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 367 seconds by postgrey-1.36 at gabe;
 Mon, 01 Feb 2021 01:08:08 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EB96E2A3
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 01:08:08 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-zq0WjKejO7qfijCXB3nzPg-1; Sun, 31 Jan 2021 20:01:55 -0500
X-MC-Unique: zq0WjKejO7qfijCXB3nzPg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D5F6800D55
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 01:01:54 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3AE057995
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 01:01:53 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: fix dma syncing warning with debugging on.
Date: Mon,  1 Feb 2021 11:01:51 +1000
Message-Id: <20210201010151.28898-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Since I wrote the below patch if you run a debug kernel you can a
dma debug warning like:
nouveau 0000:1f:00.0: DMA-API: device driver tries to sync DMA memory it has not allocated [device address=0x000000016e012000] [size=4096 bytes]

The old nouveau code wasn't consolidate the pages like the ttm code,
but the dma-debug expects the sync code to give it the same base/range
pairs as the allocator.

Fix the nouveau sync code to consolidate pages before calling the
sync code.

Fixes: bd549d35b4be0 ("nouveau: use ttm populate mapping functions. (v2)")
Reported-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 35 +++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 33dc886d1d6d..2375711877cf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -547,7 +547,7 @@ nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
 {
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
 	struct ttm_tt *ttm_dma = (struct ttm_tt *)nvbo->bo.ttm;
-	int i;
+	int i, j;
 
 	if (!ttm_dma)
 		return;
@@ -556,10 +556,21 @@ nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
 	if (nvbo->force_coherent)
 		return;
 
-	for (i = 0; i < ttm_dma->num_pages; i++)
+	for (i = 0; i < ttm_dma->num_pages; ++i) {
+		struct page *p = ttm_dma->pages[i];
+		size_t num_pages = 1;
+
+		for (j = i + 1; j < ttm_dma->num_pages; ++j) {
+			if (++p != ttm_dma->pages[j])
+				break;
+
+			++num_pages;
+		}
 		dma_sync_single_for_device(drm->dev->dev,
 					   ttm_dma->dma_address[i],
-					   PAGE_SIZE, DMA_TO_DEVICE);
+					   num_pages * PAGE_SIZE, DMA_TO_DEVICE);
+		i += num_pages;
+	}
 }
 
 void
@@ -567,7 +578,7 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
 {
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
 	struct ttm_tt *ttm_dma = (struct ttm_tt *)nvbo->bo.ttm;
-	int i;
+	int i, j;
 
 	if (!ttm_dma)
 		return;
@@ -576,9 +587,21 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
 	if (nvbo->force_coherent)
 		return;
 
-	for (i = 0; i < ttm_dma->num_pages; i++)
+	for (i = 0; i < ttm_dma->num_pages; ++i) {
+		struct page *p = ttm_dma->pages[i];
+		size_t num_pages = 1;
+
+		for (j = i + 1; j < ttm_dma->num_pages; ++j) {
+			if (++p != ttm_dma->pages[j])
+				break;
+
+			++num_pages;
+		}
+
 		dma_sync_single_for_cpu(drm->dev->dev, ttm_dma->dma_address[i],
-					PAGE_SIZE, DMA_FROM_DEVICE);
+					num_pages * PAGE_SIZE, DMA_FROM_DEVICE);
+		i += num_pages;
+	}
 }
 
 void nouveau_bo_add_io_reserve_lru(struct ttm_buffer_object *bo)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
