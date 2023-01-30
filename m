Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4C26820C6
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 01:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8258310E306;
	Tue, 31 Jan 2023 00:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E4B10E304
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 00:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675125237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=53MHgWs7Ugbg3eJ3sGE2EYx1+FLlBrKb6XWoMq74u/c=;
 b=DOX6p8kiwfMqy/6QGdMAlRyHCh9vr3BLRUwzk5EUa5tmsA6DbBNzk+sNWKg5OU107I2Y9E
 jgL4iizpu4Oqi4DDYlrqGsy4WGATx4pG7TtvxtY3IjzkKP1mDSEnTUmgpKLiB3IBQUgNT3
 rEk1jqwov5P3SFiujE/5cGHhQdHmI18=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-y8z6pfgbNZmzdvjTKpGKFA-1; Mon, 30 Jan 2023 19:33:56 -0500
X-MC-Unique: y8z6pfgbNZmzdvjTKpGKFA-1
Received: by mail-ed1-f69.google.com with SMTP id
 g14-20020a056402090e00b0046790cd9082so9346769edz.21
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 16:33:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=53MHgWs7Ugbg3eJ3sGE2EYx1+FLlBrKb6XWoMq74u/c=;
 b=j8Ea7woo8HKczfOTROQDmRwqTB34Q+XHbiGWHkmTRSldiql9bzkgyuaYHDfBVk3OMY
 XV8vtFr+nRc12J9YiOOAVmmsGo5a9l3A/CDlwjuT9cNJN2CrDG/bz+45ljfTwQ5rUV6F
 Tmpo6yH/iHnGgXuP/BvVN+haDM65c6xPoSOzsPedDylfW7g8i6emBJ60qQktxOILeosb
 xK7QVHxRvRWkQ0nRGlGWmLT1Q4mTD9AylqBsYsOPrCRm+Ybbd2SeLGLrEisosZxaNs9J
 9U0EBXtH7Fx2lb9jGr8PnEK651gF/fQc6qH/zZGzMGlL0VLUJMTydAccP6OZTysGyxBk
 QNXg==
X-Gm-Message-State: AO0yUKVSLecNN4rY/BwpgEM+VfruDNSaeOLxYkAj/v/DxIQ8jTC7JwOw
 rgeV8yvKPq9QEIBu1XdJU9j+x1+w+J6jo51zcMZTwSK8f4yxdKWYGFV0PZftpDG78Na9lQ3mbcB
 HXFP76OmNWuDsyqjFIR5VN5xALctD
X-Received: by 2002:a17:906:71d7:b0:885:5682:7e52 with SMTP id
 i23-20020a17090671d700b0088556827e52mr8714930ejk.13.1675125235244; 
 Mon, 30 Jan 2023 16:33:55 -0800 (PST)
X-Google-Smtp-Source: AK7set/wO+8MYY08YltsC1hKa6IHEpmDv7/lMdXNXozmLAGC2hPQ+we1ncHkUOY0TTO/pO6pkvhy0Q==
X-Received: by 2002:a17:906:71d7:b0:885:5682:7e52 with SMTP id
 i23-20020a17090671d700b0088556827e52mr8714892ejk.13.1675125234722; 
 Mon, 30 Jan 2023 16:33:54 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a170906d21400b008897858bb06sm1879634ejz.119.2023.01.30.16.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 16:33:54 -0800 (PST)
Message-ID: <f93559f3-7c46-789a-8340-aa0138de2469@redhat.com>
Date: Tue, 31 Jan 2023 00:38:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi interfaces
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
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
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <1840e9fb-fd1b-79b7-4238-54ae97333d0b@amd.com>
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
Cc: corbet@lwn.net, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bskeggs@redhat.com,
 jason@jlekstrand.net, nouveau@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/30/23 14:02, Christian König wrote:
> Am 29.01.23 um 19:46 schrieb Danilo Krummrich:
>> On 1/27/23 22:09, Danilo Krummrich wrote:
>>> On 1/27/23 16:17, Christian König wrote:
>>>> Am 27.01.23 um 15:44 schrieb Danilo Krummrich:
>>>>> [SNIP]
>>>>>>>>
>>>>>>>> What you want is one component for tracking the VA allocations 
>>>>>>>> (drm_mm based) and a different component/interface for tracking 
>>>>>>>> the VA mappings (probably rb tree based).
>>>>>>>
>>>>>>> That's what the GPUVA manager is doing. There are gpuva_regions 
>>>>>>> which correspond to VA allocations and gpuvas which represent the 
>>>>>>> mappings. Both are tracked separately (currently both with a 
>>>>>>> separate drm_mm, though). However, the GPUVA manager needs to 
>>>>>>> take regions into account when dealing with mappings to make sure 
>>>>>>> the GPUVA manager doesn't propose drivers to merge over region 
>>>>>>> boundaries. Speaking from userspace PoV, the kernel wouldn't 
>>>>>>> merge mappings from different VKBuffer objects even if they're 
>>>>>>> virtually and physically contiguous.
>>>>>>
>>>>>> That are two completely different things and shouldn't be handled 
>>>>>> in a single component.
>>>>>
>>>>> They are different things, but they're related in a way that for 
>>>>> handling the mappings (in particular merging and sparse) the GPUVA 
>>>>> manager needs to know the VA allocation (or region) boundaries.
>>>>>
>>>>> I have the feeling there might be a misunderstanding. Userspace is 
>>>>> in charge to actually allocate a portion of VA space and manage it. 
>>>>> The GPUVA manager just needs to know about those VA space 
>>>>> allocations and hence keeps track of them.
>>>>>
>>>>> The GPUVA manager is not meant to be an allocator in the sense of 
>>>>> finding and providing a hole for a given request.
>>>>>
>>>>> Maybe the non-ideal choice of using drm_mm was implying something 
>>>>> else.
>>>>
>>>> Uff, well long story short that doesn't even remotely match the 
>>>> requirements. This way the GPUVA manager won't be usable for a whole 
>>>> bunch of use cases.
>>>>
>>>> What we have are mappings which say X needs to point to Y with this 
>>>> and hw dependent flags.
>>>>
>>>> The whole idea of having ranges is not going to fly. Neither with 
>>>> AMD GPUs and I strongly think not with Intels XA either.
>>>
>>> A range in the sense of the GPUVA manager simply represents a VA 
>>> space allocation (which in case of Nouveau is taken in userspace). 
>>> Userspace allocates the portion of VA space and lets the kernel know 
>>> about it. The current implementation needs that for the named 
>>> reasons. So, I think there is no reason why this would work with one 
>>> GPU, but not with another. It's just part of the design choice of the 
>>> manager.
>>>
>>> And I'm absolutely happy to discuss the details of the manager 
>>> implementation though.
>>>
>>>>
>>>>>> We should probably talk about the design of the GPUVA manager once 
>>>>>> more when this should be applicable to all GPU drivers.
>>>>>
>>>>> That's what I try to figure out with this RFC, how to make it 
>>>>> appicable for all GPU drivers, so I'm happy to discuss this. :-)
>>>>
>>>> Yeah, that was really good idea :) That proposal here is really far 
>>>> away from the actual requirements.
>>>>
>>>
>>> And those are the ones I'm looking for. Do you mind sharing the 
>>> requirements for amdgpu in particular?
>>>
>>>>>>> For sparse residency the kernel also needs to know the region 
>>>>>>> boundaries to make sure that it keeps sparse mappings around.
>>>>>>
>>>>>> What?
>>>>>
>>>>> When userspace creates a new VKBuffer with the 
>>>>> VK_BUFFER_CREATE_SPARSE_BINDING_BIT the kernel may need to create 
>>>>> sparse mappings in order to ensure that using this buffer without 
>>>>> any memory backed mappings doesn't fault the GPU.
>>>>>
>>>>> Currently, the implementation does this the following way:
>>>>>
>>>>> 1. Userspace creates a new VKBuffer and hence allocates a portion 
>>>>> of the VA space for it. It calls into the kernel indicating the new 
>>>>> VA space region and the fact that the region is sparse.
>>>>>
>>>>> 2. The kernel picks up the region and stores it in the GPUVA 
>>>>> manager, the driver creates the corresponding sparse mappings / 
>>>>> page table entries.
>>>>>
>>>>> 3. Userspace might ask the driver to create a couple of memory 
>>>>> backed mappings for this particular VA region. The GPUVA manager 
>>>>> stores the mapping parameters, the driver creates the corresponding 
>>>>> page table entries.
>>>>>
>>>>> 4. Userspace might ask to unmap all the memory backed mappings from 
>>>>> this particular VA region. The GPUVA manager removes the mapping 
>>>>> parameters, the driver cleans up the corresponding page table 
>>>>> entries. However, the driver also needs to re-create the sparse 
>>>>> mappings, since it's a sparse buffer, hence it needs to know the 
>>>>> boundaries of the region it needs to create the sparse mappings in.
>>>>
>>>> Again, this is not how things are working. First of all the kernel 
>>>> absolutely should *NOT* know about those regions.
>>>>
>>>> What we have inside the kernel is the information what happens if an 
>>>> address X is accessed. On AMD HW this can be:
>>>>
>>>> 1. Route to the PCIe bus because the mapped BO is stored in system 
>>>> memory.
>>>> 2. Route to the internal MC because the mapped BO is stored in local 
>>>> memory.
>>>> 3. Route to other GPUs in the same hive.
>>>> 4. Route to some doorbell to kick of other work.
>>>> ...
>>>> x. Ignore write, return 0 on reads (this is what is used for sparse 
>>>> mappings).
>>>> x+1. Trigger a recoverable page fault. This is used for things like 
>>>> SVA.
>>>> x+2. Trigger a non-recoverable page fault. This is used for things 
>>>> like unmapped regions where access is illegal.
>>>>
>>>> All this is plus some hw specific caching flags.
>>>>
>>>> When Vulkan allocates a sparse VKBuffer what should happen is the 
>>>> following:
>>>>
>>>> 1. The Vulkan driver somehow figures out a VA region A..B for the 
>>>> buffer. This can be in userspace (libdrm_amdgpu) or kernel (drm_mm), 
>>>> but essentially is currently driver specific.
>>>
>>> Right, for Nouveau we have this in userspace as well.
>>>
>>>>
>>>> 2. The kernel gets a request to map the VA range A..B as sparse, 
>>>> meaning that it updates the page tables from A..B with the sparse 
>>>> setting.
>>>>
>>>> 3. User space asks kernel to map a couple of memory backings at 
>>>> location A+1, A+10, A+15 etc....
>>>>
>>>> 4. The VKBuffer is de-allocated, userspace asks kernel to update 
>>>> region A..B to not map anything (usually triggers a non-recoverable 
>>>> fault).
>>>
>>> Until here this seems to be identical to what I'm doing.
>>>
>>> It'd be interesting to know how amdgpu handles everything that 
>>> potentially happens between your 3) and 4). More specifically, how 
>>> are the page tables changed when memory backed mappings are mapped on 
>>> a sparse range? What happens when the memory backed mappings are 
>>> unmapped, but the VKBuffer isn't de-allocated, and hence sparse 
>>> mappings need to be re-deployed?
>>>
>>> Let's assume the sparse VKBuffer (and hence the VA space allocation) 
>>> is pretty large. In Nouveau the corresponding PTEs would have a 
>>> rather huge page size to cover this. Now, if small memory backed 
>>> mappings are mapped to this huge sparse buffer, in Nouveau we'd 
>>> allocate a new PT with a corresponding smaller page size overlaying 
>>> the sparse mappings PTEs.
>>>
>>> How would this look like in amdgpu?
>>>
>>>>
>>>> When you want to unify this between hw drivers I strongly suggest to 
>>>> completely start from scratch once more.
>>>>
>>
>> I just took some time digging into amdgpu and, surprisingly, aside 
>> from the gpuva_regions it seems like amdgpu basically does exactly the 
>> same as I do in the GPU VA manager. As explained, those region 
>> boundaries are needed for merging only and, depending on the driver, 
>> might be useful for sparse mappings.
>>
>> For drivers that don't intend to merge at all and (somehow) are 
>> capable of dealing with sparse regions without knowing the sparse 
>> region's boundaries, it'd be easy to make those gpuva_regions optional.
> 
> Yeah, but this then defeats the approach of having the same hw 
> independent interface/implementation for all drivers.

That's probably a question of interpretation and I'd rather see it as an 
optional feature. Probably 80% to 90% of the code is for tracking 
mappings, generating split / merge steps on bind / unbind and connect 
the mappings to GEM objects. This would be the same for all the drivers 
and some might opt-in for using the feature of additionally tracking 
regions on top and other won't.

> 
> Let me ask the other way around how does the hw implementation of a 
> sparse mapping looks like for NVidia based hardware?
> 
> For newer AMD hw its a flag in the page tables, for older hw its a 
> register where you can specify ranges A..B. We don't really support the 
> later with AMDGPU any more, but from this interface I would guess you 
> have the second variant, right?

No, it's a flag in the PTEs as well.

However, for a rather huge sparse region the sparse PTEs might have a 
different (larger) page size than the PTEs of the (smaller) memory 
backed mappings. Hence, it might be that when trying to map a small 
memory backed mapping within a huge sparse region, we can *not* just 
change the sparse PTE to point to actual memory, but rather create a new 
PT with a smaller page size kind of overlaying the page table containing 
the sparse PTEs with a greater page size.

In such a situation, tracking the whole (sparse) region (representing 
the whole VA allocation) separately comes in handy.

And of course, as mentioned, tracking regions gives us the bounds for 
merging, which e.g. might be useful to pick a greater page size for 
merged mappings. It might also keep the amount of mappings to track down 
by a little bit, however, this would probably only be relevant if we 
actually have quite a few to merge.

> 
> Christian.
> 
>>
>>>> First of all don't think about those mappings as VMAs, that won't 
>>>> work because VMAs are usually something large. Think of this as 
>>>> individual PTEs controlled by the application. similar how COW 
>>>> mappings and struct pages are handled inside the kernel.
>>>
>>> Why do you consider tracking single PTEs superior to tracking VMAs? 
>>> All the properties for a page you mentioned above should be equal for 
>>> the entirety of pages of a whole (memory backed) mapping, aren't they?
>>>
>>>>
>>>> Then I would start with the VA allocation manager. You could 
>>>> probably base that on drm_mm. We handle it differently in amdgpu 
>>>> currently, but I think this is something we could change.
>>>
>>> It was not my intention to come up with an actual allocator for the 
>>> VA space in the sense of actually finding a free and fitting hole in 
>>> the VA space.
>>>
>>> For Nouveau (and XE, I think) we have this in userspace and from what 
>>> you've written previously I thought the same applies for amdgpu?
>>>
>>>>
>>>> Then come up with something close to the amdgpu VM system. I'm 
>>>> pretty sure that should work for Nouveau and Intel XA as well. In 
>>>> other words you just have a bunch of very very small structures 
>>>> which represents mappings and a larger structure which combine all 
>>>> mappings of a specific type, e.g. all mappings of a BO or all sparse 
>>>> mappings etc...
>>>
>>> Considering what you wrote above I assume that small structures / 
>>> mappings in this paragraph refer to PTEs.
>>>
>>> Immediately, I don't really see how this fine grained resolution of 
>>> single PTEs would help implementing this in Nouveau. Actually, I 
>>> think it would even complicate the handling of PTs, but I would need 
>>> to think about this a bit more.
>>>
>>>>
>>>> Merging of regions is actually not mandatory. We don't do it in 
>>>> amdgpu and can live with the additional mappings pretty well. But I 
>>>> think this can differ between drivers.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>
> 

