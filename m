Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945C995646F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 09:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8880A10E1CC;
	Mon, 19 Aug 2024 07:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="XnacGhMt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB69E10E1CC;
 Mon, 19 Aug 2024 07:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1724052090; x=1724656890; i=friedrich.vock@gmx.de;
 bh=cIk/w85T3wBhecUK/mrucKj5evOp8FAXNEfRdI5guGs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=XnacGhMt8vIDw6ueP/XXlLXKW1VXAvu5sO1vvrodT/jRUQfIvGBxEAF6Z2xJRLIU
 c/L7q6HOMYorWYCJgwOJhYBAVbvWiJU+lIo7hdBDF1o8YJAwW45UFUN4WvbfyCh+A
 JHiHlwwSWa06Ffpc7Hx1YlpFdXJUXN9viirNoWeR1s0D7lxY/mo8IeLwgc0bof6IJ
 /6SphAKGChB2qnF1Z4CjKxO7iUshju+dOqj7g+S7AvQUH5Iw8WtBnm3VxNR52emNI
 rZb9YKTfiDOLTJVSZDfoeQ4ZpK7nS5C81lB8epd7X0PiOTea4s0WJc5c62W1+HlUd
 OFdthw4DoblFPHFP6w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from rizzler.fritz.box ([213.152.114.245]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLR1f-1sO0BG3PjH-00Mzgv; Mon, 19
 Aug 2024 09:21:29 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
Subject: [PATCH v3 2/3] drm/amdgpu: Add optional explicit sync fences for GEM
 operations.
Date: Mon, 19 Aug 2024 09:21:09 +0200
Message-ID: <20240819072110.108715-3-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819072110.108715-1-friedrich.vock@gmx.de>
References: <20240819072110.108715-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qeOxsSkAhv+oZbRTzc40yesG7aaRTtxDEiBxMxTRdFgj0az3/zS
 34FaTCBjycwpuDYyIMFjtLW7qWHdO041gyBiIumk/UXgDJKTb4FCAM7/ybCCRJzYScOwVwJ
 NSovxfAptMSNJfbt0TZ0ON/mOkXUtykTT7wEzhrsllVfBH2p1hHOr3LV1vJh28eA6hppbFD
 ECk+JMCzjQQ6Ai7Ow4iFA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4X1E24C+udE=;gdIFKGw8ZclYwX9yzEkbPP9SWvk
 PQmMB7NkRjQxmebmS0/H4b4CxgwYZeTJkNNNWL9Vr2B/IGEft+qQwPTePFKe2FM0MzqDqib9t
 k5I5U3x8NvD/ZTYWQhMxB+Zy+pu8A+JCqFZaRMoUCgRSz+T4ViFEjnaDZJlVXx9iqtbayaaCy
 zRkfcjzKxjtmM/Sj1q90wfQ9yUaFp4KbISfMF2Kox4kvxWTcGLMO8IHshLqaqypno9/P3ylpY
 Pvnf66Ca4pVaNewNf04rYZVMYnhQ51P6o4of8aYEiIgI7cHc0NUQZ0jHiuJ21nYnUmOpmvE4G
 UTutO7EeSwlJBWUjA5AM9aV9Ig2OZRy/gOGnb6559puHpZSE0HYiRsaaTfRGAkBsqZUxWYrYJ
 KDRTpBBBCX//KjbRC7VpqIRAC+RLs18My5/x2hwMO0VehDOX/wXMqlaagxBIhpNisuxnl6hz/
 BsYxdDtSjeDVKyNR9h6/ApoA7Gs28J1jecyjBM3LvGnnektZwvBMXzSOLoI5DPMStYuc3SvdP
 YLq660yZhJZpklIxO/1M4R7rtRbIeRi/n1Usyj7Rb/BXAWSP6fcTq+yGRf69ZnY14AIQdS3uc
 KNjjYJv4KY/NkPKJOUPgvrsmOSyAn3b5JeuEyJ8Mzjhaeypv6fFA7UgQNfwYfR4ucLhVZrhup
 vTw+e9wkSzpaKv5bKsCNE8zytTkwzGWFU7dD3ujeD2irNPZH621LA7+LaRBmbdSXc91MCle6U
 82sKUOUAA07TO6CZUmgzCeWMXIPEnC1TAqiSM75IOBC2HQVHwdxOrqffuI4XeqmOBGVJaxYbE
 nLDW7AbTQuv9dj9He3omwdxl+fzwubw49MEVw82xziZcI=
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

From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

In Vulkan, it is the application's responsibility to perform adequate
synchronization before a sparse unmap, replace or BO destroy operation.
Until now, the kernel applied the same rule as implicitly-synchronized
APIs like OpenGL, which with per-VM BOs made page table updates stall
the queue completely. The newly added AMDGPU_VM_EXPLICIT_SYNC flag
allows drivers to opt-out of this behavior, while still ensuring
adequate implicit sync happens for kernel-initiated updates
(e.g. BO moves).

When using explicit sync, we record a set of fences to explicitly wait
for in each mapping. To avoid increasing the mapping struct's size, this
is union-ized with the interval tree field which is unused after the
unmap.

The reason this is done with a GEM ioctl flag, instead of being a VM /
context global setting, is that the current libdrm implementation shares
the DRM handle even between different kind of drivers (radeonsi vs radv).

Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

Co-developed-by: Friedrich Vock <friedrich.vock@gmx.de>
Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 76 ++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    | 23 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 68 +++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        | 30 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    | 12 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |  9 +++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 18 ++---
 include/uapi/drm/amdgpu_drm.h                 | 11 +++
 13 files changed, 196 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 6d5fd371d5ce..543396b52ebb 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1265,7 +1265,7 @@ static int unmap_bo_from_gpuvm(struct kgd_mem *mem,
 		return -EBUSY;
 	}

-	amdgpu_vm_bo_unmap(adev, bo_va, entry->va);
+	amdgpu_vm_bo_unmap(adev, bo_va, entry->va, NULL);

 	amdgpu_vm_clear_freed(adev, vm, &bo_va->last_pt_update);

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_csa.c
index cfdf558b48b6..9cba44ecde90 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
@@ -121,7 +121,7 @@ int amdgpu_unmap_static_csa(struct amdgpu_device *adev=
, struct amdgpu_vm *vm,
 		}
 	}

-	r =3D amdgpu_vm_bo_unmap(adev, bo_va, csa_addr);
+	r =3D amdgpu_vm_bo_unmap(adev, bo_va, csa_addr, NULL);
 	if (r) {
 		DRM_ERROR("failed to do bo_unmap on static CSA, err=3D%d\n", r);
 		goto error;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_gem.c
index ebb3f87ef4f6..62f573a1bcf9 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -35,6 +35,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_exec.h>
 #include <drm/drm_gem_ttm_helper.h>
+#include <drm/drm_syncobj.h>
 #include <drm/ttm/ttm_tt.h>

 #include "amdgpu.h"
@@ -701,19 +702,27 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void=
 *data,
 	const uint32_t valid_flags =3D AMDGPU_VM_DELAY_UPDATE |
 		AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE |
 		AMDGPU_VM_PAGE_EXECUTABLE | AMDGPU_VM_MTYPE_MASK |
-		AMDGPU_VM_PAGE_NOALLOC;
+		AMDGPU_VM_PAGE_NOALLOC | AMDGPU_VM_EXPLICIT_SYNC;
 	const uint32_t prt_flags =3D AMDGPU_VM_DELAY_UPDATE |
-		AMDGPU_VM_PAGE_PRT;
+		AMDGPU_VM_PAGE_PRT | AMDGPU_VM_EXPLICIT_SYNC;

 	struct drm_amdgpu_gem_va *args =3D data;
-	struct drm_gem_object *gobj;
+	struct drm_gem_object *gobj =3D NULL;
 	struct amdgpu_device *adev =3D drm_to_adev(dev);
 	struct amdgpu_fpriv *fpriv =3D filp->driver_priv;
+	struct amdgpu_bo_unmap_sync *unmap_sync =3D NULL;
+	size_t fence_array_size;
+	size_t unmap_sync_size;
+	uint32_t __user *wait_fence_handles;
+	uint64_t __user *sync_points;
+	uint32_t wait_fence_handle;
+	uint64_t sync_point;
 	struct amdgpu_bo *abo;
 	struct amdgpu_bo_va *bo_va;
 	struct drm_exec exec;
 	uint64_t va_flags;
 	uint64_t vm_size;
+	uint64_t i;
 	int r =3D 0;

 	if (args->va_address < AMDGPU_VA_RESERVED_BOTTOM) {
@@ -761,11 +770,50 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void=
 *data,
 		return -EINVAL;
 	}

+	if (args->operation !=3D AMDGPU_VA_OP_MAP &&
+	    (args->flags & AMDGPU_VM_EXPLICIT_SYNC)) {
+		if (check_mul_overflow(args->syncobj_count,
+				       sizeof(struct dma_fence *),
+				       &fence_array_size))
+			return -EINVAL;
+		if (check_add_overflow(fence_array_size, sizeof(*unmap_sync),
+				       &unmap_sync_size))
+			return -EINVAL;
+		unmap_sync =3D kmalloc(unmap_sync_size, GFP_KERNEL);
+		if (!unmap_sync)
+			return -ENOMEM;
+
+		wait_fence_handles =3D u64_to_user_ptr(args->syncobjs);
+		sync_points =3D u64_to_user_ptr(args->sync_points);
+
+		kref_init(&unmap_sync->ref);
+		unmap_sync->wait_fence_count =3D args->syncobj_count;
+
+		for (i =3D 0; i < args->syncobj_count; ++i) {
+			if (copy_from_user(&wait_fence_handle,
+					   &wait_fence_handles[i],
+					   sizeof(wait_fence_handle))) {
+				r =3D -EFAULT;
+				goto error;
+			}
+			if (copy_from_user(&sync_point, &sync_points[i],
+					   sizeof(sync_point))) {
+				r =3D -EFAULT;
+				goto error;
+			}
+			drm_syncobj_find_fence(filp, wait_fence_handle,
+					       sync_point, 0,
+					       &unmap_sync->wait_fences[i]);
+		}
+	}
+
 	if ((args->operation !=3D AMDGPU_VA_OP_CLEAR) &&
 	    !(args->flags & AMDGPU_VM_PAGE_PRT)) {
 		gobj =3D drm_gem_object_lookup(filp, args->handle);
-		if (gobj =3D=3D NULL)
-			return -ENOENT;
+		if (gobj =3D=3D NULL) {
+			r =3D -ENOENT;
+			goto error;
+		}
 		abo =3D gem_to_amdgpu_bo(gobj);
 	} else {
 		gobj =3D NULL;
@@ -779,20 +827,20 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void=
 *data,
 			r =3D drm_exec_lock_obj(&exec, gobj);
 			drm_exec_retry_on_contention(&exec);
 			if (unlikely(r))
-				goto error;
+				goto error_exec;
 		}

 		r =3D amdgpu_vm_lock_pd(&fpriv->vm, &exec, 2);
 		drm_exec_retry_on_contention(&exec);
 		if (unlikely(r))
-			goto error;
+			goto error_exec;
 	}

 	if (abo) {
 		bo_va =3D amdgpu_vm_bo_find(&fpriv->vm, abo);
 		if (!bo_va) {
 			r =3D -ENOENT;
-			goto error;
+			goto error_exec;
 		}
 	} else if (args->operation !=3D AMDGPU_VA_OP_CLEAR) {
 		bo_va =3D fpriv->prt_va;
@@ -808,19 +856,20 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void=
 *data,
 				     va_flags);
 		break;
 	case AMDGPU_VA_OP_UNMAP:
-		r =3D amdgpu_vm_bo_unmap(adev, bo_va, args->va_address);
+		r =3D amdgpu_vm_bo_unmap(adev, bo_va, args->va_address,
+				       unmap_sync);
 		break;

 	case AMDGPU_VA_OP_CLEAR:
 		r =3D amdgpu_vm_bo_clear_mappings(adev, &fpriv->vm,
 						args->va_address,
-						args->map_size);
+						args->map_size, unmap_sync);
 		break;
 	case AMDGPU_VA_OP_REPLACE:
 		va_flags =3D amdgpu_gem_va_map_flags(adev, args->flags);
 		r =3D amdgpu_vm_bo_replace_map(adev, bo_va, args->va_address,
 					     args->offset_in_bo, args->map_size,
-					     va_flags);
+					     va_flags, unmap_sync);
 		break;
 	default:
 		break;
@@ -829,9 +878,12 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void =
*data,
 		amdgpu_gem_va_update_vm(adev, &fpriv->vm, bo_va,
 					args->operation);

-error:
+error_exec:
 	drm_exec_fini(&exec);
+error:
 	drm_gem_object_put(gobj);
+	if (unmap_sync)
+		kref_put(&unmap_sync->ref, amdgpu_bo_unmap_sync_destroy);
 	return r;
 }

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_object.h
index d7e27957013f..cef3b2937ec3 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -60,6 +60,12 @@ struct amdgpu_bo_param {
 	int8_t				xcp_id_plus1;
 };

+struct amdgpu_bo_unmap_sync {
+	struct kref ref;
+	uint64_t wait_fence_count;
+	struct dma_fence *wait_fences[];
+};
+
 /* bo virtual addresses in a vm */
 struct amdgpu_bo_va_mapping {
 	struct amdgpu_bo_va		*bo_va;
@@ -67,7 +73,15 @@ struct amdgpu_bo_va_mapping {
 	struct rb_node			rb;
 	uint64_t			start;
 	uint64_t			last;
-	uint64_t			__subtree_last;
+	union {
+		uint64_t __subtree_last;
+		/* For freed mappings only: Optional
+		 * set of dma_fences to wait on before freeing the
+		 * mapping. If NULL, the fences from the
+		 * BO's resv object are used instead.
+		 */
+		struct amdgpu_bo_unmap_sync *unmap_sync;
+	};
 	uint64_t			offset;
 	uint64_t			flags;
 };
@@ -168,6 +182,13 @@ struct amdgpu_mem_stats {
 	uint64_t requested_gtt;
 };

+static inline void amdgpu_bo_unmap_sync_destroy(struct kref *ref)
+{
+	struct amdgpu_bo_unmap_sync *sync =3D
+		container_of(ref, struct amdgpu_bo_unmap_sync, ref);
+	kfree(sync);
+}
+
 static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object=
 *tbo)
 {
 	return container_of(tbo, struct amdgpu_bo, tbo);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_trace.h
index 2fd1bfb35916..152125976c97 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -276,6 +276,7 @@ TRACE_EVENT(amdgpu_vm_bo_unmap,
 			     __field(long, last)
 			     __field(u64, offset)
 			     __field(u64, flags)
+			     __field(bool, explicit_sync)
 			     ),

 	    TP_fast_assign(
@@ -284,10 +285,11 @@ TRACE_EVENT(amdgpu_vm_bo_unmap,
 			   __entry->last =3D mapping->last;
 			   __entry->offset =3D mapping->offset;
 			   __entry->flags =3D mapping->flags;
+			   __entry->explicit_sync =3D !!mapping->unmap_sync;
 			   ),
-	    TP_printk("bo=3D%p, start=3D%lx, last=3D%lx, offset=3D%010llx, flags=
=3D%llx",
+	    TP_printk("bo=3D%p, start=3D%lx, last=3D%lx, offset=3D%010llx, flags=
=3D%llx, explicit_sync=3D%d",
 		      __entry->bo, __entry->start, __entry->last,
-		      __entry->offset, __entry->flags)
+		      __entry->offset, __entry->flags, __entry->explicit_sync)
 );

 DECLARE_EVENT_CLASS(amdgpu_vm_mapping,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_umsch_mm.c
index 6162582d0aa2..3def5b0aee35 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
@@ -166,7 +166,7 @@ static int unmap_ring_data(struct amdgpu_device *adev,=
 struct amdgpu_vm *vm,
 	}


-	r =3D amdgpu_vm_bo_unmap(adev, bo_va, addr);
+	r =3D amdgpu_vm_bo_unmap(adev, bo_va, addr, NULL);
 	if (r)
 		goto out_unlock;

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_vm.c
index a4fc24dff04d..08f5915f190d 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -838,7 +838,8 @@ int amdgpu_vm_update_pdes(struct amdgpu_device *adev,
 	params.vm =3D vm;
 	params.immediate =3D immediate;

-	r =3D vm->update_funcs->prepare(&params, NULL, AMDGPU_SYNC_EXPLICIT);
+	r =3D vm->update_funcs->prepare(&params, NULL, NULL,
+				      AMDGPU_SYNC_EXPLICIT);
 	if (r)
 		goto error;

@@ -933,6 +934,8 @@ amdgpu_vm_tlb_flush(struct amdgpu_vm_update_params *pa=
rams,
  * @unlocked: unlocked invalidation during MM callback
  * @flush_tlb: trigger tlb invalidation after update completed
  * @allow_override: change MTYPE for local NUMA nodes
+ * @sync: Optional set of explicit-sync fences to wait on. If NULL, all p=
ending
+ *        work using this BO is waited on.
  * @resv: fences we need to sync to
  * @start: start of mapped range
  * @last: last mapped entry
@@ -950,6 +953,7 @@ amdgpu_vm_tlb_flush(struct amdgpu_vm_update_params *pa=
rams,
  */
 int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *=
vm,
 			   bool immediate, bool unlocked, bool flush_tlb, bool allow_override,
+			   struct amdgpu_bo_unmap_sync *sync,
 			   struct dma_resv *resv, uint64_t start, uint64_t last,
 			   uint64_t flags, uint64_t offset, uint64_t vram_base,
 			   struct ttm_resource *res, dma_addr_t *pages_addr,
@@ -994,7 +998,7 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev,=
 struct amdgpu_vm *vm,
 	/* Implicitly sync to command submissions in the same VM before
 	 * unmapping. Sync to moving fences before mapping.
 	 */
-	if (!(flags & (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)))
+	if (!(flags & (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)) && !sync)
 		sync_mode =3D AMDGPU_SYNC_EQ_OWNER;
 	else
 		sync_mode =3D AMDGPU_SYNC_EXPLICIT;
@@ -1013,7 +1017,8 @@ int amdgpu_vm_update_range(struct amdgpu_device *ade=
v, struct amdgpu_vm *vm,
 		dma_fence_put(tmp);
 	}

-	r =3D vm->update_funcs->prepare(&params, resv, sync_mode);
+	r =3D vm->update_funcs->prepare(&params, sync,
+				      resv, sync_mode);
 	if (r)
 		goto error_free;

@@ -1234,10 +1239,10 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev=
, struct amdgpu_bo_va *bo_va,
 		trace_amdgpu_vm_bo_update(mapping);

 		r =3D amdgpu_vm_update_range(adev, vm, false, false, flush_tlb,
-					   !uncached, resv, mapping->start, mapping->last,
-					   update_flags, mapping->offset,
-					   vram_base, mem, pages_addr,
-					   last_update);
+					   !uncached, NULL, resv,
+					   mapping->start, mapping->last,
+					   update_flags, mapping->offset, vram_base, mem,
+					   pages_addr, last_update);
 		if (r)
 			return r;
 	}
@@ -1371,6 +1376,9 @@ static void amdgpu_vm_free_mapping(struct amdgpu_dev=
ice *adev,
 {
 	if (mapping->flags & AMDGPU_PTE_PRT_FLAG(adev))
 		amdgpu_vm_add_prt_cb(adev, fence);
+	if (mapping->unmap_sync)
+		kref_put(&mapping->unmap_sync->ref,
+			 amdgpu_bo_unmap_sync_destroy);
 	kfree(mapping);
 }

@@ -1426,7 +1434,8 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev=
,
 		list_del(&mapping->list);

 		r =3D amdgpu_vm_update_range(adev, vm, false, false, true, false,
-					   resv, mapping->start, mapping->last,
+					   mapping->unmap_sync, resv,
+					   mapping->start, mapping->last,
 					   init_pte_value, 0, 0, NULL, NULL,
 					   &f);
 		amdgpu_vm_free_mapping(adev, vm, mapping, f);
@@ -1706,8 +1715,10 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev,
 	int r;

 	r =3D amdgpu_vm_verify_parameters(adev, bo, saddr, offset, size);
-	if (r)
+	if (r) {
+		dev_warn(adev->dev, "verifying parameters failed %d!\n", r);
 		return r;
+	}

 	saddr /=3D AMDGPU_GPU_PAGE_SIZE;
 	eaddr =3D saddr + (size - 1) / AMDGPU_GPU_PAGE_SIZE;
@@ -1744,9 +1755,8 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev,
  * @offset: requested offset in the BO
  * @size: BO size in bytes
  * @flags: attributes of pages (read/write/valid/etc.)
- *
- * Add a mapping of the BO at the specefied addr into the VM. Replace exi=
sting
- * mappings as we do so.
+ * @sync: Optional set of explicit-sync fences to wait on. If NULL, all p=
ending
+ *        work using this BO is waited on.
  *
  * Returns:
  * 0 for success, error for failure.
@@ -1754,9 +1764,9 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev,
  * Object has to be reserved and unreserved outside!
  */
 int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
-			     struct amdgpu_bo_va *bo_va,
-			     uint64_t saddr, uint64_t offset,
-			     uint64_t size, uint64_t flags)
+			     struct amdgpu_bo_va *bo_va, uint64_t saddr,
+			     uint64_t offset, uint64_t size, uint64_t flags,
+			     struct amdgpu_bo_unmap_sync *sync)
 {
 	struct amdgpu_bo_va_mapping *mapping;
 	struct amdgpu_bo *bo =3D bo_va->base.bo;
@@ -1772,7 +1782,8 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_device *a=
dev,
 	if (!mapping)
 		return -ENOMEM;

-	r =3D amdgpu_vm_bo_clear_mappings(adev, bo_va->base.vm, saddr, size);
+	r =3D amdgpu_vm_bo_clear_mappings(adev, bo_va->base.vm, saddr, size,
+					sync);
 	if (r) {
 		kfree(mapping);
 		return r;
@@ -1797,6 +1808,8 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_device *a=
dev,
  * @adev: amdgpu_device pointer
  * @bo_va: bo_va to remove the address from
  * @saddr: where to the BO is mapped
+ * @sync: Optional set of explicit-sync fences to wait on. If NULL, all p=
ending
+ *        work using this BO is waited on.
  *
  * Remove a mapping of the BO at the specefied addr from the VM.
  *
@@ -1805,9 +1818,8 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_device *a=
dev,
  *
  * Object has to be reserved and unreserved outside!
  */
-int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
-		       struct amdgpu_bo_va *bo_va,
-		       uint64_t saddr)
+int amdgpu_vm_bo_unmap(struct amdgpu_device *adev, struct amdgpu_bo_va *b=
o_va,
+		       uint64_t saddr, struct amdgpu_bo_unmap_sync *sync)
 {
 	struct amdgpu_bo_va_mapping *mapping;
 	struct amdgpu_vm *vm =3D bo_va->base.vm;
@@ -1832,9 +1844,13 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
 			return -ENOENT;
 	}

+	if (sync)
+		kref_get(&sync->ref);
+
 	list_del(&mapping->list);
 	amdgpu_vm_it_remove(mapping, &vm->va);
 	mapping->bo_va =3D NULL;
+	mapping->unmap_sync =3D sync;
 	trace_amdgpu_vm_bo_unmap(bo_va, mapping);

 	if (valid)
@@ -1853,6 +1869,8 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
  * @vm: VM structure to use
  * @saddr: start of the range
  * @size: size of the range
+ * @sync: Optional set of explicit-sync fences to wait on. If NULL, all p=
ending
+ *        work using this BO is waited on.
  *
  * Remove all mappings in a range, split them as appropriate.
  *
@@ -1860,8 +1878,9 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
  * 0 for success, error for failure.
  */
 int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
-				struct amdgpu_vm *vm,
-				uint64_t saddr, uint64_t size)
+				struct amdgpu_vm *vm, uint64_t saddr,
+				uint64_t size,
+				struct amdgpu_bo_unmap_sync *sync)
 {
 	struct amdgpu_bo_va_mapping *before, *after, *tmp, *next;
 	LIST_HEAD(removed);
@@ -1928,7 +1947,11 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_devic=
e *adev,
 		if (tmp->last > eaddr)
 		    tmp->last =3D eaddr;

+		if (sync)
+			kref_get(&sync->ref);
+
 		tmp->bo_va =3D NULL;
+		tmp->unmap_sync =3D sync;
 		list_add(&tmp->list, &vm->freed);
 		trace_amdgpu_vm_bo_unmap(NULL, tmp);
 	}
@@ -2057,6 +2080,7 @@ void amdgpu_vm_bo_del(struct amdgpu_device *adev,
 		list_del(&mapping->list);
 		amdgpu_vm_it_remove(mapping, &vm->va);
 		mapping->bo_va =3D NULL;
+		mapping->unmap_sync =3D NULL;
 		trace_amdgpu_vm_bo_unmap(bo_va, mapping);
 		list_add(&mapping->list, &vm->freed);
 	}
@@ -2840,7 +2864,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *ad=
ev, u32 pasid,
 		goto error_unlock;
 	}

-	r =3D amdgpu_vm_update_range(adev, vm, true, false, false, false,
+	r =3D amdgpu_vm_update_range(adev, vm, true, false, false, false, NULL,
 				   NULL, addr, addr, flags, value, 0, NULL, NULL, NULL);
 	if (r)
 		goto error_unlock;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_vm.h
index 046949c4b695..3cd9eab9e57a 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -43,6 +43,7 @@ struct amdgpu_job;
 struct amdgpu_bo_list_entry;
 struct amdgpu_bo_vm;
 struct amdgpu_mem_stats;
+struct amdgpu_bo_unmap_sync;

 /*
  * GPUVM handling
@@ -304,7 +305,8 @@ struct amdgpu_vm_update_params {

 struct amdgpu_vm_update_funcs {
 	int (*map_table)(struct amdgpu_bo_vm *bo);
-	int (*prepare)(struct amdgpu_vm_update_params *p, struct dma_resv *resv,
+	int (*prepare)(struct amdgpu_vm_update_params *p,
+		       struct amdgpu_bo_unmap_sync *sync, struct dma_resv *resv,
 		       enum amdgpu_sync_mode sync_mode);
 	int (*update)(struct amdgpu_vm_update_params *p,
 		      struct amdgpu_bo_vm *bo, uint64_t pe, uint64_t addr,
@@ -505,13 +507,14 @@ int amdgpu_vm_flush_compute_tlb(struct amdgpu_device=
 *adev,
 void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
 			    struct amdgpu_vm *vm, struct amdgpu_bo *bo);
 int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *=
vm,
-			   bool immediate, bool unlocked, bool flush_tlb, bool allow_override,
-			   struct dma_resv *resv, uint64_t start, uint64_t last,
-			   uint64_t flags, uint64_t offset, uint64_t vram_base,
+			   bool immediate, bool unlocked, bool flush_tlb,
+			   bool allow_override,
+			   struct amdgpu_bo_unmap_sync *sync, struct dma_resv *resv,
+			   uint64_t start, uint64_t last, uint64_t flags,
+			   uint64_t offset, uint64_t vram_base,
 			   struct ttm_resource *res, dma_addr_t *pages_addr,
 			   struct dma_fence **fence);
-int amdgpu_vm_bo_update(struct amdgpu_device *adev,
-			struct amdgpu_bo_va *bo_va,
+int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *=
bo_va,
 			bool clear);
 bool amdgpu_vm_evictable(struct amdgpu_bo *bo);
 void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
@@ -527,15 +530,14 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev,
 		     uint64_t addr, uint64_t offset,
 		     uint64_t size, uint64_t flags);
 int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
-			     struct amdgpu_bo_va *bo_va,
-			     uint64_t addr, uint64_t offset,
-			     uint64_t size, uint64_t flags);
-int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
-		       struct amdgpu_bo_va *bo_va,
-		       uint64_t addr);
+			     struct amdgpu_bo_va *bo_va, uint64_t addr,
+			     uint64_t offset, uint64_t size, uint64_t flags,
+			     struct amdgpu_bo_unmap_sync *sync);
+int amdgpu_vm_bo_unmap(struct amdgpu_device *adev, struct amdgpu_bo_va *b=
o_va,
+		       uint64_t addr, struct amdgpu_bo_unmap_sync *sync);
 int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
-				struct amdgpu_vm *vm,
-				uint64_t saddr, uint64_t size);
+				struct amdgpu_vm *vm, uint64_t saddr,
+				uint64_t size, struct amdgpu_bo_unmap_sync *sync);
 struct amdgpu_bo_va_mapping *amdgpu_vm_bo_lookup_mapping(struct amdgpu_vm=
 *vm,
 							 uint64_t addr);
 void amdgpu_vm_bo_trace_cs(struct amdgpu_vm *vm, struct ww_acquire_ctx *t=
icket);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_vm_cpu.c
index 3895bd7d176a..d97d6ab29c5f 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
@@ -46,12 +46,22 @@ static int amdgpu_vm_cpu_map_table(struct amdgpu_bo_vm=
 *table)
  * Negativ errno, 0 for success.
  */
 static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_update_params *p,
+				 struct amdgpu_bo_unmap_sync *sync,
 				 struct dma_resv *resv,
 				 enum amdgpu_sync_mode sync_mode)
 {
-	if (!resv)
+	uint64_t i;
+	int r;
+
+	if (!sync && !resv)
 		return 0;

+	for (i =3D 0; sync && i < sync->wait_fence_count; ++i) {
+		r =3D dma_fence_wait(sync->wait_fences[i], false);
+		if (r)
+			return r;
+	}
+
 	return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, p->vm, true);
 }

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vm_pt.c
index e39d6e7643bf..715c78e9b9bb 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
@@ -403,7 +403,7 @@ int amdgpu_vm_pt_clear(struct amdgpu_device *adev, str=
uct amdgpu_vm *vm,
 	params.vm =3D vm;
 	params.immediate =3D immediate;

-	r =3D vm->update_funcs->prepare(&params, NULL, AMDGPU_SYNC_EXPLICIT);
+	r =3D vm->update_funcs->prepare(&params, NULL, NULL, AMDGPU_SYNC_EXPLICI=
T);
 	if (r)
 		goto exit;

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_vm_sdma.c
index 9b748d7058b5..1d2ba17457ea 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -84,10 +84,12 @@ static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_u=
pdate_params *p,
  * Negativ errno, 0 for success.
  */
 static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
+				  struct amdgpu_bo_unmap_sync *unmap_sync,
 				  struct dma_resv *resv,
 				  enum amdgpu_sync_mode sync_mode)
 {
 	struct amdgpu_sync sync;
+	uint64_t i;
 	int r;

 	r =3D amdgpu_vm_sdma_alloc_job(p, 0);
@@ -98,6 +100,13 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_upd=
ate_params *p,
 		return 0;

 	amdgpu_sync_create(&sync);
+
+	for (i =3D 0; unmap_sync && i < unmap_sync->wait_fence_count; ++i) {
+		r =3D amdgpu_sync_fence(&sync, unmap_sync->wait_fences[i]);
+		if (r)
+			return r;
+	}
+
 	r =3D amdgpu_sync_resv(p->adev, &sync, resv, sync_mode, p->vm);
 	if (!r)
 		r =3D amdgpu_sync_push_to_job(&sync, p->job);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/am=
dkfd/kfd_svm.c
index 10b1a1f64198..09f9e310e838 100644
=2D-- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1282,9 +1282,9 @@ svm_range_unmap_from_gpu(struct amdgpu_device *adev,=
 struct amdgpu_vm *vm,

 	pr_debug("[0x%llx 0x%llx]\n", start, last);

-	return amdgpu_vm_update_range(adev, vm, false, true, true, false, NULL, =
start,
-				      last, init_pte_value, 0, 0, NULL, NULL,
-				      fence);
+	return amdgpu_vm_update_range(adev, vm, false, true, true, false, NULL,
+				      NULL, start, last, init_pte_value, 0, 0,
+				      NULL, NULL, fence);
 }

 static int
@@ -1389,12 +1389,12 @@ svm_range_map_to_gpu(struct kfd_process_device *pd=
d, struct svm_range *prange,
 		 * different memory partition based on fpfn/lpfn, we should use
 		 * same vm_manager.vram_base_offset regardless memory partition.
 		 */
-		r =3D amdgpu_vm_update_range(adev, vm, false, false, flush_tlb, true,
-					   NULL, last_start, prange->start + i,
-					   pte_flags,
-					   (last_start - prange->start) << PAGE_SHIFT,
-					   bo_adev ? bo_adev->vm_manager.vram_base_offset : 0,
-					   NULL, dma_addr, &vm->last_update);
+		r =3D amdgpu_vm_update_range(
+			adev, vm, false, false, flush_tlb, true, NULL, NULL,
+			last_start, prange->start + i, pte_flags,
+			(last_start - prange->start) << PAGE_SHIFT,
+			bo_adev ? bo_adev->vm_manager.vram_base_offset : 0,
+			NULL, dma_addr, &vm->last_update);

 		for (j =3D last_start - prange->start; j <=3D i; j++)
 			dma_addr[j] |=3D last_domain;
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 3e488b0119eb..720f6784cb8b 100644
=2D-- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -577,6 +577,8 @@ struct drm_amdgpu_gem_op {
 #define AMDGPU_VM_MTYPE_RW		(5 << 5)
 /* don't allocate MALL */
 #define AMDGPU_VM_PAGE_NOALLOC		(1 << 9)
+/* use explicit sync fences instead of implicitly syncing */
+#define AMDGPU_VM_EXPLICIT_SYNC		(1 << 10)

 struct drm_amdgpu_gem_va {
 	/** GEM object handle */
@@ -592,6 +594,15 @@ struct drm_amdgpu_gem_va {
 	__u64 offset_in_bo;
 	/** Specify mapping size. Must be correctly aligned. */
 	__u64 map_size;
+	/**
+	 * Number of explicit-sync syncobjs. Ignored if flags does not include
+	 * AMDGPU_VM_EXPLICIT_SYNC.
+	 */
+	__u64 syncobj_count;
+	/** Pointer to an array of syncobj_count timeline points for each syncob=
j. */
+	__u64 sync_points;
+	/** Pointer to an array of DRM syncobj handles to explicitly wait for.. =
*/
+	__u64 syncobjs;
 };

 #define AMDGPU_HW_IP_GFX          0
=2D-
2.46.0

