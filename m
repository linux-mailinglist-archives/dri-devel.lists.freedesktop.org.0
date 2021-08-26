Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3A83F8A75
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 16:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD456E870;
	Thu, 26 Aug 2021 14:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26ED96E870;
 Thu, 26 Aug 2021 14:52:38 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q11so5496398wrr.9;
 Thu, 26 Aug 2021 07:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=LA6F9AeGbaxvODZZLVNw0j/6UfmDFRq61Acl0k3i6NU=;
 b=JE2iBi4NFbFQ40QTbZWoC0fA4bX9h40u6Rfg3xEkMkLMs7MQTTVZ2G0UwLle10NpFd
 XkUhxB60n0TwqIeMzXy4y9xjQEB/KDWKIw1jLZN6LffmmfdMl+vI9yPpoD2rXDwiY4Ej
 +GgAjlh/KRSFOSgxGGh+lNTQoSJrxlpdIzJhz899K0DFtAIZho4cRipSZOej4IelUJnZ
 PqAz0de0kh0dXo86mTjUA3p08pKGoe8aMJhNPWT+pjYvtsBC2lgPC6jAjX0OiMYXk8G3
 RlycpSXJxJx90NtR7XwQmYcoCfkr2S9nL4hTFzkdGwgiWG562gB7gUrlpj1eOxyBwFcS
 ffJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LA6F9AeGbaxvODZZLVNw0j/6UfmDFRq61Acl0k3i6NU=;
 b=N/PJ2BpQQ0UmsTXzvdSbQlFCkt6sBO6NBIoEtySruhf69kborEhH/O29JpvmMaTPhC
 NBDruXrYRkHHpzYA6Lo4OIJzJmXDuuuczAQOcNceVs9kFyU9DrHROl784oS001jN+4fk
 gOEaTavLmLyq2qDWUZLPwsclfcuTjd1vH5Jfpc7OKPKZDd2SyNaatpiSzqaleU1iJBAm
 Y20eYr+g9umWPC7EvwIilpNRJe5twrl8+vhH2PvJl+hyPsqLrhvSDIsXAPxtAZmeDzZG
 HzN8ilhoVupPLFr30Pfex5jU65++dBYiQno06DjwXgYp6bfQU7E6jc9nqCQV5vVTYtMI
 B9xA==
X-Gm-Message-State: AOAM532TEZkD3n52cpUq28CaxYKYqKLGnVyu0Uem/N9yrBYL03I0++Xu
 7AfzQYd+51Nr2gnYFB+3yX1dhGf3Zwg=
X-Google-Smtp-Source: ABdhPJymZadLdLDJ/CuCN2OwCehr9B8G/js5l6SIotgIztldFcKCjo1Zn9Ege3PptpUvjPiQJH6ADQ==
X-Received: by 2002:adf:c513:: with SMTP id q19mr4072199wrf.20.1629989556729; 
 Thu, 26 Aug 2021 07:52:36 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:1f1e:4529:2fc9:1857?
 ([2a02:908:1252:fb60:1f1e:4529:2fc9:1857])
 by smtp.gmail.com with ESMTPSA id o8sm7738403wmq.21.2021.08.26.07.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 07:52:36 -0700 (PDT)
Subject: Re: [PATCH 3/4] drm/amdgpu: drm/amdgpu: Handle IOMMU enabled case
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210824210120.49812-1-andrey.grodzovsky@amd.com>
 <20210824210120.49812-4-andrey.grodzovsky@amd.com>
 <d4e6682e-2d2f-f271-6041-6bcb145c1fc9@gmail.com>
 <a4f70dd8-5f07-5279-7f7a-723fb3b8b944@amd.com>
 <fa925e81-7724-5dbc-7755-d82e597b0841@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <64d691c0-1148-605b-5ec5-ad56497bffbe@gmail.com>
Date: Thu, 26 Aug 2021 16:52:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fa925e81-7724-5dbc-7755-d82e597b0841@amd.com>
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

Am 26.08.21 um 15:43 schrieb Andrey Grodzovsky:
> Ping
>
> Andrey
>
> On 2021-08-25 11:36 a.m., Andrey Grodzovsky wrote:
>>
>> On 2021-08-25 2:43 a.m., Christian König wrote:
>>>
>>>
>>> Am 24.08.21 um 23:01 schrieb Andrey Grodzovsky:
>>>> Handle all DMA IOMMU group related dependencies before the
>>>> group is removed and we try to access it after free.
>>>>
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 50 
>>>> ++++++++++++++++++++++
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  1 +
>>>>   3 files changed, 53 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index 0b5764aa98a4..288a465b8101 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -3860,6 +3860,8 @@ void amdgpu_device_fini_hw(struct 
>>>> amdgpu_device *adev)
>>>>         amdgpu_device_ip_fini_early(adev);
>>>>   +    amdgpu_ttm_clear_dma_mappings(adev);
>>>> +
>>>>       amdgpu_gart_dummy_page_fini(adev);
>>>>         amdgpu_device_unmap_mmio(adev);
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> index 446943e32e3e..f73d807db3b0 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> @@ -64,6 +64,7 @@
>>>>   static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>>>>                      struct ttm_tt *ttm,
>>>>                      struct ttm_resource *bo_mem);
>>>> +
>>>>   static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
>>>>                         struct ttm_tt *ttm);
>>>>   @@ -2293,6 +2294,55 @@ static ssize_t amdgpu_iomem_write(struct 
>>>> file *f, const char __user *buf,
>>>>       return result;
>>>>   }
>>>>   +void amdgpu_ttm_clear_dma_mappings(struct amdgpu_device *adev)
>>>
>>> I strongly think that this function should be part of TTM. Something 
>>> like ttm_device_force_unpopulate.
>>
>>
>> Yes, this something I also wanted but see bellow
>>
>>
>>>
>>>> +{
>>>> +    struct ttm_device *bdev = &adev->mman.bdev;
>>>> +    struct ttm_resource_manager *man;
>>>> +    struct ttm_buffer_object *bo;
>>>> +    unsigned int i, j;
>>>> +
>>>> +    spin_lock(&bdev->lru_lock);
>>>> +    for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
>>>> +        man = ttm_manager_type(bdev, i);
>>>> +        if (!man || !man->use_tt)
>>>> +            continue;
>>>> +
>>>> +        while (!list_empty(&man->pinned)) {
>>>> +            bo = list_first_entry(&man->pinned, struct 
>>>> ttm_buffer_object, lru);
>>>> +            /* Take ref against racing releases once lru_lock is 
>>>> unlocked */
>>>> +            ttm_bo_get(bo);
>>>> +            list_del_init(&bo->lru);
>>>> +            spin_unlock(&bdev->lru_lock);
>>>> +
>>>> +            if (bo->ttm) {
>>>> +                amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
>>
>>
>> amdgpu_ttm_backend_unbind is needed to be called separately from 
>> ttm_tt_unpopulate to take care of code
>> flows that do dma mapping though the gart bind and not through 
>> ttm_tt_populate, Since it's inside amdgpu
>> i had to place the entire function in amdgpu. Any suggestions ?

I think I've fixed exactly that just recently, see the patch here:

commit b7e8b086ffbc03b890ed22ae63ed5e5bd319d184
Author: Christian König <ckoenig.leichtzumerken@gmail.com>
Date:   Wed Jul 28 15:05:49 2021 +0200

     drm/amdgpu: unbind in amdgpu_ttm_tt_unpopulate

     Doing this in amdgpu_ttm_backend_destroy() is to late.

     It turned out that this is not a good idea at all because it leaves 
pointers
     to freed up system memory pages in the GART tables of the drivers.

But that probably hasn't showed up in amd-staging-drm-next yet.

Christian.

>>
>> Andrey
>>
>>
>>>> + ttm_tt_destroy_common(bo->bdev, bo->ttm);
>>>
>>> Then you can also cleanly use ttm_tt_unpopulate here, cause this 
>>> will result in incorrect statistics inside TTM atm.
>>>
>>> Regards,
>>> Christian.
>>>
>>>> +            }
>>>> +
>>>> +            ttm_bo_put(bo);
>>>> +            spin_lock(&bdev->lru_lock);
>>>> +        }
>>>> +
>>>> +        for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>>>> +            while (!list_empty(&man->lru[j])) {
>>>> +                bo = list_first_entry(&man->lru[j], struct 
>>>> ttm_buffer_object, lru);
>>>> +                ttm_bo_get(bo);
>>>> +                list_del_init(&bo->lru);
>>>> +                spin_unlock(&bdev->lru_lock);
>>>> +
>>>> +                if (bo->ttm) {
>>>> +                    amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
>>>> +                    ttm_tt_destroy_common(bo->bdev, bo->ttm);
>>>> +                }
>>>> +                ttm_bo_put(bo);
>>>> +                spin_lock(&bdev->lru_lock);
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +    spin_unlock(&bdev->lru_lock);
>>>> +
>>>> +}
>>>> +
>>>>   static const struct file_operations amdgpu_ttm_iomem_fops = {
>>>>       .owner = THIS_MODULE,
>>>>       .read = amdgpu_iomem_read,
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>> index e69f3e8e06e5..02c8eac48a64 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>> @@ -190,6 +190,7 @@ bool amdgpu_ttm_tt_is_readonly(struct ttm_tt 
>>>> *ttm);
>>>>   uint64_t amdgpu_ttm_tt_pde_flags(struct ttm_tt *ttm, struct 
>>>> ttm_resource *mem);
>>>>   uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, 
>>>> struct ttm_tt *ttm,
>>>>                    struct ttm_resource *mem);
>>>> +void amdgpu_ttm_clear_dma_mappings(struct amdgpu_device *adev);
>>>>     void amdgpu_ttm_debugfs_init(struct amdgpu_device *adev);
>>>

