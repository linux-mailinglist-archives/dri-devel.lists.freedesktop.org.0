Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB4C25254D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BF16E9EF;
	Wed, 26 Aug 2020 01:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CBD6E9EF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:51:51 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-WPD6IiwQP5CVD_5yKG8aHg-1; Tue, 25 Aug 2020 21:45:32 -0400
X-MC-Unique: WPD6IiwQP5CVD_5yKG8aHg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AD711074640;
 Wed, 26 Aug 2020 01:45:31 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D304960FC2;
 Wed, 26 Aug 2020 01:45:29 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 23/23] drm/ttm: change ordering of args to map/unmap helpers.
Date: Wed, 26 Aug 2020 11:44:28 +1000
Message-Id: <20200826014428.828392-24-airlied@gmail.com>
In-Reply-To: <20200826014428.828392-1-airlied@gmail.com>
References: <20200826014428.828392-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0.003
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

These tooks the same args in a different order to the dma
ones, just make things look nicer.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 4 ++--
 drivers/gpu/drm/radeon/radeon_ttm.c     | 4 ++--
 drivers/gpu/drm/ttm/ttm_page_alloc.c    | 8 +++++---
 include/drm/ttm/ttm_page_alloc.h        | 8 +++++---
 5 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 9eb243ff2ba6..c03093828112 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1339,7 +1339,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
 
 	/* fall back to generic helper to populate the page array
 	 * and map them to the device */
-	return ttm_populate_and_map_pages(adev->dev, &gtt->ttm, ctx);
+	return ttm_populate_and_map_pages(&gtt->ttm, adev->dev, ctx);
 }
 
 /**
@@ -1382,7 +1382,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *
 #endif
 
 	/* fall back to generic helper to unmap and unpopulate array */
-	ttm_unmap_and_unpopulate_pages(adev->dev, &gtt->ttm);
+	ttm_unmap_and_unpopulate_pages(&gtt->ttm, adev->dev);
 }
 
 /**
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 644f15412dce..9988c7572e77 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1294,7 +1294,7 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
 		return ttm_dma_populate((void *)ttm, dev, ctx);
 	}
 #endif
-	return ttm_populate_and_map_pages(dev, ttm_dma, ctx);
+	return ttm_populate_and_map_pages(ttm_dma, dev, ctx);
 }
 
 static void
@@ -1326,7 +1326,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_bo_device *bdev,
 	}
 #endif
 
-	ttm_unmap_and_unpopulate_pages(dev, ttm_dma);
+	ttm_unmap_and_unpopulate_pages(ttm_dma, dev);
 }
 
 static void
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index c9f7fc112a84..8e3f3da08bff 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -644,7 +644,7 @@ static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
 	}
 #endif
 
-	return ttm_populate_and_map_pages(rdev->dev, &gtt->ttm, ctx);
+	return ttm_populate_and_map_pages(&gtt->ttm, rdev->dev, ctx);
 }
 
 static void radeon_ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
@@ -676,7 +676,7 @@ static void radeon_ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *
 	}
 #endif
 
-	ttm_unmap_and_unpopulate_pages(rdev->dev, &gtt->ttm);
+	ttm_unmap_and_unpopulate_pages(&gtt->ttm, rdev->dev);
 }
 
 int radeon_ttm_tt_set_userptr(struct radeon_device *rdev,
diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
index 028ba94d7824..726ea4893a20 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
@@ -1094,8 +1094,9 @@ void ttm_pool_unpopulate(struct ttm_tt *ttm)
 }
 EXPORT_SYMBOL(ttm_pool_unpopulate);
 
-int ttm_populate_and_map_pages(struct device *dev, struct ttm_dma_tt *tt,
-					struct ttm_operation_ctx *ctx)
+int ttm_populate_and_map_pages(struct ttm_dma_tt *tt,
+			       struct device *dev,
+			       struct ttm_operation_ctx *ctx)
 {
 	unsigned i, j;
 	int r;
@@ -1137,7 +1138,8 @@ int ttm_populate_and_map_pages(struct device *dev, struct ttm_dma_tt *tt,
 }
 EXPORT_SYMBOL(ttm_populate_and_map_pages);
 
-void ttm_unmap_and_unpopulate_pages(struct device *dev, struct ttm_dma_tt *tt)
+void ttm_unmap_and_unpopulate_pages(struct ttm_dma_tt *tt,
+				    struct device *dev)
 {
 	unsigned i, j;
 
diff --git a/include/drm/ttm/ttm_page_alloc.h b/include/drm/ttm/ttm_page_alloc.h
index a6b6ef5f9bf4..b786ce75920b 100644
--- a/include/drm/ttm/ttm_page_alloc.h
+++ b/include/drm/ttm/ttm_page_alloc.h
@@ -61,13 +61,15 @@ void ttm_pool_unpopulate(struct ttm_tt *ttm);
 /**
  * Populates and DMA maps pages to fullfil a ttm_dma_populate() request
  */
-int ttm_populate_and_map_pages(struct device *dev, struct ttm_dma_tt *tt,
-				struct ttm_operation_ctx *ctx);
+int ttm_populate_and_map_pages(struct ttm_dma_tt *tt,
+			       struct device *dev,
+			       struct ttm_operation_ctx *ctx);
 
 /**
  * Unpopulates and DMA unmaps pages as part of a
  * ttm_dma_unpopulate() request */
-void ttm_unmap_and_unpopulate_pages(struct device *dev, struct ttm_dma_tt *tt);
+void ttm_unmap_and_unpopulate_pages(struct ttm_dma_tt *tt,
+				    struct device *dev);
 
 /**
  * Output the state of pools to debugfs file
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
