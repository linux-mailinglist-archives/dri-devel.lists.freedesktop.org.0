Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37259A7B9E5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 11:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D08510EBB0;
	Fri,  4 Apr 2025 09:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UUNEp4U/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A190110EB9F;
 Fri,  4 Apr 2025 09:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743758800;
 bh=tG8lfFAviS5kJzCGazqrwyKEN7RGYsYNHdE7EpTka+g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UUNEp4U/HD+DUxcPYuDKHx84Jw2ivn5vQhHJbdRnMeWFWEuIWA7EyYrSU+9v00EKy
 gMOPeFCwEGhNRMPlYB0HHKfuUHS6lkKJ946fmd6pgo3BzRnJaH/Sc4/kK5ymEmUvvt
 4zV+TpbEsqflcp+FskaAcUl9cur+kHq7r54fkr19dOxuEuKstRiY/BLxITbb5TSgoR
 pFGl2J3xGqb5HYZB3Yaqm0PLbOaAM2T5MwXHB2GN8xTqxyJztZ9fb6HAB43MDHS+Fv
 do1HylXddeYfsvlLanqMreJuAyofHIGRy7cBiUBNgwrXWYi3L1Y72B3Ez/eipXaqaV
 X1r+XQ3mI6m3w==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A68417E1060;
 Fri,  4 Apr 2025 11:26:39 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com
Subject: [PATCH v3 6/8] drm/panthor: Add a panthor_vm_pre_fault_range() helper
Date: Fri,  4 Apr 2025 11:26:32 +0200
Message-ID: <20250404092634.2968115-7-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404092634.2968115-1-boris.brezillon@collabora.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
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

This allows one to pre-allocate resources on a sparse BO to avoid
faulting when the GPU accesses the memory region. Will be used by
the heap logic to pre-populate a heap object with a predefined number
of chunks.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index e05aaac10481..aea9b5f2ce64 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1770,6 +1770,31 @@ static int panthor_vm_map_on_demand_locked(struct panthor_vm *vm,
 	return 0;
 }
 
+int panthor_vm_pre_fault_range(struct panthor_vm *vm, u64 iova, u64 size,
+			       gfp_t page_gfp, gfp_t other_gfp)
+{
+	struct panthor_gem_object *bo = NULL;
+	struct drm_gpuva *gpuva;
+	struct panthor_vma *vma;
+	int ret;
+
+	mutex_lock(&vm->op_lock);
+	gpuva = drm_gpuva_find_first(&vm->base, iova, 1);
+	vma = gpuva ? container_of(gpuva, struct panthor_vma, base) : NULL;
+	if (vma && vma->base.gem.obj)
+		bo = to_panthor_bo(vma->base.gem.obj);
+
+	if (bo && (bo->flags & DRM_PANTHOR_BO_ALLOC_ON_FAULT)) {
+		ret = panthor_vm_map_on_demand_locked(vm, vma, iova - vma->base.va.addr,
+						      size, page_gfp, other_gfp);
+	} else {
+		ret = -EFAULT;
+	}
+	mutex_unlock(&vm->op_lock);
+
+	return ret;
+}
+
 static void panthor_vm_handle_fault_locked(struct panthor_vm *vm)
 {
 	struct panthor_device *ptdev = vm->ptdev;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
index fc274637114e..d57c86d293bd 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.h
+++ b/drivers/gpu/drm/panthor/panthor_mmu.h
@@ -28,6 +28,8 @@ int panthor_vm_map_bo_range(struct panthor_vm *vm, struct panthor_gem_object *bo
 int panthor_vm_unmap_range(struct panthor_vm *vm, u64 va, u64 size);
 struct panthor_gem_object *
 panthor_vm_get_bo_for_va(struct panthor_vm *vm, u64 va, u64 *bo_offset);
+int panthor_vm_pre_fault_range(struct panthor_vm *vm, u64 iova, u64 size,
+			       gfp_t page_gfp, gfp_t other_gfp);
 
 int panthor_vm_active(struct panthor_vm *vm);
 void panthor_vm_idle(struct panthor_vm *vm);
-- 
2.49.0

