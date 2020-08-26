Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E229225251A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29F86E9DB;
	Wed, 26 Aug 2020 01:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4D46E9DC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:44:54 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-craaof6aPjCaBSV0GFMtmA-1; Tue, 25 Aug 2020 21:44:51 -0400
X-MC-Unique: craaof6aPjCaBSV0GFMtmA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A9D61074640;
 Wed, 26 Aug 2020 01:44:50 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DACE60C13;
 Wed, 26 Aug 2020 01:44:48 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/23] drm/radeon/ttm: move to driver binding/destroy
 functions.
Date: Wed, 26 Aug 2020 11:44:12 +1000
Message-Id: <20200826014428.828392-8-airlied@gmail.com>
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

Do agp decision in the driver, instead of special binding funcs

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/radeon/radeon.h        |  7 +-
 drivers/gpu/drm/radeon/radeon_cs.c     |  2 +-
 drivers/gpu/drm/radeon/radeon_gem.c    |  6 +-
 drivers/gpu/drm/radeon/radeon_object.c |  2 +-
 drivers/gpu/drm/radeon/radeon_prime.c  |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c    | 92 ++++++++++++++++++++------
 drivers/gpu/drm/radeon/radeon_vm.c     |  2 +-
 7 files changed, 81 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index cc4f58d16589..df6f0b49836b 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -2815,10 +2815,11 @@ extern void radeon_legacy_set_clock_gating(struct radeon_device *rdev, int enabl
 extern void radeon_atom_set_clock_gating(struct radeon_device *rdev, int enable);
 extern void radeon_ttm_placement_from_domain(struct radeon_bo *rbo, u32 domain);
 extern bool radeon_ttm_bo_is_radeon_bo(struct ttm_buffer_object *bo);
-extern int radeon_ttm_tt_set_userptr(struct ttm_tt *ttm, uint64_t addr,
+extern int radeon_ttm_tt_set_userptr(struct radeon_device *rdev,
+				     struct ttm_tt *ttm, uint64_t addr,
 				     uint32_t flags);
-extern bool radeon_ttm_tt_has_userptr(struct ttm_tt *ttm);
-extern bool radeon_ttm_tt_is_readonly(struct ttm_tt *ttm);
+extern bool radeon_ttm_tt_has_userptr(struct radeon_device *rdev, struct ttm_tt *ttm);
+extern bool radeon_ttm_tt_is_readonly(struct radeon_device *rdev, struct ttm_tt *ttm);
 extern void radeon_vram_location(struct radeon_device *rdev, struct radeon_mc *mc, u64 base);
 extern void radeon_gtt_location(struct radeon_device *rdev, struct radeon_mc *mc);
 extern int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon);
diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 33ae1b883268..21ce2f9502c0 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -160,7 +160,7 @@ static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
 			p->relocs[i].allowed_domains = domain;
 		}
 
-		if (radeon_ttm_tt_has_userptr(p->relocs[i].robj->tbo.ttm)) {
+		if (radeon_ttm_tt_has_userptr(p->rdev, p->relocs[i].robj->tbo.ttm)) {
 			uint32_t domain = p->relocs[i].preferred_domains;
 			if (!(domain & RADEON_GEM_DOMAIN_GTT)) {
 				DRM_ERROR("Only RADEON_GEM_DOMAIN_GTT is "
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 7f5dfe04789e..e5c4271e64ed 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -331,7 +331,7 @@ int radeon_gem_userptr_ioctl(struct drm_device *dev, void *data,
 		goto handle_lockup;
 
 	bo = gem_to_radeon_bo(gobj);
-	r = radeon_ttm_tt_set_userptr(bo->tbo.ttm, args->addr, args->flags);
+	r = radeon_ttm_tt_set_userptr(rdev, bo->tbo.ttm, args->addr, args->flags);
 	if (r)
 		goto release_object;
 
@@ -420,7 +420,7 @@ int radeon_mode_dumb_mmap(struct drm_file *filp,
 		return -ENOENT;
 	}
 	robj = gem_to_radeon_bo(gobj);
-	if (radeon_ttm_tt_has_userptr(robj->tbo.ttm)) {
+	if (radeon_ttm_tt_has_userptr(robj->rdev, robj->tbo.ttm)) {
 		drm_gem_object_put(gobj);
 		return -EPERM;
 	}
@@ -721,7 +721,7 @@ int radeon_gem_op_ioctl(struct drm_device *dev, void *data,
 	robj = gem_to_radeon_bo(gobj);
 
 	r = -EPERM;
-	if (radeon_ttm_tt_has_userptr(robj->tbo.ttm))
+	if (radeon_ttm_tt_has_userptr(robj->rdev, robj->tbo.ttm))
 		goto out;
 
 	r = radeon_bo_reserve(robj, false);
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index bb7582afd803..3fcd15d21ddc 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -331,7 +331,7 @@ int radeon_bo_pin_restricted(struct radeon_bo *bo, u32 domain, u64 max_offset,
 	struct ttm_operation_ctx ctx = { false, false };
 	int r, i;
 
-	if (radeon_ttm_tt_has_userptr(bo->tbo.ttm))
+	if (radeon_ttm_tt_has_userptr(bo->rdev, bo->tbo.ttm))
 		return -EPERM;
 
 	if (bo->pin_count) {
diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
index b906e8fbd5f3..d6d9c8b46ab4 100644
--- a/drivers/gpu/drm/radeon/radeon_prime.c
+++ b/drivers/gpu/drm/radeon/radeon_prime.c
@@ -121,7 +121,7 @@ struct dma_buf *radeon_gem_prime_export(struct drm_gem_object *gobj,
 					int flags)
 {
 	struct radeon_bo *bo = gem_to_radeon_bo(gobj);
-	if (radeon_ttm_tt_has_userptr(bo->tbo.ttm))
+	if (radeon_ttm_tt_has_userptr(bo->rdev, bo->tbo.ttm))
 		return ERR_PTR(-EPERM);
 	return drm_gem_prime_export(gobj, flags);
 }
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 1d3e8bb69f8e..af5479ea154c 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -141,8 +141,9 @@ static void radeon_evict_flags(struct ttm_buffer_object *bo,
 static int radeon_verify_access(struct ttm_buffer_object *bo, struct file *filp)
 {
 	struct radeon_bo *rbo = container_of(bo, struct radeon_bo, tbo);
+	struct radeon_device *rdev = radeon_get_rdev(bo->bdev);
 
-	if (radeon_ttm_tt_has_userptr(bo->ttm))
+	if (radeon_ttm_tt_has_userptr(rdev, bo->ttm))
 		return -EPERM;
 	return drm_vma_node_verify_access(&rbo->tbo.base.vma_node,
 					  filp->private_data);
@@ -561,12 +562,6 @@ static void radeon_ttm_backend_destroy(struct ttm_bo_device *bdev, struct ttm_tt
 	kfree(gtt);
 }
 
-static struct ttm_backend_func radeon_backend_func = {
-	.bind = &radeon_ttm_backend_bind,
-	.unbind = &radeon_ttm_backend_unbind,
-	.destroy = &radeon_ttm_backend_destroy,
-};
-
 static struct ttm_tt *radeon_ttm_tt_create(struct ttm_buffer_object *bo,
 					   uint32_t page_flags)
 {
@@ -585,7 +580,6 @@ static struct ttm_tt *radeon_ttm_tt_create(struct ttm_buffer_object *bo,
 	if (gtt == NULL) {
 		return NULL;
 	}
-	gtt->ttm.ttm.func = &radeon_backend_func;
 	if (ttm_dma_tt_init(&gtt->ttm, bo, page_flags)) {
 		kfree(gtt);
 		return NULL;
@@ -593,9 +587,16 @@ static struct ttm_tt *radeon_ttm_tt_create(struct ttm_buffer_object *bo,
 	return &gtt->ttm.ttm;
 }
 
-static struct radeon_ttm_tt *radeon_ttm_tt_to_gtt(struct ttm_tt *ttm)
+static struct radeon_ttm_tt *radeon_ttm_tt_to_gtt(struct radeon_device *rdev,
+						  struct ttm_tt *ttm)
 {
-	if (!ttm || ttm->func != &radeon_backend_func)
+#if IS_ENABLED(CONFIG_AGP)
+	if (rdev->flags & RADEON_IS_AGP) {
+		return NULL;
+	}
+#endif
+
+	if (!ttm)
 		return NULL;
 	return (struct radeon_ttm_tt *)ttm;
 }
@@ -604,8 +605,8 @@ static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
 				  struct ttm_tt *ttm,
 				  struct ttm_operation_ctx *ctx)
 {
-	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(ttm);
-	struct radeon_device *rdev;
+	struct radeon_device *rdev = radeon_get_rdev(bdev);
+	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(rdev, ttm);
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (gtt && gtt->userptr) {
@@ -625,7 +626,6 @@ static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
 		return 0;
 	}
 
-	rdev = radeon_get_rdev(bdev);
 #if IS_ENABLED(CONFIG_AGP)
 	if (rdev->flags & RADEON_IS_AGP) {
 		return ttm_agp_tt_populate(bdev, ttm, ctx);
@@ -643,8 +643,8 @@ static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
 
 static void radeon_ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
-	struct radeon_device *rdev;
-	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(ttm);
+	struct radeon_device *rdev = radeon_get_rdev(bdev);
+	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(rdev, ttm);
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (gtt && gtt->userptr) {
@@ -656,7 +656,6 @@ static void radeon_ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *
 	if (slave)
 		return;
 
-	rdev = radeon_get_rdev(bdev);
 #if IS_ENABLED(CONFIG_AGP)
 	if (rdev->flags & RADEON_IS_AGP) {
 		ttm_agp_tt_unpopulate(bdev, ttm);
@@ -674,10 +673,11 @@ static void radeon_ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *
 	ttm_unmap_and_unpopulate_pages(rdev->dev, &gtt->ttm);
 }
 
-int radeon_ttm_tt_set_userptr(struct ttm_tt *ttm, uint64_t addr,
+int radeon_ttm_tt_set_userptr(struct radeon_device *rdev,
+			      struct ttm_tt *ttm, uint64_t addr,
 			      uint32_t flags)
 {
-	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(ttm);
+	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(rdev, ttm);
 
 	if (gtt == NULL)
 		return -EINVAL;
@@ -688,9 +688,53 @@ int radeon_ttm_tt_set_userptr(struct ttm_tt *ttm, uint64_t addr,
 	return 0;
 }
 
-bool radeon_ttm_tt_has_userptr(struct ttm_tt *ttm)
+static int radeon_ttm_tt_bind(struct ttm_bo_device *bdev,
+			      struct ttm_tt *ttm,
+			      struct ttm_resource *bo_mem)
+{
+	struct radeon_device *rdev = radeon_get_rdev(bdev);
+
+#if IS_ENABLED(CONFIG_AGP)
+	if (rdev->flags & RADEON_IS_AGP) {
+		return ttm_agp_bind(bdev, ttm, bo_mem);
+	}
+#endif
+
+	return radeon_ttm_backend_bind(bdev, ttm, bo_mem);
+}
+
+static void radeon_ttm_tt_unbind(struct ttm_bo_device *bdev,
+				 struct ttm_tt *ttm)
+{
+#if IS_ENABLED(CONFIG_AGP)
+	struct radeon_device *rdev = radeon_get_rdev(bdev);
+
+	if (rdev->flags & RADEON_IS_AGP) {
+		ttm_agp_unbind(bdev, ttm);
+		return;
+	}
+#endif
+	radeon_ttm_backend_unbind(bdev, ttm);
+}
+
+static void radeon_ttm_tt_destroy(struct ttm_bo_device *bdev,
+				  struct ttm_tt *ttm)
+{
+#if IS_ENABLED(CONFIG_AGP)
+	struct radeon_device *rdev = radeon_get_rdev(bdev);
+
+	if (rdev->flags & RADEON_IS_AGP) {
+		ttm_agp_destroy(bdev, ttm);
+		return;
+	}
+#endif
+	radeon_ttm_backend_destroy(bdev, ttm);
+}
+
+bool radeon_ttm_tt_has_userptr(struct radeon_device *rdev,
+			       struct ttm_tt *ttm)
 {
-	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(ttm);
+	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(rdev, ttm);
 
 	if (gtt == NULL)
 		return false;
@@ -698,9 +742,10 @@ bool radeon_ttm_tt_has_userptr(struct ttm_tt *ttm)
 	return !!gtt->userptr;
 }
 
-bool radeon_ttm_tt_is_readonly(struct ttm_tt *ttm)
+bool radeon_ttm_tt_is_readonly(struct radeon_device *rdev,
+			       struct ttm_tt *ttm)
 {
-	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(ttm);
+	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(rdev, ttm);
 
 	if (gtt == NULL)
 		return false;
@@ -712,6 +757,9 @@ static struct ttm_bo_driver radeon_bo_driver = {
 	.ttm_tt_create = &radeon_ttm_tt_create,
 	.ttm_tt_populate = &radeon_ttm_tt_populate,
 	.ttm_tt_unpopulate = &radeon_ttm_tt_unpopulate,
+	.ttm_tt_bind = &radeon_ttm_tt_bind,
+	.ttm_tt_unbind = &radeon_ttm_tt_unbind,
+	.ttm_tt_destroy = &radeon_ttm_tt_destroy,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = &radeon_evict_flags,
 	.move = &radeon_bo_move,
diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index 71e2c3785ab9..ebad27c91a0d 100644
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -942,7 +942,7 @@ int radeon_vm_bo_update(struct radeon_device *rdev,
 	bo_va->flags &= ~RADEON_VM_PAGE_VALID;
 	bo_va->flags &= ~RADEON_VM_PAGE_SYSTEM;
 	bo_va->flags &= ~RADEON_VM_PAGE_SNOOPED;
-	if (bo_va->bo && radeon_ttm_tt_is_readonly(bo_va->bo->tbo.ttm))
+	if (bo_va->bo && radeon_ttm_tt_is_readonly(rdev, bo_va->bo->tbo.ttm))
 		bo_va->flags &= ~RADEON_VM_PAGE_WRITEABLE;
 
 	if (mem) {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
