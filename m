Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ED281A604
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 18:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D98B10E170;
	Wed, 20 Dec 2023 17:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB4110E170;
 Wed, 20 Dec 2023 17:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703092250; x=1734628250;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MRftkw61N1IaDOYcEBtyXLKhv8bLSWH5WdBRNa3VVsg=;
 b=fMOYzYGthQL9O/VKzvzDK/RiJOTkHepw3DUe0NIYscTIsGPAbame5M3k
 1Q9Xuzj325t1vxEJFNbAtDxidMS1uRCNNoTuP7OhPDRGV4B55mL88Joni
 6USo5vk1xDkgaVFvDLKi4EYlHWIaMJeVoZ5HcMUMKUSmJTR0DeaoTaoNk
 wHNdHFBGEGZl3KuIqRuuSWqJhjXxari9zhLQlxyZWAp1qIjV6kN5CckFL
 j9f4rC3tPyOModUbprzkNurQd4qBkCdS5D4gFc1ecsvYxz2Hnpi/RXL1f
 RfHwHH4apuZb+/VKA6x03H3QM5Hl/X0+Ts1RyyNi8XAL2jkjW4WEtWxcS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="3079416"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="3079416"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 09:10:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="810669421"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="810669421"
Received: from kabdulsa-mobl.gar.corp.intel.com (HELO [10.249.254.197])
 ([10.249.254.197])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 09:10:39 -0800
Message-ID: <1f60119f-a083-258f-20b6-237f67a81ca4@linux.intel.com>
Date: Wed, 20 Dec 2023 18:10:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/xe/vm: Fix an error path
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20231220144214.2077-1-thomas.hellstrom@linux.intel.com>
 <xha45ldvurbfzou45zdtcygtczipw3dfw3jkokqx3oxfvrk7iu@4kswrmq6qrx2>
 <a3ec9850-19eb-c99d-eafa-ad7eda8cb796@linux.intel.com>
 <fgz7xxwduilcxjtqig4lfbmjphb4drwhemdc5m3rsrcev3fbwu@fciw2gey3xsv>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <fgz7xxwduilcxjtqig4lfbmjphb4drwhemdc5m3rsrcev3fbwu@fciw2gey3xsv>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>,
 Danilo Krummrich <dakr@redhat.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/20/23 17:29, Lucas De Marchi wrote:
> On Wed, Dec 20, 2023 at 05:17:49PM +0100, Thomas Hellström wrote:
>>
>> On 12/20/23 17:13, Lucas De Marchi wrote:
>>> On Wed, Dec 20, 2023 at 03:42:14PM +0100, Thomas Hellström wrote:
>>>> If using the VM_BIND_OP_UNMAP_ALL without any bound vmas for the
>>>> vm, we will end up dereferencin an uninitialized variable and leak a
>>>
>>> dereferencing
>>>
>>>> bo lock. Fix this.
>>>>
>>>> Reported-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>>>> Closes: 
>>>> https://lore.kernel.org/intel-xe/jrwua7ckbiozfcaodx4gg2h4taiuxs53j5zlpf3qzvyhyiyl2d@pbs3plurokrj/
>>>> Suggested-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>>>> Fixes: 9f232f4ae249 ("drm/xe: Port Xe to GPUVA")
>>>>
>>>
>>> ^ this newline needs to be removed so `git log --format="%(trailers)"'
>>> shows everything, not only your s-o-b.
>> Will fix these.
>>>
>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
>>>> 1 file changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>> index 1ca917b8315c..127842656a23 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>> @@ -2063,9 +2063,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, 
>>>> struct xe_bo *bo,
>>>>         if (err)
>>>>             return ERR_PTR(err);
>>>>
>>>> -        vm_bo = drm_gpuvm_bo_find(&vm->gpuvm, obj);
>>>> -        if (!vm_bo)
>>>> -            break;
>>>> +        vm_bo = drm_gpuvm_bo_obtain(&vm->gpuvm, obj);
>>>
>>> if the issue with that we don't have any bound vmas, why are we 
>>> going to
>>> create a new one just to be released?
>>
>> The expected outcome of this operation, AFAICT is, rather than to 
>> error, to create  an ops with an empty list of operations, so we 
>> could in theory kmalloc ops and just initialize its list. However 
>> that would be fragile and second-guessing what gpuvm does internally, 
>> so I opted for this solution instead.
>
> ok,
>
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> Adding dri-devel and Danilo to Cc as it looks like we are the first
> users of this api.
>
> The NULL vs ptr-error between _find and _obtain looked suspicious when I
> first looked, but they match the current implementation.
>
> thanks
> Lucas De Marchi

Thanks for reviewing, Lucas.

/Thomas



>
>>
>> /Thomas
>>
>>
>>
>>>
>>> Lucas De Marchi
>>>
>>>> +        if (IS_ERR(vm_bo)) {
>>>> +            xe_bo_unlock(bo);
>>>> +            return ERR_CAST(vm_bo);
>>>> +        }
>>>>
>>>>         ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
>>>>         drm_gpuvm_bo_put(vm_bo);
>>>> -- 
>>>> 2.42.0
>>>>
