Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 384D03992EA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 20:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE8B6E1F1;
	Wed,  2 Jun 2021 18:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2246E1F1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 18:53:30 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a11so4672441ejf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 11:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=KnfQDIXt726/WoTHDU0y2I9pVA0g5sP5dXNNQupIAeI=;
 b=SdGEO9VoZlIHW15RB8pQAWnqqIKBSekItsyVfRYbyLIZzbFqwlTDacpkMTQgW2KOgQ
 rAEsl4xSFHtbuMzrsAxTY6ekhcy2rZruBjWx3fja5xeJTefsLkKtwViubYvhCOcoA8IS
 tpBSpbB+h6cwXMoRoQrIwFIoEG0JtwUuj+8vaqn6NzYrcr4NvKESsMAFs4uLXUEoaOyU
 Dz/JhqkofKjGLQE9K8yl8SZXoYL8YMA0ZLR8tgtHDgmvpluuNIxBo61CloBJnx25VRwB
 q9il2IeFxL211Z+a25rjGeQ/5lpm35ZmgHrjw46hsq3LNNrdW7bTwIssSJ9EjqrNjLeA
 tJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=KnfQDIXt726/WoTHDU0y2I9pVA0g5sP5dXNNQupIAeI=;
 b=BCfn/zm8Zksf7/OBj9klUAWodFCCa/5JyE1Lihh4iNwXv5l8uZESyEFi02A4dLoHJO
 w0Eqyn1Ua2Te8RLkh6pqsaanSMOu0aNb6gIwTQKbUT7M3okBFIvwvtEKRGsrY5gWBm0b
 Buas/PSoHxCVz9QH9ZZK1BdMRyDhe4m/sI4wASnW+t/JwV5a5uOZZWoI9OO0H0ifm+bT
 NkIAyM2MsfASj5WhoNXICfZbUv9Rw56LNydwh8lJ7P9LQRTEQw8pP0fs1SUVIAAuNPK8
 Pjx6L0LLsG+AambdGTAvPyvKhTavQbP3KJS1sE0v8oZ8u2z1/EjeLW/+w8diGBrYRhOc
 S5Bg==
X-Gm-Message-State: AOAM533o7g8aM6ZaIB9dqNQ+Iux1PIQ/Bl+B//ZHINpYOvo7y/ynKXO/
 PE5rQsACEEXtAeeihU4iVWg/i3D1xCE=
X-Google-Smtp-Source: ABdhPJxaGZSXN3orcZGZJqdSGCWEjUqqqttNhGtglrtVU3EpWzk9T9Sr9GSet9BscOeSbtOk7SO0tA==
X-Received: by 2002:a17:906:bfc8:: with SMTP id
 us8mr23192719ejb.217.1622660009562; 
 Wed, 02 Jun 2021 11:53:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:cd07:2759:3eec:1d00?
 ([2a02:908:1252:fb60:cd07:2759:3eec:1d00])
 by smtp.gmail.com with ESMTPSA id br21sm392918ejb.124.2021.06.02.11.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 11:53:29 -0700 (PDT)
Subject: Re: [PATCH 02/10] drm/ttm: flip over the range manager to self
 allocated nodes
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <20210602100914.46246-2-christian.koenig@amd.com>
 <9b01d58f-6474-70de-4364-6adad59717a5@shipmail.org>
 <2354a311-c88f-04c5-0211-360c8116b811@gmail.com>
 <23afc41d-09ae-93f3-77b8-e18c8f72dd5a@shipmail.org>
 <b818e5f8-66a4-4df0-ba5b-cc22125d72a2@gmail.com>
 <2719e7af-dbba-2917-0e29-9e36fbc6de00@shipmail.org>
 <55f59f1e-f988-f58a-4e3f-7d419a846ae6@gmail.com>
 <d6f0b8e1-f4a2-cbbd-8b0c-6700ae4f7e58@shipmail.org>
 <fd5e275a-0ed5-3242-07b4-125fcb4e1cfa@gmail.com>
 <3e23fcc1-85a1-3d3f-dc60-563406edc5af@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a196c79b-e5d1-9693-9891-737983de0ae2@gmail.com>
Date: Wed, 2 Jun 2021 20:53:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3e23fcc1-85a1-3d3f-dc60-563406edc5af@shipmail.org>
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



Am 02.06.21 um 20:52 schrieb Thomas Hellström (Intel):
>
> On 6/2/21 8:41 PM, Christian König wrote:
>> Am 02.06.21 um 17:28 schrieb Thomas Hellström (Intel):
>>> Hi!
>>>
>>> On 6/2/21 4:17 PM, Christian König wrote:
>>>> Am 02.06.21 um 16:13 schrieb Thomas Hellström (Intel):
>>>>>
>>>>> On 6/2/21 3:07 PM, Christian König wrote:
>>>>>>
>>>>>>
>>>>>> Am 02.06.21 um 14:33 schrieb Thomas Hellström (Intel):
>>>>>>>
>>>>>>> On 6/2/21 2:11 PM, Christian König wrote:
>>>>>>>> Am 02.06.21 um 13:44 schrieb Thomas Hellström (Intel):
>>>>>>>>>
>>>>>>>>> On 6/2/21 12:09 PM, Christian König wrote:
>>>>>>>>>> Start with the range manager to make the resource object the 
>>>>>>>>>> base
>>>>>>>>>> class for the allocated nodes.
>>>>>>>>>>
>>>>>>>>>> While at it cleanup a lot of the code around that.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>>>>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>>>>>>>> ---
>>>>>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  1 +
>>>>>>>>>>   drivers/gpu/drm/drm_gem_vram_helper.c   |  2 +
>>>>>>>>>>   drivers/gpu/drm/nouveau/nouveau_ttm.c   |  2 +
>>>>>>>>>>   drivers/gpu/drm/qxl/qxl_ttm.c           |  1 +
>>>>>>>>>>   drivers/gpu/drm/radeon/radeon_ttm.c     |  1 +
>>>>>>>>>>   drivers/gpu/drm/ttm/ttm_range_manager.c | 56 
>>>>>>>>>> ++++++++++++++++++-------
>>>>>>>>>>   drivers/gpu/drm/ttm/ttm_resource.c      | 26 ++++++++----
>>>>>>>>>>   include/drm/ttm/ttm_bo_driver.h         | 26 ------------
>>>>>>>>>>   include/drm/ttm/ttm_range_manager.h     | 43 
>>>>>>>>>> +++++++++++++++++++
>>>>>>>>>>   include/drm/ttm/ttm_resource.h          |  3 ++
>>>>>>>>>>   10 files changed, 111 insertions(+), 50 deletions(-)
>>>>>>>>>>   create mode 100644 include/drm/ttm/ttm_range_manager.h
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>>>>> index 69db89261650..df1f185faae9 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>>>>> @@ -45,6 +45,7 @@
>>>>>>>>>>   #include <drm/ttm/ttm_bo_api.h>
>>>>>>>>>>   #include <drm/ttm/ttm_bo_driver.h>
>>>>>>>>>>   #include <drm/ttm/ttm_placement.h>
>>>>>>>>>> +#include <drm/ttm/ttm_range_manager.h>
>>>>>>>>>>     #include <drm/amdgpu_drm.h>
>>>>>>>>>>   diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c 
>>>>>>>>>> b/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>>>>>>> index 83e7258c7f90..17a4c5d47b6a 100644
>>>>>>>>>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>>>>>>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>>>>>>> @@ -17,6 +17,8 @@
>>>>>>>>>>   #include <drm/drm_prime.h>
>>>>>>>>>>   #include <drm/drm_simple_kms_helper.h>
>>>>>>>>>>   +#include <drm/ttm/ttm_range_manager.h>
>>>>>>>>>> +
>>>>>>>>>>   static const struct drm_gem_object_funcs 
>>>>>>>>>> drm_gem_vram_object_funcs;
>>>>>>>>>>     /**
>>>>>>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c 
>>>>>>>>>> b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>>>>>>>>>> index 65430912ff72..b08b8efeefba 100644
>>>>>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
>>>>>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>>>>>>>>>> @@ -26,6 +26,8 @@
>>>>>>>>>>   #include <linux/limits.h>
>>>>>>>>>>   #include <linux/swiotlb.h>
>>>>>>>>>>   +#include <drm/ttm/ttm_range_manager.h>
>>>>>>>>>> +
>>>>>>>>>>   #include "nouveau_drv.h"
>>>>>>>>>>   #include "nouveau_gem.h"
>>>>>>>>>>   #include "nouveau_mem.h"
>>>>>>>>>> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c 
>>>>>>>>>> b/drivers/gpu/drm/qxl/qxl_ttm.c
>>>>>>>>>> index 8aa87b8edb9c..19fd39d9a00c 100644
>>>>>>>>>> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
>>>>>>>>>> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
>>>>>>>>>> @@ -32,6 +32,7 @@
>>>>>>>>>>   #include <drm/ttm/ttm_bo_api.h>
>>>>>>>>>>   #include <drm/ttm/ttm_bo_driver.h>
>>>>>>>>>>   #include <drm/ttm/ttm_placement.h>
>>>>>>>>>> +#include <drm/ttm/ttm_range_manager.h>
>>>>>>>>>>     #include "qxl_drv.h"
>>>>>>>>>>   #include "qxl_object.h"
>>>>>>>>>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c 
>>>>>>>>>> b/drivers/gpu/drm/radeon/radeon_ttm.c
>>>>>>>>>> index cdffa9b65108..ad2a5a791bba 100644
>>>>>>>>>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>>>>>>>>>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>>>>>>>>>> @@ -45,6 +45,7 @@
>>>>>>>>>>   #include <drm/ttm/ttm_bo_api.h>
>>>>>>>>>>   #include <drm/ttm/ttm_bo_driver.h>
>>>>>>>>>>   #include <drm/ttm/ttm_placement.h>
>>>>>>>>>> +#include <drm/ttm/ttm_range_manager.h>
>>>>>>>>>>     #include "radeon_reg.h"
>>>>>>>>>>   #include "radeon.h"
>>>>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c 
>>>>>>>>>> b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>>>>>>>> index b9d5da6e6a81..ce5d07ca384c 100644
>>>>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>>>>>>>> @@ -29,12 +29,13 @@
>>>>>>>>>>    * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
>>>>>>>>>>    */
>>>>>>>>>>   -#include <drm/ttm/ttm_bo_driver.h>
>>>>>>>>>> +#include <drm/ttm/ttm_device.h>
>>>>>>>>>>   #include <drm/ttm/ttm_placement.h>
>>>>>>>>>> +#include <drm/ttm/ttm_range_manager.h>
>>>>>>>>>> +#include <drm/ttm/ttm_bo_api.h>
>>>>>>>>>>   #include <drm/drm_mm.h>
>>>>>>>>>>   #include <linux/slab.h>
>>>>>>>>>>   #include <linux/spinlock.h>
>>>>>>>>>> -#include <linux/module.h>
>>>>>>>>>>     /*
>>>>>>>>>>    * Currently we use a spinlock for the lock, but a mutex 
>>>>>>>>>> *may* be
>>>>>>>>>> @@ -60,8 +61,8 @@ static int ttm_range_man_alloc(struct 
>>>>>>>>>> ttm_resource_manager *man,
>>>>>>>>>>                      struct ttm_resource *mem)
>>>>>>>>>>   {
>>>>>>>>>>       struct ttm_range_manager *rman = to_range_manager(man);
>>>>>>>>>> +    struct ttm_range_mgr_node *node;
>>>>>>>>>>       struct drm_mm *mm = &rman->mm;
>>>>>>>>>> -    struct drm_mm_node *node;
>>>>>>>>>>       enum drm_mm_insert_mode mode;
>>>>>>>>>>       unsigned long lpfn;
>>>>>>>>>>       int ret;
>>>>>>>>>> @@ -70,7 +71,7 @@ static int ttm_range_man_alloc(struct 
>>>>>>>>>> ttm_resource_manager *man,
>>>>>>>>>>       if (!lpfn)
>>>>>>>>>>           lpfn = man->size;
>>>>>>>>>>   -    node = kzalloc(sizeof(*node), GFP_KERNEL);
>>>>>>>>>> +    node = kzalloc(struct_size(node, mm_nodes, 1), GFP_KERNEL);
>>>>>>>>>
>>>>>>>>> I'm still a bit confused  about the situation where a driver 
>>>>>>>>> wants to attach private data to a struct ttm_resource without 
>>>>>>>>> having to re-implement its own range manager?
>>>>>>>>>
>>>>>>>>> Could be cached sg-tables, list of GPU bindings etc. Wouldn't 
>>>>>>>>> work with the above unless we have a void *driver_private 
>>>>>>>>> member on the struct ttm_resource. Is that the plan going 
>>>>>>>>> forward here? Or that the driver actually does the 
>>>>>>>>> re-implementation?
>>>>>>>>
>>>>>>>> I don't really understand your concern here. The basic idea is 
>>>>>>>> that drivers use ttm_resource as a base class for their own 
>>>>>>>> implementation.
>>>>>>>>
>>>>>>>> See for example how nouveau does that:
>>>>>>>>
>>>>>>>> struct nouveau_mem {
>>>>>>>>         struct ttm_resource base;
>>>>>>>>         struct nouveau_cli *cli;
>>>>>>>>         u8 kind;
>>>>>>>>         u8 comp;
>>>>>>>>         struct nvif_mem mem;
>>>>>>>>         struct nvif_vma vma[2];
>>>>>>>> };
>>>>>>>>
>>>>>>>> The range manager is helping driver specific resource managers 
>>>>>>>> which want to implement something drm_mm_nodes based. E.g. 
>>>>>>>> amdgpu_gtt_mgr and amdgpu_vram_mgr, but it can also be used 
>>>>>>>> stand alone.
>>>>>>>>
>>>>>>>> The ttm_range_mgr_node can then be used as base class for this 
>>>>>>>> functionality. I already want to move some more code from 
>>>>>>>> amdgpu_vram_mgr.c into the range manager, but that is just 
>>>>>>>> minor cleanup work.
>>>>>>>>
>>>>>>> Sure but if you embed a ttm_range_mgr_node in your struct 
>>>>>>> i915_resource, and wanted to use the ttm range manager for it, 
>>>>>>> it would allocate a struct ttm_range_mgr_node rather than a 
>>>>>>> struct i915_resource? Or am I missing something?
>>>>>>
>>>>>> Yes, that's the general idea I'm targeting for. I'm just not 
>>>>>> fully there yet.
>>>>>
>>>>> Hmm, I don't fully understand the reply, I described a buggy 
>>>>> scenario and you replied that's what we're targeting for?
>>>>
>>>> Ok, I don't seem to understand what you mean here. What is buggy on 
>>>> that?
>>>
>>> The buggy thing I'm trying to describe is a scenario where I want to 
>>> have a struct i915_ttm_resource which embeds a struct 
>>> ttm_range_mgr_node, but there is no way I can tell the generic ttm 
>>> range manager to allocate a struct i915_ttm_resource instead of a 
>>> struct ttm_range_mgr_node.
>>>
>>> So what I want to be able to do: I have
>>>
>>> struct i915_ttm_resource {
>>>         struct i915_gpu_bindings gpu_bindings;
>>>         struct ttm_range_mgr_node range_node;
>>> };
>>>
>>> Now I want to be able to share common code as much as possible and 
>>> use the generic ttm_range_manager here. How would I go about doing 
>>> that with the proposed changes?
>>
>> Ah, yes that is the part I haven't moved over yet. In other words 
>> that is not possible yet.
>
> OK, that "yet" sounds good. So this will be possible moving forward? 
> (Basically it's the overall design that's not completely clear to me 
> yet, not really the code itself)

Yes, absolutely.

Christian.

>
> Thanks,
>
> Thomas
>
>

