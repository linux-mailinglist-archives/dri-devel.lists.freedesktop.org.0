Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3A2783B70
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 10:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D088210E302;
	Tue, 22 Aug 2023 08:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509CB10E2E6;
 Tue, 22 Aug 2023 08:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692691856; x=1724227856;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AU/KxE6zBYcXczxlVbmPL9LGTZDkDc+5gNPZOrPAmaM=;
 b=W+3Cy6TIAWK5dFdJZtZAgWce6MWWwxeeuBfEjUIC8xD4OCW+5Vh3mN2t
 Yh9Ru7fqkjjs9WcD2iAadId/V7eOlbQWQR/4m7JK+eYhpk2tYEKemrn4y
 X86J86pIvOLNvDT02fn8KdSYSIBLU+T5NRsUxJKE3eK6V85t/Zio1Kdsl
 xkThIoEhiu2sikdu2sXqKYDbyGU7a8dQAUwIoMVpgBQEYdNeMZsMBKYy3
 xG7TBnhNYLz6m+jq8sE41QI3SV9/AS2wtoOPXPQPU/pT+qsU4IAvIl/Nj
 Pw/rNMN+wk8xkSskxRcbIRJzIfSUfV6/ISAMthsE4+NpA8dr9NdumGgzj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354149045"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="354149045"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 01:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="771276760"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="771276760"
Received: from kahchuno-mobl.gar.corp.intel.com (HELO [10.249.254.65])
 ([10.249.254.65])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 01:10:53 -0700
Message-ID: <418eb6a5-ac41-8f71-2bd0-0cebb48a5c42@linux.intel.com>
Date: Tue, 22 Aug 2023 10:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/4] drm/xe/vm: Perform accounting of userptr pinned pages
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230818150845.96679-1-thomas.hellstrom@linux.intel.com>
 <20230818150845.96679-4-thomas.hellstrom@linux.intel.com>
 <ZOGL4bY8NvFrDP6O@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZOGL4bY8NvFrDP6O@DUT025-TGLU.fm.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/20/23 05:43, Matthew Brost wrote:
> On Fri, Aug 18, 2023 at 05:08:44PM +0200, Thomas Hellström wrote:
>> Account these pages against RLIMIT_MEMLOCK following how RDMA does this
>> with CAP_IPC_LOCK bypassing the limit.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Patch LGTM but nits on naming + possible assert.
>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 43 ++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index ecbcad696b60..d9c000689002 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -34,6 +34,33 @@
>>   
>>   #define TEST_VM_ASYNC_OPS_ERROR
>>   
>> +/*
>> + * Perform userptr PIN accounting against RLIMIT_MEMLOCK for now, similarly
>> + * to how RDMA does this.
>> + */
>> +static int xe_vma_mlock_alloc(struct xe_vma *vma, unsigned long num_pages)
>> +{
> xe_vma_userptr_mlock_alloc? or maybe even xe_vma_userptr_mlock_reserve?
>
>> +	unsigned long lock_limit, new_pinned;
>> +	struct mm_struct *mm = vma->userptr.notifier.mm;
>> +
> This be a candidate to use the new aseert macros to ensure that the vma
> is a userptr + pinned? Not sure if that merged yet.
>
>> +	if (!can_do_mlock())
>> +		return -EPERM;
>> +
>> +	lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
>> +	new_pinned = atomic64_add_return(num_pages, &mm->pinned_vm);
>> +	if (new_pinned > lock_limit && !capable(CAP_IPC_LOCK)) {
>> +		atomic64_sub(num_pages, &mm->pinned_vm);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_vma_mlock_free(struct xe_vma *vma, unsigned long num_pages)
>> +{
> xe_vma_userptr_mlock_free? or maybe even xe_vma_userptr_mlock_release?
>
> Same for the assert here.
>
> Anyways, I'll leave addressing these nits up to you, with that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

OK, thanks. I'll take a look at addressing those.

>
>> +	atomic64_sub(num_pages, &vma->userptr.notifier.mm->pinned_vm);
>> +}
>> +
>>   /**
>>    * xe_vma_userptr_check_repin() - Advisory check for repin needed
>>    * @vma: The userptr vma
>> @@ -89,9 +116,17 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>>   					    !read_only);
>>   		pages = vma->userptr.pinned_pages;
>>   	} else {
>> +		if (xe_vma_is_pinned(vma)) {
>> +			ret = xe_vma_mlock_alloc(vma, num_pages);
>> +			if (ret)
>> +				return ret;
>> +		}
>> +
>>   		pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
>> -		if (!pages)
>> -			return -ENOMEM;
>> +		if (!pages) {
>> +			ret = -ENOMEM;
>> +			goto out_account;
>> +		}
>>   	}
>>   
>>   	pinned = ret = 0;
>> @@ -187,6 +222,9 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>>   mm_closed:
>>   	kvfree(pages);
>>   	vma->userptr.pinned_pages = NULL;
>> +out_account:
>> +	if (xe_vma_is_pinned(vma))
>> +		xe_vma_mlock_free(vma, num_pages);
>>   	return ret;
>>   }
>>   
>> @@ -1004,6 +1042,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>>   			unpin_user_pages_dirty_lock(vma->userptr.pinned_pages,
>>   						    vma->userptr.num_pinned,
>>   						    !read_only);
>> +			xe_vma_mlock_free(vma, xe_vma_size(vma) >> PAGE_SHIFT);
>>   			kvfree(vma->userptr.pinned_pages);
>>   		}
>>   
>> -- 
>> 2.41.0
>>
