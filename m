Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FD3B2C11F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 13:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3CA10E5C1;
	Tue, 19 Aug 2025 11:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00B310E5BD;
 Tue, 19 Aug 2025 11:49:53 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?=27Thomas=20Hellstr=C3=B6m=27?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <dev@lankhorst.se>,
 Maxime Ripard <mripard@kernel.org>, Natalie Vock <natalie.vock@gmx.de>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?q?=27Michal=20Koutn=C3=BD=27?= <mkoutny@suse.com>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "'Liam R . Howlett'" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Michal Hocko <mhocko@suse.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org
Subject: [RFC 3/3] drm/xe: Add DRM_XE_GEM_CREATE_FLAG_PINNED flag and
 implementation
Date: Tue, 19 Aug 2025 13:49:36 +0200
Message-ID: <20250819114932.597600-8-dev@lankhorst.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819114932.597600-5-dev@lankhorst.se>
References: <20250819114932.597600-5-dev@lankhorst.se>
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

Add an option to pin memory through the science of cgroup accounting.
A bo will be pinned for its entire lifetime, and this allows buffers
that are pinned for dma-buf export without requiring the pinning to be
done at the dma-buf layer for all devices.

For now only implement VRAM pinning. Dave Airlie has a series to implement
memcg accounting for the GPU but that is not ready yet.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_bo.c      | 66 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_dma_buf.c | 10 ++++-
 include/uapi/drm/xe_drm.h       | 10 ++++-
 3 files changed, 82 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6fea39842e1e6..4095e6bd04ea9 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -5,6 +5,7 @@
 
 #include "xe_bo.h"
 
+#include <linux/cgroup_dmem.h>
 #include <linux/dma-buf.h>
 #include <linux/nospec.h>
 
@@ -208,7 +209,8 @@ static bool force_contiguous(u32 bo_flags)
 	 * must be contiguous, also only contiguous BOs support xe_bo_vmap.
 	 */
 	return bo_flags & XE_BO_FLAG_NEEDS_CPU_ACCESS &&
-	       bo_flags & XE_BO_FLAG_PINNED;
+	       bo_flags & XE_BO_FLAG_PINNED &&
+	       !(bo_flags & XE_BO_FLAG_USER);
 }
 
 static void add_vram(struct xe_device *xe, struct xe_bo *bo,
@@ -1697,6 +1699,16 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
 	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
 }
 
+static void xe_bo_unpin_user(struct xe_bo *bo)
+{
+	xe_bo_unpin_external(bo);
+
+	if (bo->flags & XE_BO_FLAG_SYSTEM)
+		WARN_ON(1);
+	else
+		dmem_cgroup_unpin(bo->ttm.resource->css, xe_bo_size(bo));
+}
+
 static void xe_gem_object_close(struct drm_gem_object *obj,
 				struct drm_file *file_priv)
 {
@@ -1708,6 +1720,10 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
 		xe_bo_lock(bo, false);
 		ttm_bo_set_bulk_move(&bo->ttm, NULL);
 		xe_bo_unlock(bo);
+	} else if (bo->flags & XE_BO_FLAG_PINNED) {
+		xe_bo_lock(bo, false);
+		xe_bo_unpin_user(bo);
+		xe_bo_unlock(bo);
 	}
 }
 
@@ -2128,8 +2144,27 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
 	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
 						 cpu_caching, ttm_bo_type_device,
 						 flags | XE_BO_FLAG_USER, 0);
-	if (!IS_ERR(bo))
+	if (!IS_ERR(bo)) {
+		int ret = 0;
+
+		if (bo->flags & XE_BO_FLAG_PINNED) {
+			if (bo->flags & XE_BO_FLAG_SYSTEM) {
+				ret = -ENOSYS; // TODO
+			} else {
+				ret = dmem_cgroup_try_pin(bo->ttm.resource->css, size);
+			}
+			if (!ret)
+				ret = xe_bo_pin_external(bo);
+			else if (ret == -EAGAIN)
+				ret = -ENOSPC;
+		}
+
 		xe_bo_unlock_vm_held(bo);
+		if (ret) {
+			xe_bo_put(bo);
+			return ERR_PTR(ret);
+		}
+	}
 
 	return bo;
 }
@@ -2745,6 +2780,28 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 			 args->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB))
 		return -EINVAL;
 
+	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_GEM_CREATE_FLAG_PINNED)) {
+		bool pinned_flag = true;
+		/* Only allow a single placement for pinning */
+		if (XE_IOCTL_DBG(xe, pinned_flag && hweight32(args->placement) != 1))
+			return -EINVAL;
+
+		/* Meant for exporting, do not allow a VM-local BO */
+		if (XE_IOCTL_DBG(xe, pinned_flag && args->vm_id))
+			return -EINVAL;
+
+		/* Similarly, force fail at creation time for now. We may relax this requirement later */
+		if (XE_IOCTL_DBG(xe, pinned_flag && args->flags & DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING))
+			return -EINVAL;
+
+		/* Require the appropriate cgroups to be enabled. */
+		if (XE_IOCTL_DBG(xe, pinned_flag && !IS_ENABLED(CONFIG_CGROUP_DMEM) && bo_flags & XE_BO_FLAG_VRAM_MASK) ||
+		    XE_IOCTL_DBG(xe, pinned_flag && !IS_ENABLED(CONFIG_MEMCG) && bo_flags & XE_BO_FLAG_SYSTEM))
+			return -EINVAL;
+
+		bo_flags |= XE_BO_FLAG_PINNED;
+	}
+
 	if (args->vm_id) {
 		vm = xe_vm_lookup(xef, args->vm_id);
 		if (XE_IOCTL_DBG(xe, !vm))
@@ -2790,6 +2847,11 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		__xe_bo_unset_bulk_move(bo);
 		xe_vm_unlock(vm);
 	}
+	if (bo->flags & XE_BO_FLAG_PINNED) {
+		xe_bo_lock(bo, false);
+		xe_bo_unpin_user(bo);
+		xe_bo_unlock(bo);
+	}
 out_put:
 	xe_bo_put(bo);
 out_vm:
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 346f857f38374..6719f4552ad37 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -53,6 +53,11 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 	struct xe_device *xe = xe_bo_device(bo);
 	int ret;
 
+	if (bo->flags & XE_BO_FLAG_PINNED) {
+		ttm_bo_pin(&bo->ttm);
+		return 0;
+	}
+
 	/*
 	 * For now only support pinning in TT memory, for two reasons:
 	 * 1) Avoid pinning in a placement not accessible to some importers.
@@ -83,7 +88,10 @@ static void xe_dma_buf_unpin(struct dma_buf_attachment *attach)
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 
-	xe_bo_unpin_external(bo);
+	if (bo->flags & XE_BO_FLAG_PINNED)
+		ttm_bo_unpin(&bo->ttm);
+	else
+		xe_bo_unpin_external(bo);
 }
 
 static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index c721e130c1d2d..3184fa38ce17e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -765,12 +765,15 @@ struct drm_xe_device_query {
  *    until the object is either bound to a virtual memory region via
  *    VM_BIND or accessed by the CPU. As a result, no backing memory is
  *    reserved at the time of GEM object creation.
- *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
+ *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT - GEM object will be used
+ *    display framebuffer.
  *  - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using VRAM as a
  *    possible placement, ensure that the corresponding VRAM allocation
  *    will always use the CPU accessible part of VRAM. This is important
  *    for small-bar systems (on full-bar systems this gets turned into a
  *    noop).
+ *  - %DRM_XE_GEM_CREATE_FLAG_PINNED - Pin the backing memory permanently
+ *    on allocation, if withing cgroups limits.
  *    Note1: System memory can be used as an extra placement if the kernel
  *    should spill the allocation to system memory, if space can't be made
  *    available in the CPU accessible part of VRAM (giving the same
@@ -781,6 +784,10 @@ struct drm_xe_device_query {
  *    need to use VRAM for display surfaces, therefore the kernel requires
  *    setting this flag for such objects, otherwise an error is thrown on
  *    small-bar systems.
+ *    Note3: %DRM_XE_GEM_CREATE_FLAG_PINNED requires the BO to have only
+ *    a single placement, no vm_id, requires (device) memory cgroups enabled,
+ *    and is incompatible with the %DEFER_BACKING and %NEEDS_VISIBLE_VRAM
+ *    flags.
  *
  * @cpu_caching supports the following values:
  *  - %DRM_XE_GEM_CPU_CACHING_WB - Allocate the pages with write-back
@@ -827,6 +834,7 @@ struct drm_xe_gem_create {
 #define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
 #define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
 #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
+#define DRM_XE_GEM_CREATE_FLAG_PINNED			(1 << 3)
 	/**
 	 * @flags: Flags, currently a mask of memory instances of where BO can
 	 * be placed
-- 
2.50.0

