Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A193D36D2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 10:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580546EA8F;
	Fri, 23 Jul 2021 08:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0446ECE9;
 Fri, 23 Jul 2021 08:33:51 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r2so1494259wrl.1;
 Fri, 23 Jul 2021 01:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=RD4GbzMceWLz9CP8hjdkUNLDU7QROTuGuLW0cQi1m2Y=;
 b=XOHKuOgQoxgxetqI3Ou3wIKvyZuLfySk4NdzF2WUHL9CzUQ+PBpT66aje/zfdd+dU3
 vZztfn2mBt27LsOHXS5PRwQ5UXshEYOr9NmkY0qCYw8FdRzCoxbS1XZwUPld3ju5TzAn
 B0RslyUG5f6Q2zxLUFWRrsH2GOiPIK7ud7OzU6z+B5AeuSuFtxuMXeCBfa2oaWRjU+Zh
 dxHraq1h/Ks09OtU6sUJ+2YFV4DzoixcTfhCZ/12Ahk/2o5/MpJWBWXmjkQvYBdA0jFs
 wGwXcJwNmT6yH5jN4MoSQsiK1JPowDlmb0BE0qVkc/zymLpTNsTB2mrKuxfDk2vXlOlQ
 MmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RD4GbzMceWLz9CP8hjdkUNLDU7QROTuGuLW0cQi1m2Y=;
 b=qZFZkXznKRw1q6OTr+5wqAfgZaVhEpwMLmnvhSsj2w7WQfD7lS/cu3vAXdcECRG3D8
 pprFgRH4nXIOIPUzvIMzvnx6EqFT3BiclRaHm/Zvd6w1o8llFSRMwUoSeMGmd9fFjmmJ
 o8a2Uu7m86BgUmQMPY0YJpNUZBQNzH4O1NeM1mXxOSPyvILmWN5/s8iDiHIANQE+7CBg
 M/UKuWN0hj76sOyrzGMJ1jvJKqb4ghG5csBZXziSlGcy/MYPS7OW/WW6HWo4HEqWh3HW
 6xSojdyiKkGB+0bi7EFvB/PtK1M/e0KhbNBeerRhxwcB6Rk8pBvjBdfBw/ZgZHoOvfiI
 MVUA==
X-Gm-Message-State: AOAM532+IwfrSIy6CvsPuZ6V8wW8/MplyDgtVaPE47XyVkQthsSrKb41
 LMVoAvIn7Ib1mwEd8VpaQEU46IA46Hg=
X-Google-Smtp-Source: ABdhPJyrRRBJ9n0/YOMgLRBbFTfi/kHBN3htjrNO5/iOjcB8zfZOGq8Ug0teHf9GtUQvUSXPO+vB6Q==
X-Received: by 2002:a5d:4b0f:: with SMTP id v15mr3925711wrq.377.1627029230370; 
 Fri, 23 Jul 2021 01:33:50 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:a0d7:cc1c:9090:5782?
 ([2a02:908:1252:fb60:a0d7:cc1c:9090:5782])
 by smtp.gmail.com with ESMTPSA id m21sm311109wml.32.2021.07.23.01.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 01:33:50 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] drm/ttm: Fix COW check
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20210712220636.475675-1-Felix.Kuehling@amd.com>
 <d617d831-7168-51a4-042e-e36a5af7761d@gmail.com>
 <CADnq5_NCg6VnWgH7Hn61CjZBZiRuAdROW5s6imwQ8AR=9Bm4=g@mail.gmail.com>
 <1dd35814-c2bb-6e71-6259-e9d4f77d8969@amd.com>
 <CAKMK7uH7YUgFUkgdrRrxypqkHoYx_NN6vcvTB=LOwVGDriov9Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ab0b302e-436a-f5e6-b111-957f79d18da0@gmail.com>
Date: Fri, 23 Jul 2021 10:33:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uH7YUgFUkgdrRrxypqkHoYx_NN6vcvTB=LOwVGDriov9Q@mail.gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 23.07.21 um 10:21 schrieb Daniel Vetter:
> On Wed, Jul 14, 2021 at 10:51 AM Christian König
> <christian.koenig@amd.com> wrote:
>>
>>
>> Am 13.07.21 um 17:28 schrieb Alex Deucher:
>>> On Tue, Jul 13, 2021 at 2:57 AM Christian König
>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>
>>>> Am 13.07.21 um 00:06 schrieb Felix Kuehling:
>>>>> KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
>>>>> is_cow_mapping returns true for these mappings. Add a check for
>>>>> vm_flags & VM_WRITE to avoid mmap failures on private read-only or
>>>>> PROT_NONE mappings.
>>>>>
>>>>> v2: protect against mprotect making a mapping writable after the fact
>>>>> v3: update driver-specific vm_operations_structs
>>>>>
>>>>> Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
>>>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>> Are you planning to push this to drm-misc?
>> Yes, just didn't found time yesterday.
> This is pushed to the wrong tree drm-misc-next-fixes, should have been
> in drm-misc-fixes. Please be careful with that because every time that
> goes wrong the script gets confused about which the current tree is,
> and pushes the wrong tree to linux-next branches.
>
> I'm going to hard-reset drm-misc-next-fixes now and hope that's good
> enough to fix things up (since Thomas is not around all the time for
> this merge window).

STOP! I'm about to push a revert for this patch.

And yes that was pushed to the wrong branch, but it turned out that this 
was fortunate since the patch doesn't work correctly.

Christian.

> -Daniel
>
>
>> Christian.
>>
>>> Alex
>>>
>>>>> ---
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  3 ++-
>>>>>     drivers/gpu/drm/nouveau/nouveau_gem.c    |  3 ++-
>>>>>     drivers/gpu/drm/radeon/radeon_gem.c      |  3 ++-
>>>>>     drivers/gpu/drm/ttm/ttm_bo_vm.c          | 14 +++++++++++++-
>>>>>     drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c |  1 +
>>>>>     include/drm/ttm/ttm_bo_api.h             |  4 ++++
>>>>>     6 files changed, 24 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>> index b3404c43a911..1aa750a6a5d2 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>> @@ -79,7 +79,8 @@ static const struct vm_operations_struct amdgpu_gem_vm_ops = {
>>>>>         .fault = amdgpu_gem_fault,
>>>>>         .open = ttm_bo_vm_open,
>>>>>         .close = ttm_bo_vm_close,
>>>>> -     .access = ttm_bo_vm_access
>>>>> +     .access = ttm_bo_vm_access,
>>>>> +     .mprotect = ttm_bo_vm_mprotect
>>>>>     };
>>>>>
>>>>>     static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>> index 5b27845075a1..164ea564bb7a 100644
>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>> @@ -70,7 +70,8 @@ static const struct vm_operations_struct nouveau_ttm_vm_ops = {
>>>>>         .fault = nouveau_ttm_fault,
>>>>>         .open = ttm_bo_vm_open,
>>>>>         .close = ttm_bo_vm_close,
>>>>> -     .access = ttm_bo_vm_access
>>>>> +     .access = ttm_bo_vm_access,
>>>>> +     .mprotect = ttm_bo_vm_mprotect
>>>>>     };
>>>>>
>>>>>     void
>>>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
>>>>> index 458f92a70887..c19ad07eb7b5 100644
>>>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>>>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>>>>> @@ -77,7 +77,8 @@ static const struct vm_operations_struct radeon_gem_vm_ops = {
>>>>>         .fault = radeon_gem_fault,
>>>>>         .open = ttm_bo_vm_open,
>>>>>         .close = ttm_bo_vm_close,
>>>>> -     .access = ttm_bo_vm_access
>>>>> +     .access = ttm_bo_vm_access,
>>>>> +     .mprotect = ttm_bo_vm_mprotect
>>>>>     };
>>>>>
>>>>>     static void radeon_gem_object_free(struct drm_gem_object *gobj)
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>> index f56be5bc0861..fb325bad5db6 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>> @@ -542,17 +542,29 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>>>     }
>>>>>     EXPORT_SYMBOL(ttm_bo_vm_access);
>>>>>
>>>>> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
>>>>> +                    unsigned long end, unsigned long newflags)
>>>>> +{
>>>>> +     /* Enforce no COW since would have really strange behavior with it. */
>>>>> +     if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL(ttm_bo_vm_mprotect);
>>>>> +
>>>>>     static const struct vm_operations_struct ttm_bo_vm_ops = {
>>>>>         .fault = ttm_bo_vm_fault,
>>>>>         .open = ttm_bo_vm_open,
>>>>>         .close = ttm_bo_vm_close,
>>>>>         .access = ttm_bo_vm_access,
>>>>> +     .mprotect = ttm_bo_vm_mprotect,
>>>>>     };
>>>>>
>>>>>     int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
>>>>>     {
>>>>>         /* Enforce no COW since would have really strange behavior with it. */
>>>>> -     if (is_cow_mapping(vma->vm_flags))
>>>>> +     if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
>>>>>                 return -EINVAL;
>>>>>
>>>>>         ttm_bo_get(bo);
>>>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>>>> index e6b1f98ec99f..e4bf7dc99320 100644
>>>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>>>> @@ -61,6 +61,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
>>>>>                 .fault = vmw_bo_vm_fault,
>>>>>                 .open = ttm_bo_vm_open,
>>>>>                 .close = ttm_bo_vm_close,
>>>>> +             .mprotect = ttm_bo_vm_mprotect,
>>>>>     #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>>>>                 .huge_fault = vmw_bo_vm_huge_fault,
>>>>>     #endif
>>>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>>>>> index f681bbdbc698..40eb95875355 100644
>>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>>> @@ -605,6 +605,10 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
>>>>>
>>>>>     int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>>>                      void *buf, int len, int write);
>>>>> +
>>>>> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
>>>>> +                    unsigned long end, unsigned long newflags);
>>>>> +
>>>>>     bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
>>>>>
>>>>>     vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
>

