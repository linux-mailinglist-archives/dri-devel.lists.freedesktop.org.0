Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2266549BAD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 20:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F38A10F337;
	Mon, 13 Jun 2022 18:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4178910F337;
 Mon, 13 Jun 2022 18:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655145447; x=1686681447;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=U9jXgIqSWzEreLwNqFdLRLyZ3mKIzt6CVZHylhsj50g=;
 b=Nrp2StHB7G6sFE3BMuYesIGpOnoNWvbyBMU3lIgpIyQXSU5yYcJeFIsR
 JqJfv1fED68Kl7SMS7wnQi+qmdcnpl/M4cWNSyZlWTGiDgMv07tgz/WDn
 kZ04v8xoAi7EQpCLXRplm4X2DEUpvW/vMzsWYnKPJN2YOXNLSGQNVyqIb
 0wJgKJo/CD3rj57V+KLImBeUuBp62iQUPg/3k7N3Jf/2RpfQv8Z6mesfF
 C62QxJzxodGM8FwFAlD4VBMGE6n4wlqE+n5clXkZRqTM7AGj68suz+W/2
 W5NrJqijlqbI6Of9OuRSjv1sqxhJk0MldJQhakFT6HpAmfuUxOi0wrUWX A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="267067173"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="267067173"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 11:37:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="761640711"
Received: from samsonle-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.108.28])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 11:37:26 -0700
Date: Mon, 13 Jun 2022 11:37:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] iosys-map: Add word-sized reads
Message-ID: <20220613183726.u6si5dcdbi2gw3qb@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220609232020.2292649-1-lucas.demarchi@intel.com>
 <f7f86767-ad4a-0e62-c1af-a227d5709a54@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <f7f86767-ad4a-0e62-c1af-a227d5709a54@suse.de>
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 13, 2022 at 12:58:52PM +0200, Thomas Zimmermann wrote:
>Hi Lucas
>
>Am 10.06.22 um 01:20 schrieb Lucas De Marchi:
>>Instead of always falling back to memcpy_fromio() for any size, prefer
>>using read{b,w,l}(). When reading struct members it's common to read
>>individual integer variables individually. Going through memcpy_fromio()
>>for each of them poses a high penalty.
>>
>>Employ a similar trick as __seqprop() by using _Generic() to generate
>>only the specific call based on a type-compatible variable.
>>
>>For a pariticular i915 workload producing GPU context switches,
>>__get_engine_usage_record() is particularly hot since the engine usage
>>is read from device local memory with dgfx, possibly multiple times
>>since it's racy. Test execution time for this test shows a ~12.5%
>>improvement with DG2:
>>
>>Before:
>>	nrepeats = 1000; min = 7.63243e+06; max = 1.01817e+07;
>>	median = 9.52548e+06; var = 526149;
>>After:
>>	nrepeats = 1000; min = 7.03402e+06; max = 8.8832e+06;
>>	median = 8.33955e+06; var = 333113;
>>
>>Other things attempted that didn't prove very useful:
>>1) Change the _Generic() on x86 to just dereference the memory address
>>2) Change __get_engine_usage_record() to do just 1 read per loop,
>>    comparing with the previous value read
>>3) Change __get_engine_usage_record() to access the fields directly as it
>>    was before the conversion to iosys-map
>>
>>(3) did gave a small improvement (~3%), but doesn't seem to scale well
>>to other similar cases in the driver.
>>
>>Additional test by Chris Wilson using gem_create from igt with some
>>changes to track object creation time. This happens to accidentaly
>>stress this code path:
>>
>>	Pre iosys_map conversion of engine busyness:
>>	lmem0: Creating    262144 4KiB objects took 59274.2ms
>>
>>	Unpatched:
>>	lmem0: Creating    262144 4KiB objects took 108830.2ms
>>
>>	With readl (this patch):
>>	lmem0: Creating    262144 4KiB objects took 61348.6ms
>>
>>	s/readl/READ_ONCE/
>>	lmem0: Creating    262144 4KiB objects took 61333.2ms
>>
>>So we do take a little bit more time than before the conversion, but
>>that is due to other factors: bringing the READ_ONCE back would be as
>>good as just doing this conversion.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>
>>If this is acceptable we should probably add the write counterpart, too.
>>Sending here only the read for now since this fixes the issue we are
>>seeing and to gather feedback.
>
>That would not be a problem, but please only add functions that you use.

I sent v2 that includes the write as the second patch. We do use it,
it's just not in the critical path.

$ git grep iosys_map_wr drivers/
drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:     iosys_map_wr_field(&(guc_)->ads_map, 0, struct __guc_ads_blob,  \
drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:     iosys_map_wr_field(map_, 0, struct guc_gt_system_info, field_, val_)

>>  include/linux/iosys-map.h | 26 ++++++++++++++++++++++----
>>  1 file changed, 22 insertions(+), 4 deletions(-)
>>
>>diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
>>index e69a002d5aa4..4ae3e459419e 100644
>>--- a/include/linux/iosys-map.h
>>+++ b/include/linux/iosys-map.h
>>@@ -333,6 +333,20 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>>  		memset(dst->vaddr + offset, value, len);
>>  }
>>+#ifdef CONFIG_64BIT
>>+#define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)			\
>>+	u64: val_ = readq(vaddr_iomem_),
>>+#else
>>+#define __iosys_map_u64_case(val_, vaddr_iomem_)
>>+#endif
>>+
>>+#define __iosys_map_rd_io(val__, vaddr_iomem__, type__) _Generic(val__,	\
>>+	u8: val__ = readb(vaddr_iomem__),				\
>>+	u16: val__ = readw(vaddr_iomem__),				\
>>+	u32: val__ = readl(vaddr_iomem__),				\
>>+	__iosys_map_rd_io_u64_case(val__, vaddr_iomem__)		\
>>+	default: memcpy_fromio(&(val__), vaddr_iomem__, sizeof(val__)))
>>+
>>  /**
>>   * iosys_map_rd - Read a C-type value from the iosys_map
>>   *
>>@@ -346,10 +360,14 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>>   * Returns:
>>   * The value read from the mapping.
>>   */
>>-#define iosys_map_rd(map__, offset__, type__) ({			\
>>-	type__ val;							\
>>-	iosys_map_memcpy_from(&val, map__, offset__, sizeof(val));	\
>>-	val;								\
>>+#define iosys_map_rd(map__, offset__, type__) ({				\
>>+	type__ val;								\
>>+	if ((map__)->is_iomem) {						\
>>+		__iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
>>+	} else {								\
>>+		memcpy(&val, (map__)->vaddr + offset__, sizeof(val));		\
>>+	}									\
>>+	val;									\
>
>To my knowledge, calls to readw/readl have alignment requirements on 
>some platforms, while memcpy_fromio() has none. Mixing memcpy() and 
>read*() sounds like a problem for subtle bugs. I'd prefer to at least 
>mitigate that to some extend.
>
>For each case in the _Generic statement, there should be an if/else 
>branch on is_iomem. Here's the example
>
>#define iosys_map_rd() \
>_Generic( (val__),
>  u8: {
>    if (map__)->is_iomem
>      val__ = readb()
>    else
>      val__ *(volatile u8*)(vaddr_iomem);
>  },
>  u16: {
>    if (map__)->is_iomem
>      val__ = readw()
>    else
>      val__ *(volatile u16*)(vaddr_iomem);
>  },
>  u32,
>  u64,
>  ...
>  default: {
>    if (map__)->is_iomem
>      mempy_fromio()
>    else
>      memcpy()
>  })
>
>Using volatile with system memory enforces single instructions or even 
>alignment on some platforms. While experimenting with framebuffer 
>updates, I've also found this to be faster then regular code. With 
>'volatile' the compiler generated a single movq instead of a number of 
>shorter movs. (But I won't promise anything. :)

Here I focused on making the *io* part faster instead of the system
memory part faster since io is order of magnitudes slower and showing up
on perf. Yes, we can also do it on the system memory part.

Note that the READ_ONCE() I mentioned in the commit message does the
volatile cast behind the scene. I also checked that the readl in the
generated code expands to a mov instruction in 64-bit mode,
which is correct.

>
>Within _Generic, for each type, a macro can generate the case. Like this
>
>#define __iosys_map_rd_case(__type, __map, __read) \
>  __type: if else ...
>
>In the case of u64, you can simply do
>
>#if CONFIG_64BIT
>#define __iosys_map_rd_case_u64(__map) \
>  __iosys_map_rc_case(u64, __map, readq)
>#else
>#define __iosys_map_rd_case_u64(__map)
>#endif
>
>and use that macro in the _Generic. On 64-bit systems, the case will 
>be there. Otherwise it will be empty.

/me confused... this is what I did, no?

>
>The only user of iosys_map_rd() is i915. I quickly looked through the 
>usage and found no cases where the default memcpy could be used. It's 
>all structs with u32. (Right?)  If so, please remove the default case 
>with memcpy entirely.  This will result in clear compile-time errors 
>if a certain type is not supported.  There's still iosys_mem_memcpy() 
>for those who need it.

yeah, I think we had cases copying the whole struct before. Just took a look
and removing the default doesn't explodes the build, so we should be fine...
although it may lead to build issue if we are trying to read a u64 on 32-bit
since it won't fallback to memcpy by simply expanding the u64 case to nothing.

Another thing not clear: how does moving the if/else inside the
_Generic() help with unaligned accesses?

For your suggestion on also handling system memory,  I was actually thinking on
leaving the if/else where it is now and in future add a _Generic() for the
system memory accesses (hence why my macro has he _io suffix):

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index d092d30f5812..0e758424088e 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -375,7 +375,7 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
  	if ((map__)->is_iomem) {						\
  		__iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
  	} else {								\
-		memcpy(&val, (map__)->vaddr + offset__, sizeof(val));		\
+		__iosys_map_rd_sys(val, (map__)->vaddr_iomem + offset__, type__);\
  	}									\
  	val;									\
  })

it seems cleaner than adding the if/else to each case expanded by _Generic().

thanks
Lucas De Marchi
