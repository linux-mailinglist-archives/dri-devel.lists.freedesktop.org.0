Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28F4B3FC30
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 12:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C159B10E657;
	Tue,  2 Sep 2025 10:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGPcupPC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AD810E650;
 Tue,  2 Sep 2025 10:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756808608; x=1788344608;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mHEnThLBS/vrdkpi7JOBIFLyRCX2mGze8LV9OXZ7m8c=;
 b=BGPcupPCeqSk/LEwf8WEx6kMBcV8mCYGP2r7vMhbTdG7mDOc4bYgTGuI
 +9U69YXV9RzJucUmREMnpvHboMmdNSathIEucWGKiz2j/IyQr/u2cccsE
 Ss3H/1UcCwAaDUtLzASMBH4teFgq3Py4zMzITlAdKpUi5R4yLWOCVS1QL
 mF/asTsS8567I7GFfyHfrdhVN4yzrHU5ZKewpcC+gKSc95Q58DKmXSJS0
 NKBHOoo6efjgtQsxBpBUrO+fa13jXbDHCvlXDYImjpcRe4Vrh1hVxMlKH
 RrzUjJUOrpjcmsWZHAkg32v7uDKwmEYvPkB53Dj5D92HzPo1AREBHzqsv Q==;
X-CSE-ConnectionGUID: SzeC1yacRSu1anUqQvbW2Q==
X-CSE-MsgGUID: kUREPYglSSmHfNecA3RaEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58773184"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="58773184"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 03:23:27 -0700
X-CSE-ConnectionGUID: u7cKxo3mTX6f8PmEYuqAoQ==
X-CSE-MsgGUID: ZUVy71gATDS8YBav2TyQUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171202260"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.245.71])
 ([10.245.245.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 03:23:25 -0700
Message-ID: <78720cf5-022a-40c4-b5ea-db4ac811bd29@intel.com>
Date: Tue, 2 Sep 2025 11:23:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] drm/gpusvm: fix hmm_pfn_to_map_order() usage
To: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20250818152152.67815-10-matthew.auld@intel.com>
 <20250818152152.67815-11-matthew.auld@intel.com>
 <aKNlPkAEXJ9/j1Hy@lstrano-desk.jf.intel.com> <aLa0ejSifS16yA31@fdugast-desk>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <aLa0ejSifS16yA31@fdugast-desk>
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

On 02/09/2025 10:10, Francois Dugast wrote:
> On Mon, Aug 18, 2025 at 10:39:10AM -0700, Matthew Brost wrote:
>> On Mon, Aug 18, 2025 at 04:21:54PM +0100, Matthew Auld wrote:
>>> Handle the case where the hmm range partially covers a huge page (like
>>> 2M), otherwise we can potentially end up doing something nasty like
>>> mapping memory which is outside the range, and maybe not even mapped by
>>> the mm. Fix is based on the xe userptr code, which in a future patch
>>> will directly use gpusvm, so needs alignment here.
>>>
>>> v2:
>>>    - Add kernel-doc (Matt B)
>>>    - s/fls/ilog2/ (Thomas)
>>>
>>> Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/drm_gpusvm.c | 33 +++++++++++++++++++++++++++++++--
>>>   1 file changed, 31 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
>>> index 661306da6b2d..50a36e7b71e2 100644
>>> --- a/drivers/gpu/drm/drm_gpusvm.c
>>> +++ b/drivers/gpu/drm/drm_gpusvm.c
>>> @@ -708,6 +708,35 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
>>>   	return range;
>>>   }
>>>   
>>> +/**
>>> + * drm_gpusvm_hmm_pfn_to_order() - Get the largest CPU mapping order.
>>> + * @hmm_pfn: The current hmm_pfn.
>>> + * @hmm_pfn_index: Index of the @hmm_pfn within the pfn array.
>>> + * @npages: Number of pages within the pfn array i.e the hmm range size.
>>> + *
>>> + * To allow skipping PFNs with the same flags (like when they belong to
>>> + * the same huge PTE) when looping over the pfn array, take a given a hmm_pfn,
>>> + * and return the largest order that will fit inside the CPU PTE, but also
>>> + * crucially accounting for the original hmm range boundaries.
>>> + *
>>> + * Return: The largest order that will safely fit within the size of the hmm_pfn
>>> + * CPU PTE.
>>> + */
>>> +static unsigned int drm_gpusvm_hmm_pfn_to_order(unsigned long hmm_pfn,
>>> +						unsigned long hmm_pfn_index,
>>> +						unsigned long npages)
>>> +{
>>> +	unsigned long size;
>>> +
>>> +	size = 1UL << hmm_pfn_to_map_order(hmm_pfn);
>>> +	size -= (hmm_pfn & ~HMM_PFN_FLAGS) & (size - 1);
>>> +	hmm_pfn_index += size;
>>> +	if (hmm_pfn_index > npages)
>>> +		size -= (hmm_pfn_index - npages);
>>
>> Hmm, okay. On the core MM side, we’ve discussed updating HMM to populate
>> PFNs only at order granularity. If that lands, this code could break in
>> some odd cases. That argues for leaving HMM as-is for now. For the
>> moment, this code works, but we should keep an eye on HMM—or
>> future-proof it by populating all potentially absent entries.
>>
> 
> For reference, this is the patch which mentions possibly only sparsely
> populating HMM PFNs in the future:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new.git/tree/patches/mm-hmm-populate-pfns-from-pmd-swap-entry.patch

Thanks for the link. I don't immediately see the connection with this 
change and the linked patch. With that linked change we are still 
basically using the PTE size when encoding the hmm pfn or did something 
else change? So say if we hmm fault a range partially covering that huge 
PTE, the hmm pfn order will still be that of the huge PTE to facilitate 
potentially skipping entries later?

For example say we have 2M PTE and you hmm fault only the final 4K page 
at the end, the order of the hmm pfn will still be 2M, right? Taking 
that same example but now we hmm fault the final 4K page within the 2M 
PTE plus also the 4K page after it, so just 8K range. Without this patch 
in get_pages() it will incorrectly think it is mapping a full 2M page 
when looking at the order of the first hmm pfn and skip mapping that 
second 4K page, in addition it just created a 2M mapping instead of 8K. 
With this patch it will take into account the hmm range and instead give 
you 4K + 4K.

Sorry if I'm totally misunderstanding something here.

> 
> Francois
>   
>> Matt
>>
>>> +
>>> +	return ilog2(size);
>>> +}
>>> +
>>>   /**
>>>    * drm_gpusvm_check_pages() - Check pages
>>>    * @gpusvm: Pointer to the GPU SVM structure
>>> @@ -766,7 +795,7 @@ static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
>>>   			err = -EFAULT;
>>>   			goto err_free;
>>>   		}
>>> -		i += 0x1 << hmm_pfn_to_map_order(pfns[i]);
>>> +		i += 0x1 << drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
>>>   	}
>>>   
>>>   err_free:
>>> @@ -1342,7 +1371,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>>>   	for (i = 0, j = 0; i < npages; ++j) {
>>>   		struct page *page = hmm_pfn_to_page(pfns[i]);
>>>   
>>> -		order = hmm_pfn_to_map_order(pfns[i]);
>>> +		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
>>>   		if (is_device_private_page(page) ||
>>>   		    is_device_coherent_page(page)) {
>>>   			if (zdd != page->zone_device_data && i > 0) {
>>> -- 
>>> 2.50.1
>>>

