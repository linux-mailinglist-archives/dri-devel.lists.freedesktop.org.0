Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1077423B311
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92996E400;
	Tue,  4 Aug 2020 02:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BD76E3FE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:58:49 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-RX1gYvoqPD6HCfvdvKN0Yg-1; Mon, 03 Aug 2020 22:58:44 -0400
X-MC-Unique: RX1gYvoqPD6HCfvdvKN0Yg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AE0F8010C7;
 Tue,  4 Aug 2020 02:58:43 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1B3F90E68;
 Tue,  4 Aug 2020 02:58:41 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 50/59] drm/nouveau/ttm: move to driver allocated manager
Date: Tue,  4 Aug 2020 12:56:23 +1000
Message-Id: <20200804025632.3868079-51-airlied@gmail.com>
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
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 45 +++++++++++++++++++--------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 1c636723823c..58d9bd708e95 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -157,12 +157,12 @@ static int
 nouveau_ttm_init_vram(struct nouveau_drm *drm)
 {
 	struct nvif_mmu *mmu = &drm->client.mmu;
-
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
-		struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
-
 		/* Some BARs do not support being ioremapped WC */
 		const u8 type = mmu->type[drm->ttm.type_vram].type;
+		struct ttm_mem_type_manager *man = kzalloc(sizeof(struct ttm_mem_type_manager), GFP_KERNEL);
+		if (!man)
+			return -ENOMEM;
 
 		man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
 		man->default_caching = TTM_PL_FLAG_WC;
@@ -174,8 +174,10 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 
 		man->func = &nouveau_vram_manager;
 		man->use_io_reserve_lru = true;
+
 		ttm_mem_type_manager_init(&drm->ttm.bdev, man,
 					  drm->gem.vram_available >> PAGE_SHIFT);
+		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, man);
 		ttm_mem_type_manager_set_used(man, true);
 		return 0;
 	} else {
@@ -195,6 +197,8 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
 		ttm_mem_type_manager_disable(man);
 		ttm_mem_type_manager_force_list_clean(&drm->ttm.bdev, man);
 		ttm_mem_type_manager_cleanup(man);
+		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, NULL);
+		kfree(man);
 	} else
 		ttm_range_man_fini(&drm->ttm.bdev, TTM_PL_VRAM);
 }
@@ -202,30 +206,43 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
 static int
 nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_TT);
+	struct ttm_mem_type_manager *man;
 	unsigned long size_pages = drm->gem.gart_available >> PAGE_SHIFT;
-	man->use_tt = true;
+	unsigned available_caching, default_caching;
+	const struct ttm_mem_type_manager_func *func = NULL;
 	if (drm->agp.bridge) {
-		man->available_caching = TTM_PL_FLAG_UNCACHED |
+		available_caching = TTM_PL_FLAG_UNCACHED |
 			TTM_PL_FLAG_WC;
-		man->default_caching = TTM_PL_FLAG_WC;
+		default_caching = TTM_PL_FLAG_WC;
 	} else {
-		man->available_caching = TTM_PL_MASK_CACHING;
-		man->default_caching = TTM_PL_FLAG_CACHED;
+		available_caching = TTM_PL_MASK_CACHING;
+		default_caching = TTM_PL_FLAG_CACHED;
 	}
 
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)
-		man->func = &nouveau_gart_manager;
+		func = &nouveau_gart_manager;
 	else if (!drm->agp.bridge)
-		man->func = &nv04_gart_manager;
+		func = &nv04_gart_manager;
 	else
 		return ttm_range_man_init(&drm->ttm.bdev, TTM_PL_TT,
-					  TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC,
-					  TTM_PL_FLAG_WC, true,
+					  available_caching, default_caching,
+					  true,
 					  size_pages);
+
+	man = kzalloc(sizeof(struct ttm_mem_type_manager), GFP_KERNEL);
+	if (!man)
+		return -ENOMEM;
+
+	man->func = func;
+	man->available_caching = available_caching;
+	man->default_caching = default_caching;
+	man->use_tt = true;
 	ttm_mem_type_manager_init(&drm->ttm.bdev, man,
 				  size_pages);
+
+	ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, man);
 	ttm_mem_type_manager_set_used(man, true);
+
 	return 0;
 }
 
@@ -241,6 +258,8 @@ nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
 		ttm_mem_type_manager_disable(man);
 		ttm_mem_type_manager_force_list_clean(&drm->ttm.bdev, man);
 		ttm_mem_type_manager_cleanup(man);
+		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, NULL);
+		kfree(man);
 	}
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
