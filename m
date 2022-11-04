Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A2461DD9C
	for <lists+dri-devel@lfdr.de>; Sat,  5 Nov 2022 20:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E4310E119;
	Sat,  5 Nov 2022 19:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08C210E73C;
 Fri,  4 Nov 2022 11:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667561066; x=1699097066;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G1aTmrVsZ8ad6jZu8lVyYIHH8cHgqIzYfaRarwXYjQk=;
 b=EzXDRZw2S1oXOWtRy6tS8b1SL+miQlLoUsudcWDMkElsz4U5o7eU6isd
 ANWucTRfldbE7Rdm8/2KfDFx0wFbr+kgUKQhkCHLKaQiJPLqLGUY9kTN6
 ++/7D1mdERo0ldvLmwWm9aU4U71E1oBxWhGJuDiJzLkyoE7TRhm7VCR8h
 hNlytmTwX1L8/PICOTdw1r/eezURqUkOS5eq8MDP9OY73i5rpdUvajVld
 zcCM8M197Tdo+grFPVDWJqb4HzSpC2Cj1NCGRvhMRid769aygeWCf7H6d
 FyOgCnqsKNdF6DdlqdlnOLaT6YevboZ8eNO2WhTmTgHFIRsoVSil4iQzr Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="311682198"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="311682198"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 04:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="740590212"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="740590212"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.132])
 by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2022 04:24:09 -0700
Date: Fri, 4 Nov 2022 19:29:54 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 1/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_object.c
Message-ID: <Y2T3stShATdhBpla@liuzhao-OptiPlex-7080>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
 <20221017093726.2070674-2-zhao1.liu@linux.intel.com>
 <2541717.Lt9SDvczpP@suse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2541717.Lt9SDvczpP@suse>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Dave Hansen <dave.hansen@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Zhao Liu <zhao1.liu@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 29, 2022 at 01:17:03PM +0200, Fabio M. De Francesco wrote:
> Date: Sat, 29 Oct 2022 13:17:03 +0200
> From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
> Subject: Re: [PATCH 1/9] drm/i915: Use kmap_local_page() in
>  gem/i915_gem_object.c
> 
> On luned? 17 ottobre 2022 11:37:17 CEST Zhao Liu wrote:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > The use of kmap_atomic() is being deprecated in favor of
> > kmap_local_page()[1].
> > 
> > The main difference between atomic and local mappings is that local
> > mappings doesn't disable page faults or preemption.
> 
> You are right about about page faults which are never disabled by 
> kmap_local_page(). However kmap_atomic might not disable preemption. It 
> depends on CONFIG_PREEMPT_RT.
> 
> Please refer to how kmap_atomic_prot() works (this function is called by 
> kmap_atomic() when kernels have HIGHMEM enabled).

Yes, there is some ambiguity here. What about "The main difference between
atomic and local mappings is that local mappings never disable page faults
or preemption"?

> 
> > 
> > There're 2 reasons why i915_gem_object_read_from_page_kmap() doesn't
> > need to disable pagefaults and preemption for mapping:
> > 
> > 1. The flush operation is safe for CPU hotplug when preemption is not
> > disabled. 
> 
> I'm confused here. Why are you talking about CPU hotplug?
> In any case, developers should never rely on implicit calls of 
> preempt_disable() for the reasons said above. Therefore, flush operations 
> should be allowed regardless that kmap_atomic() potential side effect.

Sorry, it's my fault, my misunderstanding about the connection between hotplug
and flush here. When mapping exists, the cpu cannot be unplugged via CPU-hotplug.
But whether plug or unplug, it has nothing to do with flush. I will delete this
wrong description.

My initial consideration is that this interface of flush may require an atomic
context, so I want to explain more from the details of its implementation
that cache consistency can be guaranteed without atomic context. Is this
consideration redundant?
Also, do I need to state that migration is still ok for this flush interface
here (since __kmap_local_page_prot() doesn't always disable migration)?

> > In drm/i915/gem/i915_gem_object.c, the function
> > i915_gem_object_read_from_page_kmap() calls drm_clflush_virt_range()
> 
> If I recall correctly, drm_clflush_virt_range() can always be called with page 
> faults and preemption enabled. If so, this is enough to say that the 
> conversion is safe. 
> 
> Is this code explicitly related to flushing the cache lines before removing / 
> adding CPUs? If I recall correctly, there are several other reasons behind the 
> need to issue cache lines flushes. Am I wrong about this?
> 
> Can you please say more about what I'm missing here?
> 
> > to
> > use CLFLUSHOPT or WBINVD to flush. Since CLFLUSHOPT is global on x86
> > and WBINVD is called on each cpu in drm_clflush_virt_range(), the flush
> > operation is global and any issue with cpu's being added or removed
> > can be handled safely.
> 
> Again your main concern is about CPU hotplug.
> 
> Even if I'm missing something, do we really need all these details about the 
> inner workings of drm_clflush_virt_range()? 
> 
> I'm not an expert, so may be that I'm wrong about all I wrote above.
> 
> Therefore, can you please elaborate a little more for readers with very little 
> knowledge of these kinds of things (like me and perhaps others)?
>  
> > 2. Any context switch caused by preemption or sleep (pagefault may
> > cause sleep) doesn't affect the validity of local mapping.
> 
> I'd replace "preemption or sleep" with "preemption and page faults" since 
> yourself then added that page faults lead to tasks being put to sleep.  

Thanks, good advice.

Zhao

