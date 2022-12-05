Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D122642999
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 14:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40B010E22A;
	Mon,  5 Dec 2022 13:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A9F10E223;
 Mon,  5 Dec 2022 13:41:07 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id y16so18650944wrm.2;
 Mon, 05 Dec 2022 05:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fE4lMQQ090KmPjanKoQ75JrjLoy64NK7MppP1jX30FQ=;
 b=e1vl3bbKWX9GL1wnmH/INR76R8wQjSAWlZztJ9goEoHCs4qrQmwJpahpJsr127Lu3w
 zJdX9hP4ijQ8Q2LmiASWe518f6NMEFusqrtStstRHhdgLGRgfXoVLSoydWvfOD5KZZmm
 PbLtS7qu34Do9VRPvnv3HGtNrgOcaElC/4oQ1OntCJcKvJ2UTDt6hIxtLLCqjGry4CVo
 PyUQBXGpIp3p90UcbTWInl4Y6cjoACoCIKGtuBgoFA5me8Aog/Ls1Y92ke2MrpTRP9uG
 obxcw/5LkzI5SB6EGGTCnkUiI9eIWRh5nprYtHz6aqJFZeugKOULPDbjwHBodXviDamG
 NfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fE4lMQQ090KmPjanKoQ75JrjLoy64NK7MppP1jX30FQ=;
 b=WisXb4h7szsHlglmVcO7QIjuI+W/hqkzHhpWZsHOAWh4TOjFID/OK7BnXiAzBoELKe
 rvZSOPWWz+/2az8KhFPNQMGrXMlFhxL6/FwQBaulNWly6AshYw+isdiEek4004xP/rzk
 Yj7Qi5Mpniog0gRQnLSgQMCMdZ/lmYrKdWqXNeLL70mlMzgMmaKDBSusIUiRI8iE0xYE
 LlRQ4Vaf4apPFyTX0NgaWHB+j0hBFvkSsNNS7zoabySDwc0yg7SN4apHO6QS6EjtPGf6
 2+n6qIgY5yU7aQaEVCWeuWmNxJKo0p7dJXcbyyJOq2P5eGwflE9zufw+6DZv5lc4/M4X
 JEJQ==
X-Gm-Message-State: ANoB5plIZ/SMoorVyp71kmMTtMXrZ9RKxbznjHVpyCySnjHZADaJm9pb
 +XaCwIq2kYXZzm9mjxsGXSE=
X-Google-Smtp-Source: AA0mqf453ftm/ynNui+GhaPEKjrTQOS6NHU4gZQb15pmX1jpvh6hx2U9GhS/Oi56a2WLjdLV265GGg==
X-Received: by 2002:adf:f752:0:b0:242:3afe:a9b4 with SMTP id
 z18-20020adff752000000b002423afea9b4mr11017264wrp.579.1670247666228; 
 Mon, 05 Dec 2022 05:41:06 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:2deb:ad55:c010:ff66?
 ([2a02:908:1256:79a0:2deb:ad55:c010:ff66])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c305300b003cf6a55d8e8sm16684987wmh.7.2022.12.05.05.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 05:41:05 -0800 (PST)
Message-ID: <d7df935b-6c8b-e5ae-0da3-76c107ce9dd6@gmail.com>
Date: Mon, 5 Dec 2022 14:41:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/9] drm/amdgpu: generally allow over-commit during BO
 allocation
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <CADnq5_NFXJCOD7bLS7Ax5W09To_J6bBfCj4_+1tDP5r9kFxnvQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CADnq5_NFXJCOD7bLS7Ax5W09To_J6bBfCj4_+1tDP5r9kFxnvQ@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.11.22 um 19:18 schrieb Alex Deucher:
> On Fri, Nov 25, 2022 at 5:21 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> We already fallback to a dummy BO with no backing store when we
>> allocate GDS,GWS and OA resources and to GTT when we allocate VRAM.
>>
>> Drop all those workarounds and generalize this for GTT as well. This
>> fixes ENOMEM issues with runaway applications which try to allocate/free
>> GTT in a loop and are otherwise only limited by the CPU speed.
>>
>> The CS will wait for the cleanup of freed up BOs to satisfy the
>> various domain specific limits and so effectively throttle those
>> buggy applications down to a sane allocation behavior again.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> This looks like a good bug fix and unrelated to the rest of this series.
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Yeah, this was just in the tree because I tried to address some bug report.

The TTM changes mitigated the bugs, but this patch here is the real 
underlying fix.

I've cherry picked it over to amd-staging-drm-next and pushed it.

Thanks,
Christian.

>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 16 +++-------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  6 +-----
>>   2 files changed, 4 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index a0780a4e3e61..62e98f1ad770 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -113,7 +113,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
>>          bp.resv = resv;
>>          bp.preferred_domain = initial_domain;
>>          bp.flags = flags;
>> -       bp.domain = initial_domain;
>> +       bp.domain = initial_domain | AMDGPU_GEM_DOMAIN_CPU;
>>          bp.bo_ptr_size = sizeof(struct amdgpu_bo);
>>
>>          r = amdgpu_bo_create_user(adev, &bp, &ubo);
>> @@ -332,20 +332,10 @@ int amdgpu_gem_create_ioctl(struct drm_device *dev, void *data,
>>          }
>>
>>          initial_domain = (u32)(0xffffffff & args->in.domains);
>> -retry:
>>          r = amdgpu_gem_object_create(adev, size, args->in.alignment,
>> -                                    initial_domain,
>> -                                    flags, ttm_bo_type_device, resv, &gobj);
>> +                                    initial_domain, flags, ttm_bo_type_device,
>> +                                    resv, &gobj);
>>          if (r && r != -ERESTARTSYS) {
>> -               if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
>> -                       flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
>> -                       goto retry;
>> -               }
>> -
>> -               if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
>> -                       initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
>> -                       goto retry;
>> -               }
>>                  DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu, %d)\n",
>>                                  size, initial_domain, args->in.alignment, r);
>>          }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 974e85d8b6cc..919bbea2e3ac 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -581,11 +581,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>                  bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>>
>>          bo->tbo.bdev = &adev->mman.bdev;
>> -       if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
>> -                         AMDGPU_GEM_DOMAIN_GDS))
>> -               amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_CPU);
>> -       else
>> -               amdgpu_bo_placement_from_domain(bo, bp->domain);
>> +       amdgpu_bo_placement_from_domain(bo, bp->domain);
>>          if (bp->type == ttm_bo_type_kernel)
>>                  bo->tbo.priority = 1;
>>
>> --
>> 2.34.1
>>

