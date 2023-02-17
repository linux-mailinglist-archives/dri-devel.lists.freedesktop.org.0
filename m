Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779E469AD2C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5E610F015;
	Fri, 17 Feb 2023 13:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A8910F00E;
 Fri, 17 Feb 2023 13:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676641908; x=1708177908;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=44wYXrfZPKgUB+6pmfLeK56RtqXPv67MYQIGGYIWuQs=;
 b=REczyqzcpOkO/KgLG+XHM22AtHYr3JiMMb4Q3BDuvFcEo1tpGKPsqHoD
 /DFrwCPk5jlj3MEDRfS7MG/gFDzCi1oEYQpbIl/N0r4cLMuDWa/+M/W8C
 U54c+gy20bicqZW+pU6KR7NelMThhUgJw0n684Kc8JXEq6QK0oPP5P8yX
 65SRJTYUmg1f3k1WAD4WwiXbVlF1P2xey+VFBZvUD/6V0kC4J/urVv1PA
 i5G6jDhieAsjysomuyN7kABIWshs01PaA+CNVdA8YZNHOifYjZeai6Kyj
 eK7w07vnSud5fw1DG7ntjmGKfNFORyOee+HoTvSkuVppIPALf4kFcGZ+0 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="334185940"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="334185940"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 05:51:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="700905306"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="700905306"
Received: from hlykke-mobl1.ger.corp.intel.com (HELO [10.249.254.184])
 ([10.249.254.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 05:51:46 -0800
Message-ID: <1ca4881b-c470-1f59-03c9-edcddbaa7a6a@linux.intel.com>
Date: Fri, 17 Feb 2023 14:51:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/3] drm/suballoc: Introduce a generic suballocation
 manager
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20230216144847.216259-1-thomas.hellstrom@linux.intel.com>
 <20230216144847.216259-2-thomas.hellstrom@linux.intel.com>
 <35ba51b1-598e-8c43-0eca-8fd538ef2659@amd.com>
 <e44a861e-013b-d509-f3a5-b8973186e321@linux.intel.com>
 <91f82b8e-ff43-8b58-e55f-d1c55f13971f@amd.com>
 <95abe965-ae03-5213-abb3-92ee908e727c@linux.intel.com>
 <ad869cfc-baff-2c7a-7bf9-799c5f125aba@amd.com>
 <6ddd49d2-be2c-3b80-9e77-8cc24cbe64e2@linux.intel.com>
 <728a932c-d65e-9777-de50-6dd8fe9f5708@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <728a932c-d65e-9777-de50-6dd8fe9f5708@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/17/23 14:18, Christian König wrote:
> Am 17.02.23 um 14:10 schrieb Thomas Hellström:
>> [SNIP]
>>>>>>
>>>>>> Any chance you could do a quick performance comparison? If not, 
>>>>>> anything against merging this without the amd / radeon changes 
>>>>>> until we can land a simpler allocator?
>>>>>
>>>>> Only if you can stick the allocator inside Xe and not drm, cause 
>>>>> this seems to be for a different use case than the allocators 
>>>>> inside radeon/amdgpu.
>>>>
>>>> Hmm. No It's allocating in a ring-like fashion as well.  Let me put 
>>>> together a unit test for benchmaking. I think it would be a failure 
>>>> for the community to end up with three separate suballocators doing 
>>>> the exact same thing for the same problem, really.
>>>
>>> Well exactly that's the point. Those allocators aren't the same 
>>> because they handle different problems.
>>>
>>> The allocator in radeon is simpler because it only had to deal with 
>>> a limited number of fence timelines. The one in amdgpu is a bit more 
>>> complex because of the added complexity for more fence timelines.
>>>
>>> We could take the one from amdgpu and use it for radeon and others 
>>> as well, but the allocator proposed here doesn't even remotely 
>>> matches the requirements.
>>
>> But again, what *are* those missing requirements exactly? What is the 
>> pathological case you see for the current code?
>
> Well very low CPU overhead and don't do anything in a callback.

Well, dma_fence_wait_any() will IIRC register callbacks on all affected 
fences, although admittedly there is no actual allocator processing in them.

>
>>
>> From what I can tell the amdgpu suballocator introduces excessive 
>> complexity to coalesce waits for fences from the same contexts, 
>> whereas the present code just frees from the fence callback if the 
>> fence wasn't already signaled.
>
> And this is exactly the design we had previously which we removed 
> after Dave stumbled over tons of problems with it.

So is the worry that those problems have spilled over in this code then? 
It's been pretty extensively tested, or is it you should never really 
use dma-fence callbacks?

>
>> The fence signalling code that fires that callback is typcally always 
>> run anyway on scheduler fences.
>>
>> The reason we had for not using the amdgpu suballocator as originally 
>> planned was that this complexity made it very hard for us to 
>> undertand it and to fix issues we had with it.
>
> Well what are those problems? The idea is actually not that hardware 
> to understand.

We hit memory corruption, and we spent substantially more time trying to 
debug it than to put together this patch, while never really 
understanding what  happened, nor why you don't see that with amdgpu.

>
> We could simplify it massively for the cost of only waiting for the 
> oldest fence if that helps.

Let me grab the latest version from amdgpu and give it a try again, but 
yes I think that to make it common code we'll need it simpler (and my 
personal wish would be to separate the allocator functionality a bit 
more from the fence waiting, which I guess should be OK if the fence 
waiting is vastly simplified).

/Thomas


>
>
> Regards,
> Christian.
>
>>
>> Regards,
>>
>> Thomas
>
