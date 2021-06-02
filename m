Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C093C398953
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 14:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064136E96C;
	Wed,  2 Jun 2021 12:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0302A6E96C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 12:21:21 +0000 (UTC)
IronPort-SDR: Ekc3eAUp6nFRDL2v2IPn8WkG5dfdlwE29Hcby5bMrtQYwqOpGH/W9GEZm+SuYg0UmItsjzL90O
 eGHZRCKxXDrg==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="184141804"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="184141804"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 05:21:21 -0700
IronPort-SDR: HzAEudMoW43W49xUpozFZlAxPkXqNr1Z+ke2CXNHGzS8Vl++qh31PPy8ZmATFkE4UQBea9G+73
 Ddi4u5oCk+nA==
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="399705606"
Received: from ibanaga-mobl.ger.corp.intel.com (HELO [10.249.254.50])
 ([10.249.254.50])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 05:21:19 -0700
Subject: Re: [PATCH] drm/ttm: nuke VM_MIXEDMAP on BO mappings
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 daniel@ffwll.ch, jgg@ziepe.ca
References: <20210602083013.1561-1-christian.koenig@amd.com>
 <54c5dc94-b367-70dd-ca8f-afcbda7598c6@shipmail.org>
 <001df485-eed3-3638-0464-9a2ab67ac73f@gmail.com>
 <32d661ae-1eab-918d-cd98-40109e6073df@shipmail.org>
 <37a0336b-48d6-67bb-6a71-bba4daef6aa6@gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <eac33818-b266-e973-f811-ba2ffbcd0a2f@linux.intel.com>
Date: Wed, 2 Jun 2021 14:21:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <37a0336b-48d6-67bb-6a71-bba4daef6aa6@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/2/21 2:04 PM, Christian König wrote:
>
>
> Am 02.06.21 um 13:24 schrieb Thomas Hellström (Intel):
>> [SNIP]
>>>>> @@ -576,14 +565,10 @@ static void ttm_bo_mmap_vma_setup(struct 
>>>>> ttm_buffer_object *bo, struct vm_area_s
>>>>>         vma->vm_private_data = bo;
>>>>>   -    /*
>>>>> -     * We'd like to use VM_PFNMAP on shared mappings, where
>>>>> -     * (vma->vm_flags & VM_SHARED) != 0, for performance reasons,
>>>>> -     * but for some reason VM_PFNMAP + x86 PAT + write-combine is 
>>>>> very
>>>>> -     * bad for performance. Until that has been sorted out, use
>>>>> -     * VM_MIXEDMAP on all mappings. See freedesktop.org bug #75719
>>>>> +    /* Enforce VM_SHARED here since no driver backend actually 
>>>>> supports COW
>>>>> +     * on TTM buffer object mappings.
>>>>
>>>> I think by default all TTM drivers support COW mappings in the 
>>>> sense that written data never makes it to the bo but stays in 
>>>> anonymous pages, although I can't find a single usecase. So comment 
>>>> should be changed to state that they are useless for us and that we 
>>>> can't support COW mappings with VM_PFNMAP.
>>>
>>> Well the problem I see with that is that it only works as long as 
>>> the BO is in system memory. When it then suddenly migrates to VRAM 
>>> everybody sees the same content again and the COW pages are dropped. 
>>> That is really inconsistent and I can't see why we would want to do 
>>> that.
>> Hmm, yes, that's actually a bug in drm_vma_manager().
>
> Hui? How is that related to drm_vma_manager() ?
>
Last argument of "unmap_mapping_range()" is "even_cows".
>>>
>>> Additionally to that when you allow COW mappings you need to make 
>>> sure your COWed pages have the right caching attribute and that the 
>>> reference count is initialized and taken into account properly. Not 
>>> driver actually gets that right at the moment.
>>
>> I was under the impression that COW'ed pages were handled 
>> transparently by the vm, you'd always get cached properly refcounted 
>> COW'ed pages but anyway since we're going to ditch support for them, 
>> doesn't really matter.
>
> Yeah, but I would have expected that the new COWed page should have 
> the same caching attributes as the old one and that is not really the 
> case.
>
>>
>>>
>>>>
>>>>>        */
>>>>> -    vma->vm_flags |= VM_MIXEDMAP;
>>>>> +    vma->vm_flags |= VM_PFNMAP | VM_SHARED;
>>>>
>>>> Hmm, shouldn't we refuse COW mappings instead, like my old patch on 
>>>> this subject did? In theory someone could be setting up what she 
>>>> thinks is a private mapping to a shared buffer object, and write 
>>>> sensitive data to it, which will immediately leak. It's a simple 
>>>> check, could open-code if necessary.
>>>
>>> Yeah, though about that as well. Rejecting things would mean we 
>>> potentially break userspace which just happened to work by 
>>> coincident previously. Not totally evil, but not nice either.
>>>
>>> How about we do a WARN_ON_ONCE(!(vma->vm_flags & VM_SHARED)); instead?
>>
>> Umm, yes but that wouldn't notify the user, and would be triggerable 
>> from user-space. But you can also set up legal non-COW mappings 
>> without the VM_SHARED flag, IIRC, see is_cow_mapping(). I think when 
>> this was up for discussion last time we arrived in a 
>> vma_is_cow_mapping() utility...
>
> Well userspace could trigger that only once, so no spamming of the log 
> can be expected here. And extra warnings in the logs are usually 
> reported by people rather quickly.

OK, I'm mostly worried about adding a security flaw that we know about 
from the start.

/Thomas


>
> Christian.
>
>>
>> /Thomas
>>
>>
>
