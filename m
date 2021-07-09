Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733FB3C29C3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 21:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436326EA7D;
	Fri,  9 Jul 2021 19:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AD66EA7D;
 Fri,  9 Jul 2021 19:37:29 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id n33so7001170wms.1;
 Fri, 09 Jul 2021 12:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=tw1A+JHrPrv/3gnkBESDn7Qp8VcHyIj0wUsDYO8CN+w=;
 b=flaPb6wh/4ctiuKlzNXUFDRoLBQthvTaVPvjUDA98ezyeHvb8mOgEntHCsOObIYuYY
 YJCXAa0tHt2a2r6Jk67wuRnkzidEt2O0+e9A+g38S0r35EwPs7tCCJ9e6TvS9FaqCqOR
 nzWQ+ToPxVygZWFHF5FzXy39K0m8WvGyXD+O5X34d1AlHXk0WG3YXuxBuEkZHjUf4D1u
 BS1n3lNfTaYTceDz2hbyCMIuVShjH/PVlKh5BDPZ8RiJjN3c+Hv/j9sMDHw+kzZs6qVG
 Y6epP6FXSE0J8bCHFvZxDzDXPk+Pzi+Jqnd+oLEw1P0xJEL3xT244ropKtwwwBLMSBrV
 RyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tw1A+JHrPrv/3gnkBESDn7Qp8VcHyIj0wUsDYO8CN+w=;
 b=fdq7NQxXUkgjy+tZJ+WPGi33xX2ifRYALFhzQdxjFvGk74Trm7795WjcElUBWoYdDF
 X5PpZj5m4kKIMt6627WNIxeqv7P/YwDR9mVtWLhfgw1DmzktTubRplKNDPebNYhNiK3+
 THc9IeCPXFlFD/AbkLN9MYXyfDUwq10oeuC8vOdROYlbEzsWAuGGr93xhpAW9C579zNY
 ePH3YOP26YxuycQ5wTyGMMRXfJ2Egjk1yaLKXsUAZ1ywQiIrmsHGQ5YU3mAoporKblC3
 ldXXh/Mtd3QFNS+XG2+8lRJQ5h/DFNRZLvoAeVDAgriBmN/EVUArhy2fKuT9dDxu59Ln
 JRvA==
X-Gm-Message-State: AOAM530BxEJQmQyDs7HRS8YtGIuyO5uW6JxaTikW8EnNhGyhPDGORUp1
 mamyusg/W/tTJBNeXg65wn/c6oIGYZI=
X-Google-Smtp-Source: ABdhPJzzjX/P0v4O3bn4/wfzjDycHsxbAmz6YZjgsrXCO6ZtxkSYP7SeSKslGbmVMtciTefPs27SfA==
X-Received: by 2002:a1c:4e0b:: with SMTP id g11mr520163wmh.167.1625859448281; 
 Fri, 09 Jul 2021 12:37:28 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:38e1:8c08:a93f:2590?
 ([2a02:908:1252:fb60:38e1:8c08:a93f:2590])
 by smtp.gmail.com with ESMTPSA id h21sm5369983wmq.38.2021.07.09.12.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 12:37:27 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/ttm: Fix COW check
To: Felix Kuehling <felix.kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210708193621.2198733-1-alexander.deucher@amd.com>
 <20210708193621.2198733-2-alexander.deucher@amd.com>
 <a25f93e7-8c03-542c-f594-64a7c1fba292@gmail.com>
 <2fd0006e-f005-b11c-3918-a9d690a1831a@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <19fbefce-b9c8-8f22-2789-0eee8f58c61a@gmail.com>
Date: Fri, 9 Jul 2021 21:37:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2fd0006e-f005-b11c-3918-a9d690a1831a@amd.com>
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

Am 09.07.21 um 21:31 schrieb Felix Kuehling:
> On 2021-07-09 2:38 a.m., Christian König wrote:
>>
>>
>> Am 08.07.21 um 21:36 schrieb Alex Deucher:
>>> From: Felix Kuehling <Felix.Kuehling@amd.com>
>>>
>>> KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
>>> is_cow_mapping returns true for these mappings. Add a check for
>>> vm_flags & VM_WRITE to avoid mmap failures on private read-only or
>>> PROT_NONE mappings.
>>
>> I'm pretty sure that this is not working as expected.
>
> Not sure what you mean. Debugger access to the memory through the 
> PROT_NONE VMAs is definitely working, with both ptrace and 
> /proc/<pid>/mem.
>
>
>>
>>>
>>> Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>> ---
>>> drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c 
>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> index f56be5bc0861..a75e90c7d4aa 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> @@ -552,7 +552,7 @@ static const struct vm_operations_struct 
>>> ttm_bo_vm_ops = {
>>>   int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct 
>>> ttm_buffer_object *bo)
>>>   {
>>>       /* Enforce no COW since would have really strange behavior 
>>> with it. */
>>> -    if (is_cow_mapping(vma->vm_flags))
>>> +    if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
>>
>> is_cow_mapping() already checks for VM_MAYWRITE, so this here 
>> shouldn't be necessary.
>
> AFAICT, VM_MAYWRITE is not based on the PROT_... bits used to create 
> the VMA, but based on the permissions of the file. So as long as the 
> render node is writable, VM_MAYWRITE is set for all VMAs that map it.
>
> I would agree that it's probably a bad idea for the Thunk to map these 
> VMAs with MAP_PRIVATE. We can try changing the Thunk to use MAP_SHARED 
> for these PROT_NONE mappings. But that doesn't change the fact that 
> this kernel patch broke existing usermode.

Yeah, but see the discussion around MAP_PRIVATE and COW regarding this. 
What Thunk did here was a really bad idea.

I think we have only two options here:
1. Accept the breakage of thunk.
2. Add a workaround in amdgpu/amdkfd to force MAP_PRIVATE into 
MAP_SHARED in the kernel.

Regards,
Christian.

>
> Regards,
>   Felix
>
>
>>
>> Christian.
>>
>>>           return -EINVAL;
>>>         ttm_bo_get(bo);
>>

