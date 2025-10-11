Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5400CBCF1BB
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 10:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6CB10E0F4;
	Sat, 11 Oct 2025 08:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="oq2jOLjX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2666010E065;
 Sat, 11 Oct 2025 08:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KTOvwM3g7/iOua++0l9UDibDrlKeHVMbp5NoGImvgUc=; b=oq2jOLjX0NrgWB6Pg5SVF57+14
 X+e0ZeEPtHSXsEWwhhivDxWjZGik7JWm3Tb7qYt85O5Xid8tQHO4mcY5A/vAmR97NSL9icbGL3Ivx
 apxjhanZ0hPBx0N93MR0biI/bim8PdtI2P8+jxoVgoNZLeFga6qloF92rMyQmWN8lVJu+zj8bWOiX
 YZ80VxbNGCcqLgez1SeofaYUJCxXFZq9Io0n8LHelw2z5TlC0d0jhu5QpO/y9qo1llUAL9Z6yT4sw
 LeYJB8+zG0x7vjezQao2fh4kfSg8x7cIHv937XU/ajioCH6FhQmF8Dg8VnbaF4qrl5hrrpsnr9RUi
 LkkwXO0Q==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v7UWX-008ATT-9s; Sat, 11 Oct 2025 10:00:17 +0200
Message-ID: <69279852-e1ed-4caf-a92b-a352ba4b613b@igalia.com>
Date: Sat, 11 Oct 2025 09:00:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Improving the worst case TTM large allocation
 latency
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zack Rusin <zack.rusin@broadcom.com>
References: <20251008115314.55438-1-tvrtko.ursulin@igalia.com>
 <6bba6d25-91f3-49a6-81fc-7a03d891cd1d@amd.com>
 <22228578-a03c-4fc1-85b2-d281525a2b6f@igalia.com>
 <9bb3c06e-25c1-43d8-a4e8-e529c53ff77d@amd.com>
 <45973012f925dbbfdf0636c10f9d051c34f97e2e.camel@linux.intel.com>
 <a300e417-c9df-4e2b-a75f-319aab384b44@igalia.com>
 <d3c56f60ab638891d3d78200876ea11780f5ec21.camel@linux.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <d3c56f60ab638891d3d78200876ea11780f5ec21.camel@linux.intel.com>
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


On 10/10/2025 15:11, Thomas Hellström wrote:
> On Thu, 2025-10-09 at 09:53 +0100, Tvrtko Ursulin wrote:
>>
>> On 08/10/2025 15:39, Thomas Hellström wrote:
>>> On Wed, 2025-10-08 at 16:02 +0200, Christian König wrote:
>>>> On 08.10.25 15:50, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 08/10/2025 13:35, Christian König wrote:
>>>>>> On 08.10.25 13:53, Tvrtko Ursulin wrote:
>>>>>>> Disclaimer:
>>>>>>> Please note that as this series includes a patch which
>>>>>>> touches
>>>>>>> a good number of
>>>>>>> drivers I will only copy everyone in the cover letter and
>>>>>>> the
>>>>>>> respective patch.
>>>>>>> Assumption is people are subscribed to dri-devel so can
>>>>>>> look at
>>>>>>> the whole series
>>>>>>> there. I know someone is bound to complain for both the
>>>>>>> case
>>>>>>> when everyone is
>>>>>>> copied on everything for getting too much email, and also
>>>>>>> for
>>>>>>> this other case.
>>>>>>> So please be flexible.
>>>>>>>
>>>>>>> Description:
>>>>>>>
>>>>>>> All drivers which use the TTM pool allocator end up
>>>>>>> requesting
>>>>>>> large order
>>>>>>> allocations when allocating large buffers. Those can be
>>>>>>> slow
>>>>>>> due memory pressure
>>>>>>> and so add latency to buffer creation. But there is often
>>>>>>> also
>>>>>>> a size limit
>>>>>>> above which contiguous blocks do not bring any performance
>>>>>>> benefits. This series
>>>>>>> allows drivers to say when it is okay for the TTM to try a
>>>>>>> bit
>>>>>>> less hard.
>>>>>>>
>>>>>>> We do this by allowing drivers to specify this cut off
>>>>>>> point
>>>>>>> when creating the
>>>>>>> TTM device and pools. Allocations above this size will skip
>>>>>>> direct reclaim so
>>>>>>> under memory pressure worst case latency will improve.
>>>>>>> Background reclaim is
>>>>>>> still kicked off and both before and after the memory
>>>>>>> pressure
>>>>>>> all the TTM pool
>>>>>>> buckets remain to be used as they are today.
>>>>>>>
>>>>>>> This is especially interesting if someone has configured
>>>>>>> MAX_PAGE_ORDER to
>>>>>>> higher than the default. And even with the default, with
>>>>>>> amdgpu
>>>>>>> for example,
>>>>>>> the last patch in the series makes use of the new feature
>>>>>>> by
>>>>>>> telling TTM that
>>>>>>> above 2MiB we do not expect performance benefits. Which
>>>>>>> makes
>>>>>>> TTM not try direct
>>>>>>> reclaim for the top bucket (4MiB).
>>>>>>>
>>>>>>> End result is TTM drivers become a tiny bit nicer mm
>>>>>>> citizens
>>>>>>> and users benefit
>>>>>>> from better worst case buffer creation latencies. As a side
>>>>>>> benefit we get rid
>>>>>>> of two instances of those often very unreadable mutliple
>>>>>>> nameless booleans
>>>>>>> function signatures.
>>>>>>>
>>>>>>> If this sounds interesting and gets merge the invidual
>>>>>>> drivers
>>>>>>> can follow up
>>>>>>> with patches configuring their thresholds.
>>>>>>>
>>>>>>> v2:
>>>>>>>     * Christian suggested to pass in the new data by
>>>>>>> changing the
>>>>>>> function signatures.
>>>>>>>
>>>>>>> v3:
>>>>>>>     * Moved ttm pool helpers into new ttm_pool_internal.h.
>>>>>>> (Christian)
>>>>>>
>>>>>> Patch #3 is Acked-by: Christian König
>>>>>> <christian.koenig@amd.com>.
>>>>>>
>>>>>> The rest is Reviewed-by: Christian König
>>>>>> <christian.koenig@amd.com>
>>>>>
>>>>> Thank you!
>>>>>
>>>>> So I think now I need acks to merge via drm-misc for all the
>>>>> drivers which have their own trees. Which seems to be just xe.
>>>>
>>>> I think you should ping the XE guys for their opinion, but since
>>>> there shouldn't be any functional change for them you can
>>>> probably go
>>>> ahead and merge the patches to drm-misc-next when there is no
>>>> reply
>>>> in time.
>>>
>>> I will try to do a review tonight. One thing that comes up though,
>>> is
>>> the change to ttm_device_init() where you add pool_flags. I had
>>> another
>>> patch series a number of months ago that added a struct with flags
>>> there instead to select the return value given when OOM. Now that
>>> we're
>>> adding an argument, should we try to use a struct instead so that
>>> we
>>> can use it for more that pool behavior?
>>>
>>>
>>> I'll be able to find a pointer to that series later today.
>>
>> Found it:
>> https://lore.kernel.org/dri-devel/20241002122422.287276-1-thomas.hellstrom@linux.intel.com/
>>
>> Glad to see in that thread it isn't just me permanently slowed down
>> by
>> "false, false" and similar. :)
>>
>> I considered using a struct too and I guess there wasn't too much of
>> a
>> sway that I went with flags. I thought not to overcomplicate with the
>> on
>> stack struct which is mostly not needed for something so low level,
>> and
>> to stick with the old school C visual patterns.
>>
>> Since you only needed a single boolean in your series I suppose you
>> could just follow up on my series if you find it acceptable. Or I can
>> go
>> with yours, no problem either.
> 
> It seems yours has the most momentum ATM. I can follow up on yours. It
> would be great if we could perhaps change the naming of "pool_flags" to
> something more generic.

Do you have a name in mind? For ttm_device_init pool_flags made sense to 
signify they relate only to the poll.

I need to respin anyway since I forgot to include the new header from 
unit tests.

Regards,

Tvrtko

