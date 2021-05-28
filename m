Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0977B3944D2
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 17:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37096E51D;
	Fri, 28 May 2021 15:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FBA6E3FC;
 Fri, 28 May 2021 15:10:57 +0000 (UTC)
IronPort-SDR: 0ATBFMcGoCF7I6sBJeEy41RPskz1V7CD8KXZ4g7LlzPkJl+4QGFgesYcWqy6In748FFjhNf9IJ
 kGUqcO1TBTmw==
X-IronPort-AV: E=McAfee;i="6200,9189,9998"; a="202746187"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="202746187"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 08:10:54 -0700
IronPort-SDR: 3a5ayZTMAAM6dC0bVyTsneQOX+R7tjTFbNyflBro2I3me8WdjBOKRz1uM5jNoP33ElO5iP6SuY
 FKgGkrzQLgxQ==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="444037905"
Received: from jdahlin-mobl1.ger.corp.intel.com (HELO [10.249.254.92])
 ([10.249.254.92])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 08:10:52 -0700
Subject: Re: [PATCH v5 07/15] drm: Add a prefetching memcpy_from_wc
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210527144710.1975553-1-thomas.hellstrom@linux.intel.com>
 <20210527144710.1975553-8-thomas.hellstrom@linux.intel.com>
 <7f2daaf6-8df1-5886-758e-ea09d27602ba@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <1ad40aa9-7ca7-ed5a-8a34-a93c68e1ada7@linux.intel.com>
Date: Fri, 28 May 2021 17:10:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <7f2daaf6-8df1-5886-758e-ea09d27602ba@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 5/28/21 4:19 PM, Christian König wrote:
> Am 27.05.21 um 16:47 schrieb Thomas Hellström:
>> Reading out of write-combining mapped memory is typically very slow
>> since the CPU doesn't prefetch. However some archs have special
>> instructions to do this.
>>
>> So add a best-effort memcpy_from_wc taking dma-buf-map pointer
>> arguments that attempts to use a fast prefetching memcpy and
>> otherwise falls back to ordinary memcopies, taking the iomem tagging
>> into account.
>>
>> The code is largely copied from i915_memcpy_from_wc.
>>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Christian König <christian.koenig@amd.com>
>> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   Documentation/gpu/drm-mm.rst |   2 +-
>>   drivers/gpu/drm/drm_cache.c  | 138 +++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_drv.c    |   2 +
>>   include/drm/drm_cache.h      |   7 ++
>>   4 files changed, 148 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
>> index 21be6deadc12..c66058c5bce7 100644
>> --- a/Documentation/gpu/drm-mm.rst
>> +++ b/Documentation/gpu/drm-mm.rst
>> @@ -469,7 +469,7 @@ DRM MM Range Allocator Function References
>>   .. kernel-doc:: drivers/gpu/drm/drm_mm.c
>>      :export:
>>   -DRM Cache Handling
>> +DRM Cache Handling and Fast WC memcpy()
>>   ==================
>>     .. kernel-doc:: drivers/gpu/drm/drm_cache.c
>> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>> index 79a50ef1250f..08614f7fdd8d 100644
>> --- a/drivers/gpu/drm/drm_cache.c
>> +++ b/drivers/gpu/drm/drm_cache.c
>> @@ -28,6 +28,7 @@
>>    * Authors: Thomas Hellström <thomas-at-tungstengraphics-dot-com>
>>    */
>>   +#include <linux/dma-buf-map.h>
>>   #include <linux/export.h>
>>   #include <linux/highmem.h>
>>   #include <linux/mem_encrypt.h>
>> @@ -35,6 +36,9 @@
>>     #include <drm/drm_cache.h>
>>   +/* A small bounce buffer that fits on the stack. */
>> +#define MEMCPY_BOUNCE_SIZE 128
>> +
>>   #if defined(CONFIG_X86)
>>   #include <asm/smp.h>
>>   @@ -209,3 +213,137 @@ bool drm_need_swiotlb(int dma_bits)
>>       return max_iomem > ((u64)1 << dma_bits);
>>   }
>>   EXPORT_SYMBOL(drm_need_swiotlb);
>> +
>> +#ifdef CONFIG_X86
>> +
>> +static DEFINE_STATIC_KEY_FALSE(has_movntdqa);
>> +
>> +static void __memcpy_ntdqa(void *dst, const void *src, unsigned long 
>> len)
>> +{
>> +    kernel_fpu_begin();
>> +
>> +    while (len >= 4) {
>> +        asm("movntdqa    (%0), %%xmm0\n"
>> +            "movntdqa 16(%0), %%xmm1\n"
>> +            "movntdqa 32(%0), %%xmm2\n"
>> +            "movntdqa 48(%0), %%xmm3\n"
>> +            "movaps %%xmm0,   (%1)\n"
>> +            "movaps %%xmm1, 16(%1)\n"
>> +            "movaps %%xmm2, 32(%1)\n"
>> +            "movaps %%xmm3, 48(%1)\n"
>> +            :: "r" (src), "r" (dst) : "memory");
>> +        src += 64;
>> +        dst += 64;
>> +        len -= 4;
>> +    }
>> +    while (len--) {
>> +        asm("movntdqa (%0), %%xmm0\n"
>> +            "movaps %%xmm0, (%1)\n"
>> +            :: "r" (src), "r" (dst) : "memory");
>> +        src += 16;
>> +        dst += 16;
>> +    }
>> +
>> +    kernel_fpu_end();
>> +}
>> +
>> +/*
>> + * __drm_memcpy_from_wc copies @len bytes from @src to @dst using
>> + * non-temporal instructions where available. Note that all arguments
>> + * (@src, @dst) must be aligned to 16 bytes and @len must be a multiple
>> + * of 16.
>> + */
>> +static void __drm_memcpy_from_wc(void *dst, const void *src, 
>> unsigned long len)
>> +{
>> +    if (unlikely(((unsigned long)dst | (unsigned long)src | len) & 15))
>> +        memcpy(dst, src, len);
>> +    else if (likely(len))
>> +        __memcpy_ntdqa(dst, src, len >> 4);
>> +}
>> +#endif
>> +
>> +static void memcpy_fallback(struct dma_buf_map *dst,
>> +                const struct dma_buf_map *src,
>> +                unsigned long len)
>> +{
>> +    if (!dst->is_iomem && !src->is_iomem) {
>> +        memcpy(dst->vaddr, src->vaddr, len);
>> +    } else if (!src->is_iomem) {
>> +        dma_buf_map_memcpy_to(dst, src->vaddr, len);
>> +    } else if (!dst->is_iomem) {
>> +        memcpy_fromio(dst->vaddr, src->vaddr_iomem, len);
>> +    } else {
>> +        /*
>> +         * Bounce size is not performance tuned, but using a
>> +         * bounce buffer like this is significantly faster than
>> +         * resorting to ioreadxx() + iowritexx().
>> +         */
>> +        char bounce[MEMCPY_BOUNCE_SIZE];
>> +        void __iomem *_src = src->vaddr_iomem;
>> +        void __iomem *_dst = dst->vaddr_iomem;
>> +
>> +        while (len >= MEMCPY_BOUNCE_SIZE) {
>> +            memcpy_fromio(bounce, _src, MEMCPY_BOUNCE_SIZE);
>> +            memcpy_toio(_dst, bounce, MEMCPY_BOUNCE_SIZE);
>> +            _src += MEMCPY_BOUNCE_SIZE;
>> +            _dst += MEMCPY_BOUNCE_SIZE;
>> +            len -= MEMCPY_BOUNCE_SIZE;
>> +        }
>> +        if (len) {
>> +            memcpy_fromio(bounce, _src, MEMCPY_BOUNCE_SIZE);
>> +            memcpy_toio(_dst, bounce, MEMCPY_BOUNCE_SIZE);
>> +        }
>> +    }
>> +}
>> +
>> +/**
>> + * drm_memcpy_from_wc - Perform the fastest available memcpy from a 
>> source
>> + * that may be WC.
>> + * @dst: The destination pointer
>> + * @src: The source pointer
>> + * @len: The size of the area o transfer in bytes
>> + *
>> + * Tries an arch optimized memcpy for prefetching reading out of a 
>> WC region,
>> + * and if no such beast is available, falls back to a normal memcpy.
>> + */
>> +void drm_memcpy_from_wc(struct dma_buf_map *dst,
>> +            const struct dma_buf_map *src,
>> +            unsigned long len)
>> +{
>> +    if (WARN_ON(in_interrupt()))
>> +        return;
>
> I would either make it a BUG_ON() or at least use the fallback memcpy.
>
> Just returning without doing anything isn't really nice.

Hmm, Yes, Daniel suggested this on IRC. I would have gone for the 
fallback which he didn't like, and I think crashing the kernel with a 
BUG_ON in an interrupt which from experience might result in a 
completely silent hang without a trace of what went wrong unless 
possibly with a serial console is not really acceptable either.... 
Perhaps we can go for a WARN_ON + fallback, which still forces the 
caller to come up with something else...

/Thomas

>
> Christian.
>
>> +
>> +    if (IS_ENABLED(CONFIG_X86) && 
>> static_branch_likely(&has_movntdqa)) {
>> +        __drm_memcpy_from_wc(dst->is_iomem ?
>> +                     (void __force *)dst->vaddr_iomem :
>> +                     dst->vaddr,
>> +                     src->is_iomem ?
>> +                     (void const __force *)src->vaddr_iomem :
>> +                     src->vaddr,
>> +                     len);
>> +        return;
>> +    }
>> +
>> +    memcpy_fallback(dst, src, len);
>> +}
>> +EXPORT_SYMBOL(drm_memcpy_from_wc);
>> +
>> +#ifdef CONFIG_X86
>> +/**
>> + * drm_memcpy_init_early - One time initialization of the WC memcpy 
>> code
>> + */
>> +void drm_memcpy_init_early(void)
>> +{
>> +    /*
>> +     * Some hypervisors (e.g. KVM) don't support VEX-prefix 
>> instructions
>> +     * emulation. So don't enable movntdqa in hypervisor guest.
>> +     */
>> +    if (static_cpu_has(X86_FEATURE_XMM4_1) &&
>> +        !boot_cpu_has(X86_FEATURE_HYPERVISOR))
>> +        static_branch_enable(&has_movntdqa);
>> +}
>> +#else
>> +void drm_memcpy_init_early(void)
>> +{
>> +}
>> +#endif
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 3d8d68a98b95..8804ec7d3215 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -35,6 +35,7 @@
>>   #include <linux/slab.h>
>>   #include <linux/srcu.h>
>>   +#include <drm/drm_cache.h>
>>   #include <drm/drm_client.h>
>>   #include <drm/drm_color_mgmt.h>
>>   #include <drm/drm_drv.h>
>> @@ -1041,6 +1042,7 @@ static int __init drm_core_init(void)
>>         drm_connector_ida_init();
>>       idr_init(&drm_minors_idr);
>> +    drm_memcpy_init_early();
>>         ret = drm_sysfs_init();
>>       if (ret < 0) {
>> diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
>> index e9ad4863d915..cc9de1632dd3 100644
>> --- a/include/drm/drm_cache.h
>> +++ b/include/drm/drm_cache.h
>> @@ -35,6 +35,8 @@
>>     #include <linux/scatterlist.h>
>>   +struct dma_buf_map;
>> +
>>   void drm_clflush_pages(struct page *pages[], unsigned long num_pages);
>>   void drm_clflush_sg(struct sg_table *st);
>>   void drm_clflush_virt_range(void *addr, unsigned long length);
>> @@ -70,4 +72,9 @@ static inline bool drm_arch_can_wc_memory(void)
>>   #endif
>>   }
>>   +void drm_memcpy_init_early(void);
>> +
>> +void drm_memcpy_from_wc(struct dma_buf_map *dst,
>> +            const struct dma_buf_map *src,
>> +            unsigned long len);
>>   #endif
>
