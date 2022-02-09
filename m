Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4D54AF0D5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 13:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D246A10E371;
	Wed,  9 Feb 2022 12:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C6510E202;
 Wed,  9 Feb 2022 12:08:04 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id cz16so4572258edb.8;
 Wed, 09 Feb 2022 04:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7mnOR2lcZhfoPXjSPgXdsl48PZnfOYvXQBx+GDsPtiE=;
 b=UT9nrp+ZfOViq+03xjTGRtU0chdgIyFd2YcerYdS0/ZgTJ7r+HDRnLqSSEGxbatf+7
 65nZEvcbdqbVEE7xR/AylXg8cTFrIX2AEhEu/UdehIGei+Fow9ANeHLUgEJKVNtEGNuR
 C/l0YkLhSi7ypGbh+OO/FxuqqwnnWxwPPdNPqjLMF7C/30OqhdZBhtZmHPBfUxsigZ38
 eflCe0cpwyHlsBjA/07FExnhsiY4e2/tAActuR3o2wwDxu0yiyfiq2WZ0VN4xuRDFysp
 0oyTP44NvljLRhX2nGvnMLzx4Z5xtnu2XBVBqfjCg7JGIb1q/c2+PLvBJXoE/Js/Vddt
 UYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7mnOR2lcZhfoPXjSPgXdsl48PZnfOYvXQBx+GDsPtiE=;
 b=byJrDl/tYiaWH3iHhK4vkG1NaEzamwsRn4i1rWrTtxahim0jTonZKrBG/yWODXNF7o
 kEkCdg3FiFh1rAAlaXxA3gC4aYCEoo7BuqK8udoha9ouFtQJO49sjKLquKjUsDhA1fhr
 iaqnc4yKg16HVtIpLI2Lmd4F0yUBgsiF7wacj6vOK2d5oD6EQKvQlUooLjeyOkU2ALQ8
 LFs1EfRHT3IM+XYQ8AytCLLSycBtCiUatmyjOA08J8Kgj5Eu2fu4+zGQ5Q0MSwUSGxL0
 t1sXeHhWcTUVi2GROSUCdtdl1Y2wiiklBv9ChJP6zxqd+wAnPt2RCOx7CUphhfA1CXdg
 ysTw==
X-Gm-Message-State: AOAM531qsSCe7vCawwbAPt0qM7r7cSNDHErr/n4h5opKtGLuV5BWFWwr
 QJ97RR2exSdc475jzAKlhLg=
X-Google-Smtp-Source: ABdhPJxK0YOZoDM8SvJSpqgS4DtUKdx5VfmQ1S9FjPNVzdbfX+2nkmiUeeXOnVY3vXDOOC0kZPt2xQ==
X-Received: by 2002:a05:6402:42c1:: with SMTP id
 i1mr2130647edc.52.1644408483314; 
 Wed, 09 Feb 2022 04:08:03 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:ebac:d795:52b8:92e8?
 ([2a02:908:1252:fb60:ebac:d795:52b8:92e8])
 by smtp.gmail.com with ESMTPSA id v26sm3492963ejr.15.2022.02.09.04.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 04:08:02 -0800 (PST)
Message-ID: <bdeacfc6-1fef-ea66-a7da-4b3e24fe1883@gmail.com>
Date: Wed, 9 Feb 2022 13:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/9] drm/ttm: move the LRU into resource handling v3
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20220209084059.1042345-1-christian.koenig@amd.com>
 <20220209084059.1042345-3-christian.koenig@amd.com>
 <CAM0jSHMVx+tstuauLGZ-hoijjiZv7LCJE6t6nJmdrT5k84KzOA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAM0jSHMVx+tstuauLGZ-hoijjiZv7LCJE6t6nJmdrT5k84KzOA@mail.gmail.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, ray.huang@amd.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 09.02.22 um 11:09 schrieb Matthew Auld:
> On Wed, 9 Feb 2022 at 08:41, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> This way we finally fix the problem that new resource are
>> not immediately evict-able after allocation.
>>
>> That has caused numerous problems including OOM on GDS handling
>> and not being able to use TTM as general resource manager.
>>
>> v2: stop assuming in ttm_resource_fini that res->bo is still valid.
>> v3: cleanup kerneldoc, add more lockdep annotation
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  |   8 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c |   2 +-
>>   drivers/gpu/drm/ttm/ttm_bo.c            | 115 ++--------------------
>>   drivers/gpu/drm/ttm/ttm_bo_util.c       |   1 -
>>   drivers/gpu/drm/ttm/ttm_device.c        |  64 ++++++-------
>>   drivers/gpu/drm/ttm/ttm_resource.c      | 122 +++++++++++++++++++++++-
>>   include/drm/ttm/ttm_bo_api.h            |  16 ----
>>   include/drm/ttm/ttm_bo_driver.h         |  29 +-----
>>   include/drm/ttm/ttm_resource.h          |  35 +++++++
>>   9 files changed, 197 insertions(+), 195 deletions(-)
> <snip>
>
>>   /**
>>    * ttm_resource_init - resource object constructure
>>    * @bo: buffer object this resources is allocated for
>> @@ -52,10 +156,12 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>>          res->bus.is_iomem = false;
>>          res->bus.caching = ttm_cached;
>>          res->bo = bo;
>> +       INIT_LIST_HEAD(&res->lru);
>>
>>          man = ttm_manager_type(bo->bdev, place->mem_type);
>>          spin_lock(&bo->bdev->lru_lock);
>>          man->usage += bo->base.size;
>> +       ttm_resource_move_to_lru_tail(res, NULL);
>>          spin_unlock(&bo->bdev->lru_lock);
>>   }
>>   EXPORT_SYMBOL(ttm_resource_init);
>> @@ -66,15 +172,21 @@ EXPORT_SYMBOL(ttm_resource_init);
>>    * @res: the resource to clean up
>>    *
>>    * Should be used by resource manager backends to clean up the TTM resource
>> - * objects before freeing the underlying structure. Counterpart of
>> - * &ttm_resource_init
>> + * objects before freeing the underlying structure. Makes sure the resource is
>> + * removed from the LRU before destruction.
>> + * Counterpart of &ttm_resource_init.
>>    */
>>   void ttm_resource_fini(struct ttm_resource_manager *man,
>>                         struct ttm_resource *res)
>>   {
>> -       spin_lock(&man->bdev->lru_lock);
>> -       man->usage -= res->bo->base.size;
>> -       spin_unlock(&man->bdev->lru_lock);
>> +       struct ttm_device *bdev = man->bdev;
>> +
>> +       spin_lock(&bdev->lru_lock);
>> +       list_del_init(&res->lru);
>> +       if (res->bo && bdev->funcs->del_from_lru_notify)
>> +               bdev->funcs->del_from_lru_notify(res->bo);
>> +       man->usage -= res->num_pages << PAGE_SHIFT;
> Above we are using the bo->base.size for tracking usage, but here we
> are using num_pages. Is it guaranteed that bo->base.size is always
> page aligned? Do we need some kind of WARN_ON()? Perhaps also sanity
> checking that usage == 0 when tearing down the man?

Good point, going to add that and consistently using res->num_pages for 
both.

Thanks,
Christian.
