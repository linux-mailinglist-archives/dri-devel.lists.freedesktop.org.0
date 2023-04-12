Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1229B6DFA88
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 17:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C3B10E885;
	Wed, 12 Apr 2023 15:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59ECF10E881;
 Wed, 12 Apr 2023 15:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681314321; x=1712850321;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IERnqLXMW+gb74vzXKSwdmaOj1kubqs2Fl+YWa4aSvM=;
 b=g7ZAKsyFcBFHPcK3vLAVdipTy132/sHTmtPZCJU/DV1fVTOTitwniDX1
 Db2jsHv4TN69JmGceZzLTuiiwVmDYRBONfjybwmdLbO8JYBOzh87Tvd6B
 9hUoperdql/fUGgwv9l1ZJmTao1GhAnIgIhmSlYrIlmCiIWzCW2vueKDZ
 /uGpybmY6VnRfa5C6Em0AlCyLZkS4PVu8VqhOExvWz0pS6WjrnvK7gCWo
 xbn7iMAbfMqP5uXClnEovWYkVlyF6YUSVqoWxXMgi4jcKfnymDnbE/XpZ
 jmS2HLzyL3eaKcQ5p3/N/ya2hWH1VA72VK6xWBQDjg18MYGIdmbD7paa5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="324297153"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="324297153"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 08:45:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="719416191"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="719416191"
Received: from amurkovx-mobl.ger.corp.intel.com (HELO [10.213.229.123])
 ([10.213.229.123])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 08:45:15 -0700
Message-ID: <1b341218-f0e2-a613-2ac6-107064a813ca@linux.intel.com>
Date: Wed, 12 Apr 2023 16:45:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 9/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_execbuffer.c
Content-Language: en-US
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
 <64265ef8725fe_375f7e294a@iweiny-mobl.notmuch>
 <fdc8a470-1e6b-815d-e367-a9df1b0b14dd@linux.intel.com>
 <2177327.1BCLMh4Saa@suse>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <2177327.1BCLMh4Saa@suse>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Zhao Liu <zhao1.liu@intel.com>, Zhenyu Wang <zhenyu.z.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 31/03/2023 16:32, Fabio M. De Francesco wrote:
> On venerdì 31 marzo 2023 13:30:20 CEST Tvrtko Ursulin wrote:
>> On 31/03/2023 05:18, Ira Weiny wrote:
>>> Zhao Liu wrote:
>>>> From: Zhao Liu <zhao1.liu@intel.com>
>>>>
>>>> The use of kmap_atomic() is being deprecated in favor of
>>>> kmap_local_page()[1], and this patch converts the calls from
>>>> kmap_atomic() to kmap_local_page().
>>>>
>>>> The main difference between atomic and local mappings is that local
>>>> mappings doesn't disable page faults or preemption (the preemption is
>>>> disabled for !PREEMPT_RT case, otherwise it only disables migration).
>>>>
>>>> With kmap_local_page(), we can avoid the often unwanted side effect of
>>>> unnecessary page faults and preemption disables.
>>>>
>>>> In i915_gem_execbuffer.c, eb->reloc_cache.vaddr is mapped by
>>>> kmap_atomic() in eb_relocate_entry(), and is unmapped by
>>>> kunmap_atomic() in reloc_cache_reset().
>>>
>>> First off thanks for the series and sticking with this.  That said this
>>> patch kind of threw me for a loop because tracing the map/unmap calls did
>>> not make sense to me.  See below.
>>>
>>>> And this mapping/unmapping occurs in two places: one is in
>>>> eb_relocate_vma(), and another is in eb_relocate_vma_slow().
>>>>
>>>> The function eb_relocate_vma() or eb_relocate_vma_slow() doesn't
>>>> need to disable pagefaults and preemption during the above mapping/
>>>> unmapping.
>>>>
>>>> So it can simply use kmap_local_page() / kunmap_local() that can
>>>> instead do the mapping / unmapping regardless of the context.
>>>>
>>>> Convert the calls of kmap_atomic() / kunmap_atomic() to
>>>> kmap_local_page() / kunmap_local().
>>>>
>>>> [1]:
>>>> https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
>>>>
>>>> v2: No code change since v1. Added description of the motivation of
>>>>
>>>>       using kmap_local_page() and "Suggested-by" tag of Fabio.
>>>>
>>>> Suggested-by: Ira Weiny <ira.weiny@intel.com>
>>>> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>>>> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
>>>> ---
>>>>
>>>> Suggested by credits:
>>>>     Ira: Referred to his task document, review comments.
>>>>     Fabio: Referred to his boiler plate commit message and his description
>>>>     
>>>>            about why kmap_local_page() should be preferred.
>>>>
>>>> ---
>>>>
>>>>    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 10 +++++-----
>>>>    1 file changed, 5 insertions(+), 5 deletions(-)
>>>>
> 
> [snip]
>   
>> However I am unsure if disabling pagefaulting is needed or not. Thomas,
>> Matt, being the last to touch this area, perhaps you could have a look?
>> Because I notice we have a fallback iomap path which still uses
>> io_mapping_map_atomic_wc. So if kmap_atomic to kmap_local conversion is
>> safe, does the iomap side also needs converting to
>> io_mapping_map_local_wc? Or they have separate requirements?
> 
> AFAIK, the requirements for io_mapping_map_local_wc() are the same as for
> kmap_local_page(): the kernel virtual address is _only_ valid in the caller
> context, and map/unmap nesting must be done in stack-based ordering (LIFO).
> 
> I think a follow up patch could safely switch to io_mapping_map_local_wc() /
> io_mapping_unmap_local_wc since the address is local to context.
> 
> However, not being an expert, reading your note now I suspect that I'm missing
> something. Can I ask why you think that page-faults disabling might be
> necessary?

I am not saying it is, was just unsure and wanted some people who worked on this code most recently to take a look and confirm.

I guess it will work since the copying is done like this anyway:

		/*
		 * This is the fast path and we cannot handle a pagefault
		 * whilst holding the struct mutex lest the user pass in the
		 * relocations contained within a mmaped bo. For in such a case
		 * we, the page fault handler would call i915_gem_fault() and
		 * we would try to acquire the struct mutex again. Obviously
		 * this is bad and so lockdep complains vehemently.
		 */
		pagefault_disable();
		copied = __copy_from_user_inatomic(r, urelocs, count * sizeof(r[0]));
		pagefault_enable();
		if (unlikely(copied)) {
			remain = -EFAULT;
			goto out;
		}

Comment is a bit outdated since we don't use that global "struct mutex" any longer, but in any case, if there is a page fault on the mapping where we need to recurse into i915 again to satisfy if, we seem to have code already to handle it. So kmap_local conversion I *think* can't regress anything.

Patch to convert the io_mapping_map_atomic_wc can indeed come later.

In terms of logistics - if we landed this series to out branch it would be queued only for 6.5. Would that work for you?

Regards,

Tvrtko
