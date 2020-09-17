Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E91226D2AA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 06:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCE86E08E;
	Thu, 17 Sep 2020 04:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3240C6E03A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 04:32:02 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-WR4m019mMUehm7AwjKCWrw-1; Thu, 17 Sep 2020 00:30:49 -0400
X-MC-Unique: WR4m019mMUehm7AwjKCWrw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4C1757051;
 Thu, 17 Sep 2020 04:30:48 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-25.bne.redhat.com
 [10.64.54.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE11C19D61;
 Thu, 17 Sep 2020 04:30:47 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] drm/ttm/drivers: call the bind function directly.
Date: Thu, 17 Sep 2020 14:30:37 +1000
Message-Id: <20200917043040.146575-5-airlied@gmail.com>
In-Reply-To: <20200917043040.146575-1-airlied@gmail.com>
References: <20200917043040.146575-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0.0
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Now the bind functions have all the protection explicitly the
drivers can just call them directly, and the api can be unexported

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 6 +++++-
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 5 ++++-
 drivers/gpu/drm/radeon/radeon_ttm.c     | 6 +++++-
 drivers/gpu/drm/ttm/ttm_bo.c            | 1 -
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 2028b9e4c25c..a57aaf666340 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -63,6 +63,10 @@
 
 #define AMDGPU_TTM_VRAM_MAX_DW_READ	(size_t)128
 
+static int amdgpu_ttm_backend_bind(struct ttm_bo_device *bdev,
+				   struct ttm_tt *ttm,
+				   struct ttm_resource *bo_mem);
+
 static int amdgpu_ttm_init_on_chip(struct amdgpu_device *adev,
 				    unsigned int type,
 				    uint64_t size)
@@ -552,7 +556,7 @@ static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
 		goto out_cleanup;
 
 	/* Bind the memory to the GTT space */
-	r = ttm_bo_tt_bind(bo, &tmp_mem);
+	r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, &tmp_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 4a020a3da3dd..56f974c28eb5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -44,6 +44,9 @@
 #include <nvif/if500b.h>
 #include <nvif/if900b.h>
 
+static int nouveau_ttm_tt_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm,
+			       struct ttm_resource *reg);
+
 /*
  * NV10-NV40 tiling helpers
  */
@@ -927,7 +930,7 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict, bool intr,
 	if (ret)
 		goto out;
 
-	ret = ttm_bo_tt_bind(bo, &tmp_reg);
+	ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_reg);
 	if (ret)
 		goto out;
 
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 03e5ae4e3bf6..99d9ca1087b7 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -56,6 +56,10 @@
 static int radeon_ttm_debugfs_init(struct radeon_device *rdev);
 static void radeon_ttm_debugfs_fini(struct radeon_device *rdev);
 
+static int radeon_ttm_tt_bind(struct ttm_bo_device *bdev,
+			      struct ttm_tt *ttm,
+			      struct ttm_resource *bo_mem);
+
 struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev)
 {
 	struct radeon_mman *mman;
@@ -238,7 +242,7 @@ static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 		goto out_cleanup;
 	}
 
-	r = ttm_bo_tt_bind(bo, &tmp_mem);
+	r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, &tmp_mem);
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 2c527cd20dfa..279a0e44a5ed 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1628,7 +1628,6 @@ int ttm_bo_tt_bind(struct ttm_buffer_object *bo, struct ttm_resource *mem)
 {
 	return bo->bdev->driver->ttm_tt_bind(bo->bdev, bo->ttm, mem);
 }
-EXPORT_SYMBOL(ttm_bo_tt_bind);
 
 void ttm_bo_tt_unbind(struct ttm_buffer_object *bo)
 {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
