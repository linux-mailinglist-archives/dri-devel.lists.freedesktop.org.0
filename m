Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EDF4AE1F0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 20:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27DC10E447;
	Tue,  8 Feb 2022 19:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F026210E3EA;
 Tue,  8 Feb 2022 19:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644347517; x=1675883517;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s+xe3DzxhqcQ004vDPfF46wIvCa5alI3hdd8i77bSLY=;
 b=k+rHRoORKmQHvq7d/mpxcePv1Mbm9ZnjRr1PqiHw2yD43CMGt/CLhpZo
 0epggUCuBMt4Q2mbiPOejDP/eV0TohAkThtnPpKFiNPTnLz3q9lQvDj54
 Q+2NJFPWSUYmliaOikqpXIj8il2fqWUYRsfEf/0CmWA8zj+9T5dCRpo/Q
 qu0ol3Zg4muB8F4E008k5wSzqcdAl+S0fgtqJsWnjIPbesb9ZCmHwuDqL
 eNvullCh/7QzqMsq7wQQ2Lu9bpAHPrtBSVbztr2X8fK7D0Rrel8pJwprg
 0yLjffQLv+OcE9sGSc7e59BhU4hghGHPgjCc95z33H6ShszAQVX68Wc3B g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="232595341"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="232595341"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 11:11:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="773225642"
Received: from ymtarple-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.231.100])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 11:11:55 -0800
Date: Tue, 8 Feb 2022 11:11:55 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/1] drm/i915: Add fallback inside
 memcpy_from_wc functions
Message-ID: <20220208191155.xrgpbqqounobyesz@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220207161308.447676-1-balasubramani.vivekanandan@intel.com>
 <20220207161308.447676-2-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220207161308.447676-2-balasubramani.vivekanandan@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 07, 2022 at 09:43:08PM +0530, Balasubramani Vivekanandan wrote:
>memcpy_from_wc functions can fail if SSE4.1 is not supported or the
>supplied addresses are not 16-byte aligned. It was then upto to the
>caller to use memcpy as fallback.
>Now fallback to memcpy is implemented inside memcpy_from_wc functions
>relieving the user from checking the return value of i915_memcpy_from_wc
>and doing fallback.
>
>When doing copying from io memory address memcpy_fromio should be used
>as fallback. So a new function is added to the family of memcpy_to_wc
>functions which should be used while copying from io memory.
>
>This change is implemented also with an intention to perpare for porting
>memcpy_from_wc code to ARM64. Since SSE4.1 is not valid for ARM,
>accelerated reads will not be supported and the driver should rely on
>fallback always.
>So there would be few more places in the code where fallback should be
>introduced. For e.g. GuC log relay is currently not using fallback since
>a GPU supporting GuC submission will mostly have SSE4.1 enabled CPU.
>This is no more valid with Discrete GPU and with enabling support for
>ARM64.
>With fallback moved inside memcpy_from_wc function, call sites would
>look neat and fallback can be implemented in a uniform way.
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/i915/gem/i915_gem_object.c |  5 +-
> drivers/gpu/drm/i915/gt/selftest_reset.c   |  8 ++-
> drivers/gpu/drm/i915/i915_gpu_error.c      |  9 ++-
> drivers/gpu/drm/i915/i915_memcpy.c         | 78 ++++++++++++++++------
> drivers/gpu/drm/i915/i915_memcpy.h         | 18 ++---
> 5 files changed, 78 insertions(+), 40 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>index e03e362d320b..e187c4bfb7e4 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>@@ -444,7 +444,7 @@ static void
> i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
> {
> 	void __iomem *src_map;
>-	void __iomem *src_ptr;
>+	const void __iomem *src_ptr;
> 	dma_addr_t dma = i915_gem_object_get_dma_address(obj, offset >> PAGE_SHIFT);
>
> 	src_map = io_mapping_map_wc(&obj->mm.region->iomap,
>@@ -452,8 +452,7 @@ i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, u64 offset
> 				    PAGE_SIZE);
>
> 	src_ptr = src_map + offset_in_page(offset);
>-	if (!i915_memcpy_from_wc(dst, (void __force *)src_ptr, size))
>-		memcpy_fromio(dst, src_ptr, size);
>+	i915_io_memcpy_from_wc(dst, src_ptr, size);

nitpick, but maybe to align with the memcpy_fromio() API this would
better be named i915_memcpy_fromio_wc()?

>
> 	io_mapping_unmap(src_map);
> }
>diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
>index 37c38bdd5f47..64b8521a8b28 100644
>--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
>+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
>@@ -99,8 +99,10 @@ __igt_reset_stolen(struct intel_gt *gt,
> 			memset_io(s, STACK_MAGIC, PAGE_SIZE);
>
> 		in = (void __force *)s;
>-		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
>+		if (i915_can_memcpy_from_wc(tmp, in, PAGE_SIZE)) {
>+			i915_io_memcpy_from_wc(tmp, in, PAGE_SIZE);
> 			in = tmp;
>+		}
> 		crc[page] = crc32_le(0, in, PAGE_SIZE);
>
> 		io_mapping_unmap(s);
>@@ -135,8 +137,10 @@ __igt_reset_stolen(struct intel_gt *gt,
> 				      PAGE_SIZE);
>
> 		in = (void __force *)s;
>-		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
>+		if (i915_can_memcpy_from_wc(tmp, in, PAGE_SIZE)) {
>+			i915_io_memcpy_from_wc(tmp, in, PAGE_SIZE);

but you removed __iomem above

> 			in = tmp;
>+		}
> 		x = crc32_le(0, in, PAGE_SIZE);
>
> 		if (x != crc[page] &&
>diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
>index 127ff56c8ce6..2c14a28cbbbb 100644
>--- a/drivers/gpu/drm/i915/i915_gpu_error.c
>+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>@@ -297,8 +297,10 @@ static int compress_page(struct i915_vma_compress *c,
> 	struct z_stream_s *zstream = &c->zstream;
>
> 	zstream->next_in = src;
>-	if (wc && c->tmp && i915_memcpy_from_wc(c->tmp, src, PAGE_SIZE))
>+	if (wc && c->tmp && i915_can_memcpy_from_wc(c->tmp, src, PAGE_SIZE)) {
>+		i915_io_memcpy_from_wc(c->tmp, (const void __iomem *)src, PAGE_SIZE);
> 		zstream->next_in = c->tmp;
>+	}
> 	zstream->avail_in = PAGE_SIZE;
>
> 	do {
>@@ -397,8 +399,11 @@ static int compress_page(struct i915_vma_compress *c,
> 	if (!ptr)
> 		return -ENOMEM;
>
>-	if (!(wc && i915_memcpy_from_wc(ptr, src, PAGE_SIZE)))
>+	if (wc)
>+		i915_io_memcpy_from_wc(ptr, src, PAGE_SIZE);
>+	else
> 		memcpy(ptr, src, PAGE_SIZE);
>+
> 	list_add_tail(&virt_to_page(ptr)->lru, &dst->page_list);
> 	cond_resched();
>
>diff --git a/drivers/gpu/drm/i915/i915_memcpy.c b/drivers/gpu/drm/i915/i915_memcpy.c
>index 1b021a4902de..4d9fbf3b2614 100644
>--- a/drivers/gpu/drm/i915/i915_memcpy.c
>+++ b/drivers/gpu/drm/i915/i915_memcpy.c
>@@ -24,15 +24,10 @@
>
> #include <linux/kernel.h>
> #include <asm/fpu/api.h>
>+#include <linux/io.h>
>
> #include "i915_memcpy.h"
>
>-#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
>-#define CI_BUG_ON(expr) BUG_ON(expr)
>-#else
>-#define CI_BUG_ON(expr) BUILD_BUG_ON_INVALID(expr)
>-#endif
>-
> static DEFINE_STATIC_KEY_FALSE(has_movntdqa);
>
> static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len)
>@@ -93,6 +88,26 @@ static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len)
> 	kernel_fpu_end();
> }
>
>+/* The movntdqa instructions used for memcpy-from-wc require 16-byte alignment,
>+ * as well as SSE4.1 support. To check beforehand, pass in the parameters to
>+ * i915_can_memcpy_from_wc() - since we only care about the low 4 bits,
>+ * you only need to pass in the minor offsets, page-aligned pointers are
>+ * always valid.
>+ *
>+ * For just checking for SSE4.1, in the foreknowledge that the future use
>+ * will be correctly aligned, just use i915_has_memcpy_from_wc().
>+ */
>+bool i915_can_memcpy_from_wc(void *dst, const void *src, unsigned long len)
>+{
>+	if (unlikely(((unsigned long)dst | (unsigned long)src | len) & 15))
>+		return false;
>+
>+	if (static_branch_likely(&has_movntdqa))
>+		return true;
>+
>+	return false;
>+}
>+
> /**
>  * i915_memcpy_from_wc: perform an accelerated *aligned* read from WC
>  * @dst: destination pointer
>@@ -104,24 +119,18 @@ static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len)
>  * (@src, @dst) must be aligned to 16 bytes and @len must be a multiple
>  * of 16.
>  *
>- * To test whether accelerated reads from WC are supported, use
>- * i915_memcpy_from_wc(NULL, NULL, 0);
>- *
>- * Returns true if the copy was successful, false if the preconditions
>- * are not met.
>+ * If the acccelerated read from WC is not possible fallback to memcpy
>  */
>-bool i915_memcpy_from_wc(void *dst, const void *src, unsigned long len)
>+void i915_memcpy_from_wc(void *dst, const void *src, unsigned long len)
> {
>-	if (unlikely(((unsigned long)dst | (unsigned long)src | len) & 15))
>-		return false;
>-
>-	if (static_branch_likely(&has_movntdqa)) {
>+	if (i915_can_memcpy_from_wc(dst, src, len)) {
> 		if (likely(len))
> 			__memcpy_ntdqa(dst, src, len >> 4);
>-		return true;
>+		return;
> 	}
>
>-	return false;
>+	/* Fallback */
>+	memcpy(dst, src, len);
> }
>
> /**
>@@ -134,12 +143,15 @@ bool i915_memcpy_from_wc(void *dst, const void *src, unsigned long len)
>  * @src to @dst using * non-temporal instructions where available, but
>  * accepts that its arguments may not be aligned, but are valid for the
>  * potential 16-byte read past the end.
>+ *
>+ * Fallback to memcpy if accelerated read is not supported
>  */
> void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len)
> {
> 	unsigned long addr;
>
>-	CI_BUG_ON(!i915_has_memcpy_from_wc());
>+	if (!i915_has_memcpy_from_wc())
>+		goto fallback;
>
> 	addr = (unsigned long)src;
> 	if (!IS_ALIGNED(addr, 16)) {
>@@ -154,6 +166,34 @@ void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len
>
> 	if (likely(len))
> 		__memcpy_ntdqu(dst, src, DIV_ROUND_UP(len, 16));
>+
>+	return;
>+
>+fallback:
>+	memcpy(dst, src, len);
>+}
>+
>+/**
>+ * i915_io_memcpy_from_wc: perform an accelerated *aligned* read from WC
>+ * @dst: destination pointer
>+ * @src: source pointer
>+ * @len: how many bytes to copy
>+ *
>+ * To be used when the when copying from io memory.
>+ *
>+ * memcpy_fromio() is used as fallback otherewise no difference to
>+ * i915_memcpy_from_wc()
>+ */
>+void i915_io_memcpy_from_wc(void *dst, const void __iomem *src, unsigned long len)
>+{
>+	if (i915_can_memcpy_from_wc(dst, (const void __force *)src, len)) {
>+		if (likely(len))
>+			__memcpy_ntdqa(dst, (const void __force *)src, len >> 4);
>+		return;
>+	}
>+
>+	/* Fallback */
>+	memcpy_fromio(dst, src, len);
> }
>
> void i915_memcpy_init_early(struct drm_i915_private *dev_priv)
>diff --git a/drivers/gpu/drm/i915/i915_memcpy.h b/drivers/gpu/drm/i915/i915_memcpy.h
>index 3df063a3293b..93ea9295e28c 100644
>--- a/drivers/gpu/drm/i915/i915_memcpy.h
>+++ b/drivers/gpu/drm/i915/i915_memcpy.h
>@@ -12,23 +12,13 @@ struct drm_i915_private;
>
> void i915_memcpy_init_early(struct drm_i915_private *i915);
>
>-bool i915_memcpy_from_wc(void *dst, const void *src, unsigned long len);
>+void i915_memcpy_from_wc(void *dst, const void *src, unsigned long len);
> void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len);
>+void i915_io_memcpy_from_wc(void *dst, const void __iomem *src, unsigned long len);
>
>-/* The movntdqa instructions used for memcpy-from-wc require 16-byte alignment,
>- * as well as SSE4.1 support. i915_memcpy_from_wc() will report if it cannot
>- * perform the operation. To check beforehand, pass in the parameters to
>- * to i915_can_memcpy_from_wc() - since we only care about the low 4 bits,
>- * you only need to pass in the minor offsets, page-aligned pointers are
>- * always valid.
>- *
>- * For just checking for SSE4.1, in the foreknowledge that the future use
>- * will be correctly aligned, just use i915_has_memcpy_from_wc().
>- */
>-#define i915_can_memcpy_from_wc(dst, src, len) \
>-	i915_memcpy_from_wc((void *)((unsigned long)(dst) | (unsigned long)(src) | (len)), NULL, 0)
>+bool i915_can_memcpy_from_wc(void *dst, const void *src, unsigned long len);
>
> #define i915_has_memcpy_from_wc() \
>-	i915_memcpy_from_wc(NULL, NULL, 0)
>+	i915_can_memcpy_from_wc(NULL, NULL, 0)

I think the has vs can here is confusing. But a cleanup on that could be
on top since it would just add noise to this patch.

I or someone else probably need a more careful review, but ack on the
direction:



Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi
