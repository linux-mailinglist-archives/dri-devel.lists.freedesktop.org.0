Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E0C23E469
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 01:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5006E934;
	Thu,  6 Aug 2020 23:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4976E934
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 23:36:17 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-C4kE67q3P2i2WMzxwfBpQg-1; Thu, 06 Aug 2020 19:35:07 -0400
X-MC-Unique: C4kE67q3P2i2WMzxwfBpQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67ECE8015F3;
 Thu,  6 Aug 2020 23:35:06 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-227.bne.redhat.com
 [10.64.54.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E7145F9DC;
 Thu,  6 Aug 2020 23:35:03 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/amdgpu/ttm: move vram/gtt mgr allocations to mman.
Date: Fri,  7 Aug 2020 09:34:56 +1000
Message-Id: <20200806233459.4057784-2-airlied@gmail.com>
In-Reply-To: <20200806233459.4057784-1-airlied@gmail.com>
References: <20200806233459.4057784-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
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
Cc: bskeggs@redhat.com, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Christian suggested this and it makes sense.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 21 ++++-------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      | 19 ++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 24 ++++----------------
 3 files changed, 27 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index c847a5fe94c9..010518148ef8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -24,13 +24,6 @@
 
 #include "amdgpu.h"
 
-struct amdgpu_gtt_mgr {
-	struct ttm_resource_manager manager;
-	struct drm_mm mm;
-	spinlock_t lock;
-	atomic64_t available;
-};
-
 static inline struct amdgpu_gtt_mgr *to_gtt_mgr(struct ttm_resource_manager *man)
 {
 	return container_of(man, struct amdgpu_gtt_mgr, manager);
@@ -93,16 +86,11 @@ static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func;
  */
 int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 {
-	struct ttm_resource_manager *man;
-	struct amdgpu_gtt_mgr *mgr;
+	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
+	struct ttm_resource_manager *man = &mgr->manager;
 	uint64_t start, size;
 	int ret;
 
-	mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
-	if (!mgr)
-		return -ENOMEM;
-
-	man = &mgr->manager;
 	man->use_tt = true;
 	man->func = &amdgpu_gtt_mgr_func;
 	man->available_caching = TTM_PL_MASK_CACHING;
@@ -142,8 +130,8 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
  */
 void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
 {
-	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
-	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
+	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
+	struct ttm_resource_manager *man = &mgr->manager;
 	int ret;
 
 	ttm_resource_manager_set_used(man, false);
@@ -161,7 +149,6 @@ void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
 
 	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, NULL);
-	kfree(mgr);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 36b024fd077e..168294be276d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -41,6 +41,22 @@
 
 #define AMDGPU_POISON	0xd0bed0be
 
+struct amdgpu_vram_mgr {
+	struct ttm_resource_manager manager;
+	struct drm_mm mm;
+	spinlock_t lock;
+	atomic64_t usage;
+	atomic64_t vis_usage;
+	struct amdgpu_device *adev;
+};
+
+struct amdgpu_gtt_mgr {
+	struct ttm_resource_manager manager;
+	struct drm_mm mm;
+	spinlock_t lock;
+	atomic64_t available;
+};
+
 struct amdgpu_mman {
 	struct ttm_bo_device		bdev;
 	bool				mem_global_referenced;
@@ -59,6 +75,9 @@ struct amdgpu_mman {
 	struct mutex				gtt_window_lock;
 	/* Scheduler entity for buffer moves */
 	struct drm_sched_entity			entity;
+
+	struct amdgpu_vram_mgr vram_mgr;
+	struct amdgpu_gtt_mgr gtt_mgr;
 };
 
 struct amdgpu_copy_mem {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 895634cbf999..a41a8abc9927 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -28,15 +28,6 @@
 #include "amdgpu_atomfirmware.h"
 #include "atom.h"
 
-struct amdgpu_vram_mgr {
-	struct ttm_resource_manager manager;
-	struct drm_mm mm;
-	spinlock_t lock;
-	atomic64_t usage;
-	atomic64_t vis_usage;
-	struct amdgpu_device *adev;
-};
-
 static inline struct amdgpu_vram_mgr *to_vram_mgr(struct ttm_resource_manager *man)
 {
 	return container_of(man, struct amdgpu_vram_mgr, manager);
@@ -177,16 +168,10 @@ static const struct ttm_resource_manager_func amdgpu_vram_mgr_func;
  */
 int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 {
-	struct ttm_resource_manager *man;
-	struct amdgpu_vram_mgr *mgr;
+	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
+	struct ttm_resource_manager *man = &mgr->manager;
 	int ret;
 
-	mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
-	if (!mgr)
-		return -ENOMEM;
-
-	man = &mgr->manager;
-
 	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
 	man->default_caching = TTM_PL_FLAG_WC;
 
@@ -219,8 +204,8 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
  */
 void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 {
-	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
-	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
+	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
+	struct ttm_resource_manager *man = &mgr->manager;
 	int ret;
 
 	ttm_resource_manager_set_used(man, false);
@@ -237,7 +222,6 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 
 	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, NULL);
-	kfree(mgr);
 }
 
 /**
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
