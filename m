Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A70723B2F1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EA96E3AC;
	Tue,  4 Aug 2020 02:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A9D6E3AE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:57:33 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-shATg-JyPrGQetEO0v9QUg-1; Mon, 03 Aug 2020 22:57:28 -0400
X-MC-Unique: shATg-JyPrGQetEO0v9QUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 950AB100AA23;
 Tue,  4 Aug 2020 02:57:27 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9AC890E68;
 Tue,  4 Aug 2020 02:57:25 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 19/59] drm/nouveau: use new memory manager init paths
Date: Tue,  4 Aug 2020 12:55:52 +1000
Message-Id: <20200804025632.3868079-20-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 43 ++++++++++++---------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 6de762a0c229..cfcbecd332ef 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -31,12 +31,6 @@
 
 #include <core/tegra.h>
 
-static int
-nouveau_manager_init(struct ttm_mem_type_manager *man, unsigned long psize)
-{
-	return 0;
-}
-
 static int
 nouveau_manager_fini(struct ttm_mem_type_manager *man)
 {
@@ -76,7 +70,6 @@ nouveau_vram_manager_new(struct ttm_mem_type_manager *man,
 }
 
 const struct ttm_mem_type_manager_func nouveau_vram_manager = {
-	.init = nouveau_manager_init,
 	.takedown = nouveau_manager_fini,
 	.get_node = nouveau_vram_manager_new,
 	.put_node = nouveau_manager_del,
@@ -101,7 +94,6 @@ nouveau_gart_manager_new(struct ttm_mem_type_manager *man,
 }
 
 const struct ttm_mem_type_manager_func nouveau_gart_manager = {
-	.init = nouveau_manager_init,
 	.takedown = nouveau_manager_fini,
 	.get_node = nouveau_gart_manager_new,
 	.put_node = nouveau_manager_del,
@@ -135,7 +127,6 @@ nv04_gart_manager_new(struct ttm_mem_type_manager *man,
 }
 
 const struct ttm_mem_type_manager_func nv04_gart_manager = {
-	.init = nouveau_manager_init,
 	.takedown = nouveau_manager_fini,
 	.get_node = nv04_gart_manager_new,
 	.put_node = nouveau_manager_del,
@@ -191,27 +182,21 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 
 		man->func = &nouveau_vram_manager;
 		man->use_io_reserve_lru = true;
+		ttm_mem_type_manager_init(&drm->ttm.bdev, man,
+					  drm->gem.vram_available >> PAGE_SHIFT);
+		ttm_mem_type_manager_set_used(man, true);
+		return 0;
 	} else {
-		man->func = &ttm_bo_manager_func;
+		return ttm_range_man_init(&drm->ttm.bdev, man,
+					  drm->gem.vram_available >> PAGE_SHIFT);
 	}
-
-	return ttm_bo_init_mm(&drm->ttm.bdev, TTM_PL_VRAM,
-			      drm->gem.vram_available >> PAGE_SHIFT);
 }
 
 static int
 nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 {
 	struct ttm_mem_type_manager *man = &drm->ttm.bdev.man[TTM_PL_TT];
-
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)
-		man->func = &nouveau_gart_manager;
-	else
-	if (!drm->agp.bridge)
-		man->func = &nv04_gart_manager;
-	else
-		man->func = &ttm_bo_manager_func;
-
+	unsigned long size_pages = drm->gem.gart_available >> PAGE_SHIFT;
 	man->use_tt = true;
 	if (drm->agp.bridge) {
 		man->available_caching = TTM_PL_FLAG_UNCACHED |
@@ -222,8 +207,18 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 		man->default_caching = TTM_PL_FLAG_CACHED;
 	}
 
-	return ttm_bo_init_mm(&drm->ttm.bdev, TTM_PL_TT,
-			      drm->gem.gart_available >> PAGE_SHIFT);
+	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)
+		man->func = &nouveau_gart_manager;
+	else if (!drm->agp.bridge)
+		man->func = &nv04_gart_manager;
+	else
+		return ttm_range_man_init(&drm->ttm.bdev, man,
+					  size_pages);
+
+	ttm_mem_type_manager_init(&drm->ttm.bdev, man,
+				  size_pages);
+	ttm_mem_type_manager_set_used(man, true);
+	return 0;
 }
 
 int
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
