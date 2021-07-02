Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788BD3BA236
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 16:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A92E6E17D;
	Fri,  2 Jul 2021 14:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D14D6E0EF;
 Fri,  2 Jul 2021 14:31:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="206915786"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="206915786"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 07:31:12 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="455967513"
Received: from juanniex-mobl.ger.corp.intel.com (HELO [10.213.253.90])
 ([10.213.253.90])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 07:31:10 -0700
Subject: Re: [Intel-gfx] [PATCH v2 3/3] drm/i915/uapi: reject set_domain for
 discrete
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210701151019.1103315-1-matthew.auld@intel.com>
 <20210701151019.1103315-3-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <6b1fb400-07a6-bac0-929a-46991835d1f2@linux.intel.com>
Date: Fri, 2 Jul 2021 15:31:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701151019.1103315-3-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 01/07/2021 16:10, Matthew Auld wrote:
> The CPU domain should be static for discrete, and on DG1 we don't need
> any flushing since everything is already coherent, so really all this

Knowledge of the write combine buffer is assumed to be had by anyone involved?

> does is an object wait, for which we have an ioctl. Longer term the
> desired caching should be an immutable creation time property for the
> BO, which can be set with something like gem_create_ext.
> 
> One other user is iris + userptr, which uses the set_domain to probe all
> the pages to check if the GUP succeeds, however keeping the set_domain
> around just for that seems rather scuffed. We could equally just submit
> a dummy batch, which should hopefully be good enough, otherwise adding a
> new creation time flag for userptr might be an option. Although longer
> term we will also have vm_bind, which should also be a nice fit for
> this, so adding a whole new flag is likely overkill.

Execbuf sounds horrible. But it all reminds me of past work by Chris which is surprisingly hard to find in the archives. Patches like:

commit 7706a433388016983052a27c0fd74a64b1897ae7
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Wed Nov 8 17:04:07 2017 +0000

     drm/i915/userptr: Probe existence of backing struct pages upon creation
     
     Jason Ekstrand requested a more efficient method than userptr+set-domain
     to determine if the userptr object was backed by a complete set of pages
     upon creation. To be more efficient than simply populating the userptr
     using get_user_pages() (as done by the call to set-domain or execbuf),
     we can walk the tree of vm_area_struct and check for gaps or vma not
     backed by struct page (VM_PFNMAP). The question is how to handle
     VM_MIXEDMAP which may be either struct page or pfn backed...

commit 7ca21d3390eec23db99b8131ed18bc036efaba18
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Wed Nov 8 17:48:22 2017 +0000

     drm/i915/userptr: Add a flag to populate the userptr on creation
     
     Acquiring the backing struct pages for the userptr range is not free;
     the first client for userptr would insist on frequently creating userptr
     objects ahead of time and not use them. For that first client, deferring
     the cost of populating the userptr (calling get_user_pages()) to the
     actual execbuf was a substantial improvement. However, not all clients
     are the same, and most would like to validate that the userptr is valid
     and backed by struct pages upon creation, so offer a
     I915_USERPTR_POPULATE flag to do just that.
     
     Note that big difference between I915_USERPTR_POPULATE and the deferred
     scheme is that POPULATE is guaranteed to be synchronous, the result is
     known before the ioctl returns (and the handle exposed). However, due to
     system memory pressure, the object may be paged out before use,
     requiring them to be paged back in on execbuf (as may always happen).

At least with the first one I think I was skeptical, since probing at point A makes a weak test versus userptr getting used at point B. Populate is kind of same really when user controls the backing store. At least these two arguments I think stand if we are trying to sell these flags as validation. But if the idea is limited to pure preload, with no guarantees that it keeps working by time of real use, then I guess it may be passable.

Disclaimer that I haven't been following the story on why it is desirable to abandon set domain. Only judging from this series, mmap caching mode is implied from the object? Should set domain availability be driven by the object backing store instead of outright rejection?

Regards,

Tvrtko
  
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_domain.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> index 43004bef55cb..b684a62bf3b0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -490,6 +490,9 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
>   	u32 write_domain = args->write_domain;
>   	int err;
>   
> +	if (IS_DGFX(to_i915(dev)))
> +		return -ENODEV;
> +
>   	/* Only handle setting domains to types used by the CPU. */
>   	if ((write_domain | read_domains) & I915_GEM_GPU_DOMAINS)
>   		return -EINVAL;
> 
