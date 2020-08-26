Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C3B252521
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595B76E9E3;
	Wed, 26 Aug 2020 01:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADBA6E9E3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:45:18 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-UqexzEKnMTmg3Z7c8VVsVg-1; Tue, 25 Aug 2020 21:45:13 -0400
X-MC-Unique: UqexzEKnMTmg3Z7c8VVsVg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E2F4189E606;
 Wed, 26 Aug 2020 01:45:12 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD7B060C13;
 Wed, 26 Aug 2020 01:45:07 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 14/23] drm/ttm/agp: remove bdev from agp helpers
Date: Wed, 26 Aug 2020 11:44:19 +1000
Message-Id: <20200826014428.828392-15-airlied@gmail.com>
In-Reply-To: <20200826014428.828392-1-airlied@gmail.com>
References: <20200826014428.828392-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0.001
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
Cc: kraxel@redhat.com, sroland@vmware.com, bskeggs@redhat.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Since the agp bind/unbind/destroy are now getting called from drivers
rather than via the func table, drop the bdev parameter.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c  |  6 +++---
 drivers/gpu/drm/radeon/radeon_ttm.c   |  6 +++---
 drivers/gpu/drm/ttm/ttm_agp_backend.c | 11 ++++-------
 include/drm/ttm/ttm_tt.h              |  9 +++------
 4 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 08499e1a56c2..0a8c092e0f2e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -676,7 +676,7 @@ nouveau_ttm_tt_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm,
 	struct nouveau_drm *drm = nouveau_bdev(bdev);
 
 	if (drm->agp.bridge) {
-		return ttm_agp_bind(bdev, ttm, reg);
+		return ttm_agp_bind(ttm, reg);
 	}
 #endif
 	return nouveau_sgdma_bind(bdev, ttm, reg);
@@ -689,7 +689,7 @@ nouveau_ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 	struct nouveau_drm *drm = nouveau_bdev(bdev);
 
 	if (drm->agp.bridge) {
-		ttm_agp_unbind(bdev, ttm);
+		ttm_agp_unbind(ttm);
 		return;
 	}
 #endif
@@ -1331,7 +1331,7 @@ nouveau_ttm_tt_destroy(struct ttm_bo_device *bdev,
 #if IS_ENABLED(CONFIG_AGP)
 	struct nouveau_drm *drm = nouveau_bdev(bdev);
 	if (drm->agp.bridge) {
-		ttm_agp_destroy(bdev, ttm);
+		ttm_agp_destroy(ttm);
 		return;
 	}
 #endif
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index eacfc591bf79..6b7af313389d 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -696,7 +696,7 @@ static int radeon_ttm_tt_bind(struct ttm_bo_device *bdev,
 
 #if IS_ENABLED(CONFIG_AGP)
 	if (rdev->flags & RADEON_IS_AGP) {
-		return ttm_agp_bind(bdev, ttm, bo_mem);
+		return ttm_agp_bind(ttm, bo_mem);
 	}
 #endif
 
@@ -710,7 +710,7 @@ static void radeon_ttm_tt_unbind(struct ttm_bo_device *bdev,
 	struct radeon_device *rdev = radeon_get_rdev(bdev);
 
 	if (rdev->flags & RADEON_IS_AGP) {
-		ttm_agp_unbind(bdev, ttm);
+		ttm_agp_unbind(ttm);
 		return;
 	}
 #endif
@@ -724,7 +724,7 @@ static void radeon_ttm_tt_destroy(struct ttm_bo_device *bdev,
 	struct radeon_device *rdev = radeon_get_rdev(bdev);
 
 	if (rdev->flags & RADEON_IS_AGP) {
-		ttm_agp_destroy(bdev, ttm);
+		ttm_agp_destroy(ttm);
 		return;
 	}
 #endif
diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/ttm_agp_backend.c
index 3d0a5e9f4c5f..7b36fdaab766 100644
--- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
+++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
@@ -48,8 +48,7 @@ struct ttm_agp_backend {
 	struct agp_bridge_data *bridge;
 };
 
-int ttm_agp_bind(struct ttm_bo_device *bdev,
-		 struct ttm_tt *ttm, struct ttm_resource *bo_mem)
+int ttm_agp_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem)
 {
 	struct ttm_agp_backend *agp_be = container_of(ttm, struct ttm_agp_backend, ttm);
 	struct page *dummy_read_page = ttm_bo_glob.dummy_read_page;
@@ -84,8 +83,7 @@ int ttm_agp_bind(struct ttm_bo_device *bdev,
 }
 EXPORT_SYMBOL(ttm_agp_bind);
 
-void ttm_agp_unbind(struct ttm_bo_device *bdev,
-		    struct ttm_tt *ttm)
+void ttm_agp_unbind(struct ttm_tt *ttm)
 {
 	struct ttm_agp_backend *agp_be = container_of(ttm, struct ttm_agp_backend, ttm);
 
@@ -100,13 +98,12 @@ void ttm_agp_unbind(struct ttm_bo_device *bdev,
 }
 EXPORT_SYMBOL(ttm_agp_unbind);
 
-void ttm_agp_destroy(struct ttm_bo_device *bdev,
-		     struct ttm_tt *ttm)
+void ttm_agp_destroy(struct ttm_tt *ttm)
 {
 	struct ttm_agp_backend *agp_be = container_of(ttm, struct ttm_agp_backend, ttm);
 
 	if (agp_be->mem)
-		ttm_agp_unbind(bdev, ttm);
+		ttm_agp_unbind(ttm);
 	ttm_tt_fini(ttm);
 	kfree(agp_be);
 }
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 591d4927d501..bdc8aadf3246 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -264,12 +264,9 @@ void ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 struct ttm_tt *ttm_agp_tt_create(struct ttm_buffer_object *bo,
 				 struct agp_bridge_data *bridge,
 				 uint32_t page_flags);
-int ttm_agp_bind(struct ttm_bo_device *bdev,
-		 struct ttm_tt *ttm, struct ttm_resource *bo_mem);
-void ttm_agp_unbind(struct ttm_bo_device *bdev,
-		    struct ttm_tt *ttm);
-void ttm_agp_destroy(struct ttm_bo_device *bdev,
-		     struct ttm_tt *ttm);
+int ttm_agp_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem);
+void ttm_agp_unbind(struct ttm_tt *ttm);
+void ttm_agp_destroy(struct ttm_tt *ttm);
 #endif
 
 #endif
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
