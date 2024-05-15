Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5782F8C652B
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 12:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1002410E1D7;
	Wed, 15 May 2024 10:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ASaeNiPJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7977010E1D7;
 Wed, 15 May 2024 10:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=afyRjjNtw9jxSwdK+Df7I36gEqpjCVcr6W5AdX6qZ/M=; b=ASaeNiPJcFsifjNMaVFurZb86j
 F8oWeQtWieRCjYpKLoX1GlT6sLpfzXRO1hS8lljzrgXajMz66AJeurxde9I+TG9ZVnf8Od96C8anP
 hXGbmIFaLi5FvPdIH1o++0fYnP7rqcVnuaoRXq1wAdmRPCrn6IPxUsO+lPanHLKqM2Jfen9k7tNMQ
 G2Kh14ltGToMyF+QZ096E2q1C3P/jc46OhO6+X+VhJlj1Z/XN/Qs0yVxFC77VWFPrmnIrcb5Fuq0x
 jaUOIO4MK+QuwPSWFICCn44+3/SW/TpJFL8RKU37omn2/v5ROGc1YFDv4mhd3p/d602SBpSex8Nja
 4Pu9p0xw==;
Received: from [84.69.19.168] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1s7CEg-008MDu-3Y; Wed, 15 May 2024 12:51:50 +0200
Message-ID: <e8c4f4d6-8a49-40d4-97fc-36e6db4e7dd9@igalia.com>
Date: Wed, 15 May 2024 11:51:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/5] drm/amdgpu: Fix migration rate limiting accounting
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Friedrich Vock <friedrich.vock@gmx.de>
References: <20240508180946.96863-1-tursulin@igalia.com>
 <20240508180946.96863-2-tursulin@igalia.com>
 <67c227c1-2c00-49fd-a454-ab60de7a5b96@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <67c227c1-2c00-49fd-a454-ab60de7a5b96@amd.com>
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



On 15/05/2024 08:14, Christian König wrote:
> Am 08.05.24 um 20:09 schrieb Tvrtko Ursulin:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> The logic assumed any migration attempt worked and therefore would over-
>> account the amount of data migrated during buffer re-validation. As a
>> consequence client can be unfairly penalised by incorrectly considering
>> its migration budget spent.
>>
>> Fix it by looking at the before and after buffer object backing store and
>> only account if there was a change.
>>
>> FIXME:
>> I think this needs a better solution to account for migrations between
>> VRAM visible and non-visible portions.
>>
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
>>       if (bo->tbo.pin_count)
>>           return 0;
>> +    old_res = bo->tbo.resource;
>> +
>>       /* Don't move this buffer if we have depleted our allowance
>>        * to move it. Don't move anything if the threshold is zero.
>>        */
>> @@ -817,16 +820,29 @@ static int amdgpu_cs_bo_validate(void *param, 
>> struct amdgpu_bo *bo)
>>       amdgpu_bo_placement_from_domain(bo, domain);
>>       r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>> -    p->bytes_moved += ctx.bytes_moved;
>> -    if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
>> -        amdgpu_res_cpu_visible(adev, bo->tbo.resource))
>> -        p->bytes_moved_vis += ctx.bytes_moved;
>> -
>>       if (unlikely(r == -ENOMEM) && domain != bo->allowed_domains) {
>>           domain = bo->allowed_domains;
>>           goto retry;
>>       }
>> +    if (!r) {
>> +        struct ttm_resource *new_res = bo->tbo.resource;
>> +        bool moved = true;
>> +
>> +        if (old_res == new_res)
>> +            moved = false;
>> +        else if (old_res && new_res &&
>> +             old_res->mem_type == new_res->mem_type)
>> +            moved = false;
> 
> The old resource might already be destroyed after you return from 
> validation. So this here won't work.
> 
> Apart from that even when a migration attempt fails the moved bytes 
> should be accounted.
> 
> When the validation attempt doesn't caused any moves then the bytecount 
> here would be zero.
> 
> So as far as I can see that is as fair as you can get.

Right, I think I suffered a bit of tunnel vision here and completely 
ignore the _ctx_.moved_bytes part. Scratch this one too then.

Regards,

Tvrtko

> 
> Regards,
> Christian.
> 
> PS: Looks like our mail servers are once more not very reliable.
> 
> If you get mails from me multiple times please just ignore it.
> 
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
> 
