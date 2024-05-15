Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5EC8C6545
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 12:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A1010E3CB;
	Wed, 15 May 2024 10:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bp8dnL2W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CD010E3CB;
 Wed, 15 May 2024 10:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZmNwQKhv4AnCurvJXe+GQlN6R4PSbuzS8YLjTbLSgEA=; b=bp8dnL2WdRmCkx8y09cQCvW/nc
 OYbUrtfLvkCzgUfNW4AKmWCDSHjhSaVjsooq2kOG1AWt7VQQEbhZ33vItF0I+BdO1s9WbZdBHiZE3
 2ZtpiTUH1oTBMW7WzJA9I73VVAChXlcL2lz3ITjTJKd0QP5gfYM4enJh0PVkSAS0Vf+YJGlDQOqCU
 Ilh3CuwcbIS3rojcp95UWuHH2lpkP9SuPPk9c+EQCj5vl9dI7uYY9rTPovcFTMi+Hij+kbee1oLTC
 a9rGpwci89Zv+RI1hVt2spHajwYQylvtpdYfoFsnlFJAvRwKk3YeiYM71Ej8B/+M5ISrw7CL4YeyA
 T2LP765Q==;
Received: from [84.69.19.168] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1s7CMM-008MNv-PL; Wed, 15 May 2024 12:59:46 +0200
Message-ID: <1a20c64f-cb1c-4f68-917b-9a8a34741bff@igalia.com>
Date: Wed, 15 May 2024 11:59:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/5] drm/amdgpu: Actually respect buffer migration budget
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Friedrich Vock <friedrich.vock@gmx.de>
References: <20240508180946.96863-1-tursulin@igalia.com>
 <20240508180946.96863-3-tursulin@igalia.com>
 <8a689a5a-b408-41da-b7bd-8c7a3b2f2ac7@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <8a689a5a-b408-41da-b7bd-8c7a3b2f2ac7@amd.com>
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


On 15/05/2024 08:20, Christian König wrote:
> Am 08.05.24 um 20:09 schrieb Tvrtko Ursulin:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Current code appears to live in a misconception that playing with buffer
>> allowed and preferred placements can control the decision on whether
>> backing store migration will be attempted or not.
>>
>> Both from code inspection and from empirical experiments I see that not
>> being true, and that both allowed and preferred placement are typically
>> set to the same bitmask.
> 
> That's not correct for the use case handled here, but see below.

Which part is not correct, that bo->preferred_domains and 
bo->allower_domains are the same bitmask?

>>
>> As such, when the code decides to throttle the migration for a client, it
>> is in fact not achieving anything. Buffers can still be either 
>> migrated or
>> not migrated based on the external (to this function and facility) logic.
>>
>> Fix it by not changing the buffer object placements if the migration
>> budget has been spent.
>>
>> FIXME:
>> Is it still required to call validate is the question..
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Friedrich Vock <friedrich.vock@gmx.de>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index 22708954ae68..d07a1dd7c880 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -784,6 +784,7 @@ static int amdgpu_cs_bo_validate(void *param, 
>> struct amdgpu_bo *bo)
>>           .no_wait_gpu = false,
>>           .resv = bo->tbo.base.resv
>>       };
>> +    bool migration_allowed = true;
>>       struct ttm_resource *old_res;
>>       uint32_t domain;
>>       int r;
>> @@ -805,19 +806,24 @@ static int amdgpu_cs_bo_validate(void *param, 
>> struct amdgpu_bo *bo)
>>                * visible VRAM if we've depleted our allowance to do
>>                * that.
>>                */
>> -            if (p->bytes_moved_vis < p->bytes_moved_vis_threshold)
>> +            if (p->bytes_moved_vis < p->bytes_moved_vis_threshold) {
>>                   domain = bo->preferred_domains;
>> -            else
>> +            } else {
>>                   domain = bo->allowed_domains;
>> +                migration_allowed = false;
>> +            }
>>           } else {
>>               domain = bo->preferred_domains;
>>           }
>>       } else {
>>           domain = bo->allowed_domains;
>> +        migration_allowed = false;
>>       }
>>   retry:
>> -    amdgpu_bo_placement_from_domain(bo, domain);
>> +    if (migration_allowed)
>> +        amdgpu_bo_placement_from_domain(bo, domain);
> 
> That's completely invalid. Calling amdgpu_bo_placement_from_domain() is 
> a mandatory prerequisite for calling ttm_bo_validate();
> 
> E.g. the usually code fow is:
> 
> /* This initializes bo->placement */
> amdgpu_bo_placement_from_domain()
> 
> /* Eventually modify bo->placement to fit special requirements */
> ....
> 
> /* Apply the placement to the BO */
> ttm_bo_validate(&bo->tbo, &bo->placement, &ctx)
> 
> To sum it up bo->placement should be a variable on the stack instead, 
> but we never bothered to clean that up.

I am not clear if you agree or not that the current method of trying to 
avoid migration doesn't really do anything?

On stack placements sounds plausible to force migration avoidance by 
putting a single current object placement in that list, if that is what 
you have in mind? Or a specialized flag/version of 
amdgpu_bo_placement_from_domain with an bool input like 
"allow_placement_change"?

Regards,

Tvrtko

> 
> Regards,
> Christian.
> 
>> +
>>       r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>>       if (unlikely(r == -ENOMEM) && domain != bo->allowed_domains) {
> 
