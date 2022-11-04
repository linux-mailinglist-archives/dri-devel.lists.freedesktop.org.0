Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4B361DD9A
	for <lists+dri-devel@lfdr.de>; Sat,  5 Nov 2022 20:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB5F10E033;
	Sat,  5 Nov 2022 19:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACD610E0B0;
 Fri,  4 Nov 2022 12:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667563791; x=1699099791;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D/mskI74i/hI8GgennFirbzxa7Ke/fF8Q8V3PuS4whg=;
 b=C1oNDnw3YB8/fnl+jykP92bsy6Wt9GGDlzKodFLkpyBS4fIYWiCcsM6C
 h5JVfAgvV3uUxJEibf8g0NsbXZPU6kDvVcDlFBv+YLcJb3ETBCc/3Ahoh
 ChIwDLU2TYmfpoZJOWsej8anONOyFtt9Qi7aUS3nc+jLLDq3S2JKgoL5J
 iahu2MwYA9um3ZqOkbsuue3ZjHJtQM2URgtKuAQD+NYhI7EvFv+QvkO4/
 bFplThDp8FU47hjikdzhwoO+2XCCDy8FlA6Pc8RwwBxGLo6TLA69hd3ls
 s7Qy/DK4SQr3EaFgF5B29j+MYw54scL+ncJnYVVpqjh0huP8OR+G40WM9 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="309941297"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="309941297"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 05:09:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="724331510"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="724331510"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.132])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Nov 2022 05:09:49 -0700
Date: Fri, 4 Nov 2022 20:15:34 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH 2/9] drm/i915: Use kmap_local_page() in gem/i915_gem_pyhs.c
Message-ID: <Y2UCZvaTrvjHmJiT@liuzhao-OptiPlex-7080>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
 <20221017093726.2070674-3-zhao1.liu@linux.intel.com>
 <13152489.uLZWGnKmhe@suse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13152489.uLZWGnKmhe@suse>
X-Mailman-Approved-At: Sat, 05 Nov 2022 19:11:56 +0000
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
Cc: Zhenyu Wang <zhenyu.z.wang@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Hansen <dave.hansen@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 29, 2022 at 03:32:08PM +0200, Fabio M. De Francesco wrote:
> Date: Sat, 29 Oct 2022 15:32:08 +0200
> From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
> Subject: Re: [PATCH 2/9] drm/i915: Use kmap_local_page() in
>  gem/i915_gem_pyhs.c
> 
> On luned? 17 ottobre 2022 11:37:18 CEST Zhao Liu wrote:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > The use of kmap_atomic() is being deprecated in favor of
> > kmap_local_page()[1].
> > 
> > The main difference between atomic and local mappings is that local
> > mappings doesn't disable page faults or preemption.
> > 
> > In drm/i915/gem/i915_gem_phys.c, the functions
> > i915_gem_object_get_pages_phys() and i915_gem_object_put_pages_phys()
> > don't need to disable pagefaults and preemption for mapping because of
> > these 2 reasons:
> > 
> > 1. The flush operation is safe for CPU hotplug when preemption is not
> > disabled. In drm/i915/gem/i915_gem_object.c, the functions
> > i915_gem_object_get_pages_phys() and i915_gem_object_put_pages_phys()
> > calls drm_clflush_virt_range() to use CLFLUSHOPT or WBINVD to flush.
> > Since CLFLUSHOPT is global on x86 and WBINVD is called on each cpu in
> > drm_clflush_virt_range(), the flush operation is global and any issue
> > with cpu's being added or removed can be handled safely.
> > 
> > 2. Any context switch caused by preemption or sleep (pagefault may
> > cause sleep) doesn't affect the validity of local mapping.
> > 
> > Therefore, i915_gem_object_get_pages_phys() and
> > i915_gem_object_put_pages_phys() are two functions where the use of
> > kmap_local_page() in place of kmap_atomic() is correctly suited.
> > 
> > Convert the calls of kmap_atomic() / kunmap_atomic() to
> > kmap_local_page() / kunmap_local().
> > 
> 
> I have here the same questions as in 1/9.
> 
> > [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
> > 
> > Suggested-by: Dave Hansen <dave.hansen@intel.com>
> > Suggested-by: Ira Weiny <ira.weiny@intel.com>
> > Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> > Suggested by credits:
> >   Dave: Referred to his explanation about cache flush.
> >   Ira: Referred to his task document, review comments and explanation about
> >        cache flush.
> >   Fabio: Referred to his boiler plate commit message.
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_phys.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> > b/drivers/gpu/drm/i915/gem/i915_gem_phys.c index 0d0e46dae559..d602ba19ecb2 
> 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> > @@ -66,10 +66,10 @@ static int i915_gem_object_get_pages_phys(struct 
> drm_i915_gem_object
> > *obj) if (IS_ERR(page))
> >  			goto err_st;
> > 
> > -		src = kmap_atomic(page);
> > +		src = kmap_local_page(page);
> >  		memcpy(dst, src, PAGE_SIZE);
> >  		drm_clflush_virt_range(dst, PAGE_SIZE);
> > -		kunmap_atomic(src);
> > +		kunmap_local(src);
> 
> Please use memcpy_from_page() instead of open coding mapping + memcpy() + 
> unmapping.

Ok.

> 
> > 
> >  		put_page(page);
> >  		dst += PAGE_SIZE;
> > @@ -114,10 +114,10 @@ i915_gem_object_put_pages_phys(struct 
> drm_i915_gem_object *obj,
> >  			if (IS_ERR(page))
> >  				continue;
> > 
> > -			dst = kmap_atomic(page);
> > +			dst = kmap_local_page(page);
> >  			drm_clflush_virt_range(src, PAGE_SIZE);
> >  			memcpy(dst, src, PAGE_SIZE);
> > -			kunmap_atomic(dst);
> > +			kunmap_local(dst);
> 
> For the same reasons said above, memcpy_to_page() should be used here and 
> avoid open coding of three functions.
> 
> Using those helpers forces you to move drm_clflush_virt_range() out of the 
> mapping / un-mapping region. I may be wrong, however I'm pretty sure that the 
> relative positions of each of those call sites is something that cannot be 
> randomly chosen.

I agree. Will use memcpy_to_page().

Thanks,
Zhao

> 
> Thanks,
> 
> Fabio
> 
> > 
> >  			set_page_dirty(page);
> >  			if (obj->mm.madv == I915_MADV_WILLNEED)
> 
> 
> 
