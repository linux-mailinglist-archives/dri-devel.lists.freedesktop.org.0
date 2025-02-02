Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB6CA24E69
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 14:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3119A10E30D;
	Sun,  2 Feb 2025 13:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=asahilina.net header.i=@asahilina.net header.b="uD0v39eA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Sun, 02 Feb 2025 13:52:21 UTC
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC3210E0E5;
 Sun,  2 Feb 2025 13:52:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: sendonly@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 9CE30426E2;
 Sun,  2 Feb 2025 13:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1738503912;
 bh=uu52xMGokrDDgENtthfQJ71LyZloD14w6rOxRrrh344=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=uD0v39eASsjcf1/3SXk5cmzdi4EhXYnO7sVMISYU13gDT7VcjsfmoLzKdqlUGLKHj
 PtSwxIcHvYP17ei55bcX+FvkNaA1p61nuMtlbVQN3PzN4Ltm+nwo47Yt/iS1dkZ1pa
 j68AmpGGGIZFcRZy71jFo9A2nVRnPpynE/Upt+PfYBNK44u0b0SUGoxQFgIxPqt3r0
 lJwDu5st9ljEUeI5DJT3bfiDXF3+xzt9LjQ5NprGlwhdyC98KaKvCYSOdb1SDFcMzX
 CW69PJpAh8I2fLvbOa6nAHHxUUzXgeRoTt0guPesw5bquoouV6kVd11pgWOVNB5h5Z
 vjjeEswiIKQDQ==
From: Asahi Lina <lina@asahilina.net>
Date: Sun, 02 Feb 2025 22:34:50 +0900
Subject: [PATCH 1/4] drm/gpuvm: Add a flags argument to
 drm_gpuvm_sm_map[_*]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-gpuvm-single-page-v1-1-8cbd44fdcbd4@asahilina.net>
References: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
In-Reply-To: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738503908; l=5456;
 i=lina@asahilina.net; s=20240902; h=from:subject:message-id;
 bh=uu52xMGokrDDgENtthfQJ71LyZloD14w6rOxRrrh344=;
 b=C9WT1JzSXVS8oXNUsibvBt3bied9shp4kP5FTP0VMuo5Qk8Rez4F3DdxZyQlD5cqz2SnBJ2kF
 UCP+cz0Ar4xBqSxG/kmEYB912yJQDgnkqlN1duZfiu1GFLzqraxIwCC
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=tpv7cWfUnHNw5jwf6h4t0gGgglt3/xcwlfs0+A/uUu8=
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

drm_gpuva objects have a flags field. Currently, this can be managed by
drivers out-of-band, without any special handling in drm_gpuvm.

To be able to introduce flags that do affect the logic in the drm_gpuvm
core, we need to plumb it through the map calls. This will allow the
core to check the flags on map and alter the merge/split logic depending
on the requested flags and the flags of the existing drm_gpuva ranges
that are being split.

First, just add the argument to the API and do nothing with it.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 drivers/gpu/drm/drm_gpuvm.c            | 6 ++++--
 drivers/gpu/drm/imagination/pvr_vm.c   | 3 ++-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 3 ++-
 drivers/gpu/drm/panthor/panthor_mmu.c  | 3 ++-
 drivers/gpu/drm/xe/xe_vm.c             | 3 ++-
 include/drm/drm_gpuvm.h                | 6 ++++--
 6 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef291e084a15d844d4ececda8412d9..9733460d737667035541b488657154afb56872e3 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2333,7 +2333,8 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 int
 drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 		 u64 req_addr, u64 req_range,
-		 struct drm_gem_object *req_obj, u64 req_offset)
+		 struct drm_gem_object *req_obj, u64 req_offset,
+		 enum drm_gpuva_flags req_flags)
 {
 	const struct drm_gpuvm_ops *ops = gpuvm->ops;
 
@@ -2516,7 +2517,8 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
 struct drm_gpuva_ops *
 drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 			    u64 req_addr, u64 req_range,
-			    struct drm_gem_object *req_obj, u64 req_offset)
+			    struct drm_gem_object *req_obj, u64 req_offset,
+			    enum drm_gpuva_flags req_flags)
 {
 	struct drm_gpuva_ops *ops;
 	struct {
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 363f885a709826efa3d45a906c5f65131f7ed7b9..c57c7adcbe987dfc559bc00fc24862f5d99bbc0e 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -190,7 +190,8 @@ static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op *bind_op)
 					bind_op, bind_op->device_addr,
 					bind_op->size,
 					gem_from_pvr_gem(bind_op->pvr_obj),
-					bind_op->offset);
+					bind_op->offset,
+					0);
 
 	case PVR_VM_BIND_TYPE_UNMAP:
 		return drm_gpuvm_sm_unmap(&bind_op->vm_ctx->gpuvm_mgr,
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 48f105239f42d8ffa3cefd253bd83d52dbb3255f..d548154c0a38c08c74cfbb9c66d703699d8d882b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1304,7 +1304,8 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 							      op->va.addr,
 							      op->va.range,
 							      op->gem.obj,
-							      op->gem.offset);
+							      op->gem.offset,
+							      0);
 			if (IS_ERR(op->ops)) {
 				ret = PTR_ERR(op->ops);
 				goto unwind_continue;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index a49132f3778b3a7a0855de37e4ab008e9476f740..ebfb399af8752afdd26c33723b8ac6f616d02fc5 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2155,7 +2155,8 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
 		}
 
 		ret = drm_gpuvm_sm_map(&vm->base, vm, op->va.addr, op->va.range,
-				       op->map.vm_bo->obj, op->map.bo_offset);
+				       op->map.vm_bo->obj, op->map.bo_offset,
+				       0);
 		break;
 
 	case DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP:
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c99380271de62f8659fdd909a5bd9980d09de4d9..2d1fde089c382c363e354200cfb0281869b97f56 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1926,7 +1926,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	case DRM_XE_VM_BIND_OP_MAP:
 	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
 		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
-						  obj, bo_offset_or_userptr);
+						  obj, bo_offset_or_userptr,
+						  0);
 		break;
 	case DRM_XE_VM_BIND_OP_UNMAP:
 		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 00d4e43b76b6c12e10e422d250ab0ac1c9009bc5..cb045378803646a9645c002c57183c915d35befb 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1056,7 +1056,8 @@ struct drm_gpuva_ops {
 struct drm_gpuva_ops *
 drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 			    u64 addr, u64 range,
-			    struct drm_gem_object *obj, u64 offset);
+			    struct drm_gem_object *obj, u64 offset,
+			    enum drm_gpuva_flags flags);
 struct drm_gpuva_ops *
 drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
 			      u64 addr, u64 range);
@@ -1201,7 +1202,8 @@ struct drm_gpuvm_ops {
 
 int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 		     u64 addr, u64 range,
-		     struct drm_gem_object *obj, u64 offset);
+		     struct drm_gem_object *obj, u64 offset,
+		     enum drm_gpuva_flags flags);
 
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 		       u64 addr, u64 range);

-- 
2.47.1

