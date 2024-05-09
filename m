Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA988C0D6C
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 11:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F08010E5C6;
	Thu,  9 May 2024 09:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GcqfAsS1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA58210E5C6;
 Thu,  9 May 2024 09:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YqSBSPXbblCzbepnSg2ca1qS6LP1N7SJ9yy+Kx9xyJs=; b=GcqfAsS1NPijTvtz+DvYU5MRgx
 OgDye838DLan4jPmt8lDRkpWqV6MWShsj9HrjfclEdLt6MtOmE94mY9pxdzttM0Aex7AsaJKdXpcZ
 whoomdLZbdWQqcWfhukDeiVxtREcnlsfd25BkI4lDWgWMYXitU5g2UqKl1F4IZxecuTp4cX+aFD6M
 Eb1/9gA8ZsxCFMNVdciGLVaKPGTfy8kGwC+rgUwSqC617KmxX4SwuIq2gUKdVbD1P46V+nPu0sT0/
 76namRihpbAPWpoKuSZji7U/4SOOuH669Gv6cwyvwrCCoCfHqa2UQtWDtOLOdjuuff2KBtDmtIeDR
 VfyMHdJQ==;
Received: from [84.69.19.168] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1s4zwQ-003jq7-Hv; Thu, 09 May 2024 11:19:54 +0200
Message-ID: <1a2788ef-6969-4f4c-95e9-cf5f2c7e0872@igalia.com>
Date: Thu, 9 May 2024 10:19:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/5] drm/amdgpu: Fix migration rate limiting accounting
Content-Language: en-GB
To: Friedrich Vock <friedrich.vock@gmx.de>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
References: <20240508180946.96863-1-tursulin@igalia.com>
 <20240508180946.96863-2-tursulin@igalia.com>
 <146d615c-6eb1-491a-9494-cacb9337f13e@gmx.de>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <146d615c-6eb1-491a-9494-cacb9337f13e@gmx.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/05/2024 20:08, Friedrich Vock wrote:
> On 08.05.24 20:09, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> The logic assumed any migration attempt worked and therefore would over-
>> account the amount of data migrated during buffer re-validation. As a
>> consequence client can be unfairly penalised by incorrectly considering
>> its migration budget spent.
> 
> If the migration failed but data was still moved (which I think could be
> the case when we try evicting everything but it still doesn't work?),
> shouldn't the eviction movements count towards the ratelimit too?

Possibly, which path would that be?

I mean there are definitely more migration which *should not* be counted 
which I think your mini-series approaches more accurately. What this 
patch achieves, in its current RFC form, is reduces the "false-positive" 
migration budget depletions.

So larger improvements aside, point of the series was to illustrate that 
even the things which were said to be working do not seem to. See cover 
letter to see what I thought does not work either well or at all.
>> Fix it by looking at the before and after buffer object backing store and
>> only account if there was a change.
>>
>> FIXME:
>> I think this needs a better solution to account for migrations between
>> VRAM visible and non-visible portions.
> 
> FWIW, I have some WIP patches (not posted on any MLs yet though) that
> attempt to solve this issue (+actually enforcing ratelimits) by moving
> the ratelimit accounting/enforcement to TTM entirely.
> 
> By moving the accounting to TTM we can count moved bytes when we move
> them, and don't have to rely on comparing resources to determine whether
> moving actually happened. This should address your FIXME as well.

Yep, I've seen them. They are not necessarily conflicting with this 
series, potentialy TTM placement flag aside. *If* something like this 
can be kept small and still manage to fix up a few simple things which 
do not appear to work at all at the moment.

For the larger re-work it is quite, well, large and it is not easy to be 
certain the end result would work as expected. IMO it would be best to 
sketch out a larger series which brings some practical and masurable 
change in behaviour before commiting to merge things piecemeal.

For instance I have a niggling feeling the runtime games driver plays 
with placements and domains are not great and wonder if things could be 
cleaner if simplified by letting TTM manage things more, more 
explicitly, and having the list of placements more static. Thinking 
about it seems a step too far for now though.

Regards,

Tvrtko

> 
> Regards,
> Friedrich
> 
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Friedrich Vock <friedrich.vock@gmx.de>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 26 +++++++++++++++++++++-----
>>   1 file changed, 21 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index ec888fc6ead8..22708954ae68 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -784,12 +784,15 @@ static int amdgpu_cs_bo_validate(void *param, 
>> struct amdgpu_bo *bo)
>>           .no_wait_gpu = false,
>>           .resv = bo->tbo.base.resv
>>       };
>> +    struct ttm_resource *old_res;
>>       uint32_t domain;
>>       int r;
>>
>>       if (bo->tbo.pin_count)
>>           return 0;
>>
>> +    old_res = bo->tbo.resource;
>> +
>>       /* Don't move this buffer if we have depleted our allowance
>>        * to move it. Don't move anything if the threshold is zero.
>>        */
>> @@ -817,16 +820,29 @@ static int amdgpu_cs_bo_validate(void *param, 
>> struct amdgpu_bo *bo)
>>       amdgpu_bo_placement_from_domain(bo, domain);
>>       r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>>
>> -    p->bytes_moved += ctx.bytes_moved;
>> -    if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
>> -        amdgpu_res_cpu_visible(adev, bo->tbo.resource))
>> -        p->bytes_moved_vis += ctx.bytes_moved;
>> -
>>       if (unlikely(r == -ENOMEM) && domain != bo->allowed_domains) {
>>           domain = bo->allowed_domains;
>>           goto retry;
>>       }
>>
>> +    if (!r) {
>> +        struct ttm_resource *new_res = bo->tbo.resource;
>> +        bool moved = true;
>> +
>> +        if (old_res == new_res)
>> +            moved = false;
>> +        else if (old_res && new_res &&
>> +             old_res->mem_type == new_res->mem_type)
>> +            moved = false;
>> +
>> +        if (moved) {
>> +            p->bytes_moved += ctx.bytes_moved;
>> +            if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
>> +                amdgpu_res_cpu_visible(adev, bo->tbo.resource))
>> +                p->bytes_moved_vis += ctx.bytes_moved;
>> +        }
>> +    }
>> +
>>       return r;
>>   }
>>
