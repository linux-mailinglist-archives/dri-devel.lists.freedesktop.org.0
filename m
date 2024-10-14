Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C1C99C5B7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 11:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1C110E3F9;
	Mon, 14 Oct 2024 09:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jVCXMdwf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9119910E3F9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 09:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1728898296;
 bh=hx1jddbjrri/Gmy1rR3QCq2ZIuTyWZjX4Jxoc+hv2BQ=;
 h=From:To:Cc:Subject:Date:From;
 b=jVCXMdwfr+VNAfE6cyLt2OiIByeu4xuyIb7cNc0Pa9D9jEENeREEkxaC6KtUTUvhO
 4RIMYbOA7mcYu8f83CySsdKD9T/i8YsmB4uhqcZPRwfEhb4ztayrlDQ4rbzqjoflp6
 JiI2DzEW9W7P2QRMFwbbodVytXkjjdfNXckjeenv0djmGXCkpkSWqB2P6YlfFDiXsX
 IBel+JpB5zPLtiwjPzzhuzYIVM3bzqWbdu+fFzak0QPrW8MvNqW5XcoQ2A8Ke+XX/w
 7bfvj+6thnqMT0l/2/uB0rTeXSe/+H1PWGnnn1hR/8duDga3yrm8HdZKBG22JSqiMe
 gUQ3KKh29I9zA==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0CD0F17E121B;
 Mon, 14 Oct 2024 11:31:36 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v2] drm/panthor: Fix firmware initialization on systems with a
 page size > 4k
Date: Mon, 14 Oct 2024 11:31:34 +0200
Message-ID: <20241014093134.464059-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The system and GPU MMU page size might differ, which becomes a
problem for FW sections that need to be mapped at explicit address
since our PAGE_SIZE alignment might cover a VA range that's
expected to be used for another section.

Make sure we never map more than we need.

Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Steve, Liviu, Adrian, I intentionally dropped the R-b because of
the panthor_vm_page_size() change. Feel free to add it back if
you're happy with the new version.
---
 drivers/gpu/drm/panthor/panthor_fw.c  |  4 ++--
 drivers/gpu/drm/panthor/panthor_gem.c | 11 ++++++++---
 drivers/gpu/drm/panthor/panthor_mmu.c | 16 +++++++++++++---
 drivers/gpu/drm/panthor/panthor_mmu.h |  1 +
 4 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index ef232c0c2049..4e2d3a02ea06 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -487,6 +487,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 					 struct panthor_fw_binary_iter *iter,
 					 u32 ehdr)
 {
+	ssize_t vm_pgsz = panthor_vm_page_size(ptdev->fw->vm);
 	struct panthor_fw_binary_section_entry_hdr hdr;
 	struct panthor_fw_section *section;
 	u32 section_size;
@@ -515,8 +516,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 		return -EINVAL;
 	}
 
-	if ((hdr.va.start & ~PAGE_MASK) != 0 ||
-	    (hdr.va.end & ~PAGE_MASK) != 0) {
+	if (!IS_ALIGNED(hdr.va.start, vm_pgsz) || !IS_ALIGNED(hdr.va.end, vm_pgsz)) {
 		drm_err(&ptdev->base, "Firmware corrupted, virtual addresses not page aligned: 0x%x-0x%x\n",
 			hdr.va.start, hdr.va.end);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index c60b599665d8..8244a4e6c2a2 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -44,8 +44,7 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
 			to_panthor_bo(bo->obj)->exclusive_vm_root_gem != panthor_vm_root_gem(vm)))
 		goto out_free_bo;
 
-	ret = panthor_vm_unmap_range(vm, bo->va_node.start,
-				     panthor_kernel_bo_size(bo));
+	ret = panthor_vm_unmap_range(vm, bo->va_node.start, bo->va_node.size);
 	if (ret)
 		goto out_free_bo;
 
@@ -95,10 +94,16 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	}
 
 	bo = to_panthor_bo(&obj->base);
-	size = obj->base.size;
 	kbo->obj = &obj->base;
 	bo->flags = bo_flags;
 
+	/* The system and GPU MMU page size might differ, which becomes a
+	 * problem for FW sections that need to be mapped at explicit address
+	 * since our PAGE_SIZE alignment might cover a VA range that's
+	 * expected to be used for another section.
+	 * Make sure we never map more than we need.
+	 */
+	size = ALIGN(size, panthor_vm_page_size(vm));
 	ret = panthor_vm_alloc_va(vm, gpu_va, size, &kbo->va_node);
 	if (ret)
 		goto err_put_obj;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 3cd2bce59edc..f009501e4c68 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -826,6 +826,14 @@ void panthor_vm_idle(struct panthor_vm *vm)
 	mutex_unlock(&ptdev->mmu->as.slots_lock);
 }
 
+u32 panthor_vm_page_size(struct panthor_vm *vm)
+{
+	const struct io_pgtable *pgt = container_of(vm->pgtbl_ops, struct io_pgtable, ops);
+	u32 pg_shift = ffs(pgt->cfg.pgsize_bitmap) - 1;
+
+	return 1u << pg_shift;
+}
+
 static void panthor_vm_stop(struct panthor_vm *vm)
 {
 	drm_sched_stop(&vm->sched, NULL);
@@ -1025,12 +1033,13 @@ int
 panthor_vm_alloc_va(struct panthor_vm *vm, u64 va, u64 size,
 		    struct drm_mm_node *va_node)
 {
+	ssize_t vm_pgsz = panthor_vm_page_size(vm);
 	int ret;
 
-	if (!size || (size & ~PAGE_MASK))
+	if (!size || !IS_ALIGNED(size, vm_pgsz))
 		return -EINVAL;
 
-	if (va != PANTHOR_VM_KERNEL_AUTO_VA && (va & ~PAGE_MASK))
+	if (va != PANTHOR_VM_KERNEL_AUTO_VA && !IS_ALIGNED(va, vm_pgsz))
 		return -EINVAL;
 
 	mutex_lock(&vm->mm_lock);
@@ -2366,11 +2375,12 @@ panthor_vm_bind_prepare_op_ctx(struct drm_file *file,
 			       const struct drm_panthor_vm_bind_op *op,
 			       struct panthor_vm_op_ctx *op_ctx)
 {
+	ssize_t vm_pgsz = panthor_vm_page_size(vm);
 	struct drm_gem_object *gem;
 	int ret;
 
 	/* Aligned on page size. */
-	if ((op->va | op->size) & ~PAGE_MASK)
+	if (!IS_ALIGNED(op->va | op->size, vm_pgsz))
 		return -EINVAL;
 
 	switch (op->flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) {
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index 6788771071e3..8d21e83d8aba 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -30,6 +30,7 @@ panthor_vm_get_bo_for_va(struct panthor_vm *vm, u64 va, u64 *bo_offset);
 
 int panthor_vm_active(struct panthor_vm *vm);
 void panthor_vm_idle(struct panthor_vm *vm);
+u32 panthor_vm_page_size(struct panthor_vm *vm);
 int panthor_vm_as(struct panthor_vm *vm);
 int panthor_vm_flush_all(struct panthor_vm *vm);
 
-- 
2.46.2

