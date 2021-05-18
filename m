Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E63F13879D6
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 15:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9773D6EB78;
	Tue, 18 May 2021 13:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207B76EB74;
 Tue, 18 May 2021 13:24:44 +0000 (UTC)
IronPort-SDR: l9L8HyYcfXqcKFiM+WC0PPdG4uTRKuk1DjrL1aqM5f08CJxVgUsg1om9HdpAsE11m88nR3VcTh
 14UMHGeU7COw==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="221762465"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="221762465"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 06:24:43 -0700
IronPort-SDR: I4ShFmhOtID88i2QJjYDQtsk8NyXzU3dxjxKCBX2W6i3Um2GLDRYi0d/Qb5lFnpK8lmxE32Ahg
 tMLhjrctxF4A==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="438662178"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO [10.249.254.195])
 ([10.249.254.195])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 06:24:42 -0700
Subject: Re: [PATCH v2 08/15] drm/i915/ttm Add a generic TTM memcpy move for
 page-based iomem
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-9-thomas.hellstrom@linux.intel.com>
 <6149ee00-fa4a-3757-117a-8d622eb42070@amd.com>
 <45054121-954d-f20c-52b5-f375db7096e0@linux.intel.com>
 <d547a037-2aa8-76a8-375c-5da580fab631@amd.com>
 <400de9b7-f385-0581-ebb5-e07247d4c996@linux.intel.com>
 <b8e062c5-6b63-09c5-e98a-be9bf4813c61@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <0eb87fe5-439d-5077-cf19-015966bc3f5f@linux.intel.com>
Date: Tue, 18 May 2021 15:24:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b8e062c5-6b63-09c5-e98a-be9bf4813c61@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/18/21 3:08 PM, Christian König wrote:
> Am 18.05.21 um 14:52 schrieb Thomas Hellström:
>>
>> On 5/18/21 2:09 PM, Christian König wrote:
>>> Am 18.05.21 um 14:04 schrieb Thomas Hellström:
>>>>
>>>> On 5/18/21 1:55 PM, Christian König wrote:
>>>>>
>>>>>
>>>>> Am 18.05.21 um 10:26 schrieb Thomas Hellström:
>>>>>> The internal ttm_bo_util memcpy uses vmap functionality, and 
>>>>>> while it
>>>>>> probably might be possible to use it for copying in- and out of
>>>>>> sglist represented io memory, using io_mem_reserve() / io_mem_free()
>>>>>> callbacks, that would cause problems with fault().
>>>>>> Instead, implement a method mapping page-by-page using kmap_local()
>>>>>> semantics. As an additional benefit we then avoid the occasional 
>>>>>> global
>>>>>> TLB flushes of vmap() and consuming vmap space, elimination of a 
>>>>>> critical
>>>>>> point of failure and with a slight change of semantics we could 
>>>>>> also push
>>>>>> the memcpy out async for testing and async driver develpment 
>>>>>> purposes.
>>>>>> Pushing out async can be done since there is no memory allocation 
>>>>>> going on
>>>>>> that could violate the dma_fence lockdep rules.
>>>>>>
>>>>>> For copies from iomem, use the WC prefetching memcpy variant for
>>>>>> additional speed.
>>>>>>
>>>>>> Note that drivers that don't want to use struct io_mapping but 
>>>>>> relies on
>>>>>> memremap functionality, and that don't want to use scatterlists for
>>>>>> VRAM may well define specialized (hopefully reusable) iterators 
>>>>>> for their
>>>>>> particular environment.
>>>>>
>>>>> In general yes please since I have that as TODO for TTM for a very 
>>>>> long time.
>>>>>
>>>>> But I would prefer to fix the implementation in TTM instead and 
>>>>> give it proper cursor handling.
>>>>>
>>>>> Amdgpu is also using page based iomem and we are having similar 
>>>>> workarounds in place there as well.
>>>>>
>>>>> I think it makes sense to unify this inside TTM and remove the old 
>>>>> memcpy util function when done.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>
>>>> Christian,
>>>>
>>>> I was thinking when we replace the bo.mem with a pointer (and 
>>>> perhaps have a driver callback to allocate the bo->mem,
>>>> we could perhaps embed a struct ttm_kmap_iter and use it for all 
>>>> mapping in one way or another). That would mean perhaps land this 
>>>> is i915 now and sort out the unification once the struct 
>>>> ttm_resource, struct ttm_buffer_object separation has landed?
>>>
>>> That stuff is ready, reviewed and I'm just waiting for some amdgpu 
>>> changes to land in drm-misc-next to push it.
>>>
>>> But yes in general an iterator for the resource object sounds like 
>>> the right plan to me as well.
>>>
>>> Christian.
>>
>> OK, so then are you OK with landing this in i915 for now? That would 
>> also ofc mean the export you NAK'd but strictly for this memcpy use 
>> until we merge it with TTM?
>
> Well you can of course prototype that in i915, but I really don't want 
> to export the TT functions upstream.

I understand, I once had the same thoughts trying to avoid that as far 
as possible, so this function was actually then added to the ttm_bo 
interface, (hence the awkward naming) as a helper for drivers 
implementing move(), essentially a very special case of 
ttm_bo_move_accel_cleanup(), but anyway, see below:

>
> Can we cleanly move that functionality into TTM instead?

I'll take a look at that, but I think we'd initially be having iterators 
mimicing the current move_memcpy() for the
linear iomem !WC cases, hope that's OK.

/Thomas


>
> Christian.
>
>>
>>
>> /Thomas
>>
>>>
>>>>
>>>> /Thomas
>>>>
>>>>
>>>
>
