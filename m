Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CEB9D14B7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 16:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8862410E51D;
	Mon, 18 Nov 2024 15:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fJenOKT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2522D10E51F;
 Mon, 18 Nov 2024 15:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9YdKCgxCtnPMYmhWqXxtinRKTito3B/j95kILpfcdFg=; b=fJenOKT1jR6d702GfCpo/Dlnzo
 vp6oBl45a0XAJtm/VFT5nd1BdKdYOEluM4qHWLTOT+GpRdZ+Ato3uq2V6dltFa5S3RN5qSuLoghq0
 XOSbkYQoA/N7T6Xlk1csl3nYQ9SS+LT+ho/hAS/GC5/ObM43qJyKj9Ms+3hspQ7zXvZOLdiSqnvq2
 gKLlap/MFC3ELdOGlJ/APBYhAda49dDp1HtmMAe5kY8dXfWkszUfnR9MGP/8zDfAXR9s/Xj+U0/j4
 ujJgErhm71Z+u0F5IDBxqv3gdKo4kYyZKWV/iAIA57Uc/0iO1BCaXtP24uyHuHRpHbPhidl1h+c7P
 Xa0y95hQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tD3zE-008ZzD-Bi; Mon, 18 Nov 2024 16:48:24 +0100
Message-ID: <5a558d02-34a2-478b-8d33-13a56927dba7@igalia.com>
Date: Mon, 18 Nov 2024 15:48:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] Documentation/gpu: Clarify drm memory stats
 definition
To: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20241116044452.5925-1-Yunxiang.Li@amd.com>
 <20241116044452.5925-4-Yunxiang.Li@amd.com>
 <57e02488-1e6b-4e61-a082-4c54be07e071@igalia.com>
 <SA1PR12MB859961AF9F43B4AE986F54C4ED272@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <SA1PR12MB859961AF9F43B4AE986F54C4ED272@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 18/11/2024 14:56, Li, Yunxiang (Teddy) wrote:
> [Public]
> 
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Sent: Monday, November 18, 2024 9:38
>> On 16/11/2024 04:44, Yunxiang Li wrote:
>>> Define how to handle buffers with multiple possible placement so we
>>> don't get incompatible implementations. Callout the resident
>>> requirement for drm-purgeable- explicitly. Remove the requirement for
>>> there to be only drm-memory- or only drm-resident-, it's not what's
>>> implemented and having both is better for back-compat. Also re-order
>>> the paragraphs to flow better.
>>>
>>> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
>>> CC: dri-devel@lists.freedesktop.org
>>> ---
>>>    Documentation/gpu/drm-usage-stats.rst | 36 ++++++++++++---------------
>>>    1 file changed, 16 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/Documentation/gpu/drm-usage-stats.rst
>>> b/Documentation/gpu/drm-usage-stats.rst
>>> index ff964c707754a..973663f91a292 100644
>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>> @@ -140,13 +140,9 @@ both.
>>>    Memory
>>>    ^^^^^^
>>>
>>> -- drm-memory-<region>: <uint> [KiB|MiB]
>>> -
>>> -Each possible memory type which can be used to store buffer objects
>>> by the -GPU in question shall be given a stable and unique name to be
>>> returned as the -string here.
>>> -
>>> -The region name "memory" is reserved to refer to normal system memory.
>>> +Each possible memory type which can be used to store buffer objects
>>> +by the GPU in question shall be given a stable and unique name to be used as
>> the "<region>"
>>> +string. The region name "memory" is reserved to refer to normal system
>> memory.
>>>
>>>    Value shall reflect the amount of storage currently consumed by the buffer
>>>    objects belong to this client, in the respective memory region.
>>> @@ -154,31 +150,27 @@ objects belong to this client, in the respective memory
>> region.
>>>    Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>>>    indicating kibi- or mebi-bytes.
>>>
>>> -This key is deprecated and is an alias for drm-resident-<region>.
>>> Only one of -the two should be present in the output.
>>
>> IMO the second sentence should stay in principle (I mean at the new location,
>> where you moved it). Intent is to avoid new implementations adding both keys. The
>> fact amdgpu has both is not relevant for that purpose. We don't want someone just
>> reading it is an alias and having to have any doubt whether they need to output both
>> or not.
> 
> I see, yeah I will mention in the drm-memory- part that that tag is legacy amdgpu only behavior.
> 
>>> +- drm-total-<region>: <uint> [KiB|MiB]
>>> +
>>> +The total size of all created buffers including shared and private
>>> +memory. The backing store for the buffers does not have to be
>>> +currently instantiated to count under this category. To avoid double
>>> +counting, if a buffer falls under multiple regions, the
>>> +implementation should pick only one of the regions, and do so in a consistent
>> manner.
>>
>> Addition feels fine to me in principle. I would only suggest rewording it a bit to avoid
>> ambiguity about what it means to "fall under". Perhaps like this:
>>
>> To avoid double counting when buffers can be instantiated in one of the multiple
>> allowed memory regions, the implementation should account the total against only
>> one of the regions, and should pick this region in a consistent manner.
> 
> Ack
> 
>>>
>>>    - drm-shared-<region>: <uint> [KiB|MiB]
>>>
>>>    The total size of buffers that are shared with another file (e.g.,
>>> have more -than a single handle).
>>> -
>>> -- drm-total-<region>: <uint> [KiB|MiB]
>>> -
>>> -The total size of all created buffers including shared and private
>>> memory. The -backing store for the buffers does not have to be
>>> currently instantiated to be -counted under this category.
>>> +than a single handle). Same caveat as drm-total- applies.
>>
>> I suggest to explicitly point out the caveat is the multiple region one.
> 
> and Ack
> 
>>>
>>>    - drm-resident-<region>: <uint> [KiB|MiB]
>>>
>>>    The total size of buffers that are resident (have their backing store present or
>>>    instantiated) in the specified region.
>>>
>>> -This is an alias for drm-memory-<region> and only one of the two
>>> should be -present in the output.
>>
>> I think it does not harm to keep this note at both keys. Or at least make one
>> reference the other for this point specifically.
> 
> Might be easier to just have drm-memory- as a foot note here, instead of its own section

Not entirely sure but as long as the legacy and one key note is easily 
spotted when reading either of the two it works for me.

> 
>>> -
>>>    - drm-purgeable-<region>: <uint> [KiB|MiB]
>>>
>>> -The total size of buffers that are purgeable.
>>> +The total size of buffers that are resident and purgeable.
>>
>> Is it not redundant? How could something not resident be purgeable in the first
>> place?
> 
> There is the possible confusion between buffers having a purgeable bit and buffers in a state that is purgeable, I feel like it's worth an explicit callout since there's also code comments about this difference.

Hm I don't follow this. If you are talking about some implementation 
details does someone viewing this from the outside cares? Anyway, the 
addition does not harm, just that I don't see the need. Feel free to 
leave it.

Regards,

Tvrtko

> 
>>>    For example drivers which implement a form of 'madvise' like functionality can
>>>    here count buffers which have instantiated backing store, but have
>>> been marked @@ -192,6 +184,10 @@ One practical example of this can be
>> presence of unsignaled fences in an GEM
>>>    buffer reservation object. Therefore the active category is a subset of
>>>    resident.
>>>
>>> +- drm-memory-<region>: <uint> [KiB|MiB]
>>> +
>>> +This key is deprecated and is an alias for drm-resident-<region> if present.
>>> +
>>>    Implementation Details
>>>    ======================
>>>
>>
>> Regards,
>>
>> Tvrtko
