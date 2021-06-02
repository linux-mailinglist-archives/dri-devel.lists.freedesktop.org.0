Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E83CB398A34
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 15:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2F26E0BF;
	Wed,  2 Jun 2021 13:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807646E0BF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 13:07:49 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id b9so3694405ejc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 06:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=svP2ss+qbN7gdOZWU4oE2zE9R9jvjPQFkzHT08wZxzg=;
 b=kfycYyV67ZdwXZm6ajnPZHPSYcBFqr2uvMOMfC62Mazv3W530El4AC7u7ZkBzz/wST
 WOZ07Rjf0jKFNRL/V61ua/YkAaizmiRayGf0nUldjcV6l42qb6XK0OjLJR1R88sl/feg
 aoXZgtOoYTcpVIlDiBHOxrny3c6LEiV+zPMNvEPTtosKueaR+cutcCaeTtpyyOfFRLEp
 Gwn1Cyq9XpiRvp1IXkY0Xp/7Lv3vEY3ppqL5ezleNKxfTuvC0WUkWoYCP4M0zYndCvQo
 TTvF+ZVaffDlqORk+rTcgUxRXUxxa9w4NDyYEFuHE6nOzIMpM7s8EBUxN5hIBzqYPhiQ
 AkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=svP2ss+qbN7gdOZWU4oE2zE9R9jvjPQFkzHT08wZxzg=;
 b=V9IvbubKmAxmTDITTrfdc5YObePhtgiX8jLWmGeKTAZDvWYNifJJ3Qow/t/tR15tCS
 6n7ZABoKFEojgir0DfsCrBHWf0wlegEY4I7UOPQdyGWZtn/InHPinEggGqsbVWM8hocQ
 QSUIiGbX5uLzZScxMEhHFLovqZsbvAhYA5xDTwpCm2UkL+IgR4PLpKN+odrsrO+UD2QI
 ZH3d/oIUQJ2Cl2XgnKFMqY94WZbpf8Tz30aNGVLWCDQ5AfITMzYpMtxGICdWW8KiSO7V
 cczyQL96VAQwFq+A8+SmSK5r//It5W/e0sgMB5OOgZxttOrU4zeAsTc4qCsgjxn9C/NK
 +gcQ==
X-Gm-Message-State: AOAM5334kTbrs1oczfxE3DLEues+hqwUChGduc2OyFCs3KCzXoYt1oLX
 zMPZU7is78GiokY/x/j7XbJeprUMnkg=
X-Google-Smtp-Source: ABdhPJyRWEeMTz0+gZ7N4KgwU2ysAXNm23gV7feVyY0FEOa7om/QgDqbqtJ/Jp0rzv0lTTPxpxlJTg==
X-Received: by 2002:a17:906:33d6:: with SMTP id
 w22mr33552199eja.222.1622639268177; 
 Wed, 02 Jun 2021 06:07:48 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:cd07:2759:3eec:1d00?
 ([2a02:908:1252:fb60:cd07:2759:3eec:1d00])
 by smtp.gmail.com with ESMTPSA id i12sm1321720edx.13.2021.06.02.06.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 06:07:46 -0700 (PDT)
Subject: Re: [PATCH 02/10] drm/ttm: flip over the range manager to self
 allocated nodes
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <20210602100914.46246-2-christian.koenig@amd.com>
 <9b01d58f-6474-70de-4364-6adad59717a5@shipmail.org>
 <2354a311-c88f-04c5-0211-360c8116b811@gmail.com>
 <23afc41d-09ae-93f3-77b8-e18c8f72dd5a@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b818e5f8-66a4-4df0-ba5b-cc22125d72a2@gmail.com>
Date: Wed, 2 Jun 2021 15:07:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <23afc41d-09ae-93f3-77b8-e18c8f72dd5a@shipmail.org>
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



Am 02.06.21 um 14:33 schrieb Thomas Hellström (Intel):
>
> On 6/2/21 2:11 PM, Christian König wrote:
>> Am 02.06.21 um 13:44 schrieb Thomas Hellström (Intel):
>>>
>>> On 6/2/21 12:09 PM, Christian König wrote:
>>>> Start with the range manager to make the resource object the base
>>>> class for the allocated nodes.
>>>>
>>>> While at it cleanup a lot of the code around that.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  1 +
>>>>   drivers/gpu/drm/drm_gem_vram_helper.c   |  2 +
>>>>   drivers/gpu/drm/nouveau/nouveau_ttm.c   |  2 +
>>>>   drivers/gpu/drm/qxl/qxl_ttm.c           |  1 +
>>>>   drivers/gpu/drm/radeon/radeon_ttm.c     |  1 +
>>>>   drivers/gpu/drm/ttm/ttm_range_manager.c | 56 
>>>> ++++++++++++++++++-------
>>>>   drivers/gpu/drm/ttm/ttm_resource.c      | 26 ++++++++----
>>>>   include/drm/ttm/ttm_bo_driver.h         | 26 ------------
>>>>   include/drm/ttm/ttm_range_manager.h     | 43 +++++++++++++++++++
>>>>   include/drm/ttm/ttm_resource.h          |  3 ++
>>>>   10 files changed, 111 insertions(+), 50 deletions(-)
>>>>   create mode 100644 include/drm/ttm/ttm_range_manager.h
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> index 69db89261650..df1f185faae9 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> @@ -45,6 +45,7 @@
>>>>   #include <drm/ttm/ttm_bo_api.h>
>>>>   #include <drm/ttm/ttm_bo_driver.h>
>>>>   #include <drm/ttm/ttm_placement.h>
>>>> +#include <drm/ttm/ttm_range_manager.h>
>>>>     #include <drm/amdgpu_drm.h>
>>>>   diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c 
>>>> b/drivers/gpu/drm/drm_gem_vram_helper.c
>>>> index 83e7258c7f90..17a4c5d47b6a 100644
>>>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>>>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>>>> @@ -17,6 +17,8 @@
>>>>   #include <drm/drm_prime.h>
>>>>   #include <drm/drm_simple_kms_helper.h>
>>>>   +#include <drm/ttm/ttm_range_manager.h>
>>>> +
>>>>   static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
>>>>     /**
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c 
>>>> b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>>>> index 65430912ff72..b08b8efeefba 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>>>> @@ -26,6 +26,8 @@
>>>>   #include <linux/limits.h>
>>>>   #include <linux/swiotlb.h>
>>>>   +#include <drm/ttm/ttm_range_manager.h>
>>>> +
>>>>   #include "nouveau_drv.h"
>>>>   #include "nouveau_gem.h"
>>>>   #include "nouveau_mem.h"
>>>> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c 
>>>> b/drivers/gpu/drm/qxl/qxl_ttm.c
>>>> index 8aa87b8edb9c..19fd39d9a00c 100644
>>>> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
>>>> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
>>>> @@ -32,6 +32,7 @@
>>>>   #include <drm/ttm/ttm_bo_api.h>
>>>>   #include <drm/ttm/ttm_bo_driver.h>
>>>>   #include <drm/ttm/ttm_placement.h>
>>>> +#include <drm/ttm/ttm_range_manager.h>
>>>>     #include "qxl_drv.h"
>>>>   #include "qxl_object.h"
>>>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c 
>>>> b/drivers/gpu/drm/radeon/radeon_ttm.c
>>>> index cdffa9b65108..ad2a5a791bba 100644
>>>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>>>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>>>> @@ -45,6 +45,7 @@
>>>>   #include <drm/ttm/ttm_bo_api.h>
>>>>   #include <drm/ttm/ttm_bo_driver.h>
>>>>   #include <drm/ttm/ttm_placement.h>
>>>> +#include <drm/ttm/ttm_range_manager.h>
>>>>     #include "radeon_reg.h"
>>>>   #include "radeon.h"
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c 
>>>> b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>> index b9d5da6e6a81..ce5d07ca384c 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>> @@ -29,12 +29,13 @@
>>>>    * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
>>>>    */
>>>>   -#include <drm/ttm/ttm_bo_driver.h>
>>>> +#include <drm/ttm/ttm_device.h>
>>>>   #include <drm/ttm/ttm_placement.h>
>>>> +#include <drm/ttm/ttm_range_manager.h>
>>>> +#include <drm/ttm/ttm_bo_api.h>
>>>>   #include <drm/drm_mm.h>
>>>>   #include <linux/slab.h>
>>>>   #include <linux/spinlock.h>
>>>> -#include <linux/module.h>
>>>>     /*
>>>>    * Currently we use a spinlock for the lock, but a mutex *may* be
>>>> @@ -60,8 +61,8 @@ static int ttm_range_man_alloc(struct 
>>>> ttm_resource_manager *man,
>>>>                      struct ttm_resource *mem)
>>>>   {
>>>>       struct ttm_range_manager *rman = to_range_manager(man);
>>>> +    struct ttm_range_mgr_node *node;
>>>>       struct drm_mm *mm = &rman->mm;
>>>> -    struct drm_mm_node *node;
>>>>       enum drm_mm_insert_mode mode;
>>>>       unsigned long lpfn;
>>>>       int ret;
>>>> @@ -70,7 +71,7 @@ static int ttm_range_man_alloc(struct 
>>>> ttm_resource_manager *man,
>>>>       if (!lpfn)
>>>>           lpfn = man->size;
>>>>   -    node = kzalloc(sizeof(*node), GFP_KERNEL);
>>>> +    node = kzalloc(struct_size(node, mm_nodes, 1), GFP_KERNEL);
>>>
>>> I'm still a bit confused  about the situation where a driver wants 
>>> to attach private data to a struct ttm_resource without having to 
>>> re-implement its own range manager?
>>>
>>> Could be cached sg-tables, list of GPU bindings etc. Wouldn't work 
>>> with the above unless we have a void *driver_private member on the 
>>> struct ttm_resource. Is that the plan going forward here? Or that 
>>> the driver actually does the re-implementation?
>>
>> I don't really understand your concern here. The basic idea is that 
>> drivers use ttm_resource as a base class for their own implementation.
>>
>> See for example how nouveau does that:
>>
>> struct nouveau_mem {
>>         struct ttm_resource base;
>>         struct nouveau_cli *cli;
>>         u8 kind;
>>         u8 comp;
>>         struct nvif_mem mem;
>>         struct nvif_vma vma[2];
>> };
>>
>> The range manager is helping driver specific resource managers which 
>> want to implement something drm_mm_nodes based. E.g. amdgpu_gtt_mgr 
>> and amdgpu_vram_mgr, but it can also be used stand alone.
>>
>> The ttm_range_mgr_node can then be used as base class for this 
>> functionality. I already want to move some more code from 
>> amdgpu_vram_mgr.c into the range manager, but that is just minor 
>> cleanup work.
>>
> Sure but if you embed a ttm_range_mgr_node in your struct 
> i915_resource, and wanted to use the ttm range manager for it, it 
> would allocate a struct ttm_range_mgr_node rather than a struct 
> i915_resource? Or am I missing something?

Yes, that's the general idea I'm targeting for. I'm just not fully there 
yet.

The ttm range manager then provides functions to implement debugging 
and/or the iterator for example while the driver specific parts only 
implement stuff like special placement handling.

Christian.

>
> /Thomas
>
>
>
>> Regards,
>> Christian.
>>
>>>
>>> Thanks,
>>>
>>> Thomas
>>>
>>>

