Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AD4A6B9F9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 12:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0CC10E7AF;
	Fri, 21 Mar 2025 11:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJyqB89q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E9B10E7AF;
 Fri, 21 Mar 2025 11:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742557061; x=1774093061;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=b/APuZfxWzTvLs3f5u+4RB4Su7WMumMjSeDrutu4+jk=;
 b=FJyqB89qb6CeCT/U/WJ07rUd1JC2NBgboJHfasOYReKwSBrmqATm51pp
 eWD9UlOSQ9WqwhN3n0Vz+3w5D0yuatd6BGpYsIXmLch0Vo+E66UPwjVWV
 dEBdUwRzPMoB47qkNPOzVWViaRku1xm8EpAjlWQF7CSG2QecbG3LQH0Q6
 v6Z82/i4tMcbaNXl3n+J5hDHtGaTAR3Wv1EY8WGKmrAPCVzfO4egq2Fjy
 wQ/eaoBM0lsxvQgztk8SWemw7Z9B97w7Tm7PAgghc6VYM+dMCKBucCD+6
 CYvAbzMUhp1UKyqaCW9NXIXmH+sx2XBBxLEmFsuWp5dprEqidL34q8qe7 w==;
X-CSE-ConnectionGUID: Ay4BABEVRfK9sXQmNs51Cg==
X-CSE-MsgGUID: 01vrdfjqRH6xtC8HHrn91w==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="42984399"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="42984399"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 04:37:40 -0700
X-CSE-ConnectionGUID: irwPoNn2SIqrWW7RM2bw0g==
X-CSE-MsgGUID: 9ZBDOWUJSwKJawASbW/EtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="123083197"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.56])
 ([10.245.245.56])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 04:37:39 -0700
Message-ID: <ecdf304f-437e-4a9b-b165-37570a81b158@intel.com>
Date: Fri, 21 Mar 2025 11:37:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/gpusvm: mark pages as dirty
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250320172956.168358-9-matthew.auld@intel.com>
 <20250320172956.168358-12-matthew.auld@intel.com>
 <df6221a54416141166f98a6eebc495c472bacfe9.camel@linux.intel.com>
 <Z9xtgs/2etNDxStw@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Z9xtgs/2etNDxStw@lstrano-desk.jf.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/03/2025 19:33, Matthew Brost wrote:
> On Thu, Mar 20, 2025 at 08:29:42PM +0100, Thomas Hellström wrote:
>> On Thu, 2025-03-20 at 17:30 +0000, Matthew Auld wrote:
>>> If the memory is going to be accessed by the device, make sure we
>>> mark
>>> the pages accordingly such that the kernel knows this. This aligns
>>> with
>>> the xe-userptr code.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/drm_gpusvm.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gpusvm.c
>>> b/drivers/gpu/drm/drm_gpusvm.c
>>> index 7f1cf5492bba..5b4ecd36dff1 100644
>>> --- a/drivers/gpu/drm/drm_gpusvm.c
>>> +++ b/drivers/gpu/drm/drm_gpusvm.c
>>> @@ -1471,6 +1471,7 @@ int drm_gpusvm_range_get_pages(struct
>>> drm_gpusvm *gpusvm,
>>>   			pages[i] = page;
>>>   		} else {
>>>   			dma_addr_t addr;
>>> +			unsigned int k;
>>>   
>>>   			if (is_zone_device_page(page) || zdd) {
>>>   				err = -EOPNOTSUPP;
>>> @@ -1489,6 +1490,14 @@ int drm_gpusvm_range_get_pages(struct
>>> drm_gpusvm *gpusvm,
>>>   			range->dma_addr[j] =
>>> drm_pagemap_device_addr_encode
>>>   				(addr, DRM_INTERCONNECT_SYSTEM,
>>> order,
>>>   				 dma_dir);
>>> +
>>> +			for (k = 0; k < 1u << order; k++) {
>>> +				if (!ctx->read_only)
>>> +					set_page_dirty_lock(page);
>>> +
>>> +				mark_page_accessed(page);
>>> +				page++;
>>> +			}
>>
>> Actually I think the userptr code did this unnecessarily. This is done
>> in the CPU page-fault handler, which means it's taken care of during
>> hmm_range_fault(). Now if the CPU PTE happens to be present and
>> writeable there will be no fault, but that was done when the page was
>> faulted in anyway.
>>
>> If there was a page cleaning event in between so the dirty flag was
>> dropped, then my understanding is that in addition to an invalidation
>> notifier, also the CPU PTE is zapped, so that it will be dirtied again
>> on the next write access, either by the CPU faulting the page or
>> hmm_range_fault() if there is a GPU page-fault.
>>
>> So I think we're good without this patch.
>>
> 
> I was going to suggest the same thing as Thomas - we are good without
> this patch for the reasons he states.

Ah, will drop this then. Thanks.

> 
> Matt
> 
>> /Thomas
>>
>>
>>
>>>   		}
>>>   		i += 1 << order;
>>>   		num_dma_mapped = i;
>>

