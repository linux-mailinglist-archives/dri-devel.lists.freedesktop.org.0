Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0D9994291
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 10:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DA710E4AC;
	Tue,  8 Oct 2024 08:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YxEUULnA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F71710E4AC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 08:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1728377267;
 bh=Va0aqT+E1vi342Q7jsgnxvMab8hTm9fsbWLKZBmSKkg=;
 h=From:To:Cc:Subject:Date:From;
 b=YxEUULnASa3XZk7bOdsY0kkEQSiJtwAD4wQfLdqtetjHlO1qK3L2sVsOR4JPGbSJn
 9dd2pxCWRfgFJ7b5M25A0CuToiNv4a6QL6g7JlYtDlYid3xLW49Ml4w/AiBD01pJF7
 ZYajxd7P3YYjMfY2BYs+HshWJw437YR1Uy9dwdm+5KcI8+QAjE5G7P0DNUhE3O7S4T
 qNrB6YzD4soX4CxvG2Q3XJHKIxd5arAOIJGCEzBDyPmFl2nV4dtxpXhRao/hl7lsz/
 lrXGoJkl/YOwOmH5trdZEr7HDgFe+Y4VrZlla+L4plqziJ4nz/aYle5TO3OU6O3X6n
 l9tcNgvC3Lmiw==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D259C17E10AF;
 Tue,  8 Oct 2024 10:47:46 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH] drm/panthor: Fix firmware initialization on systems with a
 page size > 4k
Date: Tue,  8 Oct 2024 10:47:43 +0200
Message-ID: <20241008084744.82688-1-boris.brezillon@collabora.com>
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
 drivers/gpu/drm/panthor/panthor_fw.c  |  3 +--
 drivers/gpu/drm/panthor/panthor_gem.c | 11 ++++++++---
 drivers/gpu/drm/panthor/panthor_mmu.c |  6 +++---
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index ef232c0c2049..293846400296 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -515,8 +515,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 		return -EINVAL;
 	}
 
-	if ((hdr.va.start & ~PAGE_MASK) != 0 ||
-	    (hdr.va.end & ~PAGE_MASK) != 0) {
+	if (!IS_ALIGNED(hdr.va.start, SZ_4K) || !IS_ALIGNED(hdr.va.end, SZ_4K)) {
 		drm_err(&ptdev->base, "Firmware corrupted, virtual addresses not page aligned: 0x%x-0x%x\n",
 			hdr.va.start, hdr.va.end);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index c60b599665d8..2c8d6e2c7232 100644
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
+	size = ALIGN(size, SZ_4K);
 	ret = panthor_vm_alloc_va(vm, gpu_va, size, &kbo->va_node);
 	if (ret)
 		goto err_put_obj;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 3cd2bce59edc..e53d131c53cc 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1027,10 +1027,10 @@ panthor_vm_alloc_va(struct panthor_vm *vm, u64 va, u64 size,
 {
 	int ret;
 
-	if (!size || (size & ~PAGE_MASK))
+	if (!size || !IS_ALIGNED(size, SZ_4K))
 		return -EINVAL;
 
-	if (va != PANTHOR_VM_KERNEL_AUTO_VA && (va & ~PAGE_MASK))
+	if (va != PANTHOR_VM_KERNEL_AUTO_VA && !IS_ALIGNED(va, SZ_4K))
 		return -EINVAL;
 
 	mutex_lock(&vm->mm_lock);
@@ -2370,7 +2370,7 @@ panthor_vm_bind_prepare_op_ctx(struct drm_file *file,
 	int ret;
 
 	/* Aligned on page size. */
-	if ((op->va | op->size) & ~PAGE_MASK)
+	if (!IS_ALIGNED(op->va | op->size, SZ_4K))
 		return -EINVAL;
 
 	switch (op->flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) {
-- 
2.46.2

