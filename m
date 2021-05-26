Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EC8391643
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 13:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EF56ECAB;
	Wed, 26 May 2021 11:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF196ECAC;
 Wed, 26 May 2021 11:33:27 +0000 (UTC)
IronPort-SDR: uVN0/D1+1BgUYRbtf4OcZLWtfEvCaNlsLnmxatgBK+SxgfdItjoqIv5rfJk4F7wBj2J0SC51Hh
 0QuF2eb27QuQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="223627290"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="223627290"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 04:33:27 -0700
IronPort-SDR: c41UAX4xL/3nu545ZSztT4mWZTqW8+XMrewrbJOmDO5t+hESgm6cbXPi7l4hUQCQqlceyJbtlN
 BCX6TISXQR4g==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="633457899"
Received: from pegilssx-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.205])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 04:33:25 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 07/15] drm,
 drm/i915: Move the memcpy_from_wc functionality to core drm
Date: Wed, 26 May 2021 13:32:51 +0200
Message-Id: <20210526113259.1661914-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526113259.1661914-1-thomas.hellstrom@linux.intel.com>
References: <20210526113259.1661914-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Memcpy from wc will be used as well by TTM memcpy.
Move it to core drm, and make the interface do the right thing
even on !X86.

Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
v4:
- Fix !X86 path (Reported by Matthew Auld)
---
 drivers/gpu/drm/Makefile                      |  2 +-
 drivers/gpu/drm/drm_drv.c                     |  2 +
 .../drm/{i915/i915_memcpy.c => drm_memcpy.c}  | 63 ++++++++++++-----
 drivers/gpu/drm/i915/Makefile                 |  1 -
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  5 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  7 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 11 +--
 drivers/gpu/drm/i915/i915_cmd_parser.c        |  4 +-
 drivers/gpu/drm/i915/i915_drv.c               |  2 -
 drivers/gpu/drm/i915/i915_gpu_error.c         |  8 +--
 drivers/gpu/drm/i915/i915_memcpy.h            | 34 ----------
 .../drm/i915/selftests/intel_memory_region.c  |  7 +-
 include/drm/drm_memcpy.h                      | 68 +++++++++++++++++++
 14 files changed, 142 insertions(+), 76 deletions(-)
 rename drivers/gpu/drm/{i915/i915_memcpy.c => drm_memcpy.c} (70%)
 delete mode 100644 drivers/gpu/drm/i915/i915_memcpy.h
 create mode 100644 include/drm/drm_memcpy.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index a91cc7684904..f3ab8586c3d7 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -18,7 +18,7 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
 		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
 		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
 		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
-		drm_managed.o drm_vblank_work.o
+		drm_managed.o drm_vblank_work.o drm_memcpy.o \
 
 drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
 			    drm_legacy_misc.o drm_lock.o drm_memory.o drm_scatter.o \
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 3d8d68a98b95..351cc2900cf1 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -40,6 +40,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_memcpy.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_print.h>
 
@@ -1041,6 +1042,7 @@ static int __init drm_core_init(void)
 
 	drm_connector_ida_init();
 	idr_init(&drm_minors_idr);
+	drm_memcpy_init_early();
 
 	ret = drm_sysfs_init();
 	if (ret < 0) {
diff --git a/drivers/gpu/drm/i915/i915_memcpy.c b/drivers/gpu/drm/drm_memcpy.c
similarity index 70%
rename from drivers/gpu/drm/i915/i915_memcpy.c
rename to drivers/gpu/drm/drm_memcpy.c
index 1b021a4902de..740377749caa 100644
--- a/drivers/gpu/drm/i915/i915_memcpy.c
+++ b/drivers/gpu/drm/drm_memcpy.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2016 Intel Corporation
  *
@@ -22,16 +23,12 @@
  *
  */
 
+#ifdef CONFIG_X86
+#include <linux/dma-buf-map.h>
 #include <linux/kernel.h>
 #include <asm/fpu/api.h>
 
-#include "i915_memcpy.h"
-
-#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
-#define CI_BUG_ON(expr) BUG_ON(expr)
-#else
-#define CI_BUG_ON(expr) BUILD_BUG_ON_INVALID(expr)
-#endif
+#include "drm/drm_memcpy.h"
 
 static DEFINE_STATIC_KEY_FALSE(has_movntdqa);
 
@@ -94,23 +91,24 @@ static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len)
 }
 
 /**
- * i915_memcpy_from_wc: perform an accelerated *aligned* read from WC
+ * drm_memcpy_from_wc: perform an accelerated *aligned* read from WC
  * @dst: destination pointer
  * @src: source pointer
  * @len: how many bytes to copy
  *
- * i915_memcpy_from_wc copies @len bytes from @src to @dst using
+ * drm_memcpy_from_wc copies @len bytes from @src to @dst using
  * non-temporal instructions where available. Note that all arguments
  * (@src, @dst) must be aligned to 16 bytes and @len must be a multiple
  * of 16.
  *
  * To test whether accelerated reads from WC are supported, use
- * i915_memcpy_from_wc(NULL, NULL, 0);
+ * drm_memcpy_from_wc(NULL, NULL, 0);
+ * This interface is intended for memremapped memory without the __iomem tag.
  *
  * Returns true if the copy was successful, false if the preconditions
  * are not met.
  */
-bool i915_memcpy_from_wc(void *dst, const void *src, unsigned long len)
+bool drm_memcpy_from_wc(void *dst, const void *src, unsigned long len)
 {
 	if (unlikely(((unsigned long)dst | (unsigned long)src | len) & 15))
 		return false;
@@ -123,24 +121,53 @@ bool i915_memcpy_from_wc(void *dst, const void *src, unsigned long len)
 
 	return false;
 }
+EXPORT_SYMBOL(drm_memcpy_from_wc);
 
 /**
- * i915_unaligned_memcpy_from_wc: perform a mostly accelerated read from WC
+ * drm_memcpy_from_wc_dbm: perform an accelerated *aligned* read from WC with
+ * struct dma_buf_map arguments.
+ * @dst: destination map
+ * @src: source map
+ * @len: how many bytes to copy
+ *
+ * This is identical to drm_memcpy_from_wc, except it's intended for
+ * potentially ioremapped memory rather than memremapped memory.
+ *
+ * Returns true if the copy was successful, false if the preconditions
+ * are not met.
+ */
+bool drm_memcpy_from_wc_dbm(struct dma_buf_map *dst,
+			    const struct dma_buf_map *src,
+			    unsigned long len)
+{
+	/* For X86 we can safely drop __iomem */
+	return drm_memcpy_from_wc(dst->is_iomem ?
+				  (void __force *)dst->vaddr_iomem :
+				  dst->vaddr,
+				  src->is_iomem ?
+				  (void const __force *)src->vaddr_iomem :
+				  src->vaddr,
+				  len);
+}
+EXPORT_SYMBOL(drm_memcpy_from_wc_dbm);
+
+/**
+ * drm_unaligned_memcpy_from_wc: perform a mostly accelerated read from WC
  * @dst: destination pointer
  * @src: source pointer
  * @len: how many bytes to copy
  *
- * Like i915_memcpy_from_wc(), the unaligned variant copies @len bytes from
+ * Like drm_memcpy_from_wc(), the unaligned variant copies @len bytes from
  * @src to @dst using * non-temporal instructions where available, but
  * accepts that its arguments may not be aligned, but are valid for the
  * potential 16-byte read past the end.
+ *
+ * This interface is intended for mremapped memory without the __iomem tag.
  */
-void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len)
+void drm_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len)
 {
 	unsigned long addr;
 
-	CI_BUG_ON(!i915_has_memcpy_from_wc());
-
 	addr = (unsigned long)src;
 	if (!IS_ALIGNED(addr, 16)) {
 		unsigned long x = min(ALIGN(addr, 16) - addr, len);
@@ -155,8 +182,9 @@ void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len
 	if (likely(len))
 		__memcpy_ntdqu(dst, src, DIV_ROUND_UP(len, 16));
 }
+EXPORT_SYMBOL(drm_unaligned_memcpy_from_wc);
 
-void i915_memcpy_init_early(struct drm_i915_private *dev_priv)
+void drm_memcpy_init_early(void)
 {
 	/*
 	 * Some hypervisors (e.g. KVM) don't support VEX-prefix instructions
@@ -166,3 +194,4 @@ void i915_memcpy_init_early(struct drm_i915_private *dev_priv)
 	    !boot_cpu_has(X86_FEATURE_HYPERVISOR))
 		static_branch_enable(&has_movntdqa);
 }
+#endif
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 4f22cac1c49b..ebc19bd5fff4 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -61,7 +61,6 @@ i915-y += i915_drv.o \
 # core library code
 i915-y += \
 	dma_resv_utils.o \
-	i915_memcpy.o \
 	i915_mm.o \
 	i915_sw_fence.o \
 	i915_sw_fence_work.o \
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 297143511f99..77285e421fb8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -10,6 +10,7 @@
 #include <linux/uaccess.h>
 
 #include <drm/drm_syncobj.h>
+#include <drm/drm_memcpy.h>
 
 #include "display/intel_frontbuffer.h"
 
@@ -28,7 +29,6 @@
 #include "i915_sw_fence_work.h"
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
-#include "i915_memcpy.h"
 
 struct eb_vma {
 	struct i915_vma *vma;
@@ -2503,7 +2503,7 @@ static int eb_parse_pipeline(struct i915_execbuffer *eb,
 		!(batch->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ);
 
 	pw->batch_map = ERR_PTR(-ENODEV);
-	if (needs_clflush && i915_has_memcpy_from_wc())
+	if (needs_clflush && drm_has_memcpy_from_wc())
 		pw->batch_map = i915_gem_object_pin_map(batch, I915_MAP_WC);
 
 	if (IS_ERR(pw->batch_map)) {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 5706d471692d..e9247afb0320 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -24,6 +24,8 @@
 
 #include <linux/sched/mm.h>
 
+#include <drm/drm_memcpy.h>
+
 #include "display/intel_frontbuffer.h"
 #include "i915_drv.h"
 #include "i915_gem_clflush.h"
@@ -31,7 +33,6 @@
 #include "i915_gem_mman.h"
 #include "i915_gem_object.h"
 #include "i915_globals.h"
-#include "i915_memcpy.h"
 #include "i915_trace.h"
 
 static struct i915_global_object {
@@ -374,7 +375,7 @@ i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, u64 offset
 				    PAGE_SIZE);
 
 	src_ptr = src_map + offset_in_page(offset);
-	if (!i915_memcpy_from_wc(dst, (void __force *)src_ptr, size))
+	if (!drm_memcpy_from_wc(dst, (void __force *)src_ptr, size))
 		memcpy_fromio(dst, src_ptr, size);
 
 	io_mapping_unmap(src_map);
diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 8784257ec808..92ada67a3835 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -5,9 +5,10 @@
 
 #include <linux/crc32.h>
 
+#include <drm/drm_memcpy.h>
+
 #include "gem/i915_gem_stolen.h"
 
-#include "i915_memcpy.h"
 #include "i915_selftest.h"
 #include "intel_gpu_commands.h"
 #include "selftests/igt_reset.h"
@@ -99,7 +100,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 			memset_io(s, STACK_MAGIC, PAGE_SIZE);
 
 		in = (void __force *)s;
-		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
+		if (drm_memcpy_from_wc(tmp, in, PAGE_SIZE))
 			in = tmp;
 		crc[page] = crc32_le(0, in, PAGE_SIZE);
 
@@ -135,7 +136,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 				      PAGE_SIZE);
 
 		in = (void __force *)s;
-		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
+		if (drm_memcpy_from_wc(tmp, in, PAGE_SIZE))
 			in = tmp;
 		x = crc32_le(0, in, PAGE_SIZE);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index c36d5eb5bbb9..f045e42be6ca 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -5,9 +5,10 @@
 
 #include <linux/debugfs.h>
 
+#include <drm/drm_memcpy.h>
+
 #include "gt/intel_gt.h"
 #include "i915_drv.h"
-#include "i915_memcpy.h"
 #include "intel_guc_log.h"
 
 static void guc_log_capture_logs(struct intel_guc_log *log);
@@ -295,13 +296,13 @@ static void guc_read_update_log_buffer(struct intel_guc_log *log)
 
 		/* Just copy the newly written data */
 		if (read_offset > write_offset) {
-			i915_memcpy_from_wc(dst_data, src_data, write_offset);
+			drm_memcpy_from_wc(dst_data, src_data, write_offset);
 			bytes_to_copy = buffer_size - read_offset;
 		} else {
 			bytes_to_copy = write_offset - read_offset;
 		}
-		i915_memcpy_from_wc(dst_data + read_offset,
-				    src_data + read_offset, bytes_to_copy);
+		drm_memcpy_from_wc(dst_data + read_offset,
+				   src_data + read_offset, bytes_to_copy);
 
 		src_data += buffer_size;
 		dst_data += buffer_size;
@@ -569,7 +570,7 @@ int intel_guc_log_relay_open(struct intel_guc_log *log)
 	 * it should be present on the chipsets supporting GuC based
 	 * submisssions.
 	 */
-	if (!i915_has_memcpy_from_wc()) {
+	if (!drm_has_memcpy_from_wc()) {
 		ret = -ENXIO;
 		goto out_unlock;
 	}
diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
index 5b4b2bd46e7c..98653f1a2b1d 100644
--- a/drivers/gpu/drm/i915/i915_cmd_parser.c
+++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
@@ -24,12 +24,12 @@
  *    Brad Volkin <bradley.d.volkin@intel.com>
  *
  */
+#include <drm/drm_memcpy.h>
 
 #include "gt/intel_engine.h"
 #include "gt/intel_gpu_commands.h"
 
 #include "i915_drv.h"
-#include "i915_memcpy.h"
 
 /**
  * DOC: batch buffer command parser
@@ -1152,7 +1152,7 @@ static u32 *copy_batch(struct drm_i915_gem_object *dst_obj,
 
 	if (src) {
 		GEM_BUG_ON(!needs_clflush);
-		i915_unaligned_memcpy_from_wc(dst, src + offset, length);
+		drm_unaligned_memcpy_from_wc(dst, src + offset, length);
 	} else {
 		struct scatterlist *sg;
 		void *ptr;
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 30c349137be2..68639ed0bdec 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -72,7 +72,6 @@
 #include "i915_drv.h"
 #include "i915_ioc32.h"
 #include "i915_irq.h"
-#include "i915_memcpy.h"
 #include "i915_perf.h"
 #include "i915_query.h"
 #include "i915_suspend.h"
@@ -325,7 +324,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 	mutex_init(&dev_priv->pps_mutex);
 	mutex_init(&dev_priv->hdcp_comp_mutex);
 
-	i915_memcpy_init_early(dev_priv);
 	intel_runtime_pm_init_early(&dev_priv->runtime_pm);
 
 	ret = i915_workqueues_init(dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 8b964e355cb5..7c1b44545bab 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -34,6 +34,7 @@
 #include <linux/utsname.h>
 #include <linux/zlib.h>
 
+#include <drm/drm_memcpy.h>
 #include <drm/drm_print.h>
 
 #include "display/intel_dmc.h"
@@ -46,7 +47,6 @@
 
 #include "i915_drv.h"
 #include "i915_gpu_error.h"
-#include "i915_memcpy.h"
 #include "i915_scatterlist.h"
 
 #define ALLOW_FAIL (GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN)
@@ -255,7 +255,7 @@ static bool compress_init(struct i915_vma_compress *c)
 	}
 
 	c->tmp = NULL;
-	if (i915_has_memcpy_from_wc())
+	if (drm_has_memcpy_from_wc())
 		c->tmp = pool_alloc(&c->pool, ALLOW_FAIL);
 
 	return true;
@@ -295,7 +295,7 @@ static int compress_page(struct i915_vma_compress *c,
 	struct z_stream_s *zstream = &c->zstream;
 
 	zstream->next_in = src;
-	if (wc && c->tmp && i915_memcpy_from_wc(c->tmp, src, PAGE_SIZE))
+	if (wc && c->tmp && drm_memcpy_from_wc(c->tmp, src, PAGE_SIZE))
 		zstream->next_in = c->tmp;
 	zstream->avail_in = PAGE_SIZE;
 
@@ -395,7 +395,7 @@ static int compress_page(struct i915_vma_compress *c,
 	if (!ptr)
 		return -ENOMEM;
 
-	if (!(wc && i915_memcpy_from_wc(ptr, src, PAGE_SIZE)))
+	if (!(wc && drm_memcpy_from_wc(ptr, src, PAGE_SIZE)))
 		memcpy(ptr, src, PAGE_SIZE);
 	dst->pages[dst->page_count++] = ptr;
 	cond_resched();
diff --git a/drivers/gpu/drm/i915/i915_memcpy.h b/drivers/gpu/drm/i915/i915_memcpy.h
deleted file mode 100644
index 3df063a3293b..000000000000
--- a/drivers/gpu/drm/i915/i915_memcpy.h
+++ /dev/null
@@ -1,34 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2019 Intel Corporation
- */
-
-#ifndef __I915_MEMCPY_H__
-#define __I915_MEMCPY_H__
-
-#include <linux/types.h>
-
-struct drm_i915_private;
-
-void i915_memcpy_init_early(struct drm_i915_private *i915);
-
-bool i915_memcpy_from_wc(void *dst, const void *src, unsigned long len);
-void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len);
-
-/* The movntdqa instructions used for memcpy-from-wc require 16-byte alignment,
- * as well as SSE4.1 support. i915_memcpy_from_wc() will report if it cannot
- * perform the operation. To check beforehand, pass in the parameters to
- * to i915_can_memcpy_from_wc() - since we only care about the low 4 bits,
- * you only need to pass in the minor offsets, page-aligned pointers are
- * always valid.
- *
- * For just checking for SSE4.1, in the foreknowledge that the future use
- * will be correctly aligned, just use i915_has_memcpy_from_wc().
- */
-#define i915_can_memcpy_from_wc(dst, src, len) \
-	i915_memcpy_from_wc((void *)((unsigned long)(dst) | (unsigned long)(src) | (len)), NULL, 0)
-
-#define i915_has_memcpy_from_wc() \
-	i915_memcpy_from_wc(NULL, NULL, 0)
-
-#endif /* __I915_MEMCPY_H__ */
diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index c85d516b85cd..6bb399e9be78 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -6,6 +6,8 @@
 #include <linux/prime_numbers.h>
 #include <linux/sort.h>
 
+#include <drm/drm_memcpy.h>
+
 #include "../i915_selftest.h"
 
 #include "mock_drm.h"
@@ -20,7 +22,6 @@
 #include "gem/selftests/mock_context.h"
 #include "gt/intel_engine_user.h"
 #include "gt/intel_gt.h"
-#include "i915_memcpy.h"
 #include "selftests/igt_flush_test.h"
 #include "selftests/i915_random.h"
 
@@ -901,7 +902,7 @@ static inline void igt_memcpy(void *dst, const void *src, size_t size)
 
 static inline void igt_memcpy_from_wc(void *dst, const void *src, size_t size)
 {
-	i915_memcpy_from_wc(dst, src, size);
+	drm_memcpy_from_wc(dst, src, size);
 }
 
 static int _perf_memcpy(struct intel_memory_region *src_mr,
@@ -925,7 +926,7 @@ static int _perf_memcpy(struct intel_memory_region *src_mr,
 		{
 			"memcpy_from_wc",
 			igt_memcpy_from_wc,
-			!i915_has_memcpy_from_wc(),
+			!drm_has_memcpy_from_wc(),
 		},
 	};
 	struct drm_i915_gem_object *src, *dst;
diff --git a/include/drm/drm_memcpy.h b/include/drm/drm_memcpy.h
new file mode 100644
index 000000000000..fe5ed1e89ce6
--- /dev/null
+++ b/include/drm/drm_memcpy.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2019 Intel Corporation
+ */
+
+#ifndef __DRM_MEMCPY_H__
+#define __DRM_MEMCPY_H__
+
+#include <linux/types.h>
+
+struct dma_buf_map;
+
+#ifdef CONFIG_X86
+bool drm_memcpy_from_wc(void *dst, const void *src, unsigned long len);
+bool drm_memcpy_from_wc_dbm(struct dma_buf_map *dst,
+			    const struct dma_buf_map *src,
+			    unsigned long len);
+void drm_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len);
+
+/* The movntdqa instructions used for memcpy-from-wc require 16-byte alignment,
+ * as well as SSE4.1 support. drm_memcpy_from_wc() will report if it cannot
+ * perform the operation. To check beforehand, pass in the parameters to
+ * drm_can_memcpy_from_wc() - since we only care about the low 4 bits,
+ * you only need to pass in the minor offsets, page-aligned pointers are
+ * always valid.
+ *
+ * For just checking for SSE4.1, in the foreknowledge that the future use
+ * will be correctly aligned, just use drm_has_memcpy_from_wc().
+ */
+#define drm_can_memcpy_from_wc(dst, src, len) \
+	drm_memcpy_from_wc((void *)((unsigned long)(dst) | (unsigned long)(src) | (len)), NULL, 0)
+
+#define drm_has_memcpy_from_wc() \
+	drm_memcpy_from_wc(NULL, NULL, 0)
+
+void drm_memcpy_init_early(void);
+
+#else
+
+static inline
+bool drm_memcpy_from_wc(void *dst, const void *src, unsigned long len)
+{
+	return false;
+}
+
+static inline
+bool drm_memcpy_from_wc_dbm(void *dst, const void *src, unsigned long len)
+{
+	return false;
+}
+
+static inline
+bool drm_can_memcpy_from_wc_dbm(void *dst, const void *src, unsigned long len)
+{
+	return false;
+}
+
+static inline
+bool drm_has_memcpy_from_wc(void)
+{
+	return false;
+}
+
+#define drm_has_memcpy_from_wc() (false)
+#define drm_unaligned_memcpy_from_wc(_dst, _src, _len) WARN_ON(1)
+#define drm_memcpy_init_early() do {} while (0)
+#endif /* CONFIG_X86 */
+#endif /* __DRM_MEMCPY_H__ */
-- 
2.31.1

