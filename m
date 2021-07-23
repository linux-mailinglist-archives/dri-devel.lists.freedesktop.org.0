Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2337C3D375F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 11:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F676F5A0;
	Fri, 23 Jul 2021 09:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02066F508;
 Fri, 23 Jul 2021 09:09:07 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l4so1569805wrs.4;
 Fri, 23 Jul 2021 02:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=GeoKhfW0/81Hs4mQbcf39xRXqvPmitGusOOSJ5l1ikc=;
 b=MyZI7aT73Tt1MFTwDXGY+d4qVtNFiIdTRi+pMH6Iy22G0nGX6n61sF5D/ie+xaUBui
 CQpkDG7Mpm/XNkukq7+cjdhffO9TXQQCIwi1OHQnyjXwohtYO/5V62E+Pkicyjk97K30
 NU/uYPvNCsD8E2mFpifa1zh1IY4c/0v8mpc7hpKybc6a3+amt68USIKWqrhmNz/T06Cj
 ok0nyyIfBS26CnjvrQx2oX7iel0wtUjQMUH10L/jaK8QumjG18UA+4PUF6OqyCaXjuSn
 qFMnbtLx6sxvxuFRNh2VC7y0eT4ejZnsS1kF6T16Dkl6CgOVtXu3mbN92U0Hj/3LvMgR
 pNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=GeoKhfW0/81Hs4mQbcf39xRXqvPmitGusOOSJ5l1ikc=;
 b=cmq6eKmSQvkujvZQuTFwRFy5Qonk6ocmXPfZkaKwm3sSdlLT/1NayU76BkruwJKOUx
 OBYXoZ50m7UWwIQpCaGTqKSgj5UYKt/HAvv+qVfWZ2S1CAJsXR9HQtmBdf2MFRfhfK1c
 y7e7rNU/OfBE1BlcZc7jWEJH85B6ydP5ZNaFmBDbq4mRge3VE/nCbRR+qUtpcliEvSX6
 Dqo23DkbkRiLnERj4NXWD3Vm3u5V/U/s1uxAMcQENA4GTAh3+DNEX0j0GYo21gtq06gH
 MHn5c+dNI9OEoZ92rdC/edWlPt4Si+Tbg2xoqDjqPhpnMRYGV+bCdUKG2eatqCd4A0/R
 WYaQ==
X-Gm-Message-State: AOAM530V+cW2gfw39yKfnTRBsy8z/+RuKQUGe9JIpHBXuO6bohw7N8a7
 CnhpchLspCOVw6IUCFWUATUe5+ejaUY=
X-Google-Smtp-Source: ABdhPJzVAymoe6P+YFLlaVlNtKiLs7/7yhEnDeEglvp0jODM/Y/OZNo5NaqYQvjCn+I2q48gU4XnZg==
X-Received: by 2002:adf:d4cf:: with SMTP id w15mr2734311wrk.307.1627031346462; 
 Fri, 23 Jul 2021 02:09:06 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:a0d7:cc1c:9090:5782?
 ([2a02:908:1252:fb60:a0d7:cc1c:9090:5782])
 by smtp.gmail.com with ESMTPSA id z11sm32081401wru.65.2021.07.23.02.09.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 02:09:06 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] drm/ttm: Fix COW check
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210712220636.475675-1-Felix.Kuehling@amd.com>
 <d617d831-7168-51a4-042e-e36a5af7761d@gmail.com>
 <CADnq5_NCg6VnWgH7Hn61CjZBZiRuAdROW5s6imwQ8AR=9Bm4=g@mail.gmail.com>
 <1dd35814-c2bb-6e71-6259-e9d4f77d8969@amd.com>
 <CAKMK7uH7YUgFUkgdrRrxypqkHoYx_NN6vcvTB=LOwVGDriov9Q@mail.gmail.com>
 <ab0b302e-436a-f5e6-b111-957f79d18da0@gmail.com>
 <YPqFJ0GSciZnyszl@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f2f22c70-7b76-6c85-5709-045e5c032bf3@gmail.com>
Date: Fri, 23 Jul 2021 11:09:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPqFJ0GSciZnyszl@phenom.ffwll.local>
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.07.21 um 11:00 schrieb Daniel Vetter:
> On Fri, Jul 23, 2021 at 10:33:48AM +0200, Christian König wrote:
>>
>> Am 23.07.21 um 10:21 schrieb Daniel Vetter:
>>> On Wed, Jul 14, 2021 at 10:51 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>>
>>>> Am 13.07.21 um 17:28 schrieb Alex Deucher:
>>>>> On Tue, Jul 13, 2021 at 2:57 AM Christian König
>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>> Am 13.07.21 um 00:06 schrieb Felix Kuehling:
>>>>>>> KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
>>>>>>> is_cow_mapping returns true for these mappings. Add a check for
>>>>>>> vm_flags & VM_WRITE to avoid mmap failures on private read-only or
>>>>>>> PROT_NONE mappings.
>>>>>>>
>>>>>>> v2: protect against mprotect making a mapping writable after the fact
>>>>>>> v3: update driver-specific vm_operations_structs
>>>>>>>
>>>>>>> Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
>>>>>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>> Are you planning to push this to drm-misc?
>>>> Yes, just didn't found time yesterday.
>>> This is pushed to the wrong tree drm-misc-next-fixes, should have been
>>> in drm-misc-fixes. Please be careful with that because every time that
>>> goes wrong the script gets confused about which the current tree is,
>>> and pushes the wrong tree to linux-next branches.
>>>
>>> I'm going to hard-reset drm-misc-next-fixes now and hope that's good
>>> enough to fix things up (since Thomas is not around all the time for
>>> this merge window).
>> STOP! I'm about to push a revert for this patch.
>>
>> And yes that was pushed to the wrong branch, but it turned out that this was
>> fortunate since the patch doesn't work correctly.
> Well I just hard-reset, so you can push the right patch to the right
> branch now. The trouble is that outside of the merge window no one is
> allowed to push to drm-misc-next-fixes. If you do, then dim pushes
> drm-misc-next-fixes to for-linux-next instead of drm-misc-next, and we
> have bad surprises.

Could we then make the branch read-only for that time?

> Which unfortunately happens like every merge window a few times and always
> takes a few days/weeks to get caught.

Yeah, at least to me it's absolutely not obvious when the merge windows 
for a certain version start/end.

Christian.

> -Danie
>
>> Christian.
>>
>>> -Daniel
>>>
>>>
>>>> Christian.
>>>>
>>>>> Alex
>>>>>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  3 ++-
>>>>>>>      drivers/gpu/drm/nouveau/nouveau_gem.c    |  3 ++-
>>>>>>>      drivers/gpu/drm/radeon/radeon_gem.c      |  3 ++-
>>>>>>>      drivers/gpu/drm/ttm/ttm_bo_vm.c          | 14 +++++++++++++-
>>>>>>>      drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c |  1 +
>>>>>>>      include/drm/ttm/ttm_bo_api.h             |  4 ++++
>>>>>>>      6 files changed, 24 insertions(+), 4 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>>> index b3404c43a911..1aa750a6a5d2 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>>> @@ -79,7 +79,8 @@ static const struct vm_operations_struct amdgpu_gem_vm_ops = {
>>>>>>>          .fault = amdgpu_gem_fault,
>>>>>>>          .open = ttm_bo_vm_open,
>>>>>>>          .close = ttm_bo_vm_close,
>>>>>>> -     .access = ttm_bo_vm_access
>>>>>>> +     .access = ttm_bo_vm_access,
>>>>>>> +     .mprotect = ttm_bo_vm_mprotect
>>>>>>>      };
>>>>>>>
>>>>>>>      static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>>>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>>>> index 5b27845075a1..164ea564bb7a 100644
>>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>>>> @@ -70,7 +70,8 @@ static const struct vm_operations_struct nouveau_ttm_vm_ops = {
>>>>>>>          .fault = nouveau_ttm_fault,
>>>>>>>          .open = ttm_bo_vm_open,
>>>>>>>          .close = ttm_bo_vm_close,
>>>>>>> -     .access = ttm_bo_vm_access
>>>>>>> +     .access = ttm_bo_vm_access,
>>>>>>> +     .mprotect = ttm_bo_vm_mprotect
>>>>>>>      };
>>>>>>>
>>>>>>>      void
>>>>>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
>>>>>>> index 458f92a70887..c19ad07eb7b5 100644
>>>>>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>>>>>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>>>>>>> @@ -77,7 +77,8 @@ static const struct vm_operations_struct radeon_gem_vm_ops = {
>>>>>>>          .fault = radeon_gem_fault,
>>>>>>>          .open = ttm_bo_vm_open,
>>>>>>>          .close = ttm_bo_vm_close,
>>>>>>> -     .access = ttm_bo_vm_access
>>>>>>> +     .access = ttm_bo_vm_access,
>>>>>>> +     .mprotect = ttm_bo_vm_mprotect
>>>>>>>      };
>>>>>>>
>>>>>>>      static void radeon_gem_object_free(struct drm_gem_object *gobj)
>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>> index f56be5bc0861..fb325bad5db6 100644
>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>> @@ -542,17 +542,29 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>>>>>      }
>>>>>>>      EXPORT_SYMBOL(ttm_bo_vm_access);
>>>>>>>
>>>>>>> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
>>>>>>> +                    unsigned long end, unsigned long newflags)
>>>>>>> +{
>>>>>>> +     /* Enforce no COW since would have really strange behavior with it. */
>>>>>>> +     if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
>>>>>>> +             return -EINVAL;
>>>>>>> +
>>>>>>> +     return 0;
>>>>>>> +}
>>>>>>> +EXPORT_SYMBOL(ttm_bo_vm_mprotect);
>>>>>>> +
>>>>>>>      static const struct vm_operations_struct ttm_bo_vm_ops = {
>>>>>>>          .fault = ttm_bo_vm_fault,
>>>>>>>          .open = ttm_bo_vm_open,
>>>>>>>          .close = ttm_bo_vm_close,
>>>>>>>          .access = ttm_bo_vm_access,
>>>>>>> +     .mprotect = ttm_bo_vm_mprotect,
>>>>>>>      };
>>>>>>>
>>>>>>>      int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
>>>>>>>      {
>>>>>>>          /* Enforce no COW since would have really strange behavior with it. */
>>>>>>> -     if (is_cow_mapping(vma->vm_flags))
>>>>>>> +     if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
>>>>>>>                  return -EINVAL;
>>>>>>>
>>>>>>>          ttm_bo_get(bo);
>>>>>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>>>>>> index e6b1f98ec99f..e4bf7dc99320 100644
>>>>>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>>>>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>>>>>> @@ -61,6 +61,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
>>>>>>>                  .fault = vmw_bo_vm_fault,
>>>>>>>                  .open = ttm_bo_vm_open,
>>>>>>>                  .close = ttm_bo_vm_close,
>>>>>>> +             .mprotect = ttm_bo_vm_mprotect,
>>>>>>>      #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>>>>>>                  .huge_fault = vmw_bo_vm_huge_fault,
>>>>>>>      #endif
>>>>>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>>>>>>> index f681bbdbc698..40eb95875355 100644
>>>>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>>>>> @@ -605,6 +605,10 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
>>>>>>>
>>>>>>>      int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>>>>>                       void *buf, int len, int write);
>>>>>>> +
>>>>>>> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
>>>>>>> +                    unsigned long end, unsigned long newflags);
>>>>>>> +
>>>>>>>      bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
>>>>>>>
>>>>>>>      vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);

