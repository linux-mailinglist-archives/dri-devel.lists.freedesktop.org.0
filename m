Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9875EA6BA11
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 12:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7698A10E798;
	Fri, 21 Mar 2025 11:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PA9ezNIl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F8910E798;
 Fri, 21 Mar 2025 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742557369; x=1774093369;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gc8LizJ8ahsQCZqkoZQxj6SflmIE3KtW5NgQxy2R+wk=;
 b=PA9ezNIlqFdKY3/sHoTnOohpKFyoCm0TEFuzKm2v1r+B4zuEUdzR+mGe
 TSv6L1WOeVO4/z5YJg+6XChtC6+U7y2MtKIctmRt7w4JhGpUpOADEhcR+
 EpLEjHJMfFryL9GyS22nax+4OhAcOvvsJhwGHISsyqvDNdIF8Nsa37ATp
 OhXB4Zm4JvvmQBrc5HMQZ54pOT+Xiab8G12LPZRiLm/9ukJrWAfpN0PQ7
 IkhO2mVpOAFn0SyJBJk48DJZRiwtIwhviL2JrBuyhWcevoCt96LYUGvXp
 1I0o5Fvo2XVhUELy+QRtxIiyB7ruNkO84IpjEGO76/OVexoxBSOIjVUrM w==;
X-CSE-ConnectionGUID: m6CzW0vcS+OpAy34VwOwzQ==
X-CSE-MsgGUID: rUDfbabCQS2BIua9U98V9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="42984868"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="42984868"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 04:42:49 -0700
X-CSE-ConnectionGUID: hicb9Q74Q/i9ZDTQkftQWg==
X-CSE-MsgGUID: 3p7xtS2pSRCaGd9mKDk50g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="123836556"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.56])
 ([10.245.245.56])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 04:42:47 -0700
Message-ID: <cdb53bdc-bab5-4c85-9b95-4abbd40641c4@intel.com>
Date: Fri, 21 Mar 2025 11:42:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/gpusvm: fix hmm_pfn_to_map_order() usage
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20250320172956.168358-9-matthew.auld@intel.com>
 <20250320172956.168358-10-matthew.auld@intel.com>
 <Z9x9RSvaoexRjj90@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Z9x9RSvaoexRjj90@lstrano-desk.jf.intel.com>
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

On 20/03/2025 20:40, Matthew Brost wrote:
> On Thu, Mar 20, 2025 at 05:29:58PM +0000, Matthew Auld wrote:
>> Handle the case where the hmm range partially covers a huge page (like
>> 2M), otherwise we can potentially end up doing something nasty like
>> mapping memory which potentially is outside the range, and maybe not
>> even mapped by the mm. Fix is based on the xe userptr code, which in a
>> future patch will directly use gpusvm, so needs alignment here.
>>
>> Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/drm_gpusvm.c | 25 +++++++++++++++++++++++--
>>   1 file changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
>> index 2451c816edd5..48993cef4a74 100644
>> --- a/drivers/gpu/drm/drm_gpusvm.c
>> +++ b/drivers/gpu/drm/drm_gpusvm.c
>> @@ -817,6 +817,27 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
>>   	return range;
>>   }
>>   
>> +/*
>> + * To allow skipping PFNs with the same flags (like when they belong to
>> + * the same huge PTE) when looping over the pfn array, take a given a hmm_pfn,
>> + * and return the largest order that will fit inside the PTE, but also crucially
>> + * accounting for the original hmm range boundaries.
>> + */
> 
> I'd make this proper kernel doc given all of drm_gpusvm.c has proper kernel doc.

Ok, typically we don't add kernel-doc for static declarations so didn't 
bother. Will make this consistent. Thanks.

> 
> Otherwise LGTM.
> 
> Matt
> 
>> +static unsigned int drm_gpusvm_hmm_pfn_to_order(unsigned long hmm_pfn,
>> +						unsigned long hmm_pfn_index,
>> +						unsigned long npages)
>> +{
>> +	unsigned long size;
>> +
>> +	size = 1UL << hmm_pfn_to_map_order(hmm_pfn);
>> +	size -= (hmm_pfn & ~HMM_PFN_FLAGS) & (size - 1);
>> +	hmm_pfn_index += size;
>> +	if (hmm_pfn_index > npages)
>> +		size -= (hmm_pfn_index - npages);
>> +
>> +	return fls(size) - 1;
>> +}
>> +
>>   /**
>>    * drm_gpusvm_check_pages() - Check pages
>>    * @gpusvm: Pointer to the GPU SVM structure
>> @@ -875,7 +896,7 @@ static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
>>   			err = -EFAULT;
>>   			goto err_free;
>>   		}
>> -		i += 0x1 << hmm_pfn_to_map_order(pfns[i]);
>> +		i += 0x1 << drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
>>   	}
>>   
>>   err_free:
>> @@ -1408,7 +1429,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>>   	for (i = 0, j = 0; i < npages; ++j) {
>>   		struct page *page = hmm_pfn_to_page(pfns[i]);
>>   
>> -		order = hmm_pfn_to_map_order(pfns[i]);
>> +		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
>>   		if (is_device_private_page(page) ||
>>   		    is_device_coherent_page(page)) {
>>   			if (zdd != page->zone_device_data && i > 0) {
>> -- 
>> 2.48.1
>>

