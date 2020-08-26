Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2184825252A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335A76E9E6;
	Wed, 26 Aug 2020 01:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0226E9EB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:46:17 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-0w9yDUd1P_qe9nBbPEHRJg-1; Tue, 25 Aug 2020 21:45:08 -0400
X-MC-Unique: 0w9yDUd1P_qe9nBbPEHRJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FFBE189E606;
 Wed, 26 Aug 2020 01:45:07 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CFD56E70C;
 Wed, 26 Aug 2020 01:45:02 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/23] drm/ttm: get rid of agp specific populate/unpopulate
 paths.
Date: Wed, 26 Aug 2020 11:44:18 +1000
Message-Id: <20200826014428.828392-14-airlied@gmail.com>
In-Reply-To: <20200826014428.828392-1-airlied@gmail.com>
References: <20200826014428.828392-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0.002
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

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c  |  4 ++--
 drivers/gpu/drm/radeon/radeon_ttm.c   |  4 ++--
 drivers/gpu/drm/ttm/ttm_agp_backend.c | 17 -----------------
 include/drm/ttm/ttm_tt.h              |  2 --
 4 files changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index f16401feb965..08499e1a56c2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1280,7 +1280,7 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
 
 #if IS_ENABLED(CONFIG_AGP)
 	if (drm->agp.bridge) {
-		return ttm_agp_tt_populate(bdev, ttm, ctx);
+		return ttm_pool_populate(ttm, ctx);
 	}
 #endif
 
@@ -1309,7 +1309,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_bo_device *bdev,
 
 #if IS_ENABLED(CONFIG_AGP)
 	if (drm->agp.bridge) {
-		ttm_agp_tt_unpopulate(bdev, ttm);
+		ttm_pool_unpopulate(ttm);
 		return;
 	}
 #endif
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index af5479ea154c..eacfc591bf79 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -628,7 +628,7 @@ static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
 
 #if IS_ENABLED(CONFIG_AGP)
 	if (rdev->flags & RADEON_IS_AGP) {
-		return ttm_agp_tt_populate(bdev, ttm, ctx);
+		return ttm_pool_populate(ttm, ctx);
 	}
 #endif
 
@@ -658,7 +658,7 @@ static void radeon_ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *
 
 #if IS_ENABLED(CONFIG_AGP)
 	if (rdev->flags & RADEON_IS_AGP) {
-		ttm_agp_tt_unpopulate(bdev, ttm);
+		ttm_pool_unpopulate(ttm);
 		return;
 	}
 #endif
diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/ttm_agp_backend.c
index 8072fb7c5bc8..3d0a5e9f4c5f 100644
--- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
+++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
@@ -133,20 +133,3 @@ struct ttm_tt *ttm_agp_tt_create(struct ttm_buffer_object *bo,
 	return &agp_be->ttm;
 }
 EXPORT_SYMBOL(ttm_agp_tt_create);
-
-int ttm_agp_tt_populate(struct ttm_bo_device *bdev,
-			struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
-{
-	if (ttm->state != tt_unpopulated)
-		return 0;
-
-	return ttm_pool_populate(ttm, ctx);
-}
-EXPORT_SYMBOL(ttm_agp_tt_populate);
-
-void ttm_agp_tt_unpopulate(struct ttm_bo_device *bdev,
-			   struct ttm_tt *ttm)
-{
-	ttm_pool_unpopulate(ttm);
-}
-EXPORT_SYMBOL(ttm_agp_tt_unpopulate);
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 5a34f1640865..591d4927d501 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -264,8 +264,6 @@ void ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 struct ttm_tt *ttm_agp_tt_create(struct ttm_buffer_object *bo,
 				 struct agp_bridge_data *bridge,
 				 uint32_t page_flags);
-int ttm_agp_tt_populate(struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct ttm_operation_ctx *ctx);
-void ttm_agp_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 int ttm_agp_bind(struct ttm_bo_device *bdev,
 		 struct ttm_tt *ttm, struct ttm_resource *bo_mem);
 void ttm_agp_unbind(struct ttm_bo_device *bdev,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
