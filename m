Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C535B2C8CC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 17:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CFC10E62E;
	Tue, 19 Aug 2025 15:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfTNmH14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B2510E168;
 Tue, 19 Aug 2025 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755618830; x=1787154830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rhl21AkTldXEOvn71XVBih3sC9BBG2ZxwmD9nRhlIuQ=;
 b=GfTNmH14dCoAKe9XdKLbV5uzdykWIpEdFiF1db3FZle3ijmG7MvByrEx
 a8pPBM81i1yE509+FcDXDHHFGWGE2vsqvaDPSbyAR2QOO/byUHSRA+0MO
 uzDItGEIfKYIHmBJkytkz24UGrVExDuYKDOYKL+fqq69cUJJuS303vPN0
 IVn18joGGFL29+Hmk/PQ2UoH3HycCy8Si1f3EMfnl36nZbSvrvbmATJi2
 EcdDbGPg+zWuqPaXf0y6iUPBvxPxw3C7x2ExinSrxSr/bF3Gq4tVsiAAh
 dr+DF8lEKbuZGtJwUF1KCXrZeHX+C1CPWvkD6vBXFaazaBYwIh5moelDU Q==;
X-CSE-ConnectionGUID: MaMk+PJFTLWJjC8D5MO24g==
X-CSE-MsgGUID: sY8HUrDaSUSUoA0KB/jM6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58015711"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="58015711"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:53:49 -0700
X-CSE-ConnectionGUID: 9NtDQuFgQMWSzKWBwu7Dhg==
X-CSE-MsgGUID: I0pZawKeQgWSclcx5P6iUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167503912"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by orviesa009.jf.intel.com with ESMTP; 19 Aug 2025 08:53:47 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 2/4] drm/gpuvm: Kill drm_gpuva_init()
Date: Tue, 19 Aug 2025 21:50:56 +0530
Message-Id: <20250819162058.2777306-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819162058.2777306-1-himal.prasad.ghimiray@intel.com>
References: <20250819162058.2777306-1-himal.prasad.ghimiray@intel.com>
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

From: Boris Brezillon <boris.brezillon@collabora.com>

drm_gpuva_init() only has one internal user, and given we are about to
add new optional fields, it only add maintenance burden for no real
benefit, so let's kill the thing now.

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c |  8 +++++++-
 include/drm/drm_gpuvm.h           | 15 ++++-----------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 792b35433666..210604181c05 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -371,6 +371,12 @@ struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end)
 {
+	struct drm_gpuva_op_map op_map = {
+		.va.addr = range_start,
+		.va.range = range_end - range_start,
+		.gem.obj = obj,
+		.gem.offset = offset,
+	};
 	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
 	struct drm_gpuvm_bo *vm_bo;
 	struct msm_gem_vma *vma;
@@ -399,7 +405,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 	if (obj)
 		GEM_WARN_ON((range_end - range_start) > obj->size);
 
-	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, offset);
+	drm_gpuva_init_from_op(&vma->base, &op_map);
 	vma->mapped = false;
 
 	ret = drm_gpuva_insert(&vm->base, &vma->base);
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index a9fa44148e0c..05347ac6cc73 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -160,15 +160,6 @@ struct drm_gpuva *drm_gpuva_find_first(struct drm_gpuvm *gpuvm,
 struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuvm *gpuvm, u64 start);
 struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuvm *gpuvm, u64 end);
 
-static inline void drm_gpuva_init(struct drm_gpuva *va, u64 addr, u64 range,
-				  struct drm_gem_object *obj, u64 offset)
-{
-	va->va.addr = addr;
-	va->va.range = range;
-	va->gem.obj = obj;
-	va->gem.offset = offset;
-}
-
 /**
  * drm_gpuva_invalidate() - sets whether the backing GEM of this &drm_gpuva is
  * invalidated
@@ -1089,8 +1080,10 @@ void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
 static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
 					  struct drm_gpuva_op_map *op)
 {
-	drm_gpuva_init(va, op->va.addr, op->va.range,
-		       op->gem.obj, op->gem.offset);
+	va->va.addr = op->va.addr;
+	va->va.range = op->va.range;
+	va->gem.obj = op->gem.obj;
+	va->gem.offset = op->gem.offset;
 }
 
 /**
-- 
2.34.1

