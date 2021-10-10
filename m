Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C552F428159
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 14:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CAC6E2E1;
	Sun, 10 Oct 2021 12:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66F46E2E1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 12:46:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E49660ED4;
 Sun, 10 Oct 2021 12:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633869998;
 bh=2UYtcWYKruDJ3kPvTT5vj0oEelkbljhEsRjMZNKzb9M=;
 h=From:To:Cc:Subject:Date:From;
 b=nh3GNF+sn1dG6TAnhotS6M2XM/HfxvX41Y/Cqi3qh5aNw5xK5t+6abmd+Fz3K4m7I
 46vjMri5yjs0Bx3mVXF9fqyfU0nQWkmFAEkd6Ua9tzyo95j89sa7AO+Zh+76ifHVcM
 u1KaZyPpORfukTtt+yzhGYKR9+Y6xqIj6+zaV9oQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Xinhui.Pan@amd.com
Cc: linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2] dma-buf: move dma-buf symbols into the DMA_BUF module
 namespace
Date: Sun, 10 Oct 2021 14:46:28 +0200
Message-Id: <20211010124628.17691-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=18219; h=from:subject;
 bh=2UYtcWYKruDJ3kPvTT5vj0oEelkbljhEsRjMZNKzb9M=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDIlJD+aFSyy+X7pta2dOxlRb5TUHly+t3PvrSM8J7e11wln2
 tywWdcSyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBEHm1jWDBJ47by1Kogc4/TnzlWTt
 63Ls5JPpthwbSpZ9/tsdhXtvz2Gh/bIzI7d2c+3gwA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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

In order to better track where in the kernel the dma-buf code is used,
put the symbols in the namespace DMA_BUF and modify all users of the
symbols to properly import the namespace to not break the build at the
same time.

Now the output of modinfo shows the use of these symbols, making it
easier to watch for users over time:

$ modinfo drivers/misc/fastrpc.ko | grep import
import_ns:      DMA_BUF

Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: added lots of acks
    added 2 more drivers that needed the change, as found by Arnd

 drivers/dma-buf/dma-buf.c                     | 34 +++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  3 ++
 drivers/gpu/drm/armada/armada_gem.c           |  2 ++
 drivers/gpu/drm/drm_gem_framebuffer_helper.c  |  3 ++
 drivers/gpu/drm/drm_prime.c                   |  3 ++
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  3 ++
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |  3 ++
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  3 ++
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |  2 ++
 drivers/gpu/drm/tegra/gem.c                   |  3 ++
 drivers/gpu/drm/vmwgfx/ttm_object.c           |  3 ++
 drivers/infiniband/core/umem_dmabuf.c         |  3 ++
 .../media/common/videobuf2/videobuf2-core.c   |  1 +
 .../common/videobuf2/videobuf2-dma-contig.c   |  1 +
 .../media/common/videobuf2/videobuf2-dma-sg.c |  1 +
 .../common/videobuf2/videobuf2-vmalloc.c      |  1 +
 drivers/misc/fastrpc.c                        |  1 +
 .../staging/media/tegra-vde/dmabuf-cache.c    |  3 ++
 drivers/tee/tee_shm.c                         |  3 ++
 drivers/virtio/virtio_dma_buf.c               |  1 +
 drivers/xen/gntdev-dmabuf.c                   |  3 ++
 samples/vfio-mdev/mbochs.c                    |  1 +
 22 files changed, 64 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 63d32261b63f..6c2b5ea828a6 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -610,7 +610,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	module_put(exp_info->owner);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(dma_buf_export);
+EXPORT_SYMBOL_NS_GPL(dma_buf_export, DMA_BUF);
 
 /**
  * dma_buf_fd - returns a file descriptor for the given struct dma_buf
@@ -634,7 +634,7 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 
 	return fd;
 }
-EXPORT_SYMBOL_GPL(dma_buf_fd);
+EXPORT_SYMBOL_NS_GPL(dma_buf_fd, DMA_BUF);
 
 /**
  * dma_buf_get - returns the struct dma_buf related to an fd
@@ -660,7 +660,7 @@ struct dma_buf *dma_buf_get(int fd)
 
 	return file->private_data;
 }
-EXPORT_SYMBOL_GPL(dma_buf_get);
+EXPORT_SYMBOL_NS_GPL(dma_buf_get, DMA_BUF);
 
 /**
  * dma_buf_put - decreases refcount of the buffer
@@ -679,7 +679,7 @@ void dma_buf_put(struct dma_buf *dmabuf)
 
 	fput(dmabuf->file);
 }
-EXPORT_SYMBOL_GPL(dma_buf_put);
+EXPORT_SYMBOL_NS_GPL(dma_buf_put, DMA_BUF);
 
 static void mangle_sg_table(struct sg_table *sg_table)
 {
@@ -810,7 +810,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	dma_buf_detach(dmabuf, attach);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(dma_buf_dynamic_attach);
+EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, DMA_BUF);
 
 /**
  * dma_buf_attach - Wrapper for dma_buf_dynamic_attach
@@ -825,7 +825,7 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 {
 	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
 }
-EXPORT_SYMBOL_GPL(dma_buf_attach);
+EXPORT_SYMBOL_NS_GPL(dma_buf_attach, DMA_BUF);
 
 static void __unmap_dma_buf(struct dma_buf_attachment *attach,
 			    struct sg_table *sg_table,
@@ -871,7 +871,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 
 	kfree(attach);
 }
-EXPORT_SYMBOL_GPL(dma_buf_detach);
+EXPORT_SYMBOL_NS_GPL(dma_buf_detach, DMA_BUF);
 
 /**
  * dma_buf_pin - Lock down the DMA-buf
@@ -901,7 +901,7 @@ int dma_buf_pin(struct dma_buf_attachment *attach)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(dma_buf_pin);
+EXPORT_SYMBOL_NS_GPL(dma_buf_pin, DMA_BUF);
 
 /**
  * dma_buf_unpin - Unpin a DMA-buf
@@ -922,7 +922,7 @@ void dma_buf_unpin(struct dma_buf_attachment *attach)
 	if (dmabuf->ops->unpin)
 		dmabuf->ops->unpin(attach);
 }
-EXPORT_SYMBOL_GPL(dma_buf_unpin);
+EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, DMA_BUF);
 
 /**
  * dma_buf_map_attachment - Returns the scatterlist table of the attachment;
@@ -1012,7 +1012,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 #endif /* CONFIG_DMA_API_DEBUG */
 	return sg_table;
 }
-EXPORT_SYMBOL_GPL(dma_buf_map_attachment);
+EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment, DMA_BUF);
 
 /**
  * dma_buf_unmap_attachment - unmaps and decreases usecount of the buffer;might
@@ -1048,7 +1048,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
 		dma_buf_unpin(attach);
 }
-EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
+EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, DMA_BUF);
 
 /**
  * dma_buf_move_notify - notify attachments that DMA-buf is moving
@@ -1068,7 +1068,7 @@ void dma_buf_move_notify(struct dma_buf *dmabuf)
 		if (attach->importer_ops)
 			attach->importer_ops->move_notify(attach);
 }
-EXPORT_SYMBOL_GPL(dma_buf_move_notify);
+EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);
 
 /**
  * DOC: cpu access
@@ -1212,7 +1212,7 @@ int dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(dma_buf_begin_cpu_access);
+EXPORT_SYMBOL_NS_GPL(dma_buf_begin_cpu_access, DMA_BUF);
 
 /**
  * dma_buf_end_cpu_access - Must be called after accessing a dma_buf from the
@@ -1240,7 +1240,7 @@ int dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(dma_buf_end_cpu_access);
+EXPORT_SYMBOL_NS_GPL(dma_buf_end_cpu_access, DMA_BUF);
 
 
 /**
@@ -1282,7 +1282,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
-EXPORT_SYMBOL_GPL(dma_buf_mmap);
+EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
 
 /**
  * dma_buf_vmap - Create virtual mapping for the buffer object into kernel
@@ -1336,7 +1336,7 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 	mutex_unlock(&dmabuf->lock);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(dma_buf_vmap);
+EXPORT_SYMBOL_NS_GPL(dma_buf_vmap, DMA_BUF);
 
 /**
  * dma_buf_vunmap - Unmap a vmap obtained by dma_buf_vmap.
@@ -1360,7 +1360,7 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 	}
 	mutex_unlock(&dmabuf->lock);
 }
-EXPORT_SYMBOL_GPL(dma_buf_vunmap);
+EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap, DMA_BUF);
 
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 94126dc39688..4f03e0a2953e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -41,6 +41,7 @@
 #include <linux/swiotlb.h>
 #include <linux/dma-buf.h>
 #include <linux/sizes.h>
+#include <linux/module.h>
 
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
@@ -59,6 +60,8 @@
 #include "amdgpu_res_cursor.h"
 #include "bif/bif_4_1_d.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 #define AMDGPU_TTM_VRAM_MAX_DW_READ	(size_t)128
 
 static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 21909642ee4c..711f0cca6f9c 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -15,6 +15,8 @@
 #include "armada_gem.h"
 #include "armada_ioctlP.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 static vm_fault_t armada_gem_vm_fault(struct vm_fault *vmf)
 {
 	struct drm_gem_object *gobj = vmf->vma->vm_private_data;
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 3c75d79dbb65..746fd8c73845 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/slab.h>
+#include <linux/module.h>
 
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fb_helper.h>
@@ -17,6 +18,8 @@
 
 #include "drm_internal.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 #define AFBC_HEADER_SIZE		16
 #define AFBC_TH_LAYOUT_ALIGNMENT	8
 #define AFBC_HDR_ALIGN			64
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index deb23dbec8b5..d8ba95744410 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -29,6 +29,7 @@
 #include <linux/export.h>
 #include <linux/dma-buf.h>
 #include <linux/rbtree.h>
+#include <linux/module.h>
 
 #include <drm/drm.h>
 #include <drm/drm_drv.h>
@@ -39,6 +40,8 @@
 
 #include "drm_internal.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 /**
  * DOC: overview and lifetime rules
  *
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 6d8bed9c739d..6788ea8490d1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -5,10 +5,13 @@
 
 #include <drm/drm_prime.h>
 #include <linux/dma-buf.h>
+#include <linux/module.h>
 
 #include "etnaviv_drv.h"
 #include "etnaviv_gem.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 static struct lock_class_key etnaviv_prime_lock_class;
 
 struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 4396224227d1..0a0c042a3155 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -9,6 +9,7 @@
 #include <linux/dma-buf.h>
 #include <linux/pfn_t.h>
 #include <linux/shmem_fs.h>
+#include <linux/module.h>
 
 #include <drm/drm_prime.h>
 #include <drm/drm_vma_manager.h>
@@ -17,6 +18,8 @@
 #include "exynos_drm_drv.h"
 #include "exynos_drm_gem.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 {
 	struct drm_device *dev = exynos_gem->base.dev;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index afa34111de02..abb854281347 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -7,11 +7,14 @@
 #include <linux/dma-buf.h>
 #include <linux/highmem.h>
 #include <linux/dma-resv.h>
+#include <linux/module.h>
 
 #include "i915_drv.h"
 #include "i915_gem_object.h"
 #include "i915_scatterlist.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 I915_SELFTEST_DECLARE(static bool force_different_devices;)
 
 static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)
diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
index f4cde3a169d8..809f86cfc540 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
@@ -11,6 +11,8 @@
 
 #include "omap_drv.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 /* -----------------------------------------------------------------------------
  * DMABUF Export
  */
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 6ec598f5d5b3..d38fd7e12b57 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -12,6 +12,7 @@
 
 #include <linux/dma-buf.h>
 #include <linux/iommu.h>
+#include <linux/module.h>
 
 #include <drm/drm_drv.h>
 #include <drm/drm_prime.h>
@@ -20,6 +21,8 @@
 #include "drm.h"
 #include "gem.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 static void tegra_bo_put(struct host1x_bo *bo)
 {
 	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
index 04789b2bb2a2..899945f54dc7 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
@@ -48,8 +48,11 @@
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 #include <linux/atomic.h>
+#include <linux/module.h>
 #include "ttm_object.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 /**
  * struct ttm_object_file
  *
diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index e824baf4640d..2d14929543af 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -6,9 +6,12 @@
 #include <linux/dma-buf.h>
 #include <linux/dma-resv.h>
 #include <linux/dma-mapping.h>
+#include <linux/module.h>
 
 #include "uverbs.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 {
 	struct sg_table *sgt;
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 508ac295eb06..773c68dcd158 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2978,3 +2978,4 @@ EXPORT_SYMBOL_GPL(vb2_thread_stop);
 MODULE_DESCRIPTION("Media buffer core framework");
 MODULE_AUTHOR("Pawel Osciak <pawel@osciak.com>, Marek Szyprowski");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(DMA_BUF);
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index a7f61ba85440..9a1a9baca2e4 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -755,3 +755,4 @@ EXPORT_SYMBOL_GPL(vb2_dma_contig_set_max_seg_size);
 MODULE_DESCRIPTION("DMA-contig memory handling routines for videobuf2");
 MODULE_AUTHOR("Pawel Osciak <pawel@osciak.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(DMA_BUF);
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index c5b06a509566..db90ebb8950f 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -666,3 +666,4 @@ EXPORT_SYMBOL_GPL(vb2_dma_sg_memops);
 MODULE_DESCRIPTION("dma scatter/gather memory handling routines for videobuf2");
 MODULE_AUTHOR("Andrzej Pietrasiewicz");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(DMA_BUF);
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
index 83f95258ec8c..fa983897d0e9 100644
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
@@ -444,3 +444,4 @@ EXPORT_SYMBOL_GPL(vb2_vmalloc_memops);
 MODULE_DESCRIPTION("vmalloc memory handling routines for videobuf2");
 MODULE_AUTHOR("Pawel Osciak <pawel@osciak.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(DMA_BUF);
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index beda610e6b30..fa5c067f1c1e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1763,3 +1763,4 @@ static void fastrpc_exit(void)
 module_exit(fastrpc_exit);
 
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(DMA_BUF);
diff --git a/drivers/staging/media/tegra-vde/dmabuf-cache.c b/drivers/staging/media/tegra-vde/dmabuf-cache.c
index a93b317885bf..a98d03419b8f 100644
--- a/drivers/staging/media/tegra-vde/dmabuf-cache.c
+++ b/drivers/staging/media/tegra-vde/dmabuf-cache.c
@@ -12,9 +12,12 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
+#include <linux/module.h>
 
 #include "vde.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 struct tegra_vde_cache_entry {
 	enum dma_data_direction dma_dir;
 	struct dma_buf_attachment *a;
diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 8a9384a64f3e..8a8deb95e918 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -10,8 +10,11 @@
 #include <linux/slab.h>
 #include <linux/tee_drv.h>
 #include <linux/uio.h>
+#include <linux/module.h>
 #include "tee_private.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 static void release_registered_pages(struct tee_shm *shm)
 {
 	if (shm->pages) {
diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
index 5127a2f0c986..2521a75009c3 100644
--- a/drivers/virtio/virtio_dma_buf.c
+++ b/drivers/virtio/virtio_dma_buf.c
@@ -86,3 +86,4 @@ int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf,
 EXPORT_SYMBOL(virtio_dma_buf_get_uuid);
 
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(DMA_BUF);
diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index 4c13cbc99896..12e380db7f55 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
+#include <linux/module.h>
 
 #include <xen/xen.h>
 #include <xen/grant_table.h>
@@ -21,6 +22,8 @@
 #include "gntdev-common.h"
 #include "gntdev-dmabuf.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 #ifndef GRANT_INVALID_REF
 /*
  * Note on usage of grant reference 0 as invalid grant reference:
diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index c313ab4d1f4e..a83be6cd162f 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1493,5 +1493,6 @@ static void __exit mbochs_dev_exit(void)
 	mbochs_class = NULL;
 }
 
+MODULE_IMPORT_NS(DMA_BUF);
 module_init(mbochs_dev_init)
 module_exit(mbochs_dev_exit)
-- 
2.33.0

