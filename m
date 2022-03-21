Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58D34E33A4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 00:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1EF10E4A7;
	Mon, 21 Mar 2022 23:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC81410E495;
 Mon, 21 Mar 2022 23:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647903657; x=1679439657;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NHjmCgiIweaQ/3DPRci33LieVaBqBCY2t+aiKWP87Io=;
 b=ZF6XdDIztLP981SNxm9vPgiT9nGGarBQPNeGP46o56S1MO3QHGhxRsae
 9ujeKDp+nSBbvHCnY1DYck65qc0WQQ7OS6tXvwG7CiEToSbKuEhtUfsXC
 s+Dvj6n65hZM5ItBr9e5jfCRS3SfGzfi/zSaqxjW9PiG7IfKqsZMxZO0+
 YtfPezgJ6vLumZ4VVAmkWn9X88DYG/OIrmk1mAMqyxxzfoyrV+jcBmVh6
 BhP+TkbpitjlVk3m72dnnK6ihEZW9j0p3xaAiG3V7jXuC8NYneUFQtXPy
 t7Ii8T5oDumNJ9Ic0swZUYDQclHqFES0uSVmiLr/RmEQ0nr3aqVNUsPnP Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="344096628"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="344096628"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 16:00:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="515102396"
Received: from eliasbro-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.30.246])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 16:00:56 -0700
Date: Mon, 21 Mar 2022 16:00:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH v2 5/7] drm/i915/selftests: use the memcpy_from_wc call
 from the drm
Message-ID: <20220321230056.6wtj5om5stg6p6eu@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
 <20220303180013.512219-6-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220303180013.512219-6-balasubramani.vivekanandan@intel.com>
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
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>,
 michael.cheng@intel.com, wayne.boyer@intel.com,
 intel-gfx@lists.freedesktop.org, casey.g.bowman@intel.com,
 dri-devel@lists.freedesktop.org, siva.mullati@intel.com,
 Matthew Auld <matthew.auld@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Thomas Zimmermann and +Daniel Vetter

Could you take a look below regarding the I/O to I/O memory access?

On Thu, Mar 03, 2022 at 11:30:11PM +0530, Balasubramani Vivekanandan wrote:
>memcpy_from_wc functions in i915_memcpy.c will be removed and replaced
>by the implementation in drm_cache.c.
>Updated to use the functions provided by drm_cache.c.
>
>v2: check if the source and destination memory address is from local
>    memory or system memory and initialize the iosys_map accordingly
>    (Lucas)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matthew Auld <matthew.auld@intel.com>
>Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> .../drm/i915/selftests/intel_memory_region.c  | 41 +++++++++++++------
> 1 file changed, 28 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
>index ba32893e0873..d16ecb905f3b 100644
>--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
>+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
>@@ -7,6 +7,7 @@
> #include <linux/sort.h>
>
> #include <drm/drm_buddy.h>
>+#include <drm/drm_cache.h>
>
> #include "../i915_selftest.h"
>
>@@ -1133,7 +1134,7 @@ static const char *repr_type(u32 type)
>
> static struct drm_i915_gem_object *
> create_region_for_mapping(struct intel_memory_region *mr, u64 size, u32 type,
>-			  void **out_addr)
>+			  struct iosys_map *out_addr)
> {
> 	struct drm_i915_gem_object *obj;
> 	void *addr;
>@@ -1153,7 +1154,11 @@ create_region_for_mapping(struct intel_memory_region *mr, u64 size, u32 type,
> 		return addr;
> 	}
>
>-	*out_addr = addr;
>+	if (i915_gem_object_is_lmem(obj))
>+		iosys_map_set_vaddr_iomem(out_addr, (void __iomem *)addr);
>+	else
>+		iosys_map_set_vaddr(out_addr, addr);
>+
> 	return obj;
> }
>
>@@ -1164,24 +1169,33 @@ static int wrap_ktime_compare(const void *A, const void *B)
> 	return ktime_compare(*a, *b);
> }
>
>-static void igt_memcpy_long(void *dst, const void *src, size_t size)
>+static void igt_memcpy_long(struct iosys_map *dst, struct iosys_map *src,
>+			    size_t size)
> {
>-	unsigned long *tmp = dst;
>-	const unsigned long *s = src;
>+	unsigned long *tmp = dst->is_iomem ?
>+				(unsigned long __force *)dst->vaddr_iomem :
>+				dst->vaddr;

if we access vaddr_iomem/vaddr we basically break the promise of
abstracting system and I/O memory. There is no point in receiving
struct iosys_map as argument and then break the abstraction.

>+	const unsigned long *s = src->is_iomem ?
>+				(unsigned long __force *)src->vaddr_iomem :
>+				src->vaddr;
>
> 	size = size / sizeof(unsigned long);
> 	while (size--)
> 		*tmp++ = *s++;


so we basically want to copy from one place to the other on a word
boundary. And it may be

	a) I/O -> I/O or
	b) system -> I/O or
	c) I/O -> system

(b) and (c) should work, but AFAICS (a) is not possible with the current
iosys-map API. Not even the underlying APIs have that abstracted. Both
memcpy_fromio() and memcpy_toio() expect one of them to be RAM (system
memory)

I remember seeing people using a temporary in buffer in system memory
for proxying the copy. But maybe we need an abstraction for that?
Also adding Thomas Zimmermann here for that question.

and since this is a selftest testing the performance of the memcpy from
one memory region to the other, it would be good to have this test
executed to a) make sure it still works and b) record in the commit
message any possible slow down we are incurring.

thanks
Lucas De Marchi


> }
>
>-static inline void igt_memcpy(void *dst, const void *src, size_t size)
>+static inline void igt_memcpy(struct iosys_map *dst, struct iosys_map *src,
>+			      size_t size)
> {
>-	memcpy(dst, src, size);
>+	memcpy(dst->is_iomem ? (void __force *)dst->vaddr_iomem : dst->vaddr,
>+	       src->is_iomem ? (void __force *)src->vaddr_iomem : src->vaddr,
>+	       size);
> }
>
>-static inline void igt_memcpy_from_wc(void *dst, const void *src, size_t size)
>+static inline void igt_memcpy_from_wc(struct iosys_map *dst, struct iosys_map *src,
>+				      size_t size)
> {
>-	i915_memcpy_from_wc(dst, src, size);
>+	drm_memcpy_from_wc(dst, src, size);
> }
>
> static int _perf_memcpy(struct intel_memory_region *src_mr,
>@@ -1191,7 +1205,8 @@ static int _perf_memcpy(struct intel_memory_region *src_mr,
> 	struct drm_i915_private *i915 = src_mr->i915;
> 	const struct {
> 		const char *name;
>-		void (*copy)(void *dst, const void *src, size_t size);
>+		void (*copy)(struct iosys_map *dst, struct iosys_map *src,
>+			     size_t size);
> 		bool skip;
> 	} tests[] = {
> 		{
>@@ -1205,11 +1220,11 @@ static int _perf_memcpy(struct intel_memory_region *src_mr,
> 		{
> 			"memcpy_from_wc",
> 			igt_memcpy_from_wc,
>-			!i915_has_memcpy_from_wc(),
>+			!drm_memcpy_fastcopy_supported(),
> 		},
> 	};
> 	struct drm_i915_gem_object *src, *dst;
>-	void *src_addr, *dst_addr;
>+	struct iosys_map src_addr, dst_addr;
> 	int ret = 0;
> 	int i;
>
>@@ -1237,7 +1252,7 @@ static int _perf_memcpy(struct intel_memory_region *src_mr,
>
> 			t0 = ktime_get();
>
>-			tests[i].copy(dst_addr, src_addr, size);
>+			tests[i].copy(&dst_addr, &src_addr, size);
>
> 			t1 = ktime_get();
> 			t[pass] = ktime_sub(t1, t0);
>-- 
>2.25.1
>
