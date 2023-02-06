Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE7E68BF9A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 15:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633B010E0CC;
	Mon,  6 Feb 2023 14:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F49C10E0CC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 14:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675692641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lwje8eVt7eXKybxFr462oqT0TYGic+yXzXszDGevFbE=;
 b=abWaI7xydZThvoQXvaVC8TtRw1Ziwi3LHpgNDqgkiynvOV9c40pAC9GmkuZgiXzy4TqNNG
 wDeOwdo14XFRHX9MQhK71scspzk03Xj2n2nAim+hZG4fi+5Vg/mXoGc05ebY8X4qSr112L
 3N3x6WLzPY5tYmGaGPW8lqoL5iam+d4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-343-yVa3rTOiMEyFL0CYZuokGw-1; Mon, 06 Feb 2023 09:10:39 -0500
X-MC-Unique: yVa3rTOiMEyFL0CYZuokGw-1
Received: by mail-ed1-f69.google.com with SMTP id
 cb24-20020a0564020b7800b004aab5e79e6bso1381918edb.23
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 06:10:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lwje8eVt7eXKybxFr462oqT0TYGic+yXzXszDGevFbE=;
 b=JY9Dz7athPZmRH75G4hk8f+M1foQh9eocJDpIGG1uSXUXuGpwqmIILs9czPoOjqLAg
 9/O1mx8m2GzoWs5roOOBtqLPdj/ba4ESic5M7cDbeRTNSUb2yuH2L6psASIobFW6RF6W
 smVv7xhZBYIfhwirB2UHYIVjs/HiIeRC2jY6BnEJiIkqHC2EYu3DNjfYcXFMRIwqGckM
 FwdiRdj8tQyD9byLAb0r3IY825DgstMzRWOEOIHLPZkES+MNcKLdYdI+C9MF0F/F6gai
 n691HOSZlBObl06dSUrqDqIitzMZv0IrTohOf85EBeUMA8olGcz3EG1lU386xzooUVDn
 xfIQ==
X-Gm-Message-State: AO0yUKWqsFKNJMuJNcakfXcvSwCl2Ohp/lqvMqFL/7YVXoLskDwQdrG3
 AqA8eo1Bp5dG6gaC/eVFHhwX/rQ4HwkOcTXWq8oqYLhRVKyMyOmvP05azIPFbYl6ZGpaDNyh9co
 /9AeGQkbgGrVPN3mtOaxN70hdeMn1
X-Received: by 2002:a17:906:9610:b0:887:dea8:b025 with SMTP id
 s16-20020a170906961000b00887dea8b025mr23081893ejx.65.1675692638492; 
 Mon, 06 Feb 2023 06:10:38 -0800 (PST)
X-Google-Smtp-Source: AK7set/ZSeTcdWpLCRrHXd8AjWFnlgDO3CvqRfDlskfptE4Zi0pC0s+i2h2ytva6c0THMVfUFgf5XQ==
X-Received: by 2002:a17:906:9610:b0:887:dea8:b025 with SMTP id
 s16-20020a170906961000b00887dea8b025mr23081857ejx.65.1675692638197; 
 Mon, 06 Feb 2023 06:10:38 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a170906094f00b0087fa83790d8sm5580399ejd.13.2023.02.06.06.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 06:10:37 -0800 (PST)
Message-ID: <67958920-c5bb-a0f5-2306-e3ae4fdbaeb3@redhat.com>
Date: Mon, 6 Feb 2023 14:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Nouveau] [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi
 interfaces
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
 <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
 <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
 <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
 <3a76bfa9-8ee5-a7d9-b9fb-a98181baec0b@redhat.com>
 <49ac3f95-6eda-9009-4b28-0167213301b2@amd.com>
 <bc523c5c-efe6-1a7f-b49a-e0867dc1413d@redhat.com>
 <15fb0179-c7c5-8a64-ed08-841189919f5e@redhat.com>
 <1840e9fb-fd1b-79b7-4238-54ae97333d0b@amd.com>
 <CAPM=9txON8VCb3H7vDY_DOgtUg2Ad3mBvYVxgSMyZ1noOu-rBQ@mail.gmail.com>
 <a1c526e0-0df7-12cb-c5a1-06e9cd0d876b@amd.com>
 <3f935a7e-fede-2bad-c029-4a3af850c9b5@redhat.com>
 <95d0631b-545c-ea4d-7439-75422e9a9120@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <95d0631b-545c-ea4d-7439-75422e9a9120@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Matthew Brost <matthew.brost@intel.com>, jason@jlekstrand.net,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/6/23 10:48, Christian König wrote:
> Am 02.02.23 um 19:31 schrieb Danilo Krummrich:
>> On 2/2/23 12:53, Christian König wrote:
>>> Am 01.02.23 um 09:10 schrieb Dave Airlie:
>>>> [SNIP]
>>>>>> For drivers that don't intend to merge at all and (somehow) are
>>>>>> capable of dealing with sparse regions without knowing the sparse
>>>>>> region's boundaries, it'd be easy to make those gpuva_regions 
>>>>>> optional.
>>>>> Yeah, but this then defeats the approach of having the same hw
>>>>> independent interface/implementation for all drivers.
>>>> I think you are running a few steps ahead here. The plan isn't to have
>>>> an independent interface, it's to provide a set of routines and
>>>> tracking that will be consistent across drivers, so that all drivers
>>>> once using them will operate in mostly the same fashion with respect
>>>> to GPU VA tracking and VA/BO lifetimes. Already in the tree we have
>>>> amdgpu and freedreno which I think end up operating slightly different
>>>> around lifetimes. I'd like to save future driver writers the effort of
>>>> dealing with those decisions and this should drive their user api
>>>> design so to enable vulkan sparse bindings.
>>>
>>> Ok in this case I'm pretty sure this is *NOT* a good idea.
>>>
>>> See this means that we define the UAPI implicitly by saying to 
>>> drivers to use a common framework for their VM implementation which 
>>> then results in behavior A,B,C,D....
>>>
>>> If a driver strides away from this common framework because it has 
>>> different requirements based on how his hw work you certainly get 
>>> different behavior again (and you have tons of hw specific 
>>> requirements in here).
>>>
>>> What we should do instead if we want to have some common handling 
>>> among drivers (which I totally agree on makes sense) then we should 
>>> define the UAPI explicitly.
>>
>> By asking that I don't want to say I'm against this idea, I'm just 
>> wondering how it becomes easier to deal with "tons of hw specific 
>> requirements" by generalizing things even more?
> 
> I'm already maintaining two different GPU VM solutions in the GPU 
> drivers in the kernel, radeon and amdgpu. The hw they driver is 
> identical, just the UAPI is different. And only because of the different 
> UAPI they can't have the same VM backend implementation.
> 
> The hw stuff is completely abstract able. That's just stuff you need to 
> consider when defining the structures you pass around.

Wouldn't we need to have strict limitations on that, such that HW 
specific structures / fields are not allowed to break the semantics of 
the UAPI? Because otherwise we wouldn't be able to attach generalized 
components to the unified UAPI which ultimately would be the whole 
purpose. So, if this consideration is correct, I'd still see a risk of 
drivers striding away from it because of their requirements. Again, I 
think a unified UAPI is a good idea, but it sounds more difficult to me 
than this last paragraph implies.

> 
> But a messed up UAPI is sometimes impossible to fix because of backward 
> compatibility.
> 
> We learned that the hard way with radeon and mostly fixed it by coming 
> up with a completely new implementation for amdgpu.
> 
>> What makes us think that we do a better job in considering all hw 
>> specific requirements with a unified UAPI than with a more lightweight 
>> generic component for tracking VA mappings?
> 
> Because this defines the UAPI implicitly and that's seldom a good idea.
> 
> As I said before tracking is the easy part of the job. Defining this 
> generic component helps a little bit writing new drivers, but it leaves 
> way to much room for speculations on the UAPI.
> 

Trying to move forward, I agree that a unified UAPI would improve the 
situation regarding the problems you mentioned and the examples you have 
given.

However, not having the GPUVA manager wouldn't give us a unified UAPI 
either. And as long as it delivers a generic component to solve a 
problem while not making the overall situation worse or preventing us 
from reaching this desirable goal of having a unified UAPI I tend to 
think it's fine to have such a component.

>> Also, wouldn't we need something like the GPUVA manager as part of a 
>> unified UAPI?
> 
> Not necessarily. We can write components to help drivers implement the 
> UAPI, but this isn't mandatory.

Well, yes, not necessarily. However, as mentioned above, wouldn't it be 
a major goal of a unified UAPI to be able to attach generic components 
to it?

> 
>>
>>>
>>> For example we could have a DRM_IOCTL_GPU_VM which takes both driver 
>>> independent as well as driver dependent information and then has the 
>>> documented behavior:
>>> a) VAs do (or don't) vanish automatically when the GEM handle is closed.
>>> b) GEM BOs do (or don't) get an additional reference for each VM they 
>>> are used in.
>>> c) Can handle some common use cases driver independent (BO mappings, 
>>> readonly, writeonly, sparse etc...).
>>> d) Has a well defined behavior when the operation is executed async. 
>>> E.g. in/out fences.
>>> e) Can still handle hw specific stuff like (for example) trap on 
>>> access etc....
>>> ...
>>>
>>> Especially d is what Bas and I have pretty much already created a 
>>> prototype for the amdgpu specific IOCTL for, but essentially this is 
>>> completely driver independent and actually the more complex stuff. 
>>> Compared to that common lifetime of BOs is just nice to have.
>>>
>>> I strongly think we should concentrate on getting this right as well.
>>>
>>>> Now if merging is a feature that makes sense to one driver maybe it
>>>> makes sense to all, however there may be reasons amdgpu gets away
>>>> without merging that other drivers might not benefit from, there might
>>>> also be a benefit to amdgpu from merging that you haven't looked at
>>>> yet, so I think we could leave merging as an optional extra driver
>>>> knob here. The userspace API should operate the same, it would just be
>>>> the gpu pagetables that would end up different sizes.
>>>
>>> Yeah, agree completely. The point is that we should not have 
>>> complexity inside the kernel which is not necessarily needed in the 
>>> kernel.
>>>
>>> So merging or not is something we have gone back and forth for 
>>> amdgpu, one the one hand it reduces the memory footprint of the 
>>> housekeeping overhead on the other hand it makes the handling more 
>>> complex, error prone and use a few more CPU cycles.
>>>
>>> For amdgpu merging is mostly beneficial when you can get rid of a 
>>> whole page tables layer in the hierarchy, but for this you need to 
>>> merge at least 2MiB or 1GiB together. And since that case doesn't 
>>> happen that often we stopped doing it.
>>>
>>> But for my understanding why you need the ranges for the merging? 
>>> Isn't it sufficient to check that the mappings have the same type, 
>>> flags, BO, whatever backing them?
>>
>> Not entirely. Let's assume userspace creates two virtually contiguous 
>> buffers (VKBuffer) A and B. Userspace could bind a BO with BO offset 0 
>> to A (binding 1) and afterwards bind the same BO with BO offset 
>> length(A) to B (binding 2), maybe unlikely but AFAIK not illegal.
>>
>> If we don't know about the bounds of A and B in the kernel, we detect 
>> that both bindings are virtually and physically contiguous and we 
>> merge them.
> 
> Well as far as I can see this is actually legal and desirable.

Legal, not sure, may depend on the semantics of the UAPI. (More on that 
below your next paragraph.)

Desirable, I don't think so. Since those mappings are associated with 
different VKBuffers they get split up later on anyway, hence why bother 
merging?

> 
>>
>> In the best case this was simply useless, because we'll need to split 
>> them anyway later on when A or B is destroyed, but in the worst case 
>> we could fault the GPU, e.g. if merging leads to a change of the page 
>> tables that are backing binding 1, but buffer A is already in use by 
>> userspace.
> 
> WOW wait a second, regions absolutely don't help you with that anyway.
> 
> You need to keep track which mappings are used or otherwise any 
> modification could lead to problems.
> 
> In other words when the GPU already uses A you *must* have a fence on 
> the page tables backing A to prevent their destruction.
> 

As mentioned above, I'm not entirely sure about that and it might just 
depend on the semantics of the UAPI.

My understanding is that userspace is fully responsible on the parts of 
the GPU VA space it owns. This means that userspace needs to take care 
to *not* ask the kernel to modify mappings that are in use currently. 
Hence, the kernel is in charge to not modify mappings it set up on 
behalf of userspace unless userspace explicitly asks the kernel to do so.

If those are valid preconditions, and based on them we want to support 
merging, the kernel must know about the VA space allocations (or 
VKBuffers in userspace terminology) to make sure it never merges across 
their boundaries, which might not make much sense anyway.

>>
>> In Nouveau, I think we could also get rid of regions and do something 
>> driver specific for the handling of the dual page tables, which I want 
>> to use for sparse regions *and* just don't merge (at least for now). 
>> But exactly for the sake of not limiting drivers in their HW specifics 
>> I thought it'd be great if merging is supported in case it makes sense 
>> for a specific HW, especially given the fact that memory sizes are 
>> increasing.
> 
> What do you mean with that?
> 
> If you want your page tables to be modifiable while the GPU is using 
> them (which is basically a standard requirement from sparse bindings in 
> Vulkan) you need double housekeeping anyway.
> 
> Those regions strongly sound like you are pushing stuff which should be 
> handled in userspace inside the kernel.

1. userspace allocates a new VKBuffer with the sparse bit set (0x0 - 
0x800000)

2. kernel creates a new region structure with the range 0x800000 and 
creates a new PT (A) with 4 PTEs with the sparse flag set (page shift is 21)

3. userspace requests a memory backed mapping at 0x200000 with size 0x2000

4. kernel creates a new mapping structure with base address 0x200000 and 
range 0x2000 and creates a new PT (B) with 2 PTEs (page shift is 12) 
"overlaying" PT A

5. userspace crashes unexpectedly for some reason

6. kernel needs to clean things up, iterates the list of mappings and 
unmaps them (PT B is freed); kernel iterates all regions and removes 
them (PT A is freed)

> 
> Regards,
> Christian.
> 
>>
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>
>>>>
>>>> Dave.
>>>
>>
> 

