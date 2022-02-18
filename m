Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 663354BB37E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 08:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224F810EB0F;
	Fri, 18 Feb 2022 07:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6473D10EB0F;
 Fri, 18 Feb 2022 07:46:04 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id u18so13963420edt.6;
 Thu, 17 Feb 2022 23:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=U5olLpLCoghEHY1TCG3d3Y+Izm3Dlu4bh0SXakm9Uoo=;
 b=F2w8q2qmgX4O8EXvRpOJqfH1BIxaJaYjl2r31xfBPIGHUyGiwgy4+5a3SUfMU9kIPg
 1SM5oG2xKBaUVU94NTAcwBCucXC8I1wwuvU1iq7kTzxc7m5GEa/8B7gBzYbFU2B6p2+B
 6H4aIZ5glaNVXa/x3LMgNcbvYDKHOMLDI1iKGXKlIOyNQuDSQRh2908h4pLkrqpf66vh
 VLPcydVUQM+0oKmmX88FpobYVo8Y8ETD/+kILmSqxT0MCCq0nOEo1EV5tZVxLgnCeDE1
 xpzQYZn33nE2f4FrNnodtoXBs/GG7nn5NzM7SDWoBG7r+FdLLkxHUOnDB42VUAkVxkZ8
 eIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U5olLpLCoghEHY1TCG3d3Y+Izm3Dlu4bh0SXakm9Uoo=;
 b=vcpHHv7y1X0QBjo3fgWi21aJEbIb0KoqP30Q0RarbDDaXxZSdgQlWG7mK290CFqXSa
 iLEChz2XxL/RcjNFajYgE7YmaBPZQQfKPHCGMhDJPMfUXylulK7z8ntg6HxH3FDC+Mmc
 0tB/9Q+npAl+/yB3+G3qO0o750kmeXrrFRxIhZAhcYZXOrAMi47jHRsk9ke+ZHMdzFFe
 nT/e/e6+LMpGpp5P98p3dfaLrH3LLzGQ4YY8X/Qxzlwi9ouD7Sk2bwmJSJ0l75K/bv8I
 iwJmi+MUDnBte/GvxU0pCAkvwO59xUyleHEkT7eW79eZvt9hY8rtv6eSE9No/bh59C4K
 1rkA==
X-Gm-Message-State: AOAM53097yxpXNk49P+itWDY6IvqeeExMmKmYjRji8FXit4GEKzfz/cf
 S1/jW4lNkAqoRlHn0Gv4yTY=
X-Google-Smtp-Source: ABdhPJzJgAvXMrd3YlkoyLz+HzPRT2nU1J3fg3Kg+ubc5ej4DqMIwnGiI47/qXbu6eDESR03DikDJg==
X-Received: by 2002:a05:6402:11cb:b0:3fd:abfa:1eef with SMTP id
 j11-20020a05640211cb00b003fdabfa1eefmr6721618edw.341.1645170362684; 
 Thu, 17 Feb 2022 23:46:02 -0800 (PST)
Received: from [192.168.178.21] (p57b0bff8.dip0.t-ipconnect.de.
 [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id z8sm1905551ejc.197.2022.02.17.23.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 23:46:02 -0800 (PST)
Message-ID: <a11b7073-6597-8e87-b724-33acab32e791@gmail.com>
Date: Fri, 18 Feb 2022 08:46:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdgpu: check vm bo eviction valuable at last
Content-Language: en-US
To: Qiang Yu <yuq825@gmail.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <20220217090440.4468-1-qiang.yu@amd.com>
 <5d3fdd2c-e74a-49f4-2b28-32c06483236f@amd.com>
 <CAKGbVbtLTBJPF5eTu4rABUTBa8eqjQvqjo1AEUrzgPgYgCREuA@mail.gmail.com>
 <dac70c05-e712-d2e3-2267-278380895f1e@amd.com>
 <CAKGbVbvtLbDiKrX80-dMnipdLkTE+FP=g_mx37e12fuMtA1Y4Q@mail.gmail.com>
 <ca27a9c6-f390-a938-dd66-ac23f3b44dc4@amd.com>
 <CAKGbVbv4UFCybS_OFj5UkDgevbrB5qe3pv+0nHv9WdefYhy6Ww@mail.gmail.com>
 <6711073b-8771-5750-33f7-b72333b411c6@amd.com>
 <CAKGbVbvR+msXjrsXmDM8QTmsCP03hL5-q5CTJBYu4mm=NQd01A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAKGbVbvR+msXjrsXmDM8QTmsCP03hL5-q5CTJBYu4mm=NQd01A@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Qiang Yu <qiang.yu@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.02.22 um 04:08 schrieb Qiang Yu:
> On Thu, Feb 17, 2022 at 8:22 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 17.02.22 um 11:58 schrieb Qiang Yu:
>>> On Thu, Feb 17, 2022 at 6:39 PM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>>
>>>> Am 17.02.22 um 11:13 schrieb Qiang Yu:
>>>>> On Thu, Feb 17, 2022 at 5:46 PM Christian König
>>>>> <christian.koenig@amd.com> wrote:
>>>>>> Am 17.02.22 um 10:40 schrieb Qiang Yu:
>>>>>>> On Thu, Feb 17, 2022 at 5:15 PM Christian König
>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>> Am 17.02.22 um 10:04 schrieb Qiang Yu:
>>>>>>>>> Workstation application ANSA/META get this error dmesg:
>>>>>>>>> [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't update BO_VA (-16)
>>>>>>>>>
>>>>>>>>> This is caused by:
>>>>>>>>> 1. create a 256MB buffer in invisible VRAM
>>>>>>>>> 2. CPU map the buffer and access it causes vm_fault and try to move
>>>>>>>>>         it to visible VRAM
>>>>>>>>> 3. force visible VRAM space and traverse all VRAM bos to check if
>>>>>>>>>         evicting this bo is valuable
>>>>>>>>> 4. when checking a VM bo (in invisible VRAM), amdgpu_vm_evictable()
>>>>>>>>>         will set amdgpu_vm->evicting, but latter due to not in visible
>>>>>>>>>         VRAM, won't really evict it so not add it to amdgpu_vm->evicted
>>>>>>>>> 5. before next CS to clear the amdgpu_vm->evicting, user VM ops
>>>>>>>>>         ioctl will pass amdgpu_vm_ready() (check amdgpu_vm->evicted)
>>>>>>>>>         but fail in amdgpu_vm_bo_update_mapping() (check
>>>>>>>>>         amdgpu_vm->evicting) and get this error log
>>>>>>>>>
>>>>>>>>> This error won't affect functionality as next CS will finish the
>>>>>>>>> waiting VM ops. But we'd better make the amdgpu_vm->evicting
>>>>>>>>> correctly reflact the vm status and clear the error log.
>>>>>>>> Well NAK, that is intentional behavior.
>>>>>>>>
>>>>>>>> The VM page tables where considered for eviction, so setting the flag is
>>>>>>>> correct even when the page tables later on are not actually evicted.
>>>>>>>>
>>>>>>> But this will unnecessarily stop latter user VM ops in ioctl before CS
>>>>>>> even when the VM bos are not evicted.
>>>>>>> Won't this have any negative effect when could do better?
>>>>>> No, this will have a positive effect. See the VM was already considered
>>>>>> for eviction because it is idle.
>>>>>>
>>>>>> Updating it immediately doesn't necessarily make sense, we should wait
>>>>>> with that until its next usage.
>>>>>>
>>>>>> Additional to that this patch doesn't really fix the problem, it just
>>>>>> mitigates it.
>>>>>>
>>>>>> Eviction can fail later on for a couple of reasons and we absolutely
>>>>>> need to check the flag instead of the list in amdgpu_vm_ready().
>>>>> The flag only for both flag and list? Looks like should be both as
>>>>> the list indicate some vm page table need to be updated and could
>>>>> delay the user update with the same logic as you described above.
>>>> I think checking the flag should be enough. The issue is that the list
>>>> was there initially, but to avoid race conditions we added the flag with
>>>> separate lock protection later on.
>>>>
>>> But list and flag does not align always, there are cases like
>>> list-empty/flag-set (this problem) and list-non-empty/flag-unset (non-vm bo
>>> eviction). If only check flag list-non-empty/flag-unset change behavior.
>> Yeah, but I think that the flag unset list-non-empty case would be
>> correctly handled if we only test the flag.
>>
>> In other words we can update the page tables as long as they are not
>> partially or fully evicted and that's not the case when non-vm BOs are
>> evicted.
>>
> This sounds like two standard for the same thing, because this problem
> does not evict page tables too. But I see your point is:
> There's a difference that this problem's case can make sure vm is idle,
> and we prefer to delay vm updates when vm is idle.
>
> If so, why not just stop user vm update by checking vm busy in
> amdgpu_gem_va_ioctl() to skip amdgpu_gem_va_update_vm()?

That's exactly what amdgpu_gem_va_update_vm() is doing by calling 
amdgpu_vm_ready(). The problem is that amdgpu_vm_ready() looks at the 
wrong thing.

> Then we can keep the evicting flag accurate (after solving your
> concern for this patch that eviction may fail latter by further delay
> the flag update after eviction success).

That won't work. See we need to mark the VM as evicted before we 
actually evict them because otherwise somebody could use the VM in 
parallel and add another fence to it.

Regards,
Christian.

>
> Regards,
> Qiang
>
>
>> Regards,
>> Christian.
>>
>>> Regards,
>>> Qiang
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Regards,
>>>>> Qiang
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> Regards,
>>>>>>> Qiang
>>>>>>>
>>>>>>>> What we should rather do is to fix amdgpu_vm_ready() to take a look at
>>>>>>>> the flag instead of the linked list.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>> Signed-off-by: Qiang Yu <qiang.yu@amd.com>
>>>>>>>>> ---
>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 85 ++++++++++++++-----------
>>>>>>>>>       1 file changed, 47 insertions(+), 38 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>>>> index 5a32ee66d8c8..88a27911054f 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>>>> @@ -1306,45 +1306,11 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
>>>>>>>>>           return flags;
>>>>>>>>>       }
>>>>>>>>>
>>>>>>>>> -/*
>>>>>>>>> - * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
>>>>>>>>> - * object.
>>>>>>>>> - *
>>>>>>>>> - * Return true if eviction is sensible. Called by ttm_mem_evict_first() on
>>>>>>>>> - * behalf of ttm_bo_mem_force_space() which tries to evict buffer objects until
>>>>>>>>> - * it can find space for a new object and by ttm_bo_force_list_clean() which is
>>>>>>>>> - * used to clean out a memory space.
>>>>>>>>> - */
>>>>>>>>> -static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>>>>>>> -                                         const struct ttm_place *place)
>>>>>>>>> +static bool amdgpu_ttm_mem_eviction_valuable(struct ttm_buffer_object *bo,
>>>>>>>>> +                                          const struct ttm_place *place)
>>>>>>>>>       {
>>>>>>>>>           unsigned long num_pages = bo->resource->num_pages;
>>>>>>>>>           struct amdgpu_res_cursor cursor;
>>>>>>>>> -     struct dma_resv_list *flist;
>>>>>>>>> -     struct dma_fence *f;
>>>>>>>>> -     int i;
>>>>>>>>> -
>>>>>>>>> -     /* Swapout? */
>>>>>>>>> -     if (bo->resource->mem_type == TTM_PL_SYSTEM)
>>>>>>>>> -             return true;
>>>>>>>>> -
>>>>>>>>> -     if (bo->type == ttm_bo_type_kernel &&
>>>>>>>>> -         !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
>>>>>>>>> -             return false;
>>>>>>>>> -
>>>>>>>>> -     /* If bo is a KFD BO, check if the bo belongs to the current process.
>>>>>>>>> -      * If true, then return false as any KFD process needs all its BOs to
>>>>>>>>> -      * be resident to run successfully
>>>>>>>>> -      */
>>>>>>>>> -     flist = dma_resv_shared_list(bo->base.resv);
>>>>>>>>> -     if (flist) {
>>>>>>>>> -             for (i = 0; i < flist->shared_count; ++i) {
>>>>>>>>> -                     f = rcu_dereference_protected(flist->shared[i],
>>>>>>>>> -                             dma_resv_held(bo->base.resv));
>>>>>>>>> -                     if (amdkfd_fence_check_mm(f, current->mm))
>>>>>>>>> -                             return false;
>>>>>>>>> -             }
>>>>>>>>> -     }
>>>>>>>>>
>>>>>>>>>           switch (bo->resource->mem_type) {
>>>>>>>>>           case AMDGPU_PL_PREEMPT:
>>>>>>>>> @@ -1377,10 +1343,53 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>>>>>>>                   return false;
>>>>>>>>>
>>>>>>>>>           default:
>>>>>>>>> -             break;
>>>>>>>>> +             return ttm_bo_eviction_valuable(bo, place);
>>>>>>>>>           }
>>>>>>>>> +}
>>>>>>>>>
>>>>>>>>> -     return ttm_bo_eviction_valuable(bo, place);
>>>>>>>>> +/*
>>>>>>>>> + * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
>>>>>>>>> + * object.
>>>>>>>>> + *
>>>>>>>>> + * Return true if eviction is sensible. Called by ttm_mem_evict_first() on
>>>>>>>>> + * behalf of ttm_bo_mem_force_space() which tries to evict buffer objects until
>>>>>>>>> + * it can find space for a new object and by ttm_bo_force_list_clean() which is
>>>>>>>>> + * used to clean out a memory space.
>>>>>>>>> + */
>>>>>>>>> +static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>>>>>>> +                                         const struct ttm_place *place)
>>>>>>>>> +{
>>>>>>>>> +     struct dma_resv_list *flist;
>>>>>>>>> +     struct dma_fence *f;
>>>>>>>>> +     int i;
>>>>>>>>> +
>>>>>>>>> +     /* Swapout? */
>>>>>>>>> +     if (bo->resource->mem_type == TTM_PL_SYSTEM)
>>>>>>>>> +             return true;
>>>>>>>>> +
>>>>>>>>> +     /* If bo is a KFD BO, check if the bo belongs to the current process.
>>>>>>>>> +      * If true, then return false as any KFD process needs all its BOs to
>>>>>>>>> +      * be resident to run successfully
>>>>>>>>> +      */
>>>>>>>>> +     flist = dma_resv_shared_list(bo->base.resv);
>>>>>>>>> +     if (flist) {
>>>>>>>>> +             for (i = 0; i < flist->shared_count; ++i) {
>>>>>>>>> +                     f = rcu_dereference_protected(flist->shared[i],
>>>>>>>>> +                             dma_resv_held(bo->base.resv));
>>>>>>>>> +                     if (amdkfd_fence_check_mm(f, current->mm))
>>>>>>>>> +                             return false;
>>>>>>>>> +             }
>>>>>>>>> +     }
>>>>>>>>> +
>>>>>>>>> +     /* Check by different mem type. */
>>>>>>>>> +     if (!amdgpu_ttm_mem_eviction_valuable(bo, place))
>>>>>>>>> +             return false;
>>>>>>>>> +
>>>>>>>>> +     /* VM bo should be checked at last because it will mark VM evicting. */
>>>>>>>>> +     if (bo->type == ttm_bo_type_kernel)
>>>>>>>>> +             return amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo));
>>>>>>>>> +
>>>>>>>>> +     return true;
>>>>>>>>>       }
>>>>>>>>>
>>>>>>>>>       static void amdgpu_ttm_vram_mm_access(struct amdgpu_device *adev, loff_t pos,

