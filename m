Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCCA387E41
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 19:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915CF6EC45;
	Tue, 18 May 2021 17:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83C36EC45
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 17:10:43 +0000 (UTC)
IronPort-SDR: jYa7k+Xdn5gC8V6iOdzWWQ+JFsCW6x7w1wZazOxb3UvpddH8X1Q/CqIsjTp5mFBEGunj3KTp4V
 E0sS6JkFdg2A==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="198814273"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="198814273"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 10:10:43 -0700
IronPort-SDR: SU/t2hJC82rwKbXNa+thgo2aTMOkKHFYKH9Fk7RRD8lqgxpnXvAGzyXvJNAGnVKq9h4g3BjGrd
 4Pp+3DPVARlg==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="439195063"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO [10.249.254.195])
 ([10.249.254.195])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 10:10:42 -0700
Subject: Re: [PATCH v2 13/15] drm/ttm: Add BO and offset arguments for
 vm_access and vm_fault ttm handlers.
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210518145543.1042429-1-thomas.hellstrom@linux.intel.com>
 <9e465ab2-4272-4a41-2ebf-4b34d4724f77@amd.com>
 <0beb46d3-96c8-dcfd-6540-e23ff7207888@linux.intel.com>
 <151faa7d-c4c0-4f8b-f127-9e82a5432774@amd.com>
 <07c9239c-1d72-26d8-4fe3-378bf826bae2@linux.intel.com>
 <01128dfc-fb5f-6247-9feb-9cd05586d790@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <a924457e-321e-9f16-82c8-2462c2ae7043@linux.intel.com>
Date: Tue, 18 May 2021 19:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <01128dfc-fb5f-6247-9feb-9cd05586d790@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/18/21 5:29 PM, Christian König wrote:
>
>
> Am 18.05.21 um 17:25 schrieb Thomas Hellström:
>>
>> On 5/18/21 5:17 PM, Christian König wrote:
>>>
>>>
>>> Am 18.05.21 um 17:11 schrieb Thomas Hellström:
>>>>
>>>> On 5/18/21 5:07 PM, Christian König wrote:
>>>>> Am 18.05.21 um 16:55 schrieb Thomas Hellström:
>>>>>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>>
>>>>>> This allows other drivers that may not setup the vma in the same way
>>>>>> to use the ttm bo helpers.
>>>>>
>>>>> Uff can you please explain why exactly you need that?
>>>>>
>>>>> Providing the BO is not much of a problem, but having the BO at 
>>>>> different VMA offsets is really a no-go with TTM.
>>>>>
>>>>> Christian.
>>>>
>>>> The current i915 uapi is using different offsets for different 
>>>> caching :/. We're currently working around that by using 
>>>> ttm_bo_type_kernel (no TTM vma offset at all) and i915's offset.
>>>
>>> Can you instead adjust the offset in the mmap callback like we do 
>>> for dma-buf?
>> Will have to take a look.
>>>
>>> That's really a no-go what you describe here because it will mess up 
>>> reverse mapping lockup for buffer movement.
>>
>> You mean the unmap_mapping_range() stuff? That's not a problem since 
>> it's a NOP for kernel ttm buffers, and the i915 move() / 
>> swap_notify() takes care of killing the ptes.
>
> That design is a certain NAK from my side for upstreaming this.
>
> PTE handling is the domain of TTM, drivers should never mess with that 
> directly.

Hmm. May I humbly suggest a different view on this:

I agree fully for ttm_bo_type_device bos but for ttm_bo_type_kernel, TTM 
has no business whatsoever with user-space PTEs. That's really why that 
bo type exists in the first place. But otoh one can of course argue that 
then i915 has no business calling the TTM fault helper for these bos.

So for discrete we can probably do the right thing with 
ttm_bo_type_device. What worries me a bit is when we get to older 
hardware support because whatever we do is by definition going to be 
ugly. At best we might be able to split the address space between i915's 
mmos, and hand the rest to TTM, modifying offsets as you suggest. That 
way a TTM call to unmap_mapping_range() would do the right thing, I think.

/Thomas

>
> Christian.
>
>>
>> While we're in the process of killing that offset flexibility for 
>> discrete, we can't do so for older hardware unfortunately.
>>
>> /Thomas
>>
>>
>>>
>>> Christian.
>>
>>
>>
>>>
>>>>
>>>> /Thomas
>>>>
>>>
>
