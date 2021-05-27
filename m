Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA373392AAF
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 11:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70A86E049;
	Thu, 27 May 2021 09:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB4288E6B;
 Thu, 27 May 2021 09:25:00 +0000 (UTC)
IronPort-SDR: SZXMTVQ8T9DGCblxR5WnIhK/HmbCLwGZHxMRNHN7wBFmqGisgQ1lj8vB41oX+X0DJGx3d9OLJX
 q2dHP2rkfa3w==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202453314"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="202453314"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 02:24:59 -0700
IronPort-SDR: e+q3MlJwmPir6u+wHXqD7tBGc4NIIHPHPlaAEBeOdFXM4MYd835ud7+SC+Kg/tSygP0zX0ULYX
 YREEmhq/DNsw==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="477409475"
Received: from ibanaga-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.58])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 02:24:57 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Add a prefetching memcpy_from_wc
Date: Thu, 27 May 2021 11:24:47 +0200
Message-Id: <20210527092447.1842209-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reading out of write-combining mapped memory is typically very slow
since the CPU doesn't prefetch. However some archs have special
instructions to do this.

So add a best-effort memcpy_from_wc taking dma-buf-map pointer
arguments that attempts to use a fast prefetching memcpy and
otherwise falls back to ordinary memcopies, taking the iomem tagging
into account.

The code is largely copied from i915_memcpy_from_wc.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Christian König <christian.koenig@amd.com>
Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 Documentation/gpu/drm-mm.rst |   2 +-
 drivers/gpu/drm/drm_cache.c  | 208 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_drv.c    |   2 +
 include/drm/drm_cache.h      |   7 ++
 4 files changed, 218 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 21be6deadc12..c66058c5bce7 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -469,7 +469,7 @@ DRM MM Range Allocator Function References
 .. kernel-doc:: drivers/gpu/drm/drm_mm.c
    :export:
 
-DRM Cache Handling
+DRM Cache Handling and Fast WC memcpy()
 ==================
 
 .. kernel-doc:: drivers/gpu/drm/drm_cache.c
diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 79a50ef1250f..27b834089f8c 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -28,6 +28,7 @@
  * Authors: Thomas Hellström <thomas-at-tungstengraphics-dot-com>
  */
 
+#include <linux/dma-buf-map.h>
 #include <linux/export.h>
 #include <linux/highmem.h>
 #include <linux/mem_encrypt.h>
@@ -35,6 +36,9 @@
 
 #include <drm/drm_cache.h>
 
+/* A small bounce buffer that fits on the stack. */
+#define MEMCPY_BOUNCE_SIZE 128
+
 #if defined(CONFIG_X86)
 #include <asm/smp.h>
 
@@ -209,3 +213,207 @@ bool drm_need_swiotlb(int dma_bits)
 	return max_iomem > ((u64)1 << dma_bits);
 }
 EXPORT_SYMBOL(drm_need_swiotlb);
+
+#ifdef CONFIG_X86
+
+static DEFINE_STATIC_KEY_FALSE(has_movntdqa);
+
+static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len)
+{
+	kernel_fpu_begin();
+
+	while (len >= 4) {
+		asm("movntdqa	(%0), %%xmm0\n"
+		    "movntdqa 16(%0), %%xmm1\n"
+		    "movntdqa 32(%0), %%xmm2\n"
+		    "movntdqa 48(%0), %%xmm3\n"
+		    "movaps %%xmm0,   (%1)\n"
+		    "movaps %%xmm1, 16(%1)\n"
+		    "movaps %%xmm2, 32(%1)\n"
+		    "movaps %%xmm3, 48(%1)\n"
+		    :: "r" (src), "r" (dst) : "memory");
+		src += 64;
+		dst += 64;
+		len -= 4;
+	}
+	while (len--) {
+		asm("movntdqa (%0), %%xmm0\n"
+		    "movaps %%xmm0, (%1)\n"
+		    :: "r" (src), "r" (dst) : "memory");
+		src += 16;
+		dst += 16;
+	}
+
+	kernel_fpu_end();
+}
+
+static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len)
+{
+	kernel_fpu_begin();
+
+	while (len >= 4) {
+		asm("movntdqa	(%0), %%xmm0\n"
+		    "movntdqa 16(%0), %%xmm1\n"
+		    "movntdqa 32(%0), %%xmm2\n"
+		    "movntdqa 48(%0), %%xmm3\n"
+		    "movups %%xmm0,   (%1)\n"
+		    "movups %%xmm1, 16(%1)\n"
+		    "movups %%xmm2, 32(%1)\n"
+		    "movups %%xmm3, 48(%1)\n"
+		    :: "r" (src), "r" (dst) : "memory");
+		src += 64;
+		dst += 64;
+		len -= 4;
+	}
+	while (len--) {
+		asm("movntdqa (%0), %%xmm0\n"
+		    "movups %%xmm0, (%1)\n"
+		    :: "r" (src), "r" (dst) : "memory");
+		src += 16;
+		dst += 16;
+	}
+
+	kernel_fpu_end();
+}
+
+/**
+ * __drm_unaligned_memcpy_from_wc: perform a mostly accelerated read from WC
+ * @dst: destination pointer
+ * @src: source pointer
+ * @len: how many bytes to copy
+ *
+ * Like drm_memcpy_from_wc(), the unaligned variant copies @len bytes from
+ * @src to @dst using * non-temporal instructions where available, but
+ * accepts that its arguments may not be aligned, but are valid for the
+ * potential 16-byte read past the end.
+ *
+ */
+static void __drm_unaligned_memcpy_from_wc(void *dst, const void *src,
+					   unsigned long len)
+{
+	unsigned long addr;
+
+	addr = (unsigned long)src;
+	if (!IS_ALIGNED(addr, 16)) {
+		unsigned long x = min(ALIGN(addr, 16) - addr, len);
+
+		memcpy(dst, src, x);
+
+		len -= x;
+		dst += x;
+		src += x;
+	}
+
+	if (likely(len))
+		__memcpy_ntdqu(dst, src, DIV_ROUND_UP(len, 16));
+}
+
+/**
+ * __drm_memcpy_from_wc: perform an accelerated *aligned* read from WC
+ * @dst: destination pointer
+ * @src: source pointer
+ * @len: how many bytes to copy
+ *
+ * drm_memcpy_from_wc copies @len bytes from @src to @dst using
+ * non-temporal instructions where available. Note that all arguments
+ * (@src, @dst) must be aligned to 16 bytes and @len must be a multiple
+ * of 16.
+ *
+ * To test whether accelerated reads from WC are supported, use
+ * drm_memcpy_from_wc(NULL, NULL, 0);
+ * This interface is intended for memremapped memory without the __iomem tag.
+ *
+ * Returns true if the copy was successful, false if the preconditions
+ * are not met.
+ */
+static void __drm_memcpy_from_wc(void *dst, const void *src, unsigned long len)
+{
+	if (unlikely(((unsigned long)dst | (unsigned long)src | len) & 15))
+		__drm_unaligned_memcpy_from_wc(dst, src, len);
+	else if (likely(len))
+		__memcpy_ntdqa(dst, src, len >> 4);
+}
+#endif
+
+static void memcpy_fallback(struct dma_buf_map *dst,
+			    const struct dma_buf_map *src,
+			    unsigned long len)
+{
+	if (!dst->is_iomem && !src->is_iomem) {
+		memcpy(dst->vaddr, src->vaddr, len);
+	} else if (!src->is_iomem) {
+		dma_buf_map_memcpy_to(dst, src->vaddr, len);
+	} else if (!dst->is_iomem) {
+		memcpy_fromio(dst->vaddr, src->vaddr_iomem, len);
+	} else {
+		/*
+		 * Bounce size is not performance tuned, but using a
+		 * bounce buffer like this is significantly faster than
+		 * resorting to ioreadxx() + iowritexx().
+		 */
+		char bounce[MEMCPY_BOUNCE_SIZE];
+		void __iomem *_src = src->vaddr_iomem;
+		void __iomem *_dst = dst->vaddr_iomem;
+
+		while (len >= MEMCPY_BOUNCE_SIZE) {
+			memcpy_fromio(bounce, _src, MEMCPY_BOUNCE_SIZE);
+			memcpy_toio(_dst, bounce, MEMCPY_BOUNCE_SIZE);
+			_src += MEMCPY_BOUNCE_SIZE;
+			_dst += MEMCPY_BOUNCE_SIZE;
+			len -= MEMCPY_BOUNCE_SIZE;
+		}
+		if (len) {
+			memcpy_fromio(bounce, _src, MEMCPY_BOUNCE_SIZE);
+			memcpy_toio(_dst, bounce, MEMCPY_BOUNCE_SIZE);
+		}
+	}
+}
+
+/**
+ * drm_memcpy_from_wc - Perform the fastest available memcpy from a source
+ * that may be WC.
+ * @dst: The destination pointer
+ * @src: The source pointer
+ * @len: The size of the area o transfer in bytes
+ *
+ * Tries an arch optimized memcpy for prefetching reading out of a WC region,
+ * and if no such beast is available, falls back to a normal memcpy.
+ */
+void drm_memcpy_from_wc(struct dma_buf_map *dst,
+			const struct dma_buf_map *src,
+			unsigned long len)
+{
+	if (IS_ENABLED(CONFIG_X86) && static_branch_likely(&has_movntdqa)) {
+		__drm_memcpy_from_wc(dst->is_iomem ?
+				     (void __force *)dst->vaddr_iomem :
+				     dst->vaddr,
+				     src->is_iomem ?
+				     (void const __force *)src->vaddr_iomem :
+				     src->vaddr,
+				     len);
+		return;
+	}
+
+	memcpy_fallback(dst, src, len);
+}
+EXPORT_SYMBOL(drm_memcpy_from_wc);
+
+#ifdef CONFIG_X86
+/**
+ * drm_memcpy_init_early - One time initialization of the WC memcpy code
+ */
+void drm_memcpy_init_early(void)
+{
+	/*
+	 * Some hypervisors (e.g. KVM) don't support VEX-prefix instructions
+	 * emulation. So don't enable movntdqa in hypervisor guest.
+	 */
+	if (static_cpu_has(X86_FEATURE_XMM4_1) &&
+	    !boot_cpu_has(X86_FEATURE_HYPERVISOR))
+		static_branch_enable(&has_movntdqa);
+}
+#else
+void drm_memcpy_init_early(void)
+{
+}
+#endif
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 3d8d68a98b95..8804ec7d3215 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -35,6 +35,7 @@
 #include <linux/slab.h>
 #include <linux/srcu.h>
 
+#include <drm/drm_cache.h>
 #include <drm/drm_client.h>
 #include <drm/drm_color_mgmt.h>
 #include <drm/drm_drv.h>
@@ -1041,6 +1042,7 @@ static int __init drm_core_init(void)
 
 	drm_connector_ida_init();
 	idr_init(&drm_minors_idr);
+	drm_memcpy_init_early();
 
 	ret = drm_sysfs_init();
 	if (ret < 0) {
diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
index e9ad4863d915..cc9de1632dd3 100644
--- a/include/drm/drm_cache.h
+++ b/include/drm/drm_cache.h
@@ -35,6 +35,8 @@
 
 #include <linux/scatterlist.h>
 
+struct dma_buf_map;
+
 void drm_clflush_pages(struct page *pages[], unsigned long num_pages);
 void drm_clflush_sg(struct sg_table *st);
 void drm_clflush_virt_range(void *addr, unsigned long length);
@@ -70,4 +72,9 @@ static inline bool drm_arch_can_wc_memory(void)
 #endif
 }
 
+void drm_memcpy_init_early(void);
+
+void drm_memcpy_from_wc(struct dma_buf_map *dst,
+			const struct dma_buf_map *src,
+			unsigned long len);
 #endif
-- 
2.31.1

